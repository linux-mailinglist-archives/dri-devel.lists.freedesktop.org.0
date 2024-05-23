Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937838CD29C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3110E2B1;
	Thu, 23 May 2024 12:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JFBxCDP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E817210E208
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-352129e3c8eso5243079f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468568; x=1717073368;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y0mi1WL/7iRSdUpRf2YRMSaJjir0sEMp/gQx1uv98kI=;
 b=JFBxCDP2FbkTtpR3FzLpfjzDix38UpHKo3qnLUXfKyboOZ7tnS2xZJde/nRHovAsSD
 E5QY7XyAPpEUrhysYOGSBPKCmd2GTnbZzRFNmg42YGDrJ60mY2iz1RCHXmeOGP7etnMZ
 JdKWho6M1qDQpM+LsKIcgbBxWkYW/HkqNOOrPO1BcWm5BoNb5ZeD7V9hZ8OYDcEIjkpr
 rYwPZaHUZ7F1VpMuuWddkkLnypYno39iz4XZIfpfkhMZeZ7Z053ycm7PbpOzQExwiyPr
 qXBn7cVUs9+GyPmgdpPV0l4CwB2NeZGldgaR/eNu/RnOF3DKev5FWuZrn24qS/0nTfLC
 vK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468568; x=1717073368;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0mi1WL/7iRSdUpRf2YRMSaJjir0sEMp/gQx1uv98kI=;
 b=XaBhOHERxsjjSGU9nhby3TP9PyIH7V5Ym3aCLA1OgdZbldgD/xnIBDuvMuBl7jgyq9
 VzqFAsoSyUbCLwGvjG0NGyzQVdTM7Zt5upkt6/dK2+ZjeKfxtGTD5Df6dbRcohYYMSmh
 uTuYGT8gxEhOqOoJPVg2kSiAT9WoL9H5D4D8Hc8KWx9SKtguD13NKNSqXJ6HS8QIWAsW
 BfEz2dw55S/KyuztFu12IbDKIYBiuKtchs/DfhT+26cQrnnXIIldHI0r2yut7M9RUuT3
 K06jaHfJoG1FufF0z+t4bF7lTHx0bu58Cx/Xmj63cZkpjDJf3wAW/TsIft0GrLpEFZdx
 WvmA==
X-Gm-Message-State: AOJu0YyKbgbb7vzBsHKfANSOV5FpW4ugL7+sf8B8WirIVuN9qyq/RGEg
 fpOeqJjQsJluvxR7R1R7kgrVkes+7JLitdROqw1pqSI1f+RUBgPBNOkhRX/K91w=
X-Google-Smtp-Source: AGHT+IHBLKdIYYu6QC45iqx4D28BFWQ2Pl61zO4qgqZxwAe7jzaeeQgHKXs3Sob/u4RnkADQNkEQLw==
X-Received: by 2002:adf:e245:0:b0:354:e04d:13e0 with SMTP id
 ffacd0b85a97d-354e04d1478mr3622189f8f.46.1716468568326; 
 Thu, 23 May 2024 05:49:28 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:27 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:15 +0200
Subject: [PATCH v4 02/15] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-2-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=upYLopDUv2sREO316+2x/IDyye/JUMDkTsLPG4uVl6w=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztThGaQtVT5PRllT6P21gaIDXU8tLB5/ByVKkE0
 BePaKxCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURToFEA
 CNjvAKkIUW8c7JykffXwJogjsEowvMJNe3HDTc7LOREneBMS1az+BXGjSgO5blmyB7fGtgJsL+Zv0R
 xd0wNYYfAMLEXOp6KAn27MVcpfvIJi5NfP1SEwoEM222Y76QhHvMa08kSyxTal1L/cTL/I3X8qu0p7
 ckqMnSguyi04ZTm26UrzewnhaRayEqUUFk9I42ErrJAFj405GkoF+4hzqnIjKCITsH0t0Mj5c9c7Jl
 pVE4ly7f//JUU7dERFcqF4w+ajQu0eObx4T11VmSa3GRscWZb51v1Y2dh15JzJIZ7EDTtxD4z+CTxo
 GUNuzimI53FIMnh/pA6pwtIaIIr3Z4P/ql8LnNhf0/RZBfu7w3UgygJTJJdbsyFH2IEW56i8wOP043
 eGkiiE72dAhNyUMULnTHC9g9Gy4rh8FJFpfz8jOCnM8OUg7ZDQNnCGcVk+y8vq0gXBMZzoOKN5ouCl
 EyxNT5BGpLftb7AJibOGth78FavsW2MSW262b7XlnKPtR57/WLLKzsZqsX3Lnc8UrhJbxDN6a3EWyj
 HgVak1ai3PMyArhLZDYYGuvYLNUVdBljvCp96QgIapouQdmjQpjEchRTg3pn8/EggEKdxkFyK0D+AZ
 mQdy6aFqRFMDQOgv4qOpetSxiRH6ixvp6qQa08GGSz2ITAv8spirsDS4TVew==
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

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 71ea277a5d8e..fca8e7bb0cbc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1

