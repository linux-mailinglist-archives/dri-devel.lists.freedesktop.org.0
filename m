Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F2548538
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E4C10E764;
	Mon, 13 Jun 2022 12:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FA810E763
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:35:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a15so8590984lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kc18N6sC9vauDfcbGnI0rx0nsvG5/mJiSzeQmZ0Y8yg=;
 b=MU2vm9C8BcOeqyZzbW/lZ3DNDIV9tqA033Btd7iuqBUmEBzoeFh1acNKewBobNLeVL
 Q55U5lU7ntsLsKJIJXTqLrvOpgkvbNygpvl3/Zzlpd9Uem0547ZhCHfmB7sw/4Nj/2/q
 C7D46r2U8l7iEJq1smGSblCTpPhcf/BXR25Fq7Fh5Kv4C3HRbspOWGjxjZIu+GUiBRkQ
 7ZJ0YqgUcLDJp4UgnGhrt3umttL1HAPS9vYuboQLnqM0F5pOvSrJNK9kvTmyOB1sO6Q9
 A6zzk+4+EMtJ4UW3HzkovLjXFU6ZUVt8YX0YTrJ9vb/sDxpLZLQIbDpJuMmT8l+087K7
 LLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kc18N6sC9vauDfcbGnI0rx0nsvG5/mJiSzeQmZ0Y8yg=;
 b=MDM8EwQC9nFRd67WCfKkjINBV8NgwxgPi7ocKQBZtNm/3TaczmkD++TD2x8W/FdtYZ
 onWgPJse+BcARrbBtBitdhFA4fG9NMU8ZTbOV6GP4H+K5Gfrg47GWZkhlAWmOQ+f9Fwl
 FwJsQVigPd3nW6sxAyl7PyoQTuWU1JlnpqPeQwRvVYYkYk0aUbmQsasjtKa/mqMvLdcg
 e9FDMzdiCUcQ5CgUGz1syeXVK966LuFHhI/KCWO/3fOWgYxq2xz8x7DEqE6uMIXYgUwB
 tKPhBkZR3tJhR1QXGLqRMGRm5YGn7YnzCLrhpNR6Pm8BgchaH8LY89vcdghebCorcBi1
 m4XA==
X-Gm-Message-State: AOAM532ihyUxK+2MYfJ4BoUm06X8RmfFAhy0egnsxZwFuT5JzxeIRtyf
 uMSgzKYFmATlpMtVlx8gV6FpQFe0J+Y=
X-Google-Smtp-Source: ABdhPJzwxHJIwGZ7DilKxbfObtLwDFA2afHQPHeKodYpjc82SXhtCKJGzwCZsmWSf39E1Da62O90xA==
X-Received: by 2002:a05:6512:c07:b0:479:2e0f:9a06 with SMTP id
 z7-20020a0565120c0700b004792e0f9a06mr26607628lfu.687.1655123703519; 
 Mon, 13 Jun 2022 05:35:03 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:35:02 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/19] drm/gma500: Unify struct *_intel_lvds_connector_funcs
Date: Mon, 13 Jun 2022 14:34:36 +0200
Message-Id: <20220613123436.15185-20-patrik.r.jakobsson@gmail.com>
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

These now only contains generic drm/gma functions so create
gma_lvds_connector_funcs that all chips can use.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c |  9 +--------
 drivers/gpu/drm/gma500/gma_lvds.c       | 15 +++++++++++----
 drivers/gpu/drm/gma500/gma_lvds.h       |  4 +---
 drivers/gpu/drm/gma500/oaktrail_lvds.c  |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c |  9 +--------
 5 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index ccb489d6795b..0b8f818ca9b5 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,13 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static const struct drm_connector_funcs cdv_intel_lvds_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.set_property = gma_lvds_set_property,
-	.destroy = gma_lvds_destroy,
-};
-
 /*
  * Enumerate the child dev array parsed from VBT to check whether
  * the LVDS is present.
@@ -160,7 +153,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
-					  &cdv_intel_lvds_connector_funcs,
+					  &gma_lvds_connector_funcs,
 					  DRM_MODE_CONNECTOR_LVDS,
 					  &ddc_bus->base);
 	if (ret)
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index e4278d26f811..612013baf7ad 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -374,7 +374,7 @@ const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs = {
 	.best_encoder = gma_best_encoder,
 };
 
-void gma_lvds_destroy(struct drm_connector *connector)
+static void gma_lvds_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
@@ -389,9 +389,9 @@ void gma_lvds_destroy(struct drm_connector *connector)
 	kfree(gma_connector);
 }
 
-int gma_lvds_set_property(struct drm_connector *connector,
-			  struct drm_property *property,
-			  uint64_t value)
+static int gma_lvds_set_property(struct drm_connector *connector,
+				 struct drm_property *property,
+				 uint64_t value)
 {
 	struct drm_encoder *encoder = connector->encoder;
 
@@ -453,3 +453,10 @@ int gma_lvds_set_property(struct drm_connector *connector,
 	return 0;
 }
 
+const struct drm_connector_funcs gma_lvds_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.set_property = gma_lvds_set_property,
+	.destroy = gma_lvds_destroy,
+};
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index ea261a60e9ff..bcb2efa7a1b5 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -30,11 +30,9 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
-void gma_lvds_destroy(struct drm_connector *connector);
-int gma_lvds_set_property(struct drm_connector *connector,
-			  struct drm_property *property, uint64_t value);
 
 extern const struct drm_encoder_helper_funcs gma_lvds_helper_funcs;
 extern const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs;
+extern const struct drm_connector_funcs gma_lvds_connector_funcs;
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 7724ebd71aa8..ea2745116f92 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -217,7 +217,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
 	encoder = &gma_encoder->base;
 	dev_priv->is_lvds_on = true;
 	ret = drm_connector_init(dev, connector,
-				 &psb_intel_lvds_connector_funcs,
+				 &gma_lvds_connector_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret)
 		goto err_free_connector;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index df2e770c660a..4d9b9b45525f 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,13 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-const struct drm_connector_funcs psb_intel_lvds_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.set_property = gma_lvds_set_property,
-	.destroy = gma_lvds_destroy,
-};
-
 /**
  * psb_intel_lvds_init - setup LVDS connectors on this device
  * @dev: drm device
@@ -197,7 +190,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
-					  &psb_intel_lvds_connector_funcs,
+					  &gma_lvds_connector_funcs,
 					  DRM_MODE_CONNECTOR_LVDS,
 					  &ddc_bus->base);
 	if (ret)
-- 
2.36.1

