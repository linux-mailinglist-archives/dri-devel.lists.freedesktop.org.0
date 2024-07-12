Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A992F7F6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB9510EC89;
	Fri, 12 Jul 2024 09:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="babR7y0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3626710EC89
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IozinDbC+sA/WatyxNjXbOVIDntYO/PoHIa5EKRBLHb/0bUnxzLI5pQ0ESZ+GCUNH5B+XRofFOPgGj8yLBpsPjg9EHCHetEv0epXLzMCGdV1+H8WMo9H/0PUPmZm58FYX/Xzg0/+CVppE7hDUNthYag1zA4VBf0i+Yr3M0ZsFI3k2TB8cxmRRbzAyUKL7OgkLKVYb2pQjC1KrD32zIuhQ7ep8Zhp3s8MVrgXxAJAyuOy6HHFRnlGFkV1GpPVkqYPJAkkpTMhrub0fTOCr+H9I222mokSOKt3P/Q5G/HKqePLHmXXjXUAVyHBM6vtVDTNg1fPzHslfibRDUgOngi1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxvJmSbW8JauPoVbLzhu4Vb+YpmEesx3Xp/kZ30aEHo=;
 b=rCXBADRV5L74y1X/+L4L1MmtioehZ3RvpmpbNEsNbXF++bdJ5WWhKO/C3JYeEXg/9BrPOtKuybycYycRykaQiIoXQ9DpXfVvkcCLep9KzUuCj+O29YtNxKlCLeQwh1KmSUzz47P4+86iBmgxgH8fxBIXxBR6M01wMpG9TURYJWLeeJWDh5VOam78ntxxP4SBaG27ss9e71eV6Eync2l6L77XRL/ajAvn3g3PtzUD4JZ1RyjAerMDGAH0Pu0JQJh1R8pSeUuQ5/OYm8lnK71/iIajYXFHpohFv4vT+xxZZ7XbnkGCnTi+MhUFKZbvyHosH5UePhqiS7onTQkAXikV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxvJmSbW8JauPoVbLzhu4Vb+YpmEesx3Xp/kZ30aEHo=;
 b=babR7y0TtKB/VH3c5sFi3XFgmj+TbftBdOBtFrAOgM/H7CE3pTE7C7vqbWP1CdQ0iwLnteYHa71GmRsLMBWXK1svvd0NwdEVSQ+ZsPOEkZOhQxe5b6eU5APXcrs5Ehc5LcQHs+lN/HBIWmtZJslyq11mOk3NlGt659+uTXQLpc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:26:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:26:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [DO NOT MERGE PATCH v2 16/16] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Fri, 12 Jul 2024 17:32:43 +0800
Message-Id: <20240712093243.2108456-17-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 256092d4-8da7-4dc0-4008-08dca254b6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y8G/rRwvZ4q7mc/viQ/huduXwT92sVVGcDna7M+ULGMqG2TPv+v6h38JYwNF?=
 =?us-ascii?Q?kIDql/s/tSvdBlrfI79TE19YXBBYsmOrkw/ulT9KrUNa1VMXPmGMYwurRzuu?=
 =?us-ascii?Q?DWvMlFosVFpR6vP25YngVZC9+FZTpVuyr4jG8Nhu5gC0NIssFp8AVhytpQCe?=
 =?us-ascii?Q?4bF/jVxg3xnePAQ9QW+aTfqZiuQP9xZpt6CpHoFmDEU6JNTDhnGYqUBpIkEa?=
 =?us-ascii?Q?L0jvKDQ51+g6AgTws/MgbXSL983wFyx5gA9TzhYd6W5seuPFHB0gNrZIjDid?=
 =?us-ascii?Q?jfGbswZS3sdzsqknVdv9aMvtNsDVpfA0sADGFkJWqSWm6LEha5hqslA0oZle?=
 =?us-ascii?Q?B3DSmkqsQ4uMIbJ/4Yug5/y64oSImFzn1b71aVw8/JL9d+EUTQwcEUktEF7s?=
 =?us-ascii?Q?ENjtIMLbi2xNoIYXZG9Q+i78M7akIi9hPMTSf0Ed7aFCgLr0HqYfy1pHXnfB?=
 =?us-ascii?Q?c4N05H9fwQDj5pYb3GwhvOz3Cop47WmLBkRa0laC3fxxoKRvW8/ncNMOZ39b?=
 =?us-ascii?Q?ooH88lvnlCnK24cdTcRb5s42bI3fV3Kyg/qXrkPSBzvXyJiBeuLGDmX/AFba?=
 =?us-ascii?Q?QatlqkKoHe/N/0oSbrEqmBFKneY3PGPGuM426B0x77/4Su2E+N8/7ag1l9Zq?=
 =?us-ascii?Q?0QatIxTNGX93eciQxywcKtVrNDuaTsoBDiwZs5j/EbwVPPAMXf++FZLLzQg6?=
 =?us-ascii?Q?HkmGE6b4DHijChyIxYy8B6tpjhR21JamXRB/NKbm97VsJKpo/0A1bm3ACHpr?=
 =?us-ascii?Q?Nb57vAsDOlNfN58aW7MgNNZKORJ1GrNN7LiKoI9ud/FLlHDr4+Rc+EmPqJ1F?=
 =?us-ascii?Q?/JPEW0911Bo/x/YDv+w5Irn5O/gscHgvMI7prRCKi5gRnlqBoOSBihjjqazq?=
 =?us-ascii?Q?bJXHVgmGBf6rk9vHMIAHW1fmjIS6IXCnHsuexh1M+6TcKtJN1gfUN3BCv9QZ?=
 =?us-ascii?Q?YG+5+PhusL20U4piHH/g0xJ5Bu3AGjNCBsUS3HloRwcmTM9a+HTS3JT0Nu0I?=
 =?us-ascii?Q?SkxkU1M47mbpw44E5kRk1wZC1yHe2MMuglX+sWYblSCig8YF83u8hju5l5k0?=
 =?us-ascii?Q?Gwf/S0YifbmVT8MjgtkcwU0vZoNeok2C8gLBS7iHMaFUu85SAPGRwJWUd+Rx?=
 =?us-ascii?Q?FUXG21iV++PyLrrVfcfZtew3feIxAzWqR+FcxQT2VphNI5omJXBDJ6jSQqsT?=
 =?us-ascii?Q?GTsLMUglgfmIRcJCMisDL5229KdLCp2hppXubeqennSrvlVuu8Vdua8kRTp7?=
 =?us-ascii?Q?2j9KcUJBfWsbfA6V4+1nDXrSILl2YBzJnHMmyam+EWRYDSQ0wtAFOsMOhhrR?=
 =?us-ascii?Q?e7DxZ1rkg4loTS+cipVbkTm82IXT4c3nuIcArN197foM7eBzYzEzPDsqw7v+?=
 =?us-ascii?Q?CNUL+y/g8xMGzqgy1qUk2ceJ9Z5OzzdzIE0dnusYi3rvTr+PUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ebo8UCXkL83iJYDNkpXdG2x5qZh8oXv8G7HU5AWaGAaKw27UkYbe6mtYQBCe?=
 =?us-ascii?Q?dFdQY8j34LgSvlAytJbD12LJ8o3N2atvWNDsx8rUoTof+jfUaCT67twBV2+o?=
 =?us-ascii?Q?FY8PIrR+G8Q+q8ODfYZ9cFj5mvQsZOhu83R7rwB3F5vZRdv71Qyx1yHP0+OA?=
 =?us-ascii?Q?kQovNLVMVslab0L/Ols3SvzW6DSsVPeOtqTK20pv8opOQ2OLQ+c6U5T6B11z?=
 =?us-ascii?Q?njEkPjqVODLCu82OBRUfKWIeBe+xGRxlphLvnymAseL4ELi/QAhCeNJCYqWr?=
 =?us-ascii?Q?z2LObuGbEhqyam9m1nlLGId3xU5U7K/TKWqDxrZVxmEU2g4EG2Ko+Z5Ha/38?=
 =?us-ascii?Q?YK5PyQHjgtKkjK2PJZQETf1Xpt2sqWU4zgGrf13bTQyTQYmtSZTUc9khj29n?=
 =?us-ascii?Q?T0UuA593ygMFiiiZAla+FCBL/cZT6xk487otTqEpp6mLXp8IkHFOtZnOhUOi?=
 =?us-ascii?Q?1EmO87GKeoAzZAVEUWIJZvaiqTDmivsnDZyymC+GyXfwrnPLdnAZGUsg/yOk?=
 =?us-ascii?Q?PxvWcZJvOG9UaThIGGYM3gLxnKC+ZhKiakyjXKgtKk425G6Ka3qSavFuPxcc?=
 =?us-ascii?Q?EWi0yNCYueW/CHdglBhWpmf/H70lOoO6a5lFM9YCY6ri9g1HMDsJGWnTNo2U?=
 =?us-ascii?Q?yyIJiE7g5MDYArupjXHWfypUE7ymIPcp30BLxm5nvIdyX7GteBvDoJzw87h8?=
 =?us-ascii?Q?k+B2JEIk2YxA5lwEvThCzOcaqBlifoHy/ipnpo3lhXiXBeOth6nq9ip99v7V?=
 =?us-ascii?Q?OtOMBXRrxzARQ3T3TzQZklzHSyYSJkQL9ewxd6pQEe/+RMj/d6J6XmyX2pTp?=
 =?us-ascii?Q?TrXdGkCoIjHW1nDARiCY4IgSaj9U/kaSVhwevvak9RbLEz42MJ+tM0Pgc27v?=
 =?us-ascii?Q?1CCQY0gvkPH5uCB+9nkwwtyH6s8Dp1zUT2SJXTg2KkVOUs4NvqJ32kyxuDnW?=
 =?us-ascii?Q?3rRqXNXchZa/fyvHwu5kfLaeWgVa5v5XHRqaaJDv9WbONcb9HgTNUPb54vOb?=
 =?us-ascii?Q?uh/vh33zzSQ6gq9NZHPteItTDQuu7SbpbrCwQIDGTpJPkpFVvqogh7fYwBXh?=
 =?us-ascii?Q?DSUAX9KiuWrpNtkdJPFU3hJOmEWADx1rStvQhl0A1L2GOnaRBlMN3yRknfEc?=
 =?us-ascii?Q?OVMl+lvZvwKYdh/a4yBQmuohbDvh5iKf7++KodUkS1z3ioC9kIlIfOccwzpy?=
 =?us-ascii?Q?Mk24Doe9q7WceIJ6eRSoy3sxN5yZVigPXE5bulfxjfkVJjA8yNePnwSD/3iU?=
 =?us-ascii?Q?bjIf/dZYfQj02kwFP6yAv6+O5M7uRMF61GgjekeK1RO11W+v8/F0zMmN1Ib1?=
 =?us-ascii?Q?mR0CBvp+eVgfrkKmXbkuBxx7LxT5kyZEc/0l7I2meM842GvfzApg/p5sYZy6?=
 =?us-ascii?Q?OUTwYAI4n7sDMfGPjhzrwX2m928nSV+w06Dl6mwJr+cg1XyBodWyJAo5nxSA?=
 =?us-ascii?Q?nuntnjKAGEbJxPKBvX8YjHQ3LcyD4OSaKW7/kdb3WNfZoAxdXnRyVaiBdxeK?=
 =?us-ascii?Q?mwVWeFtpEawp4YhDwqONWTaaa0RXlOV7OmKiZJxK4bg5KM+xbBofT8NIq2JS?=
 =?us-ascii?Q?QZgwdMO6+JtbDroEWeyeLgwO3+DwQtZheVUj/R5S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256092d4-8da7-4dc0-4008-08dca254b6d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:26:31.0366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJLWtVEf3vxBvF2cGSMTdAYH92zI/vkMK1maKxrTOiDNcLOPi7Zjzn+ZyRJuwxQyqY3gGN7nq14uSP3YGiIqqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
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
v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  30 +++
 3 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f04c22b7de72..289e4b2b4f20 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -234,6 +234,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
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
index bf88f189c6fe..6389c32eb910 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -16,11 +16,35 @@ chosen {
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
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0 0x40000000>;
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
@@ -497,6 +521,12 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_pwm_mipi_lvds1: mipilvds1pwmgrp {
+		fsl,pins = <
+			IMX8QXP_MIPI_DSI1_GPIO0_00_MIPI_DSI1_PWM0_OUT		0x00000020
+		>;
+	};
+
 	pinctrl_typec: typecgrp {
 		fsl,pins = <
 			IMX8QXP_SPI2_SCK_LSIO_GPIO1_IO03                        0x06000021
-- 
2.34.1

