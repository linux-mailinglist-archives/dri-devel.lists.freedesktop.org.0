Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB7A34FB6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9CA10EB97;
	Thu, 13 Feb 2025 20:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QkmrupSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F3110EB97
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739479529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6GCPcEGJeCWftND3V2gkT0st58A+Xn2QYm2CZoqiCo=;
 b=QkmrupSYvfav2KqUqUKO2jP5ZoFjHh9589GXh5fAImPs20SvGCQcomhj/7l/ssNN5y+rNw
 IG0sXJMX/3dyF1efAoo+YVYsvbp0sUTJZzMwvXutPzD4BRkrftGlR/UFuBY1GSu294XBfn
 Fnq19AxiTYLD73cMI0RPL6mrmPK1U/E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-7z8RvOnQNDeAd_9ndwHB3w-1; Thu,
 13 Feb 2025 15:45:23 -0500
X-MC-Unique: 7z8RvOnQNDeAd_9ndwHB3w-1
X-Mimecast-MFC-AGG-ID: 7z8RvOnQNDeAd_9ndwHB3w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3AAC51800878; Thu, 13 Feb 2025 20:45:21 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DB05819373D9; Thu, 13 Feb 2025 20:45:17 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:27 -0500
Subject: [PATCH 10/20] drm/panel/jdi-lt070me05000: Move to using
 mipi_dsi_*_multi() variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-10-67d94ff319cc@redhat.com>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=5573;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=YVnKv7P3SUbw4bNZwHLVNWFwRROtVegbCdxCq54aHYE=;
 b=fdE0kRRKI/LvRq5N0CJWwbh8Li1YIammtmPOzedaPuKxZxlUvyO3ibO6ZBQEfP0ux77u2RrRm
 4ZUOg/B3EDzDQ40wyDQ/LXX86SsOCypeVLGvAMMYTWqW/lgckNPX551
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop using deprecated API.
Used Coccinelle to make the change.

@rule_3@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
(
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_set_display_off(dsi_var)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
|
.....//rest of the mipi APIs with _multi variant
)
<+...
-if(r < 0) {
-...
-}
...+>
}

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 81 +++++++-------------------
 1 file changed, 21 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index b1ce186de2616be03fa9f94d0e0724141e9dcbac..86bcd472875b422c7edefe9954dd0f769bcda5b9 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -48,34 +48,22 @@ static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)
 static int jdi_panel_init(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
 
 	usleep_range(10000, 20000);
 
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT << 4);
-	if (ret < 0) {
-		dev_err(dev, "failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, jdi->mode->hdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set column address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, jdi->mode->vdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set page address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,
+					    MIPI_DCS_PIXEL_FMT_24BIT << 4);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0,
+					      jdi->mode->hdisplay - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0,
+					    jdi->mode->vdisplay - 1);
 
 	/*
 	 * BIT(5) BCTRL = 1 Backlight Control Block On, Brightness registers
@@ -98,39 +86,21 @@ static int jdi_panel_init(struct jdi_panel *jdi)
 		return ret;
 	}
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	msleep(120);
 
-	ret = mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x00}, 2);
-	if (ret < 0) {
-		dev_err(dev, "failed to set mcap: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x00}, 2);
 
 	mdelay(10);
 
 	/* Interface setting, video mode */
-	ret = mipi_dsi_generic_write(dsi, (u8[])
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[])
 				     {0xB3, 0x26, 0x08, 0x00, 0x20, 0x00}, 6);
-	if (ret < 0) {
-		dev_err(dev, "failed to set display interface setting: %d\n"
-			, ret);
-		return ret;
-	}
 
 	mdelay(20);
 
-	ret = mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x03}, 2);
-	if (ret < 0) {
-		dev_err(dev, "failed to set default values for mcap: %d\n"
-			, ret);
-		return ret;
-	}
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x03}, 2);
 
 	return 0;
 }
@@ -138,33 +108,25 @@ static int jdi_panel_init(struct jdi_panel *jdi)
 static int jdi_panel_on(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display on: %d\n", ret);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return ret;
+	return 0;
 }
 
 static void jdi_panel_off(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	msleep(100);
 }
@@ -317,13 +279,12 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 static int dsi_dcs_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,
+						  bl->props.brightness);
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 

-- 
2.47.0

