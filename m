Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24293AED8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE7F10E64F;
	Wed, 24 Jul 2024 09:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VvcUjnUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DA10E654
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuUlJk/JjZwBPr3lNCjTChTxkh0h+u0/XXHmA3pqg+TkxFhoIdkq2KlMbNAWH6LZELMHemhUDBvJD4k/K6VwsUMBEavMKACgxLUXWqr0nRHsfcWU2D2blSzhhWWEwJ/POcjng6yUWC10V0P/9o+lIIMon7kqJsoAIPp7Q3wApWBFIx79/T5hpbdWm0dTDFSAHrCgh64LbCmi6ITSlUyNbzOtgixpN/mEIXN69L6PnI/FQ3i3HGCYlg8qcKF4GKcRSY5vO3kTlde3dkb25YOZfI+iDsefcc9/Bo/q3dAa/mZ7hECDiG7lE2T2qWAU/ZXtedGu/bbW22/k0o8dyIOAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1qhNSCnve1tBGyDGuXrK5o2+LJBSaGG8NeztKRVlEk=;
 b=G38m7uYQXojv7g9J1OTcFUl8rAT45BxYVM6M0GF2GHMMocA06emoQE1kUimJsSKmJTBT8ay2KoIBrBbCt6JVGTsHjbXD6ylGsFFiZ51NXp1CwHRDIu5i8xIo3L/2zRtbIpEmGwIcqireMgev9DKDejsg27nHjZVbS7y7b69xFpXFk+zvv1t+uoJCsVDRUnYqGMfc2jnkYCFXruWeBbpjjqH1GSRUquWXvD7FdsWWX3kNO+kbzM4RHsffW1mwlPQYrqX3PfCOv42r0UefuqemfFJnFgG7tC3Y3HKzA0NhQBy8n/xC7R+S7zTpNU9+4aRDHbbpYdwo/EgwoBc9AAf1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1qhNSCnve1tBGyDGuXrK5o2+LJBSaGG8NeztKRVlEk=;
 b=VvcUjnUWpRnbjKj6Jk7LgF16z7WCtQ9F/0OclUSK1qoZS/9wHYO6QL/ftyrvF7sY/LG6DrXoYOkFLZq5Cemgwj4vbppjnpxB5quc1/9IcpbQ0cDaQNM100a2jyMMAT863xwg9EY8jdZ1qefi+UxQVSifRU6g/kpXB0gsGr3ozkRNOrNMEC/4Birild1ydaPRIwcol3tweBrzMK0rcLUyxa/5ExrP38qvTFCUg9F/XX7m0Ba35mhOOtQI/Iu1B3e2JvQHYFcwf+WA09Nm6jlfyDS/WVTSs6KU2vHDCk/LflmwV6e9u6TIdIl7dXa1wtz4TAMaxj1tEiXYfqJAGX2I2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:22:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:22:05 +0000
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
Subject: [PATCH v3 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Date: Wed, 24 Jul 2024 17:29:40 +0800
Message-Id: <20240724092950.752536-10-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a74ef385-4c01-494d-2ca2-08dcabc21544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2OtyO6IgpYvf6D0gwHRWh4hafI+kAfp0NWljGpinSg2XND1pLUA8u4fYLEvx?=
 =?us-ascii?Q?fLv9MVCh45e4+iJd6zmb6STN6sIC/rGXOEYkW4P2naUB7vjJiAsJUygWffx1?=
 =?us-ascii?Q?WXWP/yR9wPIPbqIoY/DspqTB+lSz2pA3pNyzUc3Ht5rXljwAg1eee7M6m1/Q?=
 =?us-ascii?Q?Bq5HaOAhKirngq+9Q+96IlWXPg1DGVDACLT5jB7A4rYM2w9UP3FfICwRaIfz?=
 =?us-ascii?Q?Sqh4ndWq6QXtkJ3SxdHFUdM8fNJ2kvrJSfPFqqU95jowjfZ5l96ZX8Tsapug?=
 =?us-ascii?Q?GODonH8UI+z2EvPLFyfpF98Z7VBo9Q8ZIMNzbnGIcrjzImQyoVftQLnTuyg0?=
 =?us-ascii?Q?qBS+yC4+ddnm2tGkHk0QN914P2+iptcVA3BLVsegzQbGW717SSZkRKAKfeEq?=
 =?us-ascii?Q?V2YnYEy3LhzFvsB8KgZmRvxrnVYkozZpumXQ+wrTvjjdXWoba2pqP4O5sDm9?=
 =?us-ascii?Q?jf/XeBHS8OnpvYu+BNkqgiuuECNEuiHh2taq5+ZUOj0msNODz7RRf6/FBlc+?=
 =?us-ascii?Q?T61frii97Tep74OZ39qRL4cB/zEvI4ELE1Deg9BGopQsYCSIwcC2xdkxSsy1?=
 =?us-ascii?Q?7K2qDMzURazOasbayUKGZ+ton+gIu4tO6N5UPgyxcyf+t+S0hvY4JwG4dU+u?=
 =?us-ascii?Q?s76wh01X50C1Kls5Qo6sUfHsssyAjcmMjhT4bc1gPVKE9+9P/fQ7q07K4vBj?=
 =?us-ascii?Q?aObXWk/tYZklvWdR1D5TkzPQ+kRxyQu21klXnjTuyAX8eQ4Q7yhlXKPga8Gj?=
 =?us-ascii?Q?O7sm+EA9hkGDlgDkbpn866j2cWkUg9Tojf+gq7Ae3YV9xiw/S0Yh+oDXxZws?=
 =?us-ascii?Q?WlDrZXm+02UFfGHw5IHW2WKV96c0zqa7I+7hIrXiWt2/w/FC8Mh+l8WKeQTV?=
 =?us-ascii?Q?HlHoikQZxwi17+bS0DQsonnlA8LGYPCXiDlb35bOzDHoC4RcLARW9b7s92Ta?=
 =?us-ascii?Q?+vl/2PZjMsrOxn7KXpCZ+kgHETUMhDVyS5pODdTraypf3vFWjZ1aEzQAfjm7?=
 =?us-ascii?Q?gLXk8bMebi1Olt+r+x6I/o0QCdr9dWcfmnb1Gc2+y0Ci2RKbJlnI84hYtQCq?=
 =?us-ascii?Q?RObIrmJ0dOVUM2a9f3K2nCwJqmTzlGm+5Hm8CmH4vrW2EdZepbtSa7A2tA6C?=
 =?us-ascii?Q?ZaHKfFPA+9eLBubfeTiO5W5V/MbVzOkbYWA1UBvEwr0WUeyq4MAn+6+u93+f?=
 =?us-ascii?Q?3MZrP8J5BrZgwrOaiRZ9CKiOQ2A7fJsei0IzibQfMH3MAxtjcYk4iTidgMcJ?=
 =?us-ascii?Q?f6P2v+PtsraF/75l0Lw3vMbZ3ycc30+PgBvuqFcWPKabh19w6UUGtO9FmPou?=
 =?us-ascii?Q?TruKGS48VLBAcQ6dn7eiRLiKokWHasSvN8ziU69ytUENIENZ6UV7ZOnxWN0Q?=
 =?us-ascii?Q?VazazawStVdhFYv1pxrvH8MSTypneflmepw98pGRLMCerw+etQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ouvy2tB4AB5p2taJB358yjbGxVKLVyqBja4z4gZMmYd3hT/ZK1bNxw03JVxy?=
 =?us-ascii?Q?YVU+z93VOgYBOc6mUTKn0FiICzd2rn17JH/DzB1dLrAaBJCs+oYdaOSlSYlz?=
 =?us-ascii?Q?LrNC3kgZJVXDdLCjctnsZZp/BtMRGJD+ueg5Lb2tBpwd1Ujt2TfyWEhQbBrW?=
 =?us-ascii?Q?c5vqWMn7zmHrT65rOhqlees4pcq04c7peVY8jnf2TKm45SbYbmxi2GTpbTV3?=
 =?us-ascii?Q?oD0cLGUFbeWq8/Tjq1DhRGt2SEIMYJ+YAs5cpHoEYRnytxgNkYrgIeVEQ5t9?=
 =?us-ascii?Q?zAK7/pfSJNJOn4P9ttq7bK21UCUdKspt4J91juL9IqoWPFGUVIiDo0YvSFLQ?=
 =?us-ascii?Q?xSK4MIjGdXcYHGghMBI+zYBSAZG8YxlqM0ZTKEAUzL7nEmPcbxFHpGmijgf7?=
 =?us-ascii?Q?5AvJQLYJrrza9chs++Fj8i1r+g4NOQuX4H2GXDyY0wsrMd705ypR31Rch4Kg?=
 =?us-ascii?Q?7LofnMT61kmY0+giYvuiby44NCXaWUCaPx5DbpWsL3ORE6zE7O95cBRAlgAF?=
 =?us-ascii?Q?MKQVqTlIzxmRnh3YmSIP3Cf0guhtLlj6rVOgGDof7EnNceXuP/dGkfTuYu9j?=
 =?us-ascii?Q?/go0zQqV7koTL9PwOlwTRPc/pTfD5LCA5rjw4HYO1dZNDm//O6YDvu3s20Q7?=
 =?us-ascii?Q?lx3Ncwq+rBoUDdfgSRlByU7jXQFyvMc9VZIdte4X9FpU/Vshf7a0eS4rIN84?=
 =?us-ascii?Q?+4ly4rrEwJYKPB3jLXMvGwxVDVWciUx7pmFRhKwnLYLe1H2FFVSzrPgrpGKo?=
 =?us-ascii?Q?9kkv93O+fuxOGPgckZ60Q1I9r+gZA8DXcBbX4inU57tWJ1N/OGR8cIvmLfMk?=
 =?us-ascii?Q?6fEzaE1corwtHe19lcSL43IFQDNKH7nR5flJ2qWnjVmv86m5dsGBWKdK7Szs?=
 =?us-ascii?Q?W5XieRzFyVXmxu3HS95I3LWkxlt/1+XMN0/skm8xW9GZyX8IWN67J/JbuhKK?=
 =?us-ascii?Q?QgUZSPUN0Qg8gDUcGIKyNqITNLOdZwfGRWk289KjHl2IrNZ+EzlLOQqi7ex4?=
 =?us-ascii?Q?JpwHxh1KHvgc1njsLvAvBtK0FPnhaySpDswLk8UDMUY0P+0zDK6jGeWfcBGv?=
 =?us-ascii?Q?Ov8+zl17yiCEkAtIcPLtvMjaT18Ev/GrmQ6uhC+QfG46fM804DvLPZYUbH7L?=
 =?us-ascii?Q?VwekVvugVUWT9pm3J/76gfSma26ZPD6C5qCZ8MB/C0j2lnwLuAWF7/hITndK?=
 =?us-ascii?Q?Ni81vFXRH16099mp+A5sxsxtzJ19ouTXj33B8BB2v9RcD83umRhPUzHSIHE1?=
 =?us-ascii?Q?R5jT2lUePaaaPa8e2Zx531iwMDnzdlWXxxzkRGnyWTcdapoTaynh0oTL3PBG?=
 =?us-ascii?Q?LNfUf1LAqRJ3gLWGnZRdzFy6PdCc3wiLAQOAZeOxRqDE+uKgFc6ngRzZ27bG?=
 =?us-ascii?Q?4CsQty+fXL0Eyl53y0hzOHgAjMpGGyQVwZ//HOX8ucJcvuTQ7kP0maq8/zFB?=
 =?us-ascii?Q?OYrEuu2pAgCTNkjfdKD6xM8L8xam+SFyDn6EGXKEfXo/Pz0vTo/7PbQH6UPZ?=
 =?us-ascii?Q?+ddxeUZ6qJDYzVULUNV5uqoBjhAtvscjub0CgebVCAnh+iOd6PH5rBR9z7lx?=
 =?us-ascii?Q?prlnKdnJed3kyI2MXk88f1n6MYlpJpgxCA4EJF5C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74ef385-4c01-494d-2ca2-08dcabc21544
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:22:05.1861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwEAgOlpX3B7sabUk0/1bJHaAoVf39Q7pwH/AY5n6qQOq1WeFn/UwPn9+PIv/U4OaKjZaUt5ojzl41/dMiMktw==
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

i.MX8qxp Display Controller display engine consists of all processing
units that operate in a display clock domain.  Add minimal feature
support with FrameGen and TCon so that the engine can output display
timings.  The display engine driver as a master binds FrameGen and
TCon drivers as components.  While at it, the display engine driver
is a component to be bound with the upcoming DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* Use OF alias id to get instance id.
* Add dev member to struct dc_tc.

 drivers/gpu/drm/imx/Kconfig     |   1 +
 drivers/gpu/drm/imx/Makefile    |   1 +
 drivers/gpu/drm/imx/dc/Kconfig  |   5 +
 drivers/gpu/drm/imx/dc/Makefile |   5 +
 drivers/gpu/drm/imx/dc/dc-de.c  | 151 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 366 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
 10 files changed, 784 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 03535a15dd8f..3e8c6edbc17c 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+source "drivers/gpu/drm/imx/dc/Kconfig"
 source "drivers/gpu/drm/imx/dcss/Kconfig"
 source "drivers/gpu/drm/imx/ipuv3/Kconfig"
 source "drivers/gpu/drm/imx/lcdc/Kconfig"
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index 86f38e7c7422..c7b317640d71 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_DRM_IMX8_DC) += dc/
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
 obj-$(CONFIG_DRM_IMX) += ipuv3/
 obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
new file mode 100644
index 000000000000..32d7471c49d0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -0,0 +1,5 @@
+config DRM_IMX8_DC
+	tristate "Freescale i.MX8 Display Controller Graphics"
+	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	help
+	  enable Freescale i.MX8 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
new file mode 100644
index 000000000000..56de82d53d4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
+
+obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
new file mode 100644
index 000000000000..2c8268b76b08
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define POLARITYCTRL		0xc
+#define  POLEN_HIGH		BIT(2)
+
+struct dc_de_priv {
+	struct dc_de engine;
+	void __iomem *reg_top;
+};
+
+static inline struct dc_de_priv *to_de_priv(struct dc_de *de)
+{
+	return container_of(de, struct dc_de_priv, engine);
+}
+
+static inline void
+dc_dec_write(struct dc_de *de, unsigned int offset, u32 value)
+{
+	struct dc_de_priv *priv = to_de_priv(de);
+
+	writel(value, priv->reg_top + offset);
+}
+
+static void dc_dec_init(struct dc_de *de)
+{
+	dc_dec_write(de, POLARITYCTRL, POLEN_HIGH);
+}
+
+static int dc_de_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_de_priv *priv;
+	int ret;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg_top = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(priv->reg_top))
+		return PTR_ERR(priv->reg_top);
+
+	priv->engine.irq_shdld = platform_get_irq_byname(pdev, "shdload");
+	if (priv->engine.irq_shdld < 0)
+		return priv->engine.irq_shdld;
+
+	priv->engine.irq_framecomplete =
+				platform_get_irq_byname(pdev, "framecomplete");
+	if (priv->engine.irq_framecomplete < 0)
+		return priv->engine.irq_framecomplete;
+
+	priv->engine.irq_seqcomplete =
+				platform_get_irq_byname(pdev, "seqcomplete");
+	if (priv->engine.irq_seqcomplete < 0)
+		return priv->engine.irq_seqcomplete;
+
+	priv->engine.id = of_alias_get_id(dev->of_node, "dc0-display-engine");
+	if (priv->engine.id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", priv->engine.id);
+		return priv->engine.id;
+	}
+
+	priv->engine.dev = dev;
+
+	dev_set_drvdata(dev, priv);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->de[priv->engine.id] = &priv->engine;
+
+	return 0;
+}
+
+static const struct component_ops dc_de_ops = {
+	.bind = dc_de_bind,
+};
+
+static int dc_de_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = component_add(&pdev->dev, &dc_de_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_de_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_de_ops);
+}
+
+static int dc_de_runtime_resume(struct device *dev)
+{
+	struct dc_de_priv *priv = dev_get_drvdata(dev);
+	struct dc_de *engine = &priv->engine;
+
+	dc_dec_init(engine);
+	dc_fg_init(engine->fg);
+	dc_tc_init(engine->tc);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_de_pm_ops = {
+	RUNTIME_PM_OPS(NULL, dc_de_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_de_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-display-engine", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
+
+struct platform_driver dc_de_driver = {
+	.probe = dc_de_probe,
+	.remove_new = dc_de_remove,
+	.driver = {
+		.name = "imx8-dc-display-engine",
+		.of_match_table = dc_de_dt_ids,
+		.pm = pm_sleep_ptr(&dc_de_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
new file mode 100644
index 000000000000..3417059c40b9
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DISPLAY_ENGINE_H__
+#define __DC_DISPLAY_ENGINE_H__
+
+#include <linux/device.h>
+#include <drm/drm_modes.h>
+
+#define DC_DISPLAYS	2
+
+enum dc_fg_syncmode {
+	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
+};
+
+enum dc_fg_dm {
+	FG_DM_CONSTCOL = 0x1,	/* Constant Color Background is shown. */
+	FG_DM_SEC_ON_TOP = 0x5,	/* Both inputs overlaid with secondary on top. */
+};
+
+struct dc_fg {
+};
+
+struct dc_tc {
+	struct device *dev;
+};
+
+struct dc_de {
+	struct device *dev;
+	struct dc_fg *fg;
+	struct dc_tc *tc;
+	int irq_shdld;
+	int irq_framecomplete;
+	int irq_seqcomplete;
+	int id;
+};
+
+/* Frame Generator Unit */
+void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode);
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
+void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode);
+void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode);
+void dc_fg_enable(struct dc_fg *fg);
+void dc_fg_disable(struct dc_fg *fg);
+void dc_fg_shdtokgen(struct dc_fg *fg);
+u32 dc_fg_get_frame_index(struct dc_fg *fg);
+int dc_fg_get_line_index(struct dc_fg *fg);
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg);
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg);
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg);
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg);
+void dc_fg_enable_clock(struct dc_fg *fg);
+void dc_fg_disable_clock(struct dc_fg *fg);
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
+void dc_fg_init(struct dc_fg *fg);
+
+/* Timing Controller Unit */
+void dc_tc_init(struct dc_tc *tc);
+
+#endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
new file mode 100644
index 000000000000..e5910a82dd4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "dc-drv.h"
+
+static struct platform_driver * const dc_drivers[] = {
+	&dc_de_driver,
+	&dc_fg_driver,
+	&dc_tc_driver,
+};
+
+static int __init dc_drm_init(void)
+{
+	return platform_register_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+static void __exit dc_drm_exit(void)
+{
+	platform_unregister_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+module_init(dc_drm_init);
+module_exit(dc_drm_exit);
+
+MODULE_DESCRIPTION("i.MX8 Display Controller DRM Driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
new file mode 100644
index 000000000000..e1290d9a0a99
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DRV_H__
+#define __DC_DRV_H__
+
+#include <linux/platform_device.h>
+
+#include <drm/drm_device.h>
+
+#include "dc-de.h"
+
+struct dc_drm_device {
+	struct drm_device base;
+	struct dc_de *de[DC_DISPLAYS];
+};
+
+extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_fg_driver;
+extern struct platform_driver dc_tc_driver;
+
+#endif /* __DC_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
new file mode 100644
index 000000000000..3e9a8abee93e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define FGSTCTRL		0x8
+#define  FGSYNCMODE_MASK	0x6
+#define  FGSYNCMODE(n)		((n) << 6)
+#define  SHDEN			BIT(0)
+
+#define HTCFG1			0xc
+#define  HTOTAL(n)		((((n) - 1) & 0x3fff) << 16)
+#define  HACT(n)		((n) & 0x3fff)
+
+#define HTCFG2			0x10
+#define  HSEN			BIT(31)
+#define  HSBP(n)		((((n) - 1) & 0x3fff) << 16)
+#define  HSYNC(n)		(((n) - 1) & 0x3fff)
+
+#define VTCFG1			0x14
+#define  VTOTAL(n)		((((n) - 1) & 0x3fff) << 16)
+#define  VACT(n)		((n) & 0x3fff)
+
+#define VTCFG2			0x18
+#define  VSEN			BIT(31)
+#define  VSBP(n)		((((n) - 1) & 0x3fff) << 16)
+#define  VSYNC(n)		(((n) - 1) & 0x3fff)
+
+#define PKICKCONFIG		0x2c
+#define SKICKCONFIG		0x30
+#define  EN			BIT(31)
+#define  ROW(n)			(((n) & 0x3fff) << 16)
+#define  COL(n)			((n) & 0x3fff)
+
+#define PACFG			0x54
+#define SACFG			0x58
+#define  STARTX(n)		(((n) + 1) & 0x3fff)
+#define  STARTY(n)		(((((n) + 1) & 0x3fff)) << 16)
+
+#define FGINCTRL		0x5c
+#define FGINCTRLPANIC		0x60
+#define  FGDM_MASK		0x7
+#define  ENPRIMALPHA		BIT(3)
+#define  ENSECALPHA		BIT(4)
+
+#define FGCCR			0x64
+#define  CCGREEN(g)		(((g) & 0x3ff) << 10)
+
+#define FGENABLE		0x68
+#define  FGEN			BIT(0)
+
+#define FGSLR			0x6c
+#define  SHDTOKGEN		BIT(0)
+
+#define FGTIMESTAMP		0x74
+#define  FRAMEINDEX_SHIFT	14
+#define  FRAMEINDEX_MASK	(0x3ffff << FRAMEINDEX_SHIFT)
+#define  LINEINDEX_MASK		0x3fff
+
+#define FGCHSTAT		0x78
+#define  SECSYNCSTAT		BIT(24)
+#define  SFIFOEMPTY		BIT(16)
+
+#define FGCHSTATCLR		0x7c
+#define  CLRSECSTAT		BIT(16)
+
+#define KHZ			1000
+
+struct dc_fg_priv {
+	struct dc_fg fg;
+	struct device *dev;
+	void __iomem *reg;
+	struct clk *clk_disp;
+};
+
+static inline struct dc_fg_priv *to_fg_priv(struct dc_fg *fg)
+{
+	return container_of(fg, struct dc_fg_priv, fg);
+}
+
+static inline u32 dc_fg_read(struct dc_fg *fg, unsigned int offset)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+
+	return readl(priv->reg + offset);
+}
+
+static inline void
+dc_fg_write(struct dc_fg *fg, unsigned int offset, u32 value)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+
+	writel(value, priv->reg + offset);
+}
+
+static inline void
+dc_fg_write_mask(struct dc_fg *fg, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_fg_read(fg, offset);
+	tmp &= ~mask;
+	dc_fg_write(fg, offset, tmp | value);
+}
+
+static void dc_fg_enable_shden(struct dc_fg *fg)
+{
+	dc_fg_write_mask(fg, FGSTCTRL, SHDEN, SHDEN);
+}
+
+void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode)
+{
+	dc_fg_write_mask(fg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
+}
+
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	u32 hact, htotal, hsync, hsbp;
+	u32 vact, vtotal, vsync, vsbp;
+	u32 kick_row, kick_col;
+	int ret;
+
+	hact = m->crtc_hdisplay;
+	htotal = m->crtc_htotal;
+	hsync = m->crtc_hsync_end - m->crtc_hsync_start;
+	hsbp = m->crtc_htotal - m->crtc_hsync_start;
+
+	vact = m->crtc_vdisplay;
+	vtotal = m->crtc_vtotal;
+	vsync = m->crtc_vsync_end - m->crtc_vsync_start;
+	vsbp = m->crtc_vtotal - m->crtc_vsync_start;
+
+	/* video mode */
+	dc_fg_write(fg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
+	dc_fg_write(fg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
+	dc_fg_write(fg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
+	dc_fg_write(fg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
+
+	kick_col = hact + 1;
+	kick_row = vact;
+
+	/* pkickconfig */
+	dc_fg_write(fg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* skikconfig */
+	dc_fg_write(fg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* primary and secondary area position configuration */
+	dc_fg_write(fg, PACFG, STARTX(0) | STARTY(0));
+	dc_fg_write(fg, SACFG, STARTX(0) | STARTY(0));
+
+	/* alpha */
+	dc_fg_write_mask(fg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
+	dc_fg_write_mask(fg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+
+	/* constant color is green(used in panic mode)  */
+	dc_fg_write(fg, FGCCR, CCGREEN(0x3ff));
+
+	ret = clk_set_rate(priv->clk_disp, m->clock * KHZ);
+	if (ret < 0)
+		dev_err(priv->dev,
+			"failed to set display clock rate: %d\n", ret);
+}
+
+void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	dc_fg_write_mask(fg, FGINCTRL, FGDM_MASK, mode);
+}
+
+void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	dc_fg_write_mask(fg, FGINCTRLPANIC, FGDM_MASK, mode);
+}
+
+void dc_fg_enable(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGENABLE, FGEN);
+}
+
+void dc_fg_disable(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGENABLE, 0);
+}
+
+void dc_fg_shdtokgen(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGSLR, SHDTOKGEN);
+}
+
+u32 dc_fg_get_frame_index(struct dc_fg *fg)
+{
+	u32 val = dc_fg_read(fg, FGTIMESTAMP);
+
+	return (val & FRAMEINDEX_MASK) >> FRAMEINDEX_SHIFT;
+}
+
+int dc_fg_get_line_index(struct dc_fg *fg)
+{
+	u32 val = dc_fg_read(fg, FGTIMESTAMP);
+
+	return val & LINEINDEX_MASK;
+}
+
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(100);
+	u32 frame_index, last_frame_index;
+
+	frame_index = dc_fg_get_frame_index(fg);
+	do {
+		last_frame_index = frame_index;
+		frame_index = dc_fg_get_frame_index(fg);
+	} while (last_frame_index == frame_index &&
+		 time_before(jiffies, timeout));
+
+	return last_frame_index != frame_index;
+}
+
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
+{
+	u32 val;
+
+	val = dc_fg_read(fg, FGCHSTAT);
+
+	return !!(val & SFIFOEMPTY);
+}
+
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGCHSTATCLR, CLRSECSTAT);
+}
+
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	u32 val;
+
+	return readl_poll_timeout(priv->reg + FGCHSTAT, val,
+				  val & SECSYNCSTAT, 5, 100000);
+}
+
+void dc_fg_enable_clock(struct dc_fg *fg)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk_disp);
+	if (ret)
+		dev_err(priv->dev, "failed to enable display clock: %d\n", ret);
+}
+
+void dc_fg_disable_clock(struct dc_fg *fg)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+
+	clk_disable_unprepare(priv->clk_disp);
+}
+
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	unsigned long rounded_rate;
+
+	rounded_rate = clk_round_rate(priv->clk_disp, clk_khz * KHZ);
+
+	if (rounded_rate != clk_khz * KHZ)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+void dc_fg_init(struct dc_fg *fg)
+{
+	dc_fg_enable_shden(fg);
+	dc_fg_syncmode(fg, FG_SYNCMODE_OFF);
+}
+
+static int dc_fg_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_fg_priv *priv;
+	struct dc_de *de;
+	int id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->reg))
+		return PTR_ERR(priv->reg);
+
+	priv->clk_disp = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk_disp))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_disp),
+				     "failed to get display clock\n");
+
+	id = of_alias_get_id(dev->of_node, "dc0-framegen");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	priv->dev = dev;
+
+	de = dc_drm->de[id];
+	de->fg = &priv->fg;
+
+	return 0;
+}
+
+static const struct component_ops dc_fg_ops = {
+	.bind = dc_fg_bind,
+};
+
+static int dc_fg_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fg_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fg_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fg_ops);
+}
+
+static const struct of_device_id dc_fg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-framegen", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
+
+struct platform_driver dc_fg_driver = {
+	.probe = dc_fg_probe,
+	.remove_new = dc_fg_remove,
+	.driver = {
+		.name = "imx8-dc-framegen",
+		.of_match_table = dc_fg_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
new file mode 100644
index 000000000000..29f42496a409
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+#include "dc-de.h"
+
+#define TCON_CTRL	0x410
+#define  CTRL_RST_VAL	0x01401408
+
+/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
+#define MAPBIT3_0	0x418
+#define MAPBIT7_4	0x41c
+#define MAPBIT11_8	0x420
+#define MAPBIT15_12	0x424
+#define MAPBIT19_16	0x428
+#define MAPBIT23_20	0x42c
+#define MAPBIT27_24	0x430
+#define MAPBIT31_28	0x434
+#define MAPBIT34_32	0x438
+
+struct dc_tc_priv {
+	struct dc_tc tc;
+	void __iomem *reg;
+};
+
+static inline struct dc_tc_priv *to_tc_priv(struct dc_tc *tc)
+{
+	return container_of(tc, struct dc_tc_priv, tc);
+}
+
+static inline void dc_tc_write(struct dc_tc *tc, unsigned int offset, u32 value)
+{
+	struct dc_tc_priv *priv = to_tc_priv(tc);
+
+	writel(value, priv->reg + offset);
+}
+
+static void dc_tc_set_fmt(struct dc_tc *tc)
+{
+	/*
+	 * The pixels reach TCON are always in 30-bit BGR format.
+	 * The first bridge always receives pixels in 30-bit RGB format.
+	 * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
+	 */
+	dc_tc_write(tc, MAPBIT3_0,   0x17161514);
+	dc_tc_write(tc, MAPBIT7_4,   0x1b1a1918);
+	dc_tc_write(tc, MAPBIT11_8,  0x0b0a1d1c);
+	dc_tc_write(tc, MAPBIT15_12, 0x0f0e0d0c);
+	dc_tc_write(tc, MAPBIT19_16, 0x13121110);
+	dc_tc_write(tc, MAPBIT23_20, 0x03020100);
+	dc_tc_write(tc, MAPBIT27_24, 0x07060504);
+	dc_tc_write(tc, MAPBIT31_28, 0x00000908);
+}
+
+void dc_tc_init(struct dc_tc *tc)
+{
+	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
+	dc_tc_write(tc, TCON_CTRL, CTRL_RST_VAL);
+	dc_tc_set_fmt(tc);
+}
+
+static int dc_tc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_tc_priv *priv;
+	struct dc_de *de;
+	int id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->reg))
+		return PTR_ERR(priv->reg);
+
+	id = of_alias_get_id(dev->of_node, "dc0-tcon");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	de = dc_drm->de[id];
+	de->tc = &priv->tc;
+	de->tc->dev = dev;
+
+	return 0;
+}
+
+static const struct component_ops dc_tc_ops = {
+	.bind = dc_tc_bind,
+};
+
+static int dc_tc_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_tc_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_tc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_tc_ops);
+}
+
+static const struct of_device_id dc_tc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-tcon", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
+
+struct platform_driver dc_tc_driver = {
+	.probe = dc_tc_probe,
+	.remove_new = dc_tc_remove,
+	.driver = {
+		.name = "imx8-dc-tcon",
+		.of_match_table = dc_tc_dt_ids,
+	},
+};
-- 
2.34.1

