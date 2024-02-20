Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739C85C00A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3F310E4C6;
	Tue, 20 Feb 2024 15:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gYeTg/qC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751B610E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:35:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41272d44adcso568835e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443343; x=1709048143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg9eYBATJE28KVVYL5JHYrMeYFjWDGTymWB+eHLR51Y=;
 b=gYeTg/qCuxUvG90WZB1W213MOFSlqTnT8OxUO7pVYjXLYml66JIEDNWJhBR5t2FIXX
 oP8gJPLORgVkkW1/DwzDFvzmsFOESRMCO5PGfJoYm3CM5/PNDax+WxDNRaH2iJlmaqqx
 bvUsMmIQnyiNyFn8KSbdMiOLWZxZ1af4/vURM0pCUptLO6XO+evU7p+Z3PnQQSiIcyxG
 8y4Sz86XKSFlrafZZWOrPX232wCFOncAEoY0GzxgsNBTeRac9fTI/AKHVHbH1vGYdr39
 ZFiXBuVEohXCpHOzVKsY16SkOv0VuBGVWl5cpEwsYCsndFrPG97r7xykmg46fHJyRtjs
 oyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443343; x=1709048143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg9eYBATJE28KVVYL5JHYrMeYFjWDGTymWB+eHLR51Y=;
 b=KWltMdUB7Y7nL5GSIfx8S2SmrYLwzXW3NObwQeGLmksnTyzCH1ZjldNbu0wnrj9Hfu
 wLAC5/lcftPyOJZlznnNFxon+tKjd2cVRfyWDbKI3IhoKMn/RLRBpCjEwKRtTVkerlWK
 VenCYxFgjBb8ntPmdT/5vzCJK8ouzVmiQYT3D1sATdQbDOfJ682ksL09i9rJ0B5vaGWI
 K/l4Km2p41ZpKn8cNdnL9IGDCh4iscaACKZMX9HCHB1NbBjlQdyKBwGFaxdi9sCBFt/C
 QG+2LgLnqFRKZmL0f1rgxMQgr0jx2EB2JTGiy9cAhrHDRGmH5vMC2b7rUb1qzD/E4NC7
 AGKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDZ1M3WpapU7ABF68Fd1x9Mrz1vBMd9LB5I/j1+kO0THV7aFbBwrrTYlSxQ3Jt5lR0RXMfWY2cgo0vDs3SH9KE2i0JySAhZ9KhvIogOXyq
X-Gm-Message-State: AOJu0Yx0l9FDI6fXpVwXgacrudy5b61UTpyYwcIXza+fyWWhLNSB4f3g
 y6e/1MJHVUfxNymwv4d2c1NcgUZ4jolHFVg+NP9S8SGJRIajCDxeOHMMug+5UOs=
X-Google-Smtp-Source: AGHT+IG8vq/wsIWwmwQlvm7aXyY0pdUfrR1TIk4qOIdiIiJ3ne1J8Iih0b1AG9jJ3O8+DPyJtcyN8A==
X-Received: by 2002:a05:600c:1d24:b0:412:6574:c9a6 with SMTP id
 l36-20020a05600c1d2400b004126574c9a6mr5189419wms.2.1708443343754; 
 Tue, 20 Feb 2024 07:35:43 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b004126ec2f541sm2444905wmo.0.2024.02.20.07.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:35:43 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/4] backlight: lm3639: Fully initialize
 backlight_properties during probe
Date: Tue, 20 Feb 2024 15:35:25 +0000
Message-ID: <20240220153532.76613-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220153532.76613-1-daniel.thompson@linaro.org>
References: <20240220153532.76613-1-daniel.thompson@linaro.org>
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

props is stack allocated and the fields that are not explcitly set
by the probe function need to be zeroed or we'll get undefined behaviour
(especially so power/blank states)!

Fixes: 0f59858d5119 ("backlight: add new lm3639 backlight driver")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lm3639_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/lm3639_bl.c b/drivers/video/backlight/lm3639_bl.c
index 5246c171497d6..564f62acd7211 100644
--- a/drivers/video/backlight/lm3639_bl.c
+++ b/drivers/video/backlight/lm3639_bl.c
@@ -338,6 +338,7 @@ static int lm3639_probe(struct i2c_client *client)
 	}
 
 	/* backlight */
+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.brightness = pdata->init_brt_led;
 	props.max_brightness = pdata->max_brt_led;
-- 
2.43.0

