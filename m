Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABFABEE2AA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 12:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4F410E1BF;
	Sun, 19 Oct 2025 10:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I7T12PEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAC089FEA;
 Sun, 19 Oct 2025 10:06:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7964C4062C;
 Sun, 19 Oct 2025 10:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B816C4CEE7;
 Sun, 19 Oct 2025 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760868397;
 bh=XQQgofJudbriAeCJs0tZgb1MfSx1gi2mWWsOK6rlBek=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=I7T12PEc583v9tT9+U1j/s/Fp7xV18BWGRl8Pt/twrFFS/Rd9ptAbfBVp30yfJ8pn
 ttTW22XhLR9cTBv1IYEYJKMILT3YZbMdvlI/1SpXvCNA+engLgvG4tWpNEBMUxYDHI
 DrvleTx8gcTx+gZ7kv5fY0IIzDXOrWn78qI0BD4yrTQWBnd/qFzv6UGHKkCSn2//jL
 JpJJKoSy+l8+w5/yQiFB4WEaluQJ5dWK6xZSJcVNTnc2ObNGCKN2r+I2zvW75F9qjY
 +cYRise34g9bPTixqsR2JqD448r/XCOflA5tMh+mCRo3AGC0PXYynXaN/Z7oLtFEZt
 CWavVkwRWIX8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3C216CCD184;
 Sun, 19 Oct 2025 10:06:37 +0000 (UTC)
From: Federico Amedeo Izzo via B4 Relay <devnull+federico.izzo.pro@kernel.org>
Date: Sun, 19 Oct 2025 12:06:32 +0200
Subject: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
X-B4-Tracking: v=1; b=H4sIACe49GgC/3XNQQ6CMBCF4auQrh3TFrHgynsYF9AZYTa2abVRC
 He3kJiwYfm/ZL6ZRKTAFMWlmESgxJHdM0d5KIQd2mdPwJhbaKkrJZUB9G9oEQGj99BbwMCJAtg
 KlZV1R8ZIkY99oAd/Vvh2zz1wfLnwXf8ktax/st4jkwIFhLI8N1qddKWvPI7u6IMTi5j0Vml2F
 Z2VUtradqaxnTIbZZ7nH0h6BOEBAQAA
X-Change-ID: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 nicola@corna.info, David Heidelberg <david@ixit.cz>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760868393; l=13130;
 i=federico@izzo.pro; s=20251017; h=from:subject:message-id;
 bh=sGyLQADlCgm+S2ot+5F46BMiy9lWRv+mg/a7BnD79xM=;
 b=ex//RqaFYyymVQ+b3MpmlkTkJj+sDAmDZcfor7VDvw84VMgCZvKjyGC6bBAOZVH+DrfoF+YwX
 +4PNpal81cDDxlPXSLygrPA4ovcAYnXkB0LBpT38Gymh9OzewAhDuvc
X-Developer-Key: i=federico@izzo.pro; a=ed25519;
 pk=XfmNfpH48k8jLbId5NKrp0yoKoFb/uLjr97qIxBImBw=
X-Endpoint-Received: by B4 Relay for federico@izzo.pro/20251017 with
 auth_id=544
X-Original-From: Federico Amedeo Izzo <federico@izzo.pro>
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
Reply-To: federico@izzo.pro
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Federico Amedeo Izzo <federico@izzo.pro>

Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
Expose the GAMMA_LUT DRM property, which is needed to enable
night light and basic screen color calibration.

I used LineageOS downstream kernel as a reference and found the LUT
format by trial-and-error on OnePlus 6.

Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
(msm8953-mainline 6.12/main).

Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
Tested-by: Guido Günther <agx@sigxcpu.org> # on sdm845-shift-axolotl
Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
---
DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
DPU for CRTC. This is needed in userspace to enable features like Night
Light or basic color calibration.

I wrote this driver to enable Night Light on OnePlus 6, and after the
driver was working I found out it applies to the 29 different Qualcomm SoCs
that use the DPU display engine, including X1E for laptops.

I used the LineageOS downstream kernel as reference and found the correct 
LUT format by trial-and-error on OnePlus 6.

This was my first Linux driver and it's been a great learning
experience.

The patch was reviewed by postmarketOS contributors here: 
https://gitlab.com/sdm845-mainline/linux/-/merge_requests/137
During review the patch was tested successfully on hamoa (X1E).
---
Changes in v3:
- Remove memset() after kzalloc() in dpu_crtc.c
- Simplify error messages in dpu_crtc.c and dpu_hw_dspp.c
- Use 0 for DPU_REG_WRITE() instead of reg = 0 in dpu_hw_dspp.c
- Link to v2: https://lore.kernel.org/r/20251019-dpu-add-dspp-gc-driver-v2-1-30c8cb79cb17@izzo.pro

Changes in v2:
- Fix gc register .len and .version in dpu_hw_catalog.c
- Apply coding style suggestions
- Link to v1: https://lore.kernel.org/r/20251018-dpu-add-dspp-gc-driver-v1-1-ed0369214252@izzo.pro
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 86 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 54 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 26 ++++++++
 6 files changed, 163 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4b970a59deaf..94445144971e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -812,12 +812,42 @@ static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
 	cfg->b.b = CONVERT_S3_15(ctm->matrix[8]);
 }
 
+static void _dpu_crtc_get_gc_lut(struct drm_crtc_state *state,
+		struct dpu_hw_gc_lut *gc_lut)
+{
+	struct drm_color_lut *lut;
+	int i;
+	u32 val_even, val_odd;
+
+	lut = (struct drm_color_lut *)state->gamma_lut->data;
+
+	if (!lut)
+		return;
+
+	/* Pack 1024 10-bit entries in 512 32-bit registers */
+	for (i = 0; i < PGC_TBL_LEN; i++) {
+		val_even = drm_color_lut_extract(lut[i * 2].green, 10);
+		val_odd = drm_color_lut_extract(lut[i * 2 + 1].green, 10);
+		gc_lut->c0[i] = val_even | (val_odd << 16);
+		val_even = drm_color_lut_extract(lut[i * 2].blue, 10);
+		val_odd = drm_color_lut_extract(lut[i * 2 + 1].blue, 10);
+		gc_lut->c1[i] = val_even | (val_odd << 16);
+		val_even = drm_color_lut_extract(lut[i * 2].red, 10);
+		val_odd = drm_color_lut_extract(lut[i * 2 + 1].red, 10);
+		gc_lut->c2[i] = val_even | (val_odd << 16);
+	}
+
+	/* Disable 8-bit rounding mode */
+	gc_lut->flags = 0;
+}
+
 static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 {
 	struct drm_crtc_state *state = crtc->state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_pcc_cfg cfg;
+	struct dpu_hw_gc_lut *gc_lut;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_dspp *dspp;
 	int i;
@@ -830,19 +860,38 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 		ctl = mixer[i].lm_ctl;
 		dspp = mixer[i].hw_dspp;
 
-		if (!dspp || !dspp->ops.setup_pcc)
+		if (!dspp)
 			continue;
 
-		if (!state->ctm) {
-			dspp->ops.setup_pcc(dspp, NULL);
-		} else {
-			_dpu_crtc_get_pcc_coeff(state, &cfg);
-			dspp->ops.setup_pcc(dspp, &cfg);
+		if (dspp->ops.setup_pcc) {
+			if (!state->ctm) {
+				dspp->ops.setup_pcc(dspp, NULL);
+			} else {
+				_dpu_crtc_get_pcc_coeff(state, &cfg);
+				dspp->ops.setup_pcc(dspp, &cfg);
+			}
+
+			/* stage config flush mask */
+			ctl->ops.update_pending_flush_dspp(ctl,
+				mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
 		}
 
-		/* stage config flush mask */
-		ctl->ops.update_pending_flush_dspp(ctl,
-			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
+		if (dspp->ops.setup_gc) {
+			if (!state->gamma_lut) {
+				dspp->ops.setup_gc(dspp, NULL);
+			} else {
+				gc_lut = kzalloc(sizeof(*gc_lut), GFP_KERNEL);
+				if (!gc_lut)
+					continue;
+				_dpu_crtc_get_gc_lut(state, gc_lut);
+				dspp->ops.setup_gc(dspp, gc_lut);
+				kfree(gc_lut);
+			}
+
+			/* stage config flush mask */
+			ctl->ops.update_pending_flush_dspp(ctl,
+				mixer[i].hw_dspp->idx, DPU_DSPP_GC);
+		}
 	}
 }
 
@@ -1340,7 +1389,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 *
 	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
 	 *
-	 * Add dspps to the reservation requirements if ctm is requested
+	 * Add dspps to the reservation requirements if ctm or gamma_lut are requested
 	 *
 	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
 	 * enabled. This is because in cases where CWB is enabled, num_intf will
@@ -1359,7 +1408,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	else
 		topology.num_lm = 1;
 
-	if (crtc_state->ctm)
+	if (crtc_state->ctm || crtc_state->gamma_lut)
 		topology.num_dspp = topology.num_lm;
 
 	return topology;
@@ -1471,7 +1520,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	/* don't reallocate resources if only ACTIVE has beeen changed */
-	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
+	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
+	    crtc_state->color_mgmt_changed) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
@@ -1831,8 +1881,16 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	if (dpu_kms->catalog->dspp_count)
-		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	if (dpu_kms->catalog->dspp_count) {
+		const struct dpu_dspp_cfg *dspp = &dpu_kms->catalog->dspp[0];
+
+		if (dspp->sblk->gc.base) {
+			drm_mode_crtc_set_gamma_size(crtc, DPU_GAMMA_LUT_SIZE);
+			drm_crtc_enable_color_mgmt(crtc, 0, true, DPU_GAMMA_LUT_SIZE);
+		} else {
+			drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+		}
+	}
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6641455c4ec6..8bcfab70f023 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -382,11 +382,15 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x10007},
+	.gc = {.name = "gc", .base = 0x17c0,
+		.len = 0x40, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
+	.gc = {.name = "gc", .base = 0x17c0,
+		.len = 0x40, .version = 0x10008},
 };
 
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f0768f54e9b3..3ea67c1cf5c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -77,9 +77,11 @@ enum {
 /**
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
+ * @DPU_DSPP_GC              Gamma correction block
  */
 enum {
 	DPU_DSPP_PCC = 0x1,
+	DPU_DSPP_GC,
 	DPU_DSPP_MAX
 };
 
@@ -314,9 +316,11 @@ struct dpu_lm_sub_blks {
 /**
  * struct dpu_dspp_sub_blks: Information of DSPP block
  * @pcc: pixel color correction block
+ * @gc: gamma correction block
  */
 struct dpu_dspp_sub_blks {
 	struct dpu_pp_blk pcc;
+	struct dpu_pp_blk gc;
 };
 
 struct dpu_pingpong_sub_blks {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index ac834db2e4c1..36a497f1d6c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -399,6 +399,9 @@ static void dpu_hw_ctl_update_pending_flush_dspp_sub_blocks(
 	case DPU_DSPP_PCC:
 		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
 		break;
+	case DPU_DSPP_GC:
+		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
+		break;
 	default:
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 54b20faa0b69..188ee0af2c90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -24,6 +24,18 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 
+/* DSPP_GC */
+#define GC_EN BIT(0)
+#define GC_DIS 0
+#define GC_8B_ROUND_EN BIT(1)
+#define GC_LUT_SWAP_OFF 0x1c
+#define GC_C0_OFF 0x4
+#define GC_C1_OFF 0xc
+#define GC_C2_OFF 0x14
+#define GC_C0_INDEX_OFF 0x8
+#define GC_C1_INDEX_OFF 0x10
+#define GC_C2_INDEX_OFF 0x18
+
 static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
@@ -63,6 +75,46 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
+static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,
+		struct dpu_hw_gc_lut *gc_lut)
+{
+	int i = 0;
+	u32 base, reg;
+
+	if (!ctx) {
+		DRM_ERROR("invalid ctx\n");
+		return;
+	}
+
+	base = ctx->cap->sblk->gc.base;
+
+	if (!base) {
+		DRM_ERROR("invalid ctx %pK gc base\n", ctx);
+		return;
+	}
+
+	if (!gc_lut) {
+		DRM_DEBUG_DRIVER("disable gc feature\n");
+		DPU_REG_WRITE(&ctx->hw, base, GC_DIS);
+		return;
+	}
+
+	DPU_REG_WRITE(&ctx->hw, base + GC_C0_INDEX_OFF, 0);
+	DPU_REG_WRITE(&ctx->hw, base + GC_C1_INDEX_OFF, 0);
+	DPU_REG_WRITE(&ctx->hw, base + GC_C2_INDEX_OFF, 0);
+
+	for (i = 0; i < PGC_TBL_LEN; i++) {
+		DPU_REG_WRITE(&ctx->hw, base + GC_C0_OFF, gc_lut->c0[i]);
+		DPU_REG_WRITE(&ctx->hw, base + GC_C1_OFF, gc_lut->c1[i]);
+		DPU_REG_WRITE(&ctx->hw, base + GC_C2_OFF, gc_lut->c2[i]);
+	}
+
+	DPU_REG_WRITE(&ctx->hw, base + GC_LUT_SWAP_OFF, BIT(0));
+
+	reg = GC_EN | ((gc_lut->flags & PGC_8B_ROUND) ? GC_8B_ROUND_EN : 0);
+	DPU_REG_WRITE(&ctx->hw, base, reg);
+}
+
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -92,6 +144,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	c->cap = cfg;
 	if (c->cap->sblk->pcc.base)
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
+	if (c->cap->sblk->gc.base)
+		c->ops.setup_gc = dpu_setup_dspp_gc;
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 45c26cd49fa3..58eca1ed8509 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -33,6 +33,25 @@ struct dpu_hw_pcc_cfg {
 	struct dpu_hw_pcc_coeff b;
 };
 
+#define DPU_GAMMA_LUT_SIZE 1024
+#define PGC_TBL_LEN 512
+#define PGC_8B_ROUND BIT(0)
+
+/**
+ * struct dpu_hw_gc_lut - gc lut feature structure
+ * @flags: flags for the feature values can be:
+ *         - PGC_8B_ROUND
+ * @c0: color0 component lut
+ * @c1: color1 component lut
+ * @c2: color2 component lut
+ */
+struct dpu_hw_gc_lut {
+	__u64 flags;
+	__u32 c0[PGC_TBL_LEN];
+	__u32 c1[PGC_TBL_LEN];
+	__u32 c2[PGC_TBL_LEN];
+};
+
 /**
  * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
  * Caller must call the init function to get the dspp context for each dspp
@@ -46,6 +65,13 @@ struct dpu_hw_dspp_ops {
 	 */
 	void (*setup_pcc)(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
 
+	/**
+	 * setup_gc - setup dspp gc
+	 * @ctx: Pointer to dspp context
+	 * @gc_lut: Pointer to lut content
+	 */
+	void (*setup_gc)(struct dpu_hw_dspp *ctx, struct dpu_hw_gc_lut *gc_lut);
+
 };
 
 /**

---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770

Best regards,
-- 
Federico Amedeo Izzo <federico@izzo.pro>


