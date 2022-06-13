Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C1548529
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C921510E752;
	Mon, 13 Jun 2022 12:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A30610E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t25so8591106lfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P94lshXWehyxnVEtahyQ4jexFcrvEQPySe8lL7qMBNQ=;
 b=CeBb5/98aD7vTiw8RyvpqrWC7kZ5IlcxDNs6dU6xQWaPHu8IB5dlpQoB8rcwyHv077
 UmBTfvqG6VSdsmYRTw40UkFwBePXxH4qv1IMJqQ20PkUaw9TQXWoqrpACZYPiD5XYMW5
 vq+1/1oGwDD180gBKUF9QqmA7bf+M4udqsnahclL8F2oImflFmE2GNGVH6jLE4ePGmnw
 Rn03sTuhuFa2szoUa+Czv4Vsoc3ucxBth2hyP0Nrg7fxzhU+Xh4ZfpePy9zz4J1Mf99O
 0J7E51380Qzp9PtDgc4uy4R9uEXW+jSxPpBrwLrS6odFSCzTl1UdJ8dHQjLPKjfsGMX2
 MprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P94lshXWehyxnVEtahyQ4jexFcrvEQPySe8lL7qMBNQ=;
 b=SKABOsWMEH4KCjwUnAZUCq0OUTNIoais04Swov+9br6O1Yutr/khZbiTz8cTEoz9V9
 KLRrkBfPxw0fVXhB8n41yFjtARfwEROaHirgC0Aj2iErNYtXz+kKRmbcT7npgcztAaHH
 91hq5glJ0EZMj/oHHUSTHDkZoMqVkmm71YjOMj4wqwjukzBJ8nQxcTy5sNTIvQfZQ01G
 MoEDA8YkT6aafE4de2/U97WjvpntMVltdb5H0pwLFi0jbf4pWOXalsel2PT8iJS7BJCH
 J7DxrIcvwgN5K0Qb+aGlSIX8mV/ud5b1GDQWr3CzHaE6PPHLKYOAMP8KdYMK/8SQy50M
 ztSQ==
X-Gm-Message-State: AOAM5327WFiV/Nf4M5z8x7kgnI9ZrBaoSj+3S8kwUFtWYs173fI6z1sH
 Pat6MReE9J8xS3s5epJ4uROO7qJmZGE=
X-Google-Smtp-Source: ABdhPJz69m3snq560VWdZrdG02iqZCJ6zdVNr1e/QlTSUZHfdkI8ndD/Hcnl7KLdYdevT5tKskynmQ==
X-Received: by 2002:a05:6512:b95:b0:479:65bd:ac2f with SMTP id
 b21-20020a0565120b9500b0047965bdac2fmr18734870lfv.445.1655123686400; 
 Mon, 13 Jun 2022 05:34:46 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:45 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/19] drm/gma500: Unify *_intel_lvds_save()
Date: Mon, 13 Jun 2022 14:34:23 +0200
Message-Id: <20220613123436.15185-7-patrik.r.jakobsson@gmail.com>
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
 drivers/gpu/drm/gma500/gma_lvds.c       | 38 +++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 40 +------------------------
 4 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 59d30fa0eb53..777eb7cf7d7f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -53,10 +53,6 @@ struct cdv_intel_lvds_priv {
 	uint32_t saveBLC_PWM_CTL;
 };
 
-static void cdv_intel_lvds_save(struct drm_connector *connector)
-{
-}
-
 static void cdv_intel_lvds_restore(struct drm_connector *connector)
 {
 }
@@ -398,7 +394,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	gma_encoder->dev_priv = lvds_priv;
 
 	connector = &gma_connector->base;
-	gma_connector->save = cdv_intel_lvds_save;
+	gma_connector->save = gma_lvds_save;
 	gma_connector->restore = cdv_intel_lvds_restore;
 	encoder = &gma_encoder->base;
 
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index fb8f8bb599eb..bd08ed049c5e 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -129,3 +129,41 @@ void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
 	/* XXX: We never power down the LVDS pairs. */
 }
 
+void gma_lvds_save(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
+	struct psb_intel_lvds_priv *lvds_priv =
+		(struct psb_intel_lvds_priv *)gma_encoder->dev_priv;
+
+	lvds_priv->savePP_ON = REG_READ(LVDSPP_ON);
+	lvds_priv->savePP_OFF = REG_READ(LVDSPP_OFF);
+	lvds_priv->saveLVDS = REG_READ(LVDS);
+	lvds_priv->savePP_CONTROL = REG_READ(PP_CONTROL);
+	lvds_priv->savePP_CYCLE = REG_READ(PP_CYCLE);
+	/*lvds_priv->savePP_DIVISOR = REG_READ(PP_DIVISOR);*/
+	lvds_priv->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
+	lvds_priv->savePFIT_CONTROL = REG_READ(PFIT_CONTROL);
+	lvds_priv->savePFIT_PGM_RATIOS = REG_READ(PFIT_PGM_RATIOS);
+
+	/*TODO: move backlight_duty_cycle to psb_intel_lvds_priv*/
+	dev_priv->backlight_duty_cycle = (dev_priv->regs.saveBLC_PWM_CTL &
+						BACKLIGHT_DUTY_CYCLE_MASK);
+
+	/*
+	 * If the light is off at server startup,
+	 * just make it full brightness
+	 */
+	if (dev_priv->backlight_duty_cycle == 0)
+		dev_priv->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
+
+	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
+			lvds_priv->savePP_ON,
+			lvds_priv->savePP_OFF,
+			lvds_priv->saveLVDS,
+			lvds_priv->savePP_CONTROL,
+			lvds_priv->savePP_CYCLE,
+			lvds_priv->saveBLC_PWM_CTL);
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 3babb522ee84..52422986be1e 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -12,5 +12,6 @@ void gma_lvds_set_power(struct drm_device *dev, bool on);
 enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
 					 struct drm_display_mode *mode);
 void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
+void gma_lvds_save(struct drm_connector *connector);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 2470ab0e1e0e..c00b00d70a30 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -148,44 +148,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-static void psb_intel_lvds_save(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct psb_intel_lvds_priv *lvds_priv =
-		(struct psb_intel_lvds_priv *)gma_encoder->dev_priv;
-
-	lvds_priv->savePP_ON = REG_READ(LVDSPP_ON);
-	lvds_priv->savePP_OFF = REG_READ(LVDSPP_OFF);
-	lvds_priv->saveLVDS = REG_READ(LVDS);
-	lvds_priv->savePP_CONTROL = REG_READ(PP_CONTROL);
-	lvds_priv->savePP_CYCLE = REG_READ(PP_CYCLE);
-	/*lvds_priv->savePP_DIVISOR = REG_READ(PP_DIVISOR);*/
-	lvds_priv->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
-	lvds_priv->savePFIT_CONTROL = REG_READ(PFIT_CONTROL);
-	lvds_priv->savePFIT_PGM_RATIOS = REG_READ(PFIT_PGM_RATIOS);
-
-	/*TODO: move backlight_duty_cycle to psb_intel_lvds_priv*/
-	dev_priv->backlight_duty_cycle = (dev_priv->regs.saveBLC_PWM_CTL &
-						BACKLIGHT_DUTY_CYCLE_MASK);
-
-	/*
-	 * If the light is off at server startup,
-	 * just make it full brightness
-	 */
-	if (dev_priv->backlight_duty_cycle == 0)
-		dev_priv->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
-
-	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
-			lvds_priv->savePP_ON,
-			lvds_priv->savePP_OFF,
-			lvds_priv->saveLVDS,
-			lvds_priv->savePP_CONTROL,
-			lvds_priv->savePP_CYCLE,
-			lvds_priv->saveBLC_PWM_CTL);
-}
-
 static void psb_intel_lvds_restore(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -526,7 +488,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	gma_encoder->dev_priv = lvds_priv;
 
 	connector = &gma_connector->base;
-	gma_connector->save = psb_intel_lvds_save;
+	gma_connector->save = gma_lvds_save;
 	gma_connector->restore = psb_intel_lvds_restore;
 
 	/* Set up the DDC bus. */
-- 
2.36.1

