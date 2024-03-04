Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560FD86FE80
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073B610FF3A;
	Mon,  4 Mar 2024 10:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ET4hFVwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87610FF3A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:12:03 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so346070566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547121; x=1710151921; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LwjyvFJUk04Z9SLWkJyPD6nPLgMovuAGzXog2OSB5eE=;
 b=ET4hFVwbKGprMSczVkG2U8DGnvdNBqLDA83CAuV2uEk0PnIZ2oHIN80vTR7173Ry7V
 hJySlJgNb3rs1nsbePfocPKpa1m21611r9CEvjz3GSNw+3Wc13vawVHEfp8XuxfzVOrx
 EgwHwqlvadELoVMYqN7ctrbRj7Wbb6ipmC0cMWb93WiSFcZse/AdHJLVP//t/oLRxJVM
 cJUFpWxQO/gS3M08CIVfSwHy/rijJHVsloPSR59diA8gThU9sS7iZPlvqchdZYLJEunt
 QId1mYbpbcVKA8MreD7olkadPni9OCOZrjaWvLTIsp/wrEFBqrLDSnxrzcanxUfaqIy0
 jZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547121; x=1710151921;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwjyvFJUk04Z9SLWkJyPD6nPLgMovuAGzXog2OSB5eE=;
 b=I9yvZ2AnUumJ/4UOoaU0qIPaMkmWDZ5kruzD4KStj32IIoWBJPpSd2+iPXak3v6BDz
 MsFjhlQM4lcmDgWP2C4Ds6/JRsHM8J+r4e8aBn0xvHhJoIQky3DZ4r4VxRKX7rH5Ec11
 z8M/Wa1gQlNW7IBEhvhmijHCV0BiGNbyvgQsOSu5zUi/xDVY2ohpZrbx4qAKmXy5kMNE
 x2p07pFbl+KN6/l/Sbjqp67E7mz/z+KftqfqMyO39eBfBtjyyGFPkzc5WBdrPVIiyblN
 bvbNsn6+x4U8p4f+zaLZN+Y/SqM3xwRLpL0aRgPekPD97XtpAGMFruvUcrs02Esm5XML
 r2Lw==
X-Gm-Message-State: AOJu0YzWwD6Zuo5qC8rMTBZKjl4gHOJp285tBkhaHfZu+KpEIbexv0D5
 yY3Gei5zZ+u0NqsXGtjOmhhA045InoYPw+fWc5qUACWMl/fQaJsyhfSSy2HShRU=
X-Google-Smtp-Source: AGHT+IFUzjedvr/C84chcdr3/bRdz0Po8+qn9pjVm/iLXEGelmIh6PIw2Cts9hyPI3is7lGZn4Uqbg==
X-Received: by 2002:a17:906:d20a:b0:a3f:c006:f141 with SMTP id
 w10-20020a170906d20a00b00a3fc006f141mr5347674ejz.62.1709547121499; 
 Mon, 04 Mar 2024 02:12:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:12:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:43 +0100
Subject: [PATCH 6/7] backlight: lm3630a_bl: Simplify probe return on gpio
 request error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-6-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pd2WBlK2PnnolkSqpfShUm10rFxXfMK9JJcdv/+/o+8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5lXJ/VFjg/mpbVkfSabBfIk9lZsDYAkyfe/
 D+nlFwxH7iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeZQAKCRDBN2bmhouD
 11j9D/40TMnoJeYnOPMbLd5xVtL3dXUyBwE62gtbjuZcDCQVRF6H312FNVRBLVT7r2af2vQUh1f
 17GF0ogLebzfS7zgk8oEakUcVhkyq75oe02QLqCD6dNLu3sqeDVVW3e9Fqj0sb0UeaSHmaoWJ7+
 bP36HaSjz6gKYGqCuRQDiXSAed5uhxEW+B2cx7tyuE1j9IbyXs3WPZiyimbEYPiGXMrcg2byaOM
 Z+lNdioUPzs/fdMNLFlGD2DLdBHf4MlasTvQK4MCkk1CtF4KqnyqDMkKDJtOxTrzfz4FIJ8KLVR
 oLFviGSGKBbwMWywSjHw5aYh0guqG7i+RpAsh0fCQzShk8jZEiJAFJuvvyIGiz/XwGD2zyIyduy
 BIvF9Oaco7OeswzIqZ6Wb9+xBUahYeESyrNthUD+xFaynrVx9KxONqkL9l94IyFNqUWMp2+SREO
 aMG5K4viwKrtcjepKKRHZMdds0uNiE4HC0qqocxELok9nQ9lpjifoeVULxwx5HTE3hw0ub41Q4Y
 um9RLtNuSP4cn9IWYcrVJ78ZEP9LAcef2DwfCpR/lEdtqDV2dDiFni1Yt/b6VgacmVbyvBaUld7
 Po0f1M2DCrEH7UPbHXYgXCfhZ+B1Bp/XKFsDmz1UgsRVFJ54UfUCo8RJnzySYQOPTSmGT5HOudB
 o90wSGxwVpTTALQ==
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

Code can be simpler: return directly when devm_gpiod_get_optional()
failed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/lm3630a_bl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 93fd6dbccc28..ac0a60e39e39 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -543,10 +543,8 @@ static int lm3630a_probe(struct i2c_client *client)
 
 	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
 						GPIOD_OUT_HIGH);
-	if (IS_ERR(pchip->enable_gpio)) {
-		rval = PTR_ERR(pchip->enable_gpio);
-		return rval;
-	}
+	if (IS_ERR(pchip->enable_gpio))
+		return PTR_ERR(pchip->enable_gpio);
 
 	/* chip initialize */
 	rval = lm3630a_chip_init(pchip);

-- 
2.34.1

