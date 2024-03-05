Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE0C8717B1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394A6112919;
	Tue,  5 Mar 2024 08:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XWXg/mFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E52112910
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so7835282a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626341; x=1710231141; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ExK15caTzPYyfdwBopINcQ7SZOSz6etjc7XyN0ZMwpo=;
 b=XWXg/mFGCVEHOH2bWvc12QJgpivJIYslaK9K2wRm2zZD4KXuirzyKDcI54ou8FGqGe
 AsJ/ZmCu3I7+MbjHYGQVNt48kH7MDt5c+YtUNZ6wfaH+bArXVi1a+jDqOh4Ne+kpq3Ig
 wNzYhane7tsl6VOFXauWqLDWEAq3nUSAUcrX9lMYJTJEghdd/6VZ6X41ZBkvF/QLOr9S
 8j7X4zu2fvUZdWHTHSZl+EYPcVuiYnBQjQS1GcFEzSEEIyKGF/Wd/OAF2jUHafQ/cr3c
 PMJOD0jgUQiW+p0aWo4BjgSGZB65PGSpz/VfLTrcinn8x007cpmqnhVkEBUAZ0tFeh1I
 5wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626341; x=1710231141;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ExK15caTzPYyfdwBopINcQ7SZOSz6etjc7XyN0ZMwpo=;
 b=mF7SYp9+l3HcE/CjAEguOJD714N0+2+aMtfuT5IwIEv9FDQ/5AgEqoiRyCfbtHr4Kv
 9iJDveY2wO6d6zfe5eup45ADAGkvBkqerUkQLIfyrbgXS38P6Pp7nYG7PCoHp1wWnBAs
 gReavobt7rSnsWjLTizlpZgXbqnkV60jRAJT9YIQvph66f7Wsq5VGEUoSMmD26KlMJpp
 hGEzIAymXnGlujx3wgsEMF2t1A+Rclt57WdAo70bwEkv+f+VlNVewAgnJkg/StV/kPoX
 A9d2xl0PMN/i46+MOehhKNt5lLK2R61p8vj0Y0SXrtPJqSFKYsWeaDJi+/pcSedH/Crb
 /zvA==
X-Gm-Message-State: AOJu0Ywx4O9sA4Th8YRob8rsob+b/+Ce+9YDtH+BO7JlKGmiXCyS0MiE
 C41i+kOo34d9FckM/2GuH2oRAjqrjvtUQqnr0LaGY+yoUn0PIrUFt8W+khAXSlY=
X-Google-Smtp-Source: AGHT+IH/uA8GkUvAAQ9ECD3IzSDFIVVQwU0E2DIbx0rKbCTdLIrwu2V+eRJ+cIeAiM/1pjiB98XZfA==
X-Received: by 2002:a05:6402:2315:b0:565:6c72:40a9 with SMTP id
 l21-20020a056402231500b005656c7240a9mr7989319eda.28.1709626340845; 
 Tue, 05 Mar 2024 00:12:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:12:00 +0100
Subject: [PATCH v2 5/7] backlight: lm3630a_bl: Handle deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-5-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zeZODmCY1S1uqMpI2blr7qYy9ZObZCI7jQk2MUKiyFQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPZD8MWfLYEt6rCWdnIjlfRQIRJw0u4/qqS+
 k5T0+JBGS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT2QAKCRDBN2bmhouD
 12fvD/4o0bBt8fofIHD0XpWwJNvU3Os3cazAVsGlsrm4AuCVvGk4aJQUwr2TiCM3Tkz148/bo04
 ehgJuqLPlK6rYX4fV7mjoMH5d11p0rH7Ik63fMZSXY6zDeOGCXR3nQQXSJ8Y1boQ0sqOCTS7FcA
 4D+RC5tismY1qTv62ISrDmk2aVKW+UwAXM3Kt/rrxfN9sNQNh2XdZrdMN3QCwAsbyTAAM9k+Sah
 a7MNxdBbIVgGdUN2XZXri41Fy6WZXRCKDY34ISqggHrDp9u1q+JdB3Pvj68dwlBQthT7Cg7wEJP
 TA+vuZiV9M/TVJJT1sQXUs04vKn0BoVS9z6+h1tjhcNDWlJRFA63MIKJT2mw+v2UzcESTKY4scn
 ZHNt/lrucx4IoWVrEcqRxuEuvU5EDgG29iOl7BvCUattDGdpScEa5xxY7CCalBMIW26ip0r3jmf
 iyWE/FslUQjV5eWS4WgWzLeBFcKM7kMXojpndsq2Cl20ZQ9Zbb3wXMAKTlgAVroWrN845KAHvtK
 Ejq/Tcd680GH8y2/bWK/E9OQD2oP/K12UQltNNyvPVkO2NeQIaNAwRxOP3rBfGtlGhBrN1KYjp4
 ZsngSrMfZarGq8cQ6ZjWGWsgbSWrk+CecKiGZLj+kijL6abbj/XTfgUojaUpKnlbDanESNAGN3u
 obK5/meKgl1VgFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Don't pollute dmesg on deferred probe and simplify the code with
dev_err_probe().

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/lm3630a_bl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index a3412c936ca2..93fd6dbccc28 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -563,10 +563,9 @@ static int lm3630a_probe(struct i2c_client *client)
 	/* pwm */
 	if (pdata->pwm_ctrl != LM3630A_PWM_DISABLE) {
 		pchip->pwmd = devm_pwm_get(pchip->dev, "lm3630a-pwm");
-		if (IS_ERR(pchip->pwmd)) {
-			dev_err(&client->dev, "fail : get pwm device\n");
-			return PTR_ERR(pchip->pwmd);
-		}
+		if (IS_ERR(pchip->pwmd))
+			return dev_err_probe(&client->dev, PTR_ERR(pchip->pwmd),
+					     "fail : get pwm device\n");
 
 		pwm_init_state(pchip->pwmd, &pchip->pwmd_state);
 	}

-- 
2.34.1

