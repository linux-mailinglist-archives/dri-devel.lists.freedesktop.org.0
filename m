Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9779FE1E2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA7010E458;
	Mon, 30 Dec 2024 02:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Zcp+Fvdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315FC10E458
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H83IvZj52nEYChW9G/zqpv+PpBFRhVL1KvDYj1UPBf5NvLOz4W0NHY7/n9ZDVSGfN1T2OCAfA1cY23vX2tw+NwcBhRUSnwSJu71lGyIXDYnWVECsiROuAUgqzbLGQx0QqU4b6f3EdLPK+SlEIGgcvwwhm2DV4NYRYgfgc2TbUktEqxr++OyujzVZi6awr66hmhQGeFTzybE/j4iyBT3q66mU2hRix+dUOnFcHpnaWvSWNxQpox1l9Yu9jXKJbJ/Ov0RH4QoAXmZ4xQ5Kp2pmYwXrPMlDtS8h9/+T+JuUHkCJCaWSM7BGhry6jmFGTNM8kcJCFAXwBS3/We1O4Al46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykhA8/7B+jSrAMORd29BJuFRkAJU7YmZ7Epg3VeIU9E=;
 b=tgotUGKzRZwl1bfVuJPd92eGafkepRfbjXNvqHSlO0yNp5rSaCC/VElYLaPvkgxHuxTgCDWO7VTyHtjImibeZddegsvXn1q3Tlidq3QHmDMHnmoWDuL1s1iNv6QDVra9+0fQWjJfxACYbCEoJ0d3ZvSInj5dQbCJ6eRrTSYnigQxsxhdwBkjR52VS5knTheZzWjBwWG8fHatCmzXcZxrPvq2UOgPfe2Du5SwCBCVwm57SF/XMft+gFPVl2VdFsS3iY64AShU5LX+9OUmajO1kVR2SAM0GjTLm+8KZjzVi1/IlhD2VNyPJpuIos5Ct9HFs/drnluBnfZGSrBXUaRUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykhA8/7B+jSrAMORd29BJuFRkAJU7YmZ7Epg3VeIU9E=;
 b=Zcp+Fvdr1aEz/0ADdovoR4e7anGGRdeGCuL5tg7I8oCICeolVU5JjvEnk7qb77gyZYWHDJhwvJVqBKmAOyj3wW+TCXNeQMHxSRhbi6g6daw+Z5RkiSckr58rdGLsWUQIh/5Qcc3zyLt2I33mmon4wCOD/rLHxHJhp7FB7Fc0jCcnWxSNz7g3xZJFyg7vy8XD3uzl2eFGgbE1tgI+xHhSUglhPdwIhyrcTC0c7L/lMCYipCoP02oQo5RocyTKSKf02WRHQG9eLN8AEwI9lKiwkQPCG7ZB6erK2Jbq3nrSKjBuYdsBHhjYhN0uDQM9ur4ze3jZLuMasDWW25JFszV0Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:14:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:14:31 +0000
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
Subject: [DO NOT MERGE PATCH v8 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Mon, 30 Dec 2024 10:12:07 +0800
Message-Id: <20241230021207.220144-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6fa681-ce12-4e15-07c3-08dd2877b217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QEGGgPsrmQdab5w45a8KSIQEHW8pyVmXx6pdaeHIfURvubnMGg+7Un8Ria+o?=
 =?us-ascii?Q?id8oGeTnSNx3QxTm4Z0HCBtulO3rbey4b53TBLhz7TD8bGi77dvL+dqWeqpX?=
 =?us-ascii?Q?rDypa/JbTLlyL1IkeSrULyYZOZVI8t9tKCgBh8Vwg4eOHndZqXKtrRWjjj4e?=
 =?us-ascii?Q?fs/9D+quYtCyHHq4LKVMd8Qnk2biPta/lY/JDMFs0kMdWp6UDzlEfKdybMFx?=
 =?us-ascii?Q?q9lB+RIpq8nTJgqiZpT9naAXISJO2dl2Kwwi/dxWMZJ+REGBxjMy/MYBBgeH?=
 =?us-ascii?Q?1rdf5gG6sieYoTmmqXjXDyiXnAUMJq+DqdoaR8Vz8F7Ic8drmH2s5z9iyL1u?=
 =?us-ascii?Q?VXijVXG92lbSNadwS45d4VvJkSHnvVMlzGlpeJLGLBh/H8J96JXnwSiVW1FD?=
 =?us-ascii?Q?LnWKqsAgpWNajH41Ko19Cp/qc8PLcb/ZJ6FmPU5XMlL/GcMsPe7YDs4ws5n6?=
 =?us-ascii?Q?lU0tCwvAvbqR/vE9tiSGbiZX/waHugaiCOlH7RIcwKXIWxVgVIpXqq1GxFWh?=
 =?us-ascii?Q?3x+ADhpY3meLhPdoDAOYYRAeHFdze+AclO9jbGFO1rtDW6EITaqpilDxNgJ0?=
 =?us-ascii?Q?OxnS6HVZ6moAFYJy9JY7B15cv3P7683Sz5STEb6ZcN+KdUs9b1fooAloIkcl?=
 =?us-ascii?Q?/AmJ1q4h6Ip8gqCy/UfLr6omoVDYUBVr5qNhZ+GRWimte5GmZSoSeByAQyjG?=
 =?us-ascii?Q?ZRjsh5eL6bDAhbwDitjVQzKfIiMLwzZAp4LadNX3WLIsxWns4saixzWLvokX?=
 =?us-ascii?Q?U5vbvcUC79o4mUOq4oAEm0Qk376zI8UjSIB+NA1O5TVcvpJhda/TBHnO1IIE?=
 =?us-ascii?Q?FKg0w25uQhH9aoqNjg+9bGVhhzvC801Y2V5oLkAbs9UaSON+OXze3eWTeMWJ?=
 =?us-ascii?Q?2YHBcRxPGsITmKb8ZIs/3BW6T5WNpSrpHs8yppnO50QCJ6xf/ialVkdIrxM6?=
 =?us-ascii?Q?PAx+3OPC4psyodMRWbno6xtkISbgXI8Zmh7QVl1BB835UhR+DhhxKS16xk3O?=
 =?us-ascii?Q?qxQ/pBuHYIcGc3NLYiJ03slKo6G8hhjuE42SSPTiH+mWo99htr1WnyLH5eQ6?=
 =?us-ascii?Q?993Bp70PTKXu+It8XjB7DvfgB36cQoJAPNItbNVIbHgkFGs2Ov5A+3eT6Btv?=
 =?us-ascii?Q?Kr0H9rURBf+x1m0Oa2+/qXKypBaKa51In2rPevp1ob5zOysQYSwKdKgLDTny?=
 =?us-ascii?Q?DxpXwYkgYjeXN6jSwPEe/+lRC9BzINVzfY82vZdEGX1cENQ03mBmUF+L8xHS?=
 =?us-ascii?Q?9odrDe25UsPvgri4hAZrJs+MC4BmJXyJfw0dMRmrIFODZZv+OEui7EJxA6HL?=
 =?us-ascii?Q?68dQ9rpBBUaITV9RDqqEd7+o9g9iYg/vxr65ctItyL4jKe7pkCBZS3AqcpDR?=
 =?us-ascii?Q?K22rZLaib2ZZds4vFuElCrBcQduRrNTOo7pGXL4X4XT/dvxUncatoem4cty/?=
 =?us-ascii?Q?3V/nIr4JNv4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XLSDARJRbjQjxM9Y8/2DSk/9dX9kmh6UiSuZuC+YZHoWeo+rSj4ZjY5wn7Mq?=
 =?us-ascii?Q?XeAxN2GhrkoigaGm0RaMPpaIX6zkx5VMDJK0Ra/udsM0fz+oRiJyjxS6VkAl?=
 =?us-ascii?Q?wc6xEZgjuuHAdZH8GL26mNC538FiGg5NnEGOzYdMYxY0CPzMnAfAiTcW3WTw?=
 =?us-ascii?Q?2Oja81S/EKSDkNUSnq6+2p9EikdE1QlXnpDzAVrRrwUkLY3A70tfJIxBEYZd?=
 =?us-ascii?Q?GxP+ae51LEPui/udbg2n1DJ6euDTua8R9F3sfs5+VTJRvWyNzFK42JKyHsOC?=
 =?us-ascii?Q?eHJtUpEbLlWsC+q/kpz8IVSmHyBeqyS2K19DATfd+gdzTM5YuNSzRaD/Ee3e?=
 =?us-ascii?Q?0Qs7NqyFZ+GP5Hq/tzoHcvl9N2ddY3h/DM8lIAvwub0L8HY1DEVdSWqFB3ov?=
 =?us-ascii?Q?tJruPgecZ3zAEG52pdupch6+Va+izgXi51E0kxFm6xWBe2qGTEX9g270z5aV?=
 =?us-ascii?Q?r6YzCiD6LWQNWmvPDHefbZnKNzyTIWj+A4u2kTRNnx9AoXd9/OoS8uY2nVIj?=
 =?us-ascii?Q?bGdHnGbpnO0yJSiKtcC7jvVPpc9gb9hcO+sNOagu99Yhf2kmM7uMqFBm5PZs?=
 =?us-ascii?Q?hNwH0pSGTBp06BR/qWXGZIttXenZGf6IQVusKwSGTqLJ8fKvwcZ0XAmlvOWg?=
 =?us-ascii?Q?HSI85pXOefoXXOrItBZndGiLQgRWuREuTI4+reudjwyAacGCG7Sj4aUkJNEg?=
 =?us-ascii?Q?ilFLgTtLoSj5+S3SOUpRzbkHlscllRhr0qMcoRDmtKJqlBFUDCLGPAw7JbKc?=
 =?us-ascii?Q?DJSXvWKl9fu27+xALUJLONGF1+H1mtJtGxYgnMNGbBbh/pwNAMCt3L1c44fv?=
 =?us-ascii?Q?2grnbK1iiLllYWm5fMDN60CXPh7cyOH5okmASy5wrL17L521XUCQ8P/gfXr/?=
 =?us-ascii?Q?29rvnK1kGC3uewXZ2XnaYgRF+qoJstXh1/zV4ABhpEV4ukNMYDGNiqkZflzd?=
 =?us-ascii?Q?wx+DIXKux496RJY2CUh7p4xFvqvYRpXvOQORaee5hHvho8/S8b5vi4LfG6aF?=
 =?us-ascii?Q?VLqjlF0Wx0jKEopqQuvYXlkEDA8YXTAKYcntrK6HFgctw3hRtmPFjyeB+1H8?=
 =?us-ascii?Q?kaAA6mRWFxzn3h0Jle5bMqQAjYZCBxnDClCYnitf/oPtn6S9rC/HxqhKmBpQ?=
 =?us-ascii?Q?sXE8icRatPJjQ9RUfyF6cz9yJu7sRmMl6/iGKJiFrQr4NYQvDUnveCKS/bjC?=
 =?us-ascii?Q?2q+BVnB8MmXri0dRo+2hvPiZELYac0XDyMwDvX2jkPqQNjV3uZFZ0Ex+xI0i?=
 =?us-ascii?Q?JKhSm1hGDtx0Yjz6DeJLHXTknqUnnUp2/tlweoNLWMgl8KGIgEyGLkCaPyAM?=
 =?us-ascii?Q?dN93S7MmI+hrJ02yRC/LhW254wa+493vvkqFrBFRMKWYEMpUic0RL73KOmYj?=
 =?us-ascii?Q?hyYNHrxONkYjlph8USTp+9R/wvTivAiAQYJRjL6rxi36mWEqxB9343Ah7fV9?=
 =?us-ascii?Q?Bsg26HUZx7jBg5z+YonYYFlAynGF3cUrwbCdjT74/etwMvmb4zXUlciTLFpt?=
 =?us-ascii?Q?y+3mbqObVvpsdkatZEA2fL8eelGzuGfb8OPgqkWDKkajjK5GZvQHRsW0yKTK?=
 =?us-ascii?Q?XR0gPRTOul43quLDzqP1Z9pyqd/qgOVdelH7UYzh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6fa681-ce12-4e15-07c3-08dd2877b217
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:14:31.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JKSi6WJbgCXt4NtHMrs5NuwMW1VYrr5WZtPerzwm+Sac4Zserzg7FuVe/XoZCN4Wz4or8WUolFn1SGOzG5/Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180
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

MX8-DLVDS-LCD1 display module integrates a KOE TX26D202VM0BWA LCD panel
and a touch IC.  Add an overlay to support the LCD panel on i.MX8qxp
MEK.  mipi_lvds_0_ldb channel0 and mipi_lvds_1_ldb channel1 send odd
and even pixels to the panel respectively.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  30 +++
 3 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7..408240b0002b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -267,6 +267,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+
+imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd-dtbs += imx8qxp-mek.dtb imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
new file mode 100644
index 000000000000..7ddd90e68754
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&{/} {
+	panel-lvds0 {
+		compatible = "koe,tx26d202vm0bwa";
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_vcc_per_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_lvds0_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_lvds1_in: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+		};
+	};
+};
+
+&backlight_lvds1 {
+	status = "okay";
+};
+
+&dc0_framegen0 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <940320000>;
+};
+
+&dc0_pixel_link0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&dc0_pc {
+	status = "okay";
+
+	channel@0 {
+		status = "okay";
+	};
+};
+
+&mipi_lvds_0_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,companion-ldb = <&mipi_lvds_1_ldb>;
+	status = "okay";
+
+	channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_lvds0_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	fsl,companion-pxl2dpi = <&mipi_lvds_1_pxl2dpi>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+				status = "okay";
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+				status = "okay";
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds1_out: endpoint {
+				remote-endpoint = <&panel_lvds1_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_phy {
+	status = "okay";
+};
+
+&mipi_lvds_1_pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm_mipi_lvds1>;
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_lvds_1_pxl2dpi_dc0_pixel_link0: endpoint@1 {
+				status = "okay";
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1: endpoint@1 {
+				status = "okay";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index c7b4015c7bf7..cb999be00c22 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -21,6 +21,16 @@ chosen {
 		stdout-path = &lpuart0;
 	};
 
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pwms = <&mipi_lvds_1_pwm 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		power-supply = <&reg_vcc_12v0>;
+		status = "disabled";
+	};
+
 	imx8x_cm4: imx8x-cm4 {
 		compatible = "fsl,imx8qxp-cm4";
 		mbox-names = "tx", "rx", "rxdb";
@@ -58,6 +68,20 @@ dsp_vdev0buffer: memory@94300000 {
 		};
 	};
 
+	reg_vcc_12v0: regulator-vcc-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_12V0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	reg_vcc_per_3v3: regulator-vcc-per-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_PER_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -785,6 +809,12 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_pwm_mipi_lvds1: mipilvds1pwmgrp {
+		fsl,pins = <
+			IMX8QXP_MIPI_DSI1_GPIO0_00_MIPI_DSI1_PWM0_OUT		0x00000020
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
-- 
2.34.1

