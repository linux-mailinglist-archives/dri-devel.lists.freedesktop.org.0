Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39B661146
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8391910E90E;
	Sat,  7 Jan 2023 19:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFDA10E35A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttV0XcYX1fJWmH88XgdEow2vXwmHcFArdkGg5SIJWK0=;
 b=WVeuH6eeyHlMZEAaU5jLkrElosbTBGfwZSDtFXkbjDzC5Ye2uJRH5XOy88uA71XLOXqceF
 hLO2vIzdrClekjkxshRVPYAzdywkbrRDQYE8dRhHgS2Oo4vss2kGR5qKJ++T5FvvDKof9h
 2z9m2CXnz5W9XQjVgXyZ7CbM4unvwZ4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-2_H5AgoUNLm3nst_luSJ0Q-1; Sat, 07 Jan 2023 14:18:41 -0500
X-MC-Unique: 2_H5AgoUNLm3nst_luSJ0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so2722739wmb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ttV0XcYX1fJWmH88XgdEow2vXwmHcFArdkGg5SIJWK0=;
 b=gmgFD78cJjJ3QbWOYz2s1Xtttu87ChCFHxkNxCe8kxFntmBT6isLgxupn3dSx2cNVn
 /CH5zJllPA65fRdkbAX5EXTUGxisPA9exGCxwBvUrz1mKzbKfWllvJXOs2MHfNGwhLjO
 9xtS7XGvv1HzpwmvEcVcCVSYpzSJavDSpCWAe9eGMI8OXi2s9V5Jkp9CD9naeGKGzWVG
 wWBlv9gteL+zEfCN7W1ueJdt7AV7MMoT/e6jWACn6oRjVvU2P4yoIWG0tshcHBdDCa6F
 4xD1QsY0fhx9rmzHh9keQZj+rs5hHKCj7jeIEcxu434FIsxBEO9ZcwtIaT5QccajtgOf
 CAJA==
X-Gm-Message-State: AFqh2kp+jcz1Pb6MvL5E5ftsCaSc9MUm9i9huVmoG5khZPry9XPuEGly
 EZv9gunWamv7xLoVOBF+x2CxHwkYUFVmFx+rncsZP+JNSexGEoEs2Gx4fmNIteSiKsIGWjYpLTf
 WAtNO0YqRoNz1IiJHqVQqokqq7y9y
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr45485997wmq.33.1673119120698; 
 Sat, 07 Jan 2023 11:18:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsqRumGFiFSh2jflHPYUHsPzJdMy9PeAGY0Mpa8khexDGjR9FKqpABGnvJs8fvLrfT0jXlJ6w==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr45485988wmq.33.1673119120509; 
 Sat, 07 Jan 2023 11:18:40 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] drm/panel-jdi-fhd-r63452: Drop custom DSI write
 macros
Date: Sat,  7 Jan 2023 20:18:16 +0100
Message-Id: <20230107191822.3787147-8-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107191822.3787147-1-javierm@redhat.com>
References: <20230107191822.3787147-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are macros for these already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macros defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
- Add Sam Ravnborg's Reviewed-by tag.
- Fix identation on macro usage (Sam Ravnborg).

 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 58 +++++++-------------
 1 file changed, 21 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index d8765b2294fb..8912757a6f42 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -29,22 +29,6 @@ static inline struct jdi_fhd_r63452 *to_jdi_fhd_r63452(struct drm_panel *panel)
 	return container_of(panel, struct jdi_fhd_r63452, panel);
 }
 
-#define dsi_generic_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void jdi_fhd_r63452_reset(struct jdi_fhd_r63452 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -63,12 +47,12 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	dsi_generic_write_seq(dsi, 0xb0, 0x00);
-	dsi_generic_write_seq(dsi, 0xd6, 0x01);
-	dsi_generic_write_seq(dsi, 0xec,
-			      0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
-			      0x13, 0x15, 0x68, 0x0b, 0xb5);
-	dsi_generic_write_seq(dsi, 0xb0, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xec,
+				   0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
+				   0x13, 0x15, 0x68, 0x0b, 0xb5);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret < 0) {
@@ -76,7 +60,7 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
 	if (ret < 0) {
@@ -108,10 +92,10 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
-	dsi_dcs_write_seq(dsi, 0x84, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
@@ -127,10 +111,10 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 	}
 	msleep(80);
 
-	dsi_generic_write_seq(dsi, 0xb0, 0x04);
-	dsi_dcs_write_seq(dsi, 0x84, 0x00);
-	dsi_generic_write_seq(dsi, 0xc8, 0x11);
-	dsi_generic_write_seq(dsi, 0xb0, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x11);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
 
 	return 0;
 }
@@ -143,12 +127,12 @@ static int jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	dsi_generic_write_seq(dsi, 0xb0, 0x00);
-	dsi_generic_write_seq(dsi, 0xd6, 0x01);
-	dsi_generic_write_seq(dsi, 0xec,
-			      0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
-			      0x13, 0x15, 0x68, 0x0b, 0x95);
-	dsi_generic_write_seq(dsi, 0xb0, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xec,
+				   0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
+				   0x13, 0x15, 0x68, 0x0b, 0x95);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
 
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0) {
-- 
2.38.1

