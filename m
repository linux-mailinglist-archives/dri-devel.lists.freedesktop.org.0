Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6797081A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABFE10E284;
	Sun,  8 Sep 2024 14:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Trpb8JOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40A10E285
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:21:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cacda27d1so2206885e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725805313; x=1726410113; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=;
 b=Trpb8JOOWgTg4QABCWXa6GKxq14UPN39891ZZep4pnThvX9B0Xl9t1v0RY5VUwDJUW
 AWddprzbCy3yPDL+ix/nRArD88n1Ei61hkQaUZ1iHR86mdQR47UXbKot0OtZ8JefAm4s
 L2tF7vJObku6OdvSdUa++We2JCsIOjj3SaZOqwOL6aM5gGTpa36YEedehZWPYgXO4qlu
 Y3TovXYo3/emmaCkgHnYaBiEg/0w9pQZxhM/WiZuB3zjiEbUdBNz9K3/CBuNzyjzvjUj
 hD+dt4US3DkZgPxZIcBeq4EqKjPoZ67ZDYPMnEzlZTCtDBeOdAV1oeWA9Gq+VIA1sH8s
 n8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725805313; x=1726410113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=;
 b=v14zbqS8fo+kZ5+9TSTacM1N6bmCRf7VX5ppNNG1wWRfCcIRQXG03Y3BvLuIX1ZJHk
 qEPvniCQoodJLrGxfKk2oWPbAsK+Q3sjZbxPpvwXPYcljEFnpJH9RDYsmyhj/sTTKFr5
 2zBh1bBm0QVNPgy2Ilx2r/Uht2eKL77LvchHuW+OfNxna86mFdr6r25WFgB6kMVrWR4L
 +VnfAj3vbfGir1T579j3CwpgGbfzV7asWfMck/CZYg0sglAPIHjLbal9LGtC4Xzh/460
 dfyeDBzLsI68GqEhm6oaJVQdeT26dQt/UkwVuJYXBAkMl5c8ym9VlY49BJugnwiMjyS3
 IAZw==
X-Gm-Message-State: AOJu0YxnLWfcr0XlFGOsjBu7Hp35FPalvFBRbAud/cUS+iWRJ7zL5OqO
 wchefFiw5g0uz6YNTVDmavhAgQGrRbuX7u4tWc00YbQi5X5Q2NYH3J0qAlx/92QbnulauIOEqHb
 J
X-Google-Smtp-Source: AGHT+IHk8lX+IYMMyPu1J/51I1ma3xgJuFFXQvGLe9njZslD8gy0z/8eNeprhovuMvXcy51jKG/AEQ==
X-Received: by 2002:a05:6000:4012:b0:374:cef0:fd3b with SMTP id
 ffacd0b85a97d-378896d9cb1mr2543013f8f.7.1725805312996; 
 Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:33 +0200
Subject: [PATCH 3/5] drm/fsl-dcu: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-3-28f349004811@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fRgUGDqaRoZtIl+WHmIGQHM80N5JZYutQfaDHkXDk08=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL1Qv6Igmg4XEMVNhOLdsVdTsUR1ueqJ3Ovb
 bpFAYP2+5SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9QAKCRDBN2bmhouD
 120OD/0T8cOrR9KrPkxGh35sFSSSYkDyfJm+7NO4H+CL5+6LxsJSQE32qyrJBthu/NHaSb0FOrS
 DuOXs0fccV7E2KOD0uWG1qqTFo1p+lRlt6xYtbe5JNCxa2Nb5Zyjj76X5BGxhnjHZwU7E/lVJDz
 UAKQC97zY7Lg5q0ipatllnHQtpXMxb9HzSbRpUO8nYrjKkFwTw9630C8UK7u7SG2+F3A+gEE27T
 R296FzEoWCTMK2XNdVIzoa8ReBXqqbA5OtA0FwjYu1NeORxZdfMyZoxVrOK6sj0K8C5PZOdiXAh
 KiGP8jZg+v/cZMqyGmMbyHn5upctXKk+zGRag4ntk3BZJILn30VGw0bEppoaWeDkmQ6QlsQlkBu
 Ez5xrnnarhQjKlcyUQ+p238dxH68dhDA3QPQ7i8U+hf7rAnNicPIYmbbPkpKE3vXrWD23XrxBZX
 1WNEXsc/idRNn+1RHHO7CsZuehyZL0TZJjbTAU1ZNWa9Mm2BbUwM+MaQxqRZr1w2tNWnk6A9UAQ
 TRSOKKX1sUFNsHOymhvkvG2J7It1/eYgYu3LKmvikixTnT7OwugUQdVVLAog52PVjM1Jojj5mHK
 cM88yx9IKD5tes6N9i5SWjkR2X7Ri5/9EOI0naJm452GPgBcBh2YQZFUC2VhKNQ3rWRWc1+ZhtU
 00CRDz+hXylwv1Q==
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
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
index 9eb5abaf7d66..49bbd00c77ae 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
@@ -29,7 +29,7 @@ void fsl_tcon_bypass_enable(struct fsl_tcon *tcon)
 			   FSL_TCON_CTRL1_TCON_BYPASS);
 }
 
-static struct regmap_config fsl_tcon_regmap_config = {
+static const struct regmap_config fsl_tcon_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.43.0

