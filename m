Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BF8BD0B39
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B62910E1CC;
	Sun, 12 Oct 2025 19:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aBYkiHst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73BA10E1C7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:15 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so596647666b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297054; x=1760901854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=;
 b=aBYkiHstJjc/WqBuarKnEcq7Wfe6aPvGjlEBeOELEK+Fhoj0+50DXEYyp4tcTLu2aj
 OKSiUA97myIbCbCCO7fYyCTOmWIQ36sK9STV08+Xy/uvaZTXL5+j3mT4sFbP4crrBmgF
 vffQHR0OuxxMJg//eSun9g4L0d0h0IyRrLUnDbyeMjWgZwnUfzp/0GiNkZRJBjwHyQLY
 AZvuX1f5aU7b9hD8VSdm33YpMnyA576orUIhu9cNrGArwazFu+Rv7DAz9icGVKMMiEyC
 nyNQYllzMXt9rUTWftdMprqENTuoiblONmNykHVJzRgjtXrHl9Hd937YCW0p1O0oyyDW
 a8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297054; x=1760901854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=;
 b=HJt7h2p6kdTIYQkGgRbM4sALql6aUAwi50871KzaUOraBitJgqog8s/lCSQQe0h9XP
 Lwr5WzvcnBg5/cdvDrpnB7eCwxvMNkiD00ppmfPkRlFEYjZjd4tdwNw1FTdSSC4tSmeN
 v+JroWrIGHT31V6wCyjUz/WrvwydTgC+dVpXDq5/vF7HlpjHA3nBF44oGChoZLvKb1J3
 ZzyaH8RfSvieYgPzJcjLS3vMuTdyFs1iyvis1oVWOo5jT2d65uEvTbgIdE2hURp8z2WF
 EQz8+f6Sy+1u3oywTLP/fthU5i9q5mn6cEUSjsijtbE2vnztub/OUuHNbvqkd6MwArsa
 y1BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVew2ZhQpuQYnaDpBBMXQn1jFQy79jp8tTjr8RE5JtOw5URW2mL4mTYOWS4ggGayJu1tqnLgCO55sE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpMLVOG4m0j3UmjL4g4fAH7S9BFbVO/dMzIGWye2g2OzMHlnGG
 gLrpBHhEZLfkfYd/J2QEjtsC/b1iEsvi3kX4MK8vB6F0Jpvrbz2Zf7iv
X-Gm-Gg: ASbGnctNsgbHIu3XPkSChPCdUBN56OS4al9nBB9K9W2YXe8HoYWoFOvZzrSyjMxiy/a
 s8Hw/JBbXCpGLcp5zUITkNB0NkvU2xZ5tQcxm0+DzugdcbxqfFSngMIUaEXsyOm/LJKU1VUF/y+
 2E2ag5szRIm0Wa0vzH0I9KLh1AIhJt4LMQUtIfsSkqKqJqz/FJRsQ3eKVJiAzK4exVaHvu8WAn/
 ci/3Wlq0z855qmBSlVCmM7rnKNbya8CGC77/Hkquby/KmhrnIMaQseJcEMX1C0UDFwx4vvoa8Ml
 KL+j8GCaIJjjcJvoEnp4XPjaCaKYViBPrg1UFNigReVFXUwz7XTuhBX5Q1ZogrrYAIXMGhKXsSJ
 F2a+/Icg+OlOxhYqb5u8DzrIHxfW19hA3sbRUizQ0+iLuq8mn3ymnK3IkJoz2JB0W3of3bYpWSJ
 +8Vfbl36/OGlOOhgX+f170
X-Google-Smtp-Source: AGHT+IGliGTnpTGRawNal6hhCfPRYBSBq/r1s8fnX2W1RihxLmu9ewXMj4AGe/8If5EcaR6rduNrqg==
X-Received: by 2002:a17:907:94d2:b0:afe:7b8c:a583 with SMTP id
 a640c23a62f3a-b50aa48cbb6mr1956645266b.13.1760297054099; 
 Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:13 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
Date: Sun, 12 Oct 2025 21:23:29 +0200
Message-ID: <20251012192330.6903-30-jernej.skrabec@gmail.com>
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

With "floating" planes in DE33, mixer can't be stored in layer structure
anymore. Find mixer using currently bound crtc.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index afe38ea03beb..4534998af825 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun4i_crtc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -62,8 +63,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(state->crtc);
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
 	const struct drm_format_info *format = state->fb->format;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
-- 
2.51.0

