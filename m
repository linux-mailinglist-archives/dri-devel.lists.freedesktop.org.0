Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F054853B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2864C10E768;
	Mon, 13 Jun 2022 12:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E6410E762
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w20so8576117lfa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UYZm28xWzq+aYP1iUVZJKgTaXiuOf6AR4hbfVKH3QKw=;
 b=VZPtVjXPGloO8fISjIC8pa1V9Za1jV/9dVmEzABgRNMTwYueo51AZlvWwl+rN35Ph+
 BF0qf00wgJf513pT2depe8OJXXURni/KiWqFhcXOKRF9wHC3gJj/E5f7FYhUqV+tAQHZ
 EuWE+j1Y3fWg7T7cNvN4HenIV1Q5tvl7paYhtnV5sNgebY77HY48sN8WBp+ua9nUa/Km
 KLWl4QbftsmdRODA7XBJU28rLuVHOvJGlsvyL8vss1mfx5QIF3LarbFG7X5UWILRD44I
 h1oa7FPdEpojt5zz9t42+dBXPdKJZ4CPXAnt7/2x6kOXG3MJoUS2QO6jqM9EShsuntBZ
 G3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UYZm28xWzq+aYP1iUVZJKgTaXiuOf6AR4hbfVKH3QKw=;
 b=eWh6UEMmVCbPWdZ8LplV0R1b3Tk7WCEQZNagsfAKGyzjbH3Zr1FOQnmj0NtxaxN1aq
 XeNPnYR86QiUqwsAjX4L6ZOFLluZralFYZPzYR545ctbBE1wF80s0DtSDIalgHKwS+40
 NQVdbLAnt/bTEnBdnwBwhfo+91vpn2gnF1T0UXS7LW+2Sx5LEuncNcDj18TF+zxQjhgu
 jvZWxHNr4y38TRE2Bt7IIXXxmbc6/eFc/tWXZ113fZbF/JF8Clpys1CBIVaXhL7AfPut
 pEIBHRNM4RdJxIjWPRILEpDqdmdpxGTIlKLMHvmrbcvb9NHERMtkvnAmxiOfYC3hTgbN
 oESg==
X-Gm-Message-State: AOAM532HjA4IDmkFVarJB71JLAPr+xDPW2zb0eeRfGTvWVDIT6kpoVYN
 lRi5T6jnSPRDQphNfc8MN4OhddNDH8c=
X-Google-Smtp-Source: ABdhPJxHh/8SXHX00pCllOKTvjvJraComgKrVwsFqJGshY+6DCJRwk1N5cr5sNUv21oCqggyGs5zLQ==
X-Received: by 2002:a05:6512:22c4:b0:47d:aab8:8ba4 with SMTP id
 g4-20020a05651222c400b0047daab88ba4mr10816764lfu.212.1655123692638; 
 Mon, 13 Jun 2022 05:34:52 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:51 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/19] drm/gma500: Unify *_intel_lvds_prepare()
Date: Mon, 13 Jun 2022 14:34:27 +0200
Message-Id: <20220613123436.15185-11-patrik.r.jakobsson@gmail.com>
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

The functions are identical so unify them.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 20 +-------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 18 +-----------------
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 20 +-------------------
 5 files changed, 22 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 65532308f1e7..4f0754b8c0b0 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,24 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static void cdv_intel_lvds_prepare(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-
-	if (!gma_power_begin(dev, true))
-		return;
-
-	mode_dev->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
-	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
-					  BACKLIGHT_DUTY_CYCLE_MASK);
-
-	gma_lvds_set_power(dev, false);
-
-	gma_power_end(dev);
-}
-
 static void cdv_intel_lvds_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -207,7 +189,7 @@ static const struct drm_encoder_helper_funcs
 					cdv_intel_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = gma_lvds_mode_fixup,
-	.prepare = cdv_intel_lvds_prepare,
+	.prepare = gma_lvds_prepare,
 	.mode_set = cdv_intel_lvds_mode_set,
 	.commit = cdv_intel_lvds_commit,
 };
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 32ecf5835828..d0a97eeac38b 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -268,3 +268,21 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 	return true;
 }
 
+void gma_lvds_prepare(struct drm_encoder *encoder)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
+
+	if (!gma_power_begin(dev, true))
+		return;
+
+	mode_dev->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
+	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
+					  BACKLIGHT_DUTY_CYCLE_MASK);
+
+	gma_lvds_set_power(dev, false);
+
+	gma_power_end(dev);
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 950ab7b88ad6..c1a7b3611d27 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -33,5 +33,6 @@ void gma_lvds_restore(struct drm_connector *connector);
 bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 const struct drm_display_mode *mode,
 			 struct drm_display_mode *adjusted_mode);
+void gma_lvds_prepare(struct drm_encoder *encoder);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 16699b0fbbc9..dba0ca4b73a0 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -105,22 +105,6 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 	gma_power_end(dev);
 }
 
-static void oaktrail_lvds_prepare(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-
-	if (!gma_power_begin(dev, true))
-		return;
-
-	mode_dev->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
-	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
-					  BACKLIGHT_DUTY_CYCLE_MASK);
-	gma_lvds_set_power(dev, false);
-	gma_power_end(dev);
-}
-
 static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -135,7 +119,7 @@ static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 static const struct drm_encoder_helper_funcs oaktrail_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = gma_lvds_mode_fixup,
-	.prepare = oaktrail_lvds_prepare,
+	.prepare = gma_lvds_prepare,
 	.mode_set = oaktrail_lvds_mode_set,
 	.commit = oaktrail_lvds_commit,
 };
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 317bd1fcfa2a..e4258205a262 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,24 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-static void psb_intel_lvds_prepare(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-
-	if (!gma_power_begin(dev, true))
-		return;
-
-	mode_dev->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
-	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
-					  BACKLIGHT_DUTY_CYCLE_MASK);
-
-	gma_lvds_set_power(dev, false);
-
-	gma_power_end(dev);
-}
-
 static void psb_intel_lvds_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -303,7 +285,7 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = gma_lvds_mode_fixup,
-	.prepare = psb_intel_lvds_prepare,
+	.prepare = gma_lvds_prepare,
 	.mode_set = psb_intel_lvds_mode_set,
 	.commit = psb_intel_lvds_commit,
 };
-- 
2.36.1

