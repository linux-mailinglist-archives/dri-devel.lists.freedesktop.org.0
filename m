Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF132BD0B2A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51EB10E1BD;
	Sun, 12 Oct 2025 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R2BtYXzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ECD10E1BB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b3e44f22f15so514477466b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297043; x=1760901843; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=;
 b=R2BtYXzQ2NHdpMS/24VqxB//Ids42HpDF9VXJSZs5wAt1EmMgCpK7ewJ/b2ddMBE4M
 fiGb7xTMKZzPDX1vEvxk4ncZrxkKb9UVKynkSjkt4mKCSp3ObbLZ5p+ucT5esQyHthvk
 pGAo4bxruxUEr0awMAguTV5rB9XVkDvw6Caz3hIFiK8R8awHkYw/V0nE7HuYeMQniGpq
 k6GpBpDqcPMIM6K5r/ciiRVPzxed4MbCk7rK9dWkA0+pOizNUl10jRh9MIdTmOlOEZWS
 A0gbrS63eZzdn82IrbwOUzi3ADj7nMoxAjW0c94upxaKzAIC5s6wOMnvIA5KCcaGOYyw
 tq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297043; x=1760901843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=;
 b=c1yWftMsabqEtp8gcQu8MANw1gFP4KyyJFD2LD5+C0qKWvy13DH1ofZJ1OK17fUZUb
 IPMw4CVlCB8rmcM+rpsSt9IodZVnQH57qEIsUk+iXPpuh91kQ1nZyh7Z8WizD4OSKBQd
 2ciXUu9mTSewWyNWeSiIUEkJyyz9WvIBTRP/zvUT/LsHvgUHJlo3KjXACuz2cLKxxlnt
 Tps6sRZvW2zg8OMonXS8AgmprtPDS4fS3XFmQX0VznfVaHe6sxMU4KUqCf2rQg+0P48G
 ahp8+FJ85BugyEHhipCAiD7bzw3TQ9qz4MkdERmCsQTX0HC+xY4lESR/bWo1Idv4Zul+
 BUBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPMPlMvE7Fjd/iiZ3jSdSb0T4Chpz4LR8x58FZjzdAFlJNHoEawr67rtnUB+TQ5UoHIcKJWOOSvLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3oOGtYDzg5oB9rKIlZ/PIIDBpD1+8IBwM1AJJsfOkCX2a1a2s
 HxZpSyBez6zsE1FIvdqMFnF7vhAPCH7OS1/aqy4pjYTicAX6JF7fxRU9
X-Gm-Gg: ASbGncuEMVAqge541TNlq1GpFX5iCPKvQZDwirQC3ZjQuzwWXq5TIqBq6tzF1Oz0/oY
 0QHOxeN52b51fnJMBposHHoKhL9qEYCvUQmAxQGSeGrXfWpmByw7vFKE+KE5vzL6txWuSORVRFz
 G48rTt+eSpOC0WQqeQ6DPcotr6kXJeRe7YxopfpqYD2FX4K2f0iJ82Kv6OwSLkdNEVYtHruXj4W
 h4f25bOlZQ4jc8OdkTmQygfep9DV1Fhoqwr1kjnEYFIpvKSeeAKVWxPXn33N/QlWsXZwEghXTZd
 6vVnxQE7cYTl27vWEDWu34uIlq2BpJ9G0Wtbca/aLcRfwFgDLsCfrGTNUZ4HKxupzHNzm072aD6
 RJXWvFeVPbkddnNugtlDiNXmu1WR9yoynlbi8r5fImiF1uF++Y4KDC/b/cvr0za7brOXITRw2SE
 fwgtTQxm9bLwuZtEedP542LjORKaZh960TbJP/VhRaBw==
X-Google-Smtp-Source: AGHT+IFPlXF14w6080DzNThJvuRd4CnTuWjkOojD58VBx0OnrlrRgYOo8wgfu/qp0NZs9oaJy8dhYg==
X-Received: by 2002:a17:907:72cf:b0:b42:1324:7986 with SMTP id
 a640c23a62f3a-b50a9b61f8emr1913954466b.6.1760297042759; 
 Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 19/30] drm/sun4i: vi_scaler: use layer instead of mixer for
 args
Date: Sun, 12 Oct 2025 21:23:19 +0200
Message-ID: <20251012192330.6903-20-jernej.skrabec@gmail.com>
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

Layer related peripherals should take layer struct as a input. This
looks cleaner and also necessary for proper DE33 support later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 10 ++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b938e3dae9c..5167c9d7b9c0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -103,11 +103,10 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		vscale = state->src_h / state->crtc_h;
 
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
-			sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h,
-					      dst_w, dst_h, hscale, vscale,
-					      hphase, vphase,
+			sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+					      hscale, vscale, hphase, vphase,
 					      state->fb->format);
-			sun8i_vi_scaler_enable(mixer, layer->channel, true);
+			sun8i_vi_scaler_enable(layer, true);
 		} else {
 			sun8i_ui_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
 					      hscale, vscale, hphase, vphase);
@@ -116,7 +115,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			sun8i_vi_scaler_enable(mixer, layer->channel, false);
+			sun8i_vi_scaler_enable(layer, false);
 		else
 			sun8i_ui_scaler_enable(layer, false);
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ba9c03f04f03..ce71625fa06f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -162,13 +162,12 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		hscale = (src_w << 16) / dst_w;
 		vscale = (src_h << 16) / dst_h;
 
-		sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase,
-				      format);
-		sun8i_vi_scaler_enable(mixer, layer->channel, true);
+		sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+				      hscale, vscale, hphase, vphase, format);
+		sun8i_vi_scaler_enable(layer, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, layer->channel, false);
+		sun8i_vi_scaler_enable(layer, false);
 	}
 
 	regmap_write(mixer->engine.regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 82df6244af88..a76677a1649f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -909,11 +909,12 @@ static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
 	}
 }
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	base = sun8i_vi_scaler_base(mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_VSU_CTRL_EN |
@@ -925,16 +926,17 @@ void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
 		     SUN8I_SCALER_VSU_CTRL(base), val);
 }
 
-void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 chphase, cvphase;
 	u32 insize, outsize;
 	u32 base;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	base = sun8i_vi_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 68f6593b369a..73eecc4d1b1d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -69,8 +69,8 @@
 #define SUN50I_SCALER_VSU_ANGLE_SHIFT(x)		(((x) << 16) & 0xF)
 #define SUN50I_SCALER_VSU_ANGLE_OFFSET(x)		((x) & 0xFF)
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
-void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable);
+void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format);
-- 
2.51.0

