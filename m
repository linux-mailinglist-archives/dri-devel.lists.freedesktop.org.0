Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746585C009
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964B310E4C4;
	Tue, 20 Feb 2024 15:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QA2sUlsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296EA10E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:35:46 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41271096976so3384605e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443344; x=1709048144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcW5EHUKgbIlTJ9AkvlcTH/1qNEKLD/WUfYuV6zpMeg=;
 b=QA2sUlsIsHmlmVKk+UEwVF54LL403Zydcj9yHH+o7/566UJIWxg3UPW0URAVOSRw9H
 5FmR1Wi+jjmENlJBkL+mY7GyBt4RjQxdxtDsmKmFIr44QcOSD3FfBEySx344ZQv/KhtV
 yKIWPkcOykC4QSD9DeU2M/gwhvFS/FUQ/Blo/jMI53e92ckZ4ta/Tj9ZoRiD/Sk8kyIv
 n+LXxtm9p6gAUAPiJFPZbvqpac30CUrBsfHcOdjrAkS9r7hyXPoA9ckvj6781lmQ48j6
 qwG71k9r75uetXMUanfHbYOuxdMf3fBAAfvfcChNxtdnEjZvuuw98RMAZlDsk92KONAW
 FRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443344; x=1709048144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CcW5EHUKgbIlTJ9AkvlcTH/1qNEKLD/WUfYuV6zpMeg=;
 b=NzOeUBPzcIpKTrHBY2CySIINY/HG+Gi3QG5sbTFdRPoO0Ij5DXpRHrxjPEWKXHwQBG
 L5HNuqn5IcuAKQpXZH2xwjZRE7ThAmqHTN9KcDwSGM2PVWX++PLSAf143R6FSsOMwxEv
 s03Gobe9tQLYU8TS6JD9m1gL2sq7Yp/aH7NA1kemInDlfrf7XtgwTSLOwQLnBnTgfvaY
 4n+KOn+DrotHZtjFcpineCeGsDVq+H0lIdbgoHcrNoYJMLBBD4DinK4Lpi1f1//OelYE
 pnu/914PbtZ50EfS0zHpKvWSFW9QMrZKaOKm2tZ8HCVxMLMMsj0tGyKdx+B+vb4ZzT1l
 awPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm+F6jtj2CTAoesEA9ZULPZjQdbrkTJSvZP2qMdcjDq3Y69FC5Up6pbDbFGB6xi9bVRjqBcd5dSbX9qiM1Bq2pFCIXQOU770fNZ+uYHB2o
X-Gm-Message-State: AOJu0Yyc/b4T6A2igOqNqWm7bxa4M6Fk1kl1xuCgm8jbdnGUFZeOxf7d
 Sel+8dOkX5r1LDuiY6X7oDeNHkcNEh7/CxIHe0kD5jyE3ubgQ/i/DOIky0c3l/g=
X-Google-Smtp-Source: AGHT+IEpCXV6NsmkOJ9aSe37i5U0I9NvAzq/Dog4zLeK5T/NulYxyznqCpuNmqivjX1f01yhov8nMw==
X-Received: by 2002:a05:600c:314b:b0:412:71fb:7732 with SMTP id
 h11-20020a05600c314b00b0041271fb7732mr408200wmo.38.1708443344393; 
 Tue, 20 Feb 2024 07:35:44 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b004126ec2f541sm2444905wmo.0.2024.02.20.07.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:35:44 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/4] backlight: lp8788: Fully initialize
 backlight_properties during probe
Date: Tue, 20 Feb 2024 15:35:26 +0000
Message-ID: <20240220153532.76613-4-daniel.thompson@linaro.org>
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

Fixes: c5a51053cf3b ("backlight: add new lp8788 backlight driver")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lp8788_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index d1a14b0db265b..31f97230ee506 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -191,6 +191,7 @@ static int lp8788_backlight_register(struct lp8788_bl *bl)
 	int init_brt;
 	char *name;
 
+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = MAX_BRIGHTNESS;
 
-- 
2.43.0

