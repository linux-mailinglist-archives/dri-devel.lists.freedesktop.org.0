Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DE8717B4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78319112917;
	Tue,  5 Mar 2024 08:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gOC09t9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD076112919
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so7835345a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626344; x=1710231144; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WIh814IMUk5rVefYqFVUgBnp3hq65uUsqUe2ecL/Y00=;
 b=gOC09t9sSOVeOU/HhevTxerVAG4YP9/EkYh3nHhmmXG/ISF0ufJtXUiPH2s7RwSY01
 w99JIjtCkivhJhPSw1NPaXlMxuxQ4JplBMy/Ifne3LrbOat3ld1pfGP7rZpJZ0HM6vpM
 W1fVTHqiyMMg5XbV7zYeaPEDF8bP3M3jjqL12sZbEzPhiF4qSrtB2H2rVlUQ0PigedGh
 ViAAqnAxWI6TzUtJwxYN7gjOfXFLkQ+BjlyE7rNtc0LiRfYiVIglszVUmSrxv4H+z6pi
 UNQLkGFQCE/P6WVdvXk3YcRWvLinN1d73nDN+HF1LmI6YyEyIjTqfWK58PYYdv0MSvUu
 oj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626344; x=1710231144;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIh814IMUk5rVefYqFVUgBnp3hq65uUsqUe2ecL/Y00=;
 b=cqmoV+2339yspGeVQDPmmVT578yNIHNvTFlazURHm7ecwMAegWd5uruaGDt58F10eF
 erG3S+/dMYFVqTfC3yTYbxKrVcsM7pkkU4N5126bl80K5CaMvl7up+pQhnC0slzQqDfr
 CL5ElM6HLiiNoovhch4gAGbeuHaFWZaK34FrI+68yYh+NA6CsuF02t3HqhSBhQKyG7BN
 wk+AMJddDl+ZtTHTX6LtWdHQUm92dkkNe2gb72iZKzMJLNpkMVX8nKNITUmwu2RdH+gL
 y2So6EXe+wmet0MH02kvX0XREWrNw9PTDu1P9JEUF0dogolrbc6kFVl0dITKHp0kN+JZ
 2IrQ==
X-Gm-Message-State: AOJu0YywN8OGTqSSLaEduVuQ814TU9gwqnCMOu/ap3lbtpUmDjWEVugT
 I19rWu7Qg8AI8K1xNglcO94xkOh6vVftJFzQlEj/r0RieiOshIPQw5QPBiZbVas=
X-Google-Smtp-Source: AGHT+IF1NY0Hm8ivs7aO2+SykkAen2RzTu+xu239XL5G/CqAmL0kvEQP4pA0JwC31R81oKLIggZO+g==
X-Received: by 2002:a50:8d8d:0:b0:565:665b:9c82 with SMTP id
 r13-20020a508d8d000000b00565665b9c82mr7135380edh.8.1709626343919; 
 Tue, 05 Mar 2024 00:12:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:12:02 +0100
Subject: [PATCH v2 7/7] backlight: pandora_bl: Drop unneeded ENOMEM error
 message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-7-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=inLsT1VkNNpcQ91Wz4F9uFHvSwYM79hrTLwE/rxQxRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPbyLAGnwidHT2FhDojPQp4jpY01sPQHqOsh
 1z/ozH7T0iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT2wAKCRDBN2bmhouD
 12mnD/47jc0NyWr3MU/W4BdsljAD/lH82VZh/9UG6ndVSQ118crkgBJGB86mt0+q+Grx5gxZCNN
 iarLv2GUAyMLnhsbsH0qm9lS0pkbkldTzyH0PDiOZTQ5NqvlHwhsOzSOlnBwx1aTV4jD6cZ3Wre
 X8lLUBtRlWqBZokl19oxqnNv33aKv5wby2A3pG6NnDT9pQAVhJSPTQKhIU8toq5pJFDZ26+ZR1h
 Ij3ea7Y2uuFPzhKfX/1F7/4RIHOr1arNpK5UrLfqVYz6U1KW8fSYp1dEXPHtNVAZa/WyNOIvuet
 qAs4Wbcs7dK9dUwJvYodbX1Mu1rL9eL31DP584V/kvHGD5Fa/QKXSNYZeni9QHR20ePfn51AGtF
 mwY+6TEK2OeD4bZONtbfdE+rFQczSLeHZrLJR5ikdjpz1jhc4qNtZHt9KykjnmP3ZU0gu+R+OFH
 aXfu+83AM9jkHbHtXg2tfKmJ2wneXwA/BRsK8pA8uGSYi8xWnWdf3+2vS3U8xYXeC6c3m4ssWeW
 PgZPuWc9qxZx4oVWeqBtW+8OS7Al0h591hqL5qhY5xaP7nPflBUbJX5nvmTOoXN/sJyxCvWDcT1
 eN9R+7hv/QsHEIHSXMoiJzEo08OjuN9VGUeyn3Gf5ljzobDGTG/m0r3R6/1HYdLlXkHEXxLgF4u
 u9l+0dt1vrXNYpw==
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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

