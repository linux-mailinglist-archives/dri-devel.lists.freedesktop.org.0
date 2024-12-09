Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2279E89CD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867AC10E464;
	Mon,  9 Dec 2024 03:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iZ0uEcQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A2610E466
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woyToDYmZGEteD+o5CsSw0Pt969NDYz2CTcXavVp2CJrTKLh0Zms0wvSYJ2Hx4bvd4grAhikZx4l4MAwaQ/XM4BBvaVwuD0Q8hkgf927NHBGS+qAwaPxEbyRKmfiRVbiXZyyV5ly1MGRmDWVZOuI8Jv2pdWumuxHQGHCsTsqtuXGG3imp1PyNdDqNxWTBQfuPFv/wkwfMfOXAXPSAzPmGKZA6yKH9Q7Ec9rBrprXKCaP7DXiCLMCFDDa3Rc0y2Rh26y+WJ+NWHLTVKRmqqNkiYrPOeaG+PgqIV/34ZHbbCAljJ6JwrANHQ4+CbX8gI3ruCotxys4x2u+2gkMLBr8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vqMAEEP4qGkTrZnN237D35vr2ohniNCmRmPDgk33kQ=;
 b=TWGA7IgNp3D5PP7FKwyqAcsKKhu0AsnNHcQOKW5WLuT92Knaz8/jk+637uFeP6pQizdX3cOFP4bR0mHJamJb6ixABV4Vg/EKEXmx/AOngSNGdOo+zSdhnzdQVrAeOTfjx+1X22zVFgnsacPThvzVxH9lvKqhbRhgoj4zQbJBlSV6dJM8Md1AeBJiStkrf9tdxc9/5GcOdTw7X3M5vypuCfxMUHZ0VUwI7WGp1ynLFQE18T+3Eah+dQdGmasvxLhEtedF5Sb6/XBAgQ47rkf73b6YZNJmzJnwzUDlftieXPKJ22+pN6Wg99e4ko+y6J0CtLn2RMAV1YNOveWt9bO2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vqMAEEP4qGkTrZnN237D35vr2ohniNCmRmPDgk33kQ=;
 b=iZ0uEcQ7dii/APSeDqXGNimA9tQkvaZyw93N5xPNN+qtKB+sTUseCiIyZ1GDQSHAuMpe/KwTOfG5XohRLS+IiUtR1NJafzVuXMMjm7OG3ZPwvYOEM7EeGT2TgiETRuSusIFJ0Gc17uD2W6rvjPBXNt39/NibQGVPyAV87xOPFTGDgTeuHix+9D6KaxcRtOYIwI3TRNyoL6Vzz63ktFaZx74tka3cBjAwXKI5N8CouSBaKXKY2WcQpoAqDMNtoIO3fTq4vpxK2SmJbVXW+2NeCzRzepbJxf84uZZPYIzWO5BPjW6NIo99K7TBgQmWXTH4X99Qq1irI7SxRY6af74A+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:41:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:41:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [PATCH v6 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Mon,  9 Dec 2024 11:39:15 +0800
Message-Id: <20241209033923.3009629-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 2069c088-d4ea-4e25-558b-08dd18034c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YcRzA2zmmTJjVvW30SdpgwqSXzlu5N0zfQZkfo9fzePd7m6Z8NVsn4he/qvb?=
 =?us-ascii?Q?pCH3XrT+ZEMOE6XzVgGq7qZvD/vv2id//SNd5l1Bn8MNfHC3WEF5At7x+Qtq?=
 =?us-ascii?Q?9gf/xRUzJx0STBrgHzEI1di1MDxmt5R181R6Qh3ggrSs47xWXTr8mgSm1vel?=
 =?us-ascii?Q?1o9mizMVgADlGn6k1zIVI2MsPgpcqs8OnVOkK6Kj7e7J8vUejHPSIW3KzY+j?=
 =?us-ascii?Q?d5VD542WcICsKiA4k/kMqZ8E9Wv6R+Nr5t/Yg5yCWCP1d43gil3n7T3fYT+R?=
 =?us-ascii?Q?UsoOpR5nFUezN1xEkfFjTZ8ALB9riy1N/kPdwAx2HpD9uRM4dKrEv283QLHc?=
 =?us-ascii?Q?sey0KJmuc4LLBCUfzpY+LCpaZV87t/8ZEjExlb/len0bQZ8zZIpyOzLPhFxt?=
 =?us-ascii?Q?A++2vpyzGbXQOyT79qZMXZHnGJHyUwsZDarY10CTrfHhey3b52vGYIpsDj0y?=
 =?us-ascii?Q?mxFsYFEiSA/6YyM1tqRms+JWzxik9RldOpWAIIdADrXc9qK/IK05zDUYfZLg?=
 =?us-ascii?Q?YovE65D0qVWL05UcIt1VNJCqD8IG2LnV7vXv36WsGpGtL7YhMBPdqDe0vysH?=
 =?us-ascii?Q?ATy9Ez8x+YFSg72Sr//JfKNp3h0f3AAr7rneIhv3ZPdiQbGutibwy00/434z?=
 =?us-ascii?Q?ZBljLjTY1w7WnaimFcC1YpZPmggKme3PBOyh4H0TilnwdRsEs7EUVodhxvnz?=
 =?us-ascii?Q?5NfQNUR+dKGmGJ+BcKkEYzjjWJW4qekacWw6OzXjIw42d4D6uRJez4X6jH6g?=
 =?us-ascii?Q?r6MSKOO9UqnACiQDEfItJgLxCZSh2lc1csoooo31inphKayfE8qIf2V0fhhN?=
 =?us-ascii?Q?cH/N/ENuJAluX+jZKLevJcs9EM0J1WA41xl1yTIZNHjcEJNdd4m2sa+TnXx6?=
 =?us-ascii?Q?khnwi/0Mc6nm7wQCI4tRGcKGJ5VoaWnpqAr74FflPCsWRGWmRL+sKqe2nXG1?=
 =?us-ascii?Q?7G8/y9tzsuek+RdNKfb6pnZen2YEEypNlZgGJEjPbMUkAo2zEYW8331gGKbd?=
 =?us-ascii?Q?G2qpvpiVeJoFf1uzACxzE/MNMLk+Iz36eMPOIvW0Dm0R0hN9H73Gc9joHDjA?=
 =?us-ascii?Q?PoYPOppT+oXtQPTQwEOBkMd5KAzg2slxuAxpEBfihXy8NX/1cs4XBodXj4ot?=
 =?us-ascii?Q?W8DMtYPWkfRHcq3eSOC5h7Bjjigvl5BPVZWWnT+/3bfwQEFdmbEnRFnw6zmY?=
 =?us-ascii?Q?fTe21+2nbjbWzCL+BDGcGLZJwjIVxSTd+bg59i4CjCo6jxarYwJv3sD0V7Sb?=
 =?us-ascii?Q?BoYXW9l+5d/xax4cO6LmyQcTmzwHvcNydZ3pvfmUOWE6pN7B2nwI7fw9lEjH?=
 =?us-ascii?Q?RcKH9d1QKmp5UwufHwD4a9rXYFTrl5MDZJFxmKQFkaIhQYZYcaiessipIpfX?=
 =?us-ascii?Q?1yp5Njjok/Gun9EeXaOH5kOO3VKytikfi4IL+si0t+TtQfux9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zI2e6uxUjgFJKTni8wB0uzmFuUx9//6DkaK09SdDXt9NMXoUgnE6cca76ijz?=
 =?us-ascii?Q?1kBc8+HwgOr03mkCaZcReLTOqNkeCl7ATkkpuAV6R1CpUafWRvdX9sa0efn9?=
 =?us-ascii?Q?vm96ktmCR+ggFK8v0Khs34yqMrmh/TP6/3yl5WyrOzDR9l0etUDwp7JZ51BE?=
 =?us-ascii?Q?Yrx69pU/qjPPJz+Xz+PemejkmYhgO2TQ3KMmwj8b0Hxkc2AHMbID/qlaenOR?=
 =?us-ascii?Q?1wItdgRIpL1Vn09CQppi5q+iWJlVYLfGIHl526tFVii4MXiWVEbwYeBDwRnN?=
 =?us-ascii?Q?ZrrTo1he08dTngf4O4v8yr3relHVonVBBLcrjdbbWxF6LAugi85DepnSbM9X?=
 =?us-ascii?Q?000vQsl4RRNULCFsJekYa62wQ1dbsFaN82yz23n+NEvIKr1XNC81XExlNSU0?=
 =?us-ascii?Q?WHC9qcSoWmKFg9dJN1eNtMcM8VB90fGvJZiCQ762jFfBkBGORlHBWFZGyoeC?=
 =?us-ascii?Q?O6sLZEp45j8ogWo5WM72dCVZQliv/oVu8o5dRK4Ilp2Nt6K9E4pYkqrGZ5DK?=
 =?us-ascii?Q?OTOQPNrYUrborOOsAhxJ1bytiAkmvJ/l6thqZhWTbRpbO0JdOFnRU0dTp0j1?=
 =?us-ascii?Q?pZkGFkrnARB5qGgqVKFY3L3lKEeY4yxKG9G5b0FG6l7JiIfozONzS8Fk3dby?=
 =?us-ascii?Q?Lp1ap+4WZ8OD+TRQTW/BKNft5LETZmqFksRi1yrzcG5gp78AmkKG5rhYGK7O?=
 =?us-ascii?Q?wx1dD7h+f48qyYpLE4gtnupVjCxA4rqat7C1jqEGJAMm8zwVeVTaDRH5jf92?=
 =?us-ascii?Q?k8VAf4OTzTsNHKgDJlXjEk9bvIUju8l2Pqr0Ex+mNXDIv5Hj1qmcuq50ZP5q?=
 =?us-ascii?Q?R89OJTdAmUXq5/T1Qy5dkyDA99dt9lj5ht66hTVAz1CeixYh4RliKvp357j5?=
 =?us-ascii?Q?mWRl/WlosdFtElOBEigxXfHracyJqzttXVH5WwtFkr0l7c4Z5fMJ2VST/G5R?=
 =?us-ascii?Q?LVLp348REHmQ4j8eFXdZUKApo7/TlmMxflrWsc7AmrL5eF7z2mRovmm9tSuJ?=
 =?us-ascii?Q?DqeZqOS38r7mCrxngvJuXx8jsnPRTFiNWO3pIqu3jLonwgrSquaNlVSQuDir?=
 =?us-ascii?Q?0o0YDu5lMS4IAzK2zRtN7AfaF9OFZwTNd3+P6s64qVhuSqR1bX+L6jLVMpnf?=
 =?us-ascii?Q?qg0SWJbJ7XjkkAWp8CVc/mDAjFf6xonlSTi0Nsp5VQj3MiFjW1wQhBQQ3GDe?=
 =?us-ascii?Q?wAH57NW+Vd0H5wYyHGe4PPMS3Hjn8+1bRTuamTX0Dkw17ih6bikGCiYMs2XM?=
 =?us-ascii?Q?KgPg1TiEVwrbEX7Wxl5JVA5Obm5gySGpPOfcnTmVT0oaxVaH65ozwWDiSH9o?=
 =?us-ascii?Q?qlsPhYx7z6x1r+GfGTMbqw2Bgy6M9lZ6C9K+d6GV4OYI0Sm8y5uAxYJc5Dml?=
 =?us-ascii?Q?8JnPQ1jFD/IaNIO4efjxd+AWsG08n7tVEv1psRhfGzBsWojJJPlPd9wF8w9C?=
 =?us-ascii?Q?e8bXkNBMVOJIbb5LroNnsVC0Q22rqcCMZu0N0BMbfdjrty8SsIqs2m2R2OCz?=
 =?us-ascii?Q?JnhS4Gks7NQNzv/nTCIUloXIGCoKgzVLuEjtoFC4kpDiAaDgB4y4y81qP9Es?=
 =?us-ascii?Q?77MSqQ2rPlm9a8eI4+RNb9hiwTqTN7G4G8vDFF8q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2069c088-d4ea-4e25-558b-08dd18034c8e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:41:00.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0e89l1lsRuRr/dc+sF2dLurvEdRE9IxDVnby7lq6gNqFJh1RyZs7TWG6tGI8u2PO9cBwq4cRaLkBaUesXNwZMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
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
v6:
* No change.

v5:
* Replace .remove_new with .remove in dc-ic.c. (Uwe)

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
index e1ef76d82830..1fc84c7475de 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select GENERIC_IRQ_CHIP
 	select REGMAP
 	select REGMAP_MMIO
 	help
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
index 000000000000..f022f0374772
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
+	.remove = dc_ic_remove,
+	.driver = {
+		.name = "imx8-dc-intc",
+		.suppress_bind_attrs = true,
+		.of_match_table	= dc_ic_dt_ids,
+		.pm = pm_sleep_ptr(&dc_ic_pm_ops),
+	},
+};
-- 
2.34.1

