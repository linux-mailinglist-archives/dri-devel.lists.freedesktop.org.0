Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8654852D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D12310E766;
	Mon, 13 Jun 2022 12:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF1B10E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id d19so6004319lji.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRS2IS2T9yQ8Rk51V5tCvIdVW3c/kMSg4WAyUn9Wcp4=;
 b=dHu8YILEe7yqgMlmLkCix9yaMMDvz9anui4i3OnFdThWT5BM3H2HvIfMNdFRQ8UCWw
 GClF1T+Tz1Ek8tVwCdBVGbmGmlFL3aA74Kyjqaw8bPns3LygRttWqAzNuc/9VRz2hiIl
 U3beFKeJ2cNTKf4xiC6V/NfxD1cqxuWyENpyKiLxdjIkfBx5NmTnVDABDYb4n9PJUlbK
 UGiH9rhAiwqfK2DsULohCeFPfAOHu8uSjaW1veyd7fhSPK6/mryY3Gyqil8stvIALKPe
 DszChrCG+Ga+hJEWkAGGuYOvYmcuy9sMcjt2HU/oGxCaS1hddLsH3n6QwkcymLGAEnZ1
 AzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRS2IS2T9yQ8Rk51V5tCvIdVW3c/kMSg4WAyUn9Wcp4=;
 b=qGmAFAyryMM15GSVD9HP3XOmTVmHRo1f76T3vw0Efj53oSgxoBnPIzQiOgAILAc40j
 hm0VzwzADLFWE5AOoyz6CwliruqnF4r4rI8per9ZhW3ee5yWhTMl5yHHembYJhtCCPx1
 J1nep6tQRtVsGrauupvGgH1CrVo/OaHj7y+O9RV2ghisK32K2YoGxm9bbszZs1MhjZfz
 9p/kl1tFf3cubguF5cHCqq0VdUpzkxIDTSc9XssxHKzW4j8/1PnoaNYPn3DUmYEDozGJ
 LRZjBq7frdcIXPOnUm6QgmbXnE16HmK99Mi6TxpTehv0PpITaFrxQW7HjdETSJYx6G33
 hQ+w==
X-Gm-Message-State: AOAM532dTZifNMbpjfaF23SUPIhThSo9xAumzHVIGXgtlUIC4r1mC82f
 s+7Mu742F6tyzz5L64d1SguLwvo5B00=
X-Google-Smtp-Source: ABdhPJwM41jZAYCgBJ3Um23y5/yYJywqyoF7f03tqKjVq7qDL/qRhLDILf9fogaR1hgXDCv5tPHTag==
X-Received: by 2002:a2e:905a:0:b0:255:7fa2:4117 with SMTP id
 n26-20020a2e905a000000b002557fa24117mr27139560ljg.291.1655123691207; 
 Mon, 13 Jun 2022 05:34:51 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:50 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/19] drm/gma500: Unify *_intel_lvds_mode_fixup()
Date: Mon, 13 Jun 2022 14:34:26 +0200
Message-Id: <20220613123436.15185-10-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions mostly do the same thing so unify them. Change a check
of !IS_MRST() to IS_PSB() to not change the behaviour for CDV.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 51 +------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 59 ++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  3 ++
 drivers/gpu/drm/gma500/oaktrail_lvds.c  |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 65 +------------------------
 5 files changed, 65 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 61dc65964e21..65532308f1e7 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,55 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static bool cdv_intel_lvds_mode_fixup(struct drm_encoder *encoder,
-				  const struct drm_display_mode *mode,
-				  struct drm_display_mode *adjusted_mode)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	struct drm_encoder *tmp_encoder;
-	struct drm_display_mode *panel_fixed_mode = mode_dev->panel_fixed_mode;
-
-	/* Should never happen!! */
-	list_for_each_entry(tmp_encoder, &dev->mode_config.encoder_list,
-			    head) {
-		if (tmp_encoder != encoder
-		    && tmp_encoder->crtc == encoder->crtc) {
-			pr_err("Can't enable LVDS and another encoder on the same pipe\n");
-			return false;
-		}
-	}
-
-	/*
-	 * If we have timings from the BIOS for the panel, put them in
-	 * to the adjusted mode.  The CRTC will be set up for this mode,
-	 * with the panel scaling set up to source from the H/VDisplay
-	 * of the original mode.
-	 */
-	if (panel_fixed_mode != NULL) {
-		adjusted_mode->hdisplay = panel_fixed_mode->hdisplay;
-		adjusted_mode->hsync_start = panel_fixed_mode->hsync_start;
-		adjusted_mode->hsync_end = panel_fixed_mode->hsync_end;
-		adjusted_mode->htotal = panel_fixed_mode->htotal;
-		adjusted_mode->vdisplay = panel_fixed_mode->vdisplay;
-		adjusted_mode->vsync_start = panel_fixed_mode->vsync_start;
-		adjusted_mode->vsync_end = panel_fixed_mode->vsync_end;
-		adjusted_mode->vtotal = panel_fixed_mode->vtotal;
-		adjusted_mode->clock = panel_fixed_mode->clock;
-		drm_mode_set_crtcinfo(adjusted_mode,
-				      CRTC_INTERLACE_HALVE_V);
-	}
-
-	/*
-	 * XXX: It would be nice to support lower refresh rates on the
-	 * panels to reduce power consumption, and perhaps match the
-	 * user's requested refresh rate.
-	 */
-
-	return true;
-}
-
 static void cdv_intel_lvds_prepare(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -255,7 +206,7 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 static const struct drm_encoder_helper_funcs
 					cdv_intel_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
-	.mode_fixup = cdv_intel_lvds_mode_fixup,
+	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = cdv_intel_lvds_prepare,
 	.mode_set = cdv_intel_lvds_mode_set,
 	.commit = cdv_intel_lvds_commit,
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 19679ee36062..32ecf5835828 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -209,3 +209,62 @@ void gma_lvds_restore(struct drm_connector *connector)
 	}
 }
 
+bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
+			 const struct drm_display_mode *mode,
+			 struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
+	struct gma_crtc *gma_crtc = to_gma_crtc(encoder->crtc);
+	struct drm_encoder *tmp_encoder;
+	struct drm_display_mode *panel_fixed_mode = mode_dev->panel_fixed_mode;
+
+	/* PSB requires the LVDS is on pipe B, MRST has only one pipe anyway */
+	if (IS_PSB(dev) && gma_crtc->pipe == 0) {
+		pr_err("Can't support LVDS on pipe A\n");
+		return false;
+	}
+	if (IS_MRST(dev) && gma_crtc->pipe != 0) {
+		pr_err("Must use PIPE A\n");
+		return false;
+	}
+	/* Should never happen!! */
+	list_for_each_entry(tmp_encoder, &dev->mode_config.encoder_list,
+			    head) {
+		if (tmp_encoder != encoder
+		    && tmp_encoder->crtc == encoder->crtc) {
+			pr_err("Can't enable LVDS and another encoder on the same pipe\n");
+			return false;
+		}
+	}
+
+	/*
+	 * If we have timings from the BIOS for the panel, put them in
+	 * to the adjusted mode.  The CRTC will be set up for this mode,
+	 * with the panel scaling set up to source from the H/VDisplay
+	 * of the original mode.
+	 */
+	if (panel_fixed_mode != NULL) {
+		adjusted_mode->hdisplay = panel_fixed_mode->hdisplay;
+		adjusted_mode->hsync_start = panel_fixed_mode->hsync_start;
+		adjusted_mode->hsync_end = panel_fixed_mode->hsync_end;
+		adjusted_mode->htotal = panel_fixed_mode->htotal;
+		adjusted_mode->vdisplay = panel_fixed_mode->vdisplay;
+		adjusted_mode->vsync_start = panel_fixed_mode->vsync_start;
+		adjusted_mode->vsync_end = panel_fixed_mode->vsync_end;
+		adjusted_mode->vtotal = panel_fixed_mode->vtotal;
+		adjusted_mode->clock = panel_fixed_mode->clock;
+		drm_mode_set_crtcinfo(adjusted_mode,
+				      CRTC_INTERLACE_HALVE_V);
+	}
+
+	/*
+	 * XXX: It would be nice to support lower refresh rates on the
+	 * panels to reduce power consumption, and perhaps match the
+	 * user's requested refresh rate.
+	 */
+
+	return true;
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index eee0da00a0cf..950ab7b88ad6 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -30,5 +30,8 @@ enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
 void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
 void gma_lvds_save(struct drm_connector *connector);
 void gma_lvds_restore(struct drm_connector *connector);
+bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
+			 const struct drm_display_mode *mode,
+			 struct drm_display_mode *adjusted_mode);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 00ec4fea4c12..16699b0fbbc9 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -134,7 +134,7 @@ static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs oaktrail_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
-	.mode_fixup = psb_intel_lvds_mode_fixup,
+	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = oaktrail_lvds_prepare,
 	.mode_set = oaktrail_lvds_mode_set,
 	.commit = oaktrail_lvds_commit,
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 6e5abb670bff..317bd1fcfa2a 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,69 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
-				  const struct drm_display_mode *mode,
-				  struct drm_display_mode *adjusted_mode)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	struct gma_crtc *gma_crtc = to_gma_crtc(encoder->crtc);
-	struct drm_encoder *tmp_encoder;
-	struct drm_display_mode *panel_fixed_mode = mode_dev->panel_fixed_mode;
-	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
-
-	if (gma_encoder->type == INTEL_OUTPUT_MIPI2)
-		panel_fixed_mode = mode_dev->panel_fixed_mode2;
-
-	/* PSB requires the LVDS is on pipe B, MRST has only one pipe anyway */
-	if (!IS_MRST(dev) && gma_crtc->pipe == 0) {
-		pr_err("Can't support LVDS on pipe A\n");
-		return false;
-	}
-	if (IS_MRST(dev) && gma_crtc->pipe != 0) {
-		pr_err("Must use PIPE A\n");
-		return false;
-	}
-	/* Should never happen!! */
-	list_for_each_entry(tmp_encoder, &dev->mode_config.encoder_list,
-			    head) {
-		if (tmp_encoder != encoder
-		    && tmp_encoder->crtc == encoder->crtc) {
-			pr_err("Can't enable LVDS and another encoder on the same pipe\n");
-			return false;
-		}
-	}
-
-	/*
-	 * If we have timings from the BIOS for the panel, put them in
-	 * to the adjusted mode.  The CRTC will be set up for this mode,
-	 * with the panel scaling set up to source from the H/VDisplay
-	 * of the original mode.
-	 */
-	if (panel_fixed_mode != NULL) {
-		adjusted_mode->hdisplay = panel_fixed_mode->hdisplay;
-		adjusted_mode->hsync_start = panel_fixed_mode->hsync_start;
-		adjusted_mode->hsync_end = panel_fixed_mode->hsync_end;
-		adjusted_mode->htotal = panel_fixed_mode->htotal;
-		adjusted_mode->vdisplay = panel_fixed_mode->vdisplay;
-		adjusted_mode->vsync_start = panel_fixed_mode->vsync_start;
-		adjusted_mode->vsync_end = panel_fixed_mode->vsync_end;
-		adjusted_mode->vtotal = panel_fixed_mode->vtotal;
-		adjusted_mode->clock = panel_fixed_mode->clock;
-		drm_mode_set_crtcinfo(adjusted_mode,
-				      CRTC_INTERLACE_HALVE_V);
-	}
-
-	/*
-	 * XXX: It would be nice to support lower refresh rates on the
-	 * panels to reduce power consumption, and perhaps match the
-	 * user's requested refresh rate.
-	 */
-
-	return true;
-}
-
 static void psb_intel_lvds_prepare(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -365,7 +302,7 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 
 static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
-	.mode_fixup = psb_intel_lvds_mode_fixup,
+	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = psb_intel_lvds_prepare,
 	.mode_set = psb_intel_lvds_mode_set,
 	.commit = psb_intel_lvds_commit,
-- 
2.36.1

