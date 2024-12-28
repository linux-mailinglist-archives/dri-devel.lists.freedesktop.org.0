Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86F9FDA73
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 13:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F4D10E316;
	Sat, 28 Dec 2024 12:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="LXGi/i2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9738E10E314
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=tWjTA
 OLgd9HkbIXFzlj06PfRlzkvfWEKiYD/XWeq8os=; b=LXGi/i2CbK8w97uz6lNmS
 fevRKfb7w9vg03qEzbeuO6Xpdrs7vlVFmDxID48ZcUnJBWw7PR3F+AfIQ0bh1vXG
 8ErwPmIwr0Z8g7evJjVT4J+hRPLDrXzSjtXAW88tYMlsWZMmXOR01riv5dahx1yV
 gpXGS/fByXPWdZjDRJK4iU=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wD3t0tl7W9nUxdCCQ--.1009S7; 
 Sat, 28 Dec 2024 20:22:07 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	krzk+dt@kernel.org,
	joro@8bytes.org
Cc: cl@rock-chips.com, robh@kernel.org, hjc@rock-chips.com, vkoul@kernel.org,
 devicetree@vger.kernel.org, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
Date: Sat, 28 Dec 2024 20:21:48 +0800
Message-ID: <20241228122155.646957-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0tl7W9nUxdCCQ--.1009S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFWxArW5XFyUKr4xXrb_yoW5XF13pa
 93CFyDXrWxGF1UXw4ktFn5Can5tF9Yyw4Ykrn7ta17KrsIgF4kWw4agr1DJr13WF17ZayY
 9FsYk347G39avr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7L05UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA-DXmdv62k-HQAAsS
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

From: Andy Yan <andy.yan@rock-chips.com>

Add vop found on rk3576, the main difference between rk3576 and the
previous vop is that each VP has its own interrupt line.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v1:
- ordered by soc name
- Add description for newly added interrupt

 .../display/rockchip/rockchip-vop2.yaml       | 70 +++++++++++++++----
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..f28cea4a6d82 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +38,22 @@ properties:
       - const: gamma-lut
 
   interrupts:
-    maxItems: 1
-    description:
-      The VOP interrupt is shared by several interrupt sources, such as
-      frame start (VSYNC), line flag and other status interrupts.
+    minItems: 1
+    maxItems: 4
+    items:
+      - description:
+          vop system interrupt, such as bus error, and vsync for vop version under
+          rk3576.
+      - description:
+          independent interrupts for each video port, such as vsync and other video
+          port related error interrupts.
+
+  interrupt-names:
+    items:
+      - const: vop-sys
+      - const: vop-vp0
+      - const: vop-vp1
+      - const: vop-vp2
 
   # See compatible-specific constraints below.
   clocks:
@@ -127,31 +140,60 @@ allOf:
           minItems: 7
         clock-names:
           minItems: 7
-
         ports:
           required:
             - port@0
             - port@1
             - port@2
             - port@3
-
       required:
         - rockchip,grf
         - rockchip,vo1-grf
         - rockchip,vop-grf
         - rockchip,pmu
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-vop
+    then:
       properties:
-        rockchip,vo1-grf: false
-        rockchip,vop-grf: false
-        rockchip,pmu: false
-
         clocks:
-          maxItems: 5
+          minItems: 5
         clock-names:
-          maxItems: 5
-
+          minItems: 5
+        ports:
+          required:
+            - port@0
+            - port@1
+            - port@2
+        interrupts:
+          minItems: 4
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: vop-sys
+            - const: vop-vp0
+            - const: vop-vp1
+            - const: vop-vp2
+      required:
+        - rockchip,grf
+        - rockchip,pmu
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3568-vop
+              - rockchip,rk3566-vop
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
         ports:
           required:
             - port@0
-- 
2.34.1

