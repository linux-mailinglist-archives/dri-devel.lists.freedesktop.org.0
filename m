Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61216548531
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861910E763;
	Mon, 13 Jun 2022 12:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239BC10E75A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be31so8586036lfb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWCXEyjzg2pysk8ShcRPJc2kdw6w7ZsTAW93SlAzev0=;
 b=IWXUMAXagqtqTcFYIQoVjq2KpxARxvI90qf3Tv3bM//KCad0WvHEGp7LXwn88OVqB5
 llS4VjY+LbBjDCiT9yod7g78hX1zvKBQ7sqwqfd0oK9qKUHneNnMTtAV1WQMy8MwmkSZ
 AwPoIafKKbk2L/lVuSdVK23pP3QJTqybieqZ1DfHE0Dpn4L6o4wbaxfembBePmMre5QJ
 vRXFZD3C1CHpQHk/CQrN8uaL0ZsY+TXRLEewO7sPokPPwIbsxjAZlhRd88058fU22bZ6
 qGS5wLIHbHGb78sHA4ugvDXDVPRQ+tdN3JpvjlaFMcNg6xTpXbmAPB/TolZzVR/BbmHT
 lD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWCXEyjzg2pysk8ShcRPJc2kdw6w7ZsTAW93SlAzev0=;
 b=Lh9C/dfsb9wi2zB2LhwhTDJU/0HWajWIWXBeinDtgz8bKRHbOcptjHj/ICKFL7kK8u
 chjQ3WxxBaiTO/FNAKICFPpLzFeV1Ca0y1vPhEHc8ydiRLj1oC/0EJckis5Kj/ZY0y0q
 ntnx5TKEjp5YUzXfNa8WiSbrXRipfxtFJzS0auiWgcH8IUC+VpjVzd82Qsr747f3QM/i
 Wt/egxSdzv2uL0NqA4pf0IBVP7YItYdSeMFR9pW+CqacXhitEz8SXbWAOBIrSyEd5FCQ
 GuLg/e2GqdDVspXiqX03PqRTGvP/CRs0IgAdmh1rLcpqUbkKeh7PGOp6M83575Jpv1A2
 a1Xg==
X-Gm-Message-State: AOAM532J4VbKNVXEzPxz5gyDsrH8hZuBl03DpWD/sIrX935xoUsp3VR6
 Cd6PxWanFwZaKvJeFRdSFE1ioZZJDWk=
X-Google-Smtp-Source: ABdhPJxqm2MQ3MbDHxET6HBXw1UIBCQVgedDwQiwukHsCSDQn4g3/w6zE7pop9FpIxTMPA3tDONUEg==
X-Received: by 2002:a05:6512:3b97:b0:479:1a44:f60e with SMTP id
 g23-20020a0565123b9700b004791a44f60emr33133736lfv.72.1655123693868; 
 Mon, 13 Jun 2022 05:34:53 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:53 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/19] drm/gma500: Unify *_intel_lvds_commit()
Date: Mon, 13 Jun 2022 14:34:28 +0200
Message-Id: <20220613123436.15185-12-patrik.r.jakobsson@gmail.com>
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

These functions are identical so unify them

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 15 +--------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 15 ++++++++++++++-
 drivers/gpu/drm/gma500/gma_lvds.h       |  2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 13 +------------
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 15 +--------------
 5 files changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 4f0754b8c0b0..77a5d167c508 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,19 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static void cdv_intel_lvds_commit(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-
-	if (mode_dev->backlight_duty_cycle == 0)
-		mode_dev->backlight_duty_cycle =
-		    gma_lvds_get_max_backlight(dev);
-
-	gma_lvds_set_power(dev, true);
-}
-
 static void cdv_intel_lvds_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -191,7 +178,7 @@ static const struct drm_encoder_helper_funcs
 	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = gma_lvds_prepare,
 	.mode_set = cdv_intel_lvds_mode_set,
-	.commit = cdv_intel_lvds_commit,
+	.commit = gma_lvds_commit,
 };
 
 static const struct drm_connector_helper_funcs
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index d0a97eeac38b..6364d3aef064 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -62,7 +62,7 @@ static void gma_lvds_set_backlight(struct drm_device *dev, int level)
 /*
  * Sets the power state for the panel.
  */
-void gma_lvds_set_power(struct drm_device *dev, bool on)
+static void gma_lvds_set_power(struct drm_device *dev, bool on)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 pp_status;
@@ -286,3 +286,16 @@ void gma_lvds_prepare(struct drm_encoder *encoder)
 	gma_power_end(dev);
 }
 
+void gma_lvds_commit(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
+
+	if (mode_dev->backlight_duty_cycle == 0)
+		mode_dev->backlight_duty_cycle =
+		    gma_lvds_get_max_backlight(dev);
+
+	gma_lvds_set_power(dev, true);
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index c1a7b3611d27..c2c8fe5b5aac 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -24,7 +24,6 @@ struct gma_lvds_priv {
 };
 
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
-void gma_lvds_set_power(struct drm_device *dev, bool on);
 enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
 					 struct drm_display_mode *mode);
 void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
@@ -34,5 +33,6 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 const struct drm_display_mode *mode,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
+void gma_lvds_commit(struct drm_encoder *encoder);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index dba0ca4b73a0..85cab0f7028a 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -105,23 +105,12 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 	gma_power_end(dev);
 }
 
-static void oaktrail_lvds_commit(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-
-	if (mode_dev->backlight_duty_cycle == 0)
-		mode_dev->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
-	gma_lvds_set_power(dev, true);
-}
-
 static const struct drm_encoder_helper_funcs oaktrail_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = gma_lvds_prepare,
 	.mode_set = oaktrail_lvds_mode_set,
-	.commit = oaktrail_lvds_commit,
+	.commit = gma_lvds_commit,
 };
 
 /* Returns the panel fixed mode from configuration. */
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index e4258205a262..fbb72be6e017 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,19 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-static void psb_intel_lvds_commit(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-
-	if (mode_dev->backlight_duty_cycle == 0)
-		mode_dev->backlight_duty_cycle =
-		    gma_lvds_get_max_backlight(dev);
-
-	gma_lvds_set_power(dev, true);
-}
-
 static void psb_intel_lvds_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -287,7 +274,7 @@ static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
 	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = gma_lvds_prepare,
 	.mode_set = psb_intel_lvds_mode_set,
-	.commit = psb_intel_lvds_commit,
+	.commit = gma_lvds_commit,
 };
 
 const struct drm_connector_helper_funcs
-- 
2.36.1

