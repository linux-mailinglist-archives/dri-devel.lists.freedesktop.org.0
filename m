Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DE8AE83E5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5C10E714;
	Wed, 25 Jun 2025 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zggbwkhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E06610E714;
 Wed, 25 Jun 2025 13:10:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E946840C38;
 Wed, 25 Jun 2025 13:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE60C4CEEA;
 Wed, 25 Jun 2025 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857050;
 bh=4+f7GA/otNyWhQwFzv3cN+bRXvAY+QsCJlqjXa4WCbQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Zggbwkhl/imWx1II153ZRhSuyRKcNYTOUYKDyZ89WIP/rDVulNHf3oUs3OJ5IfI8g
 QPkRedXzK6JnoIzuGfJAs0DMeozBZdMpTLa/itFkX7TonHS39cR7pc8gypj/Z588Dy
 abgD8ubRSGGgQr6acWXJpfwxSx9TZhye2dNttKpBF2iQC1ARVP90/YtFpH1gmWz2OK
 ZpNwVnzaLU20uw6u7I7ZwKGHDSWI2rV7E9qBDsCMHSu63T2O+FqohnOTE3/rjCLs9o
 UdRvkkEgdN6IPQHD5lAUv0Bc6gAYj/8IxFUquAWVeyWnFDghkL2ZgCyhaQf3AbQPpa
 X0eobgrixNDJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:15 +0200
Subject: [PATCH v5 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-7-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=2107;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gbQdqtBOeisek0R+EbShz3Z9yw3aoUL/2+EsNsZHbj0=;
 b=/+o6wlnyMk5hrp+/vadcqkO8sHq+NbuPMHdUmYnHhEk3cMwl55Puusn+FBrovmHN0hUq/JAdy
 njmm6QCaOECDslOrFNm77gsXgieQEjbtBSxI9zb3WcfiCKaJfPsI0pk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This bit is set iff the UBWC version is 1.0. That notably does not
include QCM2290's "no UBWC".

This commit is intentionally cross-subsystem to ease review, as the
patchset is intended to be merged together, with a maintainer
consensus.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3d9c98e56d92ed43cf6e702fbd2b5cbd3293ac5a..3d345844337608086ffec1998b47b315ada68a97 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -686,11 +686,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index b92fc402638bae85e4e9da2552be56ac9ea9b448..5dc41aafa0afe1fe7f66ae6f8815989663ced780 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -62,4 +62,14 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 }
 #endif
 
+static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
+
+	if (ret && !(cfg->ubwc_swizzle & BIT(0)))
+		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
+
+	return ret;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.50.0

