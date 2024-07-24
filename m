Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBF93AEE3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F330810E657;
	Wed, 24 Jul 2024 09:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HvwDnI05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF11D10E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY4KoVyVvWyt5SQ/Xtch+U0QKstwfJMZJLBycfm6xlnUCpNiLs4rf0/mxY6zZgS7UMaAStsbrNNhl+ORRw3iHuNxgG9uKKBzawj635ThXOhdhIyyJR+iiexNJBo7G3+IfGwYniosiGBJ7p4cT/m5AqZ0BO0RnFa3hLg/ng4sBGNOWBi//LBo6MnvwEkWn1Qcp3RFkFZyEKXb/dVJbs6njz3mI6C2I9PDxHu2TPEs+YnVFxfDlFv/v6dWuYNDIM2wJInmFvNIaVxvl24l7f2zAGTZtxt+wJuU6UJCIlZyN5C+HArFXhXsndMFI9W27j2vL/0CXvqNu9B+k06A7SKAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MC1EIw/pWmXaK2h2z24eJx0apVrVEAvWmONEqQyEEL8=;
 b=sujPQ/H0y79zqTlwC5H/GSLSLN2eo1kkpOQnhMr8yGeh4tjrIEJbHPrsRQ4kks1B6fHiPK30L41X7e61nuTd4l58V4zf4HJH1cXdaEEEtsOiiTfmL2QgKEOpzVtfSDIyAfuDiWIZ5bqQ6ANxnQNuN1wnu42b+rJztxX591PpUehO1I+3gSmMS+KFTPr6UYSkkQFPsREvHX2wD0n5RnGOyQ+jYX6x6kzmvZYjxOxyHqs3FqZtT6SPvAHW24P/9GBjIMs1sCvUzyv2KIa5fGP1y0iEk/ksZPKYybKT3yf00kWUqIL93pFuEZvGcYoN1pkek3PtnNjicYM/QroG72FEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MC1EIw/pWmXaK2h2z24eJx0apVrVEAvWmONEqQyEEL8=;
 b=HvwDnI054wG/Ob4YdBwkSbo2Qmy9t5WOzs/b2jRaaaHSXm4ZE5NZMR1ZCcUUSbTEJ8eMl3LtVPjCK6Opbz/YqX9CxntJmpkdx1ddNgoQeJViW7t9C2qhcHlJ0swka1HyvdhIzPm6AX6vC6D76B5EV/8weEg55kPwVatGtC+tAdfgnJ80MA6wu3IrZ+5VSQEY/N2es1X6MvcfhR4xL1DuB1aCiu1FKZOWK2Xyj2Lma+mliHbAQZgJf7a0PKyNS2RFKQ7G/O8ZMqZBKK70YuIV1Y5Be0E8tGtFPo5+CK5DyAvl4HOMe9aal2OXRsaQ5J6qkMuhad13On6qEqYQAwPZ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:22:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:22:19 +0000
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
Subject: [PATCH v3 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Wed, 24 Jul 2024 17:29:42 +0800
Message-Id: <20240724092950.752536-12-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d194fcd-0808-4d13-45f6-08dcabc21ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FLfb0nmrbhsajXIPBq56FpltjjxFlWmwvp1yjJlY3zJ0VIXiVgO97+qKPqvi?=
 =?us-ascii?Q?/ybG3gzHZ790o3MM3vF+a4LRWy3nMEuNPLghzHrWZJ4wcK9KVT3Af5mO9ipn?=
 =?us-ascii?Q?p+1/lxOf5vu3Ug2WtsYhulQRYUOn4DV9pWfp7uLCwd93eoXlOvwDbVNukEmA?=
 =?us-ascii?Q?S2NRAC6F4Ra/w7lo2989eP0I4f1YplN1wLJXkA8lDKQGXJAVlA8NDHLR4oAx?=
 =?us-ascii?Q?70XI4xk+qCFBr37FjA4YwGaZDjEtXx4KvNO4AQkB1HL/QHso97RkqCA9AXdK?=
 =?us-ascii?Q?hSlM7wvie9sPyEY4wbQuMhX1Q7afewOmnDhb2GGx9yMFtp7nQTDcq0CfXH0b?=
 =?us-ascii?Q?HP1Mm+F7tiZjuHDBo2sUG7d4bbwvPP4hDz8WSThMMYb4F6LRNI7lFlzjC7t1?=
 =?us-ascii?Q?72MK7gNf/YdpfSknpU0C+avMe9Xvn+MVbi/IzXJoYoiornInl2NXpSoGMCZ0?=
 =?us-ascii?Q?I9y1783qhnrODY9BTs38dhygfWVhmP8jBXyAx4ob6EFfZ/FR54IbryP4CxTz?=
 =?us-ascii?Q?PNg7flp/piqVKh9QA3D7iZghlyOWj5zTSDhrEHNmx48am9EOAP28tqExh7eE?=
 =?us-ascii?Q?mCVzc9NOF6egSliAUKF5+jTn1BzzMtuzuBkQHnUhapgJDXucUxqx8octWf3M?=
 =?us-ascii?Q?gL20v3/Kif5jSGyz2/jmAbEAdIop2dkuUlCH6uKoSh/ndpMdx8hlS04dIydU?=
 =?us-ascii?Q?DHdd8etf6UNzeC7jUQl8QR7z2LuqHZPydxiVqnmQSWu/q9ULa0tGAY4/VJEF?=
 =?us-ascii?Q?DuiudiwRRikZRdbxhLREPtIVGfshd9GvKdZROQCBydWuYC0LMfdxJ6qajRtx?=
 =?us-ascii?Q?WAp3/0BeaBlCb2s0iw5YAKUBUKPA8rTG2RG388LdmNCoeIAMZEJ2OWt9rGdY?=
 =?us-ascii?Q?dfxin+ToC6BZwyv3pmc/qLp/6H0pBYt3Pn7U/xpZtdgRwb7seClOnAmNq0XB?=
 =?us-ascii?Q?xg+g13EYHUvFosJnQV28UNZ5w83y/edcu9tIH9nmqjWOmOmk3OyPd29AmxX1?=
 =?us-ascii?Q?SCRajgQO6SIjSPs+ZP0RjHd2tEeKn8rgThiKAmQSqFw8eDcbbPI9jctUmziu?=
 =?us-ascii?Q?8YNqqQ+I325pD7OVZSdJWCkIr8s6/RO3mudR2bBOPtt0o7XcEs05L2je+wt8?=
 =?us-ascii?Q?e3xe/xoA2f8jkZizwEF2YQgEgeLALUSEkrnF4M/ERJLaRHqz8jtv8Vaj2ie4?=
 =?us-ascii?Q?tWGBXGDrss+RpWpZBWVJb7m8zvnLMlI5KSXbpQKsACL7mlCAGztgumlpEC4c?=
 =?us-ascii?Q?JaP7YF1VkqfAsJCk2fV43r+oFXJODlbCCBfuj4b9s3GQhOb4ZJrMF68CoY3S?=
 =?us-ascii?Q?uTagp2EkBy3gMl7iCWQCEyd0vq1GDDVQ9YFDml4tuG3dh2/w65J5AE6buZ9D?=
 =?us-ascii?Q?rHfTa7ISlQr54KMDf7JbSpzPtYjmGGoT+b80k39HideJlJPIaw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wk3o16AmgKfNGfWBIwR5AV587p4S36n5niG4Ay+81zqKt4NCjx7TD8R2uByB?=
 =?us-ascii?Q?bsHci1oO377YuMbyQOYjvUV5Vg02lDEKcLTKTfYbkbryL+/c9X+vvkA1kpLz?=
 =?us-ascii?Q?mGSJcyQ5jpVWA4R17AAgoRnsxtwvDRc12RG7SCupo8uy/AmUeW0Ie8RhAl7u?=
 =?us-ascii?Q?zjTSYYnWB62wfytyzYvFcJhT+VG/BNRqER8D3sNi6TWpA4sRk6RB1RXbury3?=
 =?us-ascii?Q?iJ62HoScGsn26L5oOKciE3ACd3dqv7FsncwefGttiBPMZNvola0RAB9VaC8N?=
 =?us-ascii?Q?AbKWpVt9wgCH0RTYX9DOFvvTUqilBeMxh1ysfHv5Clh4LctYC3VpwB8y+uwh?=
 =?us-ascii?Q?dkcWCkBfewVcLfDTYnzSskRJ/Fw8gK1ZXWOYRXAo1Auo0hqJYGH1pGEOCZCS?=
 =?us-ascii?Q?HSE8lzWdy+sDjqJeG3wrNJUdSJTA2Sqp+sMkkTa6VgFEeXsWPZPsY8W8+N8h?=
 =?us-ascii?Q?UIgx3q7ye1ELml+ppu5mucesAQPlQSC5sSZHiwhEHHJSCYNMTEqI/J69W1p8?=
 =?us-ascii?Q?v/nNvqOQd4G9itztHdkLeMmmCFBqQum/DEX2gbUQSbPFfeucHtAP5HYVCvOX?=
 =?us-ascii?Q?b9XQMDo30/Fs2zQAeupWDtA+fZy0WlNmzvI5ngAtSRNzA1x2H2X+IowDVS2g?=
 =?us-ascii?Q?ensOc/7HR0NywIxPx0Sze5koPd4X9ETveFnNsD2Y33HkU5nChxpaFVh8NTQB?=
 =?us-ascii?Q?7IOmWknldXOV1FrUJSc4Zx0P92KmQuilT5FhurvhjrB9sDEeJAuMmymyT+lQ?=
 =?us-ascii?Q?jB0pAE2EAhF5rAEbyp9JnatQoVjIzmKokvM0bXVz9tUM5GSFmCMn8deb70H3?=
 =?us-ascii?Q?sLejVIfsUkPCaSWBBrvDgYmU78DIY+J6TbYQDc/EhhA+kWPmzi136Ti4LzyK?=
 =?us-ascii?Q?mxQedKosyclEj3ufI3Q7lwwP9sGlSOMix78Hc/dB3BqI5MDr9Nca/D8w3WsD?=
 =?us-ascii?Q?WCUK04siOCtviYVBVxBQNW/QVIIYv6cxpqCqX3vJc4nf7Zxrcma5VEBb/JIl?=
 =?us-ascii?Q?//xy58hCiEQsyotvyjEAeRL1hwIRpPYAIa6CwbTVzT21PRHqC1JYc/mFpp7g?=
 =?us-ascii?Q?M3mirBwktvpc0oYtIlXnrCEx+KefRr610F7E+G/9xTxvrp4afBQAidJD6wFQ?=
 =?us-ascii?Q?XlVKdRcCqfyw2851CCj5TT+w6kXqbkWXfAOmo9+KNReNUz2uDn29HU7S/bDG?=
 =?us-ascii?Q?y3OPmi8Nt6Kpp4HO1wotBMikzxCOllZ7PxBoAj3jbTTaMBTFNxKTvPCbV/HZ?=
 =?us-ascii?Q?peT1cMWZnTtKaHmw37whnxDUoDGJiiSJVRLsaPiMXFJARR0RoQW98U1Vrfbj?=
 =?us-ascii?Q?k4QOXc+s/xQ9Xrm5zJdvCwkRbp2gKGBHpVmGVzNQ9JQQm/kYi0m5voNHgdNT?=
 =?us-ascii?Q?XM6d9efezCBxO1KHFgWQQ6nwwZDQM7k7Onas68iH0pl3+seyRTZdTwXuFzEk?=
 =?us-ascii?Q?ou1VcQAF2vNvBT8AcQZNje8jkJVcDyFE8kOeS/Ot+xaU/eNM18eJ0GTvFduh?=
 =?us-ascii?Q?8zN9ZRPVR3tPdqNX9cIuZRoQaNWVvf4kINafv78T/Bc72s155Rn+Me7wKuf3?=
 =?us-ascii?Q?IkbCt6FKIh4AD3QgncygDpF7Nv3TfcMFoQSZGOOt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d194fcd-0808-4d13-45f6-08dcabc21ddd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:22:19.4508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hn2ZHA25HTRMULMhaRxZTsPYyqs5tcIkfqXUd2nDHWQRPjytp07iFel/2O88jXWqA8DddV+g61PvVICK/4v2cg==
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.  Add driver for it.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* No change.

 drivers/gpu/drm/imx/dc/Kconfig  |   1 +
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-ic.c  | 249 ++++++++++++++++++++++++++++++++
 5 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 32d7471c49d0..b66b815fbdf1 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,5 +1,6 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select GENERIC_IRQ_CHIP
 	help
 	  enable Freescale i.MX8 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index 2942ae6fd5bd..1ce3e8a8db22 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
-		    dc-fw.o dc-lb.o dc-pe.o dc-tc.o
+		    dc-fw.o dc-ic.o dc-lb.o dc-pe.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 7c64acc863ad..fd68861f770a 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -15,6 +15,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_fg_driver,
 	&dc_fl_driver,
 	&dc_fw_driver,
+	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
 	&dc_tc_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index c687a36b8153..3b11f4862c6c 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -25,6 +25,7 @@ extern struct platform_driver dc_de_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
 extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
new file mode 100644
index 000000000000..8540a0414b39
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+
+#define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
+#define INTERRUPTENABLE(n)	(0x10 + 4 * (n))
+#define INTERRUPTCLEAR(n)	(0x20 + 4 * (n))
+#define INTERRUPTSTATUS(n)	(0x28 + 4 * (n))
+#define USERINTERRUPTENABLE(n)	(0x40 + 4 * (n))
+#define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
+#define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
+
+#define IRQ_COUNT	49
+#define IRQ_RESERVED	35
+#define REG_NUM		2
+
+struct dc_ic_data {
+	void __iomem		*regs;
+	struct clk		*clk_axi;
+	int			irq[IRQ_COUNT];
+	struct irq_domain	*domain;
+};
+
+struct dc_ic_entry {
+	struct dc_ic_data *data;
+	int irq;
+};
+
+static void dc_ic_irq_handler(struct irq_desc *desc)
+{
+	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
+	struct dc_ic_data *data = entry->data;
+	unsigned int virq;
+	u32 status;
+
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
+
+	status = readl(data->regs + USERINTERRUPTSTATUS(entry->irq / 32));
+	status &= readl(data->regs + USERINTERRUPTENABLE(entry->irq / 32));
+
+	if (status & BIT(entry->irq % 32)) {
+		virq = irq_linear_revmap(data->domain, entry->irq);
+		if (virq)
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(irq_desc_get_chip(desc), desc);
+}
+
+static const unsigned long unused_irq[REG_NUM] = {0x00000000, 0xfffe0008};
+
+static int
+dc_ic_bind(struct device *dev, struct device *master, void *master_data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = master_data;
+	struct dc_ic_entry *entry;
+	struct irq_chip_generic *gc;
+	struct dc_ic_data *data;
+	struct irq_chip_type *ct;
+	int i, ret;
+
+	data = drmm_kzalloc(&dc_drm->base, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	entry = drmm_kcalloc(&dc_drm->base, IRQ_COUNT, sizeof(*entry),
+			     GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	data->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->regs)) {
+		dev_err(dev, "failed to initialize reg\n");
+		return PTR_ERR(data->regs);
+	}
+
+	data->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(data->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(data->clk_axi),
+				     "failed to get AXI clock\n");
+
+	dev_set_drvdata(dev, data);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to get runtime PM sync: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < REG_NUM; i++) {
+		/* mask and clear all interrupts */
+		writel(0x0, data->regs + USERINTERRUPTENABLE(i));
+		writel(0x0, data->regs + INTERRUPTENABLE(i));
+		writel(0xffffffff, data->regs + USERINTERRUPTCLEAR(i));
+		writel(0xffffffff, data->regs + INTERRUPTCLEAR(i));
+
+		/* set all interrupts to user mode */
+		writel(0xffffffff, data->regs + USERINTERRUPTMASK(i));
+	}
+
+	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+					     &irq_generic_chip_ops, data);
+	if (!data->domain) {
+		dev_err(dev, "failed to create IRQ domain\n");
+		pm_runtime_put(dev);
+		return -ENOMEM;
+	}
+	irq_domain_set_pm_device(data->domain, &pdev->dev);
+
+	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1, "DC",
+					     handle_level_irq, 0, 0, 0);
+	if (ret) {
+		dev_err(dev, "failed to alloc generic IRQ chips: %d\n", ret);
+		irq_domain_remove(data->domain);
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	for (i = 0; i < IRQ_COUNT; i += 32) {
+		gc = irq_get_domain_generic_chip(data->domain, i);
+		gc->reg_base = data->regs;
+		gc->unused = unused_irq[i / 32];
+		ct = gc->chip_types;
+		ct->chip.irq_ack = irq_gc_ack_set_bit;
+		ct->chip.irq_mask = irq_gc_mask_clr_bit;
+		ct->chip.irq_unmask = irq_gc_mask_set_bit;
+		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
+		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
+	}
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		/* skip the reserved IRQ */
+		if (i == IRQ_RESERVED)
+			continue;
+
+		data->irq[i] = irq_of_parse_and_map(dev->of_node, i);
+
+		entry[i].data = data;
+		entry[i].irq = i;
+
+		irq_set_chained_handler_and_data(data->irq[i],
+						 dc_ic_irq_handler, &entry[i]);
+	}
+
+	return 0;
+}
+
+static void
+dc_ic_unbind(struct device *dev, struct device *master, void *master_data)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		if (i == IRQ_RESERVED)
+			continue;
+
+		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
+	}
+
+	irq_domain_remove(data->domain);
+
+	pm_runtime_put_sync(dev);
+}
+
+static const struct component_ops dc_ic_ops = {
+	.bind = dc_ic_bind,
+	.unbind = dc_ic_unbind,
+};
+
+static int dc_ic_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_ic_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_ic_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_ic_ops);
+}
+
+static int dc_ic_runtime_suspend(struct device *dev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(data->clk_axi);
+
+	return 0;
+}
+
+static int dc_ic_runtime_resume(struct device *dev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(data->clk_axi);
+	if (ret)
+		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
+
+	return ret;
+}
+
+static const struct dev_pm_ops dc_ic_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
+	RUNTIME_PM_OPS(dc_ic_runtime_suspend, dc_ic_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_ic_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-intc", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_ic_driver = {
+	.probe = dc_ic_probe,
+	.remove_new = dc_ic_remove,
+	.driver = {
+		.name = "imx8-dc-intc",
+		.of_match_table	= dc_ic_dt_ids,
+		.pm = pm_sleep_ptr(&dc_ic_pm_ops),
+	},
+};
-- 
2.34.1

