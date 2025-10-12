Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21269BD0B15
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373610E1AD;
	Sun, 12 Oct 2025 19:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MU41i65w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E610E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:48 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-639e34ffa69so5473806a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297027; x=1760901827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=;
 b=MU41i65wECf5WXwJNwOJxa/H2UUah7jXlAYWqjwABrFjALVKELMTpzSYfV//VSXmy+
 9ozXJCJn5sUn78Y1wiDpRlxVtE2HgyxjjBoP83Na/noxhsP0+o5J0BEuexxQXeOv6F0I
 TS6pQtQHlY8nXCIUomNCf1j64eaYvODEPoant1h6xmngdCtaLaG/M4tFxPVBqstuW8vc
 5zTCQ75uj+FKXn3Lv8nx9gGphjrT4eURQ2DPA0P/NFyc8Y4txnV+oiSGjygI+BoO/aqx
 Yhtg82bgH+k48dKzODIagIohUKZ/N0crQvOi6vsVaEYIhbUHzerFV01UPNv0C7KUvyYL
 8Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297027; x=1760901827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=;
 b=tPrlTI2m7W5UHnBgRKa/3PgISYIaPCYxhQX3opDTUSsDtDDuMWhEgyzwp0p5eTjvdp
 UZuLbRfDWXegQ7s5vrDNuu/OdLLrCs/W+QBTjLj3SsUGCCdvZgBvgfwJAZ5r/MrwPo77
 mlARmmiC/gKakMn1r0XcrbfR94YfOFoxjec23P2hGnqNURpEgwmyvUA4Swm0YFTjHhcI
 riCed+7mZQuY8uVKXICR1rbAi0F/MwJSiTMqensOrk9KiKpnBYn9+Qvxaloqn1ff7Upy
 am4gvW1hMMvZ9jPuI07ReviaVLO6XOkHsIUdoxkQDbmq3392oNgxHvxYHZ1SolXp5qZC
 NO8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu1qXDOGCVZTxQIrHo62wgqsEkTZArMu2ECCaXmn/4mrjwzVPk7vXfNScWBHkxMiQbjYrGhG7ufv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydr3q9837PzyIlW8gFxKEXhTtdchwVoPyOETbJliXYahKO7QRb
 P9Cspd10BazOLylVjWkgLHeJKcMSmEJ+jZh4LQtVaYLJan/xjH9sPADp
X-Gm-Gg: ASbGncuc8r7xSA+yp2U/roFLgc/4RMFpma0xDTXSuorzta+nHny7brh3vc9osxd/2BU
 GFnL2L3057z4lntMxyKHWEHu/M9tc4jVn9/DrFqwN1NYMTtLnKuHyZa7OYPMRsi2vKKkypkYPoN
 a6NUFtMq52ereyI96EaX+vBT4afE/KkoY/XeOIRzdxjDB0uIW9W8s3kszii2Hg+uvC67kOaPJuu
 7nhgiAe8+Ww0tk9x5og8sngiSdvd+pmHnQUoEx/EuiBjDD4THh9ZvO6g/P29X0UxekFbCvPFjGN
 GIglzr5GSLGx2DbavluHD+jaVUPPU7W2UrC5ENbehPn4aLgKTJlXIm7oOt5XNMdVcmp3TzZGQEq
 Ve8r6DlRvDUyb1HCefTqGy/GXfdWOg+DC5E4arvlcKJsPwa6vPO6I1uBXMxEdwGnMvjuiIOGFMo
 5OShubSuowndrh19SeiIhv
X-Google-Smtp-Source: AGHT+IFUbJ+FjAjKKsg6YJWZVxyDF8HU9W9iTbhFx8UICuTNacj1eC7uib49tuv2zK9lGVgNU785TQ==
X-Received: by 2002:a17:907:72cf:b0:b04:61aa:6adc with SMTP id
 a640c23a62f3a-b50aa69e311mr1981823466b.7.1760297026601; 
 Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 06/30] drm/sun4i: layers: Make atomic commit functions void
Date: Sun, 12 Oct 2025 21:23:06 +0200
Message-ID: <20251012192330.6903-7-jernej.skrabec@gmail.com>
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

Functions called by atomic_commit callback should not fail. None of them
actually returns error, so make them void.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 20 +++++++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 +++++++-------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index fce7b265c5d8..8baa1d0b53bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -46,9 +46,9 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 			   mask, val);
 }
 
-static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
@@ -124,12 +124,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
@@ -144,12 +142,10 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -184,8 +180,6 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
 		     lower_32_bits(dma_addr));
-
-	return 0;
 }
 
 static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index c80bdece5ffc..dae6f83cea6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,9 +48,9 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
@@ -191,8 +191,6 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -211,8 +209,8 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
@@ -246,12 +244,10 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
-
-	return 0;
 }
 
-static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -305,8 +301,6 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 								 overlay, i),
 			     lower_32_bits(dma_addr));
 	}
-
-	return 0;
 }
 
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
-- 
2.51.0

