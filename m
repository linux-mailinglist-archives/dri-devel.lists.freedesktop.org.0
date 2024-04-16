Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48A8A7041
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34510F18F;
	Tue, 16 Apr 2024 15:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DUOoUfhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ED010F18F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a5269c3f9c7so306788866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282802; x=1713887602;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aX1ilvintuq1X3FkJfckvE1w8waUFusQvnh/7DfkGVs=;
 b=DUOoUfhiD+shrxB+q1qz6GsOMOChkUwKrCR0oG6z8D5EiJ7ScRFySZSX191N7Xp6HD
 qxq+OqrlShTUR+lVh6W5w+Pm1u9sY5EVHxIZq+Puih4GvmeYa+OjcAU8mSJ8DQmVrDb8
 FKAxWBeq3e6BPuCgsl2DzP7EEG3ycHy/VRcYsGpjsyNlXdUaL9fsSdDDl1QX2Yco02GO
 +7LvpYPZc9d8PNKPVGKWtHAP4hhS+2HUeksv9yPN8hC6WjJccIYOqYSrNXX2Lvls6+Ib
 gdiu3swd7uH9a/xfgy4RByW6mEKxnAX15j45EXWzCEFFtag0tWgO2b55MS36Ybc5dMfB
 yWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282802; x=1713887602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aX1ilvintuq1X3FkJfckvE1w8waUFusQvnh/7DfkGVs=;
 b=jullt/b54ynYm8tk47dxLYdp6Wwr++G9wdcUuU1JaQmVhabl4CiQ42KAZAxWR2Nb/H
 0P70XjWbNfgQC5vinnEVY6q7jkwSNRGstO63pr9acm4RAAgOYBpqeZQphZzM/g5FjkXy
 nc4u3SJqAaF3ZaH7twXL/B63ecJ+E1u9YT3xfogKPqx67z49gAdYZ7p/gUl7EyFqzdrQ
 oiC2XjGYCM6t5NXSmZ1P6aK4SSTYsADKAl8Od/qLnsl1YKjWt6Y92uD7HXQHYRn2MNXh
 QUCElznq0qJYu9qf27fOb2f3wEI/Fp1akKX/O+e4cgGOVJ1LBscC+N6xHZTLxbmQ/3k9
 pKSw==
X-Gm-Message-State: AOJu0Yy1GRA2x5lC54TjCJPrdH5g5c+t4SWiyPzArbqkgldQXXolDrz9
 m4jJFWpkhJrE7kid9rsKaCnoRTnIzkBBFK6+lup0we5fe38UCFfHqxoTmOhAwKg=
X-Google-Smtp-Source: AGHT+IGLZR+1+7B+BajRfnUQBXS5QfhNiQ5CennwyUtLwKqOcXMGphNr8pxmLBz1gtSdoS6PDtUNMQ==
X-Received: by 2002:a17:907:9283:b0:a52:5b0f:7f92 with SMTP id
 bw3-20020a170907928300b00a525b0f7f92mr5442353ejc.41.1713282802521; 
 Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:04 +0200
Subject: [PATCH v2 03/18] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-3-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=R+vzoeOPPnxdZJDMjVfaf9M6El1keSxWf/VPx+5Omwo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q2YV8vqOm0I5SpvrTc8kKgMLlApdXdXBoGCm7
 TqzfkeqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURdILD/
 9hTrBDlZ3MFc4Oqcrvu6IW9Wirx17tcVe9M2T8Q+zqdZk66uoY6oQg84TikiL1rAZ38Yr7Ggyt4B2c
 Wdv/6kuu73i6MPG1Xc94NEY/rgNIOBMudlppCXqrhb3PAmTCsiO8BVvIYDA1yHpz422cW7K41DC6OR
 Q9QAI1ZoDogA33x8CDj8/DIC1Hx3NKJii7+M0Ce36onRMyHr3iIz+dBGL5jDu8o4w/eFyoHjulcTdk
 El2ms2ptOT89BNgtESMBqnjAJP6ZEw2Vn/sklWB4JTHbJRmfuwthXqpWHrM0Xk5rnOWjDavj/QJdgY
 RotSfYpY9nZ77+QZBR8BUsfY239Ffkypq3nbnyTNiKqYqOTeITKwGXByCbAtf5/37dS6tY+XYzHLic
 CcjNYcqyazjucw4NdH00VqR6YZfezuQyGGLtClfKYrXwbpgKmoVEHu9PJX0Zf0yWqydjj8fm0OUkDl
 8H7call9IbOaj4Oojq2jFOnnbv0t3qJxeehgNtA8AOUYtkLsqOgTIRB8HK9TaQuaJDctyZa/ekFcWF
 xB1EFzfJQd5oyqR6ezcDj8qGSb66Mw6mFaHb43dlbcdx8ovYl2ywOzMokoC8pbOqTg7kSCoje6sQoj
 vG+yZ6XTUoOe8+TOyY/dmC2QsjVsiRcb+horawiIzt/VflsUQAJi9AU+qgMg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index b886ca0d89ea..7df786bbad20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1

