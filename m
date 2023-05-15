Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88475702895
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BAC10E18B;
	Mon, 15 May 2023 09:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1BE10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:29:58 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4efe8991b8aso14877739e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684142993; x=1686734993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9cHgRTt5ciQcLth2917TOaI71QUNMjPwJlxqviRQlkI=;
 b=cSqShpTOI8Qp1A4BovqjgmYBLEVspYUBWl8ze433vBCnCcZmetofZfwPc8xTP1U+WI
 hdUwuRw5Lo/kwnwaZoZy7LAIx5r4u9AalZ/cuhUqa0wmywYXt2DnfB7QQh5whmjqQE3X
 +tpokuNbiehrP1gN3igiNQNIRRRJekYbuQmHAPbniecT4qyQM5xtLoLhSBSQvt6zh7Va
 aRBJkMX3/Rt8y6mZZZDdM6p2vs5uRek5ZuCnEDu0krwylfqKuDcWziB/VctZT1BmlwCc
 itdd9AJfdWVkCTAkJuVZLfZOjFw9i7uVu0cAbVLeiJ1pRPM5WMYASk5lidOw+JstPCZB
 NhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142993; x=1686734993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9cHgRTt5ciQcLth2917TOaI71QUNMjPwJlxqviRQlkI=;
 b=Uy8gZYU5mc4aYuLirqGTrW6N8KuO12TRhTQptYuHHnm5Er7bTQHxOOBOSvw1Dre1iB
 8LzK5sMybDoR3XdyrN1DwBCRVsUvk84qOK1wwE3+PwkmF/wFtvLDetDFrCiKZn4+13f+
 dKWM3UPM8/Dl0KqtAE9Rd2EH6FrhG92uWfogBeGw0zByjpK/UGRYjtit3rIHtRFpHcaG
 0Xd46aFnLqY7lo8wHZ4D39vnE31+pSVi3A9mQhx5XX77Y+CSBSNKa44AmTdwdKQ1f5wF
 sviCJb/FX8QEVvSyrNsN45EI9yR/cba3CQ4Fv7gmv39N44YHvUqvYF2AS6d9ERPtDsJ1
 apDQ==
X-Gm-Message-State: AC+VfDz/lJQEJTdweZOGR8/DB/yo207t4m8mSH1iXZ5GgtJNb5zEkRmZ
 nWOIaLsyuamLEIajW8LmSZ3LoQtOL293LzfliIY=
X-Google-Smtp-Source: ACHHUZ7HbfNI2S8ZI6vYnnU5B4f0S/n0M0PYa+0OWdGAyOatpYbQDDz4ChTPE7d35/eCOiyR8D6dMw==
X-Received: by 2002:ac2:4ac7:0:b0:4f2:5442:511d with SMTP id
 m7-20020ac24ac7000000b004f25442511dmr168349lfp.29.1684142993381; 
 Mon, 15 May 2023 02:29:53 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
 by smtp.gmail.com with ESMTPSA id
 2-20020ac24842000000b004f134f7cff3sm2508926lfy.167.2023.05.15.02.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:29:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/pl111: Fix FB depth on IMPD-1 framebuffer
Date: Mon, 15 May 2023 11:29:43 +0200
Message-Id: <20230515092943.1401558-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last argument to the function drm_fbdev_dma_setup() was
changed from desired BPP to desired depth.

In our case the desired depth was 15 but BPP was 16, so we
specified 16 as BPP and we relied on the FB emulation core to
select a format with a suitable depth for the limited bandwidth
and end up with e.g. XRGB1555 like in the past:

[drm] Initialized pl111 1.0.0 20170317 for c1000000.display on minor 0
drm-clcd-pl111 c1000000.display: [drm] requested bpp 16, scaled depth down to 15
drm-clcd-pl111 c1000000.display: enable IM-PD1 CLCD connectors
Console: switching to colour frame buffer device 80x30
drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer device

However the current code will fail at that:

[drm] Initialized pl111 1.0.0 20170317 for c1000000.display on minor 0
drm-clcd-pl111 c1000000.display: [drm] bpp/depth value of 16/16 not supported
drm-clcd-pl111 c1000000.display: [drm] No compatible format found
drm-clcd-pl111 c1000000.display: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-12)

Fix this by passing the desired depth of 15 for the IM/PD-1 display
instead of 16 to drm_fbdev_dma_setup().

The desired depth is however in turn used for bandwidth limiting
calculations and that was done with a simple / integer division,
whereas we now have to modify that to use DIV_ROUND_UP() so that
we get DIV_ROUND_UP(15, 2) = 2 not 15/2 = 1.

After this the display works again on the Integrator/AP IM/PD-1.

Cc: Emma Anholt <emma@anholt.net>
Cc: stable@vger.kernel.org
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format selection")
Link: https://lore.kernel.org/dri-devel/20230102112927.26565-1-tzimmermann@suse.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/pl111/pl111_display.c   |  2 +-
 drivers/gpu/drm/pl111/pl111_drm.h       |  4 ++--
 drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++++----
 drivers/gpu/drm/pl111/pl111_versatile.c | 10 +++++-----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 6afdf260a4e2..b9fe926a49e8 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -53,7 +53,7 @@ pl111_mode_valid(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_device *drm = pipe->crtc.dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
-	u32 cpp = priv->variant->fb_bpp / 8;
+	u32 cpp = DIV_ROUND_UP(priv->variant->fb_depth, 8);
 	u64 bw;
 
 	/*
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index 2a46b5bd8576..d1fe756444ee 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -114,7 +114,7 @@ struct drm_minor;
  *	extensions to the control register
  * @formats: array of supported pixel formats on this variant
  * @nformats: the length of the array of supported pixel formats
- * @fb_bpp: desired bits per pixel on the default framebuffer
+ * @fb_depth: desired depth per pixel on the default framebuffer
  */
 struct pl111_variant_data {
 	const char *name;
@@ -126,7 +126,7 @@ struct pl111_variant_data {
 	bool st_bitmux_control;
 	const u32 *formats;
 	unsigned int nformats;
-	unsigned int fb_bpp;
+	unsigned int fb_depth;
 };
 
 struct pl111_drm_dev_private {
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 4b2a9e9753f6..43049c8028b2 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -308,7 +308,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	if (ret < 0)
 		goto dev_put;
 
-	drm_fbdev_dma_setup(drm, priv->variant->fb_bpp);
+	drm_fbdev_dma_setup(drm, priv->variant->fb_depth);
 
 	return 0;
 
@@ -351,7 +351,7 @@ static const struct pl111_variant_data pl110_variant = {
 	.is_pl110 = true,
 	.formats = pl110_pixel_formats,
 	.nformats = ARRAY_SIZE(pl110_pixel_formats),
-	.fb_bpp = 16,
+	.fb_depth = 16,
 };
 
 /* RealView, Versatile Express etc use this modern variant */
@@ -376,7 +376,7 @@ static const struct pl111_variant_data pl111_variant = {
 	.name = "PL111",
 	.formats = pl111_pixel_formats,
 	.nformats = ARRAY_SIZE(pl111_pixel_formats),
-	.fb_bpp = 32,
+	.fb_depth = 32,
 };
 
 static const u32 pl110_nomadik_pixel_formats[] = {
@@ -405,7 +405,7 @@ static const struct pl111_variant_data pl110_nomadik_variant = {
 	.is_lcdc = true,
 	.st_bitmux_control = true,
 	.broken_vblank = true,
-	.fb_bpp = 16,
+	.fb_depth = 16,
 };
 
 static const struct amba_id pl111_id_table[] = {
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 1b436b75fd39..00c3ebd32359 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -316,7 +316,7 @@ static const struct pl111_variant_data pl110_integrator = {
 	.broken_vblank = true,
 	.formats = pl110_integrator_pixel_formats,
 	.nformats = ARRAY_SIZE(pl110_integrator_pixel_formats),
-	.fb_bpp = 16,
+	.fb_depth = 16,
 };
 
 /*
@@ -330,7 +330,7 @@ static const struct pl111_variant_data pl110_impd1 = {
 	.broken_vblank = true,
 	.formats = pl110_integrator_pixel_formats,
 	.nformats = ARRAY_SIZE(pl110_integrator_pixel_formats),
-	.fb_bpp = 16,
+	.fb_depth = 15,
 };
 
 /*
@@ -343,7 +343,7 @@ static const struct pl111_variant_data pl110_versatile = {
 	.external_bgr = true,
 	.formats = pl110_versatile_pixel_formats,
 	.nformats = ARRAY_SIZE(pl110_versatile_pixel_formats),
-	.fb_bpp = 16,
+	.fb_depth = 16,
 };
 
 /*
@@ -355,7 +355,7 @@ static const struct pl111_variant_data pl111_realview = {
 	.name = "PL111 RealView",
 	.formats = pl111_realview_pixel_formats,
 	.nformats = ARRAY_SIZE(pl111_realview_pixel_formats),
-	.fb_bpp = 16,
+	.fb_depth = 16,
 };
 
 /*
@@ -367,7 +367,7 @@ static const struct pl111_variant_data pl111_vexpress = {
 	.name = "PL111 Versatile Express",
 	.formats = pl111_realview_pixel_formats,
 	.nformats = ARRAY_SIZE(pl111_realview_pixel_formats),
-	.fb_bpp = 16,
+	.fb_depth = 16,
 	.broken_clockdivider = true,
 };
 
-- 
2.34.1

