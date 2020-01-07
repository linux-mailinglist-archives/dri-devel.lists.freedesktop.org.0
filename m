Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A564133CD3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175816E85C;
	Wed,  8 Jan 2020 08:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5397F6E02F;
 Tue,  7 Jan 2020 11:27:58 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Jan 2020 16:57:56 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jan 2020 16:57:41 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 89EBE2574; Tue,  7 Jan 2020 16:57:40 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: add sc7180 panel variant
Date: Tue,  7 Jan 2020 16:57:28 +0530
Message-Id: <1578396449-17062-2-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578396449-17062-1-git-send-email-harigovi@codeaurora.org>
References: <1578396449-17062-1-git-send-email-harigovi@codeaurora.org>
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: sean@poorly.run, seanpaul@chromium.org,
 Harigovindan P <harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible string to support sc7180 panel version.

Changes in v1:
	-Added a compatible string to support sc7180 panel version.
Changes in v2:
	-Removed unwanted properties from description.
	-Creating source files without execute permissions(Rob Herring).

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt

diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
new file mode 100644
index 0000000..d7bbd5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
@@ -0,0 +1,48 @@
+Visionox model RM69299 DSI display driver
+
+The Visionox RM69299 is a generic display driver, currently only configured
+for use in the 1080p display on the Qualcomm SC7180 MTP board.
+
+Required properties:
+- compatible: should be "visionox,rm69299-1080p-display"
+- vdda-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply
+- vdd3p3-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply
+- reset-gpios: phandle of gpio for reset line
+  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
+  (active low)
+- ports: This device has one video port driven by one DSI. Their connections
+  are modeled using the OF graph bindings specified in
+  Documentation/devicetree/bindings/graph.txt.
+  - port@0: DSI input port driven by master DSI
+
+Example:
+
+	dsi@ae94000 {
+		panel@0 {
+			compatible = "visionox,rm69299-1080p-display";
+			reg = <0>;
+
+			vdda-supply = <&src_pp1800_l8c>;
+			vdd3p3-supply = <&src_pp2800_l18a>;
+
+			pinctrl-names = "default", "suspend";
+			pinctrl-0 = <&disp_pins_default>;
+			pinctrl-1 = <&disp_pins_default>;
+
+			reset-gpios = <&pm6150l_gpios 3 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					panel0_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+	};
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
