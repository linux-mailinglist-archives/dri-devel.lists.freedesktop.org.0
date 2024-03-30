Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46FB892D3F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D2510E507;
	Sat, 30 Mar 2024 20:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kE5EF6CP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F31610E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:31 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso1746378f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831409; x=1712436209; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qQ6iRfApTBoRDrY2t1Fr9Ku/JGHxYaIezlkqm2YUAqc=;
 b=kE5EF6CPwgQVlwx0CCCyC++Y4QAiU7kCf5owRkPLN3LGjaSaKoXNOKYU5EOJitCeYx
 W+j3jBLBtoxW1qQztXvVsBsASE5QFnOmOt/KQfaL0JeHBMCYbgXgtANXM7C65wD1ceMD
 K7s18NEUuijfReGxUx1SMMhfO8MniSDyefn0CKe5vrFIh0JuLX2DZdyRNlsAtnPhr7Ma
 fXsTqj7O5atyDxo603PMREjA06Kzz88a1SajbTw75NgzpSPHFkbbAbg+S1MR0xkKJq/x
 meZH0YPXfbTWl8fF4FL1E4p6niSK3ngoHf4liJ/fSE0CAK/ha5uy9K1N8kqYbMYA5BB6
 PTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831409; x=1712436209;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ6iRfApTBoRDrY2t1Fr9Ku/JGHxYaIezlkqm2YUAqc=;
 b=FTai0nonoxjtt7BWsijCh3eaXEGn8MM+mo86yKtsVwAEXycwINBiL3REkB+im1GBVF
 R5ajcWXhXz23KclG3m0yT7Ax1WWgYJoblUG7kWvXjnzWnWuhWfJHldIwa/KNmndqo6Yb
 C72yKe/kZZBRUUJVM9VJOp4N4QnYj+QElbEEj3aP44yd0otYVMUEd0zSbbuI+t+qbaJg
 wbxeMlcYeIbluzRb5AY6QVpIsjwdOBc1wlwW0AuuxEEOGZ6mUjLwQEw43jGUsMZeJmQk
 9qOyWttq5Teow3l9rckFMQonVc3cOeIfWSFb9wJgIY/lGopN7IKSpjbpzNS87mVhCbUN
 rfbw==
X-Gm-Message-State: AOJu0Yz0bDZXWK4TNCbp9Eba7n1a6SgRwSf7kDJz1q8xfL5a6CEke026
 tBcsb5CavjusbTNRQ79KMs/dejjhRiVAopoEy9Ubg6gp7BGtHOaVbiu9aOXm0X0=
X-Google-Smtp-Source: AGHT+IFof+wGW9GxDz08XDMp6C+JQTVetnRPBObjFVAE613n9FHrpR+tNujyuR5lpdLBVcyRgTGtXw==
X-Received: by 2002:a05:6000:250:b0:33e:67c7:e2c0 with SMTP id
 m16-20020a056000025000b0033e67c7e2c0mr3096634wrz.38.1711831409452; 
 Sat, 30 Mar 2024 13:43:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:12 +0100
Subject: [PATCH 01/11] drm/mediatek: aal: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-1-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=w3IeKAjnHBm8kl2xZSK2QFuYLup7/F/VoSrvI0alzKY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHllE0eKbHKME3Pw1H4CbKUpy9mgJwywTALwm
 8LLCuYguqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZQAKCRDBN2bmhouD
 1002D/9XrWcY2yuyJCyP/EFAaoXJOdXI2ZjZNPj1enhHgt215/5Hq4umqeqJfzLIrjTzKZqMNeT
 274U1WzmqF3vl7oc8fOG6lArneQdJffyeJTU6IBFx3hUvfStz5a2hERTop6d4/EZ0A27CEsNO/v
 vTQsssxxwN1V7TmiiFqDjwKSGXLZj5KbjJVqJg29vF+cKz9ylWp9D7GO7lTSCnDVy8RT1v7w6Dv
 p/KQS+LcUZNsOhgjeDAaJkiFigku4o3Un/I/T+l0an9KRakHP4ALOas2g52wN7LYeXtj9LGTM7d
 QR4hV1ZwI9rf0NTKpvXjIA6D5ynsS2o9/4/uv5pgA8CUmljDzw+Ar3TkFG7GYBaimmtHJHVQ34z
 rHdRVbBhvPlJf8vLfCpoWvEmSJvONlbndk5UZJrlfJ15yGI1Bh+x/w1fa7NogDKvxheUeUXh7II
 JdKgfZVf02epyusd5EJzrFcL4spSZmlI11kXmSx8dZ1wC5xaYIkAWPtc9mMUcNa238VVUXeQW94
 dA3f7q/uDRXlVDxtMnJK9OE788U1KpgWacBeW4SUiSyB0/DW3Rr8JMVHLK/Esk1JFBC7U7oBCn+
 94Ao2epihnCjjdLcCTEwIdAZX77dwdCS3TaYSChWa0kTPymFJA6zmDndVtEOlna1yKbho70pInK
 OBYxA/SkR5ieDkg==
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
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 40fe403086c3..f6f2c24abc93 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -223,7 +223,6 @@ struct platform_driver mtk_disp_aal_driver = {
 	.remove_new	= mtk_disp_aal_remove,
 	.driver		= {
 		.name	= "mediatek-disp-aal",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_aal_driver_dt_match,
 	},
 };

-- 
2.34.1

