Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771B685BFE1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CFB10E4B6;
	Tue, 20 Feb 2024 15:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WpBG2cHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F1410E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:30:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4127109699dso3369295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443019; x=1709047819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg9eYBATJE28KVVYL5JHYrMeYFjWDGTymWB+eHLR51Y=;
 b=WpBG2cHxh0WVWaHj8nUBp+CBDAXSymqw8zgzSvyqFI2uA4hsVF5jWNYvC3N7wSUtNr
 IOyI6u0ozaun3B4N9kFQ2grUVlb/5JxM89noZpiOPGm5ucVpqBtDXXSwkbQPHI5AG0sH
 iiLVjjFcUa1zIW/q022/uJmbXCPyk3yz9vMhmTWmrKbZA3bc+lotEy7EikrBUcz9ytpJ
 +dAzBpC9Kjysg1Ykgahchys8K6wYySal3FRD/jxDG0H2Dna3SI/RaEx4a9uNjUhvZu1w
 s4FeqvOcFs8wJJcdckSTNF2uat+lJkTLh1/yFznalgRD1Jqdi+19A7qmG2ZYf4T0YuRx
 gdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443019; x=1709047819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg9eYBATJE28KVVYL5JHYrMeYFjWDGTymWB+eHLR51Y=;
 b=SbO2rE3GfgQC5vgccW2XY1PyTXtUm9D75iM4CmHFxmW6KwPxZQ13jkfKYQR2w3AtcN
 YVcJ8l27i3WkH+VQlgaLGX5yyi8dflGC7Lfyi66cmSqCCPCGw3Isp09QbCt062SSWQMe
 gp/xRlWwutRPjJBX1FDM8QdpKG3sphnXMIj4l6CC8qDYcmHmwx5IQHIPK5aOdvrRfuCN
 ya6z9xOYDLdfirFgIX4v69UrDVrbHEcf+nQUqMIhFBpdBjWW390Y+itV2z6Rvslb/2tm
 xBx0Z4tyQa3YIkUnZeyhYKG6J2HADjgf6YzGyU5vQ6Uy41I2lACT+twzpuTeRJtPGWxI
 4Pqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfqie5EwAX9CPbxBoFZqKCipbRLF9fIy8iR+TJ8HYCPwfFf6TIHIdTEI/86a8+gP7nkSm54Q4gl6ieW4BFGShbIoV65PIt45BWo1+Lznhi
X-Gm-Message-State: AOJu0YwsH/AVyijU/azRs67p7mRKp/g0omjX++8KQCl68lBi+UyhQscz
 z5dp4qyEDwEY8VyVbR5zgSoynEPU1V4yVugaK0IXbPiLs/IedL0l8MMIBFT/ARA=
X-Google-Smtp-Source: AGHT+IGVWP1PsTIPuhfoCEDD9mFLoVD1M1jFW0GdMz0Ht5jy2dnUwgwZCQxJtaVq+F+uxqiSbUMY5A==
X-Received: by 2002:a05:600c:1d04:b0:412:62ec:672e with SMTP id
 l4-20020a05600c1d0400b0041262ec672emr4734507wms.30.1708443019097; 
 Tue, 20 Feb 2024 07:30:19 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b0040fe308ff25sm14691564wmb.24.2024.02.20.07.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:30:17 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] backlight: lm3639: Fully initialize backlight_properties
 during probe
Date: Tue, 20 Feb 2024 15:30:06 +0000
Message-ID: <20240220153010.76238-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220153010.76238-1-daniel.thompson@linaro.org>
References: <20240220153010.76238-1-daniel.thompson@linaro.org>
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

