Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1009AD185
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5323210E842;
	Wed, 23 Oct 2024 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Zvol55mN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D81B10E837
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so95863245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702238; x=1730307038;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dBtpzJ58MvH71lujIXadct9yB3QEBe2KV1KLdTieHZ4=;
 b=Zvol55mNkMNmHj7Fl+G7DHkwsXy8l76+wKH2VNSCb9kuHNHwBbgCmLdM2KfwL0I9OJ
 00/a4UK2i/tZhQnahSF52JOAAy/OgfZNFTPKou/V4z3TlbJQqXk+DxN9BUgqOKgCf0Wd
 JdjVz0NOOLVpxIcl4h8gqSWNKFmiZOIe2DDgXKpImt08idPiItz9lOb01RMP41iXs9DG
 Tew4Zbdl9upSaqIJWYdct9RrAu4lOAF2n+nycUyIxIbmI4fOJuKc9IulupAqXkT8w+7s
 yXG1RRmgSX4tEm1ZVAiDsrIWO0kfzZCN89IHmKRE4RNa0+rx24m9nsOnvSVF8vAXFD8L
 M+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702238; x=1730307038;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBtpzJ58MvH71lujIXadct9yB3QEBe2KV1KLdTieHZ4=;
 b=JiLBkvBcShVjxR0BReNMxFMnAxYQV2FF27l1H+eZnsQFKGKsewrHybnoUKPDx/YVH7
 7hbcdRs4Ym0b3UHnEmgbEOGMfDbwLOuIODDYqc8YVqJPgvNlyVzqhXCHYYKd5aNWUl11
 WFxFv4vLct19bTY53jayciQxrIpmFmQi69nuTlOFYmlsQ6sK1PFvZo71cOC3bI0CBlvb
 VIDkPiKVC1H8v4tvowKzeN6QyhliDdEdI1oJcwxl5NYaLJmawEbtaHy7ytVetE962uV9
 NPfyrb2zxVD8xBnipnRynAX47qY3gieGXY3lv6osK/gHcWf4uBpQp+VI2V24kUn4d02O
 /iJw==
X-Gm-Message-State: AOJu0YwL5e6F+sASh61DuibrGL+ZLT16bzHwu3M6F2Wf0Z0nYd6JjynI
 5b+xvh6pSyDQSRZgfRJhdGP0QK2gG6+hiuFteWsnQNxbcJRsoJSXs6xJmr4IsdE=
X-Google-Smtp-Source: AGHT+IEtq5x06sVi9VriYMH3JsAvnoSFcmTPLv7qhrAQHuJ0KzIixvn2H0J3ILsL9EaEXcFLK9oHmw==
X-Received: by 2002:a05:600c:35d3:b0:431:59b2:f0c4 with SMTP id
 5b1f17b1804b1-431842010admr29674505e9.8.1729702238396; 
 Wed, 23 Oct 2024 09:50:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:22 +0100
Subject: [PATCH 25/37] drm/vc4: plane: Add support for 2712 D-step.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-25-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

There are a few minor changes in the display list generation
for the D-step of the chip, so add them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 72 ++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_regs.h  |  9 ++++--
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 5749287f6e3c..205aea3ed419 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1134,25 +1134,53 @@ static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
 
 static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 {
-	if (!state->fb->format->has_alpha)
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
-				     SCALER5_CTL2_ALPHA_MODE);
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	switch (state->pixel_blend_mode) {
-	case DRM_MODE_BLEND_PIXEL_NONE:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
-				     SCALER5_CTL2_ALPHA_MODE);
+	switch (vc4->gen) {
 	default:
-	case DRM_MODE_BLEND_PREMULTI:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
-				     SCALER5_CTL2_ALPHA_MODE) |
-			SCALER5_CTL2_ALPHA_PREMULT;
-	case DRM_MODE_BLEND_COVERAGE:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
-				     SCALER5_CTL2_ALPHA_MODE);
+	case VC4_GEN_5:
+	case VC4_GEN_6_C:
+		if (!state->fb->format->has_alpha)
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+					     SCALER5_CTL2_ALPHA_MODE);
+
+		switch (state->pixel_blend_mode) {
+		case DRM_MODE_BLEND_PIXEL_NONE:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+					     SCALER5_CTL2_ALPHA_MODE);
+		default:
+		case DRM_MODE_BLEND_PREMULTI:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+					     SCALER5_CTL2_ALPHA_MODE) |
+				SCALER5_CTL2_ALPHA_PREMULT;
+		case DRM_MODE_BLEND_COVERAGE:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+					     SCALER5_CTL2_ALPHA_MODE);
+		}
+	case VC4_GEN_6_D:
+		/* 2712-D configures fixed alpha mode in CTL0 */
+		return state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ?
+			SCALER5_CTL2_ALPHA_PREMULT : 0;
 	}
 }
 
+static u32 vc4_hvs6_get_alpha_mask_mode(struct drm_plane_state *state)
+{
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_6_C && vc4->gen != VC4_GEN_6_D);
+
+	if (vc4->gen == VC4_GEN_6_D &&
+	    (!state->fb->format->has_alpha ||
+	     state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE))
+		return VC4_SET_FIELD(SCALER6D_CTL0_ALPHA_MASK_FIXED,
+				     SCALER6_CTL0_ALPHA_MASK);
+
+	return VC4_SET_FIELD(SCALER6_CTL0_ALPHA_MASK_NONE, SCALER6_CTL0_ALPHA_MASK);
+}
+
 /* Writes out a full display list for an active plane to the plane's
  * private dlist state.
  */
@@ -1645,14 +1673,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
 {
 	struct drm_plane_state *state = &vc4_state->base;
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	u32 ret = 0;
 
 	if (vc4_state->is_yuv) {
 		enum drm_color_encoding color_encoding = state->color_encoding;
 		enum drm_color_range color_range = state->color_range;
 
-		ret |= SCALER6_CTL2_CSC_ENABLE;
-
 		/* CSC pre-loaded with:
 		 * 0 = BT601 limited range
 		 * 1 = BT709 limited range
@@ -1666,8 +1693,15 @@ static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
 		if (color_range > DRM_COLOR_YCBCR_FULL_RANGE)
 			color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 
-		ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
-				     SCALER6_CTL2_BRCM_CFC_CONTROL);
+		if (vc4->gen == VC4_GEN_6_C) {
+			ret |= SCALER6C_CTL2_CSC_ENABLE;
+			ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+					     SCALER6C_CTL2_BRCM_CFC_CONTROL);
+		} else {
+			ret |= SCALER6D_CTL2_CSC_ENABLE;
+			ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+					     SCALER6D_CTL2_BRCM_CFC_CONTROL);
+		}
 	}
 
 	return ret;
@@ -1880,7 +1914,7 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	vc4_dlist_write(vc4_state,
 			SCALER6_CTL0_VALID |
 			VC4_SET_FIELD(tiling, SCALER6_CTL0_ADDR_MODE) |
-			VC4_SET_FIELD(0, SCALER6_CTL0_ALPHA_MASK) |
+			vc4_hvs6_get_alpha_mask_mode(state) |
 			(vc4_state->is_unity ? SCALER6_CTL0_UNITY : 0) |
 			VC4_SET_FIELD(format->pixel_order_hvs5, SCALER6_CTL0_ORDERRGBA) |
 			VC4_SET_FIELD(scl1, SCALER6_CTL0_SCL1_MODE) |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0efe340f99d4..0046bdb7ca32 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -1194,6 +1194,9 @@ enum hvs_pixel_format {
 #define SCALER5_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
 #define SCALER5_CTL2_ALPHA_SHIFT		4
 
+#define SCALER6D_CTL2_CSC_ENABLE		BIT(19)
+#define SCALER6D_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(22, 20)
+
 #define SCALER_POS1_SCL_HEIGHT_MASK		VC4_MASK(27, 16)
 #define SCALER_POS1_SCL_HEIGHT_SHIFT		16
 
@@ -1347,6 +1350,8 @@ enum hvs_pixel_format {
 #define SCALER6_CTL0_ADDR_MODE_UIF		4
 
 #define SCALER6_CTL0_ALPHA_MASK_MASK		VC4_MASK(19, 18)
+#define SCALER6_CTL0_ALPHA_MASK_NONE		0
+#define SCALER6D_CTL0_ALPHA_MASK_FIXED		3
 #define SCALER6_CTL0_UNITY			BIT(15)
 #define SCALER6_CTL0_ORDERRGBA_MASK		VC4_MASK(14, 13)
 #define SCALER6_CTL0_SCL1_MODE_MASK		VC4_MASK(10, 8)
@@ -1361,8 +1366,8 @@ enum hvs_pixel_format {
 #define SCALER6_CTL2_ALPHA_PREMULT		BIT(29)
 #define SCALER6_CTL2_ALPHA_MIX			BIT(28)
 #define SCALER6_CTL2_BFG			BIT(26)
-#define SCALER6_CTL2_CSC_ENABLE			BIT(25)
-#define SCALER6_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
+#define SCALER6C_CTL2_CSC_ENABLE		BIT(25)
+#define SCALER6C_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
 #define SCALER6_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
 
 #define SCALER6_POS1_SCL_LINES_MASK		VC4_MASK(28, 16)

-- 
2.34.1

