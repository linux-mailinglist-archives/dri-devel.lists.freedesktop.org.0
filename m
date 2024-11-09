Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B180E9C2D14
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA2C10E2AF;
	Sat,  9 Nov 2024 12:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TvmczXXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CB10E0DB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso3588384e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155722; x=1731760522; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=;
 b=TvmczXXOnk3UKRjfq6bmxdCMbYaSAztcF+B9Y98D6/IFCVW7ZG2ltpDwSGcy4iSHTb
 Wl6/A33DFJkOr77aRh0PgiTQdTY3bollA2ZUO15jhz6gjSbNifQP12DJnYNG2BA0rOph
 +IYv/hbP5ern7q0wWdTpSgL7gjCdhtJl1nZKykfn/0+n0CC8nfkQiUoF5BHiZlD6XbeL
 TXg7wSY7pxWxjgND/TXDlEe3Zm0b63pkxFKgz24vXDZOJipkkFwRipZNrjil9OZK6o4U
 IlBAN4AVDYXxXWsJkLGafg3N0lndGOtcg8bgaeb6JLzF85dOOVGct7HRa2H7RbzQ2qPI
 Z4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155722; x=1731760522;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=;
 b=Pinxi5aXrcbDP91RJA8qbOzDLlYW29RHp6FyDroHiATOiGGaB9yVjTi4+8WWMS7XSd
 AKQZAJjxT0EuTQNFbuIEZPxieEU7vmYXiqP1mBNb9FQv+ZBVG6dj8j0E3b/YMw77Cvd7
 t9YtvtWIfNeyTTX65fdPs+1/AWI4XHf25IqFzVPdaauF/14eKOJVGO4uK8J7fRbDLIt7
 AqIV4TlaG7LtM/nAizkw/764+pGifEuQf040g1sMWmJpuJwTK1QmTGwJQQAFxi9TOFOn
 5n7yi+ATTGMCXPpe5lns8GD4d9Mngc1NgqktMaUi/x+UvMM6wf9NYuwZsgIRcW+glTIQ
 Cd+g==
X-Gm-Message-State: AOJu0YxYZ2jX09Xn4x8JFy0yb82s/vGUPyX8vVIPmZjltURFgvgW4LZb
 ALYDhhPnlGKH/B8xm5USyiWIsA/n3S1Gp+TQlDv4gWT2YLw3bVB1UJzB6TdFzno=
X-Google-Smtp-Source: AGHT+IF4/eBJh19k7QgFTqtYdnnffmTFfXf5+J78TQkqLjRVT/odItDWynAUIGAavfq6S1uNQ3S3Rg==
X-Received: by 2002:a05:6512:3b0f:b0:539:e2cc:d37c with SMTP id
 2adb3069b0e04-53d866b20c5mr2162656e87.3.1731155722003; 
 Sat, 09 Nov 2024 04:35:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:07 +0200
Subject: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HrGaJ3EnGO039JV3w0anWuEujv8ijZYE/SL4efGrI0s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2D8f9f3f02SmxcyeF2ex7K28O/vzlAxeRaO7cXPNW
 zsuJYd3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi8XvZ/wepedeVGdUY/a45
 FTO/7Xv1pfz//KulXi+rvn++ruXV9J7NOxLtmRcxvg+wZrRovKntYX/l455LjPp/mY6/slNL/Pl
 IWeDX/SKHQ1IhgnO3qBnVF8wtvslfkSapYrigQPV1aors4rk70zwbriaaeRQcdeXdbrUik+9iTr
 3y4uDFNV95Qi329Ra9ez75iaVqFrfO4Q+ODGlq+7zjND5K1GcfK5y1cIpR3I81f1Sq0lZ9fjpv4
 h1f7px11wK7Fdc86Finv+NEnaX9fp3ZGteNPzDPa2jUMjdrizhkZfb2yw+FlWWPjxf++GQuHhh1
 QN72G+PP935pvX3m6Ws0Pt6+XhQ/dbleqv5FzZ6UOZXSAA==
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

