Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2A79DF93D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84110E635;
	Mon,  2 Dec 2024 02:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="O3MsrhSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6B10E635
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob8U4vty68i4ZGtCj/t8F8Wcz05Z3Q2huXncdJbdWmnL9C7l8ul3gPrGRTh6L0vhSPKrxjg5m5Eglh4V5DWEETp9LbCcuFbDA5m+l++ZCLkI17tE/gd1K9zbHf7UL1d8mdgKBcpLYGFPtBGXmFVKQhiQUFgypnHiiKnt4DImUfTl6KyHsUNgdibTXTHeRFqq44cCOXr3rbpDYcCzpgs2K+EYxF7Sfq3DzzNJGr9indKs0hHvNYz2BdTyrbWgrq5YyGsyzhrkr+/eWT+yYaueBAe3zceperPETc6KmDaEm3gCY4PpvA3HUTDo82ijtDc87GTkcm6W+9e54x2hG0/v3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAWa0pdu4KjiDW09QDwcFh09K+uOagshDRrFKtuI4uk=;
 b=ZQvNxYTaxb66qQ9Rk6snd4/5nEqwAeKgaIBq6B6sHF1PUrCDXFacB6MGvctTV7fde6SdN0ObiywPp9NvdxsVK7XXpRPi2zwTlSks5mhQHzRhWM97VR36LE0g9+TPZE7ECqW3xBlI4sWHgG8ww9Y0g4IrtWzdRCJeaUWyzWm6r2kLiRabo/m68s5mUrrnD0PU6zM1sncawlqH4Ml9ljIeqPwXD1rFR8oVQzIx8x8Ebc1LMBj6kflkIWPoSmxmhWHDHKQTTrVTSlq/pHSuKruurlEOP7ue3eCNoUO7UrQUDfmW5ISZRvOiRVTF7hlxV47AawzoFyMgDMwnH/Bowgl6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAWa0pdu4KjiDW09QDwcFh09K+uOagshDRrFKtuI4uk=;
 b=O3MsrhSOYZFTChNiZ+UnytfncFsD3HUXpGbj4zH0QuNCHIRSV3cIGWS0dcUQhhVzP2gQ0WnX+iMXfvly3bjIfELWquAZPzKnN3erTJiuaVSoiAQbS82MUJVavoj3O6vaPjCEPdcKUPMqnl/rf1Ork7EFkg5Bl4j7ZMvgwYNNTlNy4Ab9ki1FMo3r/suldYYdiXZPyevPuIAzKurq/39Y9LzSL1MdfzSlyQRrcRoTxVLlvVIVO9Vq64To2aWaPs8oV5/P4nMbaP5JnOFeVUK4+CPh/oMtgL2jqpyTTTPOlFDO/ahIpSPMj8N8Dx6frqohFtLSKWrTflfLnsFlzWh3Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:58:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:30 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v5 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Date: Mon,  2 Dec 2024 10:56:32 +0800
Message-Id: <20241202025635.1274467-17-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ba386a-9b7b-4ad1-6c85-08dd127d3353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xNuV1pZyLOi04qYqPDm/MtMZB5K8HtrlzdW2QZ0krhwD3rLYEod4rAgE1Ur5?=
 =?us-ascii?Q?ZSBqgOnxWS45TwjnvZaPjJTIAViVR8s6VEsnAHuN+4PKSpllKrnk4AuFEStR?=
 =?us-ascii?Q?yVCDSt0jcDj1BEU7Wx6Cd/f2GqWta1fnW9CrcF11i9se0vn1YBPhVuAJtO1F?=
 =?us-ascii?Q?D/J960EuLBFMHWJPwVJKerxdUrz0BzfY/F45wZberLXgJI1bgN/44WepBh/I?=
 =?us-ascii?Q?XEppsmIF316MbCBDMdIk3/ughA1NzCb6DptDmBpKnc5h2BIJ5ZEa0g4iXYbv?=
 =?us-ascii?Q?Dt7Q5xhWRVYZ1rKjyFQ7w2L91paS+ad3BzkjRKXxmcEkz4D/U2S8elTz3gXY?=
 =?us-ascii?Q?eh9zYgrOaasyqTGgDQEEC+pVv4j8IMIr7OfjMIF1ta2LogQtYjoCzhj53hmy?=
 =?us-ascii?Q?bBfK39qi1Tb8M8HfEtGGN6TU+SPsgvEe2PZIaIMwNyugi00Iw2hg7ESi6LMU?=
 =?us-ascii?Q?T1JjbDnhWdqUa90UdUgDddbcRcyjylxLabWFLgnTtSOp8ClisybasLsS5yuq?=
 =?us-ascii?Q?/1TOi6Pn5++w7hdyfwUlaAzyYZ8RW/eMzJYk0A2VHcMIUf+ktH6y7R6tuBr3?=
 =?us-ascii?Q?6dg7c9WVaiF7WzuIS/xzxBP4UnIgXwjRZfy6b/9JgX4ukTLrn7+qLDljRcnP?=
 =?us-ascii?Q?PWEPrnJK8tWQ9xf/XsdALWhuMoa+p4OJzWEgLU5OLS1ePbZXa+QOq641gq+8?=
 =?us-ascii?Q?6osH5A4ZchW0VLG2P4m/yHQWUSQYBWrwaVRwwX+gMTkAcUse/hgqTcr4WJMG?=
 =?us-ascii?Q?D3ruUh/Gk9m5dgCPUvbpX4T+fVtbdccI8V4lfJKd6qsJNsNayVAq8LBehDZQ?=
 =?us-ascii?Q?wpAS06dKZMIRIVBOptVQC4NO3nKIw0f8ipF/rsWOd1Iytgx3CW0B9ZUjvej9?=
 =?us-ascii?Q?L9FypX6/5iwdAINStx6SiaMDeLwwJHH8yaAVaITxN9UtMA/c0z3nTc98amDk?=
 =?us-ascii?Q?lR3+y5/HzJgBGRbsSDUXpWFrbrMvKbmbuvNjgNirktBx1Mxuf+5ciKqhbOHy?=
 =?us-ascii?Q?gLBlCYxJnNDJGLqBYzl8YD6eMHi4XFZdW7WKhAOxcsC8w2nZPFhyI5kx+w7P?=
 =?us-ascii?Q?YT2KZWcSB6YzV5Tw684fuHZ9oPe4Fb0AwMFWOFTbrrDiWbA3oCuayufSqp4k?=
 =?us-ascii?Q?MDlKHDS/+MtQIJeIH5AwdoDPO+YaBINVaIJsOOZUyYir9A2KZ9zmnERsSj+V?=
 =?us-ascii?Q?Be03LE4oCEwYoQFOkjfLVAv2UzVfjcxdEPZ7tyGMrDYzw9A7yPVj8GXoD1jj?=
 =?us-ascii?Q?1oiNmeV8p4gk91JmH9gzXmvKmjvNpYtFYdNiiDjp846SKm4RfurajG7dITDx?=
 =?us-ascii?Q?PK+iGZMs0CLc97qnPG/E3/2ydW24DGk47rVlnPkxZCoFQVxqTbDDGJEr0UMb?=
 =?us-ascii?Q?gJItlakOWdNFz3v/gmFvpeTjgL6jCCmMz77Y9KMIUSjnHhX5lA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ERFWnTDrb94RcVPfmsy/xHT3xxF4gIhOoUFM8Wtj8efIR7zY94hMd7vIabY0?=
 =?us-ascii?Q?vbkJsKXiOGZL26lQlk1k7/zmq91gFSH0aFkjZvAcMIDd6f2YXHQ9qIqLfBLJ?=
 =?us-ascii?Q?oOiDrJ8niIrevGTjPkLjJW05UBfUJR2M620TKGLG5x4jGkwhJgFAdhFS/dB9?=
 =?us-ascii?Q?gCQWofRJkML8S+A+CcW+KEhSYFrrGqJg5ofRMFNhUw34hx5aTnPeNy9T0beC?=
 =?us-ascii?Q?eJe1XbQsTH4yKCvVkOXkKJPUxBPm02cwZ294xrK3wKq7oDP0kojJaXmf5VWw?=
 =?us-ascii?Q?y/AtAXIKhuF09mtDP7Hrk7FHCZb7bnTdOnT9ah4LA0Qh/+fL3PIozIdq5EYw?=
 =?us-ascii?Q?gJOVNMP+XUyCVW7RMNwarLVqbkKg5ZW5684F9dq1vjNZpHdkuqjO0V1nYPED?=
 =?us-ascii?Q?uMY7VfDne7rpuakJXtfHHRuvw7F4PapLOrlWNmQKgd5bcizBdTy9Cd931UMv?=
 =?us-ascii?Q?e7aGrEDzJVU/w3yQDMzQcFJDDY46hmKrKVb41QyPWIPQJ0WqlM9utHTm6HIX?=
 =?us-ascii?Q?O3aQIr9z3ViV2oh7l27E+PHc2rOcvDrhI20Ed62xdMTiLks/nYrxbkOMmDwH?=
 =?us-ascii?Q?hCP4/DM2yCvrarZ9oUxTI5gjvHDQosOEsAgNxSzRC4SCWyWB14KsNzxFvpqO?=
 =?us-ascii?Q?K9DNkCCazqVGlhG70SfpfPbU/+1ml0cPtrct7bSfgBQaQlOvNdBLyCaXBZNy?=
 =?us-ascii?Q?mS2U1gXRUnnqv2uh/iseivHUJT4OXVPtLG5FFLGgI0hQiBW1xPycqO8EZUG7?=
 =?us-ascii?Q?aWXeKXMGhbyqw/cw+jBFvRKxBD2NlXKjzqioholdd8NL5NkavGEWBlIzwDqU?=
 =?us-ascii?Q?WE6LMYoDao1+BB8XTSLKz1XFxgWzUW2ea88HKLLK4SNdUJyXjFPqSMsPWdGq?=
 =?us-ascii?Q?Ztbje4Bi5cfjcSE8cWfubUnY+gQnqRHSgbJ5I72bCc3ZpdH/kdxPX2k5if1z?=
 =?us-ascii?Q?Bw6u99zLNDy0wh3KE8RWG+phqfEOA+KFKyyaOjWjJfDnGRJdOICgYc/JG/0I?=
 =?us-ascii?Q?T3csKR2wlb6MZM1/3bVh+peXYyXhgAb1FFiPPqV2jqc9tX0pd69Eedw+O8D7?=
 =?us-ascii?Q?gEa/8IR+T+rbVwfNhRn4MQEr3Gdos1vtkMkDBoK2K6houxyl/Y1YNW5qrGSI?=
 =?us-ascii?Q?1dDL4qat3F/wV1G09zJTs/bsgt2sY8hk9Sf6EypY4o36slR0DsF6vZjaU6AH?=
 =?us-ascii?Q?Z/OHTZWD4RFh+B1kf6awjRf2zEgmfDOz/UcgHVOIuxK1PsgxoSN6JC/PpHLr?=
 =?us-ascii?Q?fueosXSrUs0sH2odkn5TOhXhSSpF18acNmr+gMEXYkw+lbhdFBmbQtB2b/Kg?=
 =?us-ascii?Q?pwUe2resjNtoaIlaycJ8F7gmhcuM6MgIn42JmTbsjRIvaaEc88LUcNsl4IIV?=
 =?us-ascii?Q?a9NmAVQDxgLgFnaLYmsnkSbgLIFywpaSby4IN2Pc5tH+mG9Mio/3wuiEUm0f?=
 =?us-ascii?Q?B/Q+Tmtra2VfMiOkM34+o6f3on/vxW5cpfz0j4NsURqFhTdmXkjYG9mg6usG?=
 =?us-ascii?Q?M1bRAQLapn24VrfuKMQ2fDfEU0mJohu6Gi9dGeQmm0OaqDbeESoRZBxBHuwY?=
 =?us-ascii?Q?hOgVfXqlEuE+vtk2SNDa0xUYxPxXaqO3SSlR0t60?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba386a-9b7b-4ad1-6c85-08dd127d3353
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:30.0805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o76dZetdb7KA8gKd586vCBc+qBQGv106mbXh2RFhzvSC8+tpYFbh19160/ejWScMHfdDljZ+jIZUc8ua6My3dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
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
v5:
* No change.

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

