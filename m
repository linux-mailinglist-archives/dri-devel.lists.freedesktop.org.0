Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088389A481B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866BC10E987;
	Fri, 18 Oct 2024 20:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O+vKGQo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C16510E984
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:34:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso3095574e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283675; x=1729888475; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/m0kHi0t1totPQ3PzKzLk6eKNQU+IyYcKKk3sgyVyJI=;
 b=O+vKGQo485Ny3BhMaF0+4egZeR5aH8jjN5OwJveJJGgwewXlOcjaLMYwPg4xYsEN5J
 BJZicddV0iOsEsYwL5ogTxxaPBfdg1L7NLDLw2q0uSpAuP9n2U+SHmPL/S2RBDj0fxM9
 hts/glVCzgk9SIxjgbCWmsBoBr8fYN6aPu4Q5fSn/aN7peKpHD5tP8ZGfXVdLwVe69xi
 /Mjw6/5grAgkKfMZuVdVJYg79dxve30C6R5GcTqitaQ2f+JrRYyYLEKJcuUwi8STSl88
 V/4rN5eSVkCMXNSibxi+5yd3y/9dn11MUlP2y2xaFe5Ur0j8HEY8+WX1CXI+acLqZ/SH
 IQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283675; x=1729888475;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/m0kHi0t1totPQ3PzKzLk6eKNQU+IyYcKKk3sgyVyJI=;
 b=IsGEJvjI0PdU9+BMtoB9po4gsytYliklp9pwaRwqkdW/1hshzD9YsIfEvkxN2bovxS
 MhETkRnobDeKE8pGRH2YnAoCEu2qhLkmHz+lHkpmyWpOqX3tC3SNx4lpbp6iWgXmAyMW
 qrpB5aVemJdqKpbWYbEuUSBYe/vFaPHIw2erLfIHQ0vrRdX8NmsgdBG1UUIweM4NVi6V
 vQjCfM0TgVGiKg4zCK9Cbqb9NmYKNbB2S01XjGev/Q82uGQ6TgXD2btVhDgurwc9fnaK
 +ecO71EfE2Z5rLESvoLfZBIvKAQ0s8661yg4oYXUTjuRYQ5cSmzg3ZQ7pplnX9CrpT74
 d1Ww==
X-Gm-Message-State: AOJu0YxVHrnnjDfqXtFecCGZpKn97+7qJCG64OF+G4C/MoXCBnBavFcF
 Etk8ldZndhgWobys547OgBR3CeV9zygcHXyskxK71Me0iloKoYdbx1h4gc7CbeA=
X-Google-Smtp-Source: AGHT+IE8teJd2ZASdpn1PLVXXJ8Z0lyW9kTdAysHgWEAGJu0SayFj+KAyRByYqJcMZXxWhWyPtS+1Q==
X-Received: by 2002:a05:6512:692:b0:539:8f4d:a7dd with SMTP id
 2adb3069b0e04-53a154436dbmr2588171e87.42.1729283675244; 
 Fri, 18 Oct 2024 13:34:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:34:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:20 +0300
Subject: [PATCH 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-2-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MtW4rEaw3z2JqlmFrdNRTkI3k9zk4GSQZjrxwP7bYGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZWS7Xr6vqJfAnZJaxT8pE156T+ugvlMXDE3
 cWVO2I31JaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVgAKCRCLPIo+Aiko
 1RStCACcZGiWbJ6rwl1Z7TfhmYAv6dtF23Ul2Ba84Yg6T1vuXwq/cb/4fJJgxp0DdL2C34giGeM
 OX7nDtrcBG8ZwXo0GOsmJqZxtWzIiBAyCVGTmz+yx2Y+tR5Nhnu2zkJeXVuxV0n5G5uT9maCxns
 NKuL0ICAxfeQ+ICDoNDqNkgABXsNpo03+AUcDftdjzQDqqcQeaKnK9f5YiWI/97U/5ABstMbZ+K
 ceX6ul8ImmiIFu67jcbEl347B72uAN/TLXdutztOSkElYtI5UwIj/Sl4fJOiQQwobFAbw1CoNCD
 wN2I8yrwr3Tn99ueCn+aeGGPbo7vTkfjtwCWzxrkVIR9jctY
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de30..54b72fe220af 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
-static enum drm_mode_status
-sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
-							      HDMI_COLORSPACE_RGB);
-
-	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_connector_atomic_check,
-	.mode_valid	= sun4i_hdmi_connector_mode_valid,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.39.5

