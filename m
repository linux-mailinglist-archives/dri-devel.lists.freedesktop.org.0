Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5EBD0B06
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EBE10E19D;
	Sun, 12 Oct 2025 19:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VxnLic0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC1D10E19E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:50 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b4aed12cea3so575820766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297029; x=1760901829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=;
 b=VxnLic0Oa1g57b6bxMFR5GasXpr5+ZDON3iwaOejfCWcMF0vsXYr1ZyFISWtMJBNQE
 AVPGrPAhHhGjVh8q11lYU4lqtMfekC50r37vBcPYWwGTE+pFaCZnz9GzwdLXOaaqEAlZ
 7OXEcMizsyM9o5agBq/Lk76M2GpV1oJHlAMC2YZdi0Mke9043xaAoLgVjwGYfK7un4pP
 WIo7iiKzX8+8tvSe33dZ+NYEZA6nLmoU+yoc7+8hGPbnTS+piSQpssiaGoLQG+KMTNUH
 xYjK3r5juGSVyYB7WlhTG+076V8UsJpwaHzqZRXklxqR/59NURDWtB5WCe1Xt4iZNPXa
 25lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297029; x=1760901829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=;
 b=lTmS2w+TTD+hVSVYuBW/+P7WY9GZ1AVODj0oJYsWYGL97JdRIzJXkRaPS0DkvZf7qu
 wx8HwRU2/P+FhthDzG7WXWt7TSLmQBoYHtgTt1VFdQeUAXSb6MjeycFUpRVBqVXnfGFr
 80ZatIhVSvKDn0Z8R0kGRFanadNZPwkvLmQwZKV6OFlfWJawQHOx9Wqw9kHZl5cRTLdC
 Iq9T7UX9Hx48Z4u78dNR9y8NVL22inJDLHV/jRXuFBo4p+unBuOLgj2zdQp/vsTwZusl
 zOXZjCpIVpUzrC0QTOuDM9S158D+pRUS0ExrfUMjdVja5x2yLqntIQsUSWJcdUXFq9mL
 2Mbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfLjLBXkWh+etYHdHjpRpk4nZb+K+sbQ+mse7qYIpAJoKGx3xkrqbUFaM77n/hkoXCKhKS7agg6gU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmjEsDTBBpNkujW3p484vEE2Jj61IU+sEFGeMAslODZkmYJqGD
 /s+BO8Y8fIfQftRmVGrQnSrYwm4K7kklKJ5eawOyqhT7N+bd/J3nKxBc
X-Gm-Gg: ASbGncvaDXXnJ4cp3ZxsRIVS5gJSzN/vxbPTK0XxnNnqh2vLlF79C6sCXqCfzleFf0D
 WYdEcWe5Owob12pKU3WtB9/SOFaQh+upCQoC2hBQmNsPD1x8GfS7uaSvYi/J6uLNh39E/3woiZV
 NcjYWSm6xgHJFGxrXJVr9u7TJ49ZfJsbdqJ3XyN9txhaQCMuKQyDAKCL6WzLvzFhTk4rHxsBe9y
 BTZ63SC/sFSLtkQtknKYBve2zYiElOpc7XrvpruvJEdRerH4mb/w/GCkNlLct6dOFlrzE9HbPMt
 +f0rYhjKsfaPwFwmj5gcVIclkDHLThviU/mdNpRF0+QxbUjQqUrOAUkALN7JbIbLyr3vJYgdtYe
 6xLDC1vKLp6uaamL9SrpbVKd2KFeb4OavvBkIltizlBuDutagW4b+WfcnC+S0aNVMkijnMakocs
 yKTfXyln4QBkO4tkNKzrJvtJkqVgJbaeiekdYgka3Tng==
X-Google-Smtp-Source: AGHT+IF7Qq6jQqzYZdDrJkaw6UlpFKkxTue0qnLTmhRFyadA1ihDqW2+FAH2PNlrJyvCEAGwchJGLg==
X-Received: by 2002:a17:907:980f:b0:b3e:c99b:c78a with SMTP id
 a640c23a62f3a-b50ac5d07e0mr2126585466b.54.1760297029128; 
 Sun, 12 Oct 2025 12:23:49 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:48 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Sun, 12 Oct 2025 21:23:08 +0200
Message-ID: <20251012192330.6903-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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
2.51.0

