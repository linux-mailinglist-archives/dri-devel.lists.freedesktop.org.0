Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F3BD0B3C
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7645A10E1CE;
	Sun, 12 Oct 2025 19:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cvu5BvtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8604F10E1B9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:06 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo663973266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297045; x=1760901845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=;
 b=cvu5BvtFjjpHtCj6GC5XbsL4/MOWuZFNcng0vEIHq1yLpIVZ0ToiXwRuQ0aXH8P3PY
 DqyYANn9aduMIlJkKwAMqDDdXJBe2TuMzP6okJ9pZ2qcT7b7GI6kMkaOuzY1R8imec7x
 AvHgQbqmrqz6WL07Sj0lAKemImNadz7Wrw0ptFEK3zknUYI1XGtuciiqOmjmItfi/GRV
 QnmERCa3g3LX0i0WY6hoDYPH19WxbVDpFrioIT1AhwuT9z/8oSXyLuWMFKMs+41t6KGG
 f6M2xgwmc9EkYFArV8q5WEOl3ZffpJR5XOIs+S1fiC+ZL7DM9Me3aumIeQ0VwpwK2MbS
 dhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297045; x=1760901845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=;
 b=X+9p555kWM6FIAbvEFz3OV3VMcjhjc3OvM3NGFXaKzr8kpp88nUO4PVfVZHt4sa5vS
 sYozZt0KAJy48jpkZ4Ga63cUfcx4hge4o7qnjdvoIXOVIn1jHRBHjhnJKqM3o3N+EusP
 kItCFtSWug6sTaQTs3m/zgT3/Z7w2N/hS3g9swm2P2I0yYL4CmZeSs6f24vMUJkGnC1G
 eDeIJDJgSGxHLEgopb34/39JJdZunIe2gv2qoxq7Uw+xLigSYUESmqABrIVBOnI7U5VV
 7RD4jfKXJsv+9g/w2MswOJ5+3NT3MWkkykVH3F3GHtsHiZQVGXJzik81Sn1wDVcAx4pS
 m/eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBzs2xD/Xyp/eMuiCLNp2vZOOE+wbMVgvZPA9i8hJPU9dESHeTpGJwyr4G9Slz53zkOxE7C/OT+JU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzInw85c/zZREL4lhEOKB3Zfa9mPt+KvfqTnFr/4sqEIskGYMDz
 fD2jS16spINe6gV7DAJtlza9L/3gukRe+bcYiDkUr4nW/9OoYp31iyXg
X-Gm-Gg: ASbGnctO3xj7MkM+sZgPjwERAE3L435yEHGxHtla3LTp0ESmEG8HFPx7U+PRwDW3Onk
 GkYa1G6YLu+96eP04Rcipbju48+YbDqXxzTM4T72ibytpFUV6I49h0HFQDMe/HrG/hkmsh71Sgo
 nUOA9Jy4RznNqX3JPNzdptBk5KE27icZUS/UkjINfaziHORvoHwLtLZo2ImdNQo/FcxDG+98IXw
 /qp5ehUfVGi5Xt9CFrPDsAP9BgDiVD7Xla44WAA/HLsjlfGpsfGrc0radEZdyPCOx7v6OPqOQUC
 A2TDc+l5mz3tfbNo/8VKtNmv6z1MS9ULoX6MRGsAMPaSRs47pTZYs09VviCiDfyAMHzaQodueMV
 oV2JkEHWtiINRAcB31qmNFI1hcF5KOVhUxz16LLEDooOy9fCp7d+CuOJUoMUp2STqcHZhq868T9
 37/D1kBy8kbG4ZGu70WEYGKkwccegPXx4=
X-Google-Smtp-Source: AGHT+IHvhXW73NXWnN/w1+a157WT7XVAMC9an0CwaQWq1dgdtB3ecG7lOa+m5GizVxeaSFFM+lpHgA==
X-Received: by 2002:a17:906:dc90:b0:b41:873d:e21f with SMTP id
 a640c23a62f3a-b50aa292f1bmr2074832566b.18.1760297045043; 
 Sun, 12 Oct 2025 12:24:05 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:04 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 21/30] drm/sun4i: csc: use layer arg instead of mixer
Date: Sun, 12 Oct 2025 21:23:21 +0200
Message-ID: <20251012192330.6903-22-jernej.skrabec@gmail.com>
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

Layer will be more universal, due to DE33 support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ac7b62adc7df..c371e94b95bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -227,22 +227,22 @@ static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 	}
 }
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state)
 {
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
+	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
 			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index ce921521aaca..2a4b79599610 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_color_mgmt.h>
 
 struct drm_plane_state;
-struct sun8i_mixer;
+struct sun8i_layer;
 
 /* VI channel CSC units offsets */
 #define CCSC00_OFFSET 0xAA050
@@ -23,7 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2290c983e177..4f0c929faf36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -301,7 +301,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_vi_layer_update_attributes(layer, plane);
 	sun8i_vi_layer_update_coord(layer, plane);
-	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_csc_config(layer, new_state);
 	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
-- 
2.51.0

