Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D009D826C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7CC10E5EE;
	Mon, 25 Nov 2024 09:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cmbUYNBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B292010E5EE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjsQ7gJt2S1iWpgqK5o5G8W10ppXMtLOYQDo0HNnL/2/cPN7LC6ci+o9gW72NwOM1qRBEyjYPmYVu0wQm4UvT/tZdZp7gz5r5oyIrWR9uVsFchi4+KSui+/y0e1/siBG/ZB4PQ+teEEKrRHoMpc1nL+Fa7S0Wmw8ZftwGGsXHHInKzjHW1En5L/HPdVR+QjKuMSqUbfDuiJboDFP5iFZ21tFnfP/5eLZ1114R3PP3vyScMRMMMWK7GhLTh3pHhJbzfHu1ybGhQhZrtoKMU7Uxv4C690+LTfgi/uEl8G1gE8/RxjR92CfYjq6y8PjrPudmLCj0G4DIdn14EMQb2Gi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybjSntVOs11JS+86K+tTOFEA/SyUurUDzekiYH41EAw=;
 b=f8WOGI4YsNOPt/bix9ff++dZvNr2M08LTv9JsDp/QkWghNObAicfqfET74ndqtIiyTYENYPN2ICWMqs6VeAIC0Sr2PF782zZPE/78vSvgIN5T7U/a6fFfz9MoSBbhyGU8MfH7qoB0dPZkGEO5PsHdpCbxPU0Bq7+Y6DqNkh8wKX9uob1cg7BUUPRZ/TpPZJw50KJGrpH8/t7KJhaSYi6ycbpgZmzWMG6YJ/9segYZbKwGBWYQVZF77VG3MmxhhP3C79Z2Hgy5NauqLxpBtIi/iJRtmbjiqEDtxyR0Dbw0kvPx6LrDJP2K2CpV31bo6aD4xApZpJcJRcqRwoCXv0XJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybjSntVOs11JS+86K+tTOFEA/SyUurUDzekiYH41EAw=;
 b=cmbUYNBBNLLea7m4SI5xSuasWCwclzgyAotcmXdDASJLz03bIVsNzONdp92BFK6rErlchCic+rCtFTWpdmorLrqQCwCXmGUnEUSXqlpDr4Tbq8VKFWIE4WPFQnC9IRrlWfzJJG0O8ZUbxVcfZLJbzy+zQo0QmlIu5/edK97GBKBF81534rhyZ8keNxv1Uw2ZKha7G9iWNiGQlkla1k0TfcwSvD7hwOwqfuRRlMrYxCQGz+di5NcDZy6kepLASEiXXt7/1Fj/1gw209pWH3tGYK8oE3Y4D6EtuFDlxcGxV97D0Toy76wFvZEhAabf5b2I+YhPZkM23fYwo7JYqAICsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:35:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:35:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Date: Mon, 25 Nov 2024 17:33:13 +0800
Message-Id: <20241125093316.2357162-17-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: c29aa4ca-940a-41f6-2fae-08dd0d347140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IIjCPiEwoBPgGICF69YLJrrTWmQte523VUcQjhfGFwwsogOErTLXWlXwRkm7?=
 =?us-ascii?Q?FE0J141T+koCC5hdElDjZKlc1AtGa+INKUglwzDHu4+mrGgKMHApw8DwU1Vm?=
 =?us-ascii?Q?+myiULcbRWPBC5fk7fn37zBfJRYZ6qPsMZJhy1k9xiLlr6xjvtHXAB0qaJnu?=
 =?us-ascii?Q?UJKiOeIr5VQq95Q+kyzmC/wIsbAn41/j/k3lhR0qxRJ3j6e/+2lHx44H3y75?=
 =?us-ascii?Q?YXw81ZowpxLuV7R+h3dwNiFbr9d5inlZPlwWSAS1nEn1+6IZEdtknNqjXqoP?=
 =?us-ascii?Q?W/Kb3DKVHR6EXHAnkjLzW3Sa4Bf0Zxa0gNFbK3NO9g1XLcrvFPoHxqcRofMd?=
 =?us-ascii?Q?G4lXHsOaYhHQFK2a+VGVBU6mNJipdEiisjME6Q/H92M7Jm8irykVrCILSYI+?=
 =?us-ascii?Q?pzNRzxnmexuu2M4wD5W+K/GsLMrZKMWzICgI7oXeRId3762JsVL6ar2x6Hge?=
 =?us-ascii?Q?9wBY30OUdy+EvqgS8YbvzrROiMp0M6b5s8O/5ZVvI8ILnNY+KKGN2vbI6zPv?=
 =?us-ascii?Q?k6zvBhVUe63nescMMWMcmByn5dTH1VL7uJOp2Tc/xWPMsopF9Zfdbuq/+hGH?=
 =?us-ascii?Q?PdEt+7J1Pev05sKdg0dKDjRkipn8KDNLr6t0w2bUs0k7ZG73Mz47HD7yW0cS?=
 =?us-ascii?Q?Zq0BQPGTszD8+Zm7LfeUdpsKrO/9vjC++qvPt3+95H6HCVyQBIobUQFu2oY9?=
 =?us-ascii?Q?LKYe2y6uAR93mNBcV45Fbu7145q49om2JcPClnpJvGoI3/E4UAfKzfw+R8B3?=
 =?us-ascii?Q?RHslskrZx7GeJZYoF4VrQxuFtcJwG/gKu89Mf/6qc87brVwD1W4FrOS5GNiv?=
 =?us-ascii?Q?LXYkjg4mYFYuFgcSbHrbK3aZBhfkjpb9Wv2m3WqKjBUukN5Qavh2rqNYOU0E?=
 =?us-ascii?Q?EJyM+HffctZnL9mFG+cJiLxWibXN9dU0gP+xBbAdaIlocuR4SEVnh3GcgxN0?=
 =?us-ascii?Q?3O6vLREYADORQkqrTNjQyjRKM92tGSbn9w1XaT/Z/kXhq4DJ59/CeXzyhRTj?=
 =?us-ascii?Q?BI2Megp0eNa+KM2oyYIBB0iJaFY26KawOV2LFhmQIlAxwDxN7zM/eQrWB34C?=
 =?us-ascii?Q?p8dhPnkCRjY8KKbH8q90Pc9egC2dq4HeWBj+e+7wczPRQrYxeDz6wBVyO9sm?=
 =?us-ascii?Q?PW/yFMBkpVuAH2zmg0Rjoppt3l6gcFxsA8bXGwGk+uKCNrf1BArCffFNDj6p?=
 =?us-ascii?Q?L7m14HTgJ/zRbJ+tkuCGpvktmSo14sROfw3oHwHl4lwCzsGvcyoEFIB+SJU2?=
 =?us-ascii?Q?NfMW07CRTgomd5YvkT+I8950G6ig1WtGVJ67zwgNVVAEqJ6Kz5f7XKCRyLpg?=
 =?us-ascii?Q?nfLeHz44ISzIjq4EPj5aJ4c2bnuw7oF9kpzyXynn9k2vmh33MfmQqRKLl2+y?=
 =?us-ascii?Q?izJLLeYp7krvtBZNyXF25ENocnnY5DmnLTRbkmFBn9VJYp7htA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQCWyOdWur0qGk3eYRiYnIj7a/IC1lK8Gv6aQGu39HVWfdEEbQosob6eOINh?=
 =?us-ascii?Q?jpvW/XsrQP+oBYiQ+35KZYBGfzjujDNwpQaT4ayO6IxeRBTeU7Rr4wKbtROJ?=
 =?us-ascii?Q?L4oBzh52IqcOnwSlmWgqRRkGiACjYxhSkJZzp1GZXfF2aeyTDOfeeUp/ORh9?=
 =?us-ascii?Q?m5/RHSiOkbmTQwZxlyO9joKuOwbA8XpqgHZPDwgT+IOg023m35Vd6pLtQXad?=
 =?us-ascii?Q?PihvKGqRrjQSXMYpA7NaI9jOoGssPHdNGd5O7BTHTHfqGPFNo3PLeOjTqXpT?=
 =?us-ascii?Q?itw/x09taEs7enAPHUbJDyaUu+aPWGSWIRo/CCGXrmD1Ga5uWQ9VGyIcIHLT?=
 =?us-ascii?Q?9+DaJyMmg11Duf2YDa4mt2nfg24FSq+viwmfM0nF9PoH6Sd9ofb0gow6Vn+m?=
 =?us-ascii?Q?7Dhou962RZUBS7IIReqJ3BFhsbqoXYYZYd3sk9HMSTto+qa9SQgg8qQB4mlZ?=
 =?us-ascii?Q?C0nVfazcSsluVksVwXnCJXTV4djcD/4wNgFicAhXV0Y2LLh9MhOaMars0lYK?=
 =?us-ascii?Q?tGI2c2VpsqRZ0hDaFUIuObEKUl+R6XHpNIaz7IGG6nw3XERsFTW01GwPIutN?=
 =?us-ascii?Q?j+yn00gE1LykTLQ0SjXFn8aFVhCNXG6n6rozQdTJxduvYQD/JgDk5xdfEpdx?=
 =?us-ascii?Q?IkOC4GnRXCYP9gvHrDFAjQABYLmpqmW5FPBygjuNLW9Lsz0eKaNdIaObfAAb?=
 =?us-ascii?Q?9v4OzBHixnF0zofmP82/qcHRbceQXActk6TvXG9iGh4mKLaA0pCXOb8fJZPo?=
 =?us-ascii?Q?4U89Q7LhiIdd+hqgWUf6yvV8r/G5+eOfpFKpM8xteoVTqgr5IdBo4V/KKtFF?=
 =?us-ascii?Q?srmiMwb75JsQAvD+IPKZSx8dYlLoP5ro+CDAXhUOZjSxNou/XzWwecJY2QyQ?=
 =?us-ascii?Q?gO2UEVFF4N9L8NJt4JcfXa+jhZ22XM/uxb1eI3PoLvaIOWiGFHDHnjHH2/DY?=
 =?us-ascii?Q?0m3hJV7KM56K2E+FXF3v5gUEQqRX6nNKLxdsOlSrHcUiPihQeSYzBJRhBOYI?=
 =?us-ascii?Q?0tcUTHjl40el4SMdxxLwiiixLWf00BXGM9H48hW2H/pTpzvW9kMQCZ9hsezT?=
 =?us-ascii?Q?VN0jpedKp5LFx4tCH2SuSOxXwkOBBx/qr+grR9uLn1l4F3XN7ufwf9le/GWc?=
 =?us-ascii?Q?pAayjXfTg65xmJYMJrscvqyskGlupBNGT30T6qVMCIy6gETRNes2xFr/xWbP?=
 =?us-ascii?Q?jlyVJ9291Y4ePYg8SC6Ulj/qt4qV9/v4LQXUlspcm6wjZ4xRSRqx/TzdUlYs?=
 =?us-ascii?Q?TQNtwdQpMuaDj4nuYfstkr5F94FNjuJNK8a3uDPEyLcA6kepQ1+lH6cTIDW/?=
 =?us-ascii?Q?Qvx94U7KCNI5pqtyHAe3ob7xWIgIVYJuMvw2RblA5FXGYPGpsP6jiJNYuO0h?=
 =?us-ascii?Q?MWLeSIzQecxRm8AX8oi4AfH1z5KKUgTvZq5vvmtaS0alIRw44jLJobLqJpL9?=
 =?us-ascii?Q?vuj2vvDo2Gv4bQXh9DkmG11thIiWTspw0ho4skNq37FFAHHpiyKNiu/Q654p?=
 =?us-ascii?Q?regeGgzPz5wSBHmISFF0Rtq/0u8I8ldCcOGQ0q8EtGw4fEfzBP7hC1ZHjG+L?=
 =?us-ascii?Q?0ENJp4jbNxZhkoVBRmh5gr5gVTATbROQZ3AFX5w6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29aa4ca-940a-41f6-2fae-08dd0d347140
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:35:04.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w59zqcJjfAbdcPWD7gKMTKEVx+WhuGkg+r3LoKrYu0LncGCd8BTSuYbMhZeL0RmdBRxL6R4Fgw/LQ72cwZlD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
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

Add display controller subsystem in i.MX8qxp SoC.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* No change.

v3:
* No change.

v2:
* New patch. (Krzysztof)

 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 ++++++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 236 ++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  25 +-
 3 files changed, 668 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
new file mode 100644
index 000000000000..0db345204b89
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+dc0_axi_ext_clk: clock-dc0-axi-ext {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <800000000>;
+	clock-output-names = "dc0_axi_ext_clk";
+};
+
+dc0_axi_int_clk: clock-dc0-axi-int {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "dc0_axi_int_clk";
+};
+
+dc0_cfg_clk: clock-dc0-cfg {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <100000000>;
+	clock-output-names = "dc0_cfg_clk";
+};
+
+dc0_subsys: bus@56000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x56000000 0x0 0x56000000 0x1000000>;
+
+	dc0_irqsteer: interrupt-controller@56000000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56000000 0x1000>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&dc0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <512>;
+	};
+
+	dc0_disp_lpcg: clock-controller@56010000 {
+		reg = <0x56010000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>,
+			 <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC1>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>;
+		clock-output-names = "dc0_disp0_lpcg_clk", "dc0_disp1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lis_lpcg: clock-controller@56010004 {
+		reg = <0x56010004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_disp_ctrl_link_mst0_lpcg: clock-controller@56010008 {
+		reg = <0x56010008 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_disp_ctrl_link_mst0_lpcg_msi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pixel_combiner_lpcg: clock-controller@56010010 {
+		reg = <0x56010010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_pixel_combiner_lpcg_apb_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lpcg: clock-controller@56010014 {
+		reg = <0x56010014 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>, <&dc0_axi_int_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>;
+		clock-output-names = "dc0_lpcg_cfg_clk",
+				     "dc0_lpcg_axi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pc: pixel-combiner@56020000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x56020000 0x10000>;
+		clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "apb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		status = "disabled";
+
+		channel@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch0_dc0_disp0: endpoint {
+					remote-endpoint = <&dc0_disp0_dc0_pixel_combiner_ch0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
+					remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
+				};
+			};
+		};
+
+		channel@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch1_dc0_disp1: endpoint {
+					remote-endpoint = <&dc0_disp1_dc0_pixel_combiner_ch1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
+					remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
+				};
+			};
+		};
+	};
+
+	dc0: display-controller@56180000 {
+		reg = <0x56180000 0x40000>;
+		clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		status = "disabled";
+
+		dc0_intc: interrupt-controller@56180040 {
+			reg = <0x56180040 0x60>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			interrupt-controller;
+			interrupt-parent = <&dc0_irqsteer>;
+			#interrupt-cells = <1>;
+			interrupts = <448>, <449>, <450>,  <64>,
+				      <65>,  <66>,  <67>,  <68>,
+				      <69>,  <70>, <193>, <194>,
+				     <195>, <196>, <197>,  <72>,
+				      <73>,  <74>,  <75>,  <76>,
+				      <77>,  <78>,  <79>,  <80>,
+				      <81>, <199>, <200>, <201>,
+				     <202>, <203>, <204>, <205>,
+				     <206>, <207>, <208>,   <5>,
+				       <0>,   <1>,   <2>,   <3>,
+				       <4>,  <82>,  <83>,  <84>,
+				      <85>, <209>, <210>, <211>,
+				     <212>;
+			interrupt-names = "store9_shdload",
+					  "store9_framecomplete",
+					  "store9_seqcomplete",
+					  "extdst0_shdload",
+					  "extdst0_framecomplete",
+					  "extdst0_seqcomplete",
+					  "extdst4_shdload",
+					  "extdst4_framecomplete",
+					  "extdst4_seqcomplete",
+					  "extdst1_shdload",
+					  "extdst1_framecomplete",
+					  "extdst1_seqcomplete",
+					  "extdst5_shdload",
+					  "extdst5_framecomplete",
+					  "extdst5_seqcomplete",
+					  "disengcfg_shdload0",
+					  "disengcfg_framecomplete0",
+					  "disengcfg_seqcomplete0",
+					  "framegen0_int0",
+					  "framegen0_int1",
+					  "framegen0_int2",
+					  "framegen0_int3",
+					  "sig0_shdload",
+					  "sig0_valid",
+					  "sig0_error",
+					  "disengcfg_shdload1",
+					  "disengcfg_framecomplete1",
+					  "disengcfg_seqcomplete1",
+					  "framegen1_int0",
+					  "framegen1_int1",
+					  "framegen1_int2",
+					  "framegen1_int3",
+					  "sig1_shdload",
+					  "sig1_valid",
+					  "sig1_error",
+					  "reserved",
+					  "cmdseq_error",
+					  "comctrl_sw0",
+					  "comctrl_sw1",
+					  "comctrl_sw2",
+					  "comctrl_sw3",
+					  "framegen0_primsync_on",
+					  "framegen0_primsync_off",
+					  "framegen0_secsync_on",
+					  "framegen0_secsync_off",
+					  "framegen1_primsync_on",
+					  "framegen1_primsync_off",
+					  "framegen1_secsync_on",
+					  "framegen1_secsync_off";
+		};
+
+		dc0_pixel_engine: pixel-engine@56180800 {
+			reg = <0x56180800 0xac00>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_constframe0: constframe@56180960 {
+				reg = <0x56180960 0xc>, <0x56184400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst0: extdst@56180980 {
+				reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <3>, <4>, <5>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe4: constframe@561809a0 {
+				reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst4: extdst@561809c0 {
+				reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <6>, <7>, <8>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe1: constframe@561809e0 {
+				reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst1: extdst@56180a00 {
+				reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <9>, <10>, <11>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe5: constframe@56180a20 {
+				reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst5: extdst@56180a40 {
+				reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <12>, <13>, <14>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_fetchwarp2: fetchwarp@56180a60 {
+				reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_fetchlayer0: fetchlayer@56180ac0 {
+				reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend0: layerblend@56180ba0 {
+				reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend1: layerblend@56180bc0 {
+				reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend2: layerblend@56180be0 {
+				reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend3: layerblend@56180c00 {
+				reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+				reg-names = "pec", "cfg";
+			};
+		};
+
+		dc0_display_engine0: display-engine@5618b400 {
+			reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <15>, <16>, <17>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen0: framegen@5618b800 {
+				reg = <0x5618b800 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <18>, <19>, <20>, <21>,
+					     <41>, <42>, <43>, <44>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon0: tcon@5618c800 {
+				reg = <0x5618c800 0x588>;
+
+				port {
+					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+					};
+				};
+			};
+		};
+
+		dc0_display_engine1: display-engine@5618b420 {
+			reg = <0x5618b420 0x14>, <0x5618d400 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <25>, <26>, <27>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen1: framegen@5618d400 {
+				reg = <0x5618d400 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <28>, <29>, <30>, <31>,
+					     <45>, <46>, <47>, <48>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon1: tcon@5618e400 {
+				reg = <0x5618e400 0x588>;
+
+				port {
+					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
+					};
+				};
+			};
+		};
+	};
+
+	dc0_pl_msi_bus: bus@56200000 {
+		reg = <0x56200000 0x100000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&dc0_irqsteer>;
+		interrupts = <320>;
+		ranges;
+		clocks = <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>,
+			 <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "msi", "ahb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
new file mode 100644
index 000000000000..299720d8c99e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+&dc0 {
+	compatible = "fsl,imx8qxp-dc";
+};
+
+&dc0_constframe0 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe1 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe4 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe5 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_disp_ctrl_link_mst0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_disp_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_display_engine0 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_display_engine1 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_extdst0 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst1 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst4 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst5 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_fetchlayer0 {
+	compatible = "fsl,imx8qxp-dc-fetchlayer";
+};
+
+&dc0_fetchwarp2 {
+	compatible = "fsl,imx8qxp-dc-fetchwarp";
+};
+
+&dc0_framegen0 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_framegen1 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_intc {
+	compatible = "fsl,imx8qxp-dc-intc";
+};
+
+&dc0_layerblend0 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend1 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend2 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend3 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_lis_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pc {
+	compatible = "fsl,imx8qxp-pixel-combiner";
+};
+
+&dc0_pixel_combiner_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pixel_engine {
+	compatible = "fsl,imx8qxp-dc-pixel-engine";
+};
+
+&dc0_pl_msi_bus {
+	compatible = "fsl,imx8qxp-display-pixel-link-msi-bus", "simple-pm-bus";
+};
+
+&dc0_tcon0 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&dc0_tcon1 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&scu {
+	dc0_pixel_link0: dc0-pixel-link0 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel0 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* unused */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* to imaging subsystem */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+
+	dc0_pixel_link1: dc0-pixel-link1 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel1 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link1_dc0_pixel_combiner_ch1: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_pixel_link1>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* to parallel display interface in ADMA subsystem */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a5..35cc82cbbcd1 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -20,6 +20,27 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dc0 = &dc0;
+		dc0-constframe0 = &dc0_constframe0;
+		dc0-constframe1 = &dc0_constframe1;
+		dc0-constframe4 = &dc0_constframe4;
+		dc0-constframe5 = &dc0_constframe5;
+		dc0-display-engine0 = &dc0_display_engine0;
+		dc0-display-engine1 = &dc0_display_engine1;
+		dc0-extdst0 = &dc0_extdst0;
+		dc0-extdst1 = &dc0_extdst1;
+		dc0-extdst4 = &dc0_extdst4;
+		dc0-extdst5 = &dc0_extdst5;
+		dc0-fetchlayer0 = &dc0_fetchlayer0;
+		dc0-fetchwarp2 = &dc0_fetchwarp2;
+		dc0-framegen0 = &dc0_framegen0;
+		dc0-framegen1 = &dc0_framegen1;
+		dc0-layerblend0 = &dc0_layerblend0;
+		dc0-layerblend1 = &dc0_layerblend1;
+		dc0-layerblend2 = &dc0_layerblend2;
+		dc0-layerblend3 = &dc0_layerblend3;
+		dc0-tcon0 = &dc0_tcon0;
+		dc0-tcon1 = &dc0_tcon1;
 		ethernet0 = &fec1;
 		ethernet1 = &fec2;
 		gpio0 = &lsio_gpio0;
@@ -206,7 +227,7 @@ psci {
 		method = "smc";
 	};
 
-	system-controller {
+	scu: system-controller {
 		compatible = "fsl,imx-scu";
 		mbox-names = "tx0",
 			     "rx0",
@@ -323,6 +344,7 @@ map0 {
 	#include "imx8-ss-vpu.dtsi"
 	#include "imx8-ss-cm40.dtsi"
 	#include "imx8-ss-gpu0.dtsi"
+	#include "imx8-ss-dc0.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
@@ -332,6 +354,7 @@ map0 {
 
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
+#include "imx8qxp-ss-dc.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

