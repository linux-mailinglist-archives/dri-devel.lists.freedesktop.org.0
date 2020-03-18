Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC061189FCF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD876E916;
	Wed, 18 Mar 2020 15:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD366E917
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:37:43 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F35B5E4A;
 Wed, 18 Mar 2020 16:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584545861;
 bh=e4cCUZYTx3n/u0MtoaLGz1z9jRBp1EIEFr40YKa6AgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bz5gIdL06Qm/mYpVqbaiDC4TWbfCXGXwS/v3yVSf7I+TyVccmiMGqKgqSfHE/0XMW
 UxVHdWzy4KEu578DzRgmEVj+KmAxAoWteD4eFC0CAjYsAmU60O+XNgd7l0YTwvsFmu
 AkohA2tI7jLHersQIHyRxBrXRlqRyReC5qcPaVXA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v11 5/5] arm64: dts: zynqmp: zcu106-revA: Wire up the
 DisplayPort subsystem
Date: Wed, 18 Mar 2020 17:37:28 +0200
Message-Id: <20200318153728.25843-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the dpsub device and wire it up to the PS-GTR PHY lanes routed to
the DisplayPort connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 6e9efe233838..2fc6342eb05e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -13,6 +13,7 @@
 #include "zynqmp-clk-ccf.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	model = "ZynqMP ZCU106 RevA";
@@ -39,6 +40,17 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>, <0x8 0x00000000 0x0 0x80000000>;
 	};
 
+	/*
+	* This clock is actually produced by the SI5341 (U69), but declaring it
+	* will result in the PS_REF_CLK being disabled at end of boot as it is
+	* unused.
+	*/
+	gtr_ref_clk_dp: clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -142,6 +154,17 @@ &dcc {
 	status = "okay";
 };
 
+&dpdma {
+	status = "okay";
+};
+
+&dpsub {
+	status = "okay";
+	phy-names = "dp-phy0", "dp-phy1";
+	phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
+	       <&psgtr 0 PHY_TYPE_DP 1 3>;
+};
+
 /* fpd_dma clk 667MHz, lpd_dma 500MHz */
 &fpd_dma_chan1 {
 	status = "okay";
@@ -591,6 +614,12 @@ i2c@7 {
 	};
 };
 
+&psgtr {
+	status = "okay";
+	clocks = <&gtr_ref_clk_dp>;
+	clock-names = "ref3";
+};
+
 &rtc {
 	status = "okay";
 };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
