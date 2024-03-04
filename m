Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5186FE81
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4CE10FF3B;
	Mon,  4 Mar 2024 10:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NXwAoybP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6D210FF3A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:12:04 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a45670f9508so56166766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547123; x=1710151923; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qkscxkyuLKmNGJ13PCRB5gPU2riBC6Uyvc9FkqhiTrI=;
 b=NXwAoybPf/aaUJdA7uVLvz6bxwAmShLLyJfC2Cf6wzK976aOkatQSwpF8nS00USkmm
 PuPAEHb6YJWq+KLC0lhlxIek7Z4vfrs22hcxW5q1u/Mi1zOKkmQ20b78AFBXnK+SXTkM
 h6jgatOI0h2fDJ8Q23u+x+1ovahq9QwVssCvjOhslr0sX/bt2DbGnD78rGDCc9xMMn5O
 ezvqtwm6bGy3Y0l+ZazrgGuOhiGa0gmHSNLPIyTKVvopUgJ/z9MtZE9Unnl2DkdSwPq/
 KjBzsm2D+5sVhTiR6rR/nIX+HIEuYxPQnNwRIbF4Cas6onqpzRzc2/mtjjXJEeWxT5O6
 lw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547123; x=1710151923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkscxkyuLKmNGJ13PCRB5gPU2riBC6Uyvc9FkqhiTrI=;
 b=XiT3gBPrcgISBXQOwSDmM7P+qTbrQVBvlYaglmnc9AWIq7J+nDXpOES50byCAOMC6m
 Lb2KNbb8XQQYj9/nZPx5AAXT/ssbht0Cagiu2TOVYy1jQ0DH0UdvczX7faTI9cHyRS0I
 tGU/O2NGbCskFptm9fNwnvreuSZnbyrFm9T48NzNmiRF4Y07OOXj1l/bxokWfg/vNoUE
 Kzd65ob3KvK2MYZlXFWhWkuPCxJxPRcsqTNXwfqCA1uFIccLFiR6EdAXwSqIFGgJiCfd
 p8BNIFGxIu1VcghOhukYNK0LBY/HdD2h4HkTpbSP1ieUgHECKvH9ug2Kw9a5D6Y6k3fT
 dDnw==
X-Gm-Message-State: AOJu0YxJHol2307Ns5Ag0kSXbWHROqc1jKlsIAGDstMdqYJ5iKABaGAN
 NIoXgTSIPjudfxl4cvgDuWXT0CGNokOEzeEI88LINysZ8TVN1UiQkHBF1KBFZVWzZV+5LeqhL/E
 O
X-Google-Smtp-Source: AGHT+IGrR48vptQZf+rBErBNW3zRh8A4eRQbm5RBoTdBYRzBDUp2kfXMSXqolT28sPSNVPFt+B9itg==
X-Received: by 2002:a17:906:1c90:b0:a44:86d4:70a1 with SMTP id
 g16-20020a1709061c9000b00a4486d470a1mr5679948ejh.59.1709547123118; 
 Mon, 04 Mar 2024 02:12:03 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:12:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:44 +0100
Subject: [PATCH 7/7] backlight: pandora_bl: Drop unneeded ENOMEM error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-7-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IQiBIX1ptsqUCh17mmsk9JR1+iQzH5+7RhWBq7Lbzeo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5mnfBQ5T6LEu6wSHreyeIddxcFaUtThG5hR
 a7P7xtBFQOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeZgAKCRDBN2bmhouD
 1+bBEACC1mknggxkpb8buuVG+0wI2sOUPaDlTNanVp8VneZ1l/BNkKBQ16feuUhfuQwjRbtWsUf
 ZuSeoXHhpFP4r86SdVkbEVDk2lHP0KnDRoyq62CN2cvKV/jH1gOV+dRRjQwaQ/+1O2GMx0mPbDu
 iaqhbqb5oqrns4Ycj+pUyBUD0pjID8r0TnOsriFXB2OKlIj30CaBhcaq8P6ChS8t7bP6qgDjSqs
 jUOVa9GFE0IiX7CJhIBtOO7Uk6GaQ12WeQxZuikLzwrGgiv9PCvohPt6a9xgmqEyDchFF/V+IwX
 SXAHRzQdkez8EzzNYFlwKbaRtTOzF9uPqZvzLJowH+HXPrBowr7kCJ0XlBosRMxlNkeGPjGC8zF
 klwHa4J6M4rQnL27yx8qzkeaTjuHw2OCKdyrBEFikRSKRNWw0tVjgKWdmMJ5uP7LXnLGxiK330C
 UbwI0ZPdFqScbrPDf83rLA0+DP+abdH2Wr9o0vbFTuEW8NxPwqys23rwj29dj7O3Hdw5okM306X
 kMaeqS5zhQ0Oq8XJrf6wUIGnGJkLS9anoWh5FJTS+xQWg0V4kfM1v3bc7klOT2G67xTXllFT3gG
 TAkA+gLn74eZZxkaYbAwdLovsbQnn1Ey7Zoui+W7wRwR8NgCwbgKmETXcsNMbdkRGvXyAstq/Sh
 X7Mj1VxLbKE+uxg==
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

Core code already prints detailed information about failure of memory
allocation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/pandora_bl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/backlight/pandora_bl.c b/drivers/video/backlight/pandora_bl.c
index f946470ce9f6..51faa889e01f 100644
--- a/drivers/video/backlight/pandora_bl.c
+++ b/drivers/video/backlight/pandora_bl.c
@@ -114,10 +114,8 @@ static int pandora_backlight_probe(struct platform_device *pdev)
 	u8 r;
 
 	priv = devm_kmalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "failed to allocate driver private data\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	memset(&props, 0, sizeof(props));
 	props.max_brightness = MAX_USER_VALUE;

-- 
2.34.1

