Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40624E2DEF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8E210E3B8;
	Mon, 21 Mar 2022 16:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id C22B710E395
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:29:54 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55736.678671471
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 1350B1002A1;
 Tue, 22 Mar 2022 00:29:48 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 986ff97ff9c94cf0b342003f9fcd6a50 for mripard@kernel.org; 
 Tue, 22 Mar 2022 00:29:54 CST
X-Transaction-ID: 986ff97ff9c94cf0b342003f9fcd6a50
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v11 3/7] MIPS: Loongson64: dts: introduce lemote A1901
 motherboard
Date: Tue, 22 Mar 2022 00:29:12 +0800
Message-Id: <20220321162916.1116541-4-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321162916.1116541-1-15330273260@189.cn>
References: <20220321162916.1116541-1-15330273260@189.cn>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: suijingfeng <suijingfeng@loongson.cn>

This board is made by LEMOTE corporation, it has two name, one
is LX-6901, another is A1901.

This board has only one VGA output which is connected to the DVO1 of
the display controller.

    +------+            +-----------------------------------+
    | DDR4 |            |  +-------------------+            |
    +------+            |  | PCIe Root complex |   LS7A1000 |
       || MC0           |  +--++---------++----+            |
  +----------+  HT 3.0  |     ||         ||                 |
  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
  +----------+          | +--------+  +-+--+-+    +---------+   +------+
       || MC1           +---------------|--|----------------+
    +------+                            |  |
    | DDR4 |       DVO0 is not get used |  |  DVO1   +-------+
    +------+       <--------------------+  +-------->|ADV7125|---> VGA
                                                     +-------+
The model property added can provided board specific information,
mips kernel use it as machine name.

$ cat /proc/cpuinfo

system type             : Generic Loongson64 System
machine                 : LX-6901  <-------------------- notice here
processor               : 0
cpu model               : ICT Loongson-3 V0.1  FPU V0.1
BogoMIPS                : 3594.02
tlb_entries             : 2112
isa                     : mips64r2
ASEs implemented        : vz msa loongson-ext2
...

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 arch/mips/boot/dts/loongson/lemote_a1901.dts | 92 ++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts

diff --git a/arch/mips/boot/dts/loongson/lemote_a1901.dts b/arch/mips/boot/dts/loongson/lemote_a1901.dts
new file mode 100644
index 000000000000..f0443bc43af9
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/lemote_a1901.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson64g-package.dtsi"
+#include "ls7a-pch.dtsi"
+
+/ {
+	model = "LX-6901";
+
+	vga-encoder {
+		compatible = "adi,adv7123", "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7123_in: endpoint {
+					remote-endpoint = <&dc_out_rgb1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7123_out: endpoint {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
+
+	vga-connector {
+		compatible = "vga-connector";
+		label = "vga";
+
+		ddc-i2c-bus = <&i2c7>;
+
+		port {
+			vga_connector_in: endpoint {
+				remote-endpoint = <&adv7123_out>;
+			};
+		};
+	};
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
+	ports {
+		port@0 {
+			status = "disabled";
+		};
+
+		port@1 {
+			status = "ok";
+			endpoint {
+				remote-endpoint = <&adv7123_in>;
+			};
+		};
+	};
+};
-- 
2.25.1

