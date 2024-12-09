Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118199E89C9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEC210E46A;
	Mon,  9 Dec 2024 03:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GqNfFryS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF8610E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChuB4EfvdUquAQ5CjK8SfYANM2LTl7eU56ZHUKjmJX37rSr/mCl2uS91fxRatOKIddSaxonnuxwFzD58Vgsn4bHXCt/UAkbwiDJH7wZbqM+698yw2+hf8YlAzKDrmkA2DvCocZjTIUAgrlhebebUhvSEsnj59VCB1KrvL8TZTRTPcMQLSEXDRgdWckJLgtlCqyDDue1lLIP+bLN2qRQ4X5N1XZATLPanLENPaOth/z5iCFVgrAFrFMp9qV8dyYHyXtMKhO0+1dBuy8IHJM6hfkjdRI65TpMjm3a9o/6Mr1CbRiKehiaX5oPi7rOEn5HtuLwdYAVUvNWRBbydBNEOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E23rj13lNX9Gwt3CtMTLK2LbkOASS04o9oPiKM5HD8A=;
 b=ny2rD83nrWI8pry0VvDUyrqT4hKi3vIdm5A6Jjni/L0SYdPN1xfarSEo800Na+ACP2kkdbjfh4oTRD4+WnCQWr9Tc2GGNR4TuESLjygg3tzaYPQt7EfjV05x+PLSLTJlZNo3nVR/W/gG8m1SeVmx6Z9SXVbNXWOds6CwYyqFavzRJlL+ojQo51igJc5msYfnd9Cw8P+9Rz6eP17d4sVdiUxpFecdaagUkFKqaXP6YkN9SpCcAWGKTKt1H0weQ4g9KRWKT7Rr1ZQSOhKxvhLvOX9o73vY+1QzgNEW0ypmIxajy1RYMqsZwFawPme3o9YQBV8jO6qyf4yvspVbOF+raw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E23rj13lNX9Gwt3CtMTLK2LbkOASS04o9oPiKM5HD8A=;
 b=GqNfFrySj+Nr0LPvg57QuTTEvMhf/+4aENfXvjyQTp9g6D3iFZKW2IeasNR+II3KMUNtTDvNIn0onPkYHqzR9AjVPzpoMQrTtc3rij4kgYf7PxgA78T3EJf0RqxDj1iacSjXg19JW+Hn7fls+eLrgFeIgj+DacdYkL5lq7sSkXa+XbJ/AQSMOEu36HUZ9urz+ZOiOsP50NsSMVT/0kZ29bDnmvHhkM4OjXERWSB1hpTGefG1rpp7kLp4gmHpS1EOeLOATMuzKwCMjAl4G9wRYvum31n+sNYttR+XJ8BzCG/KfqM0ObzVzklQ3STWRDpNY4FJCWQUWRuWCksqekLMeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:40:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:40:45 +0000
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
Subject: [PATCH v6 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Date: Mon,  9 Dec 2024 11:39:13 +0800
Message-Id: <20241209033923.3009629-10-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2c0f0e1-508d-427b-9603-08dd18034379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QzLUF4YxKqREJ6qu8M0KBUBsdEVjJmNUDiSCblZ8ITg9/1HNpeNCHkyuJMfe?=
 =?us-ascii?Q?+LKr43K82evDyIQmEOOFTOo5MqFV1+2yL/witG+FJxyk1DbzIM747Iboy9qT?=
 =?us-ascii?Q?aF7Cn2Lscn/Lm2pczgQEBUY9vQ6FazyffhX2zay2BtxTNeM8BalMRemLU6MX?=
 =?us-ascii?Q?NdnAYCKh4beqfSX5wmOZTmK2pH6TbawrIryWRJPO+rogNg6xfBuxyh1pk4RX?=
 =?us-ascii?Q?27iGhoivYl75m1wh+lsh13Z1OjDJj/FvCgQibvUPVp9oWxhwcZjcpOT750n3?=
 =?us-ascii?Q?W6dzRrcePzTGgctg8yxPccV2kLCbuKSO1M8UkSzUSFGI2su+fKsc9xze/NmE?=
 =?us-ascii?Q?3F22NvHBGFCSHGlSZ+tmaUDz/I4M6goQS7ty1GQHCAyTDDgUnxc+W7NqsExV?=
 =?us-ascii?Q?oatH8gZswF0/hf1i2FIB7EhyFCDMVk+m/gkSgr8cRFrFu9Cm3cD+OhV0gMnc?=
 =?us-ascii?Q?Nar4zo7zxsdLxrls2SSI+m1bccVeCihEm8Nu0bsBFnh2UDMqPQb2sgoLCsPz?=
 =?us-ascii?Q?SJcmMHGBL3WIBxD/gp0Pnl3CvOiO8fi4RUjMQTsRRO/a0k0zc5D5nOBFKpMB?=
 =?us-ascii?Q?+UAG8vJXm2dT1VXaejdrF2bM/E0mMJUSW6Pr5j0UJYZAeZeOYhidl79NGIWN?=
 =?us-ascii?Q?0mnWjz2owqDDRC061m1YSrrTz2nuWX9tRRuUXX9ArRJtLjIZO3QohtkTSl8j?=
 =?us-ascii?Q?PkZBwPUELcThZ2kyNZzsMeL212owYBdiiHMUYV8JFnO4L9jJ+zvoCylCYobK?=
 =?us-ascii?Q?j4pjziC3zG4Tql60AbY0qqC7H3kiILK6J2ErJ/311th7L6YxD2qm7vGiiQm/?=
 =?us-ascii?Q?9ETdWLS22ya31FNN+C9qA0mnztUGQbprYSCHY9xkb/lBLJARYox+O3OcSoeL?=
 =?us-ascii?Q?GIrwlo6Ucnb9PQaqg3RTxCbuszwuAouQT5kBN96+dbLIFIVwiISqmZNdK9Ee?=
 =?us-ascii?Q?obMfMrlBWpU8LzkGXarFDA0v9qD9KPSOZMvGAvDSu2o63zyfXhW1ddaUrmgX?=
 =?us-ascii?Q?myiwaXS5gCTmi6C19lAdi/WiVrRIVbwN5PJvzGKdLSaGg7iRbWJAqvgFEghY?=
 =?us-ascii?Q?kbnot+euQwSxno8dfumBwYrnq3ZJg7NjbEGDBKFcERD2FLcd29gnsyLfS3dz?=
 =?us-ascii?Q?zzFCRTk0JkExcN9+NKCe9q+EueAeibZ5h0IKyXwbAKpxRK6ixXXizTxnAZTi?=
 =?us-ascii?Q?Gbtn4/AULCcBuua6RRWNNPZSebKPiImPRbkoQ4WTWF+nJa2iYoCuwFst5+9U?=
 =?us-ascii?Q?JR0A3GQKWvA5/sW20VSNrW0hep2arejUzQZhgFPxUbhYPYRZxQAztzz1oEmE?=
 =?us-ascii?Q?lGVSulMVYBqot/RJVNTVCpftQnkBIJJ3+5yleMoayaY83qALrG8G5BtqyU1g?=
 =?us-ascii?Q?Qlr6Eq0y12+Mu34pcGF8og2FRr0tyNbO58+BzoDWPOWOUPxsXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?15bUVh4zq9Rq71ojviNNe9Y7hP1IBQWQzE1o5bxCq+YLSdJS5RsZNM7EI9l3?=
 =?us-ascii?Q?OTACm+X4D85pj0gZOFNAl5VV7JaZWTAAEKXEqQxWKc7li6TTqlBXOkdYKEcH?=
 =?us-ascii?Q?jNnZO1nloxyf5yVnEbTo/cANsJRsb0SsHRnJt1mFKlPy6qIlqOlr8M/JO4/v?=
 =?us-ascii?Q?7CiOWRo9sYdJRTDUQsvd3y6uJWXxpU/jTLHAIjzj8SWB3eZ/vicfcrANsX3V?=
 =?us-ascii?Q?LHOre8jPiQOMFC7PYIC72MErmuS+yDFBSHHL+ZglYu7sIpcS7p7Ee0jEoRA3?=
 =?us-ascii?Q?RHT0e8kkwEsQn6pIAkhqNGZTWcTKutW7zKo1t6d2fC/aUsUn5rpG+7lHcXOp?=
 =?us-ascii?Q?6W8r5U0CUcIBkxPMyD6fsenuXxMAVafqRKLuwSbvkw2lvJ4ibkSTctQfQHi7?=
 =?us-ascii?Q?l/GpT3jQY+gn3TBgWToE+Wst5rygZRE8fMM2yLSUQ907CDMz15aHOyVXJ39O?=
 =?us-ascii?Q?5EL6vz4GxL1nie1xLMPWnuFLwTz/sAuJI8Nwesgs343jEyMfZNZrfLfOKP8s?=
 =?us-ascii?Q?8Q/1rSYIiT/aQGC3XR1dbRLWL8xKNPMj2wfBIt7W38cPxP4gZ6jo6LJ14sxy?=
 =?us-ascii?Q?zLrb0Y1rtFOvQawoCy7soNiwe/uh+djoERGjO9I4Rrwh+pmI4qtM5zhMXB9r?=
 =?us-ascii?Q?939UE2hN7dbk4wn2lRuYzzA/rK+TTe3RKCg6j8X0G0pvkJuTNBpzJfdPzHX5?=
 =?us-ascii?Q?C4uop6pkyC/DVV78LtdFsmxm5PUpMZvnGgBCrn9wt0s/DxlOonc82KLj8Z9y?=
 =?us-ascii?Q?cnH+qJg4XZosjyCHq03IyWtaePeBovJ/Kag7fa4PrQjYjxwAoUHgI2bRgAbI?=
 =?us-ascii?Q?lVmI1+tvhH5SsrdoDnrrpPEn8vhbrrdWB3YZgUO6+vwSH9xq0BjRHVDfXwp0?=
 =?us-ascii?Q?1EP1bomTx0QkR/5RVt3OEgvXO/KDRt3pJHmXCR0jhkvCmEjnaLvph3Jpp3CA?=
 =?us-ascii?Q?CkarxENfkV58cwCJqbfw72SeTGaWLv9NQo1cfngEYOxT4jCBuNISfy9SIUVy?=
 =?us-ascii?Q?dgw/RqdM31rBXNGbwcQ0EAthj3cobqDk+HN+xWgpTp7Sk85Qcj5wQrnPW0Ed?=
 =?us-ascii?Q?wBuEV3vvWXyq0E9URFsDUVmec1uJuxQ+33vmmEsuiD0nLEE25rzXbtEfW4y1?=
 =?us-ascii?Q?N9FEf4x2bwq7/awhAtcIyd6TWWVhfMVHMZfGV9HTCHql04O4NsB+fgJuhtGP?=
 =?us-ascii?Q?5Ti1WaP60K5X2CvOi6cW5DM2eo1zIp4vV1goozdRxpXVW0O/PC15jh+oPuer?=
 =?us-ascii?Q?5au4IejuKPBmLg/cv0dJ+9ER+cGW4HdnmmjJ7s7cr3R17UclSq+JerZX1F5V?=
 =?us-ascii?Q?oE1tRUoLMxZxJzTFb2i0Uz7XhFbjx6eg0LXdkR+yViunnE4TchIIUObaC+2T?=
 =?us-ascii?Q?9B+ozniXnR3JvWATxudx4j7JXp8wgdj5Gx+Ss4EgtDaZWUkBQYT5fSLBtWRo?=
 =?us-ascii?Q?v7zaGaTBSWWzzo//bHeQ6ZO3mPJAMqYowfNv0BVuMpBAKi7YRDK5KG8lgWwu?=
 =?us-ascii?Q?AqXOrpJ2hRaQOy+EARajEUIzyfOHkPn7ShaLi63cEttUQORnbgqyvhihWwcS?=
 =?us-ascii?Q?H9EBzR8hkOP/4eApWbRD8qXWHuwUSdgyaMW+n+mn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c0f0e1-508d-427b-9603-08dd18034379
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:40:45.4393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9vkoJDteNHUAH6JDqkb5FapJ0/l2y5O7Too51wtFAP5QAraaE6RkGOYRxMn2fSKBaEc1YYH8N/yLXxIzn5YQg==
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

i.MX8qxp Display Controller display engine consists of all processing
units that operate in a display clock domain.  Add minimal feature
support with FrameGen and TCon so that the engine can output display
timings.  The FrameGen driver, TCon driver and display engine driver
are components to be aggregated by a master registered in the upcoming
DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6:
* No change.

v5:
* Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
* Select REGMAP and REGMAP_MMIO Kconfig options.
* Fix commit message to state that display engine driver is a component driver
  instead of a master/aggregate driver.

v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
* Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
  KMS routine to initialization stage. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the drivers.

v3:
* No change.

v2:
* Use OF alias id to get instance id.
* Add dev member to struct dc_tc.

 drivers/gpu/drm/imx/Kconfig     |   1 +
 drivers/gpu/drm/imx/Makefile    |   1 +
 drivers/gpu/drm/imx/dc/Kconfig  |   7 +
 drivers/gpu/drm/imx/dc/Makefile |   5 +
 drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h  |  57 +++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  24 ++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 374 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 138 ++++++++++++
 10 files changed, 792 insertions(+)
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
index 000000000000..e1ef76d82830
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -0,0 +1,7 @@
+config DRM_IMX8_DC
+	tristate "Freescale i.MX8 Display Controller Graphics"
+	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select REGMAP
+	select REGMAP_MMIO
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
index 000000000000..24cd37c1e4a8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define POLARITYCTRL		0xc
+#define  POLEN_HIGH		BIT(2)
+
+static const struct regmap_range dc_de_regmap_ranges[] = {
+	regmap_reg_range(POLARITYCTRL, POLARITYCTRL),
+};
+
+static const struct regmap_access_table dc_de_regmap_access_table = {
+	.yes_ranges = dc_de_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges),
+};
+
+static const struct regmap_config dc_de_top_regmap_config = {
+	.name = "display-engine-top",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_de_regmap_access_table,
+	.rd_table = &dc_de_regmap_access_table,
+};
+
+static inline void dc_dec_init(struct dc_de *de)
+{
+	regmap_write_bits(de->reg_top, POLARITYCTRL, POLARITYCTRL, POLEN_HIGH);
+}
+
+static int dc_de_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	void __iomem *base_top;
+	struct dc_de *de;
+	int ret;
+
+	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
+	if (!de)
+		return -ENOMEM;
+
+	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(base_top))
+		return PTR_ERR(base_top);
+
+	de->reg_top = devm_regmap_init_mmio(dev, base_top,
+					    &dc_de_top_regmap_config);
+	if (IS_ERR(de->reg_top))
+		return PTR_ERR(de->reg_top);
+
+	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");
+	if (de->irq_shdld < 0)
+		return de->irq_shdld;
+
+	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
+	if (de->irq_framecomplete < 0)
+		return de->irq_framecomplete;
+
+	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
+	if (de->irq_seqcomplete < 0)
+		return de->irq_seqcomplete;
+
+	de->id = of_alias_get_id(dev->of_node, "dc0-display-engine");
+	if (de->id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", de->id);
+		return de->id;
+	}
+
+	de->dev = dev;
+
+	dev_set_drvdata(dev, de);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->de[de->id] = de;
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
+	struct dc_de *de = dev_get_drvdata(dev);
+
+	dc_dec_init(de);
+	dc_fg_init(de->fg);
+	dc_tc_init(de->tc);
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
+	.remove = dc_de_remove,
+	.driver = {
+		.name = "imx8-dc-display-engine",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_de_dt_ids,
+		.pm = pm_sleep_ptr(&dc_de_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
new file mode 100644
index 000000000000..17a44362118e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DISPLAY_ENGINE_H__
+#define __DC_DISPLAY_ENGINE_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <drm/drm_modes.h>
+
+#define DC_DISPLAYS	2
+
+struct dc_fg {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk *clk_disp;
+};
+
+struct dc_tc {
+	struct device *dev;
+	struct regmap *reg;
+};
+
+struct dc_de {
+	struct device *dev;
+	struct regmap *reg_top;
+	struct dc_fg *fg;
+	struct dc_tc *tc;
+	int irq_shdld;
+	int irq_framecomplete;
+	int irq_seqcomplete;
+	int id;
+};
+
+/* Frame Generator Unit */
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
+void dc_fg_enable(struct dc_fg *fg);
+void dc_fg_disable(struct dc_fg *fg);
+void dc_fg_shdtokgen(struct dc_fg *fg);
+u32 dc_fg_get_frame_index(struct dc_fg *fg);
+u32 dc_fg_get_line_index(struct dc_fg *fg);
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
index 000000000000..bb51fe6faee0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+
+#include <drm/drm_modes.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define FGSTCTRL		0x8
+#define  FGSYNCMODE_MASK	GENMASK(2, 1)
+#define  FGSYNCMODE(x)		FIELD_PREP(FGSYNCMODE_MASK, (x))
+#define  SHDEN			BIT(0)
+
+#define HTCFG1			0xc
+#define  HTOTAL(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  HACT(x)		FIELD_PREP(GENMASK(13, 0), (x))
+
+#define HTCFG2			0x10
+#define  HSEN			BIT(31)
+#define  HSBP(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  HSYNC(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define VTCFG1			0x14
+#define  VTOTAL(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  VACT(x)		FIELD_PREP(GENMASK(13, 0), (x))
+
+#define VTCFG2			0x18
+#define  VSEN			BIT(31)
+#define  VSBP(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  VSYNC(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define PKICKCONFIG		0x2c
+#define SKICKCONFIG		0x30
+#define  EN			BIT(31)
+#define  ROW(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
+
+#define PACFG			0x54
+#define SACFG			0x58
+#define  STARTY(x)		FIELD_PREP(GENMASK(29, 16), ((x) + 1))
+#define  STARTX(x)		FIELD_PREP(GENMASK(13, 0), ((x) + 1))
+
+#define FGINCTRL		0x5c
+#define FGINCTRLPANIC		0x60
+#define  FGDM_MASK		GENMASK(2, 0)
+#define  ENPRIMALPHA		BIT(3)
+#define  ENSECALPHA		BIT(4)
+
+#define FGCCR			0x64
+#define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
+
+#define FGENABLE		0x68
+#define  FGEN			BIT(0)
+
+#define FGSLR			0x6c
+#define  SHDTOKGEN		BIT(0)
+
+#define FGTIMESTAMP		0x74
+#define  FRAMEINDEX(x)		FIELD_GET(GENMASK(31, 14), (x))
+#define  LINEINDEX(x)		FIELD_GET(GENMASK(13, 0), (x))
+
+#define FGCHSTAT		0x78
+#define  SECSYNCSTAT		BIT(24)
+#define  SFIFOEMPTY		BIT(16)
+
+#define FGCHSTATCLR		0x7c
+#define  CLRSECSTAT		BIT(16)
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
+static const struct regmap_range dc_fg_regmap_wr_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGSLR),
+	regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
+};
+
+static const struct regmap_range dc_fg_regmap_rd_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGSLR),
+	regmap_reg_range(FGTIMESTAMP, FGCHSTATCLR),
+};
+
+static const struct regmap_access_table dc_fg_regmap_wr_table = {
+	.yes_ranges = dc_fg_regmap_wr_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_wr_ranges),
+};
+
+static const struct regmap_access_table dc_fg_regmap_rd_table = {
+	.yes_ranges = dc_fg_regmap_rd_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_rd_ranges),
+};
+
+static const struct regmap_config dc_fg_regmap_config = {
+	.name = "framegen",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fg_regmap_wr_table,
+	.rd_table = &dc_fg_regmap_rd_table,
+};
+
+static inline void dc_fg_enable_shden(struct dc_fg *fg)
+{
+	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
+}
+
+static inline void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode)
+{
+	regmap_write_bits(fg->reg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
+}
+
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
+{
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
+	regmap_write(fg->reg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
+	regmap_write(fg->reg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
+	regmap_write(fg->reg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
+	regmap_write(fg->reg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
+
+	kick_col = hact + 1;
+	kick_row = vact;
+
+	/* pkickconfig */
+	regmap_write(fg->reg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* skikconfig */
+	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* primary and secondary area position configuration */
+	regmap_write(fg->reg, PACFG, STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, SACFG, STARTX(0) | STARTY(0));
+
+	/* alpha */
+	regmap_write_bits(fg->reg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+
+	/* constant color is green(used in panic mode)  */
+	regmap_write(fg->reg, FGCCR, CCGREEN(0x3ff));
+
+	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
+	if (ret < 0)
+		dev_err(fg->dev, "failed to set display clock rate: %d\n", ret);
+}
+
+static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	regmap_write_bits(fg->reg, FGINCTRL, FGDM_MASK, mode);
+}
+
+static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	regmap_write_bits(fg->reg, FGINCTRLPANIC, FGDM_MASK, mode);
+}
+
+void dc_fg_enable(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGENABLE, FGEN);
+}
+
+void dc_fg_disable(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGENABLE, 0);
+}
+
+void dc_fg_shdtokgen(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGSLR, SHDTOKGEN);
+}
+
+u32 dc_fg_get_frame_index(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGTIMESTAMP, &val);
+
+	return FRAMEINDEX(val);
+}
+
+u32 dc_fg_get_line_index(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGTIMESTAMP, &val);
+
+	return LINEINDEX(val);
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
+	regmap_read(fg->reg, FGCHSTAT, &val);
+
+	return !!(val & SFIFOEMPTY);
+}
+
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGCHSTATCLR, CLRSECSTAT);
+}
+
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
+{
+	unsigned int val;
+
+	return regmap_read_poll_timeout(fg->reg, FGCHSTAT, val,
+					val & SECSYNCSTAT, 5, 100000);
+}
+
+void dc_fg_enable_clock(struct dc_fg *fg)
+{
+	int ret;
+
+	ret = clk_prepare_enable(fg->clk_disp);
+	if (ret)
+		dev_err(fg->dev, "failed to enable display clock: %d\n", ret);
+}
+
+void dc_fg_disable_clock(struct dc_fg *fg)
+{
+	clk_disable_unprepare(fg->clk_disp);
+}
+
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz)
+{
+	unsigned long rounded_rate;
+
+	rounded_rate = clk_round_rate(fg->clk_disp, clk_khz * HZ_PER_KHZ);
+
+	if (rounded_rate != clk_khz * HZ_PER_KHZ)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+void dc_fg_init(struct dc_fg *fg)
+{
+	dc_fg_enable_shden(fg);
+	dc_fg_syncmode(fg, FG_SYNCMODE_OFF);
+	dc_fg_displaymode(fg, FG_DM_SEC_ON_TOP);
+	dc_fg_panic_displaymode(fg, FG_DM_CONSTCOL);
+}
+
+static int dc_fg_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	void __iomem *base;
+	struct dc_fg *fg;
+	struct dc_de *de;
+	int id;
+
+	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
+	if (!fg)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
+	if (IS_ERR(fg->reg))
+		return PTR_ERR(fg->reg);
+
+	fg->clk_disp = devm_clk_get(dev, NULL);
+	if (IS_ERR(fg->clk_disp))
+		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
+				     "failed to get display clock\n");
+
+	id = of_alias_get_id(dev->of_node, "dc0-framegen");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	fg->dev = dev;
+
+	de = dc_drm->de[id];
+	de->fg = fg;
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
+	.remove = dc_fg_remove,
+	.driver = {
+		.name = "imx8-dc-framegen",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fg_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
new file mode 100644
index 000000000000..66e0efbc90ab
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
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
+
+static const struct regmap_range dc_tc_regmap_ranges[] = {
+	regmap_reg_range(TCON_CTRL, TCON_CTRL),
+	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+};
+
+static const struct regmap_access_table dc_tc_regmap_access_table = {
+	.yes_ranges = dc_tc_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_tc_regmap_ranges),
+};
+
+static const struct regmap_config dc_tc_regmap_config = {
+	.name = "tcon",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_tc_regmap_access_table,
+	.rd_table = &dc_tc_regmap_access_table,
+};
+
+/*
+ * The pixels reach TCON are always in 30-bit BGR format.
+ * The first bridge always receives pixels in 30-bit RGB format.
+ * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
+ */
+static const u32 dc_tc_mapbit[] = {
+	0x17161514, 0x1b1a1918, 0x0b0a1d1c, 0x0f0e0d0c,
+	0x13121110, 0x03020100, 0x07060504, 0x00000908,
+};
+
+void dc_tc_init(struct dc_tc *tc)
+{
+	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
+	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+
+	/* set format */
+	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,
+			  ARRAY_SIZE(dc_tc_mapbit));
+}
+
+static int dc_tc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	void __iomem *base;
+	struct dc_tc *tc;
+	struct dc_de *de;
+	int id;
+
+	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
+	if (!tc)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
+	if (IS_ERR(tc->reg))
+		return PTR_ERR(tc->reg);
+
+	id = of_alias_get_id(dev->of_node, "dc0-tcon");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	de = dc_drm->de[id];
+	de->tc = tc;
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
+	.remove = dc_tc_remove,
+	.driver = {
+		.name = "imx8-dc-tcon",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_tc_dt_ids,
+	},
+};
-- 
2.34.1

