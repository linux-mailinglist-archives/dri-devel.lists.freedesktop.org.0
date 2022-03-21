Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00824E2DF0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F4810E3A1;
	Mon, 21 Mar 2022 16:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 111EE10E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:29:59 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55736.678671471
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id B0B891002A6;
 Tue, 22 Mar 2022 00:29:54 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 d23863fc0f3a4a70b7ff6078ead2ba9e for mripard@kernel.org; 
 Tue, 22 Mar 2022 00:29:57 CST
X-Transaction-ID: d23863fc0f3a4a70b7ff6078ead2ba9e
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
Subject: [PATCH v11 4/7] MIPS: Loongson64: dts: introduce ls2k1000 pai
 evaluation board
Date: Tue, 22 Mar 2022 00:29:13 +0800
Message-Id: <20220321162916.1116541-5-15330273260@189.cn>
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

   ___________________                           ____________________
  |            -------|                         |                    |
  |  CRTC0 --> | DVO0 ------------------------> | 1024x600 DPI Panel |
  |  _   _     -------|  | Which panel to use   |____________________|
  | | | | |           |  | with this board is a  ___________________
  | |_| |_|           |  | choice of the user   |                   |
  |                   |  +--------------------> | 800x480 DPI Panel |
  |   DC In LS2K1000  |                         |___________________|
  |  _   _            |     +------+
  | | | | |           <---->| i2c1 |-----------+
  | |_| |_|           |     +------+           |
  |                   |        |               |               _________
  |            -------|    +---------+         |              |         |
  |  CRTC1 --> | DVO1 ---> | sii9022 | --> HDMI connector --> | Monitor |
  |            -------|    +---------+                        |_________|
  |___________________|

The sii9022 HDMI transmitter working in transparent mode, in this case
the edid is read from the monitor directly, not through sil9022's ddc
channel. The PMON[2] firmware of this board is responsible for configure
the sii9022 encoder at boot time. Due to i2c driver for lsk2000 SoC is
not upstream yet, we simply replace the sii9022 with a 1024x768 panel.

The i2c0 is not get used by lsdc driver for this board, so there no
need to worry about DVO0.

[1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
[2] https://github.com/loongson-community/pmon

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 arch/mips/boot/dts/loongson/ls2k1000_pai.dts | 102 +++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 arch/mips/boot/dts/loongson/ls2k1000_pai.dts

diff --git a/arch/mips/boot/dts/loongson/ls2k1000_pai.dts b/arch/mips/boot/dts/loongson/ls2k1000_pai.dts
new file mode 100644
index 000000000000..0b0172d90677
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls2k1000_pai.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson64-2k1000.dtsi"
+
+/ {
+	model = "LS2K1000_PAI_UDB_V1.5";
+
+	panel: display@0 {
+		compatible = "hontron,070JII2135-A2", "panel-dpi";
+		label = "LCD070CG1024600+DC21";
+
+		rotation = <0>;
+		width-mm = <86>;
+		height-mm = <154>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dc_out_rgb0>;
+			};
+		};
+
+		panel-timing {
+			clock-frequency = <51200000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hsync-len = <4>;
+			hfront-porch = <160>;
+			hback-porch = <156>;
+			vfront-porch = <11>;
+			vback-porch = <23>;
+			vsync-len = <1>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+		};
+	};
+
+	monitor: display@1 {
+		compatible = "panel-dpi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			monitor_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dc_out_rgb1>;
+			};
+		};
+
+		panel-timing {
+			clock-frequency = <65000000>;
+			hactive = <1024>;
+			vactive = <768>;
+			hfront-porch = <24>;
+			hsync-len = <136>;
+			hback-porch = <160>;
+			vfront-porch = <3>;
+			vback-porch = <6>;
+			vsync-len = <29>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+		};
+	};
+};
+
+&lsdc {
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+
+		port@1 {
+			endpoint {
+				remote-endpoint = <&monitor_in>;
+			};
+		};
+	};
+};
-- 
2.25.1

