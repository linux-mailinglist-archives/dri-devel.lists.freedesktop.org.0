Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3876C328A5
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D1810E64F;
	Tue,  4 Nov 2025 18:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="geHsnKBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B5110E649
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4711810948aso41623865e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279812; x=1762884612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=;
 b=geHsnKBa3Htmw+HfJbjg/GDdqiYpJQmixyoieqwD0kzNNNxHSvke4XgfuB7vEsxjL9
 r0yhGtTxZD+UnR7lFgKhwFR9vrjWrMOlRqWgV7bQ5O5GxeudeXz6HjbZuKzy/9XlqpDU
 f2NDeyNRF+lASvKJwxfCACMafCtTBYmcrr+Kb3cagVPSyvTh6P5TZ+LZ6PvcuLt16inI
 sS6RwGpGH7mhSGodwpZycyeFl+jb3zUuA/5L8B6IX9iHZMv6wvVsM24eUyLPUllLggnw
 UqjVvj4TVwSGpmgxTAdf7qRY06QGNF/CaVlBCXqPj/3Vux/z9wqmw2iS+2nTItu+urR6
 xZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279812; x=1762884612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=;
 b=Qdg2JQfSgDRy9+TOI+LbfalLxF5Xl7Ksom2gmfuy535iC3kuQsOt4OS7M/utWiDm6A
 N5GlpxpgliGgOZFcaBpVQjznv199ibF1gzkYLrRyQmPP7klcT/14o3s9Bo8qKSdwnz8x
 2PhKlmzaQKP4nhu/LN41bZvdzPGEPvLCiWtHe49huIAQ3lU2ZtzwVvMrvOl9l8+xPf+e
 EvRnt4KNO6O8CiNtEz+SoAEYorR/WcfJaxy+EMWqZoNGEGCRVb0GhvMchxcs7t/g9TNB
 +6pNX1c65Ez0XFuYp/J0TzKQAsx5AaysuvXmewwZ+45aE85h0YhwSLJW6qMTVosJz9xx
 t4fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGKwaN26xH0zf0Hby9gxsIrskyUZ4qoEOgNrzqI/M7HmbWPWUijLRiHc8mvKivqLONYqPR4ROMdYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFdxNAVhCs+68p9fUXjB7QR4aD1NjebTYiJcRQavtYqa6PwdTA
 NPnxEOSGm2cCn5ud+4CYhdZ4QjzFbwWLHCUfTGHitcZifCjCj9BIxa3eEbE0CQ==
X-Gm-Gg: ASbGnculkkUKiHcxdXKotM+SJj+6MII+gBPJTvjQ3rkecJcumZD5aZe48zFlEl0lxi3
 3LkTeASpY0qroOa+9lFQBoyTruAB2RMVzAXiUv5wCari2KSKuye4a61QhQCkAo0Ca7ovj1ruvWH
 AfdxQaldJNWa5S/3AjSboxsEpKgLBB3J/UXsasX81DQeoyTanH40qH6pDl/ovPrd64Cz5wl8tT8
 dMmKNrOrdsQrRe+3M4FDmMC+q87PLVCNGiNYeN3rOVLQbBweiFMhi6DaYamnpHhVxLeGvPW8hko
 awUWMSclJK6WnwoO9GWXtTQIIImkSFHoimmkykDjvv0gkxw3ofj+lo3VN8kj5cY8EAmACUh/Wkd
 x/ya2wXTR9PFMLRHmY5IVsWfDLOJY11pnC/Y9sSIlLN/jqBbJjPTI9kNNm1BOr+iw3PjKDzDkB9
 fFp7BikonIRsMlsVek0A==
X-Google-Smtp-Source: AGHT+IFZg22fNOBq2/+K7yxgA1ojsJmdSdVgUH3x4JG8OH5BRdNvWipWSBISKSpBHgCgvYmvB7tQTA==
X-Received: by 2002:a05:600c:6990:b0:475:de68:3c28 with SMTP id
 5b1f17b1804b1-4775cdad710mr2567035e9.8.1762279811690; 
 Tue, 04 Nov 2025 10:10:11 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:11 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Tue,  4 Nov 2025 19:09:20 +0100
Message-ID: <20251104180942.61538-9-jernej.skrabec@gmail.com>
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

It turns out that none of the UI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework UI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 12c83c54f9bc..8634d2ee613a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,25 +25,27 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
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
 
-	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
-
-	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
-
-	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+	val |= hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
+	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   mask, val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 val, ch_base, hw_fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
-
-	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-}
-
 static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_ui_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_ui_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2

