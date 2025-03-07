Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD46A560C6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE56F10EAF0;
	Fri,  7 Mar 2025 06:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lKwON5Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073EC10EAF5;
 Fri,  7 Mar 2025 06:25:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C813A45514;
 Fri,  7 Mar 2025 06:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93494C4CEE7;
 Fri,  7 Mar 2025 06:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328712;
 bh=30On3d5z9c7bEW+Jp6hfeeg7eAol/IGoxnRwM2bEwe8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lKwON5Y0l+RFR8bYlgLE6mPWgriikbF+a2Io9n36Y1MrSsm34F3WeoIcicGlt8FmP
 nY10XYRQoQ2aj+JR3f1T6PQuz501Ko7p10QQOgagt6dTGxsV50d25pdh7NNJc8GMj/
 afdbXNo8wNLJ9iYDkrLSQu19WNtkcNyJm5hP7zFubc8KIZGmih/RywH4ukXE8/HYm/
 hrzh7nEeUGos/+PXNrbw++RboAlqM0lIRkroyKLbLGO5gTPxFqyoLIjHz4CbTPT7SR
 CQlV1zOM14ig6VYIsg4pczA+urDjeCRGmUGKplZNPMAclEJnxWuyTF3B4WrAiVZ6u0
 1S2Fehb9IzQPg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:54 +0200
Subject: [PATCH v3 6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-6-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3290;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OcVS3lgJG8lSNT5l5m2L+flDSASDEsF+r9Mkn+fiERw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE1wNg0NsImSYP+K3Zv63eaYTzZlLKOEZ/jr
 JrqdHNVdOGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNQAKCRCLPIo+Aiko
 1awTB/0el7mooY5xew2j6HooSoYuXrWZbMHtfz74nJCN+D8wHTiOHQcu7ln+b/umqDOS+vbBKXV
 ZtArYZQAo6zEGzKtYUtwemU+1OYO7yRYp0nYCXV6MzLxW39jkXcuqcdxTxNU6rk6Q8dK9x5t3GG
 4Taj/eqXTFEoJyiaKcpwsfc2L2W0LVDerUWaD7zQ6dEtJfJ/dZ404hpEc+KvKs4sS5j8rEQn9JH
 aZxgk/RfH8lRfsMWu3d4njc1x8DIT/aZ/ByHgVdtLdqUuHVLpyQosqUhl2lUzh6MD+w2ELgQrFr
 y3A/2ST2wcFrfjtwNz2ahoOF3PzAj1N3icwxdX0OHHFMGbo+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Unlike previous generation, since DPU 5.0 it is possible to use just one
CTL to handle all INTF and WB blocks for a single output. And one has to
use single CTL to support bonded DSI config. Allocate single CTL for
these DPU versions.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 28 +++++++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 3efbba425ca6e037cb9646981ebb0f0354ffea8e..c72b968d58a65960605456e752278def2a21df7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
 	/* Clear, setup lists */
 	memset(rm, 0, sizeof(*rm));
 
+	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
+
 	/* Interrogate HW catalog and create tracking items for hw blocks */
 	for (i = 0; i < cat->mixer_count; i++) {
 		struct dpu_hw_mixer *hw;
@@ -434,20 +436,19 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/*
-	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
-	 * control path.
-	 *
-	 * Hardcode num_ctls to 1 if CWB is enabled because in CWB, both the
-	 * writeback and real-time encoders must be driven by the same control
-	 * path
-	 */
-	if (top->cwb_enabled)
-		num_ctls = 1;
-	else
+	if (rm->has_legacy_ctls) {
+		/*
+		 * TODO: check if there is a need for special handling if
+		 * DPU < 5.0 get CWB support.
+		 */
 		num_ctls = top->num_intf;
 
-	needs_split_display = _dpu_rm_needs_split_display(top);
+		needs_split_display = _dpu_rm_needs_split_display(top);
+	} else {
+		/* use single CTL */
+		num_ctls = 1;
+		needs_split_display = false;
+	}
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
@@ -465,7 +466,8 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (needs_split_display != has_split_display)
+		if (rm->has_legacy_ctls &&
+		    needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index a19dbdb1b6f48ad708f0d512c2460d092856f52f..aa62966056d489d9c94c61f24051a2f3e7b7ed89 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -24,6 +24,7 @@ struct dpu_global_state;
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
  * @cdm_blk: cdm hardware resource
+ * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -37,6 +38,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *cdm_blk;
+	bool has_legacy_ctls;
 };
 
 struct dpu_rm_sspp_requirements {

-- 
2.39.5

