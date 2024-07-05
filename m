Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FC928462
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71F310E210;
	Fri,  5 Jul 2024 09:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UV+9RhAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F149A10E21C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMeuShZjXp6Chi0bdFNGqsGGTtmDDrPQZuFG9a6lE9Nuf6KkmACMsLRobtmou634gfTfuLwVtI8UI3fT93HjkGC3pFNXGJWWmcoPfvHSsu3ZgYVyaxXoHGf21Dw5cYUcfKzkq2BiTJNm31FyRb6oqvGMvTYen5/FkrcWNDcmW9xZqm+2pDsLDDEfWhueUpVxwKg6ihog6J43i65YNUsLEdAX4sSEZ4VbXp8PTED+ma6UvrcTZzXg6ITnBfnmCZG0mzi8+SntAKz72wXqgzBQGaW9U4mqkg+BZDKXvMrHjOQa2tZCJaAjeRyQh3CjfvPjsbboe4sp22L39AH4UghSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eF5e6T25AKsLJkHlP/Wsl1U1tUWhp1CTGF0smvdp9qE=;
 b=hB++QHhxRxufG7M1oQNAObmHpHQBqZvxgWNAJ9M2CAf4Jv71qoVE9pyfbRAvrgjRXhoXiYr91EBTTOIwu7t1NlGnzzmeZeoEoSj9Rj/WlYIUgbV31Jy2ew8WkMadmbtdsW2fy3XsenZFoLG09/5vkxHVoK3JRvbJtoLoX+r/mDBzS/cuzVb8afAhtdQEfBxeDsl0bmok9uq4vRSJudXmfPRd2tyoN4BC2CPFm88Y0C4SjSqHBytmzIhXTmbtmfFb1G2gytmfg7MabQepWJXpZ7aZyGeQBSI5AggRiaw9dc+/fsiZCosv+L5YPFDMitI6waOpJBb4nneapNa2ZO5JTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF5e6T25AKsLJkHlP/Wsl1U1tUWhp1CTGF0smvdp9qE=;
 b=UV+9RhAVwhz/wXtxvvmKzcMIv0IfGJKxzokRLdcLYotAZgHwckNQyleee1dkO65A4x9ayBCirtW/8JhOAMmN7VyhUaVXFB4YMFRs3JPUAx0vb2embde1cgmWaCVRM459UKojNtx4jQpLqKSwqt2EPjJpE8oe40k0Jnbyx5631pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:01:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:01:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 06/10] drm/imx: Add i.MX8qxp Display Controller display engine
Date: Fri,  5 Jul 2024 17:09:28 +0800
Message-Id: <20240705090932.1880496-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240705090932.1880496-1-victor.liu@nxp.com>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a006445-0279-4136-13ac-08dc9cd10bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E9lnoS9DqMAHO7qxyVRfHkDO8LTFKbnvD6l+3P4xOXQtBHC1dmeCZL5c5WNd?=
 =?us-ascii?Q?2UzmW38RZFgpyeIeKOaVf1uFSND283cIVho7+1P8HFhuM1qtGV53rfLOeCLL?=
 =?us-ascii?Q?DhEky88znHhTfFKNckQfhZw+xnPWjtIk6tqd1gA1ju/aO2855bNyx00+Sqv5?=
 =?us-ascii?Q?SdW+1Koty2UCGxkIidEOLQDW6tEaAi67N0XpdSHfH4GZMnvNNadfwkJB3oaQ?=
 =?us-ascii?Q?3M6w1t6mrj21tgPHT4EHibx/VOi1GGHKJMxtIUPCVbf98Ik2uCwyvMTXg4FV?=
 =?us-ascii?Q?1UF5E+KOF5lPtQSOdMS3mSQIO5FDtcxdJsZmWqJcH98l565YDu+oSWysve0O?=
 =?us-ascii?Q?LAujd2MdBMC/bBJ04TQWZ7LL6h/GntUw9ib4ies/vrqBEK/528EBZ0qorc5g?=
 =?us-ascii?Q?gjr/3YzSJ4K04BzoF9o0aRCGf+5Dp67B+fRitymtTSlgsjjvTKVO87DnyC/V?=
 =?us-ascii?Q?/4sOUqDhHszB73BmagpgSp3zMBR16WCdj9KRDbsLSQM2mCJ1XaDiK3BYqyI1?=
 =?us-ascii?Q?TLP6Isy+tHojPcBKjz4ILb7KER61oTB/+ZW9h8fTcAOu6OSMbshtuJY1dfkM?=
 =?us-ascii?Q?dQVC58+MR5Xgv8aL9K+Mm+Jkbk8Xwp2N7UhgTHuyn94KIBokbSHtLtN+0uBJ?=
 =?us-ascii?Q?oa+Wvrj93zeBsWSxP/SJA0fGPZooDwPXNAZQqOitgbfu6FVUGZHi/B0ThsCU?=
 =?us-ascii?Q?/wwW3IAi/da4Y2NvF1vQoeEFXNQPN82lq+DIhLIQTzUqtos12Fs/yUZInAXj?=
 =?us-ascii?Q?Ybiqqd+WkoJV7a8doV7sx3i32wdewudKSMSx9WztirTnhb8of12ACAaVepqq?=
 =?us-ascii?Q?Z5Os4PqUwaW6q2K5PEzRSxBufrO9atmi8/5Q8YLTcOjQE1M4HUNB9KIPvDR1?=
 =?us-ascii?Q?BwH9y5OPeUr6yDjymwnFUkhI5Wa6q5jQn0ApuQb9taGPbNNQXyI2EFqszkG/?=
 =?us-ascii?Q?1HzB6qPGkTFdEXacXZ5/acG9xZQf+AXTUXqjV/D7Azh+EJvZ3mfZ8s1Qz3oM?=
 =?us-ascii?Q?W1egMrPeRQ7miUX78HED7FNge4Xg5lsyT6iNp6AUzL7XR3N0+G1i6AOWBnf5?=
 =?us-ascii?Q?X3w20ggLLuYCX1bSSJnnK68BWXgz91Srj/GGdWMm3FrcRxi6I8Nkl7zl8wtu?=
 =?us-ascii?Q?Gqwpf27nYjcLXYE8WMh9zbJBmrhNgcB1X5TshCcKUHFzC5C/zyBcd/by2/eN?=
 =?us-ascii?Q?KxgJsAM6m7TxmvvzdEtRIcjIaMg9/pkYVHeEDynh5Oe7Lp7ICwst2mXFzD+C?=
 =?us-ascii?Q?n1PLlnkRGWrmx0CaPHSjS9Z6u2MKcWmrfb1Oh375ltG8iXsi6hcqlL+oNHy1?=
 =?us-ascii?Q?OF+mJRrv8RlC/iV/MBelbfxkXgvoDsfhtsw/ULTnbeMsPj4BeE0ZcQzPU86J?=
 =?us-ascii?Q?WJ3qyabHXOHBeheEkCSefklj+4t0HxarEDJKB1YQbytq3J4Snw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nH7X76XLROMnf21N6knbTZUvnlkrmY1mF+54DP7zah9Zi0HIOfiXjnnqTGqz?=
 =?us-ascii?Q?7kNKoNIcaTysu82C/mKp7K9P6FEJLyvvvLWlxUEKU1yeUy+ypnPvBooUaOh7?=
 =?us-ascii?Q?EGu3kmH0mfC8iz1Tx/SqLdL9bEk5Qx71rZOGlRQVxQ4hVlRrshmUoey0Ew9K?=
 =?us-ascii?Q?C5lv8Z25XL0GVQnqxau42VWjoYwGtAgcKkTlLLsK0SdXSJgX/w5Zan/zgot7?=
 =?us-ascii?Q?sM6RPSrcsz55ITvHcLHEeowr1TWoFmrV/5OZEHC7Rt3ibZemQCLCbuYHQAGu?=
 =?us-ascii?Q?5vV07E5d2LfiAzUm4LJuoMSDemdBtikXqoNk1xL/QAe6LNqOq7ZEEupQAYk6?=
 =?us-ascii?Q?2r9EXDibelbsJg+qn6f5xXecjAHbVwAzhWlcf7mVsyCLfIqbn1G9k/k8F0Xb?=
 =?us-ascii?Q?jL0HY0xS7b1SHAtCD/bkPalKh3lxObWhHTN4CMSbo/GB5yoKJtUd7RcIlkaK?=
 =?us-ascii?Q?tLdmlGMi7wlix6ogBR2VoPVv5TYtZIF441czSjZv8rad1DGguueVINos8txt?=
 =?us-ascii?Q?hTkcfNo/JaRIciDDVlhw01O+nmpzH+8bK3hyNyyRo77fq8j2RZmK9p2Oijer?=
 =?us-ascii?Q?4veMoYWha8V3tAxmDLsCNDKhkLeNKAeqt/zrdzbZXiheIkNXCLqtiRZnakII?=
 =?us-ascii?Q?7HVLgJe29D5MPNsRIIe25TpnGF+lFk9Us6JCGAl294czmVMHr7e3n1A2N+z8?=
 =?us-ascii?Q?7EM2CN3fow5NTv6IkInU8X1Qd1RRQ9MHp4WNqKYJtg2cjILSWUw6V8WQOnzB?=
 =?us-ascii?Q?o7rRGvIdaKzL6NqfrFcLgbpa2Isz0K6RkGz1/DR4JnU0MrMwvMplphUiZIWl?=
 =?us-ascii?Q?goArn9WekElI5xZnEzEsf9c2d33TKUZbvYpg5z5T75PF4/UFMtEBRxPwtRCM?=
 =?us-ascii?Q?3kea1cBS//xD/pw1bcjci7yP4Jrg3WCQRpAEQU6Z76Ld3AR1lgbuOQDZ3oc7?=
 =?us-ascii?Q?d6Fg6X+OTyUQNYTT0csMZOfwF9qF5vuiRxOkn+H6ICtxaT52N04PZmg8XvxQ?=
 =?us-ascii?Q?ZWh94iVmPPclfrOl/2UpNNNY2sAE7t6etzFEGZFR2MQp5gRE9TR45xRz64Wr?=
 =?us-ascii?Q?NzLKFVL6C9n7YH0yGr/Sa3QkvcZiljrnRJRg+NM4aAAMJG/BsidQqcsi7uWj?=
 =?us-ascii?Q?PU5xH/t1AtbzlM5gcWSixQsiXPWd53BW8GtofD4lMfWSHjwM0jbN7DkDTzwi?=
 =?us-ascii?Q?IfbGG01oHMFna19OE7Z7LlCXa85nX8vTmnqcQqKGRm/ttyeV4PnwGXT5Xpp/?=
 =?us-ascii?Q?yOlowpVqNpWU80BdFVPFh0Kp/SeUs1C4Yyp4N26CBR6cGcssjF+RNPV3FPmM?=
 =?us-ascii?Q?n/Ar8SSqNef2Ry8MNl7g9VxO7cIcTetiFo9+gYHrPsspMSO0ZsmbCCdIZZY9?=
 =?us-ascii?Q?f2zb0lcxdhs3wS6O6XVPGWmnPD5zrrmBjN6uznDkD+VhNzyJy2fg7gkadXnV?=
 =?us-ascii?Q?r+xfhX66O0U5sYq4qAZilqdCqlB9SqeW74YKD7lNRJoxT7Bv2RPO66K9Rau6?=
 =?us-ascii?Q?k7zUHmT+t4p5D2h0YZXF3pUy8oQhAG7fP+mqf6a5LE4DhKRzXaN+/rSpP799?=
 =?us-ascii?Q?5DXCQkjUkYQ6gW5lQ+PnMVXfAOb5im8gO4VZi1VG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a006445-0279-4136-13ac-08dc9cd10bfe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:01:24.6665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKU/nF5miFr48UjA4U7Cwif7iukT1pQ/amcUpXk2ItaVD43uL4U8tALmVOxs5bhFPKbZX6oemtOKrZNJUXLbjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9073
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
 drivers/gpu/drm/imx/Kconfig     |   1 +
 drivers/gpu/drm/imx/Makefile    |   1 +
 drivers/gpu/drm/imx/dc/Kconfig  |   5 +
 drivers/gpu/drm/imx/dc/Makefile |   5 +
 drivers/gpu/drm/imx/dc/dc-de.c  | 152 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h  |  61 ++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 367 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
 10 files changed, 785 insertions(+)
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
index 000000000000..047277c55bc1
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -0,0 +1,152 @@
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
+	ret = of_property_read_u32(dev->of_node, "fsl,dc-de-id",
+				   &priv->engine.id);
+	if (ret) {
+		dev_err(dev, "failed to get instance number: %d\n", ret);
+		return ret;
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
index 000000000000..5fe340c88f91
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -0,0 +1,61 @@
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
+};
+
+struct dc_de {
+	struct device *dev;
+	struct dc_fg *fg;
+	struct dc_tc *tc;
+	int irq_shdld;
+	int irq_framecomplete;
+	int irq_seqcomplete;
+	u32 id;
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
index 000000000000..78491d17dfbd
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,367 @@
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
+	int ret;
+	u32 id;
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
+	ret = of_property_read_u32(dev->of_node, "fsl,dc-fg-id", &id);
+	if (ret) {
+		dev_err(dev, "failed to get instance number: %d\n", ret);
+		return ret;
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
index 000000000000..9686f3ce95db
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
+	int ret;
+	u32 id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->reg))
+		return PTR_ERR(priv->reg);
+
+	ret = of_property_read_u32(dev->of_node, "fsl,dc-tc-id", &id);
+	if (ret) {
+		dev_err(dev, "failed to get instance number: %d\n", ret);
+		return ret;
+	}
+
+	de = dc_drm->de[id];
+	de->tc = &priv->tc;
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

