Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0ABA38AE7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 18:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD6010E57F;
	Mon, 17 Feb 2025 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="INXgLy5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49610E580
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 17:49:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso8629465e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 09:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739814594; x=1740419394;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SYWUFX7L3xQ55tqjrfIF/T/9S+H6ZAC4k6kghP/cbS4=;
 b=INXgLy5BMNHo7HRcKOrjsfDy07EHDnXcFGQijDTEYYoayAnECK9kwo72DJh5oCZ2OU
 0taqlC55HS9wbnVdyNSsmkyVQB6UeNBYJskOk/Feo3gCRVcsELsglOHUulFhC3lMVgXa
 sG6y/TU0nwlYIEQICHm8vXrfyFDCywAhlhOkYatHNNFlSbu8vyYy11GFkq7BAz/K4ZtV
 w9sXo3zTqGqathndVhMQqsY2UiImSrDedq5Y1VLVlaxcOTrMa7hXFpmvaC2yHRxjiK6N
 8n7qaWlilBl56QuNRZTfMZXVCJ9xMcbjAHBUKar/wCIS84vbG313qOyB2SfgCmBVo6AL
 NzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739814594; x=1740419394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYWUFX7L3xQ55tqjrfIF/T/9S+H6ZAC4k6kghP/cbS4=;
 b=LOGrfadmfv7xYXBy8iwGDt5wko0oRcNk7Uv+F0I7pjOcCthf54oBjA3wx5C/rWh01o
 HSe9rdSXXDA3bdXVwIVtDZCREsHBUNdPg57+d3CVWkmxXsqmf3lhfIX7l6zMgPZm1Ufq
 1iQ0BNlyOEeP7m5YrFA/dAbfeQrrfHC5fjLTUqaezKNTHFe18m3AbhDw5TTrketcVA1p
 p1YjRlRFYnnGZut8WWARoojQF27By1L50gR8/mfUjbuhGFV6xZN/k/mD2gHYHngThWlP
 uEylDwc/SnwC9uC2akDKomVzCqWDX5QZdr+VhJbKwhRQMXxr+Lyvc68ve6mQ0dnSQ2B4
 A3Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVu2KkQgpjMlr/q1f9pX/jvkGAzMaforeqrduOqNLnLbMuR73h/16vBPB/5sqz9+8NrqdMze7m0zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys+nzBDF/JsDKm03GJ/1IvJk0xtEn1Sd7iBv+psMz/+9F/F4y5
 +JGGU1uggzsfEhUFsFYIMNP7FyvTimwltU9OEmapOsJ77PwyoagRjrfS7e5oMjY=
X-Gm-Gg: ASbGncsSCfbweg8Q/v/RfKOt6asaiH9d/1vBOWwAKLGRHJGjJkUfxhE+/cvD9nhkwtY
 ihJA+iyzu4Goqqa+kafc4tYvaF3uScCakKbaUrr8akAIlc1y/g9FppfYiIG4NlXmRrCbHmaOwWZ
 MuGyh43PQiZ0UCmJeUYkubrRQPT35xEh2FPuv7vN/1cUWH97cE9uHJWtkt986wsVDrFPVxGI64x
 Q/BA2PVOqZ/d3DyHFjw9eQTiwHanPnLl+EYeYKO6xwclJkvRYyBCk2za5iCJoKc5LqRPfybL4ed
 L/vOpu6IXbFyWylsN1epUXRm6qISdcsk9HSclgkNRlQxzD4IVNvFnpHxJw==
X-Google-Smtp-Source: AGHT+IE2m/y5YsvXxKsv3Wzx+KzkXhhlReDwoumM4ckLj1b9VNhPYa2XZvG9v46RJP16guMIDyVnPA==
X-Received: by 2002:a05:6000:2c1:b0:38f:474f:f3f3 with SMTP id
 ffacd0b85a97d-38f474ff5bdmr4444095f8f.13.1739814594019; 
 Mon, 17 Feb 2025 09:49:54 -0800 (PST)
Received: from localhost
 (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f08:3b04::1b9]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987396d3dsm26816265e9.36.2025.02.17.09.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 09:49:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Check for CONFIG_PWM using
 IS_REACHABLE()
Date: Mon, 17 Feb 2025 18:49:36 +0100
Message-ID: <20250217174936.758420-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=QccJhcy6Z2oaZ/Faej94PmyVdYB8oVeM6wRuLu0NOK8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBns3awgzmekCOlrZnw4HPWH/Y5c+jEquMdixst0
 Z17rvwjAcqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ7N2sAAKCRCPgPtYfRL+
 TugSB/4p2IgLfab2Psw2xdOK7TWzjyvsJw1tJe/0PYfhxueK3o9PqysJJZ4v+fLI7//NLNCTWzA
 FAnCUV1eWscA1dXxjtaHc6sHUk06xIhDXTb7RayMaGKGy9IpdFGQCF8pEvYeK1aQklMxDAlE0wm
 h6pg4uiTxqedf8BBldGpEfmm/6Foblj5/dll//cpKCcI3rwaQXwtYPKd9fipYMJUIPxribAKyCv
 je9u9+Av+wdHxVDUbzN4+fIw6Z8hHB7tfEEQHBXkr78InWnvAzYBWGV0yrTb4ZImHMISvXUPwJa
 0+sda87KyFI4/iPigTULuXaFOa3GNmVYav5cmTOYclOIipUx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

Currently CONFIG_PWM is a bool but I intend to change it to tristate. If
CONFIG_PWM=m in the configuration, the cpp symbol CONFIG_PWM isn't
defined and so the PWM code paths in the ti-sn65dsi86 driver are not
used.

The correct way to check for CONFIG_PWM is using IS_REACHABLE which does
the right thing for all cases
CONFIG_DRM_TI_SN65DSI86 ∈ { y, m } x CONFIG_PWM ∈ { y, m, n }.

There is no change until CONFIG_PWM actually becomes tristate.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

even without the change to make CONFIG_PWM tristate using IS_REACHABLE()
is the more idiomatic way to check for CONFIG_PWM.

Note that IS_ENABLED() is wrong in the case CONFIG_DRM_TI_SN65DSI86=y +
CONFIG_PWM=m.

Best regards
Uwe

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1..c84976db9ba5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -196,7 +196,7 @@ struct ti_sn65dsi86 {
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
-#if defined(CONFIG_PWM)
+#if IS_REACHABLE(CONFIG_PWM)
 	struct pwm_chip			*pchip;
 	bool				pwm_enabled;
 	atomic_t			pwm_pin_busy;
@@ -1361,7 +1361,7 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
 /* -----------------------------------------------------------------------------
  * PWM Controller
  */
-#if defined(CONFIG_PWM)
+#if IS_REACHABLE(CONFIG_PWM)
 static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
 {
 	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
@@ -1955,7 +1955,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	if (IS_ENABLED(CONFIG_PWM)) {
+	if (IS_REACHABLE(CONFIG_PWM)) {
 		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
 		if (ret)
 			return ret;

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1

