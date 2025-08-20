Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC2B2E328
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE2410E79C;
	Wed, 20 Aug 2025 17:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="VQR9NnG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32A410E79C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710143; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hNLFFnLSVZfTH6obyIu9vB7kNyghZB46uNT/owLhChrUkt43dDp2CiEQBc+X98R/RJRqrt8h+Oh8iX1T8k1hBjdOBqxq294Oqq6cRySvRmUWN5ryFv2Ledz+zouEe95+3GYLPbhUHsYTT5w6kwyrvGkceVOn1PLKaH/tAAQNy7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710143;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=; 
 b=XINCOMJQ073ZT+t6eryGdxXhIaB/jBYBRPnSaFtbLaOn5zu9/TdTolsWmTqZxQObonwiVm4YUHl43pDT2YbIkXmRjm+B73eBf6c9tyHuf2gfGmAE6lAlxz0uR+er23XIuH23SLkD84Q52L+AoEONYXjTS9OvIqS/CG8Dx+UCR9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710143; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=;
 b=VQR9NnG/NVAZ6T9+0zthHG6IpuE7PIoRMgzP8KW0dXszaYXMff6R+3xjuF42A0sn
 8XLm3HIMEfXrvoqbF4PyQvwSvIGPPmgrr/fBKUfjbfRIXa6ss5bVfcaFZEOPZCh+z/I
 JuOaD7CD1Vln8Bzn3QBp405PC7EtsV50hWldI21o=
Received: by mx.zohomail.com with SMTPS id 17557101417048.584499419248232;
 Wed, 20 Aug 2025 10:15:41 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 07/14] dt-bindings: display: mediatek, ufoe: Add mediatek,
 gce-client-reg property
Date: Wed, 20 Aug 2025 14:12:55 -0300
Message-ID: <20250820171302.324142-8-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
engine) is missing the mediatek,gce-client-reg property. Add it and
update the example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 61a5e22effbf2..ecb4c0359fec3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -64,6 +64,14 @@ properties:
       - port@0
       - port@1
 
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -77,7 +85,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
     #include <dt-bindings/power/mt8173-power.h>
+
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
@@ -88,5 +98,6 @@ examples:
             interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_DISP_UFOE>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
         };
     };
-- 
2.50.1

