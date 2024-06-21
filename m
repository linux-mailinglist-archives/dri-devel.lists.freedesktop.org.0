Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C42912957
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793D310F1E3;
	Fri, 21 Jun 2024 15:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UxQGqa/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BBC10F1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:32 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6f85f82ffeso273745366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983291; x=1719588091;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBz1EVjZX10UGoQO9utYRwzPCZrzadGDiBXAWlLvQ+o=;
 b=UxQGqa/lNs27/BURKZoDTNpWvi74JLv+291Ls4k+J3oq+LC1EcmmYJRuV7s4DxGDgt
 p6bcYxKn2yxv5fAAVLvd/gRc80isje5TX97QAoPrK3obgvPiw+woFV66oGuS5/+/XVqF
 12SlA5+MnugTZvAG6/KGuJRM7abI1fZzJx70xXz/0Ooksqm3aLgUgxb1MxTelbaUTUSl
 RGTb1H2ukt9+o8bkN+uxD9O5u2B1u1GWglWLViLkyaCYJCr4tvdRJALiKGoFlOHL0qPU
 ml2hKQVASXjK1amXbhAx5WtER3BxGJv0+ONEQWWqb02uFmtnJ2mYMqpsPHsp7bkRZleK
 nNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983291; x=1719588091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBz1EVjZX10UGoQO9utYRwzPCZrzadGDiBXAWlLvQ+o=;
 b=K6Vo74hf7j32VeaNW9MbYzyYeto/QDpSGADkFSDDZxPiW2UAfoNSvr4ph2d2r680DB
 3FHMiHXFNE/5orRP/W/LaQe3m6TsrzuMx3tR8mxh3R2VZIJCtnfkmmy8ysTH/Er82Gtx
 JavVy4i+ghP1wrHWl/df92hfecXLe63Y7uy97qKJCfxzCfODZui6xRaSfxIHVXCLWEjU
 GCEvcD/1btAk+WaJ1Hj5ADR1eqmzpp0Ji2ObtuGoWYrOaI9p8PsARbCsIO5rBwdk14Wn
 ck63pIZLViTXURL8G//jrzm3wMuiHg+4NUSHhIAb6I43Txg/+7FEusvtg9wtdw9hl4i7
 TeNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaU4yKmf2W0ZUiMGEKw7LTuCxne88e28S/PaxhC5XfdEzneISrgvspRDFdFrkEiaddWQ5zY6tys10HsgT3nC9oXRcnwaUdNprXY9/mGBia
X-Gm-Message-State: AOJu0Yz88gtA2P1j/5jno76DYY/wn8f/3ifXxgz4+YglK05SUYoHstKc
 8UYtN03eAW9FdP8mZ6zYcDPe6ZoPPgmPnOgVtHqXQPzuussNAd+k3ZeB/agwO4O+8lMIIOxfElc
 2Cbt/wD+b/W6SThczWWCCblvMMPoNvzUb
X-Google-Smtp-Source: AGHT+IHwpOs+WaB1bMMhddazSyYxSYpsLrxBNsPXTcNWV6UznqwZ8TQHhqjeK2Yhme4Xnom/On7eUyBEPCPF
X-Received: by 2002:a17:906:f289:b0:a6f:1839:ed40 with SMTP id
 a640c23a62f3a-a6fab7d6bb1mr482344666b.73.1718983290953; 
 Fri, 21 Jun 2024 08:21:30 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf5605d0sm5585566b.187.2024.06.21.08.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:30 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 01/31] drm/vc4: plane: Keep fractional source coords inside
 state
Date: Fri, 21 Jun 2024 16:20:25 +0100
Message-Id: <20240621152055.4180873-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Dom Cobley <popcornmix@gmail.com>

Fractional source co-ordinates can be used to setup the scaling
filters, so retain the information.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h   |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c | 68 ++++++++++++++++-----------------
 2 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 08e29fa82563..697e9b7c9d0e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -404,7 +404,7 @@ struct vc4_plane_state {
 
 	/* Clipped coordinates of the plane on the display. */
 	int crtc_x, crtc_y, crtc_w, crtc_h;
-	/* Clipped area being scanned from in the FB. */
+	/* Clipped area being scanned from in the FB in u16.16 format */
 	u32 src_x, src_y;
 
 	u32 src_w[2], src_h[2];
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 07caf2a47c6c..e0df210bedcb 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -251,9 +251,9 @@ static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
 
 static enum vc4_scaling_mode vc4_get_scaling_mode(u32 src, u32 dst)
 {
-	if (dst == src)
+	if (dst == src >> 16)
 		return VC4_SCALING_NONE;
-	if (3 * dst >= 2 * src)
+	if (3 * dst >= 2 * (src >> 16))
 		return VC4_SCALING_PPF;
 	else
 		return VC4_SCALING_TPZ;
@@ -462,15 +462,10 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 		vc4_state->offsets[i] = bo->dma_addr + fb->offsets[i];
 	}
 
-	/*
-	 * We don't support subpixel source positioning for scaling,
-	 * but fractional coordinates can be generated by clipping
-	 * so just round for now
-	 */
-	vc4_state->src_x = DIV_ROUND_CLOSEST(state->src.x1, 1 << 16);
-	vc4_state->src_y = DIV_ROUND_CLOSEST(state->src.y1, 1 << 16);
-	vc4_state->src_w[0] = DIV_ROUND_CLOSEST(state->src.x2, 1 << 16) - vc4_state->src_x;
-	vc4_state->src_h[0] = DIV_ROUND_CLOSEST(state->src.y2, 1 << 16) - vc4_state->src_y;
+	vc4_state->src_x = state->src.x1;
+	vc4_state->src_y = state->src.y1;
+	vc4_state->src_w[0] = state->src.x2 - vc4_state->src_x;
+	vc4_state->src_h[0] = state->src.y2 - vc4_state->src_y;
 
 	vc4_state->crtc_x = state->dst.x1;
 	vc4_state->crtc_y = state->dst.y1;
@@ -523,7 +518,7 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 {
 	u32 scale, recip;
 
-	scale = (1 << 16) * src / dst;
+	scale = src / dst;
 
 	/* The specs note that while the reciprocal would be defined
 	 * as (1<<32)/scale, ~0 is close enough.
@@ -569,7 +564,7 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	if (vc4_state->x_scaling[0] == VC4_SCALING_TPZ)
 		pix_per_line = vc4_state->crtc_w;
 	else
-		pix_per_line = vc4_state->src_w[0];
+		pix_per_line = vc4_state->src_w[0] >> 16;
 
 	if (!vc4_state->is_yuv) {
 		if (vc4_state->y_scaling[0] == VC4_SCALING_TPZ)
@@ -660,7 +655,8 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 	for (i = 0; i < fb->format->num_planes; i++) {
 		/* Even if the bandwidth/plane required for a single frame is
 		 *
-		 * vc4_state->src_w[i] * vc4_state->src_h[i] * cpp * vrefresh
+		 * (vc4_state->src_w[i] >> 16) * (vc4_state->src_h[i] >> 16) *
+		 *  cpp * vrefresh
 		 *
 		 * when downscaling, we have to read more pixels per line in
 		 * the time frame reserved for a single line, so the bandwidth
@@ -669,11 +665,11 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 		 * load by this number. We're likely over-estimating the read
 		 * demand, but that's better than under-estimating it.
 		 */
-		vscale_factor = DIV_ROUND_UP(vc4_state->src_h[i],
+		vscale_factor = DIV_ROUND_UP(vc4_state->src_h[i] >> 16,
 					     vc4_state->crtc_h);
-		vc4_state->membus_load += vc4_state->src_w[i] *
-					  vc4_state->src_h[i] * vscale_factor *
-					  fb->format->cpp[i];
+		vc4_state->membus_load += (vc4_state->src_w[i] >> 16) *
+					  (vc4_state->src_h[i] >> 16) *
+					  vscale_factor * fb->format->cpp[i];
 		vc4_state->hvs_load += vc4_state->crtc_h * vc4_state->crtc_w;
 	}
 
@@ -826,7 +822,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	bool mix_plane_alpha;
 	bool covers_screen;
 	u32 scl0, scl1, pitch0;
-	u32 tiling, src_y;
+	u32 tiling, src_x, src_y;
+	u32 width, height;
 	u32 hvs_format = format->hvs;
 	unsigned int rotation;
 	int ret, i;
@@ -838,6 +835,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	width = vc4_state->src_w[0] >> 16;
+	height = vc4_state->src_h[0] >> 16;
+
 	/* SCL1 is used for Cb/Cr scaling of planar formats.  For RGB
 	 * and 4:4:4, scl1 should be set to scl0 so both channels of
 	 * the scaler do the same thing.  For YUV, the Y plane needs
@@ -858,9 +858,11 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 					 DRM_MODE_REFLECT_Y);
 
 	/* We must point to the last line when Y reflection is enabled. */
-	src_y = vc4_state->src_y;
+	src_y = vc4_state->src_y >> 16;
 	if (rotation & DRM_MODE_REFLECT_Y)
-		src_y += vc4_state->src_h[0] - 1;
+		src_y += height - 1;
+
+	src_x = vc4_state->src_x >> 16;
 
 	switch (base_format_mod) {
 	case DRM_FORMAT_MOD_LINEAR:
@@ -875,7 +877,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 						 (i ? v_subsample : 1) *
 						 fb->pitches[i];
 
-			vc4_state->offsets[i] += vc4_state->src_x /
+			vc4_state->offsets[i] += src_x /
 						 (i ? h_subsample : 1) *
 						 fb->format->cpp[i];
 		}
@@ -898,7 +900,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		 *	pitch * tile_h == tile_size * tiles_per_row
 		 */
 		u32 tiles_w = fb->pitches[0] >> (tile_size_shift - tile_h_shift);
-		u32 tiles_l = vc4_state->src_x >> tile_w_shift;
+		u32 tiles_l = src_x >> tile_w_shift;
 		u32 tiles_r = tiles_w - tiles_l;
 		u32 tiles_t = src_y >> tile_h_shift;
 		/* Intra-tile offsets, which modify the base address (the
@@ -908,7 +910,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		u32 tile_y = (src_y >> 4) & 1;
 		u32 subtile_y = (src_y >> 2) & 3;
 		u32 utile_y = src_y & 3;
-		u32 x_off = vc4_state->src_x & tile_w_mask;
+		u32 x_off = src_x & tile_w_mask;
 		u32 y_off = src_y & tile_h_mask;
 
 		/* When Y reflection is requested we must set the
@@ -1004,7 +1006,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 				 * of the 12-pixels in that 128-bit word is the
 				 * first pixel to be used
 				 */
-				u32 remaining_pixels = vc4_state->src_x % 96;
+				u32 remaining_pixels = src_x % 96;
 				u32 aligned = remaining_pixels / 12;
 				u32 last_bits = remaining_pixels % 12;
 
@@ -1026,12 +1028,12 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 					return -EINVAL;
 				}
 				pix_per_tile = tile_w / fb->format->cpp[0];
-				x_off = (vc4_state->src_x % pix_per_tile) /
+				x_off = (src_x % pix_per_tile) /
 					(i ? h_subsample : 1) *
 					fb->format->cpp[i];
 			}
 
-			tile = vc4_state->src_x / pix_per_tile;
+			tile = src_x / pix_per_tile;
 
 			vc4_state->offsets[i] += param * tile_w * tile;
 			vc4_state->offsets[i] += src_y /
@@ -1092,10 +1094,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		vc4_dlist_write(vc4_state,
 				(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
 				vc4_hvs4_get_alpha_blend_mode(state) |
-				VC4_SET_FIELD(vc4_state->src_w[0],
-					      SCALER_POS2_WIDTH) |
-				VC4_SET_FIELD(vc4_state->src_h[0],
-					      SCALER_POS2_HEIGHT));
+				VC4_SET_FIELD(width, SCALER_POS2_WIDTH) |
+				VC4_SET_FIELD(height, SCALER_POS2_HEIGHT));
 
 		/* Position Word 3: Context.  Written by the HVS. */
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
@@ -1148,10 +1148,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		/* Position Word 2: Source Image Size */
 		vc4_state->pos2_offset = vc4_state->dlist_count;
 		vc4_dlist_write(vc4_state,
-				VC4_SET_FIELD(vc4_state->src_w[0],
-					      SCALER5_POS2_WIDTH) |
-				VC4_SET_FIELD(vc4_state->src_h[0],
-					      SCALER5_POS2_HEIGHT));
+				VC4_SET_FIELD(width, SCALER5_POS2_WIDTH) |
+				VC4_SET_FIELD(height, SCALER5_POS2_HEIGHT));
 
 		/* Position Word 3: Context.  Written by the HVS. */
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
-- 
2.34.1

