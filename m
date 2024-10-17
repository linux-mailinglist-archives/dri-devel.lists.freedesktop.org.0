Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E539A202B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9E210E7EB;
	Thu, 17 Oct 2024 10:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E8r1JIid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2FE10E7EA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729161495;
 bh=Cq3dZsX1iPH2sUqY98fTwu1oiCm4WlLKa+tNu4ZQhh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E8r1JIidztxdOdnyIv8lGr/tXJ5KxDYz1yrg6lMI7T4fnLUc+Q5r7XoJBwmkc3wVc
 W48seREFy534RgWyNx35XyTckzKslWvvojEflhyff/unWH9ZyX2dZ0iiIMo0zPtL/c
 o748ajU+dL6HmlKkoQkxxJdOfiJl3gvcTUMS98Z2fa9x2KpB86OQn1nTZ5LG3ZPZtZ
 npg/RbfHPnmGbjyD3Lxccqxcbmqp++SZNsxh8y6CcKgmR9z4ga9b2jjmKKVKdyc5yJ
 velYOP2MbncHgY1Yc/6r4obGiT1Tv8WGHenZvVtaqVCoztJVXnRN8vm16pR0UGzLD+
 sgNI4Wtbwgthg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BE91117E14D7;
 Thu, 17 Oct 2024 12:38:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev,
 michael@walle.cc, sjoerd@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH v13 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Date: Thu, 17 Oct 2024 12:38:08 +0200
Message-ID: <20241017103809.156056-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
References: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
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

Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
per HW instance (so potentially up to six displays for multi-vdo SoCs).

The MMSYS or VDOSYS is always the first component in the DDP pipeline,
so it only supports an output port with multiple endpoints - where each
endpoint defines the starting point for one of the (currently three)
possible hardware paths.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index b3c6888c1457..3f4262e93c78 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -93,6 +93,34 @@ properties:
   '#reset-cells':
     const: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port connects the MMSYS/VDOSYS output to
+      the first component of one display pipeline, for example one of
+      the available OVL or RDMA blocks.
+      Some MediaTek SoCs support multiple display outputs per MMSYS.
+    properties:
+      endpoint@0:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the primary display pipeline
+
+      endpoint@1:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the secondary display pipeline
+
+      endpoint@2:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the tertiary display pipeline
+
+    anyOf:
+      - required:
+          - endpoint@0
+      - required:
+          - endpoint@1
+      - required:
+          - endpoint@2
+
 required:
   - compatible
   - reg
-- 
2.46.1

