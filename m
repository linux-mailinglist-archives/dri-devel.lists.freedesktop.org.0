Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227697081B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A4610E286;
	Sun,  8 Sep 2024 14:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b1snRksD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8279D10E285
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:21:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42ca2ce583cso3243475e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725805316; x=1726410116; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uB5jr1/a17Qw9RVDWm+OnjEYYAvO8EC+zVlD8qC1Kcs=;
 b=b1snRksDfd+WomFJrlkjYlKV4G32rOBM+ovcdHrS6oxqwWWi1E92+fafsD4+hTSbCz
 w06m/yB31qqvicGHqtWyTHOq8YKV1YdcDn1wqnJtjsZQKxsH3gfvJcxu97Q/Sm0lpAB4
 05wuQewLgzGlYr1xyBPziE16gGmtPg2UjDhEv+0xd7cIiaIF2FpkH66ua0EJCCWFVW2K
 wxU5w+qO7T6weDHe75ki+e+nS8aAHeVAiy6aGz2Z4GnP/UuO6TkQBeG5p6hrzcTIm9wo
 BZLuQj/LINnqlVTsRMNShrYNkXA4luEqHDHJP5IwQ2c/KhchuvV3SyN0Cu/UOQpC+OF4
 y1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725805316; x=1726410116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uB5jr1/a17Qw9RVDWm+OnjEYYAvO8EC+zVlD8qC1Kcs=;
 b=bdigbOmSnbDGE9oXbc8G2IT8p1VzlrGiov/ahVgQlRDPHq+PK1vwtf3AOpf1zMpSFD
 OgQNE1QgD/n3Mzuck/Ce4Xnr74JlBnHFoYDS4X7L2OWr1k1cp5OHUsR8I/+siY0zFQu+
 7kbBwV8SwhHKMKBOzJ6ziluWlV2qw4uyf5fKS0RzpkiMIGKjk7b8VG02VHAIfMjzdKbi
 kCmM6yupndQG4D8/y3Q7v67uHVQkcTFiS5b+p0B817L3XoIxm0Lozx2OgmNjjA34NNsQ
 tLH3frOSaMQDtSSwwrjN3tge/8UUCBjjMmlI5aAKYJvXtFviVS/9DXcWOoEE4hPr6dvC
 XvAw==
X-Gm-Message-State: AOJu0Yz+XesDud5C6zGece7iRE/4mN9XzGIVSeHJYExn11yfRdaxd14+
 7awyX10BFsPJvWZsGITjUbPizKJgjxrtgrQ8BaN8YAQuypRZA6CQ+nJRxY2yRGM=
X-Google-Smtp-Source: AGHT+IEFghUIs3JLLMCLIc/+MFj1+yQJjFDJp6mNzr37xyzU8YsLEL/hiSYgzOa7b690ExU9/x+VRg==
X-Received: by 2002:a7b:cbd6:0:b0:42c:b55f:f4f with SMTP id
 5b1f17b1804b1-42cb55f1448mr4842685e9.6.1725805315297; 
 Sun, 08 Sep 2024 07:21:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:21:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:34 +0200
Subject: [PATCH 4/5] drm/mediatek: dp: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-4-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=crUOVtF8wl03qYwZi7N/pIKnRz+XR7DUlbnH+NouxJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL2WBZUZoPTgLGvdfqLUo2h9AY+9HYWr/Zzr
 GQDQ8pK39aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9gAKCRDBN2bmhouD
 11ZXEACa9khZ8BfJwy1IrIOqvJtmn/fQUMm0z7B3JpGGWvxswrY4bTvTiuOUHGXaWYykA2sKS5R
 /mPLfJixbQ9smQsZ6KU9jCYt0xkLABPMIGAon5DUsQaslCnvbwRBUmFPSOolN2VVr+JFcKGGiwX
 UXBxY+kI+IvA4OG2cqdk4SWgvA0E6Zk/MbmxeP0tQSqOw5zEKAWPU5Z5N4VsiHWBR5Fi4LX0Q+r
 YUwHWlud1iq8Zg6uxf2Uaahu+iHdqsTl8uoU1LUloB7rRNSYEA6MMGquVGp49NxXDT6+F2OlkM7
 ZPpM0YH9fms45q5055fOBsjsvrFv09qSVrXm25l2bmG8MbsOPplxoXHUZ1VucmWYJP1H6RN6+SM
 1MHCeFao243tZxITkw+SH/6X+hFgH3e1mDg31NDKulPxZP/zLJ9d+nJES+SMH3MuDEVkvEjKzIY
 SVEorP6+8K2r5h4Q9pooSy7Lekdhg68VA48BeW2/htj3tjFV6GgEwBRgAntFq/BbwivXmdjzgT4
 71R9akZCVSJxErQ/p8HmBvpSWsgSG/KUo5PepF0xsY/ekvLVh8Ntlpoawlt1EWRqKQ8JIwa0FA/
 UWNdX/v8HqKnFADlWwBpeo1cTswqjmKt3tuwxJcXppAgilI9oAHbyHxbEt+Jtur8WwPsWQpH+Mq
 GFKo3Js0eafmwbA==
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

Mark local static 'struct regmap_config' as const for safer and more
obvious code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..f0f6f402994a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -311,7 +311,7 @@ static const struct mtk_dp_efuse_fmt mt8195_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	},
 };
 
-static struct regmap_config mtk_dp_regmap_config = {
+static const struct regmap_config mtk_dp_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.43.0

