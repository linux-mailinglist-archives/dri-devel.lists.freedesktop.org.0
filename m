Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D91535EE9B2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39B210E7A1;
	Wed, 28 Sep 2022 22:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C28110E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C4F347C;
 Thu, 29 Sep 2022 00:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405302;
 bh=sviFrW3tlknNXHezOIax00Y0VuIM8pO2lzb8gHnG3Y4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sfeZ+ELZccf7eH40oAsggT4JN1gCwBHAeMgNScz9FmWCRbkKp5WEQMCMmfFHR4OY6
 GoA7iTLDWFDKZ+1y+qMclqCvLcaqr7oGhYInRdAc/H5w83Wxt8EsV88OTHhmFjqIWw
 XFz7frRg5zwzZuzuxO/CGQ+xrO2CwbpodVLbGqq4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 37/37] arm64: dts: zynqmp: zcu106a: Describe DisplayPort
 connector
Date: Thu, 29 Sep 2022 01:47:19 +0300
Message-Id: <20220928224719.3291-38-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a device tree node to describe the DisplayPort connector, and
connect it to the DPSUB output.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index e2dd72fe33ce..24a252317150 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -150,6 +150,18 @@ refhdmi: refhdmi {
 		#clock-cells = <0>;
 		clock-frequency = <114285000>;
 	};
+
+	dpcon {
+		compatible = "dp-connector";
+		label = "P11";
+		type = "full-size";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
 };
 
 &can1 {
@@ -1015,4 +1027,12 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0", "dp-phy1";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
 	       <&psgtr 0 PHY_TYPE_DP 1 3>;
+
+	ports {
+		port@5 {
+			dpsub_dp_out: endpoint {
+				remote-endpoint = <&dpcon_in>;
+			};
+		};
+	};
 };
-- 
Regards,

Laurent Pinchart

