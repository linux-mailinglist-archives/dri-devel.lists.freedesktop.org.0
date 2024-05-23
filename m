Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0898CD29E
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D5410E20F;
	Thu, 23 May 2024 12:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e57Y2Pd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA20310E208
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4201986d60aso16359875e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468577; x=1717073377;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kkJmBq6onyQSq+T7hLJMjqQJ9w5LaJXZraoLV+X8Auc=;
 b=e57Y2Pd+KOIf9iO1kqaFlnpAsyOwGH6X+9iRUBpi4KxdwvKG77Oqz1MNE65ZPHNWQ4
 8CXiz5osySubiliZScZ3w7Bf6a4JuRuIwgIenB1oTxhj2Z3M3kRLOrIATApLCyGmRpUt
 EERPiV3fijWyF93t1ocj5nJEafYI9ltPuKjnqdouvCzfryXciE35ItKY2dpaeW3X5elJ
 czTUK9TAC74bdY/x94haMvlYSf4HfvNx3upwyyhSi9TZfXVYPovE39iyk3+bqxm5o6XQ
 AgipJ/piNMYSpvmqyaHjKQwYnEtWTMKnr9QRt6wt8lfwquGCr5qDXQ37RA/KUS/mEC5V
 dbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468577; x=1717073377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kkJmBq6onyQSq+T7hLJMjqQJ9w5LaJXZraoLV+X8Auc=;
 b=QtxaLdj96SYEcL5bKBMptKwzr/AJ1fmr8VmqHv58y8q5hNu43mVBq4UuyGC3EsXPia
 IDKtsu0+VC0/pQVVVsQ3jBntpSarsH/FpVDONqz/ZsXx00+5rV5NE60TZcHK0XJnR86c
 wzw8/RoohuwtvJBiLtDWvbvzQP7sux/Nb6IBPzAgudqJd4s/MzyczgPaw2pD9F8DUKbb
 bTuaQsVi4am7UuqI/UF7WKIkK6XO4dmNMMUn98QWcnl/zatH+iq0KXu3eFDsdxBRBziW
 +BCoepTn+UQCJyLtcxW5qcETjPh3gxc7UJdhj4w8l9DRsywJh4jXNNXTKX2uzBoFV0dl
 p0fQ==
X-Gm-Message-State: AOJu0YxPcvJ04s8+Pt0FP1gQaiXkwYAfYMo9tm7l6HdvHL+7nmy0a3rm
 GaOQKAUptxoLO7U/rfLz7xSc0agBWYxvAHiufBdp2XLvGTUqAb2ipcZXr5KqAp0=
X-Google-Smtp-Source: AGHT+IGdHb+2nhRmWTFg31x3CwTvhs3p8/U6MNgzEjblZfe0qTk58c4045NP6jEabYi5nerCmPBVUA==
X-Received: by 2002:a5d:638d:0:b0:349:eb59:c188 with SMTP id
 ffacd0b85a97d-354d8c7428fmr4286365f8f.5.1716468577068; 
 Thu, 23 May 2024 05:49:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:36 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:21 +0200
Subject: [PATCH v4 08/15] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-8-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=DEIUlOZDb8oCu073O6xdZzPGpsJSPUdkpGXdE5hcq90=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTYUWDKmTXjiazVz8jH3hWP22eE7eomiqm8qhE
 7KBFP8CJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURVWlEA
 CR4mlMMfr4kWE7n8zvTLVPBqU48Mean15/WOP/9YSkzRk0mkEJlhQZNGddl9H4UEws3ztdlyaUajcE
 vASa/78GPL64xAd8qk+iljbwhBf46pmz5lPRdNWspQWq/vBk1n2FWYG0TVNyprKK1kZLF77oksMym3
 uGoxmsU8St6XPBrptLM+rbuxtvNhnahTdqCr9H3kSs0dGcphK6YgOnfBvzDiMzPtAc9z5WIN4BBG39
 3qU+Lh7JtybXGHrzgpYtmKBnipxE79PMZP4Kf22wFt7Q9s/nLh4OOCffZQStJxB8bDfn69OEiB9pW9
 lJVWcsxmvd69z5ElMA411LOggE5hHC45I87S1Zn6gGxGTiDrY4BVVtP1EkrDgylFY5SsRoyGKhKssc
 pKnBA+LuS9eLUTZocmwYHYEL1IRP8Q1ZDC2WLs6FUX/f5EnJs37vysiE8/0lw50RC2qoPa0YfI1J8U
 O0mzuiHQcMcBhE85ePeztAgrX7zkt0R3cDFvZnMnZwT2AShtOgY/baQaDpZAkipGnQ338BFxWVgOS8
 5JNbiL3/aQbUyRDKEZJtCZ2viL1VY57aNhSGVE21IqvKtSk7ZTaYarw+1fFt8fO1kHHz+YpbRPO8b1
 4U4mHHm66kI7zTG/XxnycuBYFEKnJPOnXhFyOrCVcFrEc0E9SA4c8KPv3MXg==
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

Document the display Gamma on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 17f299abda11..48542dc7e784 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
       - items:
           - enum:

-- 
2.25.1

