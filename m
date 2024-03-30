Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FA892D3D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4AC10E4FB;
	Sat, 30 Mar 2024 20:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V2/ksnZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C028910E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so2484537f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831415; x=1712436215; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eZMcyUqBR/k0OnBPZ/xItiFTsULknE/cvSgUpIGsEGs=;
 b=V2/ksnZxXNbQBsvD+wqYYbItDyP2FBl6FlkeI5DTk/skGVZ23+RphZc2TfUKSzz5Aw
 kQVVoO7c3oAEUiGHnSSOfcXANglVTa4XA49aAps0HSLWqu/x1lnMwZ7GDOLCmw8XxOhT
 xtfWuTKYAtW/hZNygIyh3ycQgj7ITiQKDbbNiKwUsA2lo/mkxRHkOl8UxwyuWv1r0mEh
 EZV3Ca8BFisllIXiWr/accvcnleb/cGNRGb6lkyd7KRgPni2c5bGoCKiYk4Yt454yS2R
 89CSw0lox3ukY7Zwi5eqRWo/Jdwo9e2x7O2lmmR8jU0V0psb7PBZc0sICcBb7TSbNue3
 GUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831415; x=1712436215;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZMcyUqBR/k0OnBPZ/xItiFTsULknE/cvSgUpIGsEGs=;
 b=bqps8O6vsgzMXKR0NuGdjwVQvc0LeNUUiRD/U/uKhSSW1m7eKho3rsZLMoIo75bFYQ
 gKTAifi6wXghzs7vvmDeq997g+DHTmjKdzFINaIduSqKjJYo2NBtdCy7hp17y/lnWnaf
 DM0fSM+M/YnrbhmHGNG1c3yCNxxkOGjA5kt/GR94JtDjoG9wR0J7M9XQtYd+dzQYizWh
 OKhDKnS/kySr5pEQ1C3C2u26x1ee9tlHh0kO45rll8BGhGhdBAFrZaW2mKXt5TFFZW25
 Sx1ELv+FTDOsFiRSjErZn+JFGVZVKBiWrTEXIIuYK+HZPNeu7WhBufDxlpt3hN+hlj8b
 /kVA==
X-Gm-Message-State: AOJu0YxdVvsYFhrNJ6Pr69pHIG7Q8D+WMpBYmLtEvyfAcvtjwb5b44K0
 KjP0mAgzR0Gvk9IXOFbVaktC/tWPD8rMD0UHYuOZFawonCfCfQCLBKKqpMWmOVI=
X-Google-Smtp-Source: AGHT+IFOPcibh7RcxYoE+yKeTFuJDxXx3Ni5EVSpl4ErQkQW6bt0OOu9CjiSEgZ50RNBf0gaqrtggA==
X-Received: by 2002:a5d:6d4c:0:b0:33e:aead:af07 with SMTP id
 k12-20020a5d6d4c000000b0033eaeadaf07mr7795224wri.27.1711831415254; 
 Sat, 30 Mar 2024 13:43:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:16 +0100
Subject: [PATCH 05/11] drm/mediatek: merge: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-5-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b0EHgo2CSjStKtKnfeIekdpJQ/pX6wxzKF2lo+63Woo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHloSNtO1tsRRuakSotnUeOaQAA9DlbxPKmI/
 yM6r0Xqsp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5aAAKCRDBN2bmhouD
 10pCEACFpCtrkjDrwu9QOYzz5bM9bqeh0KBhf+W1dALn5Ht/30IX/W+7jJvPORKHVniuYO33gGT
 a7BwIHK09dyu7aOdYL5bUGjXT4g6KqG39elMjWNnqKcBNMftmpStHOk9Fd3RXhJKhUiHnl7qKjW
 511LU+UBWbypp6yYmFowuMaGHjJZnnUJWyevgX3qZAGy7iED9B/Ce+tRZ1U+mLehS0b5D0rD8Ls
 81mmBqjGtGBHpLZoFERou1ioCvQNFpCWqoKkmC0PnPwyj7EtUguiOd68josP26+PBWX20XczeTS
 3fwqoktAmFp06fxQ/J+3o18p4s2m34/y+8pH5AAfdi+TIkkUyg7VNaAqyvYM4wjx2+YiVXpKoUO
 9FTLgL+Lai5oQkbncV57uYm1vLUBBAavV7gWqkv10p0HkRahzhsOKaETxQ9y/q0nqU4QyZNCbjK
 VR4CLTcWom7HtOI9y5Bv3GPsndZupDz0Z5iivrwgAFiDLvpkgfgjvWKA2j6+AdZDXojZDGYaJxC
 jeztkiDPkfw0L9you3OfEQWVpU8tqLaAu8Dso14Xzg2B833AJUVMP28JGe3iGFc9laMGGtVtEoQ
 lM4DOMK3NNL0zRkr1XImXb6UOqS0y5YupA6yln9qjW0llyaFneRfnkiG/OgKA5n6yJiT+ck4T71
 dEE+TSySv/rG3Lg==
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
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 32a29924bd54..a04f76dbef73 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -376,7 +376,6 @@ struct platform_driver mtk_disp_merge_driver = {
 	.remove_new = mtk_disp_merge_remove,
 	.driver = {
 		.name = "mediatek-disp-merge",
-		.owner = THIS_MODULE,
 		.of_match_table = mtk_disp_merge_driver_dt_match,
 	},
 };

-- 
2.34.1

