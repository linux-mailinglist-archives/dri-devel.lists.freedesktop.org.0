Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968179D8263
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193F110E5E6;
	Mon, 25 Nov 2024 09:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="l5cFAAxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F510E5E6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzDeG06NvqjqGT5gN1Duh/j+ve/ah+Hu5vViBoOBbkQGfNanPnmacaRk/emmD+8/75ryuUkxdbAIlSIuO2Y+SEMUXG3lkHnjn//g/LFNF7D3a127Uk/J4yNw/uP/PRG/AeaD7awVfJHbJUH18T65Vl+EtsIlO0q+dw86oSUcYSZssjwKRh5c2zmOlcu93BzjF4cjaD0RXTrosxZB/gLM8lTsYq+4hVjC80tzjLkdg37Tvj9Mc02mu5flHjOoO+M5KgXLcISdKvat4poUYClFltNEniLc0ghCc4SBIYmtw+0AOaM2r9UpFXulc9XNv9oT7yVHhd4cLqzHsy0ubzUR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fljigbDzyBMeCjJBogNLpbl5W1t61lYcfeFloXMupQM=;
 b=R4dWMhqo2yLleMUPBKry031Si6x+H0V/e0bk3sVyexc5vR7T3lD43g2o1GynlgmeM6J2uiFp9WJGEho6nWVbmQ6KldRADUHWoBa4zEPrczDetpEPUU4XVWgTE9n2MDyS+N+gK2Ev02+bgsbEpFbJXnRz2oWsimBQ+7DoPK0O9jNSdPUEftAucZmBmSMEaJZ4O3rzXET6UsO1u3CGESB8SFGf35bss5p3hsFPBuZsZmJ5IjTFMqDrPfFmxR+ROfVJElp796ewOtUR2TcuGdr5mBInMGJLguADaj91da48NqlF00t3Z0TCx89E3XOS2C6aFBm4aTeuTaZ8u2X+qn3bqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fljigbDzyBMeCjJBogNLpbl5W1t61lYcfeFloXMupQM=;
 b=l5cFAAxSoQYFwNqu+YDSrvaQWed/PXjap+9MJ3LTl44hWf5fghuovOO6N18eDkFGBaJjns8EbCwzWmbaDk9J7743r42lirr1Bbx7wwCecL78IvWAKWTuEw8+NN4btx61or1x1ycto/8HrcOhH3nH6q9rXnGJD3/ZWoZu5m8dkoiIlJKaGpsX1CgTbLV16RYFPFT7kTp/6AEbNR/Qg5oJa1X9gy0qYaqnfLJiQgJ+9AP3OL+0oRR4aECFzdEtA5w2d+ItfY+sjcd62Ux7cuKXnxeN77urAhW2nk6qN12LwEEgixYDrOaDQF0SVZLreWU0OUsYA1dQig4DuoWK32lK4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:34:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:28 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Mon, 25 Nov 2024 17:33:08 +0800
Message-Id: <20241125093316.2357162-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 902d60b9-855d-4410-113f-08dd0d345b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WfHGBlVn+7n8RYLUhR9h5qtYeW02e1mAsz8+Eh3jHWOzT2UZPhnofiQIZhC4?=
 =?us-ascii?Q?XJQmFZghDhlgxyy44poxGNV9BTpo0I/+WvexDlCLRpd6TacQ7HwG02w63ZNi?=
 =?us-ascii?Q?v1SVMC3wd/k9jzKaGI9hH7i7dG/azsWwNmoDXUSJjDNuPV9+LRXKocjSxYJs?=
 =?us-ascii?Q?nPRlZXcfHiRhlIyaet9GlRUId8X6vnWQkUjg+L3jeHabFeO8HtgH3Dp8W8GO?=
 =?us-ascii?Q?jZdDIkSDjmqavlhEllCLb+GGV4Bp4s2kS1HSkPerV9z59hP/6tivpVENzyyj?=
 =?us-ascii?Q?nDtABV9icTqArEmIJF+I8OwAj4LE4zQU+mDiO0n54BaCEQj6bPW/09Ifvpx2?=
 =?us-ascii?Q?Xgn5z3N914csggN2IhjAdCMJioaxnLgj5MNpsBTnLayfD0WPvGbZn0pynGAS?=
 =?us-ascii?Q?8p2yctoNYfYXQVj1DYRkuz/zFZV+Sqd4T8SuVOYt/mOckAbPUHuGRGKuDTfO?=
 =?us-ascii?Q?FFYX2naBtdaNgUIbyVQKbe9IOiIlORSXzrnJpn7occNzqkO70yVVdlkbnPPY?=
 =?us-ascii?Q?SRwa4DBFDFIn01scREf5NCi6sSZyqEGhSSDTluBX9V+X5hABGO05dLXMD3Cx?=
 =?us-ascii?Q?oJO6gypl7odEhBrelgDlwN8/nsznu8lQtd0sx4HKxMm+LK/fG4rHnRVf8tjs?=
 =?us-ascii?Q?IIj1CsuYp4BqQb6tngcrAsOQ9iqcTwfSG4IpkiZZ8b8ky9IXIUbO1iZbvcgw?=
 =?us-ascii?Q?mhaWE7TiUzwP9uMACWocbh1KFTMJNMa75TPF46y5ku2JwIeUsTtFCY//9SO+?=
 =?us-ascii?Q?LFeiCzGdE38ZB+IvPGDZoxRmVGQdlHOgr8x9/19NE6viARRQ04p/RhJRQkKW?=
 =?us-ascii?Q?0OJle71kySI0uWw/LuruxIVQeibmwTW4rgVVL1plHUzeXpzBqVkcD/ax7R0s?=
 =?us-ascii?Q?z9sj9+SmWq9kFG1vtVAlRSyXdHOxiG0Isoyx78gwpb2Unxy2HzMSAwDRDIWE?=
 =?us-ascii?Q?vZnbpdhGy7wwr+6g4PFLzsVYEi7psah3/s2f5ocFStZGfQZwK/IACOvWRFD8?=
 =?us-ascii?Q?GVhIPOSn2k+l8C+sTIas7PLvQmed0uj/foDQWLmxm8mXXMppPteK+0cFxQiG?=
 =?us-ascii?Q?TjaDpwak6hvdCUbtuJwpbdFbSdcHI5R6QeJwYZ+uxsrDwuP7pldiXqGNWzLf?=
 =?us-ascii?Q?SoXpp3vVywtJKY4HihWGsw/2xhtFRSLEqmL9Co6It4lZa5PCa6xZx3UINLSa?=
 =?us-ascii?Q?PNELOUAWEbP4/fJUiOhJBIj7XykXhpA2UmS1iWUGLofUpcmIU0AZiJg+frVW?=
 =?us-ascii?Q?zYJ/KpVZ6lK/WoGDavRTjnSvFIIjWC1lKWuvT8evbg3ravyOWZcXc8W00oGw?=
 =?us-ascii?Q?IKc7jGVBbn9iHC6/tHw7I8k0hJ5q7g8D9+Q2kpHYmjzlb0Fr5elahkNR/TZy?=
 =?us-ascii?Q?8yC/+F/qGeQJXI5gxZIz0yUh9CdmhIAybcCPttj04JfYpD/1WQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8o2Bcz++XSbxLoMFggp4wOZn5Rk+f6hBH0dynOkaqfaUvTEVcc+z5HwQOqe?=
 =?us-ascii?Q?6zyD5KNoPOA+GrwyfZoUOUE/mu9wyfIzPaB4muC+rojGmXMpbrn1lxp45smV?=
 =?us-ascii?Q?PPx113BRPm5kYP1NqjIvmmhNhK5TEfu5PPyVaAeAWs9mnansedELkPxnrpnH?=
 =?us-ascii?Q?bd3ziaxsyvCYHvLP6kwY16P14rcVv0W0oOXwe6lihLCWpxLad2SwroykRpxB?=
 =?us-ascii?Q?uBLiu4Gay6w+IxQtx9qelF7MjOtNrUG7InhD4/sEN/ela0oIzxz23wyxg8GC?=
 =?us-ascii?Q?Whwsl2CDc+F1MFqCMu6Ol5l2sGmRwkuOadxnJ5Vfy9idspIoZBlnCEjDB/Jj?=
 =?us-ascii?Q?IA+EeWn0Ec7I6HKli2wxzNK7+NdEFyBYqftZ0aE6Wb6vcReE4usW8xFnLeMq?=
 =?us-ascii?Q?q/fMXNZrRhiEB8p3DnqMITDd8qSZrJefIIit93/5cmOOdvCx7QLWNSnJtOtf?=
 =?us-ascii?Q?QBhvAIEgA/SDqOCEbLGj+e9sE8mQnK2ntuhsxGsyM+1Z4kyCRQisVPtaZMq0?=
 =?us-ascii?Q?CjJItsg0S1Nocc8hK/cYWRAeCrclTW2so/V1Rvo7FyYUr4uTSbtyKICbT/zg?=
 =?us-ascii?Q?utAmjRGbOSMp/uzgGss7HbBtCw9c3Pg/C4Ze8lR0Yu6bg8fZBqh7OQ8DAOxt?=
 =?us-ascii?Q?xBV0CIL3iKQOSc2ykO9UdfO85efWwWsD6qvnGErb8YQPyPm96UVew9gJFMV1?=
 =?us-ascii?Q?lI+Fe7HwjzSHBcEbxWrEPpPFq6TxFTq7eOCTxrGvOd31WZn+Nkye981IoHDQ?=
 =?us-ascii?Q?tnNrtExtLbFGMzZ8Pi7ScLsa0Hf4GbTtD9hnOyQKs3hvNNAxKviDlRF8xNM6?=
 =?us-ascii?Q?1ZRrkRebCx/qf9I+AqkwwCJ3yW/FEJuYldyEh80K5zOd+KtvDJrd5kVAFHsF?=
 =?us-ascii?Q?1aLSAdrhR9Mh5t6vHAs1RTTLEanXIN3bCuRcxFNYfmBWms+we2zOApPCyklD?=
 =?us-ascii?Q?QaT5He2LqqemhMGlLJxiLXR1csTV6F5nz1WpDyxFgX97pduQ0jf9vZ8eO1U9?=
 =?us-ascii?Q?GnPdBh9vnHmgigkrBZTe8efohn23YFo7QO8frUktEFPIIst08gUCJ0LxlOO/?=
 =?us-ascii?Q?L9OiPlJgS4/siB+6R7T9q5J4mEN9BqAN0lqFgH83HfVBAD4fhouYv402S9vX?=
 =?us-ascii?Q?hpqhLDdYJM1ugM2YzHY6noFRr+wFUKSNBMGAKZhBFsqghQrY3QT2CHPl0f9a?=
 =?us-ascii?Q?LL8YEf222c2qZpEMzxE2HZdNwqcTcpaE+2jHKBtgp7kEZ4D7IOMMu61Dv0jk?=
 =?us-ascii?Q?qJcIlIx3WHoGUQJdHePaCe4xSm8zzeSLsPreBKFiiXutYi3Yfey6NiTF3QLi?=
 =?us-ascii?Q?7CgAWgPSVlPi+555Alqb4B+FxzNFA+vbt2yYXaI2d+kopJo7Hzg2SzCprlcM?=
 =?us-ascii?Q?MkA1yCDNL8CC08LkcJOt0MHnwC35p4CCvQ8ZAxLQnMAUHpb/+EHhsNvphO0H?=
 =?us-ascii?Q?8BPOEMYaYxfhel+/bTjU30MzQIfkSfSAVbGquP/V+gq3WlWraa7pe+1m6ebj?=
 =?us-ascii?Q?GJuEV/4yGlTRBX7N00HXFFs+Yo1KCY++6Dde2p3wsUSp/L4CnTX3m3kBKJJn?=
 =?us-ascii?Q?lFlB+P2fCPweuau0vlj5/0U4ddZJpqJrhtgBXz9j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902d60b9-855d-4410-113f-08dd0d345b56
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:28.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5zvLo0yabRimMVMwGzR5KR0yydHAZIvBmxxHubxNxbc+AWRZOvJumRLYpgOTYXTIiIA0nlLvZFrt1skNJlyaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
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
v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_ic_data data strutures.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the driver.
* Take DC interrupt controller driver as a standalone driver instead of a
  component driver.
* Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
  struct dc_ic_entry.
* Call platform_get_irq() from DC interrupt controller driver to make sure
  parent interrupt controller driver is probed first.

v3:
* No change.

v2:
* No change.

 drivers/gpu/drm/imx/dc/Kconfig  |   1 +
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-ic.c  | 279 ++++++++++++++++++++++++++++++++
 5 files changed, 283 insertions(+), 1 deletion(-)
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
index 000000000000..d2469ae9a23f
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
+#define INTERRUPTENABLE(n)	(0x10 + 4 * (n))
+#define INTERRUPTPRESET(n)	(0x18 + 4 * (n))
+#define INTERRUPTCLEAR(n)	(0x20 + 4 * (n))
+#define INTERRUPTSTATUS(n)	(0x28 + 4 * (n))
+#define USERINTERRUPTENABLE(n)	(0x40 + 4 * (n))
+#define USERINTERRUPTPRESET(n)	(0x48 + 4 * (n))
+#define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
+#define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
+
+#define IRQ_COUNT	49
+#define IRQ_RESERVED	35
+#define REG_NUM		2
+
+struct dc_ic_data {
+	struct regmap		*regs;
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
+static const struct regmap_range dc_ic_regmap_write_ranges[] = {
+	regmap_reg_range(USERINTERRUPTMASK(0), INTERRUPTCLEAR(1)),
+	regmap_reg_range(USERINTERRUPTENABLE(0), USERINTERRUPTCLEAR(1)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_write_table = {
+	.yes_ranges = dc_ic_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_write_ranges),
+};
+
+static const struct regmap_range dc_ic_regmap_read_ranges[] = {
+	regmap_reg_range(USERINTERRUPTMASK(0), USERINTERRUPTSTATUS(1)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_read_table = {
+	.yes_ranges = dc_ic_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_read_ranges),
+};
+
+static const struct regmap_range dc_ic_regmap_volatile_ranges[] = {
+	regmap_reg_range(INTERRUPTPRESET(0), INTERRUPTCLEAR(1)),
+	regmap_reg_range(USERINTERRUPTPRESET(0), USERINTERRUPTCLEAR(1)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_volatile_table = {
+	.yes_ranges = dc_ic_regmap_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_volatile_ranges),
+};
+
+static const struct regmap_config dc_ic_regmap_config = {
+	.name = "interrupt-controller",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ic_regmap_write_table,
+	.rd_table = &dc_ic_regmap_read_table,
+	.volatile_table = &dc_ic_regmap_volatile_table,
+};
+
+static void dc_ic_irq_handler(struct irq_desc *desc)
+{
+	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
+	struct dc_ic_data *data = entry->data;
+	unsigned int status, enable;
+	unsigned int virq;
+
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
+
+	regmap_read(data->regs, USERINTERRUPTSTATUS(entry->irq / 32), &status);
+	regmap_read(data->regs, USERINTERRUPTENABLE(entry->irq / 32), &enable);
+
+	status &= enable;
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
+static int dc_ic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct irq_chip_generic *gc;
+	struct dc_ic_entry *entry;
+	struct irq_chip_type *ct;
+	struct dc_ic_data *data;
+	void __iomem *base;
+	int i, ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	entry = devm_kcalloc(dev, IRQ_COUNT, sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "failed to initialize reg\n");
+		return PTR_ERR(base);
+	}
+
+	data->regs = devm_regmap_init_mmio(dev, base, &dc_ic_regmap_config);
+	if (IS_ERR(data->regs))
+		return PTR_ERR(data->regs);
+
+	data->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(data->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(data->clk_axi),
+				     "failed to get AXI clock\n");
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		/* skip the reserved IRQ */
+		if (i == IRQ_RESERVED)
+			continue;
+
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return ret;
+	}
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
+		regmap_write(data->regs, USERINTERRUPTENABLE(i), 0x0);
+		regmap_write(data->regs, INTERRUPTENABLE(i), 0x0);
+		regmap_write(data->regs, USERINTERRUPTCLEAR(i), 0xffffffff);
+		regmap_write(data->regs, INTERRUPTCLEAR(i), 0xffffffff);
+
+		/* set all interrupts to user mode */
+		regmap_write(data->regs, USERINTERRUPTMASK(i), 0xffffffff);
+	}
+
+	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+					     &irq_generic_chip_ops, data);
+	if (!data->domain) {
+		dev_err(dev, "failed to create IRQ domain\n");
+		pm_runtime_put(dev);
+		return -ENOMEM;
+	}
+	irq_domain_set_pm_device(data->domain, dev);
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
+		gc->reg_base = base;
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
+static void dc_ic_remove(struct platform_device *pdev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(&pdev->dev);
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
+	pm_runtime_put_sync(&pdev->dev);
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
+		.suppress_bind_attrs = true,
+		.of_match_table	= dc_ic_dt_ids,
+		.pm = pm_sleep_ptr(&dc_ic_pm_ops),
+	},
+};
-- 
2.34.1

