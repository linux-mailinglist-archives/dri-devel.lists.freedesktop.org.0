Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97612B2EEED
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 08:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C1C10E883;
	Thu, 21 Aug 2025 06:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BFJqZyqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF9B10E883
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 06:59:06 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afcb78d1695so6649366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755759545; x=1756364345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=;
 b=BFJqZyqmfAPfPh7mydfTvyxAfiAA6imZ0632DeY/Fmdtpkd51zRPWv+0Ty7IEnVBQk
 BxtuS3/3ibHiFM3Wucc98xxJFtpX+D6DjSn0V1qac0Jfr377P04njetQxDqgOUqH668r
 O22lxW0ZO7wBoyUZHH8HUSG4cb6S09yneZ6c7zr4SBQB4/yxMhJpRyXxMYwKz7HLvdZX
 ghPpzcrVOgvOOJN1NZ5pE8tja1a1Ex92ijA20bssSfvb3oLELtAU7LrDGVi++m6k/Wqv
 oh3KVqDZ91vd1PxBHgaaRbdSWIG0Iy5o3DqjhFxHUHbjWI6fWx3W9Q25aXf+lebCJmZb
 KuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755759545; x=1756364345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLhC4lsKdeJ9/A2G31nCU/i9ls1OYFW3dx0kccZaDUU=;
 b=Nx+sfkFv/E3tbTREo04UzfONrkoAYgbQKJiIggpHTUKmC40HTyq7g4vRAPfIWudGaP
 YZyJV9vJ+MYdAhxVKfGE8N9pZTPfq35UQLXL4M+FThmPzr1BB5sYLIgv5zK6iBd8LORz
 oeXlDp3NidARmNbwyYR38KW/LWI1M9PvTDUpjDCq7ppP5CYuNt+sIGM8ldKxtSR4N8RT
 kNYFMRE+90SI6p88iy+2eIAySS75fzozTdBzwiCuPjRJScI6tNdz+IAsGQwjHIvxzFme
 bTV539NzKKCpyJe8HMe4D/YWc1HeiOMLQ1AOwmexkzgXrPe3/hx3W8Lq00m/PB7V6GTS
 o8Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVcTcXyfbQ8ksnO34KTJ3aicFbTmmwCpOA1N8+rT5hcuOIBr/HtyN6Dz/8Da6511hKjBJLXO/EhRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznBUG7Zb7rRPcJ7vfrRIfw+3CRQf7k1wSZ/9z0uQF2dr8mh1q6
 FRmdysie4QzN2DZUo98vRM/4bwAq0df6ZMCMnXtFB3avpZCxgT44uZkmHY04FPuytjI=
X-Gm-Gg: ASbGncs6QDrBb+gvsdfaKyHu2+P7WPKTS7QeYZ9oVwTM2ASK0cxfBpVO/6IYY42nmm8
 cHlwVF9pAUTNaenmezhV0btQrPDTL+h7gzY08PY0n9hssk9lSaJsIB0TdXJ9/UZXlTITB9Z+4ed
 Y7N5JefZ+ifIEMXEJcHHdJu7jc1IhLMt/PHTFyxqHOF6ipXgrqfOSpxtbyu0Scuu+GKr0VubmSp
 aW5vI/SGtoy8WsSnAF3XR4Q0e13k8c1g5CoS1fcY0UhL0AStoTiMuf7RSeugGj6MydjheV7kXXu
 A7EWdw8Jf1f1lJlua6WgyCsTuI3vBp9rlS14Bml3Z0hVJ/+1RYvx6Hs/uyA9z0ga1JwrmhRqvmZ
 OnN++poNxNkUBvTk7Wl2GePJhOD2Czxth3A==
X-Google-Smtp-Source: AGHT+IEuVTZYnamN/Xowwi1nRdH6LMjKeL4XdJAvBXyBCXh3wYl1BQwHweSgtnWHDmWjFNyCCYNcGw==
X-Received: by 2002:a17:907:2d90:b0:ae3:5d47:634 with SMTP id
 a640c23a62f3a-afe07e9d221mr56729866b.9.1755759545251; 
 Wed, 20 Aug 2025 23:59:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf0ba2a42sm296119266b.49.2025.08.20.23.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] media: dt-bindings: mediatek: Constrain iommus
Date: Thu, 21 Aug 2025 08:59:01 +0200
Message-ID: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=noJnXR5fz5uvdCvAkcNEa1jNmbr6rkH0YiAY8IYmjQg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopsO0jo7CwTeUi/nTEXn6Hl/cd661HvDUBl1G1
 CoaNqlc6G2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbDtAAKCRDBN2bmhouD
 13pQD/9vTqb+ZSb40TqgV9s9GSHbKX+jREpUaz1Lbl/H9x1SCzuYcFTdKLgx0SBdIv/3/DnkpJq
 vo4NhdsbhEwABDRNfTFkidTninZ4+sOOW9IBkJcd81ceHIlMX/+8FhLS+PaWcfQMGzjmOWO2LeM
 hl1knU+od7Z5A6vy6xOrsQ+UIqs3NPsxc7KkHDjxYdc5HynoLR5dP02syrmBRRvX7A19iy+9RnS
 ZeW4b4suXJhVRt6Bp+OT3EGGuQxXuJ/lmlt5AX+5b/lYeUkw1+WQSRJDDEpl/7zgoQODT35oveh
 kmYdjWLaxjh6T99vUluCdHMm20oVUoiF1ESlZ+juv+2wkQ83KrC7H6V4mh24OywQu+omV6FXXgS
 UkP1ZpMX318tChOvSCx+Flh5W66b+1NAfDyq4eFJzqJsgd8BUj4HP7AXPZtEYZWUB+TlxW58LVY
 AUqfnNxQKwMp4in3IYO2O0a7/ybRfGUOBxTzYITO4PWbHZq3ofmPG1GG8qayMt9OFJbDjBP/gUb
 IxShcYENueZ0YrKLb82fSGXqRGhcfnFNr8AB8APcAIjlUg40iWE9ySR+DnZagKj74puDbphzG0Q
 iUyzR25u2kDVdGOnM5FcwTuUYBApUdObGTvJlNtxmoBzWfuZ6LQyU4DO3bPoiltiVSoKKt3AQlG
 vlGi4hhxJqNiBxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

Lists should have fixed constraints, because binding must be specific in
respect to hardware.  Add missing constraints to number of iommus in
Mediatek media devices and remove completely redundant and obvious
description.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Ack
2. Mention dropping description
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index bacdfe7d08a6..ac0d924a451b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -45,9 +45,8 @@ properties:
       - description: OVL-2L Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..c0fd0a91c4d8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -65,9 +65,8 @@ properties:
       - description: OVL Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..7e5234def39a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -64,9 +64,7 @@ properties:
       - description: RDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,rdma-fifo-size:
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..276868c0fde7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -43,9 +43,7 @@ properties:
       - description: WDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
-- 
2.48.1

