Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B18CD298
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75D10E1EE;
	Thu, 23 May 2024 12:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SX/nVeRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326410E045
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:28 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-351ae94323aso1748204f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468566; x=1717073366;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NDc5dZ2G0NhI2V2Vx4EMLzhVv0NLoW/2hnjkjc8WSGo=;
 b=SX/nVeRHn0YjU2MrTjhOkELwYIyr2h/tJOCp6Rnf1ZP0YSfYMNhNGAft7pjBVWxJK8
 4xZT/e0Yme0l9a7VBOgwybSaRLBICTMG3vjo3RXGkekz4a74IVbnYmTKZi1F9PKQUnbV
 geW/MF5doW/WMvpRWA/tQ7+qj7kFBtNfsaXZHq2jl1lFRb9CKllwp/Gc83xHOSwbSAn4
 o3K9mig3ua4WkE36L75mtWglHxpvNPKcGRfB94IA95mssG/d6U16sUIS2sAd5b0FITXk
 NSM8Fgm31WAvrnlGDujMh3YByqSAimjQ1nz8YxUccpK8pkvQ4lz/mxB7WRbBj3028bG/
 8Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468566; x=1717073366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDc5dZ2G0NhI2V2Vx4EMLzhVv0NLoW/2hnjkjc8WSGo=;
 b=V3oUuNmIoalfSXXjr6UHzLptVrBxXKSM+78abfblfBAAh+enFWuvxz8UiqRRNSzLBj
 1Um+UmCelafmvi21ie6Y17tVNApoyr7EKZ0WQiCPDGbnlTDUSg0cTBAS13aouoha7V0z
 yVjz9P9uh+Ho1DIVHDqWIPinMBGyMAik6d/BnMNIE4V5vphe7GcIa/mTq6n+ZnN5OPSC
 wF1mrEGnu01T9hCvXrhbLjqVUgIVPaXuXTxgO+Yr05sZzujngg5cU+lLKpUyDKCEHP9D
 oMg2+E6cv7sFKubz4nSzk+pFBagAZcjKpxLXrFBvT3IET+RIbfpy7b+Wg4d3TLPrMIXR
 VJbw==
X-Gm-Message-State: AOJu0YxdV5vs07mqio5co3u1fQa6wGvVKCkNqhMD5krd4HBExmnx1ZIM
 UXxb6WAg3k3t8Dp2ad/maJ7OF+dWmO+IKicMeEgTTl9W02MX8ke1Qi6zk33GKb4=
X-Google-Smtp-Source: AGHT+IH8/w/D/ym66Jp2uFgYUse59/CTDw+EvixC5vITkP0BBwv3oWzuRnk1t8GSb3ZKNNdCd/k3Bg==
X-Received: by 2002:adf:efca:0:b0:354:f500:51c4 with SMTP id
 ffacd0b85a97d-354f5005628mr2531090f8f.23.1716468566458; 
 Thu, 23 May 2024 05:49:26 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:26 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:14 +0200
Subject: [PATCH v4 01/15] dt-bindings: display: mediatek: aal: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-1-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=rYGWQnXPl7e+8ZR2q/kPCuviQpIOkOcbGurCO7CSNDc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTHJzX/pP0aymwYIu7QjbfH/1r3N3y2tzTEGvp
 Qh+njumJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURW/LD/
 0ZN8rHNVNvvNKuViGWaqPBEkwuwXd1VhlMXVPSXv1j7GbVtwNjsJbNXSXZenNBqXVnAUqKwSbFl1km
 7jYjqzscujGwOt05W3nhbgW2S8onp1G8X+JZkbkyjju/doC/uymiO1LuVXSeY22VGZFkcZwAVXEklV
 CIsGYSmmcg187TLVBBIFf/XagsIYbphmgzMdlNTVf7f/BP7qHMWQHdWfxCwm3IYTx2PqFa/jjHZD22
 ZQDg2MW7Xcx/pmsOxNr9esxW37O8eg6Ckh86y32Sn5KfsNfQeKMWNud9NEsDhdHirwWLFUBCm6p5XE
 aI+DSCwoCFKtBnJy9DeiRLun2nFtszXfTgfP518hMF7h36vCQCMPbZDDZp2HCfJ/B0BLStYwzgn1X+
 6hyzyDJgTHatE6cXE3V3Ut17QmZryJrFkgHs5/WkinIyT8SURQXURvewEv8v95T3LZrbOo9tnwb+Zq
 QYXKlf1k0GgpNGt6DWLMGbQrvsXb6qQN/IVVmUc7Q8W950Q1mPs1iktinGiS8AccGGOUaNSviWP458
 xJph6E9/jrH7ObFUK4BA+Pl429CwQnFjd0g5tVL4MrN+/tvmGOxEBb9M03ekQKA9XcfuCm0Oh0kv5z
 Fr1Qrt/7xTf8hqiexLhXY+5v3Y/ZKqgQgvHPsW9VsDt2wf8uiXTfG8+PqYuQ==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 623cf7e37fe3..47ddba5c41af 100644
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

