Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150217F4720
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5986510E62A;
	Wed, 22 Nov 2023 12:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 641A410E62A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xHZcH
 nUWCgGoIT8dFdu6cImkI1GzZO+m/2tSo8tzkIM=; b=hudgzrCbZuT2bhueDLOxH
 hbJC4zhzUFXT/ZvxfvOjQtoFJB6ZIcdNOQKV0tfCfxaM4A5T5O4bHAT6hQR7iImm
 lua2NeP7JjZBNoS7F0xcX3Y9/NDYW9mYY8KAABrcsT1SA7P6zLoMdmkTMDoKClWd
 JrJOtbzP4hAyKEstE284/Q=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wC3P7s3+l1l+dXuDg--.53227S2;
 Wed, 22 Nov 2023 20:55:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v2 08/12] dt-bindings: display: vop2: Add rk3588 support
Date: Wed, 22 Nov 2023 20:55:18 +0800
Message-Id: <20231122125518.3454796-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122125316.3454268-1-andyshrk@163.com>
References: <20231122125316.3454268-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3P7s3+l1l+dXuDg--.53227S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW3uw15XFy7JrWfArW7twb_yoW8Kw43pa
 s3C3W8JryfGry7Xr1ktwn5Cw4agF1kuw4UtrsrXrZxta4aqw40qF4akwn8WayUGFn7Za42
 9FWUua4xGF17Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzBTOUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEB4wXl8YMqa2bQAAso
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

The vop2 on rk3588 is similar to which on rk356x
but with 4 video ports and need to reference
more grf modules.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- fix errors when running 'make DT_CHECKER_FLAGS=-m dt_binding_check'

 .../display/rockchip/rockchip-vop2.yaml       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index b60b90472d42..24148d9b3b14 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3588-vop
 
   reg:
     items:
@@ -42,26 +43,47 @@ properties:
       frame start (VSYNC), line flag and other status interrupts.
 
   clocks:
+    minItems: 3
     items:
       - description: Clock for ddr buffer transfer.
       - description: Clock for the ahb bus to R/W the phy regs.
       - description: Pixel clock for video port 0.
       - description: Pixel clock for video port 1.
       - description: Pixel clock for video port 2.
+      - description: Pixel clock for video port 4.
+      - description: Peripheral clock for vop on rk3588.
 
   clock-names:
+    minItems: 3
     items:
       - const: aclk
       - const: hclk
       - const: dclk_vp0
       - const: dclk_vp1
       - const: dclk_vp2
+      - const: dclk_vp3
+      - const: pclk_vop
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to GRF regs used for misc control
 
+  rockchip,vo-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to VO GRF regs used for misc control, required for rk3588
+
+  rockchip,vop-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to VOP GRF regs used for misc control, required for rk3588
+
+  rockchip,pmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU regs used for misc control, required for rk3588
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -81,6 +103,11 @@ properties:
         description:
           Output endpoint of VP2
 
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of VP3
+
   iommus:
     maxItems: 1
 
-- 
2.34.1

