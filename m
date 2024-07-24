Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E993AEE9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9242810E65E;
	Wed, 24 Jul 2024 09:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RIOiPjEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCFA10E656
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTyfqcofBoU9Cebz4aoykoPpkRwtk9kovMAAf51k9vf477O6n/mJ1/2Lvjf88oESEFxbkl6tYhaQDBX/A9xw1D6JRODOPWAohsLqJDeU389aKpqum/KpyDzMzSO00q5oeZMhJUt5YsXYenib+daOWhqY9eIIAmKOWZ9WfsJyQGJf9jvFso5EiLf0qFAy3FPEMoEk+VkTfa21XR4q9Vr6KWdU2fMNvYrDHpykzhRhQOE4CfxwPKEW0qQ6ZZ3BkBNPH9/62DSBXYJEqIh2qkF4608UppHAKF4IPKfUw+i/7HoAfZCAzQ8uObYIOSnOeidlS7adxQSenZlhsPSVH6HO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iO4KTdHRWS9Ncrq51Mrgoq7w/eG8pXC6LZcgSS6xFE=;
 b=FJamp/p7PZq4kV52Pz6gpSD5HxlFnIdCDx4SdBsWD6URxg3ZD3A0qyR/g1+pFsrlv2/dcGUIEzv3oaos8Y0gO8LToqJKwLGW2maF/bBQFswxXRifAvo3gVSADpLbAQTHGDPcmv6IEAjvCZuFC8W7mwf3kE6HrYtLt/fwgFJHQJ0FGoa2ePNyEFRH2xc1d3GB+WjcIgKOsNzRkABRZ6LLjIVo7hSQ7v0JaYUzqy8+ypL6DSil3AJiqMhqSUTl/fQTwbEWwseiOOdvilP5uH0mN/mp3QkV0pwBXu8uEN1mgdjAv9YLjOx+1VM9oUynlraZkl/43W5E9TgUZ7prEAyTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iO4KTdHRWS9Ncrq51Mrgoq7w/eG8pXC6LZcgSS6xFE=;
 b=RIOiPjEtP5ymxE4qzncWjDE5Y0mb4Bb7nbq0RbWjUit+Gf+Bkrlp40a6/1m1m4myc82FXOdyy8SPCaNOtYvwZ+aD4iIYLNjAYPzm+8mDK87nE8w2km4ZzD/01qRyNuOzRiy6NxUDVsNMlSt3UnrtERImvRhVatrdJ9Z1WWnT8WVowAtrBSLyGYuqWC5BGCxunpHSso8xOFjKo4FYu92Jwt1PXt9AJBYb24lQswVsyoIW3r4iclvv60SqzfH5KMIRXP2yRZVnvqSYu+tnBTxHzuvHM3eSDud2Qmd6AecOMQmPAjjTkCNC8Q7XYb5fW02jZr1VUaAiocvDgxH+ra2P+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:23:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:23:02 +0000
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
Subject: [DO NOT MERGE PATCH v3 17/19] arm64: dts: imx8qxp: Add MIPI-LVDS
 combo subsystems
Date: Wed, 24 Jul 2024 17:29:48 +0800
Message-Id: <20240724092950.752536-18-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cd29818e-ecd4-42c4-f423-08dcabc2376d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HOX0vKBhMQiutUW0fzNddV+8PWWwDrxqiXM6kU+bBm47aiJWhDMDoIl/zJSp?=
 =?us-ascii?Q?tnGBphj7KFmyZo5nXxTgzx50loc6WmTiV1fjNYTZk4fECZOvpSPLOjK/Ik0F?=
 =?us-ascii?Q?qaH/p7dspCBKlCGtdk4UndJEaK5nUwSNTuODpU1xFnl42/Zg3eImTJxwok5p?=
 =?us-ascii?Q?lNvrvO2sH3ObYtENavSnXSalfUdsSD8+OeQ3fF6n8w/p/TlAAYwDQiaYssu/?=
 =?us-ascii?Q?QD4usFMYMuW53/uOq5/x3C8PJDVOoMfSeSyYDGBqMiBFJZUOp3iqwL5611b3?=
 =?us-ascii?Q?2Z7VhRovteD3WtIOPdt8tQJ4E0LFK1oCLgHyvYbSOnUgUjR0aqqNliw7vZpn?=
 =?us-ascii?Q?lph1/0I7UZbpQV40CdG1tKOT+hFocNJwBt83LLD41QJTuJS3MQMJF9eN3JTL?=
 =?us-ascii?Q?bCVX0O9Qnb9iSKX7Xm6sy7PGxeWc969BuTq90lSvHaLrxsc40V2JcMphpMWz?=
 =?us-ascii?Q?WCy5m0EayXnbnXjEbfp7I9fnt2aJRQozX62AVb1Yz/4ZjoVT1WdI9cZwvYEK?=
 =?us-ascii?Q?Bf7YRn2m/GlpIHahx0RfaCvAn/wcNF3LyupB9thkmfuxnm9sEgR+d2q4V521?=
 =?us-ascii?Q?fWzH08l2ZqKj7sl3Ekn79hdf73vliH7iRXIF+LOeI2ldqGQCermb43J0erLp?=
 =?us-ascii?Q?pR5WBmvTwELBZw64j7qL9YlTi0HiqO8HLSBWezMsBMVN2iqGoeClakkMX5Ex?=
 =?us-ascii?Q?f7xiH7+p0fwUyRNBTtkKtKFuAHWDBgFVogMaTreI4i9vwQB1muf+WIV8ToWf?=
 =?us-ascii?Q?855V997mq+eRSKwEBLmM5FEG1ux40tnUGvvVxIbLsE0pMTLXJU1G9MezkHCX?=
 =?us-ascii?Q?gR3RE8BVmlTfNBBG0UU9COTPeYQ9gR5YcefHvrR/9oArXllLbhfU9ZlwyJQt?=
 =?us-ascii?Q?nB7jbnUpAJxwWRkYqo80NuQiWCHYCkAAvhRykx7c9WXNYadi+ihA6QGpF+9s?=
 =?us-ascii?Q?z2055LACBGL8ISg3VheXej/PX/BKLJNnjMwqeE29ZJSWLNMF98ts6+12QC94?=
 =?us-ascii?Q?4bb3KJxNlNzNRoFRYtbPFSOI2kKErJSLD+/xpc+NJC7Tz7xNAV5lC8hJ8lHA?=
 =?us-ascii?Q?KZzItLdgCQAhJTIUzunVdx3mOOoTOYFo4zziwM2asJu4ZdSG/4oKwcydAC91?=
 =?us-ascii?Q?LziMCgj7fz+ajG6B2BrQs5cUOI3PUqKns1KjsiMN38buZO9ZqO43CpBvE7p9?=
 =?us-ascii?Q?QIRwYpdFaOlFYrhWm/SEpzsaKcJ2maYaxKJp/U+5D6HK4uAaD1yvPbK64YFR?=
 =?us-ascii?Q?vi/0xySMMBRhNeQGDiCYF+ykzYnYe9KHUSqqku05ovp+ytXhr4lN/ssudJ0A?=
 =?us-ascii?Q?RN0NQNgNT8p9eQHtUjUU/bnI185X+iwtYnnp68ENpDEqzjqgufzRVZuUZkBZ?=
 =?us-ascii?Q?UPmPNEJAp/WGhngpbM+QJ+lPrCAkFU1URp/yDHGjnd5FIuGIsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWABvWmbZRQfSRDJgMpzhdMTtUvm7jbjJFh3KVo2SXMQS3rLcpwYmcZQ/tRk?=
 =?us-ascii?Q?bIp9WLZXCBHt+bg9Rh/JpS1Ziv/+GtslNtK4fWLfRQZFtWrwe5Luw4ZRaAOI?=
 =?us-ascii?Q?ZRroXnmqAI/GtJwlbKAi+RZO4KKrLosFovSLDEjLXviIxocpbH20nwc0R/Dn?=
 =?us-ascii?Q?rJsfUYXwVn8x3aZ+tRC9OOmpDp1MMmjt5j3NFsvWU7GEjMoQS0stZlU4IEL3?=
 =?us-ascii?Q?rVauJxxj/JebyAgNlsG9mm66VtrQu87EH5V4s7QYTteJbAGXV294GntiQIgG?=
 =?us-ascii?Q?7Pc48foCWHQfyZA7LhWLAzVkmQoYx85bXrFVlnMb/QXzreiSl6U7RV7LlTDY?=
 =?us-ascii?Q?qp+vJC/QeybhTsz9Hp9f2Y8MoWT434IGyvvd0sbD95HtwlIsoatgO9BsOh5W?=
 =?us-ascii?Q?ircv4VpoPprF9Fh6HNHk4Tpb6CwNXZP+n6MHZZolfLLvNUnKwypAk8Aabu/r?=
 =?us-ascii?Q?OTMJRKlvuZXSs26JzStq8Unz49fOVWwGKVbGjlB9A+GPpZzpFIOA0AjYePLA?=
 =?us-ascii?Q?loeO0BHHWsM1LytDj3kqNdt0o/jtUvWsj5hfVAbO4sc1vJRQ+KD/pz+CvStX?=
 =?us-ascii?Q?sDSyYRvwyiiyiJHcx9p9MNciT+DvPASG+ag55NZGmTaHAM2QIhSN2AdEv3C9?=
 =?us-ascii?Q?rJilYzA2hfGP48ujChBvCMr+bvWQlu1rKoxWnNlAjTzQL2N/eHvYh69tlFnr?=
 =?us-ascii?Q?CH5OWXis5T9koo8m22WEPK6A6brpKMRB54vD+cJgH4i/tX0nb7TnGewDT15z?=
 =?us-ascii?Q?jBRf0VSXks/BpKLNH6+VwTnFEbpvCJ4ppf1W4xuobAqJsRz4vE5WzndnAxKO?=
 =?us-ascii?Q?24WXiVOtSuFu2ljd63GZD9SaoWlK6hmnSdooWFxyMlFOE6p7GmO7cpGMScMJ?=
 =?us-ascii?Q?mqUnq0+/S/27BwPeMKC4/4O/DrzJP6AZXquZ46LFg3wrHVm3CXj7JmNFvMNd?=
 =?us-ascii?Q?qtsE1u9SvFFZmv9TloRYSEr93H5zqj55lbOZxJhPDAobQDxdS9kgVlSiSxbm?=
 =?us-ascii?Q?O+3QnZqDVhcCI0FHSHQJar5oSgEzPkQe2NR9H4zwz5A26Ig9nllKwqEvKLad?=
 =?us-ascii?Q?RNU0yviMvo8EOKbFMBjIMO1eIC+miRUATmLCFpFfL7rd89u+2Nh7Xp/QoNyo?=
 =?us-ascii?Q?qblVg4yqAMl7Lp+Bqfa7ymzz/Qzv+mt1+GsE3uC4Gn3Wd9qcEQ7MOtWIpcUa?=
 =?us-ascii?Q?HjxxhmqSlikK4Vgzd1oG8sAYcqzJFmAkmEztGEQZia9kL5ThDV4Z12jMEvx+?=
 =?us-ascii?Q?MK8CGigXi+oT/g5UDbxOhT1JfwQDklGD/11vhS0EPOfZmKLLXVDsJcrJCuSE?=
 =?us-ascii?Q?IuIQR/KZWrrGLy+3O7cwIZpeVWsKA7Zo8VTpNP/f39quRkJ3BtVH2OQGd1kv?=
 =?us-ascii?Q?eefxHvdJdbU/ovg2QKoTS5M4yJzprGJZ5LXbEYWRjvSJndyHK7KDGejHHFEC?=
 =?us-ascii?Q?dABixd4aDEqQfkslbMzoAXIdTIygNBeO9FREiGIpZmVUh3+OsT6pzsdvlADJ?=
 =?us-ascii?Q?u49ar5AXajyXCcyS2P5QzgeP/fkP8SM1k3zShdoS/BbyUiR8WRAp7qcZf1tI?=
 =?us-ascii?Q?KUmVpD+PKfE/z9Dh4DFZgnEOOndo6Ttz3fhSa/L1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd29818e-ecd4-42c4-f423-08dcabc2376d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:23:02.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffYsvP1afGf/rDH98Kf84UurMCPVmYo+rTKE2LN4zOQdQwI2vtuOLa3Fx2Chj9Qft5gfCmadL0WavxpaqakJPA==
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

The MIPI-LVDS combo subsystems are peripherals of pixel link MSI
bus in i.MX8qxp display controller subsystem.  Add the MIPI-LVDS
combo subsystems.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* New patch. (Francesco)

 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     |   4 +
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   3 +
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
index 299720d8c99e..94c46a20597c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -152,10 +152,12 @@ port@1 {
 
 				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
 					reg = <0>;
+					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
 				};
 
 				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
 					reg = <1>;
+					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
 				};
 			};
 
@@ -207,10 +209,12 @@ port@1 {
 
 				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
 					reg = <0>;
+					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link1>;
 				};
 
 				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
 					reg = <1>;
+					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link1>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
new file mode 100644
index 000000000000..fa7e7c33518e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+/ {
+	mipi_lvds_0_ipg_clk: clock-mipi-lvds0-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "mipi_lvds_0_ipg_clk";
+	};
+
+	mipi_lvds_1_ipg_clk: clock-mipi-lvds1-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "mipi_lvds_1_ipg_clk";
+	};
+};
+
+&dc0_pl_msi_bus {
+	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56220000 0x1000>;
+		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		clocks = <&mipi_lvds_0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+	};
+
+	mipi_lvds_0_csr: syscon@56221000 {
+		compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+		reg = <0x56221000 0x1000>;
+		clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+
+		mipi_lvds_0_pxl2dpi: pxl2dpi {
+			compatible = "fsl,imx8qxp-pxl2dpi";
+			fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+			power-domains = <&pd IMX_SC_R_MIPI_0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+			};
+		};
+
+		mipi_lvds_0_ldb: ldb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx8qxp-ldb";
+			clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+				 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+			clock-names = "pixel", "bypass";
+			assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
+			assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+			power-domains = <&pd IMX_SC_R_LVDS_0>;
+			status = "disabled";
+
+			channel@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				phys = <&mipi_lvds_0_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+					};
+				};
+			};
+
+			channel@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				phys = <&mipi_lvds_0_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+					};
+				};
+			};
+		};
+	};
+
+	mipi_lvds_0_lis_lpcg: clock-controller@56223000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+	};
+
+	mipi_lvds_0_di_mipi_lvds_regs_lpcg: clock-controller@56223004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_di_mipi_lvds_regs_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+	};
+
+	mipi_lvds_0_pwm_lpcg: clock-controller@5622300c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5622300c 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_0_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_0_ipg_clk>,
+			 <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "mipi_lvds_0_pwm_lpcg_clk",
+				     "mipi_lvds_0_pwm_lpcg_ipg_clk",
+				     "mipi_lvds_0_pwm_lpcg_32k_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0_PWM_0>;
+	};
+
+	mipi_lvds_0_i2c0_lpcg: clock-controller@56223010 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_i2c0_lpcg_clk",
+				     "mipi_lvds_0_i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0_I2C_0>;
+	};
+
+	mipi_lvds_0_pwm: pwm@56224000 {
+		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
+		reg = <0x56224000 0x1000>;
+		interrupt-parent = <&mipi_lvds_0_irqsteer>;
+		interrupts = <12>;
+		clocks = <&mipi_lvds_0_pwm_lpcg IMX_LPCG_CLK_4>,
+			 <&mipi_lvds_0_pwm_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "per";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_0_PWM_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		#pwm-cells = <3>;
+		power-domains = <&pd IMX_SC_R_MIPI_0_PWM_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_0_i2c0: i2c@56226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x56226000 0x1000>;
+		interrupt-parent = <&mipi_lvds_0_irqsteer>;
+		interrupts = <8>;
+		clocks = <&mipi_lvds_0_i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&mipi_lvds_0_i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_MIPI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_0_phy: phy@56228300 {
+		compatible = "fsl,imx8qxp-mipi-dphy";
+		reg = <0x56228300 0x100>;
+		clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+		clock-names = "phy_ref";
+		assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+		assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+		#phy-cells = <0>;
+		fsl,syscon = <&mipi_lvds_0_csr>;
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_irqsteer: interrupt-controller@56240000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56240000 0x1000>;
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		clocks = <&mipi_lvds_1_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+	};
+
+	mipi_lvds_1_csr: syscon@56241000 {
+		compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+		reg = <0x56241000 0x1000>;
+		clocks = <&mipi_lvds_1_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+
+		mipi_lvds_1_pxl2dpi: pxl2dpi {
+			compatible = "fsl,imx8qxp-pxl2dpi";
+			fsl,sc-resource = <IMX_SC_R_MIPI_1>;
+			power-domains = <&pd IMX_SC_R_MIPI_1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_lvds_1_pxl2dpi_dc0_pixel_link1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_1_pxl2dpi_dc0_pixel_link0: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_lvds_1_ldb_ch0_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mipi_lvds_1_ldb_ch1_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+			};
+		};
+
+		mipi_lvds_1_ldb: ldb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx8qxp-ldb";
+			clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>,
+				 <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+			clock-names = "pixel", "bypass";
+			assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>;
+			assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+			power-domains = <&pd IMX_SC_R_LVDS_1>;
+			status = "disabled";
+
+			channel@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				phys = <&mipi_lvds_1_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_1_ldb_ch0_mipi_lvds_1_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0>;
+					};
+				};
+			};
+
+			channel@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				phys = <&mipi_lvds_1_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_1_ldb_ch1_mipi_lvds_1_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1>;
+					};
+				};
+			};
+		};
+	};
+
+	mipi_lvds_1_lis_lpcg: clock-controller@56243000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+	};
+
+	mipi_lvds_1_di_mipi_lvds_regs_lpcg: clock-controller@56243004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_di_mipi_lvds_regs_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+	};
+
+	mipi_lvds_1_pwm_lpcg: clock-controller@5624300c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5624300c 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_1_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_1_ipg_clk>,
+			 <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "mipi_lvds_1_pwm_lpcg_clk",
+				     "mipi_lvds_1_pwm_lpcg_ipg_clk",
+				     "mipi_lvds_1_pwm_lpcg_32k_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
+	};
+
+	mipi_lvds_1_i2c0_lpcg: clock-controller@56243010 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_i2c0_lpcg_clk",
+				     "mipi_lvds_1_i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
+	};
+
+	mipi_lvds_1_pwm: pwm@56244000 {
+		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
+		reg = <0x56244000 0x1000>;
+		interrupt-parent = <&mipi_lvds_1_irqsteer>;
+		interrupts = <12>;
+		clocks = <&mipi_lvds_1_pwm_lpcg IMX_LPCG_CLK_4>,
+			 <&mipi_lvds_1_pwm_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "per";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_1_PWM_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		#pwm-cells = <3>;
+		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_i2c0: i2c@56246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x56246000 0x1000>;
+		interrupt-parent = <&mipi_lvds_1_irqsteer>;
+		interrupts = <8>;
+		clocks = <&mipi_lvds_1_i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&mipi_lvds_1_i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_phy: phy@56248300 {
+		compatible = "fsl,imx8qxp-mipi-dphy";
+		reg = <0x56248300 0x100>;
+		clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
+		clock-names = "phy_ref";
+		assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
+		assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+		#phy-cells = <0>;
+		fsl,syscon = <&mipi_lvds_1_csr>;
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index c4e6f1a3ac0d..5db458f1bd9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -55,6 +55,8 @@ aliases {
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mipi-dphy0 = &mipi_lvds_0_phy;
+		mipi-dphy1 = &mipi_lvds_1_phy;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -350,6 +352,7 @@ map0 {
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
 #include "imx8qxp-ss-dc.dtsi"
+#include "imx8qxp-ss-mipi-lvds.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

