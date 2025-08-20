Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17FB2E325
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E03410E17C;
	Wed, 20 Aug 2025 17:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ZyKThXjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADC710E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:15:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710129; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BTD4/yi51xI5xgmgdejWLelEC3fo0iFmJGFJ5s1AD/OXfAWRj/RRzveuoKugFaO4J1jujyZg6NAzHrI/kQeHwpvJFgaKm6Z8nx4Jv3S8IH4do8v2XnJco6uiTHifLfd4qxo/zWvEDxCUjp6kObd7fr+CgzyO/Uy0Yys1yfmQ77A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710129;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=g1pmOmzinn4Zel2RAwuEijTrbLzfBWZ7OW/0+Iey3do=; 
 b=kCBlZRfHOwxELL+EQPWD60fUEsuiJK8DrWI5Wpl0w1NtgHPX0BvQupPbwUuINS8Zocfvey7vHLdoeKBWvvLkZnPtKrWFDqzZTh/oCfua8NTYqGk4Zg1HcrIRVMEU9O8WvsivPshsCiQBF8vbcH+0MxVJPA6sDopCQRRdhL7Wry0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710129; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=g1pmOmzinn4Zel2RAwuEijTrbLzfBWZ7OW/0+Iey3do=;
 b=ZyKThXjUBPU5VYAi4/gDZSTtglUWqQS3Ve5STJzG6ZDaSonlqHQu14W8AVVANEia
 BN+ql4Ig6pxRrc76waxL2r6qugMHm2onZPM9/iJILrqQlzm8c9jo8ZVc6f8wHm3rOJ1
 GhAaCJp4LIkkhP4t5UD9pB5JTai8qibB4oFQwPIM=
Received: by mx.zohomail.com with SMTPS id 1755710127144405.5634791495629;
 Wed, 20 Aug 2025 10:15:27 -0700 (PDT)
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
Subject: [PATCH v1 06/14] dt-bindings: display: mediatek, od: Add mediatek,
 gce-client-reg property
Date: Wed, 20 Aug 2025 14:12:54 -0300
Message-ID: <20250820171302.324142-7-ariel.dalessandro@collabora.com>
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

Current, the DT bindings for Mediatek OD (display overdrive) is missing
the mediatek,gce-client-reg property. Add it and update the example as
well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,od.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 71534febd49c6..d5b42a4bba190 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -60,6 +60,14 @@ properties:
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
@@ -70,6 +78,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
     soc {
         #address-cells = <2>;
@@ -79,5 +88,6 @@ examples:
             compatible = "mediatek,mt8173-disp-od";
             reg = <0 0x14023000 0 0x1000>;
             clocks = <&mmsys CLK_MM_DISP_OD>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
         };
     };
-- 
2.50.1

