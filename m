Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D94B4782B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88310E427;
	Sat,  6 Sep 2025 22:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lraWHLrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3AC10E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 23:18:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-55ce508d4d6so5139520e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756855129; x=1757459929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HZ9pl638NqdNSfS3FpV9M0vR2wmTDAt4Oy5y7M+jVE=;
 b=lraWHLrceo1ltqFCQ/9TJD9V6w6jfbWMBhqpmGLhKKzRb3SKaoxKc3RnfodIYyEjiR
 mQdmjzfVDdNjIBo75dglkPJ81iJ0A7LRIfBw4tV/qasB8wx1XYToI4FbBgm1uZj3WVHu
 2hM9mrE1Fu13uVI6IpJOpdai6RYlGbyGa4qi2rdbEsHNCG3NNPo3bykvMl2D1LKC+X/L
 G+eDcus9J1YpJGInlafcDDPPMw7g+0Jp1xO0RCkzCgnHdJ/1G2gVh61sbslDUQr5eBxt
 i4I8rxizIlFTKtg7su4WxBRhhSexU2d+hIpUWZ9zaWahz/Ir6bOq5RDG2DZCb8mVGJ4T
 ijjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756855129; x=1757459929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HZ9pl638NqdNSfS3FpV9M0vR2wmTDAt4Oy5y7M+jVE=;
 b=IaydmzYeajfl51//aUlGw600yw9TmKfxZBME6kW4GLesJpeBkMZlwJWkDVQgEP+V4H
 IDD9NLsayiN1gT/M3OrjgPCywlRDBnnHDFnvh4QEsFjOOVHbHXgClWWipGS74yNwxgiX
 ZQs4bHywsd/J6j6IY99Jiz6JVYyaHSkpH3DRZfb6TqR6V1ZLTNJ3zeaxYsbtVKncjCro
 oosmjtpXu0wLfWa/UFqVCcbICc6mYbrqJ/RzBSlhwrCSN8k2L6zmfEXkEJhh9untVii8
 R5//ndfNHjprrUbRto+RDlRTWZut6/QxBq+6pDjqmz8oLgqXK6sh4dm90egzX+31b6py
 pYvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHH+XX46NzJMJsHrBVSCVUklBsMJaF2U11WzTfSLmbw+gaPJb6jhHXJg+cOhZH/g8roof3dkLD2Q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymoZQc5rHoCQnTg9Vs3GvxWKjtzt4l7p8fKimvba39tlJvK51x
 hZI6UrMLUdaV4JoJhKq/T16Au2hxJnuwX8Dc2xUU9M6XJZV6Jg6WJEjq
X-Gm-Gg: ASbGncvFMVDI4YSvKw6nYf7o2kYg+P7pzj9M7tjS46izo6T2NVdlNbogqpyd04ui0AV
 PiMp1gosvrjdSKGKptQd0SUh10HhIB+zdKsQ+WYd68kzNsiVtiCUyZkFaBhFWwMNYSv2rdvfyH9
 s4uf8cD+5z5rVKUcGXggCWus+98N4BjWpfmSWmyJ1mw3oNt62qIaZ8MoVXMXGWGfoQa55ZKTnbE
 1rcagk0CGxmaBPy9qWZjwg+FbKu0SfemLXf+bNTzuw+oHzZjB4erYtI2Axa1j7AYsNOm3HM3Act
 pkVpNKEQf3VZ0JuIZ2ts3RO7KRTelgTNn2U/QQaAmitQY9kSiUkemKgcZTgjGveaYXN/Rf63jnR
 +EyaZ530RAKdPVTu+ZP0kfRURn0IspFLboluUGqt3kXM=
X-Google-Smtp-Source: AGHT+IGQGeBa42NAm+6M2nTSShnW1+q93X+RFEs5yrNEy7vwja1uyxfC67M5zlsU7C2tl4x0AYQKkw==
X-Received: by 2002:a05:6512:ad2:b0:55f:46cd:2c79 with SMTP id
 2adb3069b0e04-55f7089c53bmr4106697e87.9.1756855128455; 
 Tue, 02 Sep 2025 16:18:48 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab5e281sm105674e87.18.2025.09.02.16.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 16:18:48 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: use reset_gpio as optional
 parameter
Date: Wed,  3 Sep 2025 02:18:21 +0300
Message-Id: <20250902231821.2943-4-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902231821.2943-1-vovchkir@gmail.com>
References: <20250902231821.2943-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

On some systems the reset pin may not be used.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 5051cdfe2fee..1aeb5b29704b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -179,6 +179,9 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 
 static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
 {
+	if (!lt9611uxc->reset_gpio)
+		return;
+
 	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
 	msleep(20);
 
@@ -460,7 +463,7 @@ static int lt9611uxc_gpio_init(struct lt9611uxc *lt9611uxc)
 {
 	struct device *dev = lt9611uxc->dev;
 
-	lt9611uxc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	lt9611uxc->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(lt9611uxc->reset_gpio)) {
 		dev_err(dev, "failed to acquire reset gpio\n");
 		return PTR_ERR(lt9611uxc->reset_gpio);
-- 
2.34.1

