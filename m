Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637085BFDF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A45C10E4B0;
	Tue, 20 Feb 2024 15:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PFNqDx3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F0610E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:30:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4127077ee20so4171755e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443017; x=1709047817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jrtujh/LnXfvYMR2N2cwo9zSO80+VM2HiXhsn02tIjQ=;
 b=PFNqDx3sJMuz3GAz5LD+iYULrQAgbaKdjYOit4LsbXoqmtcz4OluiNIuIchI97P0z7
 ab+5P6dgc5kJeBbn3zGG8+rfLXsTZNTMU/3V54dEYIw7tqvjdVzxnAVyC02QvfxBClri
 r1UxUOFofuXzE0SkBKS3UwZzDTW7Kb1jw4SgVTH/3l0w5MK934V4bysQ1wcm5uFYt2+g
 i/RlJfhzxE64zG6Sf7qayxQuQ78l/9SkYEIPLs3JaYmOkPCrZMdu713DpMi5Z0AhQ11O
 30G4C0uHtEH9a0zXgLeItsre1XO9U3xoxo61ya0Md0UVnRIuldtn3/rLAHjYrjBtJphc
 TU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443017; x=1709047817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jrtujh/LnXfvYMR2N2cwo9zSO80+VM2HiXhsn02tIjQ=;
 b=kEB3COg5fw601XDrKbTJvFKoZdDCE8jxqwmh/f0whBqBo2nMQ9C8xnqEOy3nQ91EPJ
 7MK0N6WPZHrm//bNrb/2AOBWWw636QSaMYAsFdBfA/E6iH1uXQ86QkgYMQqNfF3X8gw4
 NcwpCKUw14mdJRB6FLFnOLUvIBi4j6+IKuBvP9FHIID1udLLMRcjgLQuK9O/Aj6sVGeo
 TdP35gnPlLOAD3sgQfaN1Cy7g1XX0AmZtesnX2PuBRIgkQUTvcRxyxFfOy2DbA+oNXQ1
 UmXApaqGI9lwYCbvM3MSAnSxffMJg4kjN4DCHPOhg/XT8eRYcprV7R1mRKaPkDeq/gIF
 m8Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiC7x6X31yuoVebmXTTtqpl34UZ9zbUYyOu5APSojD3Ru896VRB4oIliD517tesOkyDaeLzWQ6t7/e5FL2N17sSLcHZtsMLgkV9tP8Bz/Y
X-Gm-Message-State: AOJu0YwaY7o178bBBnMmLEI5wmocW/cEd8ZjEc5ADnb1wt+Sl/eanmSU
 xMWjA61ashPl4b5C0jfG+FPIqnG4yzQn53MLsC4gg1PCag7U/w+K5lD1/qq12Ls=
X-Google-Smtp-Source: AGHT+IFm14DobYCPmbNLGol/rwT+mRhKjIrwciaLuFCcheE5WveQ1xwJForozYxveJbElFbLbjVPiA==
X-Received: by 2002:a05:600c:45c7:b0:412:63fc:1c4b with SMTP id
 s7-20020a05600c45c700b0041263fc1c4bmr4848698wmo.10.1708443017431; 
 Tue, 20 Feb 2024 07:30:17 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b0040fe308ff25sm14691564wmb.24.2024.02.20.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:30:16 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] backlight: da9052: Fully initialize backlight_properties
 during probe
Date: Tue, 20 Feb 2024 15:30:05 +0000
Message-ID: <20240220153010.76238-2-daniel.thompson@linaro.org>
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

Fixes: 6ede3d832aaa ("backlight: add driver for DA9052/53 PMIC v1")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/da9052_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/da9052_bl.c b/drivers/video/backlight/da9052_bl.c
index 1cdc8543310b4..b8ff7046510eb 100644
--- a/drivers/video/backlight/da9052_bl.c
+++ b/drivers/video/backlight/da9052_bl.c
@@ -117,6 +117,7 @@ static int da9052_backlight_probe(struct platform_device *pdev)
 	wleds->led_reg = platform_get_device_id(pdev)->driver_data;
 	wleds->state = DA9052_WLEDS_OFF;
 
+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = DA9052_MAX_BRIGHTNESS;
 
-- 
2.43.0

