Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41B9BD0B00
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD2010E1A2;
	Sun, 12 Oct 2025 19:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJ9oNq/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0C110E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:45 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so728691766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297024; x=1760901824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=;
 b=FJ9oNq/qMsAZ7Pn2FgqKza65JQl1H74F7eRQFUQCMIvY4mmtk/jKo9evxr2GjCtt0g
 +Dl+w8O0NKjP4PrPyBcvcsxzY0XSSEtHapbeRORTeV6Gd+JGZ7VaMlNMyPlcEtC00SjO
 LjKGNTLOG8ZmtG8n+zZnx3YvSVKcTGls9Jt/PY9HhntZ7q9T0tZjPcaHtBM03z52Yqvz
 FXxZ4rdO/sdrJ1PKcnSKMHVpHEKBQuWIGspQyUFPuA7sVeAIPDIDM+0UCJUwB7OiUwkb
 BB8lDdYFZ7j/yU9SRuK0NiNW2/wz7/X5so+kM8v+WUCGLGn1s2+7V7CZkFXCQcDqST2e
 UckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297024; x=1760901824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=;
 b=uJ9q5VW2J0hci7lSCYiS/6JgqUCu98JjPsOpD/Lb1PABBTKFJfnAbSlKrG4Csl4G5Q
 rLlUfA95d9NZL0IsxzvJAIa8dj4NMgPUGCpWYD/xq9eP+ONZmovGdlv4T4qrZYan1he2
 7CsY4GTJ1YxCSkGkWOvAWS5t+UHDy06N1WtSUm0VaGf2YdhJ2of8pigHI4NfFgwkC35J
 WBWWNojwMBqUK1i1R8Ph+z/VgG9oD/zo0XJqKxDK5UN/x5fcrzbCfFMYg21xNemJma6+
 CnCH/FQwXpov6zYvLqKSnDKC2IrDBSTLJ7SbynhFx/HQQl7tWcAEjyGd8ir1PzRZQqQ/
 k6aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXayKU7Bt5hoN+yx5mfDyNeWQ3KZTviLfmJub+bvy1/cLNtfBBza1JrcPca02asBHChDtJC36RIf/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRuIrDBQdUWcH2JSD88IXseUTLg3nNnuBN3rQRxf+gFsw5B6ek
 iOHtNYB950W3QfcNeFTfBD9Gt3P5JZeYOexUGk/9B76GbD6XfxPh6ZOa
X-Gm-Gg: ASbGncuFrQy3okE2RNXrF9+sMTwO2F59SMo/vsdtYRQoMyL0lVI9np0Z0SUem0AvudS
 baRQ9lV1h2FyvNxtWMp1lrIGsiyOQVbeu5TD9m4n1NOEUx4FXGMyNrJsooVzbsp+cg5qKvemZ7q
 JDlFncfgnQI3ZLTrnoRKmf+HZfg8PHyjIRxxUvVLPI4UUOt1NwBNHqw8m106Cm8CKdy4bYjFFBg
 J2k2SDsWm9iwbYUTNrvKDGwJOaZgp8G20Dh7OWKKnB0IC0XtHl/sfYA7pqpevQV8rgh2kEP0cOY
 mUPcy+cxAOJL5S3l7F2FUSVMl6fcmGCJrS94MTJ7ET4QjKwAY5cophauubqxinVKr/NwXhv3vaI
 qEcetfM8Odo9Blkt7SS84nNPUIy5JBHNsknyB5PuDGIgI8zibTza2iI6ZVuvp2O9MJESXxDgAx7
 BjF1k6seM5nPSqdwsaCg0kx/rLBQe9xWNWIuH9KhniLw==
X-Google-Smtp-Source: AGHT+IEiNoS/+6UzRTSzo2B8Y29/AU5s+BLBdQ9yTmKb3fJBI9Fgd7dqesLSL2/Rv8CrMfvApRR4kg==
X-Received: by 2002:a17:906:f584:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b50aa38724bmr1988751866b.24.1760297024252; 
 Sun, 12 Oct 2025 12:23:44 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 04/30] drm/sun4i: ui_layer: Move check from update to check
 callback
Date: Sun, 12 Oct 2025 21:23:04 +0200
Message-ID: <20251012192330.6903-5-jernej.skrabec@gmail.com>
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

DRM requires that all checks are done in atomic_check callback. Move
one check from atomic_commit to atomic_update callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b786e5c7f3c..fce7b265c5d8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret || fmt->is_yuv) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return -EINVAL;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret || fmt->is_yuv) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return -EINVAL;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.0

