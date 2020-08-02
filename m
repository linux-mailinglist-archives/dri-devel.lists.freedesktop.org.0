Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A223566F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830176E0EF;
	Sun,  2 Aug 2020 11:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D18B6E0E9
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:23 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id k13so19052494lfo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=npI6VOcegl4YGVYoILAiqXWE1lvdo6hW9xcFBHV1OoA=;
 b=AN+khlCQEbXr7e6UcMRseSUHNqGy5FWEun+QuXbS/fmVjqzlrKZoSEQzR8AWDU4zMs
 a8aVUavSCfp5xowSEj1eblnyQVGj/vMDR5e2R/UGjz6jKO8+TwTlaZb/hZv2D2XxOr8O
 wn/qgycitV1qpQ5zeqQE/CK0ugzFlKfF9NsJJSQ22+vu9oactetZwVDIzDjrfYr20ADZ
 jWCpgTfr9QZt882/1tj7s7k3MDPanplz6EN6pP4Y1do01DPcD9t3r9CnM3qDp0fdE34P
 Bgk85eJnQiX2ZV8P+21gKkxnckzDKAEtBOKOIVITmD/HqPdUevGuixEEf2QKluvmampa
 87Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=npI6VOcegl4YGVYoILAiqXWE1lvdo6hW9xcFBHV1OoA=;
 b=ujVYlIDCuM4UcpiGL/symJnjQAtMrFo1tc9Kvm3Zmt8CFHbYkCj2Z1bsb2m+UYI4np
 4W/7yp3FdqFb2jtnwce6/nZyZQbbXprYAR24+FDCBxnPzlVO47TxMAUKambnzuBLM93/
 UwaX4iKPENkAjo9a7D5SN/IUefi+xfjVb9yLZ6qBoIM0hCM6wVf9td3LxmOXWRQJzUIk
 xxYbFXbjAvCME2Tly7OndOjVo0Uv6vZdvR1BJWHCqKHErwX1azs6IXs0GMLfdrciy3sO
 WmRW5kizPaOrVrZGpCTmdS0643KAXB+ih5hiJ1N52E7PjzKEsQ9eWW5P00Hs4I55mEGY
 1diQ==
X-Gm-Message-State: AOAM5317KbJsuMea+fBUDriyk0ijzGyirsutDRYBnbUrL4mp9KVmWnN3
 oE22mad7DREQV31OAtkcTdf6rWvuYlg=
X-Google-Smtp-Source: ABdhPJxaQlny3OBp4u3KQc963J/q0ZMzl+XzKG9vPRJ7YRdlDAtzmB5ViPR5GVtmnuLyG4JKA7lzUQ==
X-Received: by 2002:a19:ac02:: with SMTP id g2mr6033758lfc.155.1596366441297; 
 Sun, 02 Aug 2020 04:07:21 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 07/22] drm/panel: jdi-lt070me05000: Backlight update
Date: Sun,  2 Aug 2020 13:06:21 +0200
Message-Id: <20200802110636.1018743-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Vinay Simha BN <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update backlight to use macro for initialization and the
backlight_get_brightness() operation to simply the update operation.

Moved init of backlight device so it comes after drm_panel_init().
This is the order that is required by drm_panel.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 4bfd8c877c8e..bacb1b5bc524 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -329,7 +329,7 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	int ret;
-	u16 brightness = bl->props.brightness;
+	u16 brightness = backlight_get_brightness(bl);
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
@@ -349,7 +349,7 @@ static int dsi_dcs_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, backlight_get_brightness(bl));
 	if (ret < 0)
 		return ret;
 
@@ -367,12 +367,7 @@ static struct backlight_device *
 drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(props));
-	props.type = BACKLIGHT_RAW;
-	props.brightness = 255;
-	props.max_brightness = 255;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 255, 255);
 
 	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
 					      &dsi_bl_ops, &props);
@@ -431,6 +426,9 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return ret;
 	}
 
+	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
 	jdi->backlight = drm_panel_create_dsi_backlight(jdi->dsi);
 	if (IS_ERR(jdi->backlight)) {
 		ret = PTR_ERR(jdi->backlight);
@@ -438,9 +436,6 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return ret;
 	}
 
-	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_add(&jdi->base);
 
 	return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
