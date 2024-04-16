Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597568A7976
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 01:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4A410F307;
	Tue, 16 Apr 2024 23:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA08112F37
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 23:57:53 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EB4833F0E3;
 Wed, 17 Apr 2024 01:57:50 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 17 Apr 2024 01:57:47 +0200
Subject: [PATCH 7/7] drm/msm/dpu: Rename `ctx` parameter to `intf` to match
 other functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-7-78ae3ee9a697@somainline.org>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
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

All other functions in dpu_hw_intf name the "self" parameter `intf`,
except dpu_hw_intf_setup_timing_engine() and the recently added
dpu_hw_intf_program_intf_cmd_cfg().  Clean that up for consistency.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 965692ef7892..34d0c4e04d27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -96,11 +96,11 @@
 #define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
 
 
-static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
+static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
 		const struct dpu_format *fmt)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
 	u32 display_v_start, display_v_end;
 	u32 hsync_start_x, hsync_end_x;
@@ -118,7 +118,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	/* read interface_cfg */
 	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
 
-	if (ctx->cap->type == INTF_DP)
+	if (intf->cap->type == INTF_DP)
 		dp_intf = true;
 
 	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
@@ -223,7 +223,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except
@@ -518,10 +518,10 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
 
 }
 
-static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
+static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *intf,
 					     struct dpu_hw_intf_cmd_mode_cfg *cmd_mode_cfg)
 {
-	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
+	u32 intf_cfg2 = DPU_REG_READ(&intf->hw, INTF_CONFIG2);
 
 	if (cmd_mode_cfg->data_compress)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
@@ -529,7 +529,7 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
 	if (cmd_mode_cfg->wide_bus_en)
 		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
-	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
+	DPU_REG_WRITE(&intf->hw, INTF_CONFIG2, intf_cfg2);
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,

-- 
2.44.0

