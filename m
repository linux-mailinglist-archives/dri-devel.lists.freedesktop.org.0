Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE79A03B7F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C490710E3CC;
	Tue,  7 Jan 2025 09:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="eH1JO2kH";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Wi47E+Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8261B10E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736243411; x=1767779411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=;
 b=eH1JO2kHWWP93bTcZjA4VvSnW0u+bCcSvt+CbDphYI51EzazflGtt5xJ
 2Iq8MXaBtf2W2EWsuRo7Jha85yFWaEEzrAVRFBMf3rtx1N4qSxDgSxKhA
 6AVkPavNMzyuYQVwI7a5DpHYlKsd9DEAokC9JG+uX1apu6oNsNwG1e6Ym
 3nNJdir7sZJTNnyHuaMLj2qmZlcOL5GwG7kmZhI6OQW7OhWVkwq51hX8D
 RyRB22CKKQ1hDlram9wN45d8EGf3oDefHrnYErYKVyIUZva981Kr2EFEH
 puqvPsoIpWHDAr+TtGPyNRiIHHJGAmCKVnhcm0tu0EMF6hIo86Q8lnNBB A==;
X-CSE-ConnectionGUID: W/xrAnC8RkSNziKHLuX1cA==
X-CSE-MsgGUID: vaqF99PvRTWyofVWk/MsKQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; d="scan'208";a="40889019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:10 +0100
X-CheckPoint: {677CF8D2-34-301A2255-F8907925}
X-MAIL-CPID: 4EBEBB08F58DDC3AE9E882BAB25DBD24_3
X-Control-Analysis: str=0001.0A682F26.677CF8D3.0031, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47717163CCE; Tue,  7 Jan 2025 10:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736243406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=;
 b=Wi47E+Rc9PTZCxjwj/rCLJqFXyDN5NtYNeDYY5biKfe0oJzJCkQeIQa7PD4JKriBAh/oP9
 z35fR7ZDJkeVj7MhODE4YN1FoPGspbM48OA8EsHQ0tcLtW7gF3g0h5kyimAgF8Men8lL8+
 grBB67wugEMwPY/lJFTW/2pLVtxOEESmkeLH41piBuGAYFClZureKEWxAmtwrS+0MlmikD
 lVF/OJvQd7tgehTzAW1UBZYTMQ2tgZIIt/De6zJgyYAZP6hZW0/bM68PkikLuCoq4ypNWh
 vgQzeJ/qH8pxDux3+kYPEczkhyIfgWGRO0K6o2ho2EoQN8M6GRYV1nSPfr51Tg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
Date: Tue,  7 Jan 2025 10:49:41 +0100
Message-Id: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
video-mux is not part of it. So move it below root node.
Fixes the dtbs_check warning:
arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' does not match any of the regexes: 'pinctrl-[0-9]+'
  from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 22dd72499ef27..2629968001a74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -176,6 +176,34 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	video_mux: csi-mux {
+		compatible = "video-mux";
+		mux-controls = <&mux 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csi_mux_from_mipi_vc0: endpoint {
+				remote-endpoint = <&mipi_vc0_to_csi_mux>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csi_mux_to_csi: endpoint {
+				remote-endpoint = <&csi_from_csi_mux>;
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -529,34 +557,6 @@ mux: mux-controller {
 					#mux-control-cells = <1>;
 					mux-reg-masks = <0x14 0x00000010>;
 				};
-
-				video_mux: csi-mux {
-					compatible = "video-mux";
-					mux-controls = <&mux 0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					status = "disabled";
-
-					port@0 {
-						reg = <0>;
-					};
-
-					port@1 {
-						reg = <1>;
-
-						csi_mux_from_mipi_vc0: endpoint {
-							remote-endpoint = <&mipi_vc0_to_csi_mux>;
-						};
-					};
-
-					port@2 {
-						reg = <2>;
-
-						csi_mux_to_csi: endpoint {
-							remote-endpoint = <&csi_from_csi_mux>;
-						};
-					};
-				};
 			};
 
 			ocotp: efuse@30350000 {
-- 
2.34.1

