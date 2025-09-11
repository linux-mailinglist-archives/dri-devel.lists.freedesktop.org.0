Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE987B53716
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90C10E3A9;
	Thu, 11 Sep 2025 15:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="N5QfbwJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB43910E3A9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757603611; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y3TWVD8OQzag4n7vlKhHW5hOxDdlpiKY6usJ9p/Cd7xIJo+Wt+wwGpMU1mwM+/yaTN70Q+HkZEvfU4U5Nye8JRjBACTcEb2BPVgFIvEJfd1jRM0UAHYwJoRphYahJ2NnI6bDe/++mWRFzbzDRVIJNAiXFd2MlhOvUgniihMT4ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757603611;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bY54AAdDsGJHBRu4VNnRBqaafsYGU+PM+RWfhefn48Q=; 
 b=SDZ70MmO1l08Sec8X99CQjE+6BeOZSjEsYq6rf3CQ8i5apB5Su+nEys4dfRw2Ptfq84xKDgJCcdnRUA2LioqVQ655gfYIGPlmaBf+2EL7LGCc2j0u4AlA0fEjU+8UqvIx7CTDdbnZhWHPXUFvx8JizPAtqUMamd9/AwpOa4Y82U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603610; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bY54AAdDsGJHBRu4VNnRBqaafsYGU+PM+RWfhefn48Q=;
 b=N5QfbwJ900PSelAysTK+1BMVDe9AfBePeRmlJVYGFQn+jbiN9qM/JfZSQQH6pdsq
 CV0/LWZV3dzLQcKLLX3OPZ13viNYqb0CLjUtbjRvarvzuzZ5sbRNrKRXwhRgdtsupdp
 U2ff0D8faKik7RS3sTIgM9M/EVfMY/CFZKSM1iR0=
Received: by mx.zohomail.com with SMTPS id 1757603609772835.2831161402115;
 Thu, 11 Sep 2025 08:13:29 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com,
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 05/12] dt-bindings: display: mediatek, od: Add mediatek,
 gce-client-reg property
Date: Thu, 11 Sep 2025 12:09:54 -0300
Message-ID: <20250911151001.108744-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
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

Currently, users of Mediatek OD (display overdrive) DT bindings set
mediatek,gce-client-reg node property, which is missing from the DT schema.

For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
causing the following dtb check error:

```
$ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
[...]
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: od@14023000
(mediatek,mt8173-disp-od): 'mediatek,gce-client-reg' does not match
any of the regexes: '^pinctrl-[0-9]+$'
```

This commit adds the missing node property in the DT schema and updates the
example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,od.yaml     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 71534febd49c6..930c088a722a8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -60,6 +60,18 @@ properties:
       - port@0
       - port@1
 
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: describes how to locate the GCE client register
+    items:
+      - items:
+          - description: Phandle reference to a Mediatek GCE Mailbox
+          - description:
+              GCE subsys id mapping to a client defined in header
+              include/dt-bindings/gce/<chip>-gce.h.
+          - description: offset for the GCE register offset
+          - description: size of the GCE register offset
+
 required:
   - compatible
   - reg
@@ -70,6 +82,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
     soc {
         #address-cells = <2>;
@@ -79,5 +92,6 @@ examples:
             compatible = "mediatek,mt8173-disp-od";
             reg = <0 0x14023000 0 0x1000>;
             clocks = <&mmsys CLK_MM_DISP_OD>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
         };
     };
-- 
2.50.1

