Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3369C2D19
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449BB10E2B6;
	Sat,  9 Nov 2024 12:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YnpUHDZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9140D10E0DB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:34 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so3951828e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155733; x=1731760533; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
 b=YnpUHDZNnYrsGo2l9gO9GfP0oJKfjmiaxyc7mgf+tbXueW2uRuxZBz8K0Wr3Pjgc0u
 m3os6qCauvKK0HEnuIloUzk02l8tMZ90bkt1leysszsGFfIn5lPxgBgY0NF5GUs8aTeh
 Q0HNsZklDWkcQ/hNVDkkNRdQagUIJStuDleP40O3EdiO7KQbFd8ZqH3ljb/qYLeeNacq
 SRAdSy1vA7132MtSt1zP1xxE9+R3hwGEGvViPtfQmZwmEZ00rw/IgbO8cnzb9gwyRAn+
 vfsOEaXtgxuBmxKmiMC2LKTbIPGyfTN6C7WIC7AlvWwnIlTnVFyC+BCUXwQ7jFHzaShd
 c6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155733; x=1731760533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
 b=JNS5HX0LFqukuxI0+785uZITgjO4VN9GIxwbl/t6cI+Olf21Eddg8SIivH4ObhxOEX
 5oVuA6/iGHg2CcQ2M1rGHOOVDk+r//14ZVGnBsSFO3vpfaxqzxHN6gCpIJnUZduFy6eb
 JQVyfo7erO0aGWxab/xDqJY4xiwJasMYJb28xE4nxrR23pOXNy2Cx83EUu/09J4TKb2d
 Bj5mNF9IAiaqrA82AtQQ5QjePqimGDvxWtw8XKsNJY7Dwr42lLg16H90WCvBzRVVVSOT
 qyrN/PTvA75IV4liwIXeWy6iX+sTbOTC3OwXo7GMjAZWxHRCQvZoXTPPvJRCuBllcIcp
 mnLA==
X-Gm-Message-State: AOJu0YyVndv2Olov43Jj95J5SNq0VnhGa9pN7Bugy1QY94Flm6w3bb+X
 BZOVTgcdTDz9Xo9UhuhU72pmPtm6ngan3ayJRp5HVd+beEOGNhYMA6udwGvbl0rCgXeme6DKjsU
 sUIs=
X-Google-Smtp-Source: AGHT+IHYy8a0Jl0t4eXfYO7d1FqKeWB0bC8cvUQRPjyNFzEV2jihfF3Am0WWkBzVwoqL1QUMEqIP1A==
X-Received: by 2002:a05:6512:3f16:b0:539:d9e2:9d15 with SMTP id
 2adb3069b0e04-53d8623fffcmr3082722e87.29.1731155732594; 
 Sat, 09 Nov 2024 04:35:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:11 +0200
Subject: [PATCH v3 7/7] drm/sun4i: use drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-7-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NRpLumrdDZhSXCJcusWkwzHsBkwvkTsOwVSCIyGYQBU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2P/UnAP/1lS+cTe5zqq05k8zk9jJ3/kFf9hFefyer
 PvILuvWyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ3H/JwTBByj1Gq3qN6AeP
 o7aBh83EfpQelbE2PxPHwSrQtOXuzpWWAdPL7V20fHnmPSgJPae4eu0jF4EvzSKi1hf6GBqMq/4
 eeLB96THGoJQfpepc7ku0Iy8Ei4RpMyhoFiceTbF5wJibpHuC37Nlnvn6xLlRhfOuScz40LdLMj
 vuZ1muq9PZ27M9+CN3C812ttdTdP+R/3jN9uAWG57HW0rPH+E1e3pukty3ZXZbUv4ylJ2/dyD3X
 MeLJPnAnaIOsusKL33yPnrZioPv9o+bP3ZYrlLsjS+/aRWZ2L1002uP9vgHx24wz2hv6qjrv/ih
 oTtM/MHPrSUulTmRUXP+1LEGMK7ck3dy07HdEs8aPB04AQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
char rate check, with drm_atomic_helper_connector_hdmi_check(), which
performs additional checks basing on the HDMI Connector's state.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 54b72fe220afacc208b3fd48d5160031127ea14a..b05fd77870b00aac97d003f3fb9c2b98cb73abc0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -187,24 +187,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_NOCLOCK;
 }
 
-static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
-					     struct drm_atomic_state *state)
-{
-	struct drm_connector_state *conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_crtc *crtc = conn_state->crtc;
-	struct drm_crtc_state *crtc_state = crtc->state;
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	enum drm_mode_status status;
-
-	status = sun4i_hdmi_connector_clock_valid(connector, mode,
-						  conn_state->hdmi.tmds_char_rate);
-	if (status != MODE_OK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -258,7 +240,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.39.5

