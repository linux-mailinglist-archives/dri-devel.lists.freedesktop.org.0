Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 539901D42ED
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 03:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2CF6EBC9;
	Fri, 15 May 2020 01:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF36EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:24:52 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871339C5;
 Fri, 15 May 2020 03:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589505888;
 bh=ar8B5Xez/Hz/EUg7PRIHf5/uMtm6g8ntgLFGbVcFHWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E4s5IF0QvJhsBjelrC0qxPcnnhCstfRgzkJGmQsrpmzSCtUNc4UcZF/DkKXXcRUI6
 rQGf7zQsCNCj7rVfWrrQWtt3SWrIkcoZv73rHUijrH93hQJAijQoWsDboy1Qm98map
 CfyR9UUj6WCjURzpI52gu1QySFHsMMRYAk9KuKRo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] dt-bindings: media: renesas,
 vsp1: Add power-domains and resets
Date: Fri, 15 May 2020 04:24:32 +0300
Message-Id: <20200515012432.31326-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The power-domains and resets properties are used in all DT sources in
the kernel but are absent from the bindings. Document them and make them
mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 54b130de3ae2..ed52888baa4d 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -29,6 +29,12 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
   renesas,fcp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -39,6 +45,8 @@ required:
   - reg
   - interrupts
   - clocks
+  - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -59,24 +67,30 @@ examples:
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
 
     vsp@fe928000 {
         compatible = "renesas,vsp1";
         reg = <0xfe928000 0x8000>;
         interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 131>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 131>;
     };
 
   # R8A77951 (R-Car H3) VSP2-BC
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
 
     vsp@fe920000 {
         compatible = "renesas,vsp2";
         reg = <0xfe920000 0x8000>;
         interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 624>;
+        power-domains = <&sysc R8A7795_PD_A3VP>;
+        resets = <&cpg 624>;
 
         renesas,fcp = <&fcpvb1>;
     };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
