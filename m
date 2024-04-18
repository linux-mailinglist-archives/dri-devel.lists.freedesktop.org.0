Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14258A9C82
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE33113CDE;
	Thu, 18 Apr 2024 14:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DVRGiv+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA965113CCF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f15so7934975e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449836; x=1714054636;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=;
 b=DVRGiv+yvnQW4YOyZAsBagmbWOao7jeu89FSP9ssWrmgYiJxufGeuaFVKu3nwjJUT9
 UPYZhtPzDZ6JKuVc7P3AJUJXrMvi0lgqmHMCYpACiPAhxR7u3KBAtUKMTc5LX3M8hYEv
 8w1Onoht36iLxKK4ad9nw+pAiopczQbqRZVrSaZgne5DTGnj64q2qXNHBgQhUqEOv6if
 nTwR0uvlfotb7CsgscfauUH35Qyw0cRA5AmBpCD0IxZrWa3CvrXjrJqWg2zRmKi+x99V
 hGNIYDK0crMxJYsMBCHEm3iYUPObr/8v1nJ85yCbYgQCVIhgJB0svl+mxPy5TYV25Vqn
 gTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449836; x=1714054636;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=;
 b=pT86tkmSV+tpJveQsFwRSJuvRwAyRMYrp733a/CDcsO8kwggwpTn2ekqwRLsO/FeTt
 cqsgfB1vB5ezNwZ1gvwUyCVLZyFrdEkCXI+LpUojNlVjMcowWo6Wqx5pq6kUUobmRmHa
 NZ6QBeAHMLQT4JjVerIMxGW04umWsGeqgMT9Ysw6QsRazk+etEAh++frZ0i5YKB2pOFC
 8Aj7XrhEq3YFR1+RDbSUSYfsSdu6amUS0uJ+eXYsf21IJ5qUAioveHC4s4XgW6OPLkF2
 cWrNI9+xBnVERawW5Hwy1Ym0AQGGc+4prbD0l1ZSUe97YadyzrDI3DoxSS0btNIwZLXe
 N/vA==
X-Gm-Message-State: AOJu0YwmrN/y7tkz//ApPaXIn9/uIM2vrmfo8TyrRyxB4Ao5/aD5QV19
 X3M6yGcn8AnE4vPm7cUS3HWJ6AXsvMqWWrDB5ocmgt48B+rEYHUb2MP2nGLAtno=
X-Google-Smtp-Source: AGHT+IER62CdAE5/5oot4D2adTIVLRgUG/egF1vr5z7vePcV4RnBSZGtaXvV2hHCju1kll+OUBkpwA==
X-Received: by 2002:a05:600c:a12:b0:414:8abb:a96b with SMTP id
 z18-20020a05600c0a1200b004148abba96bmr2014596wmp.34.1713449836080; 
 Thu, 18 Apr 2024 07:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:52 +0200
Subject: [PATCH v3 04/17] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-4-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=zzCIaD8rTG1/kp/ZSileQtlNEnXTYcjPAL1DZHwA70o=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStitcbsX009PW5cbVFw1hXuGllJFI83TYn8zPhf
 rz/CcdeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURWNHEA
 CaKphXLr+uLHFI1nnefySVhPPO7is8O4I83eRLO4ymwrkeRxbJehmGXVQBbDqnwu5zjiP9BmmbP4R/
 Y0EVmGTML8JP7vH36fZ6AdfyOiZv6PLmpmQa/J0q2jhqpqnrFAZR0Qi+jt5XK+iKNEiqgToAOL8+LD
 pTwpgqfioGAjnRQAGLOIK6EvuAhrH/20NKL/PupWSb70Q/S6OyFX0Y6mGMOTeuHUXF1ergSHLcL1HF
 0XxUf2EH6vfCheLvExdzBlo5HvULGi4cSriAWBcQhKE5sgMIva7bMRF4QuyFcbcu5GUQVR6AlYb4/z
 l5YxaiDyxWKJVUM/Sg3yiI2fkS8HEF4B1KZDsmzo2j+vE5oXK1KwU2XzU9Yj7B/OWv3XIgFbbD8N+d
 xoV7Z8mhSCPE1zhfOPI4r4p0Vvi8LnuoadKK+rZd3fcmVYmX8hIA6RJ61z+cea1rgTkyd5qfty2yh0
 FR2z0DLsOJtyX3TKVXcFcU/vhq4YrS5cZvaIvACh35XH7UUWxMvaPJtPEZYXWiNtmUUuBu6QQIzHsB
 JPEKRk9/8aySxzP1IjYviwc7nuwqUCWDHug+A4+0KuffSSISRMUM6ReUhGazF7tbJIscFuZVWcI3Nl
 MdCF7okXP0MmThxayji4DOb68QmXDGLOLn1ONLwyZZVH2md/eHgFjvBLh6xA==
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

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1

