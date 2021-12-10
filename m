Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A0470701
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984710E964;
	Fri, 10 Dec 2021 17:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38410E64C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:46 +0000 (UTC)
X-UUID: cb1fa888e9de4774a350af8a2122c70e-20211211
X-UUID: cb1fa888e9de4774a350af8a2122c70e-20211211
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 814626988; Sat, 11 Dec 2021 01:26:40 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 11 Dec 2021 01:26:39 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:38 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 03/17] dt-bindings: remoteproc: mediatek: Add APU rproc
 compatible
Date: Sat, 11 Dec 2021 01:25:51 +0800
Message-ID: <20211210172605.30618-4-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new binding document for the APU remote processor.
The initial version is used for MT8192 SOC.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../bindings/remoteproc/mediatek,apu-rv.yaml  | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml
new file mode 100644
index 000000000000..c390b85040eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 (C) MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mediatek,apu-rv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU remote processor controller bindings
+
+description: |
+  APU integrated subsystem having MD32RV33 (MD32) that runs tinysys.
+  The tinysys runs on a microprocessor in APU.
+  Its firmware is loaded and booted from Kernel side.
+  Kernel and tinysys uses IPI to send and receive messages.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+  - Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apusys-rv
+      - const: simple-mfd
+
+  reg:
+    minItems: 1
+
+  reg-names:
+    minItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  interrupts:
+    description: List of interrupts.
+
+  interrupt-names:
+    description: Name list of interrupts.
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - interrupts
+  - mboxes
+
+additionalProperties:
+  type: object
+  description:
+    Represent subnodes that will register as rpmsg devices.
+  properties:
+    compatible:
+      enum:
+        - mediatek,apu-ctrl-rpmsg
+        - mediatek,apupwr-tx-rpmsg
+        - mediatek,apupwr-rx-rpmsg
+        - mediatek,apu-mdw-rpmsg
+    mediatek,rpmsg-name:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        Contains the name for the rpmsg device. Used to match
+        the subnode to rpmsg device announced by APU.
+  required:
+    - compatible
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+
+    apusys_rv@19001000 {
+      compatible = "mediatek,mt8192-apusys-rv", "simple-mfd";
+      reg = <0x19001000 0x1000>;
+      reg-names = "md32_sysctrl";
+      power-domains = <&apuspm 0>;
+      iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+      interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>;
+      interrupt-names = "apu_wdt";
+      mboxes = <&apu_mailbox 0>;
+      apu_ctrl {
+        compatible = "mediatek,apu-ctrl-rpmsg";
+        mediatek,rpmsg-name = "apu-ctrl-rpmsg";
+      };
+      apu_pwr_tx {
+        compatible = "mediatek,apupwr-tx-rpmsg";
+        mediatek,rpmsg-name = "apupwr-tx-rpmsg";
+      };
+      apu_pwr_rx {
+        compatible = "mediatek,apupwr-rx-rpmsg";
+        mediatek,rpmsg-name = "apupwr-rx-rpmsg";
+      };
+      apu_mdw_rpmsg {
+        compatible = "mediatek,apu-mdw-rpmsg";
+        mediatek,rpmsg-name = "apu-mdw-rpmsg";
+      };
+    };
-- 
2.18.0

