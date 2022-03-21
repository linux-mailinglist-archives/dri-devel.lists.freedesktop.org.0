Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AF4E2DEC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171C810E37B;
	Mon, 21 Mar 2022 16:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80DA510E37B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:29:46 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55736.678671471
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id C177B100237;
 Tue, 22 Mar 2022 00:29:42 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 d8698db3140e48fd93e127b6ffaf042d for mripard@kernel.org; 
 Tue, 22 Mar 2022 00:29:45 CST
X-Transaction-ID: d8698db3140e48fd93e127b6ffaf042d
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
Subject: [PATCH v11 1/7] MIPS: Loongson64: dts: update the display controller
 device node
Date: Tue, 22 Mar 2022 00:29:10 +0800
Message-Id: <20220321162916.1116541-2-15330273260@189.cn>
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

The display controller is a pci device, it is used in ls2k1000 SoC and
LS7A1000 bridge. Its PCI vendor id is 0x0014, Tts PCI device id is 0x7a06.
In order to let the driver to know which chip the DC is contained in,
the compatible of the display controller is named according to the chip's
name.

For LS7A1000, there are 4 dedicated GPIOs whose control register is
located at the DC register space. They are used to emulate i2c for reading
edid from the monitor. One for DVO0, another for DVO1.

LS2K1000 and LS2K0500 SoC don't have such GPIOs, they grab i2c adapter
from other module, either general purpose GPIO emulated i2c or hardware
i2c adapter.

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 24 +++++++++++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 36 ++++++++++++++++---
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 8143a61111e3..b168cccc3399 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -198,6 +198,30 @@ sata@8,0 {
 				interrupt-parent = <&liointc0>;
 			};
 
+			lsdc: display-controller@6,0 {
+				compatible = "loongson,ls2k1000-dc";
+
+				reg = <0x3000 0x0 0x0 0x0 0x0>;
+				interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dc_out_rgb0: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						dc_out_rgb1: endpoint {
+						};
+					};
+				};
+			};
+
 			pci_bridge@9,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2f45fce2cdc4..fcea73006f7a 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -160,15 +160,41 @@ gpu@6,0 {
 				interrupt-parent = <&pic>;
 			};
 
-			dc@6,1 {
-				compatible = "pci0014,7a06.0",
-						   "pci0014,7a06",
-						   "pciclass030000",
-						   "pciclass0300";
+			lsdc: display-controller@6,1 {
+				compatible = "loongson,ls7a1000-dc";
 
 				reg = <0x3100 0x0 0x0 0x0 0x0>;
 				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				i2c6: i2c-gpio@0 {
+					compatible = "lsdc,i2c-gpio-0";
+					reg = <6>;
+				};
+
+				i2c7: i2c-gpio@1 {
+					compatible = "lsdc,i2c-gpio-1";
+					reg = <7>;
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dc_out_rgb0: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						dc_out_rgb1: endpoint {
+						};
+					};
+				};
 			};
 
 			hda@7,0 {
-- 
2.25.1

