Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD0197081C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13FA10E287;
	Sun,  8 Sep 2024 14:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wnZUG4Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5010E287
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:22:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42ca4e0014dso3136305e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725805318; x=1726410118; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i0L1ilx+hMa2xq7WP3Qq4RE5fisuDsq/efyV+pjB+nU=;
 b=wnZUG4HcuIX8Z8x6cyTKWrLH/YzzmyLTPWB/pBsVbdgw6WBt5dw9Rr7TpQI63QsX4V
 ZFLb68lcR2/PdhVKZJgGI0VZPRBmDY4GzDdRZuoCYK09HS3BCnQtRDg2aDIHtp5HSTGp
 denUaF3aI0NAvXUiBIkRRnbUSBsbGyBHUsFRZ14ZYJxZt0zdb4yaUGpQ09ABIojS7VKi
 QCgYRMm9yt8cJwPSX1JpeK+kb9xWHG2SIDxE1JblCwOH8PeKlGjpkf+Gbps3KNm2uvIs
 7fqBDZOQMzcGdoWvefbUJsGNGIkOV7UwfzMuaB3q7TN9OUy687lVrdk8evt0t3j/BvyD
 /L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725805318; x=1726410118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0L1ilx+hMa2xq7WP3Qq4RE5fisuDsq/efyV+pjB+nU=;
 b=r114dKSq79QkJBrRUEzIb8G2TlZcImL/vVh5evEwa8hq4dwpy/Bub+yEhgeHxcFZa5
 fuE9YRnxI+CNuhdaIlD1l1KOdunqka6LEQ0y3XrfqMZP3XOcxllUmOzmmO6wiXFlwfCi
 idbeGofQmeLT82sqNFr6OAGEtReFJEOtt3zicNQ1TbmaMLIxym/g65zz4A6YRI2VekX5
 0bqby49RPEtnyJUV71U11+Ou0c0FwjtmUH6rMvimjf+h7VDzItS8CFvzV8nMEqxX7D4Q
 lnp2EYiYz74asSHOhvsYbDszblMh3KlIYurh++nzKAOvFwGgAf9bRQCdiydVh6yC6HJ0
 vaSw==
X-Gm-Message-State: AOJu0YyQEXkhBVbWprOYJL1T/00ZcA6GFp7olUIfbln2T2Vb6D9c7jkf
 8zcLRxeLj6Op5c/86sKcERo2V31V5FHw8AG6Nxl2l8ICJ1Tl38MySHiJPSRIC+A=
X-Google-Smtp-Source: AGHT+IHTVEZ6ZfPKh1HQZv1kOYMnnFQNGX2KN1ojIsct/KCdkX/n63VIjNLycr0FImyCNmbejXsuHQ==
X-Received: by 2002:a05:6000:4029:b0:374:b6f5:89aa with SMTP id
 ffacd0b85a97d-378895ca6ffmr2551755f8f.3.1725805317414; 
 Sun, 08 Sep 2024 07:21:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:21:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:35 +0200
Subject: [PATCH 5/5] drm/bridge: ti-dlpc3433: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-5-28f349004811@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=821;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oU64b9cUM1B+FhKojFLvauLBTDBEruXsTRhzx3DV120=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL2DUYDY7DvAGsL0obtzggBzQHcH1rHvgeEl
 aWZ6s/p+46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9gAKCRDBN2bmhouD
 1yqTEACYXmHXPSUUnUlz2ip/BtD/rSYishh4B1RnVHWgH7UaLOnusfLIQ/7uJcPa+iqZ9kDBTTb
 3+IIeUgwtZ0RPchNZRGIrVB3QZ5k5oUJtmZe7ayPmckWY6vgDQwhNsKYwet3LEu3RoDZmFRxc6O
 Ulcs0uVhwQYYnrgTBt2u3zDTuXDxjQ8atzPrSuKLYvWjEMQcXvOq0sX77uurGvskgk+g/fmUtOu
 HfmBJKP5xxh2YCKxI0rfz/j4bzSqT3hto0QLumegf7ICdV7B+h7BxXaQsPYKULpXbZWgwr14ZjA
 5f0vJThCx+grRi3BPdIfhcd3BsYrcEKm8T5VUQvT1s8KtwR/En719KsEnIawDIfCAC6fme+ji39
 +EFUJB+jcPU4fh3AcMPpgbwHiok7gJS0XU3w0bd3OeB42/N5tF+mdG+On+WF7GkMX7oXSxfOBY8
 xWXgGEjMmTjPdh1im8PhJMBrF55WMuJIpXXidxoEic0q90Js9mlJsbB/GQ0ezTeJR05r0/+h6fo
 dUW6lXJevucchL0arzAqukqPWHZBJgp2xx415MFZ8EtoUPeOksNPFYd/PF9dvKjNKIYS9KLQYKG
 zmpFhnn+Xb2no9UKnxbsbCqOFrOz+Hv6fDF2CvLMm//r9VtFF7F+JjiNJAXt0R8wm41egewrsBg
 eUBSJIsYNN3VS2w==
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
 drivers/gpu/drm/bridge/ti-dlpc3433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 6b559e071301..a0a1b5dd794e 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -94,7 +94,7 @@ static const struct regmap_access_table dlpc_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(dlpc_volatile_ranges),
 };
 
-static struct regmap_config dlpc_regmap_config = {
+static const struct regmap_config dlpc_regmap_config = {
 	.reg_bits		= 8,
 	.val_bits		= 8,
 	.max_register		= WR_DSI_PORT_EN,

-- 
2.43.0

