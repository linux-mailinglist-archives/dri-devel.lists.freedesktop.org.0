Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232CF892D3B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60CD10E045;
	Sat, 30 Mar 2024 20:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nnOwR5Dg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3010E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3434275ad73so294340f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831418; x=1712436218; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xrZ4GhO9wf44T+ecEEcNLW7XVBn6abcNvXfy8r76/zw=;
 b=nnOwR5DguT6w+mMT7F6A1IvmZQA/qb21PJrrIIj4Of6dMjsyV6OIm/IwlsSjthrF+K
 6L7yAAqg5bKiIzOEYYBdKJM8xhX2vAHc8SP+4fLJkiQLt2Wf3BEhmIFpQ2P4xWSho0ny
 a7aNB95kmgARTEUlKmSTbXFFvrXGs2hFMAhOdWJyE1VlYavfe0HOtRm1XzFJeZiIMR1W
 F66iL84mgJzPDDubHusCS2VvgnypIfp4dzsEkpJngVumYF3KBxZPZkwekK5yoHKzyFUF
 EmD5TT/0nLgnK/nlUOS1EWWiCMtytu5QQ4tGMqAJxCdYLqgGEAPYFC+utXsb+YkRU2k0
 Sf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831418; x=1712436218;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xrZ4GhO9wf44T+ecEEcNLW7XVBn6abcNvXfy8r76/zw=;
 b=UBzPR5EqlhVIIZkpsJPqvgUHrqt8n6IVljTchn78+flKOQlxbUwuZkJjLoNefscLdu
 WuJg8nUvnyRgHABaE8CHe0eq6KqqoevnSW99Slu07EjUgHpQJXGFUwYgWJLGuMnUdK+K
 kck5CUS6LKNC5dkt1qBHEZH6zyVgkpqPJH6Ve29jjqXlpIhX8IQmBbPwrhsoch6eZ8oh
 edaDhbkGyQOh73GWXe04HFaQeI3IE/XBSB+2SqjVVOC6Irj2YfukJ/XzPbubNCG55ATu
 y3pGC99ZOzvVYjLc9b0S/jMcamwFU7Ml+qjMGUB8g9BWeyC9evRVSyCk6wmdsPg2loyP
 5alA==
X-Gm-Message-State: AOJu0YzNFhDGDuRMkw9dxMSsA2mS7F1MJaGq9CaNYusEvcpJpoJzVdkM
 XK/XL9da086LWUVn2C+QY4NUaFoChy+legwT8JT56/vl7liHqS0dDiJf+7BDvZE=
X-Google-Smtp-Source: AGHT+IE0PKWcklEiY/N3DN55kHettlS7ue1JIpmWZl/a0EdNno4I1Sh1h02er5fS9u4AqXd8tM05HQ==
X-Received: by 2002:adf:f645:0:b0:33e:c522:a071 with SMTP id
 x5-20020adff645000000b0033ec522a071mr4191961wrp.51.1711831418298; 
 Sat, 30 Mar 2024 13:43:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:18 +0100
Subject: [PATCH 07/11] drm/mediatek: ovl_adaptor: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-7-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=851;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Xx8KP882juDZyxUVOCDSGgYxDLvUN7i/bRZCWIrU9k0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlqtSIEZvgyYm0QNmdSoI/0Wde11KsnG/jUJ
 m7Cc1tVbx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5agAKCRDBN2bmhouD
 149aD/0UGMkv565y8FhNpp9HZfNQ34nUp3vU7wEYkdZOgitnzav09vI0i7+j+yW47eieNyoiE9y
 3+qIAbw4PT2fQ63Zm08uVzvJiTQSq3vQ5qfDgqWqcL58EbJBxZaWHMZRdeX+v5MTtkqAx/ahWsS
 /uzTY8BAgaOtMXkuvjnsAK09Mj0uY0iMXCuS50aS8bgTVV5Lz+XkAO4De99j+XB/SLetcPoHwmh
 Fw8sZDXVfJvQrnT8KeavVse4dsQQYaMAnADfsS+JFmqn+38zoDpM3trwMisX8g//g7smDvTp5z9
 hgvEJ3W4nnUzhoPK5UCux/ukE1TDZMx2TkQzCzsWacw/siMas8BedF9aEQLbwWisucG6Q6zJt40
 Bw+eoNNzya6MiljOu/7qB7XjlIEU2PzXI3OW+mp7wsne5CPK3sfyi3xV4ed4jebTOjKcrYy9tPA
 3NsOmpkXbPhwdRT6MRxHgCXjyJtL54cMp9a/xUivPijNbW7wrHweepjHL+8Jq+DKwJp7DYAkiJA
 02Sg83YMIfaaiyBsvHD8sQ1kXwEhmkTIC0y7IKFI67urmorvN3REG0tF8zznMdp+eUfn94KgNuJ
 CBMenub5TWPNVI3yF/8Fd4pSU1z+XD7xMZPv7NAjF2eeeFWyNo87r+hi4f0V65Cs9xn8xHp2J1r
 EFmG3PHwCdoDlMw==
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
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 034d31824d4d..72fd5a095960 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -629,6 +629,5 @@ struct platform_driver mtk_disp_ovl_adaptor_driver = {
 	.remove_new	= mtk_disp_ovl_adaptor_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl-adaptor",
-		.owner	= THIS_MODULE,
 	},
 };

-- 
2.34.1

