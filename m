Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86723C328D1
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704C410E65B;
	Tue,  4 Nov 2025 18:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a3gc8Gys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A183C10E651
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:33 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47114a40161so10724275e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279832; x=1762884632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=;
 b=a3gc8GysHk3IbLFhAXCwkcYPIE6+8BuDtOMBZt63uhnJod2D+FxirPXteuR3dHNmS1
 YnE1oy3Ne/e1XpqsWzqpHSS2Bimo5SNY+IfYJk51jb9xQGwaJwi2YN3v7nw8kuo5tFic
 VcyQFnsBxfrlCRwByH3y82uFiH4KeL7T1A4U4HP8hcTibBNaKxdeganEszXELW7JO6L9
 Q6EcnTbIyqDL8ZYbiYjvwkH5fTvnG5q9L65PTLDzD8ltBDq6BiAO8+yReTzVbJ1itLsf
 0W4FnmrnC8QcrzOumkfQTunqB7SC218MhQc4jdMkG40VxQuxKx5/24RxNti5DN5iglb8
 9+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279832; x=1762884632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=;
 b=H5nXmYGRvjLvHg/gJa6ugH3S1EZ2JbdRPxOCC3Vm8Ox+TsJIDWvFcyg1nnjTPqQzuU
 TldPHSHBYQng0N08/Ag/TPb0lgT/hjtmDTN5LJO+yTTElgbW8f23ulADnfAcgmD4bgF8
 uCoQJbApu6yj2XvjfJUUUx4x7QRSGAZYnSCjn9t8NCmFTbn/AFnhJAWyCTNsGSrBCWeo
 57MCrjOarXZ2tHKMhNMjKDETGzjFSj9iktaS4FZ5Q4El64fdYLs995vaPGrggrU/+etC
 c1wZNSuoSKPYDPV6HKtYukmkMy8ureP2LiWfBH44Xhj6KdcyMtzPDmUDo8rCuWJGFHwA
 whcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIeyeQJZwNCFOq6fwvmXMLYEqbWUfoB88fL2e8s3UEpsxyQzfXrQJk4arpOmOZ8vcq149omnvNBiQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu0vVDCayDvcT4gfm/3Eb6M4PQ92zb6QJ5RQccHSOA1gG6EXAZ
 3zhhYUsojZhkZlVqycj+9ACF2jL6OhRP7MCf2wnUv+e0KiPXvTtMlIRrUd1fqA==
X-Gm-Gg: ASbGncvSrJOGIIQchcSy9MkYtGYqNmWs/jsKbrVxL3nZOMauoFYNFtm3ehNk4sb3H+1
 8XgSSHX0fKu1hS+DdgdW7+kkTWWsr4Nr9/bEHgPLd8JjV4yAFmIkC4jkcHdeUtzdiyV+9aJF46H
 Abg0BzQnBxbB32sDuaTXNwHGebXX75jo5h7F6V4ILrGzrME4uClx6DQD/zGh+edZ32P9C6TU/3n
 51jc8SU44bnkIhq4980rya02zaJvrgUi3uXBDiA304HNVO76JS/IlpxEkS1vTIbYdBmtAXTc6ZX
 RK+UWhdKimg97/cXlOxa2te1i6sS+XVHt+VZHLKyyQW6LHxqeZO2C3uZ6BBHU98Nz9FVYtXzcG3
 MADKOEX3vKHsF0mXa0npj3ZoK/rH3UVQ7uRA402DGj4h0X9R0OKgjfUKIren41jcdKjzWVpnoxi
 DV7VEsZZTqoCOQFdjWYQ==
X-Google-Smtp-Source: AGHT+IEWn71DBw19df7j5vHe6/KdNSpZp9M6RzMXn87h8SZBHIPpRNzHDnrglGnelBkuvtMKpO/7HQ==
X-Received: by 2002:a05:600c:a00a:b0:475:d7b7:580c with SMTP id
 5b1f17b1804b1-4775cdbfademr2635395e9.12.1762279832100; 
 Tue, 04 Nov 2025 10:10:32 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 24/30] drm/sun4i: mixer: Convert heuristics to quirk
Date: Tue,  4 Nov 2025 19:09:36 +0100
Message-ID: <20251104180942.61538-25-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Determination if FCC unit can be used for VI layer alpha depends on
number of VI channels. This info won't be available anymore in future
to VI layer driver because of DE33 way of allocating planes from same
pool to different mixers.

While order is slightly changed, it doesn't affect anything due to
double buffering of registers. New order keeps related registers
together and quirk separate.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- updated commit message

 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  9 +++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 +++++++-----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 267a6f75feb2..78bbfbe62833 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -707,6 +707,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -716,6 +717,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -736,6 +739,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -746,6 +750,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -766,6 +771,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -776,6 +782,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -786,6 +793,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -796,6 +804,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d14188cdfab3..def07afd37e1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -176,6 +176,8 @@ enum sun8i_mixer_type {
  *	a functional block.
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
+ * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
+ *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -186,6 +188,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
+	unsigned int	de2_fcc_alpha : 1;
 	unsigned int	map[6];
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 44e699910b70..8eb3f167e664 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,14 +48,16 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-	} else if (mixer->cfg->vi_num == 1) {
+	}
+
+	regmap_write(layer->regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
+
+	if (mixer->cfg->de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
-
-	regmap_write(layer->regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
@@ -450,7 +452,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (mixer->cfg->de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
-- 
2.51.2

