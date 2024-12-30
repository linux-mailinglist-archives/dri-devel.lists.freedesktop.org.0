Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C09FE1DE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC0710E457;
	Mon, 30 Dec 2024 02:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZOjKq+Sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2079.outbound.protection.outlook.com [40.107.249.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BF610E456
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnptvGHUCeejag4Uwr2awyj3kiJSyfCqWpZdTf/vlCb9TZ5NNFcogQf5UR2viuCrvUTYY3E6tCsO14NQ6m0ebbrNZkHNtpgYih34dAUMpkz4GKm4P5tqyt0nMTwGccE5ZN+JLrc9/Qtkm6C4DJ5u6ptLNtLGr7cI7Lc24+sB4oKCFLU5WNLZW8lSIxtlZenXjOAT+GgfUy9yR555M5EC9HtmWM1kZPM+enBXPyT7mT3NNmGTUWBGXZ5zR/QcEPS4OUiosCTQO+VsFOdAijMWtFr0DVY8TPATuUMD/IgZOMFqXsOKQzhpGjN9IRV3ON8buWxfUyxGLURZo7Qp81J8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9N4w19y1sREHbhdgEHqpTps0zgEguVIMrtJSJ57Sxw=;
 b=IBCY/ZJ16MuN7r/QXXMVYpFMv7oadqqqaXCs3KSYMRyrPB8/9Z8iAVutXhK/baMuWXriNoVsaw0b+7NnVP9KyEuaOkNLdBP1iDBJ4EX//383mIsfwBA+MtjPNIkGsVOWHm5SqTt7Ip8V7347ooCzUVAFtiZWIiLxhnWBFjAcunmA/6cZk+nlujcqDDXJ9amVESYq7KCso+aL+ecePuzWK0El+S6X4usWggUWU7M6a7VFZ5y2EDrLky5hc8OoU8Mf+YCyHpyEUP5JlZfjmnZNjOJFsY9vOhCQIcvU2QitHEtI3lLxunB+dj9W6UpL0OfzJJeI1gjZ5Q82yQc6sdNT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9N4w19y1sREHbhdgEHqpTps0zgEguVIMrtJSJ57Sxw=;
 b=ZOjKq+SdoATNFORue9i4LemLnnF8YqkPbmAkCRLoW2hyUUkzQvedTWZeWZhD6XUx0/jV2GpnlaKjpTfdlWgACV86wqDFuI/f/smhZyh7fH5ujhElzVIq+C10dyImctZkLkGUpXaMSoxcvJ58Q8Px1unkRR67zjZOgUtRE66igMSFb3ct/1Wwm/j6PZD/GB8octPYNwC6Dj/gIyTYeuhYYuExJJ+4BhEoCFYuq/eAl8/PaB5bPylwe9KV2077c6lnxwEegga1XWdEqUkNX7lnwhT6COeOMrSYhfKa+Guhg8TdweGW8c50gnBfJSWv5RgL54r9b3jIqL1V2BCO4XGEgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:14:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:14:15 +0000
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
Subject: [DO NOT MERGE PATCH v8 17/19] arm64: dts: imx8qxp: Add MIPI-LVDS
 combo subsystems
Date: Mon, 30 Dec 2024 10:12:05 +0800
Message-Id: <20241230021207.220144-18-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 6519beef-dcf9-40f1-7c8f-08dd2877a8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?90LpV1d9ay/o6ctthk2clofOO6WBi2UNIaRRJt28A9M4zZOFR+VjWNsnElEz?=
 =?us-ascii?Q?k+0ENt/ZNSxN83vHoyTnxOgFLLdAJDeaDBwqo40Lmb35MNwDmZ4msdPepk6Z?=
 =?us-ascii?Q?CAJ6ia+IAWyc4Zgi9FkcY4YFrLkDO2jx1BFf3xSg0kOQT0ut2WUI/GIpfFhf?=
 =?us-ascii?Q?t29Kuiof+H8/ApOGRbPrPOfzMfPkHk00s9bIMZEZXV//jF+z8oy4wJStM4Jq?=
 =?us-ascii?Q?CWvruoovlwckkKXJT4woJUmgKFw9TNS2RAnL7nox/uUbPNL3Zo9I2dmVAu4v?=
 =?us-ascii?Q?MAqmCbY2ikmxQ8VrHV9yOE78bBVX6qpBqNqsGQdEVOUvLlLNb3uXapls08XW?=
 =?us-ascii?Q?OlzX/wXn1egoVmq1I6tXpjEM/+0tnAayQ7Xo/1LNwtV6TylO7bQ9iFCK24g1?=
 =?us-ascii?Q?i5qg8rW07WSu/qYKrZzDnp/cCUdjn7RKQG8FT2jDB8t4APLhn9GXKhz2MXfm?=
 =?us-ascii?Q?vi3o64XTCGINyWLsAPQDJLZuEdUCiigBfBIfi1PJJG4wRgjb7HbuPv2HeJYf?=
 =?us-ascii?Q?RYx08ebRw00qvFo7LDO2tRE2kCJZU76hvKFAnvSOuNj66KrwSf28TC8oYOXh?=
 =?us-ascii?Q?vlTs1AbYtshg/vkvAc+aBOXK7Fm0bVR8TAO0NxIWspAqGDjy3EpNdNO8DAya?=
 =?us-ascii?Q?tA/Bk1snqO8yiISZMg0nC3lQsawLn5ncKP2mNBxRVBD6GsZf2CyZ5scnDPCD?=
 =?us-ascii?Q?H95XvWaj2yqrERTKYE7aAmmZbG8gacXQekDwALt9Ss7grYo6OlyFMiCaKi0h?=
 =?us-ascii?Q?TPNTbBbX7Xsja/aJJpmXbjyoDpKG0R3XmM28+WqRv1VJk0u8gNJz6k8XNd9t?=
 =?us-ascii?Q?CinYq52UP8aaFD2LmhKLkjb7nJo/7610oEaHFgE5r59ZtODfMjI0KaLYvrKP?=
 =?us-ascii?Q?zI51nfWwPAlM2yMlnNpsWPiMTOn5Io/TIm/Org4AuJReO+diwRDVvFr4TQwy?=
 =?us-ascii?Q?hQP7Cip4hEw22OFUpv2PWTCThIBxXfk03c/ewDan70bV4QdPv31dQ9XpU+I+?=
 =?us-ascii?Q?LOz3DncjrBPUUS7Xkp+G5suzB2JdBTWUWJU769bSKCh52HWRE197aGAXmIRY?=
 =?us-ascii?Q?eu5RpsNb1+AEq5Qj/jnySimLj7ozwT/gAJw8s6iCksU01Mi2w8OHdT72wqii?=
 =?us-ascii?Q?csTdaP7VWIoTKTLCBUUxK+aRrTf6ezJBJXa8piyi1osB1xX0CiiwNTAFrnD+?=
 =?us-ascii?Q?oMEB1JOXenqUFobAhtaDTZM/DeA8uLeGB3MNy5LexvYu4R9xf4fTzkamDC+q?=
 =?us-ascii?Q?2HUPGh10Lh+VWQEPg+QRNExzubxWOTS3SY0pHR0tlTa/uc+dlzRU66yFDM8r?=
 =?us-ascii?Q?YzJnUqyrY4aE4js7+dg4X7SCnC7l6HcYc0zQOb4vEL2GYFLzdnXjpGH/clOy?=
 =?us-ascii?Q?4GabLby0see3YgmLVMCD4pfdOGvJ+hBGIi0bmxrkoasGQidYOqxlUVPaGcA+?=
 =?us-ascii?Q?mA78hvfgYPxSmJiFzZ4tqO81Q6KHvb/V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3U60paFDFis/b8T2QTCqEcqb4UXyJg99l3It4gi972YmTrqsN+UqvjlvDXH6?=
 =?us-ascii?Q?0TaC+GAhAsf23Cbv+UTfIvqvAI4GWH4bM0KLvVI17hzAMXMJQaddhhLsi+/3?=
 =?us-ascii?Q?bKUHmnbyO0PI28vG/OoiUK383lXLZ4GFl8GPK6spAdHiiqIzP/MywA8kUWi2?=
 =?us-ascii?Q?LpzdCZzRI0T6Qova4dubda7ZXpVfKrqefn+zVwkOMQwu+l2mPBoC7zOQC2Ym?=
 =?us-ascii?Q?SPiYjGAaJ1Ss/DGqSt3+JJRfI0gW9iRz6z3mAZiYkVSPUfBi77NK5WKmegIL?=
 =?us-ascii?Q?VCZ6QnOPTgb5v6oAP57pSaZmc59To6xRD7RDilVNf0CMe/khiwQpGzgFzWTF?=
 =?us-ascii?Q?iEI5xvti1sm15DfhBuTtoDUjeI4DhRULSSvcDeGiGG461xDYWRUWXrfRU+Cw?=
 =?us-ascii?Q?FoUILCShXALGGrp7dwLfw3kUyeNQBkCIlQUTxU0kcs9sG9Tw+CJfIVHv6Yoh?=
 =?us-ascii?Q?kb568xsZ84hc3v2yd+jVd+TGPMliFrq2mKHEcVpMr7I3XMa1OrgHeRS6HQe0?=
 =?us-ascii?Q?W2gP3yBFeDhnHHOZxTqTQ+RzWxOIVboxntj6hjg++7cLxS0R+JH+jZVjNqLq?=
 =?us-ascii?Q?8nI5MyAvI5gkL+romTe6KmsgkIc0x4atuwpJfmBq4C44EzC11x3r+owpbquP?=
 =?us-ascii?Q?XxG/eSYJ3VkrV80LuqkZH38HySbHz0LpLGVDOXnNCGWVTxAKKh0fcjAaQyRq?=
 =?us-ascii?Q?LFiO/2Gu7/0lLW/D5WNprjeJaLkNoWRYAaKquCBl0fRn1omCp1vS75GuHiP0?=
 =?us-ascii?Q?qt5kkOQNSFbiAS+kf2XCnR9wx5OO2Cv7YzmtqVfC+3avKXgyvASmnx33nmro?=
 =?us-ascii?Q?+odCeP++MKz21pbt6h5Ca7tVA+BjRyyIgz2HX76wf0IZ+go4zsvh3BkSetFv?=
 =?us-ascii?Q?JqkT+QYWOdzpCMNvkKZSJov6ircbzhU95B3dVAAi9Q+V27gtde7KZpIOFQdk?=
 =?us-ascii?Q?tHcoFayALBfVWCCkzza4Xh3/N06XH3nb5JhclEfv1OxReFLy7iE7KFM6YzTO?=
 =?us-ascii?Q?C41Ocr24Cl3/2Bwis55v+W8hm4fJUHS2Ddq4QJCh5EvZHnjjUgBwsfdZ7800?=
 =?us-ascii?Q?2wK5/YzlUnOXFnIrNpHqLxVxZGJYafk7V9lCFG6O/0QasUFdjUU24VdzOPTF?=
 =?us-ascii?Q?3rfOhdh+0gFjSfK6LuOVn+Ojxs9UZQV6vbHkdDlL2JqWNNuMyy/Z5Bsvnbp7?=
 =?us-ascii?Q?6ruKLn4Lvaok2noZ7v47XzleiH1kpgOZ/xX96xUfBYsQeO9Al+2osw4OK84K?=
 =?us-ascii?Q?6//C3V1tQggFtuzEiyyVvjw3mnUfqrkLuZlKmPJn1oy87wXigYjYorqGVuko?=
 =?us-ascii?Q?BzHx4oLS3mh8osyIlgJxatZ2im2g2tgKaiaaLwKmuxIDYx1B+gNSG2wTg5lG?=
 =?us-ascii?Q?EiKwAhdQ8LdyI8bbfdduIWG/QF9D7L8joN86OjZifGJlktQe7+PzUSCX9w7M?=
 =?us-ascii?Q?ZQsTqRWXWOJxcWtCqFG4OxwHuf5wsHHk4zlshC2QsDus6fsoj28NAbBseea4?=
 =?us-ascii?Q?QG8B3bLinUzls6uf7Y5CEc3Kmd0AnIbyebriyi99GIRWGyExg65elC17Dk20?=
 =?us-ascii?Q?lT+bIqB6+8QizFBIZoahVrynzdAKfzvoy4ToYjM1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6519beef-dcf9-40f1-7c8f-08dd2877a8a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:14:15.4955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG/JWwHY6Hyfy6ZwkFsFAb4bf92LpqwLOGV0PRT2Hxllp5J07ytg1laRiDfRljRJy7mkcT9LirP/j6scseQMNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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
index 9fb4bac708a0..0acc93675a87 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -34,6 +34,8 @@ aliases {
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mipi-dphy0 = &mipi_lvds_0_phy;
+		mipi-dphy1 = &mipi_lvds_1_phy;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -334,6 +336,7 @@ map0 {
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
 #include "imx8qxp-ss-dc.dtsi"
+#include "imx8qxp-ss-mipi-lvds.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

