Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7EC32886
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0307910E30C;
	Tue,  4 Nov 2025 18:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LXnq4qPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C3710E30C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-477442b1de0so20304515e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279807; x=1762884607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=;
 b=LXnq4qPLeLVf5IoAhrvxPhD5VoIma0yBS5IEiIrna6fNtPHEwZa/cDphET4nYUN9H3
 jvRC+aJkYlQMQ1mWuZvG68k4/+w3YJzQBg0P3f3Lf7iXn+rm1PRhqyVZS4FL+JiJOu62
 h85J9zoGtcY676V8llDcH3tz5dnSc2blG4WAGQinjW6EBrXZmCeoS7RJIa1KDGvzKYsX
 sirHqCxCKBQGZJhDe6ZGn4fjQf3eBP+q+YWv8mQaM3E9djfO4x7vNV5f1rqaG+c0+B4L
 3r0EnhbUeRumG2a4upXtW+rppyeQimEDlYp7+uXNYDcRnQHoR2GJ1GUw4MycFWygPmE2
 fWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279807; x=1762884607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=;
 b=FVQ1KI5K7zkm5FDoWvrLCLOLPxmJjALfus8eUj48qqzQ+tpKMXbtgZwj8cPQGzTyvk
 +Z9CEo2R80N+K8KCjwgJ9oXcBXAnC+9+rbu4iZPIqWsUceLiBjLCpRT4CKzDrKBI5VTZ
 8/HGRB4Nxg0GoBHZJgF237hYEVQWzvJEUMsxZbLwpZ82+KPJ3LEZzogixXt/RSinK3wv
 mot0HNan5cGJaYqkIJa9QPUBGCmY+gPf9JQ6eEoLlPx7oWTRGvVbstUStuDZXViMT45t
 IXarizH50Bfm6YrwnBI/NNlLk4QUfeZZNUiQx37BCgQr7BrkxXMRAI5i8mJVO/x7yFai
 nhEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjmXUaKboPgvs1eOeqv1VCMHXW8MYvAyRJQY7Xsq5WZT33DUh0OrQ2AEsGyJoVLlCcXwDvpijOedY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYxL9Gqm2mZ70yZG0HQjG4azFco34vdpPZp205WWm0SF2G+Jto
 uvePqK4fdga0okumfRjeQGE3nX5tKLIY+LO9Q8EHm8tNVUgVMhmcNJhV
X-Gm-Gg: ASbGnctB6sVBCLEfArqFr3U+UG6qCPzJnK+ygMxZQ6giZ+VOLgtrF1BIGOdkgn+EPLc
 IiuUBQvQbZVhzyEq5YW58YuKCKOumKYYH52bpLARj/61KleBeiAT7CsqUh+/VrfF1X0TppkFKdG
 CKoygseaVdke17JEp8Yzm2aYKJVALd8uvhGX4aKFzVR59tv4goU7OHrkqlz/qZYk2jhpaAtYnNA
 cg13GCQks4iP+9DfY5LBHsd3ELomY52PrfPhQEkiQrA9kxUoVyitxP6D6qhNpklu4jy16NBy17D
 4gyLM2jIwSZthhLc6nTOqFr4YpwFUDS+ZB9IzBiQ4zjd7TNultxejnJtLwmf8NSD+ItVWRcJ6/j
 H5SGo/Evs3+PXDVuon5q1tFUU9ZPsazP/0AiIFvKZWkGdiyYbnARg9IneO/S/L94Ncxvl/xf+8E
 E9IRScb9BXA1CNh/FNrKZL3DAUF88T
X-Google-Smtp-Source: AGHT+IFmRzImpuQKxnU59wlPaEzVIfge0eS811Rho4boK9lxVttq6F0W8N4VKTddLMFMzKY8tP/Egw==
X-Received: by 2002:a05:600c:608a:b0:475:de68:3c2e with SMTP id
 5b1f17b1804b1-4775ce3ebedmr2220945e9.40.1762279806649; 
 Tue, 04 Nov 2025 10:10:06 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:06 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 04/30] drm/sun4i: ui_layer: Move check from update to check
 callback
Date: Tue,  4 Nov 2025 19:09:16 +0100
Message-ID: <20251104180942.61538-5-jernej.skrabec@gmail.com>
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

DRM requires that all checks are done in atomic_check callback. Move
one check from atomic_commit to atomic_check callback.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

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
2.51.2

