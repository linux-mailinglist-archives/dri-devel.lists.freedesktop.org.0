Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D2686FE7C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034F10FF37;
	Mon,  4 Mar 2024 10:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DWBCKf3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161E710FF37
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:11:59 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso985896866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547117; x=1710151917; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ne2X+cO3epNXe9ln4awOX17bBGBk21696xx6GBwAIpM=;
 b=DWBCKf3qv9J0mPCC3UWo7aVaFnsb3hPtgc21R/RZXC8hP/2dOS/blAy/lyLJSZwpqo
 dOYbCd4+a93BcW0PTfaXAn9MySXT28zF4e9o9y0HjEqJojHtBPgHmG220NKVPPvtXAnK
 NFxV0+OljbA+i+kXRcFAACpnIVLSL7aJImGgzeZWDcibClCmL1arbR1uRSwhWdlYpi9K
 +lXUBz1l5wt2BqAqQ4Pk1Qw5bj1IbhyPbJTmkc86BZVWSzq7Xx0cLr32j2GZbrB8xVV/
 /0Fl19LP14RfIIUalsgPvw7u4hODrOntMbUHJCB65Wj04JvzpcyuXfI1ei0OM/8S5TtB
 dH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547117; x=1710151917;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ne2X+cO3epNXe9ln4awOX17bBGBk21696xx6GBwAIpM=;
 b=AWsewXnHhOoXkgF3NtCrw1r4EO0VFvioTPwxJJqcx59vRGK35tjCMquDr4f1zopG8K
 Tf0a/nq5GVIgJEhera41gTs3QsZ8ntu7s+HWIy092LDAjGAoV72vPURezmMiq/Rryj7G
 iS/BpjYdWavUHT0H8wJs/MhvccwBXMTNWzs89XDzL0+UzKfi6uRr8SErB8/t1oJgBHsX
 tn68foYQJPkJcsJ18YFkjOD+8lDuLaR7TsUzKgDW1GtG9csKwJ6nfeYTlUVlsiOFHvIK
 scoCWGLX6fclOLmQc5oEYFAuRfKN6dFO1kiDQF/8tTbW/cun7EIpDXMtd1bwWx7bLCT7
 /kdQ==
X-Gm-Message-State: AOJu0Yw1q4u05636BvkiaWEeGc4lURwk7lvIAb0dZ+sUnWGgzlSXaNpw
 9WUenjHK6flUAREJicWnsUY3oA6YrlFvWdGLK17PVWRibFUWnGRbqTPgYWrC53w=
X-Google-Smtp-Source: AGHT+IGVbbGsL8NOOdTcpOF06AVc7bLlOHtxT+CBCYGHBhkmB+OOeSg+PN2omYlET3YAC6IP7dKJ2A==
X-Received: by 2002:a17:906:6c97:b0:a45:2cf3:6c65 with SMTP id
 s23-20020a1709066c9700b00a452cf36c65mr2316877ejr.25.1709547117400; 
 Mon, 04 Mar 2024 02:11:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:11:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:40 +0100
Subject: [PATCH 3/7] backlight: bd6107: Handle deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-3-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oBEkNwxibRPgfDk3iSeQlCR1ZXaxiSrVLWAc+9a0T0g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5j77gB1Wx0xWhb8EDQs62oL63I8/c7sddDs
 CC6aYwM7c2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeYwAKCRDBN2bmhouD
 1yAHD/oD63Jj+FaduY3m25CAoOSOqZrt+/dbgU985Nod7ZV2XRRMJEItdueEuA3748jPE6o2Crw
 iKIWC5h+bsPxgR4zl9V2j19cGWY/+UdpElaCU3a5y6IeK6Gibi1CCSovo+wY3sUvFhe/JPp3Ehu
 XABYIK8t+C0udLjNPoTi51pdBqNmWcTHa6zZH8B4i+mbImB+4h4wWt7zbKgAd5RBGCeSLDon4y5
 UdXbUUQ/M1VobGvTvha2KDdxmCQ0ZuItOTjzQ9eCh7aa071V1uHbF8IHTvLiCdCrQGd099Xc00D
 A6JyiyJIiOiid0BRh7EC1/kIHHbcXfogpZpcpaSGr8IxAj7bytITyUtMAIetq9D/c5t9Rlp5PAf
 WHm67lyeJxjyMXrW8BWbN4FeukFR6Qf3WlwEKxTBd8ItB3pvZ9+/LpVhRv7mAI+TST4qKnvoJ+3
 8WQlYy571QWu0kYwQfVXIz3gCS1G+lbBlT7pkydCU9TeAlxtjcUUt3W8yehDnRr3lzDlTTsH9wV
 7TgX7eMnoNQ+kReZ21Auu/HX88NDWYCNQ7rPs/VT2RckfKP7vn8JdWnc6P4N7yC4kx+mHKuizue
 mcvUhlAxB57g96zl7F0RVZ7gq5r1WhuKnIogHxHi/ZaCWVJJTSJ2o8AdIvgg9PVbHlvnM769UnO
 8X9j3780xbqzNcw==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/bd6107.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index c95a12bf0ce2..b1e7126380ef 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -119,7 +119,6 @@ static int bd6107_probe(struct i2c_client *client)
 	struct backlight_device *backlight;
 	struct backlight_properties props;
 	struct bd6107 *bd;
-	int ret;
 
 	if (pdata == NULL) {
 		dev_err(&client->dev, "No platform data\n");
@@ -147,11 +146,9 @@ static int bd6107_probe(struct i2c_client *client)
 	 * the reset.
 	 */
 	bd->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(bd->reset)) {
-		dev_err(&client->dev, "unable to request reset GPIO\n");
-		ret = PTR_ERR(bd->reset);
-		return ret;
-	}
+	if (IS_ERR(bd->reset))
+		return dev_err_probe(&client->dev, PTR_ERR(bd->reset),
+				     "unable to request reset GPIO\n");
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;

-- 
2.34.1

