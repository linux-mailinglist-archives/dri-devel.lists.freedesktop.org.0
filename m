Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B5C3289C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256610E313;
	Tue,  4 Nov 2025 18:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P9VSbt8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A241E10E649
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso48083055e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279813; x=1762884613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=;
 b=P9VSbt8wb6gIt5CbHQqzglZWb+W/M9kdHBlQxvnvY4CkqtNDQFSBEhj8cu9aOyg5bo
 QjN2IEvUAy2rvB0ktHYNfgn8MUk8B7tYyvCxhnRdgMhqukh1zNZ3EqAJjJ3bj8U4vP4E
 sDS712iHtXZ4XnkrrVqwv585hyR9QSB7br/0jP/rf1+IDl45arsyNWTEAOaHb1IvMkQq
 8wisz7VgbeMc7GvGnipaZ8gi32QZcXEXdGl2b+Iz7YWw/wVtz/5nNkCGigBaiu48su0d
 QUKKdG1fepfwBTTXMtlQvMiSzpHPs1Wf/ZRZJ1FjCT+rAu6KI1VXoRHRY0JAn8SwxYks
 0Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279813; x=1762884613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=;
 b=twUT1SEDVi2ScsPlGHqGWix2wr9A52hg+Qu/5BnMu6kSFol8O5KYiG9vt5nXv8SoIs
 73xwRMQR9WdSInzX+mcSJqfEDNnBvi9uAM4RS15guT1D0Mn9jtw+Peq85BTR6UBrrtRO
 AM0LOXz6RC5WgCu94Wh59BVJXkPj8h9XWAYiTaSpe47/eOLiRgaGgKolAI/8gSsOyBQc
 VN6z7I4qjo46dtGBDgRINVNrCYEExI0f8vNoYr6P9Ci/whXjo6vxrrltMJQCjM+jhLDQ
 0CmvPnmjU9UpnmddK5MsYT8rG1URFgMOIfiqacwuo4qpi3fV8rnND1+DLoHcLiffVEhj
 SIFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8zXbGjq0kQ47VeabcEqj9S/Rt55e4JxG0yf1Ynh/puDuop4QYt/o/go3/r6ozIlEopLKvkbJY0yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVBqoWPZ72vmDPSIVrAn9stFxe4uyTrLLUpFeEPWMMAIXNW+Aw
 4Vhlh7qHsW7q3pc7P0jFs7d/z0Lhc9Ju3hT3QNmu2S3CrKaprs083iZ1
X-Gm-Gg: ASbGncvbqE5JiTNsRlLe4ZduACb4ZEOdb1r4BdCMHP182WN7KR7WYQYPjk+jEiZ6Nfh
 qMoVqqd0cuwp18Ec+38HJYhLAlEwP0l6hbQTgNk5pDRwwVOsbkEBvbdtstEieC2/uwviKQnNjEm
 hDInhH93mCp0YX/TJBNgq/PWwVljfkS8HViDU39QUw1dKFlI1oNfaYuwQ8H0ase/PGdD36yqpVf
 UPNZEq0l3AaKB1JeUBPaPDhX/e+41hvnW5kqDy5AIKx+A2IOO7baj5zxVeHOYKhH5ISY5QvjJYQ
 q0fotCu2TaKybQzEpKhbus9wV/UXiUjy5tqW1BqA3gpMgyvV/s/W5Z/1BYZFm6l9hP5HvEy56PY
 dopd8vDuZ3tznHi2Yu0QJrCtau5t4ODDqqriTyidHAWYaWpIOvmXwbNDzw+gY36YfDaMcpab3ja
 JEVEjwRG1xZJOWP9Wp8kLxIwiXeBl6
X-Google-Smtp-Source: AGHT+IHUjkvK3LuEYexNwytgkWNuB+3vDFUmi2M1K/MsCvY3IVkIm6wl0qrMfqC1Lyu5Q0aWPSh04g==
X-Received: by 2002:a05:600c:a05:b0:475:da1a:5418 with SMTP id
 5b1f17b1804b1-4775cdbd551mr2245645e9.1.1762279812965; 
 Tue, 04 Nov 2025 10:10:12 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 09/30] drm/sun4i: vi layer: Write attributes in one go
Date: Tue,  4 Nov 2025 19:09:21 +0100
Message-ID: <20251104180942.61538-10-jernej.skrabec@gmail.com>
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

It turns out that none of the VI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework VI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 71 ++++++++++----------------
 1 file changed, 27 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1f4fa63ef153..dcc4429368d6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,34 +18,35 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
+					     int channel, int overlay,
+					     struct drm_plane *plane)
 {
-	u32 mask, val, ch_base;
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *fmt;
+	u32 val, ch_base, hw_fmt;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	fmt = state->fb->format;
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
+	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
+	if (!fmt->is_yuv)
+		val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
+	val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
-		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
-		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
-			(plane->state->alpha >> 8);
-
-		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+		val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
-								  overlay),
-				   mask, val);
 	} else if (mixer->cfg->vi_num == 1) {
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_MASK,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA
-					(plane->state->alpha >> 8));
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
+			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -194,23 +195,14 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
+	u32 csc_mode;
 
 	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
-
 	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
 	if (csc_mode != SUN8I_CSC_MODE_OFF) {
 		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
@@ -220,15 +212,6 @@ static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel
 	} else {
 		sun8i_csc_enable_ccsc(mixer, channel, false);
 	}
-
-	if (!fmt->is_yuv)
-		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
-	else
-		val = 0;
-
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
 }
 
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
@@ -340,12 +323,12 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_vi_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_vi_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_vi_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
+	sun8i_vi_layer_update_colors(mixer, layer->channel,
+				     layer->overlay, plane);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2

