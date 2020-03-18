Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE15A189FCC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50B6E917;
	Wed, 18 Mar 2020 15:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515846E915
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:37:43 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79CFDE42;
 Wed, 18 Mar 2020 16:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584545860;
 bh=gtRLdr5L0h6o/RV4zouVxC0/v1TozsI9ApSMM688vtc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DQ7EfS+BvVgNqaXojHV+v9uftzcTr75Dxu3W1TBecDs2vqNmWfsZCIFUmb4BB+LUY
 ifuOH7NFvcUZRUXTvGlst3AoCg1HCcAkfmi1tD7gtd7gac1qZ3fKT1D59LAjFAZr5j
 o3InEjK8v6s9cdmxA/Sje9TIwFsgWhfkBxXqoRtg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v11 4/5] arm64: dts: zynqmp: Add DisplayPort subsystem
Date: Wed, 18 Mar 2020 17:37:27 +0200
Message-Id: <20200318153728.25843-5-laurent.pinchart@ideasonboard.com>
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

Add a DT node for the DisplayPort subsystem, a hard IP present in the
Zynq Ultrascale+ MPSoC.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v10:

- Replace fixed frequency clocks with real clocks
- Add resets property to zynqmp-dpsub

Changes since v9:

- Update to the latest DPDMA DT bindings
---
 .../arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi |  6 +++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        | 24 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
index 32c4914738d9..48db1b353a1a 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
@@ -61,6 +61,12 @@ &dpdma {
 	clocks = <&zynqmp_clk DPDMA_REF>;
 };
 
+&dpsub {
+	clocks = <&zynqmp_clk TOPSW_LSBUS>,
+		 <&zynqmp_clk DP_AUDIO_REF>,
+		 <&zynqmp_clk DP_VIDEO_REF>;
+};
+
 &fpd_dma_chan1 {
 	clocks = <&zynqmp_clk GDMA_REF>, <&zynqmp_clk LPD_LSBUS>;
 };
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index b195fd0dbeed..003fa5c4d572 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -12,6 +12,7 @@
  * the License, or (at your option) any later version.
  */
 
+#include <dt-bindings/dma/xlnx-zynqmp-dpdma.h>
 #include <dt-bindings/power/xlnx-zynqmp-power.h>
 #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
 
@@ -450,6 +451,29 @@ mc: memory-controller@fd070000 {
 			interrupts = <0 112 4>;
 		};
 
+		dpsub: display@fd4a0000 {
+			compatible = "xlnx,zynqmp-dpsub-1.7";
+			status = "disabled";
+			reg = <0x0 0xfd4a0000 0x0 0x1000>,
+			      <0x0 0xfd4aa000 0x0 0x1000>,
+			      <0x0 0xfd4ab000 0x0 0x1000>,
+			      <0x0 0xfd4ac000 0x0 0x1000>;
+			reg-names = "dp", "blend", "av_buf", "aud";
+			interrupts = <0 119 4>;
+			interrupt-parent = <&gic>;
+
+			clock-names = "dp_apb_clk", "dp_aud_clk",
+				      "dp_vtc_pixel_clk_in";
+
+			resets = <&reset ZYNQMP_RESET_DP>;
+
+			dma-names = "vid0", "vid1", "vid2", "gfx0";
+			dmas = <&dpdma ZYNQMP_DPDMA_VIDEO0>,
+			       <&dpdma ZYNQMP_DPDMA_VIDEO1>,
+			       <&dpdma ZYNQMP_DPDMA_VIDEO2>,
+			       <&dpdma ZYNQMP_DPDMA_GRAPHICS>;
+		};
+
 		gem0: ethernet@ff0b0000 {
 			compatible = "cdns,zynqmp-gem", "cdns,gem";
 			status = "disabled";
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
