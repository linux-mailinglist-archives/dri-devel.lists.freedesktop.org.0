Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E5D8A703F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034410F189;
	Tue, 16 Apr 2024 15:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vi3h4cGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3673510F185
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-518a3e0d2ecso5496475e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282799; x=1713887599;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z1M4kIN59+mv6eajaYWoD0lNhNtoPHTneP5/AIVwZoQ=;
 b=vi3h4cGl18Ooi9rIL1DET6lUJwi8Tew3IbayjVwheQSZYNW4FHB2YgxoPOGxLbsuUQ
 uHYsEbOHXGEN7qbQ3K1K1Y7DmGZBnJpw3puIbWDISaQ8bf6JZnCTsUoIZYOQ9EyMwtkj
 djOiD96RGdcftOvOHEv+K9LheDyh29UI9Mb1luqAfkvVGUq5HL6BGtDfICAZdJL5IMeJ
 tunYcQkW7BtS9q+PwI4WU+JjPWvgQeocLW8MgJBXeCozKDdVfvB7L5wstsHqDf3n76FJ
 KvOOWDhEiCMnm3sJzOcz8nsVw8RwfzHw63qBtn0aaJh9Fzd97bTNiM2N0sXXHTQkZbt1
 ZT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282799; x=1713887599;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1M4kIN59+mv6eajaYWoD0lNhNtoPHTneP5/AIVwZoQ=;
 b=vI1KMKgBvZG61FnOTzoIhLZXLTm0kyS78VKFjzQV8s/hf+Cgc9ViV1Xo5oShAg1ciD
 PMSiJSFNI71DCWHY+wTouWizntjuGFKceuf38Qm4yRYfI9fSVW1pxhS4CnQLTHPNPY8d
 AZp3StWMXhjdZ1LKdXegP3zwaWwl/xBrltjRXHpbON8g/BKkc5RQ3tD6Vqu88WYZdMOz
 ahj0eQE2d5SgNp7MGB4MwcUQvz4Q/s3uc+/ep2PtfFAUkEmXSpENugiil99SmDyTuBOi
 E0jNU2mahUfjIvdt7EuINOPGXd62uACaxCWQ0ubHT9O4uH82ZZRBX/rM8xWyPYkHK63x
 OCIw==
X-Gm-Message-State: AOJu0YycAeeiu0zi63l7rYmONI4K4Rvk5TjhJe1IIJe8gXTJI0sMcZ5Q
 jkYn/QxdN7lrhbvStwz998oqE06wG785vTei/6PeiUDiLTJX/Xu5a7jBt3GJWQQ=
X-Google-Smtp-Source: AGHT+IEzE10D/BYr+CmDyfD/2wEwbBBxOcU32cwBPDByi2asllDiUOZfZorsQvYY5XvezHb+mXUDjw==
X-Received: by 2002:a19:5f1e:0:b0:516:a686:8ae1 with SMTP id
 t30-20020a195f1e000000b00516a6868ae1mr10388006lfb.62.1713282798061; 
 Tue, 16 Apr 2024 08:53:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:02 +0200
Subject: [PATCH v2 01/18] dt-bindings: display: mediatek: aal: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-1-33ce8864b227@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=PuIX6SX0I8G+01pSZbmJjjMl6oTG4sglyLhxdm04E/c=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qYdCXc47+31Eb161yRXhf/4KHnmy4zquR874W
 bGQC8baJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURQsmD/
 0TNKGiTbZAKcXTfwf3hcjZyhz53rpg/4fi9GFBkTMl57KNLyZr6bqX4G9akwSxjwjqvOroVC6VCRmH
 JSGIko1GO6YtuYAJPFDiNToZtHyQTS5kXqrJrC9W0jWhzdWi7+0wsXA4q5VF2IplgT7jXAfBQ1hGRQ
 Rt4H+t2IN8GzjCdc24+a5jyvNWvEfw5Y1I56YQTzFOL4NTfynogckD8b9zoiZp2MI/zGe5dw5kQ5IU
 DUWhIBih94kmZqT4VAzCpmuodlowsuB4qcpL3zVRlXoYXBB9nS9JlS1puTFNUH0CAt7IixG7Y/PEuu
 d9KOF0QMgxPxPYsaes23yVEFuH8ggm1mktrdNBrkPQA80hy2QPeFKQ4gwXRxfnzcTWpvy5VTbcHesL
 9sV8idwkt4CfpY6BvsXZqNA3q4VmUNcW7yHKBh6kK26BaYzX4rstzIO1yWUySp01pDKNjNzXkOv3eV
 aewltgJACeoK7i5BtIoemCRhfFBmDJ66Hx1Ay2DdsMzL4Rtq2/SIfhfI+fOc0WoSDPXuUP+LZUyn8u
 tsY2DVXRVlNzK0519BXDe6Oyvtxlu6lkyYDyJIWkV+6mPOKqp5w+sIkv20xxX/elKMJ2vmk5DAkJYu
 tQnyqcfJkOgfO1DzokYQssFB0xZ2Ynbbso+WGwNjGd1At+H38IrYL2RYlVDQ==
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

Document the display Adaptive Ambient Light on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index b4c28e96dd55..cf24434854ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -36,6 +36,7 @@ properties:
               - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
2.25.1

