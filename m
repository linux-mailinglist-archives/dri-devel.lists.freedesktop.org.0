Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747E54852C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6603E10E75B;
	Mon, 13 Jun 2022 12:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3F10E75A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id g25so6046899ljm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nK1csNomReO7CagJqV6em1da0WscC0SyD8Abju5z3Hk=;
 b=iVz0wSteJ7EhrfvSAyqUEC+5ZQqGW/JCcim18FC2j7p4hL5EeHvAE8Z01xSFv28ay7
 rBRPMEm45q/KXrBuJz3UdVSQocWcU8sNb8jyIoLWp6PH/4/sNVdf69uzKOT3sTyBarBu
 enZhlI5vSZvUL31xp15L48szpNSTcXfL6gCd27bTaVdjpbIfVEvOzRiPGY+n6VLjiSln
 7dIQZZum0XVIns2ImatAgIuj7xNmv1e/lbfT9V0GHn4BJ+vylyEs1ZiVEMkxUAAE7tA3
 1VmEDjetf2keF/JFXSjQ7dQzT9X2rmu/YLmrxQspdIIA/gfKh659+QDhATBHDiJSubZh
 VUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nK1csNomReO7CagJqV6em1da0WscC0SyD8Abju5z3Hk=;
 b=tuqf2oflaK17x+SyifnkdWoqcRct5ASYzQPXCO0plpjpzlWty6BZmdW8LyVSBGEZsy
 a6oFTWXym4CGq4hiyza27ekP3aCcgXfhJNisYiRCa1MwR3gneGzyU1iIf/1c1uO6JTGh
 HUa4vM0zAqB6a92c8gtY94XAs3nkJ1F8iVM0MheXJ3x7qFJl9cfymIZcHChsQJpqlwqV
 +cw6aUR9zFSOC0tK8abUcX+8L4Di481OFjr1Bwj77/z/uV5OSKcRPxpHuXi2nSvnn2HJ
 fjASTNfK28YsFaXIO646BT7mn3PL4NZ8N55gkKWnSrxcB/P+xhr1MStD7Tz3IzWXA2b5
 QHSw==
X-Gm-Message-State: AOAM530SJdQ9xS6VBVA5hrjW9ogAe2eFF5MQd+qgQc7pHEsbTywl9mT6
 YilURZDkzTkNoqQJ81270ZHOLUGr+4U=
X-Google-Smtp-Source: ABdhPJyACaM0J1PpyuZhKHlolFAdvZQUIaNIp/9M/Kycv+eHWYub2MUhLL9h/dE48Uz77nYfdQv6lA==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id
 o10-20020a2e944a000000b0024f10bdb7e8mr70412612ljh.238.1655123690008; 
 Mon, 13 Jun 2022 05:34:50 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:49 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/19] drm/gma500: Unify *_intel_lvds_restore()
Date: Mon, 13 Jun 2022 14:34:25 +0200
Message-Id: <20220613123436.15185-9-patrik.r.jakobsson@gmail.com>
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

Cedarview never implemented this so use the Poulsbo version for both.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c |  6 +---
 drivers/gpu/drm/gma500/gma_lvds.c       | 41 +++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 43 +------------------------
 4 files changed, 44 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index b0e7b680f02b..61dc65964e21 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,10 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static void cdv_intel_lvds_restore(struct drm_connector *connector)
-{
-}
-
 static bool cdv_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				  const struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
@@ -381,7 +377,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 
 	connector = &gma_connector->base;
 	gma_connector->save = gma_lvds_save;
-	gma_connector->restore = cdv_intel_lvds_restore;
+	gma_connector->restore = gma_lvds_restore;
 	encoder = &gma_encoder->base;
 
 	/* Set up the DDC bus. */
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 7a81f44a40bd..19679ee36062 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -168,3 +168,44 @@ void gma_lvds_save(struct drm_connector *connector)
 			lvds_priv->saveBLC_PWM_CTL);
 }
 
+void gma_lvds_restore(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	u32 pp_status;
+	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
+	struct gma_lvds_priv *lvds_priv =
+		(struct gma_lvds_priv *)gma_encoder->dev_priv;
+
+	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
+			lvds_priv->savePP_ON,
+			lvds_priv->savePP_OFF,
+			lvds_priv->saveLVDS,
+			lvds_priv->savePP_CONTROL,
+			lvds_priv->savePP_CYCLE,
+			lvds_priv->saveBLC_PWM_CTL);
+
+	REG_WRITE(BLC_PWM_CTL, lvds_priv->saveBLC_PWM_CTL);
+	REG_WRITE(PFIT_CONTROL, lvds_priv->savePFIT_CONTROL);
+	REG_WRITE(PFIT_PGM_RATIOS, lvds_priv->savePFIT_PGM_RATIOS);
+	REG_WRITE(LVDSPP_ON, lvds_priv->savePP_ON);
+	REG_WRITE(LVDSPP_OFF, lvds_priv->savePP_OFF);
+	/*REG_WRITE(PP_DIVISOR, lvds_priv->savePP_DIVISOR);*/
+	REG_WRITE(PP_CYCLE, lvds_priv->savePP_CYCLE);
+	REG_WRITE(PP_CONTROL, lvds_priv->savePP_CONTROL);
+	REG_WRITE(LVDS, lvds_priv->saveLVDS);
+
+	if (lvds_priv->savePP_CONTROL & POWER_TARGET_ON) {
+		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
+			POWER_TARGET_ON);
+		do {
+			pp_status = REG_READ(PP_STATUS);
+		} while ((pp_status & PP_ON) == 0);
+	} else {
+		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
+			~POWER_TARGET_ON);
+		do {
+			pp_status = REG_READ(PP_STATUS);
+		} while (pp_status & PP_ON);
+	}
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 98ad9bc878b7..eee0da00a0cf 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -29,5 +29,6 @@ enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
 					 struct drm_display_mode *mode);
 void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
 void gma_lvds_save(struct drm_connector *connector);
+void gma_lvds_restore(struct drm_connector *connector);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 995e7aac53b9..6e5abb670bff 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,47 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-static void psb_intel_lvds_restore(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	u32 pp_status;
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct gma_lvds_priv *lvds_priv =
-		(struct gma_lvds_priv *)gma_encoder->dev_priv;
-
-	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
-			lvds_priv->savePP_ON,
-			lvds_priv->savePP_OFF,
-			lvds_priv->saveLVDS,
-			lvds_priv->savePP_CONTROL,
-			lvds_priv->savePP_CYCLE,
-			lvds_priv->saveBLC_PWM_CTL);
-
-	REG_WRITE(BLC_PWM_CTL, lvds_priv->saveBLC_PWM_CTL);
-	REG_WRITE(PFIT_CONTROL, lvds_priv->savePFIT_CONTROL);
-	REG_WRITE(PFIT_PGM_RATIOS, lvds_priv->savePFIT_PGM_RATIOS);
-	REG_WRITE(LVDSPP_ON, lvds_priv->savePP_ON);
-	REG_WRITE(LVDSPP_OFF, lvds_priv->savePP_OFF);
-	/*REG_WRITE(PP_DIVISOR, lvds_priv->savePP_DIVISOR);*/
-	REG_WRITE(PP_CYCLE, lvds_priv->savePP_CYCLE);
-	REG_WRITE(PP_CONTROL, lvds_priv->savePP_CONTROL);
-	REG_WRITE(LVDS, lvds_priv->saveLVDS);
-
-	if (lvds_priv->savePP_CONTROL & POWER_TARGET_ON) {
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
-			POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while ((pp_status & PP_ON) == 0);
-	} else {
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
-			~POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while (pp_status & PP_ON);
-	}
-}
-
 bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				  const struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
@@ -473,7 +432,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 
 	connector = &gma_connector->base;
 	gma_connector->save = gma_lvds_save;
-	gma_connector->restore = psb_intel_lvds_restore;
+	gma_connector->restore = gma_lvds_restore;
 
 	/* Set up the DDC bus. */
 	ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
-- 
2.36.1

