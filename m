Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5193AEF1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB07710E65D;
	Wed, 24 Jul 2024 09:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Xcxbay4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528E310E656
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR4tBpujTNLnFZDxCNpAzOvPTfhO8TUI7w9JT2n1F3khDFcA7R2gL5Kolw39e1AVluxQtlDAQlKooyju+5Jcg5FajhRiMfbhyPeKhNUp8vlTLQnSYTQvPHeZ0a4WvvKZJrLGC5E5YUUp+DZvYBOO70PWUo5HHSScIvjzBpvOLwTYVh1VvBDRncA19umemqUrDpse2IUKh8EOso15NGrSwa5c+N0cD9c21irKR/5EPGhifz3vLucIRr/7Y+tbBxXlwzWrJp3MoB7IukZGGxn8tH80qpKW2BwAwf4v7iBI8sH/Y30Pa43y+hdOhWvwjK0J/rNaatqptRCKnZ4BSbWixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBBa73iOEpeyYXnXYEl1ZLmI23gcgfRor45cy0BuGes=;
 b=BbxEKrDo1L5wRPAMgvasqt4XEIM5ssKOff669zmQ5JiivkAG8L3AJN70+EVl1TB0rvyc/gxAQ2cvcT/T25BL5WTKnFeZNMJLcmYleyGRulmzLtfLUsqigvMxMpAa9BnVaq/w+/faEgeA0vdFRpyEhp26rID9LknjjKjIAQimpyBK979Wp4vDd9cYnJT23mWjdACXiY5v5JS8y22mai6ZcV3ol2Yc1EKZ+vlsaaAp+FwqhEQBjDonEdN76IujsZt0VaxRiVLR0IhDdWAV8rjpnmXHp748SdM0Okd4Zpg5C33z9ip7gSekykbkX9eFU3UUc/yIYHCj2fuF5LDMu3Y5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBBa73iOEpeyYXnXYEl1ZLmI23gcgfRor45cy0BuGes=;
 b=Xcxbay4kcnbLc+NO4ZXmoqsDSFuMg1rox1Kc454zU+UmoFaIVfjFjk/+dxUdgvEg1cf96JYgdQXuzGRSUxfhuknJlkc15YongIeh5itlWl+lzjTFf2s//pOPb2JVJNCNpJOonoKNG1GeYFI9PC8DnpIZxlHHdn3CjoySYs1kzYLwNC9ptsBMXQM40CpuCRA41JPcXkCUe47Kj0OEwdayTDVbTb8YOCoEKFTUzNAA7r4en7wHnRNKmAAnSkxEeQEhtxuori/Nopi8DOgQb0My7gSvC4WefdN8UjQ2iMP5X2p4a/J1TdgWEqnrauuqPKfvQEURDwpUC6IPEYZItXM1rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:23:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:23:17 +0000
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
Subject: [DO NOT MERGE PATCH v3 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Wed, 24 Jul 2024 17:29:50 +0800
Message-Id: <20240724092950.752536-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 4116b097-9e64-48d3-5525-08dcabc24027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jg3N6ytkG3NQqT2uezZ2kxXeJktaSMSzLB6jd2djZzEfTuE817rT2O/zzfjv?=
 =?us-ascii?Q?aRg1XhgBAD8vTVnHD4bZ3LEh1bhurDV+29i5+l22S64iBOgRLvHvjSFPndHY?=
 =?us-ascii?Q?/nspIvsrZSMRBhF8zldQybBzSp68wZf2AqlsDQjM0IVHpoifEPjnSQMstoAQ?=
 =?us-ascii?Q?0KpR3v4TEH+hE0LFYYzKzX75QbkeIMb/cP9GStZmZf1xxqflTjvAVGL9qPfb?=
 =?us-ascii?Q?qE/AMz+Kz7aCfhbn46A9OBtIB9ZZ+GBzef5PtS660qmYJduWGkPOh4tv1OYF?=
 =?us-ascii?Q?qBmEh1J4GZVTUpq8izy8yHO3jaWVEsl4JGjMY7GUu3qRPGPfXxUHaDkKarvz?=
 =?us-ascii?Q?yuP+SZ6P7yFGb5u8lQVwVYIDq85EtYrv7CgRQcFy67huTl/+xHMIdqLoLO+v?=
 =?us-ascii?Q?aSgMyw2CR8jHrTRynb/+Z2i9NMAYil0M0aKMmNJhrmz+tODci7b0UeguZkeB?=
 =?us-ascii?Q?IaJWSBa1cluKnyXzFGnHMctou/96lHZJrNbE8DO/nbMLZIk8/Q44Qlu7Y/G0?=
 =?us-ascii?Q?1Uk4HOZ2sVdS/c02z1biY2/p/tZverCi7PGfIz9MOqk1tjdx8wAl3W+Cwf8R?=
 =?us-ascii?Q?rA6fcuSdG/yemXddlSzfoEFHdUQegPQ1afl74eBIrycwNuSps8MSZ3vxyRTT?=
 =?us-ascii?Q?GLHakQ3jskobs1ozxMcUsjvkUbLo/8sYUso80JHiTs59abxGkdIw/h78eIo0?=
 =?us-ascii?Q?2zlpD1rLcbv5+wgk778x+7+zJOz64mx5Ix85qnD2yG2mncrjCF8B7kEGr874?=
 =?us-ascii?Q?jeRY1pAugmj/P2V/8yvpeMFKHUr5kuV8bwzU8QqYz2JeI9bHhOwymPxl+NFl?=
 =?us-ascii?Q?9rLnaJ1eKyAJ/d29ytkJ3LOqW8MyBOX2O9RdMJ3M1nrFeCUrBuBdcCREg2lS?=
 =?us-ascii?Q?d6TgjiacY3FocpxjrOzmldxSAGYuETuZn3eNPhHZvfwpA7lGx4pjnAD3z6GR?=
 =?us-ascii?Q?TfcgKic2zldJpgaDjKJKwOBuYW//ELrMN1EsBNKAOTL5yX7WzncuBFOOaj1i?=
 =?us-ascii?Q?X0BvaCHQ/HxgVcR4wN3pDxSqdHtv55Fq4Nxs2ubR2Hj9UFQcmMB+lwEkIcPf?=
 =?us-ascii?Q?pCdTRpOlfNj62PUffnyry3ETtNxqJ5BhbnlUDEqk5lh6Br+rbo7WKkx6qb6Y?=
 =?us-ascii?Q?a5Gcs15iSpTmMzae9Z8F481T2g+VAfdeGoV0bpeYbPKj3dnp34olJAyX16Zz?=
 =?us-ascii?Q?NXnNbUg/EKMA4EBjRd5k40EWDh16AuOrp0E0e/l7jk5ggL829ffyYh1f6HtE?=
 =?us-ascii?Q?c4OsxEv6jTho6bbqdbUXumwQ151wmwz3B5uXQ1FqYnT8dHhcHGMQe7nwrT1w?=
 =?us-ascii?Q?4OpKfgI3pMKB6JHJ8cYL44yjP4gl6xVwhYc2f2s/2EDppvhdfYloaW1WosSz?=
 =?us-ascii?Q?R/eml+SOgxecoq9+Ph5Gtl2Qzj/dSLmzNHUtpWqhuKfEDhhogQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8L0slc3pbunPIsgybdBtDodk/F32LvbDX0izoVyQTPf5gAriHf1TP39rpVbB?=
 =?us-ascii?Q?jFeckCzHrWoKWhvEt/3CuzaeWDKGiJK4jSJTVqGFvrC5tm4WCTP4ilF2eZPp?=
 =?us-ascii?Q?qXkKbS1fvwB3FsqX8+c0PxBDC2hTcBwxKBfEbjItxiwuIIeDz+OWqvG6vg2b?=
 =?us-ascii?Q?P0oVQx9JfYkKwEOG7TnOe9gNkqbEKaezbz5DB+ew6pJriS4ugddxF6ZnsZJ1?=
 =?us-ascii?Q?JUYxyuLwY4FYObPDLXDUmB6n55BLvnOhTeyzrAGWHQVSCfDO9085CiWAgO9h?=
 =?us-ascii?Q?37qeiOvQcMO8CrwRJ+OExftXKXoeeIV1vJe8O+4+0oBmup56HgRYb3eLKcha?=
 =?us-ascii?Q?5gPfhjfoL767PS8hSauzshUVjj0zR1W4o+TFLLDMSrHMBnUIjhLmAk1GIKq9?=
 =?us-ascii?Q?Ff3cWDqT56Cgdxe2wIcPVSrKwSgwPFFSR6krogvmCnyIaKFvwol8dAlI3kTB?=
 =?us-ascii?Q?ZtsITbLa7x0z2GQIsw2xocbWYPk+Xv+IDkl9uvUFYPml+iBO6e8r3UODyIUo?=
 =?us-ascii?Q?O3LNZoP8kegdQ+KVG8N/g7PG91YDGYR5cLSFovyVyyxGU5dGCyjRX/iHWbzs?=
 =?us-ascii?Q?sh4xAY0CZfOXCiFj5H7wjqKHd+XZ7DKU73KBgB3s0DW2zF6MrTsAeY+bFvnK?=
 =?us-ascii?Q?itag165/sCnSG4bvgMXNZzCV+niXxtRhNlo9vXms1YKJWnCfjKYOhHfyu0KM?=
 =?us-ascii?Q?nxsvGPi3rR1xA1n2TU6F9SU0Na2eiVKvijHRNlSLC5KR0D3MXFhDaBxzpPeb?=
 =?us-ascii?Q?EEvfyZqh16hF+bCqNrBRL/Psn852H6zfD+afkOEQjTJMKD1X+cgPkrn6JCnx?=
 =?us-ascii?Q?/FnazOpx+lgwjtKJQptabUYlmyx18sHV/1aZTGBBzGV+5W9SKhvVpeedmQH6?=
 =?us-ascii?Q?M4/pE01itq6bIV0aTYRc+oGnnolWsqKtecYpTdLg2uCVcbib0s24BqqReW8D?=
 =?us-ascii?Q?VCn6/k5WXxVlsljlDxzZF48m4xH/ByQ7slhsWrfHqnnpvx9Qckx+JBDx3Z4S?=
 =?us-ascii?Q?BIh4mENvBfpwojSd6Xi9okvZmI2rlDS3nafuYwg+a7MYrRD4J21GqFovx7fH?=
 =?us-ascii?Q?ZfQ6dfqdQa712CQZ+1A8QLZ703SP7W9wTCdAtJ+BTuuM6whBbSRi/bZINT2l?=
 =?us-ascii?Q?V42TtoaayBxuQX+3IAqp3/GC/pAzDoIE8XT3xjGB0gg48QdOkGR3wGApkh78?=
 =?us-ascii?Q?DfyMhepd+VOpv05GeDRm3EFUN0dKiWkSqqVvkmoNbUVwVdl0YCBCzIxOzmWv?=
 =?us-ascii?Q?f+smUKtX7Zo9UXBAq+WViSjCemeLoKur6EMCgE2FioV4cA/Du98PcJeIx9NH?=
 =?us-ascii?Q?KM5VoyLhq8HbVEZNDar+zAvBzYVjuHBxixM08ZyLkZL6FdwCjnzqinYAPhEM?=
 =?us-ascii?Q?0z+0NG6+LTX3toz4D/LsGfUneBsVUrpvvLPuINTGSnTSbv4Kl1XOZs5bqnG1?=
 =?us-ascii?Q?/nvntLLF9j41bnmixFCNfumCTguX6kiv+6yftkE1sEnQP+dQm4UAud+BJiZj?=
 =?us-ascii?Q?MbYfTXO3HM9g6rY63vRup9f8jMbwdDXdt+hjF9KSnBeLny6hX81YGf9kbnSr?=
 =?us-ascii?Q?lFaSoyUQNXKUqDpqeiLP6Xhzsixa673fMwWVWvZ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4116b097-9e64-48d3-5525-08dcabc24027
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:23:16.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iE2hLPq+uGvg0tfNRNPJXRwpEssF2nGbfXX/w6KQY7wODG+Dl9eA5gFc/FYD3NzJJV76mQgz0o3u2pggxUmAIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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

