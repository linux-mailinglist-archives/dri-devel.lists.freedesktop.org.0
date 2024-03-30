Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89139892D47
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8474F10E641;
	Sat, 30 Mar 2024 20:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wW7vUXmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8BE10E5EE
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:45 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2250927f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831424; x=1712436224; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lytz4NRlGMjIcJpm2jggdQDN6y6/sjFypog/Jp0bB6c=;
 b=wW7vUXmi548ewik/q9A/a2vWAZn4Lnpwk4x1AboZkXt2CUG6VYB5Rzniso50cCsKv5
 5OoyVUImXULT9MDvXbKOZSijBY43KrFAaSAVAwz/FteYy1y8qZ7PAR1I1C0vFa6Zd/ff
 rPpjjxhq7mPSoF3Wo4k6j3XyUjj5Y0HwzjNsYOnDVtu+N7lmDSBk1q3yGB4eH7stu7Dh
 b1DoM7t5UfKBmZaC1rUIDuMZ6xLPTuB3DYYWIhUmXazljGsVcCelm9d7uyZvC/G4jYIK
 5AWqUFjxnSkGmCHQAKYqHAf2Fs96o1GTis4RemQuOMH0eNbclT/lIVW5D+6VYp60t95U
 EEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831424; x=1712436224;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lytz4NRlGMjIcJpm2jggdQDN6y6/sjFypog/Jp0bB6c=;
 b=hev1rKLXppGxfY3iOopuTV8dWS6/C2UlrxXw3z7MHQ9Jx/LGWsU2szlWGEb3rLzS8s
 ZVRk43NzXxddS/DXvmX9laZE0WfXC7oXgIOBJrCULQULF7uev3Yk2h1/ZWFzynaVTkjL
 E7liIJiNO1p0jhpNQF0G1qU7RG+mo805TOKDNg2lxhjNDSuIjUhDxvsDccgxizzJqoIZ
 WBhUMWxS5qkBS8u11aDJhvvH1Qolbtz7wJAZa1ZS1YkuymzXP4xswarVehOdfPLuoApa
 CuKpxFlEmjTt+ntEvOXYjMy6hA5x7YIf8i1F4z8681FzmMu1UFM4DXP5B1+XrgtGEguf
 KyFg==
X-Gm-Message-State: AOJu0Ywd1NAErzKa4qRrVnKNBzyh4hIdGibH7TRNFo2/rAkISYzv76zp
 cFpMKztSrRNpibhr1NDHq21kkDPZklnx4wDaSaIsXZikvMdw631xWnR5Y+PGzfc=
X-Google-Smtp-Source: AGHT+IEmC+12zHWKXQrDYIZtxl1tMQr6URkl8P5NKb7hNbBHYUVheUANTikJ3X+pXT1ODg2Gi3mwIw==
X-Received: by 2002:a5d:4524:0:b0:33e:d15c:3575 with SMTP id
 j4-20020a5d4524000000b0033ed15c3575mr3374244wra.33.1711831424325; 
 Sat, 30 Mar 2024 13:43:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:22 +0100
Subject: [PATCH 11/11] drm/mediatek: padding: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-11-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YcU01k3+utKezOFHPg08Yx3HafMCGt2Hy8rvn4zmr1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlt2ZfAYGdPMVaud2WYnO/P2J6dEJEhY9cF/
 xWcTAT5AUiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5bQAKCRDBN2bmhouD
 185oEACByr63OyistUrAchRSUDePvLKUvea1pTj+6E4Q7EDGWgMV96qccpsRcfic1ckPDR8OUdl
 PAiUiqY3YBNXzQkXqwCJ/qCvhYOZwcfGmRuPXZxbQi3fKgESPqBLfjiJQ1ljMwhVZBu3Xqj6gJ7
 Yy/KKaAroXr2oxP3trIO1SZ5EMnZWFWFOWVHxR72WFZ/SCVyIg4OWl7pG+TGjNeCKBDeV4pFkR1
 xcQX9POwxlD7JFfLDz4lTzaPcrjHiyLiknsb+hMxWl8b2+cHB1WzkGEGwyYStobHvwxJJEVkOEj
 VX8lWB7SOcOy4S0l21nMtN8gFSgLu/q5/+nnaVHm+8XsTK+b5CYgV99B4wwCbl/2030p1xM+tBz
 QQIwisBM8DB0R/RpZuG809+9pqMP/7o1XLQb1IHFoHrIXOzxhNio97ZhXeNq9Zf05fTryfz7uPO
 aKxrsaC45FnvoOXNWAtfgLngEvqZYUkDA/Oo5WV31brU5NrYFx72Pviop4+SxbN0WoWHH8zvQCw
 ml47OAu+Mtq7XkbRX1tkb16TeMLByt2/vzM6HaB9ZGz7PRDkNXoezeUTDZoA9j5Ai5YV6FQzFhS
 FI8Z0DBbUYFcxKk9kGe34NLc20SdvfCCZBw5XFIMWKmNpHu+HSowyD5PWAMd1Xh56m38ZUGfThU
 jHlv1s/GNzDIitA==
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_padding.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index 0d6451c149b6..aed84af5b9ac 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -154,7 +154,6 @@ struct platform_driver mtk_padding_driver = {
 	.remove		= mtk_padding_remove,
 	.driver		= {
 		.name	= "mediatek-disp-padding",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_padding_driver_dt_match,
 	},
 };

-- 
2.34.1

