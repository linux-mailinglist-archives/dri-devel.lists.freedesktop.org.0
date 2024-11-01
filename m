Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CE9B87A1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE4C10E15A;
	Fri,  1 Nov 2024 00:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nrcaQfHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2510E116
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:15 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f2b95775so1688696e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420713; x=1731025513; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=nrcaQfHg6YuC/0tvY8HvkWGFOtWjVaSetx+o7jyirX6QZE5Yb00f2OprHUpD7M/9lS
 r1zhEXWF2fAoxCtkg1yq8RQoVcJNWJnk7jBSneRITPe+L1jMGfUhqmYrfx/heGnKeKG/
 SbbFsdFV5k21WJW3rFAAOFNIfgIWaW8AahLVwls7JZ+IvMUSkXnBY1ZFmVb5Qw3ZSOqz
 fqkEswIe4uJEk6qDqxhXt9LhZAbshFInc5OROkUt14EcnL7vHqy6D+PA2wep1A4HB2pg
 Kyq/Juq8b/MO028XqbzgHt59dRvCWJx9iAW976M3EwQQMPLvxMT7Cb0v0cN9bymjvaDi
 Rkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420713; x=1731025513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=Blz1W4PINVHjX0hLbWcI3zPCW6hsFJ/02z0uq0yYtyE13vuyfUd2JCcEAO7FoNRqv8
 dmJ9v9zAgQGThJZpFtlgOeh92bFUk0JBiE7/WXMc3lfhsgTmXINR9LJcK41/0kYJ94sJ
 wuecZFk8v4/UB0cMFthcBJg62wGHLJSdgb6JHqCtQHR8WfK6aTS5SyMoWwi7fhMA+EgG
 /VuC6r2oBPwvt1PvUVG3E+9Z6BL+Ay68MIFvsFNuGITOIUi90p2YmG32A7QSZA1gmruh
 I/C32F30fqit0pgT2Whr5DHPOFrvlJWgNUOjLS/HaS4zTD/EXGBp23vUu0EmAzGVPMSd
 GjHg==
X-Gm-Message-State: AOJu0YyZw9aMmDMVqPU/NeBL8j3TySuUCLb8Nupzd7SzEg0JG1vf3fhy
 zBZKR5/DY3ljeT78KSpraFKcQ9AiGlWdUY65EIHQ9Z6H2upgyord3M7xGAk7j/Q=
X-Google-Smtp-Source: AGHT+IGbq8fCpRY1c1bmmg92095C0kqytUrIWwSrZUXkLxY5mzg2koxLARty7zdJQk9WrWqL2+9CxQ==
X-Received: by 2002:a05:6512:ba0:b0:53c:74a7:43de with SMTP id
 2adb3069b0e04-53d65df2488mr1464938e87.29.1730420713436; 
 Thu, 31 Oct 2024 17:25:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:05 +0200
Subject: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hVs8ck2mIuOojDf5BsZyDpCAOCNbvDgTjB
 eEdeVyvSe6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1bLuB/9NYYP+2gWguXV7p7pxvci6OEsal/Vmy8LRfAO4mZDqwSPpZaLvK3tQVnCC2tplz45RV62
 KH7xpFWZe4L9XV8JIyduCPu3BEZe8cdEHSNio4pUw2nXKz8fuaj/73N0DEwpQF87bixbIKyB11p
 EjmlZKOFvHTJ7yeuUgUUiKM6X+RDLGiXX/Qof/VMIgQjhJT0Q4qmUg2B351WDikp1lpmyRxfTpd
 eX0xqtaokT6BLTm64axs7FFb8od8hvVrsfpfiH3FuPtsW6Ca6XVMAIb4t7YNGUs/h7Ob4NcwJJ8
 xbghQayNSZROF+m19E/pCBd8Dbmht0Ig9PpLzYlQ1LJDdDRt
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
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

