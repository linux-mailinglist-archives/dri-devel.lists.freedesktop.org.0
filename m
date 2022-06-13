Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1454852A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3310E5CD;
	Mon, 13 Jun 2022 12:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC3510E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h23so6029549ljl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GSNzCiLffYRBANekLEJ1I/GkIfJ+45nbu4qh096sNQ=;
 b=MIJezlnLISiXMgdpuAkyEKFzWxrIcnd3lXY6WGibovEdK+7bISNIjFHhl3+VV6HkO/
 MVRpHqXvOZVn5Cvm/fVyaEUpU9zGG7/wHaIrg17/parOgD22pmXeAIE+xIA+xYCuBx/I
 rAp2RjUTn/fWHApVgzQ5K51KF50oUDMOnTp2vA2V8tWn1jHzXA7gMmB806XTnYVyfcgf
 /zgcUBfbiwVla/PMG8LtO9Axpm3lDplSZWLQsZCu4HiixBP4CB5Pz0Ej5k/UvcJuz/8D
 w4pyocsUfDzZ3wvc4KzpVfZfYBEUhJypyyo6cJokbfhVSUgD2H+YyxINfr/D0jUrTDTX
 UtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GSNzCiLffYRBANekLEJ1I/GkIfJ+45nbu4qh096sNQ=;
 b=G/Bjxen6dhZDAFdqFtm8ouEfOYCN69lzkifYFbmHG99Yb6/bV5u+ltCqF9lWcg1s/r
 F2rrySJKYTAhRFYhjwzRZyRdTBusZY6RV2JcOxqVwaqpY6Pq+hqemETb9i/IVQVpezSk
 YtL/RNUp+/Z7zwGnkGpO8HiiB6Q477yTxOndpTCBgidlziHIn5STgVepU0VBrmHBtmWJ
 WgDOn/4NSoef6cwhPnd9RIhVfpOaGqj+18LnvzfztrIE0Y3pCOggoJR1i/j301UjrC7v
 9drA9zi0el1/SXj9tzhm1rLyD/ucj9h4B4p0AeyiuPH8pFS+WslKIkPr/o93pK5ZXNCh
 Kx1g==
X-Gm-Message-State: AOAM530g38J7pW7XeOQO/WFWukBm7/re8KOqi5oWgEDEHV1jmVqtzbak
 VvJD0dki3NnIKonmJWFxvAFc1ERoJ4w=
X-Google-Smtp-Source: ABdhPJwoy34enJMhj5bHgnAD0mB1+BkcIQKg3UjstmfBEALb4jTbc4Ssz0oNOiaHK6w3eih93lawjg==
X-Received: by 2002:a05:651c:513:b0:257:c12:b93b with SMTP id
 o19-20020a05651c051300b002570c12b93bmr12521758ljp.88.1655123685477; 
 Mon, 13 Jun 2022 05:34:45 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:44 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/19] drm/gma500: Unify *_lvds_encoder_dpms()
Date: Mon, 13 Jun 2022 14:34:22 +0200
Message-Id: <20220613123436.15185-6-patrik.r.jakobsson@gmail.com>
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

These functions are identical so unify them into one.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 12 +-----------
 drivers/gpu/drm/gma500/gma_lvds.c       | 11 +++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 14 +-------------
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 14 +-------------
 5 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 968d627e23d1..59d30fa0eb53 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -53,16 +53,6 @@ struct cdv_intel_lvds_priv {
 	uint32_t saveBLC_PWM_CTL;
 };
 
-static void cdv_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct drm_device *dev = encoder->dev;
-	if (mode == DRM_MODE_DPMS_ON)
-		gma_lvds_set_power(dev, true);
-	else
-		gma_lvds_set_power(dev, false);
-	/* XXX: We never power down the LVDS pairs. */
-}
-
 static void cdv_intel_lvds_save(struct drm_connector *connector)
 {
 }
@@ -286,7 +276,7 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 
 static const struct drm_encoder_helper_funcs
 					cdv_intel_lvds_helper_funcs = {
-	.dpms = cdv_intel_lvds_encoder_dpms,
+	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = cdv_intel_lvds_mode_fixup,
 	.prepare = cdv_intel_lvds_prepare,
 	.mode_set = cdv_intel_lvds_mode_set,
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index c36815493366..fb8f8bb599eb 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -118,3 +118,14 @@ enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev = encoder->dev;
+
+	if (mode == DRM_MODE_DPMS_ON)
+		gma_lvds_set_power(dev, true);
+	else
+		gma_lvds_set_power(dev, false);
+	/* XXX: We never power down the LVDS pairs. */
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 6b4d8a024da1..3babb522ee84 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -11,5 +11,6 @@ u32 gma_lvds_get_max_backlight(struct drm_device *dev);
 void gma_lvds_set_power(struct drm_device *dev, bool on);
 enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
 					 struct drm_display_mode *mode);
+void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 9634807e4d8c..00ec4fea4c12 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -30,18 +30,6 @@
 #define MRST_BLC_MAX_PWM_REG_FREQ	    0xFFFF
 #define BRIGHTNESS_MAX_LEVEL 100
 
-static void oaktrail_lvds_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct drm_device *dev = encoder->dev;
-
-	if (mode == DRM_MODE_DPMS_ON)
-		gma_lvds_set_power(dev, true);
-	else
-		gma_lvds_set_power(dev, false);
-
-	/* XXX: We never power down the LVDS pairs. */
-}
-
 static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
@@ -145,7 +133,7 @@ static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 }
 
 static const struct drm_encoder_helper_funcs oaktrail_lvds_helper_funcs = {
-	.dpms = oaktrail_lvds_dpms,
+	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = psb_intel_lvds_mode_fixup,
 	.prepare = oaktrail_lvds_prepare,
 	.mode_set = oaktrail_lvds_mode_set,
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index c88697a805e0..2470ab0e1e0e 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -148,18 +148,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-static void psb_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct drm_device *dev = encoder->dev;
-
-	if (mode == DRM_MODE_DPMS_ON)
-		gma_lvds_set_power(dev, true);
-	else
-		gma_lvds_set_power(dev, false);
-
-	/* XXX: We never power down the LVDS pairs. */
-}
-
 static void psb_intel_lvds_save(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -471,7 +459,7 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 }
 
 static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
-	.dpms = psb_intel_lvds_encoder_dpms,
+	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = psb_intel_lvds_mode_fixup,
 	.prepare = psb_intel_lvds_prepare,
 	.mode_set = psb_intel_lvds_mode_set,
-- 
2.36.1

