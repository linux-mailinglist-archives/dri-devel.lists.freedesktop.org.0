Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F606A5699
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B37810E674;
	Tue, 28 Feb 2023 10:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0F810E674
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:11 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 31DF46602F90;
 Tue, 28 Feb 2023 10:27:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580029;
 bh=g3NFpJH4/03P+ic0BhIheOKxhuMMGL+BE+w/2aTRtIY=;
 h=From:To:Cc:Subject:Date:From;
 b=LA/b4pGc1pYewDwhPssPa64PjNlqjxa1iWFAH07T1+oVAmCIJpmHfi2DrgrlXbnLO
 m1Anv6hn3Fyb3U8XwyXAKrN46v85PD2nrrUSg7sTLnvlwbCt5CWyPKV7TbLw6krpjI
 6SuFxwHXemINV4Swuufmdx1Mj29/0zebztcOBizo93nt1I1jhZW+jB3O981Ko1Cjyy
 Z341bJKmyJUQ1I70Ofj/WLt9GsCMMDuh/lZHKayubYicQ30TA0Shz5moJLDEAmWglp
 pQAWHnK9yBUxgIrNBpgDgqg8agXKBviPVnvO78eez7ZbkbOCO4AeMoryvyhSQP5YIH
 DJmeqg3wSBXow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 01/12] dt-bindings: gpu: mali-bifrost: Split out MediaTek
 power-domains variation
Date: Tue, 28 Feb 2023 11:26:53 +0100
Message-Id: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for adding new bindings for new MediaTek SoCs, split out
the power-domains variation from the `else` in the current
mediatek,mt8183-mali conditional.

The sram-supply part is left in place to be disallowed for anything
that is not compatible with "mediatek,mt8183-mali" as this regulator
is MediaTek-specific and it is, and will ever be, used only for this
specific string due to the addition of the mediatek-regulator-coupler
driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..7e110751353e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -109,6 +109,9 @@ allOf:
           contains:
             const: amlogic,meson-g12a-mali
     then:
+      properties:
+        power-domains:
+          maxItems: 1
       required:
         - resets
   - if:
@@ -131,6 +134,8 @@ allOf:
             - const: gpu
             - const: bus
             - const: bus_ace
+        power-domains:
+          maxItems: 1
         resets:
           minItems: 3
         reset-names:
@@ -164,8 +169,6 @@ allOf:
         - power-domain-names
     else:
       properties:
-        power-domains:
-          maxItems: 1
         sram-supply: false
   - if:
       properties:
@@ -180,6 +183,8 @@ allOf:
           items:
             - const: gpu
             - const: bus
+        power-domains:
+          maxItems: 1
       required:
         - clock-names
 
-- 
2.39.2

