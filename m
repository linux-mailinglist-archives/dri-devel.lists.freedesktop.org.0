Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC268ED13
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BA510E204;
	Wed,  8 Feb 2023 10:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5389210E203
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 10:37:28 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 619EE6602096;
 Wed,  8 Feb 2023 10:37:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675852647;
 bh=c4XKOxPhUZU76+HjvxTFR5jXrHZr0pBaargwTPOI/Ss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b2o9AxfFJM6QmX5gwpY5DMnWxdAumOp5mbUr7Q7fvp4LtZcJo7ZeSLuv3mLd+C4s+
 EhMyG5FTLJ0P/FzFbX4poNJLZ+aY9NKBZMrJOHw75Q7x8XCivHX5+i80gyBugOvUCo
 q1TfBGxcCMw7gD1XY0KVA8cMaPloi4d/EbUrZt6Bh3f+ggW1Bc9fsbug+FUAKJ+gCB
 ygg8qpkprBgyPpuNvYgm4G1uoc6IdlR8QM6iPieOjQNsI7bGHCenL8FzdfKbEtcyph
 lvwJ6MJthlfGqmtCrwpJraxp/g2qqQytxAD8GYFwj5KwMCyJQocKzv1kehB9ReTsrf
 AP5SAdEdzR9oA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
Date: Wed,  8 Feb 2023 11:37:02 +0100
Message-Id: <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek MT8192 (and similar) needs five power domains for the
Mali GPU and no sram-supply: change the binding to allow so.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 69212f3b1328..e7aba66ddb8f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -61,7 +61,7 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   resets:
     minItems: 1
@@ -141,6 +141,18 @@ allOf:
         - power-domains
         - resets
         - reset-names
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8183-mali
+                - mediatek,mt8192-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
   - if:
       properties:
         compatible:
@@ -161,10 +173,26 @@ allOf:
         - sram-supply
         - power-domains
         - power-domain-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
       properties:
         power-domains:
-          maxItems: 1
+          minItems: 5
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.1

