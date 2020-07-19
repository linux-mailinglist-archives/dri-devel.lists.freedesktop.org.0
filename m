Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE022589E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D4F6E24E;
	Mon, 20 Jul 2020 07:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 503 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jul 2020 17:14:16 UTC
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953BF6E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 17:14:16 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id DF38B261D4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 17:05:51 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 3E3EF3ECDF;
 Sun, 19 Jul 2020 19:05:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 6C07D2A3B7;
 Sun, 19 Jul 2020 13:05:48 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1595178348;
 bh=ELid77VVNx1YqQOuhBe9RsMJyM8XGB3o70MJQYb+aSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eiG6FIV1vosAbrlmJwsm/wKN0XpWi3TSovx82MTQ4k/EfDix9FaxUK3eFKXyGqmei
 yh+0qWrr8pTshIrTeETpmqrXAfAFW2R61uw8Rxw27uDTinnWGOGkmKPI+AnFPvko2g
 AVaT2Z7YlKtZCNugYyU3wxIGL7qMShLYNtS4N+fQ=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nThCY5Q6kNSb; Sun, 19 Jul 2020 13:05:47 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sun, 19 Jul 2020 13:05:47 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 405A540B41;
 Sun, 19 Jul 2020 17:05:46 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=aosc.io header.i=@aosc.io header.b="P8jCNWOJ"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.163.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 74C9440856;
 Sun, 19 Jul 2020 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1595178276; bh=ELid77VVNx1YqQOuhBe9RsMJyM8XGB3o70MJQYb+aSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P8jCNWOJReR+5ws3sHnR5DPKdnVjun1ZNOfRVIoUjIRq4asnZDvDvMS0pgQ1Mh46h
 4JqkGsxyUxGZ7UrHgB3QvQabO/61SqqJVIv/g/7hWN846TWF2qfpzOjtuB5sHHuDR1
 AFZ8lcQMXf75aablWf8Si0LzjnX52wUxYwfIViZs=
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/4] drm/panel: ilitek-ili9881c: prepare for adding support
 for extra panels
Date: Mon, 20 Jul 2020 01:04:07 +0800
Message-Id: <20200719170411.275812-2-icenowy@aosc.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200719170411.275812-1-icenowy@aosc.io>
References: <20200719170411.275812-1-icenowy@aosc.io>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 405A540B41
X-Spamd-Result: default: False [6.40 / 20.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 ML_SERVERS(-3.10)[148.251.23.173]; DKIM_TRACE(0.00)[aosc.io:+];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[gmail.com,ravnborg.org,kernel.org];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.163.116:received];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[aosc.io:s=default];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[aosc.io];
 MID_CONTAINS_FROM(1.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
 RCVD_COUNT_TWO(0.00)[2]; SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: mail20.mymailcheap.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There're more panels with ILI9881C controller than the Bananapi one
supported by this driver.

Extract the mode and init sequence part, to prepare the driver for
adding new panels.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 56 ++++++++++++-------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 3ed8635a6fbdf..4f8e6865029f1 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -10,6 +10,7 @@
 #include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
@@ -20,14 +21,6 @@
 
 #include <video/mipi_display.h>
 
-struct ili9881c {
-	struct drm_panel	panel;
-	struct mipi_dsi_device	*dsi;
-
-	struct regulator	*power;
-	struct gpio_desc	*reset;
-};
-
 enum ili9881c_op {
 	ILI9881C_SWITCH_PAGE,
 	ILI9881C_COMMAND,
@@ -45,6 +38,21 @@ struct ili9881c_instr {
 	} arg;
 };
 
+struct ili9881c_desc {
+	const struct ili9881c_instr *init;
+	const size_t init_length;
+	const struct drm_display_mode *mode;
+};
+
+struct ili9881c {
+	struct drm_panel	panel;
+	struct mipi_dsi_device	*dsi;
+	const struct ili9881c_desc	*desc;
+
+	struct regulator	*power;
+	struct gpio_desc	*reset;
+};
+
 #define ILI9881C_SWITCH_PAGE_INSTR(_page)	\
 	{					\
 		.op = ILI9881C_SWITCH_PAGE,	\
@@ -64,7 +72,7 @@ struct ili9881c_instr {
 		},					\
 	}
 
-static const struct ili9881c_instr ili9881c_init[] = {
+static const struct ili9881c_instr lhr050h41_init[] = {
 	ILI9881C_SWITCH_PAGE_INSTR(3),
 	ILI9881C_COMMAND_INSTR(0x01, 0x00),
 	ILI9881C_COMMAND_INSTR(0x02, 0x00),
@@ -311,8 +319,8 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	gpiod_set_value(ctx->reset, 0);
 	msleep(20);
 
-	for (i = 0; i < ARRAY_SIZE(ili9881c_init); i++) {
-		const struct ili9881c_instr *instr = &ili9881c_init[i];
+	for (i = 0; i < ctx->desc->init_length; i++) {
+		const struct ili9881c_instr *instr = &ctx->desc->init[i];
 
 		if (instr->op == ILI9881C_SWITCH_PAGE)
 			ret = ili9881c_switch_page(ctx, instr->arg.page);
@@ -368,7 +376,7 @@ static int ili9881c_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static const struct drm_display_mode bananapi_default_mode = {
+static const struct drm_display_mode lhr050h41_default_mode = {
 	.clock		= 62000,
 
 	.hdisplay	= 720,
@@ -380,6 +388,9 @@ static const struct drm_display_mode bananapi_default_mode = {
 	.vsync_start	= 1280 + 10,
 	.vsync_end	= 1280 + 10 + 10,
 	.vtotal		= 1280 + 10 + 10 + 20,
+
+	.width_mm	= 62,
+	.height_mm	= 110,
 };
 
 static int ili9881c_get_modes(struct drm_panel *panel,
@@ -388,12 +399,12 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &bananapi_default_mode);
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
 	if (!mode) {
 		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
-			bananapi_default_mode.hdisplay,
-			bananapi_default_mode.vdisplay,
-			drm_mode_vrefresh(&bananapi_default_mode));
+			ctx->desc->mode->hdisplay,
+			ctx->desc->mode->vdisplay,
+			drm_mode_vrefresh(ctx->desc->mode));
 		return -ENOMEM;
 	}
 
@@ -402,8 +413,8 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	connector->display_info.width_mm = 62;
-	connector->display_info.height_mm = 110;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
 
 	return 1;
 }
@@ -426,6 +437,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return -ENOMEM;
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
+	ctx->desc = of_device_get_match_data(&dsi->dev);
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &ili9881c_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
@@ -467,8 +479,14 @@ static int ili9881c_dsi_remove(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
+static const struct ili9881c_desc lhr050h41_desc = {
+	.init = lhr050h41_init,
+	.init_length = ARRAY_SIZE(lhr050h41_init),
+	.mode = &lhr050h41_default_mode,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
-	{ .compatible = "bananapi,lhr050h41" },
+	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9881c_of_match);
-- 
2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
