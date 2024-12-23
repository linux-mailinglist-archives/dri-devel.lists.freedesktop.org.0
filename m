Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615F9FAA9E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF82210E412;
	Mon, 23 Dec 2024 06:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WyUNTAcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8D10E412
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqc3+SfCMKxUbEVe27Z7fPNx9ZbQsLKtZioOoWyzv2JRK+VRHAebp4lqsydqcgftU2PDshtLGoA4o2WCwOXCfR0jqwH19ZBpk0wcLdsR8Md1L6p1t51IMwkXuZ1C+F7Fs/nWS/uiQXavV4NfoQw0j7cLExeDTidTtmg9EMd9jzemR/fgKtlXUzRe81AR3i1cfr1Df4DwHrM7zGlF0zXnMqppccjQA3qrVEJ3mVgtFPlEfXx5XBEv586dYcedIEcclQg6xwJveQfdzCRsrpooKTAXUGVFKVUxzRCYIUJvbnsXpkNdW0uMJBuAQo3o2uphJsl54f5lHUo5EP1fHL0yTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73Onn1whePBmj1SG0z8hWLhajsqB/8dP9WVA+INVoxM=;
 b=NDRzew1/wKd9fKK3JEmhLsnDaVTR7y3/J9Km573AHtnoTkB6+ADna1XIUFLxW/jw1VZO4DdmEhgaw6bWNPsEC+6Y0+BK2e/n27bod8jrcxBuf+fRqMfi3ho2tr7b38NgZyPrpDts4JizFA9m3fmXleR2OqGcRnUuNo7vn/mtvOvdlDwaby33VKBld/aQfP9Y1i17sUQO04CuGKVJurFJG2NCm81zfCHXWF2k56tHH4wM5z63DfF1zPQh7orOY5lxf3b8JHajQVS0n79pgLhCtCihi/JQy1KTkU+QJtinFno75U6jmnDZJs0zoRkfLanz7VWSQuL69V1jTsuREjsIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73Onn1whePBmj1SG0z8hWLhajsqB/8dP9WVA+INVoxM=;
 b=WyUNTAcU8yS+YKJOo8WUwj2Ih1kSI+LeWb+aQY2jp+K2sqEuUGOUS1nWfVzlrtwzVzUqmfeYs5C7Mpgq5FvxIyEVGA3DGgnJyYCmVx4t3/RxU5S28UmTLMt6uUqk8duDJgB4XJCPq/vWCV8q5bs4N+MwEZ2QWVuTq/BeswTcKWZMVNnDrZddSmLk3Ow75iGdqr2zdbxTRzgrZBk0CW9NeNZZDzxqMGHFN+q5Fh6DCU6vlnZEClyQAw60fgBIqespe9TSDlnJtY3mADhWKGsbCbSgkEdn3MiiWL9/pLsATaJemP0ljRIygM+wuCw+AdkgTKUhqkc5miSpoglEcqLSUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:43:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:43:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v7 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Date: Mon, 23 Dec 2024 14:41:44 +0800
Message-Id: <20241223064147.3961652-17-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 468d1024-56d3-41fc-ff57-08dd231d2744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O4Wz0BY24u/NHZ9CT7iun47xJL+DUKhTsyee7HUvIuQGdB/48Du3ulQKzqzY?=
 =?us-ascii?Q?qGiA3ucCcBmx5XLpnjwirUwKnn4zb3I6rbgRoMyZPoZvZKf0KsGZCYbzYROE?=
 =?us-ascii?Q?0mocwHKBkAWixnaw9VBuRd5gd2wiw1dDcX6YR0KKsBSgaMf/0N0yG1UrB/kv?=
 =?us-ascii?Q?rCv8pq0XlluzTTEtV4X5zycaAU7AUcAmbslkDhOzQYHiBR7M1n3iL4RL1xbi?=
 =?us-ascii?Q?aPmX6d6dFZtUAapLahkcUv5oUyU714mKOZsgP7kH0XIYjw46bkJwjIavTJdt?=
 =?us-ascii?Q?ger7sI6KJqIb9VXiQMhvxmit8H64BTk9ZpguBiSCgS1vfkbq2LHJPMVyHqmq?=
 =?us-ascii?Q?z5IZ9/vq5eqD1XikCp4v2qesYXal5Z8mDL8KIhjZv6Rt+I6l67G9h4x+Wqan?=
 =?us-ascii?Q?+NCj96sjKOIo7h9lPQ9Iz1fozYGf/ei1YRkRP8m8QwVcIP7XW9KEbPVbY0ZD?=
 =?us-ascii?Q?Vsx5/f3D9l7fONgCP6t6yHp2YkeZYLjy76BshtSM/d/QpkoKqZsPJ98o0hkW?=
 =?us-ascii?Q?i8mK6rq9GU7/qbmsFN8I0f7Rx2ULMx82UlbnRmUz/4gkM0QpB9xJHYuaZaCi?=
 =?us-ascii?Q?gZQu1XWcsyEZdM12lChDFwgD9JbOhQk7JNbr6/59vD3bAetN4A65wFDcq9r3?=
 =?us-ascii?Q?jR+C8n1lFIv+U9p/4cDVPS2OtIaLhpJqRlfLwvtiliOolAb6rtPkmFBCJSLw?=
 =?us-ascii?Q?OLt/t1UemZFonJDFZzbNi1V7+nGIBICttLLddcHSGSphiAmXsUVqZfwQ/rYo?=
 =?us-ascii?Q?KVYVdqnDiZNrias48g3z7tPf0jx7Dpp3szdg4dYNFyJXRQEwrkSvTMTJHbAG?=
 =?us-ascii?Q?/FDEjOk4sF6J+vhfxMYI0p20iY8fuBKD7hSpFO4PST75kJAnzjFZeJOt4dXC?=
 =?us-ascii?Q?+eUEo27unTglX3cEvvbCsscfMWA1EogT7FmVUCpPgIgdnxGON0S/O1W+ufdp?=
 =?us-ascii?Q?1ua1EedRdULDmErovcgFDbw5KRIUGCrarQGRR8MqgkZGm1SzZ6Owl788N/kz?=
 =?us-ascii?Q?ZqOLaOQCSslC5Uah7uSIq4ztGchlFjhN0tBDuMSvWbix8G5Y8oWQEwhQ4ZGz?=
 =?us-ascii?Q?vdYO9dIKEo1IxXJV+jQ7+z2FLpXx0nad6odIxQbzcIhPyLniynL0wF5QWivT?=
 =?us-ascii?Q?n0FXDDCquAoUBaTMwu/DiLN1Hc8Qs+KEuhpl/sWjdde+Qeqy+zvafJ+e3Zz5?=
 =?us-ascii?Q?o/5tR5+eUpD0njHqnDUGM12pNY92bo2s+I+VYxR8s9Zzz2/FuIF+OqAQ+OnP?=
 =?us-ascii?Q?dDJLJZH1vzYFEvlFJ1q5NV0Yho/MGhNcDzOGQrz8dQiOiqPB808A+SmWimsB?=
 =?us-ascii?Q?SwFb4ThVrXvkQKRZIXwQ1rxczu9C5Ty81R+sCIOPFJ+UsqMV9B6f0ZK3U6aT?=
 =?us-ascii?Q?ANU48YCaMI4xycDJPkgHCk6xn3wFBaMLGOyiDztp6Doe2GLRkAAiZV0zxNXa?=
 =?us-ascii?Q?zxafC0cTpK4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XbtNfOFlJumlBEBEB9/tmhus6UnSmfjC4Re23qyy4JwnuG3aeUFsMAv76eWz?=
 =?us-ascii?Q?LIK/5A7QnDKJuSKPaMke0KVlYB3nugj+VMCwxSVjKhDFwk99X2JfP+AHatb6?=
 =?us-ascii?Q?OGJKK14PszHsRg0dvRnPtWpJOOeQ5q/sky6EUSPFxp+sPZ4D8RHRn9GRFhRT?=
 =?us-ascii?Q?Uo2aWzhM5WZNwrUl9jHaSf2Iyt2UdoVj/TG2+zPx1iNmVRgfnLEcWvMj6hSh?=
 =?us-ascii?Q?R8k8xEvnp/DBIfLUIt1kYouJFBpgzbu9X7qhLa2HPxbfzUfUFY7haj4qgqph?=
 =?us-ascii?Q?P2qrxfkJiSaQ/Xo0cvz9LeRIoLkphwl+I26zmIXqbeWsq/ACvl186cw2Q4Iq?=
 =?us-ascii?Q?ExtDsNAl4txSJVonEXYKOK92th/NYgY6+ud+yicwV/HoYM0NxajSvNEp/0If?=
 =?us-ascii?Q?ho8WXx1I1D5LLowumhCWO3cEHAPPw+uQ4DBhFVxtlDupO5BHb7mFexdh4oAq?=
 =?us-ascii?Q?gJOZW3H5segYA2EgoTuNVb/eArSZ/NLVjn9feREmtQWQPmSa0Rj+Pb88cuLg?=
 =?us-ascii?Q?iqKAoF67/fHjZJwTC2j9AoqnBUJDIrG/F36P82BU7h02IN0F7bZhMcCBrD/X?=
 =?us-ascii?Q?wx6xarr+hZXkoqjLgytlnbvm/4jHfZww105tYAx9Yl+jU0hqpXVmVlA/EqcN?=
 =?us-ascii?Q?Ing63D0f3rJ8MFSUOzwOrCnfy63RTtIWcJeUIjOsF1b2VlP5o8QMRSJYp93d?=
 =?us-ascii?Q?f3WbJUUL0JOIFmjGmrR8mrbGThe2zJ3PNA33Jw4BbXavCyV41Udv8df2sbPK?=
 =?us-ascii?Q?wv4dCBoVFJuSf61RyTplwud9LPSouLFpFSZLXQAj7f0HeJgcgRjbFIHV5t7b?=
 =?us-ascii?Q?HKMA8po+yXJ1BN3m85C2q7TEryvGllgQyieg2CxsnDV+Qv454g0zmTf/F1iu?=
 =?us-ascii?Q?ds9CHV8yQS2phJ721DFLDceJvU+Tq3MU7ch7r+T4uQej7kUUwG7hZIcqB1m5?=
 =?us-ascii?Q?0pl4BcRUjc+7PDEpEItOq2q2Ch0VTFTujOoLqvyPQo3NXMbk3aKtoOFm3Nd8?=
 =?us-ascii?Q?vAG5T5I+A5FMy4WwWc4Sq1DFPndjrBZRirraRPLbv9dBeVgj5/6luErrtHEO?=
 =?us-ascii?Q?YQh2Yu4o44Et/5j2d01aqueVR/DpAZptz/mtwSJnPP/Ax1cRDlWKmDv+UhMd?=
 =?us-ascii?Q?OmNwiYY2ZPj5B8TsOgALZfIeyh2vv+xHlVtrgFl3/+vbbS59j0Tu7j8UKDCu?=
 =?us-ascii?Q?ima9n9DO5UaU8TQ3psSb81XLOHqjEf+50o/+iVnmOrdktPDMW1Yf6kpJ+xhB?=
 =?us-ascii?Q?kA6mLMYHBg4K4aSgHCFkHi2wM0IqcAmgoU4cghsJGxZapWrGASYyfc5PC1rH?=
 =?us-ascii?Q?1aFZQgHXZZ31v3gZl8FpuKhiMYyHA7rkvElfnLO91Ct1D2qJNJ0snT0eBa1T?=
 =?us-ascii?Q?BjKk+LlSkj+dYzb9c/brN2lsd1L32LBGGJzgSgJbBjZRe+mcNWVWYhz8q+vV?=
 =?us-ascii?Q?qbxf2mNNs/s9cFspOCwGEduicIZstALUcOVDymdvGN8PEXie0UZR9ZqxaUbi?=
 =?us-ascii?Q?KkaOih9/yFUqhvXI1BcvzvyV+eYdEmIGKJj+QLYp6jYDXKxwltlwEsAL5GlZ?=
 =?us-ascii?Q?W3P8V3OsZaY92pPD8x+0WKB5iZ8+ToVpeUyA/IcD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468d1024-56d3-41fc-ff57-08dd231d2744
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:43:47.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPw9bDJqS9PmZiyiEo8mqNybGN7+7cAW0A/q7D+gRM+5PgnH0gHHvwBs/qPciZ+rO9kdv6vsz5PF8LWuX0IicA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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
v7:
* Add instance numbers to display controller internel devices' compatible
  strings.
* Drop aliases.

v6:
* No change.

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
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   4 +-
 3 files changed, 647 insertions(+), 1 deletion(-)
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
index 000000000000..ab84ae3198c8
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
+	compatible = "fsl,imx8qxp-dc-constframe0";
+};
+
+&dc0_constframe1 {
+	compatible = "fsl,imx8qxp-dc-constframe1";
+};
+
+&dc0_constframe4 {
+	compatible = "fsl,imx8qxp-dc-constframe4";
+};
+
+&dc0_constframe5 {
+	compatible = "fsl,imx8qxp-dc-constframe5";
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
+	compatible = "fsl,imx8qxp-dc-display-engine0";
+};
+
+&dc0_display_engine1 {
+	compatible = "fsl,imx8qxp-dc-display-engine1";
+};
+
+&dc0_extdst0 {
+	compatible = "fsl,imx8qxp-dc-extdst0";
+};
+
+&dc0_extdst1 {
+	compatible = "fsl,imx8qxp-dc-extdst1";
+};
+
+&dc0_extdst4 {
+	compatible = "fsl,imx8qxp-dc-extdst4";
+};
+
+&dc0_extdst5 {
+	compatible = "fsl,imx8qxp-dc-extdst5";
+};
+
+&dc0_fetchlayer0 {
+	compatible = "fsl,imx8qxp-dc-fetchlayer0";
+};
+
+&dc0_fetchwarp2 {
+	compatible = "fsl,imx8qxp-dc-fetchwarp2";
+};
+
+&dc0_framegen0 {
+	compatible = "fsl,imx8qxp-dc-framegen0";
+};
+
+&dc0_framegen1 {
+	compatible = "fsl,imx8qxp-dc-framegen1";
+};
+
+&dc0_intc {
+	compatible = "fsl,imx8qxp-dc-intc";
+};
+
+&dc0_layerblend0 {
+	compatible = "fsl,imx8qxp-dc-layerblend0";
+};
+
+&dc0_layerblend1 {
+	compatible = "fsl,imx8qxp-dc-layerblend1";
+};
+
+&dc0_layerblend2 {
+	compatible = "fsl,imx8qxp-dc-layerblend2";
+};
+
+&dc0_layerblend3 {
+	compatible = "fsl,imx8qxp-dc-layerblend3";
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
+	compatible = "fsl,imx8qxp-dc-tcon0";
+};
+
+&dc0_tcon1 {
+	compatible = "fsl,imx8qxp-dc-tcon1";
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
index 05138326f0a5..9fb4bac708a0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -206,7 +206,7 @@ psci {
 		method = "smc";
 	};
 
-	system-controller {
+	scu: system-controller {
 		compatible = "fsl,imx-scu";
 		mbox-names = "tx0",
 			     "rx0",
@@ -323,6 +323,7 @@ map0 {
 	#include "imx8-ss-vpu.dtsi"
 	#include "imx8-ss-cm40.dtsi"
 	#include "imx8-ss-gpu0.dtsi"
+	#include "imx8-ss-dc0.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
@@ -332,6 +333,7 @@ map0 {
 
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
+#include "imx8qxp-ss-dc.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

