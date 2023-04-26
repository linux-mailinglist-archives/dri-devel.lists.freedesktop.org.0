Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A96EFD7B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B5610E35A;
	Wed, 26 Apr 2023 22:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D0410EA4C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 22:37:34 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 50AC42012C;
 Thu, 27 Apr 2023 00:37:32 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Apr 2023 00:37:34 +0200
Subject: [PATCH v4 20/22] drm/msm/dpu: Merge setup_- and enable_tearcheck
 pingpong callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v4-20-27ce1a5ab5c6@somainline.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are always called consecutively and are best bundled
together for simplicity, especially when the same structure of callbacks
will be replicated later on the interface block for INTF TE support.
The enable_tearcheck(false) case is now replaced with a more obvious
disable_tearcheck(), encapsulating the original register write with 0.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 10 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c      | 10 ++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h      | 11 +++++------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a60fb8d3736b5..1df3745224f5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -327,8 +327,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 
 	DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
 
-	if (!phys_enc->hw_pp->ops.setup_tearcheck ||
-		!phys_enc->hw_pp->ops.enable_tearcheck) {
+	if (!phys_enc->hw_pp->ops.enable_tearcheck) {
 		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
 		return;
 	}
@@ -383,8 +382,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.sync_cfg_height,
 		tc_cfg.sync_threshold_start, tc_cfg.sync_threshold_continue);
 
-	phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
-	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);
+	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, &tc_cfg);
 }
 
 static void _dpu_encoder_phys_cmd_pingpong_config(
@@ -511,8 +509,8 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
-	if (phys_enc->hw_pp->ops.enable_tearcheck)
-		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
+	if (phys_enc->hw_pp->ops.disable_tearcheck)
+		phys_enc->hw_pp->ops.disable_tearcheck(phys_enc->hw_pp);
 
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 4a20a5841f223..a5582425bfbba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -91,7 +91,7 @@ static void dpu_hw_pp_setup_dither(struct dpu_hw_pingpong *pp,
 	DPU_REG_WRITE(c, base + PP_DITHER_EN, 1);
 }
 
-static int dpu_hw_pp_setup_te_config(struct dpu_hw_pingpong *pp,
+static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp,
 		struct dpu_hw_tear_check *te)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -118,6 +118,8 @@ static int dpu_hw_pp_setup_te_config(struct dpu_hw_pingpong *pp,
 	DPU_REG_WRITE(c, PP_SYNC_WRCOUNT,
 			(te->start_pos + te->sync_threshold_start + 1));
 
+	DPU_REG_WRITE(c, PP_TEAR_CHECK_EN, 1);
+
 	return 0;
 }
 
@@ -144,7 +146,7 @@ static bool dpu_hw_pp_get_autorefresh_config(struct dpu_hw_pingpong *pp,
 	return !!((val & BIT(31)) >> 31);
 }
 
-static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
+static int dpu_hw_pp_disable_te(struct dpu_hw_pingpong *pp)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -152,7 +154,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
 		return -EINVAL;
 	c = &pp->hw;
 
-	DPU_REG_WRITE(c, PP_TEAR_CHECK_EN, enable);
+	DPU_REG_WRITE(c, PP_TEAR_CHECK_EN, 0);
 	return 0;
 }
 
@@ -301,8 +303,8 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 				unsigned long features)
 {
 	if (test_bit(DPU_PINGPONG_TE, &features)) {
-		c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
 		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
+		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
 		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
 		c->ops.get_line_count = dpu_hw_pp_get_line_count;
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 78db18dbda2b1..eb426c840ce34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -37,8 +37,8 @@ struct dpu_hw_dither_cfg {
  *
  * struct dpu_hw_pingpong_ops : Interface to the pingpong Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
- *  @setup_tearcheck : program tear check values
- *  @enable_tearcheck : enables tear check
+ *  @enable_tearcheck: program and enable tear check block
+ *  @disable_tearcheck: disable able tear check block
  *  @setup_dither : function to program the dither hw block
  *  @get_line_count: obtain current vertical line counter
  */
@@ -47,14 +47,13 @@ struct dpu_hw_pingpong_ops {
 	 * enables vysnc generation and sets up init value of
 	 * read pointer and programs the tear check cofiguration
 	 */
-	int (*setup_tearcheck)(struct dpu_hw_pingpong *pp,
+	int (*enable_tearcheck)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_tear_check *cfg);
 
 	/**
-	 * enables tear check block
+	 * disables tear check block
 	 */
-	int (*enable_tearcheck)(struct dpu_hw_pingpong *pp,
-			bool enable);
+	int (*disable_tearcheck)(struct dpu_hw_pingpong *pp);
 
 	/**
 	 * read, modify, write to either set or clear listening to external TE

-- 
2.40.1

