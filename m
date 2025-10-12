Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BDBD0AFA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D9F10E19F;
	Sun, 12 Oct 2025 19:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TPv0O0P2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFBC10E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:46 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so668381366b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297025; x=1760901825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=;
 b=TPv0O0P2AQWBRTt3bOQP8tnBywETt8tEhCVPGq/kQh1rmScNlW0KPk0TcnjeWpW60B
 M9G1qF8GzfLI0OxJrhKZ8UTheIe7hDTUNxTBG/3uPfFP3sxg41hVcBQowObliI9e19QR
 qigcUjfzwr3I9FXl0zS2rYJMWmRs/yoyWo6Oylgwelaaazb88HnIpuHqXJyr/ig1/ztR
 zc74fkI+sexCYgLcdzAjRLEItwuAvsA0plMAMVqrXVIgCTrZ19mqPeYL02XW28NUOS3K
 R8VrAr5IrjFDYr1x+pqxHVfD2FWGwInavz7EjyoddGV1+kZibn8MTGdgOgCcKjxf6AVw
 9bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297025; x=1760901825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=;
 b=hJR9PWaFQnDdMtQFsiUxb8NfTPijAOqMAoek3Q0BsHChJvyARLe65jChtQo8DtnEAH
 kpiOgxZCn1UsWEuBOvEzh1INtXWNs7UPk+P9Fk/cNnILHabNpRpwofcDCE2ArorsvhnO
 ClPXf0zBclznm+CVXWNYsDcMC8s/zHohcp9GOqkYC7pSJ239V7SkSES5AWFOYR7nA6NN
 ypwJMZ73h4oDf5u35stzOnUQLGjfwrkJvdW/AJqp6Aw/f2dkwqhSBL7VpKNKa9S/RZep
 Evktj9CVg0eQ3F8YXwkAH1bvSSARO1Nsnkus8xLgsYVVvgq5OfYjoJvesG2xdzMHKIk2
 sCxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ9LZxUHUywQjWCAPTZQqSsyGmx96Ncr7jhXdkrPbKpiRP/LcuGa63Zq3mHk2MrH2kQApZ6hKbpiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVob3BXISYX2HFN3oiDCeVgytTe6YgfNIoGDGuwcU4SHKAfvj/
 mh2u4JXj25+V9/u3eAU3dN1sIHuuvICHiMdoQbYiuI9RlorYtE7cYZXM
X-Gm-Gg: ASbGncvCIHQJIVljWSYumU9aj7D/hBOcnCfP2opyEtjRrJ+e/bt8attZb7hSv0FEwHr
 avGNESxOe52dn7oZjy7LYnhiAZKTOEgLfPSZF7BgdIJENZSMkaSp/nAd1sOaLm5+QVz/Rl2PmSk
 3FYLe8iy4lGRKqCGTaldXJXAwYKmTkP6xPk/MeDzXbUcCXpcXvZGxhFSj66zj1yXi5i3l+U5i7w
 dnQbRYrQD0P3APQ2InekIqwyZLu4CM1OYLTBTvPLXUMICcUUfzzkmMeOaR2G7TBaot7Ib63gfAs
 FtrF+jVc8bOVA7d/z56RYboHXiL27WZX0ksxV+gL5acl4tP4fz75qEo/bASdfKX7ZHeLauR3IYg
 7LwOTFpclli/NgKPS+b8FDplc1vCjYKoyGnHLAdOYkskNi17WjFjEB8T1FMHPC6BgAWOtYmvXox
 q9GuL02UIC5dAoJG9yBnzy
X-Google-Smtp-Source: AGHT+IFJXFSppj2HoIPfT0DNF82Abv4mtxDvrxkAHw6b76kGPg7cFa3ESgHvRApJqFhlZJceziWZkw==
X-Received: by 2002:a17:906:c149:b0:b45:60ad:daf1 with SMTP id
 a640c23a62f3a-b50aa8a92e3mr1797895266b.22.1760297025416; 
 Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 05/30] drm/sun4i: vi_layer: Move check from update to check
 callback
Date: Sun, 12 Oct 2025 21:23:05 +0200
Message-ID: <20251012192330.6903-6-jernej.skrabec@gmail.com>
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

DRM requires that all check are done in atomic_check callback. Move
one check from atomic_commit to atomic_update callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bd6c7915bbc4..c80bdece5ffc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return ret;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return ret;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.0

