Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA0A560C4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD1E10EAF3;
	Fri,  7 Mar 2025 06:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tvcUzVA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A5210E7FB;
 Fri,  7 Mar 2025 06:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 928FCA45510;
 Fri,  7 Mar 2025 06:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8698CC4CEE3;
 Fri,  7 Mar 2025 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328701;
 bh=KIrLiVVV+Sg6qS5vZTvod7Ag60TPe5TFBv3IR6bpDp0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tvcUzVA2JwK+BWrilnd687P+qeZ3WOf5gBcYovkkwo/YPYBug9hUqS/Y7GnIcqTuK
 X8+UKuS4X8l35qfPCTZZ74Ip2OqtKXsbNULqbNCuHW8NguWe4Jd6YnZ+Iu3S08Qf3h
 uTT1dUKR3Sb2IFo11fmLpwXBzd23FMWo60/4K2jA3bFglYrAWmh7EDEtIvEF7Ygs7Z
 3Im8P8iXpTSbDWkdsgsXXgbEeSRbmS5AfCWvt/3ngk1/D+HIj46oOv9l+okBGZ0MmW
 6bQl6oOJx/oxNvzTTkHi33EmfF/P81p5KNTxjTzCtKHVgX7Op1RAofhWnCymugTrik
 hfgP0SNXu+UFw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:50 +0200
Subject: [PATCH v3 2/8] drm/msm/dpu: program master INTF value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-2-5d20655f10ca@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dsl/X85JqKMZkF2z4Sv0M7PrYvyUxVb/hggIB5gpXcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE078sE/9nDleFsg2P+nLw45LzbbxfzZgU2a
 QyPZSFBQnKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1enqB/9OeHWTOscaVgJ9CA+NyrsxvNeH+TJ9+iXiCKIS9IMQmn/evjMsHeQ07iZk+9ZgSNo++Qg
 9sv2esq9PAow9R/jvh2uTJncKsusILEy+JZ2UNSQaee6BFP133WxCtyYjnmSVsS9mMEWwFQ0hZc
 38R47AEx37GBlVA/nYZqxEBC2RyJLlZrw8ph91FZsqrsPuQ0PuiOn+YbDBDrVDQ4Medfeknd6t5
 852aFO0bgLmMmVr3OKIGVJpPS21Ny09Cc5hdHBo+57okip/4m4ZLJduyzh1x6/rskXpgwFFKwox
 Bmb8lSJZLHEa6HtdJsOjcw1c3mnZEXlPycpVOYrsEAg2Np7v
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

If several interfaces are being handled through a single CTL, a main
('master') INTF needs to be programmed into a separate register. Write
corresponding value into that register.

Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index cef3bfaa4af82ebc55fb8cf76adef3075c7d73e3..21f4d403e3c278d83d7eaa6a7dd53f471d9e296d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -603,6 +603,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
+	if (cfg->intf_master)
+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
+
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
 }
@@ -645,6 +648,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 intf_master = 0;
 	u32 wb_active = 0;
 	u32 cwb_active = 0;
 	u32 merge3d_active = 0;
@@ -672,6 +676,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+
+		intf_master = DPU_REG_READ(c, CTL_INTF_MASTER);
+
+		/* Unset this intf as master, if it is the current master */
+		if (intf_master == BIT(cfg->intf - INTF_0)) {
+			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);
+			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
+		}
 	}
 
 	if (cfg->cwb) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 080a9550a0cc6530b4115165dd737857b6213d15..cea23436fc80a17a679363a47f9f287b72623a1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
 /**
  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
  * @intf :                 Interface id
+ * @intf_master:           Master interface id in the dual pipe topology
  * @mode_3d:               3d mux configuration
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
@@ -46,6 +47,7 @@ struct dpu_hw_stage_cfg {
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
+	enum dpu_intf intf_master;
 	enum dpu_wb wb;
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;

-- 
2.39.5

