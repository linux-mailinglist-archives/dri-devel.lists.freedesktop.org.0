Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA534A6C30
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 08:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DCA10F5E0;
	Wed,  2 Feb 2022 07:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59BE310F5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 07:17:09 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:49686.384428371
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id ABD8E100289;
 Wed,  2 Feb 2022 15:17:07 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 5cd2456012e14bcd84a5002cc4ecd25c for dan.carpenter@oracle.com; 
 Wed, 02 Feb 2022 15:17:08 CST
X-Transaction-ID: 5cd2456012e14bcd84a5002cc4ecd25c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v5 3/3] dt-bindings: mips: loongson: introduce board specific
 dts
Date: Wed,  2 Feb 2022 15:16:58 +0800
Message-Id: <20220202071658.4769-4-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202071658.4769-1-15330273260@189.cn>
References: <20220202071658.4769-1-15330273260@189.cn>
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: suijingfeng <suijingfeng@loongson.cn>

For board specific devices which is outside of the cpu and bridge chip.
this patch introduce two dts, one for lemote a1901(aka LX-6901) motherboard.
documnet can be found from [1].
Another one is loongson 3A4000 evb board, this board have a vga and dvi
interface.

We need introduce board specific dts because of we need the device tree
to tell how does the connectors and encoders are connected to the DVO port
of the display controller.

[1] https://wiki.godson.ac.cn/device:lemote_a1901

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 arch/mips/boot/dts/loongson/lemote_a1901.dts  | 64 +++++++++++++++++
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 68 +++++++++++++++++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  2 +-
 3 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts

diff --git a/arch/mips/boot/dts/loongson/lemote_a1901.dts b/arch/mips/boot/dts/loongson/lemote_a1901.dts
new file mode 100644
index 000000000000..81828945ba52
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/lemote_a1901.dts
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson64g-package.dtsi"
+#include "ls7a-pch.dtsi"
+
+/ {
+	compatible = "lemode,a1901", "loongson,loongson64g-4core-ls7a";
+	model = "lemode,a1901";
+};
+
+&package0 {
+	htvec: interrupt-controller@efdfb000080 {
+		compatible = "loongson,htvec-1.0";
+		reg = <0xefd 0xfb000080 0x40>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&liointc>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+			     <25 IRQ_TYPE_LEVEL_HIGH>,
+			     <26 IRQ_TYPE_LEVEL_HIGH>,
+			     <27 IRQ_TYPE_LEVEL_HIGH>,
+			     <28 IRQ_TYPE_LEVEL_HIGH>,
+			     <29 IRQ_TYPE_LEVEL_HIGH>,
+			     <30 IRQ_TYPE_LEVEL_HIGH>,
+			     <31 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&pch {
+	msi: msi-controller@2ff00000 {
+		compatible = "loongson,pch-msi-1.0";
+		reg = <0 0x2ff00000 0 0x8>;
+		interrupt-controller;
+		msi-controller;
+		loongson,msi-base-vec = <64>;
+		loongson,msi-num-vecs = <192>;
+		interrupt-parent = <&htvec>;
+	};
+};
+
+&lsdc {
+	/* use_vram_helper; */
+	output-ports = <&dvo0 &dvo1>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dvo0: dvo@0 {
+		/* 0 for DVO0 */
+		reg = <0>;
+		status = "disabled";
+	};
+
+	dvo1: dvo@1 {
+		/* 1 for DVO1 */
+		reg = <1>;
+		connector = "vga-connector";
+		encoder = "adi,adv7125";
+		status = "okay";
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
new file mode 100644
index 000000000000..ff07f529ea43
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson64g-package.dtsi"
+#include "ls7a-pch.dtsi"
+
+/ {
+	compatible = "loongson,loongson64g-4core-ls7a";
+	model = "loongson,ls3a4000_7a1000_evb";
+	version = "v1.4";
+};
+
+&package0 {
+	htvec: interrupt-controller@efdfb000080 {
+		compatible = "loongson,htvec-1.0";
+		reg = <0xefd 0xfb000080 0x40>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&liointc>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+			     <25 IRQ_TYPE_LEVEL_HIGH>,
+			     <26 IRQ_TYPE_LEVEL_HIGH>,
+			     <27 IRQ_TYPE_LEVEL_HIGH>,
+			     <28 IRQ_TYPE_LEVEL_HIGH>,
+			     <29 IRQ_TYPE_LEVEL_HIGH>,
+			     <30 IRQ_TYPE_LEVEL_HIGH>,
+			     <31 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&pch {
+	msi: msi-controller@2ff00000 {
+		compatible = "loongson,pch-msi-1.0";
+		reg = <0 0x2ff00000 0 0x8>;
+		interrupt-controller;
+		msi-controller;
+		loongson,msi-base-vec = <64>;
+		loongson,msi-num-vecs = <192>;
+		interrupt-parent = <&htvec>;
+	};
+};
+
+&lsdc {
+	/* use_vram_helper; */
+	output-ports = <&dvo0 &dvo1>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dvo0: dvo@0 {
+		/* 0 for DVO0 */
+		reg = <0>;
+		connector = "vga-connector";
+		encoder = "adi,adv7125";
+		status = "okay";
+	};
+
+	dvo1: dvo@1 {
+		/* 1 for DVO1 */
+		reg = <1>;
+		connector = "dvi-connector";
+		encoder = "ti,tfp410";
+		digital;
+		status = "okay";
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2f45fce2cdc4..70a0b7ac0839 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -160,7 +160,7 @@
 				interrupt-parent = <&pic>;
 			};
 
-			dc@6,1 {
+			lsdc: dc@6,1 {
 				compatible = "pci0014,7a06.0",
 						   "pci0014,7a06",
 						   "pciclass030000",
-- 
2.20.1

