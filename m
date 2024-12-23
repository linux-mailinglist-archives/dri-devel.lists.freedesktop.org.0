Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC869FAA92
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1510E3E3;
	Mon, 23 Dec 2024 06:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aPKjcJFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6967B10E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOoKXPCqQ1q3Y4F6F07ZRlzQC8kVMNaltuJdXLGq/Ks/v6icXLDF8r88BuAV7rzC900/0HyLqjXp+EN0DTaXSJ7ohrUcNI1Nx1zk107mcEkTfsvTuYZRIsSaADXtQ/fdGHfFNJBOW4ZzLzLjx/Cn/Y9WLICWLmAeaCuf3W1AIcvgPmho/7CA3IwVT/p+CFv9R1S4D7JRqfOuhHwSI0cvFRtj9rvWbe9Ix9BcWrdiYUrA1R2Tj2fBZccfW206aLpFk/ANnt+G5Q+U3/Be0XESXB0ZvUBYVfU0md3XDR/Tyx/KgcKgoypnWI4GS4l2clRpz7l+isUYtKdHSS7MyyYp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWllqDNMybW+kg3bpR9Z4sBozBE2XTeXRnDKUeTepYM=;
 b=Pg0M9rYOufBGCf42xfNKid3utn8giOENeS7FCGeAJ+a6JQn/3SRfK10OIlxGuc2sTn1MU+zeeksYmh2p/Jd4xt7DTDgm/206+hr4KKYlidU3elWhgfCglsOtjngUIWH8s83mbvS/KiLjTdD+5Y0lzADJNg+RCFlHEpGhvJrTyqB1HfoKoAJsDEpmjGNoN/CMSEGcaQlXYeZ7yxaS7YXsNxawja5XIgLxEdEhOEQsDtcp8Vs4Rpb9NxZLuhSBJUPQhA7pIwDk8fmhnSt1UJ7S2I7Y/joL6N6w3WSUA1DjyWA8J2prnJXxzCW6anIq1WDggutTQZVkPvptQ24jPZpEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWllqDNMybW+kg3bpR9Z4sBozBE2XTeXRnDKUeTepYM=;
 b=aPKjcJFtvkGafD+qaGKvFg02BsObmiNPaqXrOAffVq4SZGC4Eukb0yjdDadq4KzhXzF8s4Ib5HjZqcYer5038LcXq+Fq9YRjUwo5lQIc+OMym7ldJSkTHPxc9YPfdqdAgg3BmuoAoTB5p4vVNrTJPtgWGunyWRU4SHiV+q9bk1EmgmAYjlQ2SH2RqxCQY113F5afrpQOJcgjXNFZbZZxGdHfM1JCWnv9EllLDhD+GZ4x7Nwg0RbrgE0yEwwu1ElNW3uLY8irYu7y3ThwNAOaYI+zrPUZqJpXfqXSFBfytvOWLp8m4tMGhbjx4hm2j0owG2BeMa3T0g3uY66rL7zooA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:42:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:42:54 +0000
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
Subject: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Date: Mon, 23 Dec 2024 14:41:37 +0800
Message-Id: <20241223064147.3961652-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a14072c-6b9f-401a-9397-08dd231d074f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QXzpqxH3N/UARnRnmaw03WjklP/ZIHE3ewsuA7Q0Ms0c/5LQfc4oCk851PIH?=
 =?us-ascii?Q?OZY05H4bRGpAJHqF1LhNO9qZEe/l8KAODxEO89P4TNfDQ6hCB90jp8MaCiJo?=
 =?us-ascii?Q?TRxe+xQCNmXmMHr+j99npgxibO3E6ZF7qlgMZAWkTmh53ebYwWHv9gw/J/pE?=
 =?us-ascii?Q?1rMEzmT+FGTpFrXZcEldqJBJx/BOIibC5HGq4C5fuVws5wwadXVGYlBwgEte?=
 =?us-ascii?Q?RpE+DRb3j2jPRkNDn+GMhJldZv2TJm8tNNheEG9qZD9imZ/eerskZCIqdGwd?=
 =?us-ascii?Q?nWRYhQIAzSkZ2zcwEN4lRDd9YBy8XV/R3ac48PcNFVOpqSASPTFD2EcFTvid?=
 =?us-ascii?Q?Kw7HBEJ3DnQuH2mcm+lZxieqh45h3SVXPNCwgM7LzbLEELUKb5btCFxr6Nhf?=
 =?us-ascii?Q?d97nvKHdQ8C5VYuCSDk2OrLm3yBOxy+TNrayJ52y8vokGf8O5Fu2vNoC4aZT?=
 =?us-ascii?Q?DGut5KTAReP1xXfZkGcZ9pqzrnBDvScrRrM1I62r0yRmvvSaPN2EQ3uKNPla?=
 =?us-ascii?Q?CwuBnLQlHYSPYREsgMPL6QmpGJl9Ze313RIf+8XKVzsl8dVGvs93DHvDhkt4?=
 =?us-ascii?Q?vJ5x/rCJz276p270U4eKpiscvYuh33lCjJZepXuFH3c1I/iR0ziVnm2dmtEg?=
 =?us-ascii?Q?wd084ZDIYIiENG2DJOgHGFD2XVI9HAmII1u0uuG1c62/KeRyQ9kx7rZslHPg?=
 =?us-ascii?Q?bvpHrdDmGPWcTqmp1Gv9uLXV8wg9sK9CRRCf7zg+/fVdpxMREnApVAbQYU/C?=
 =?us-ascii?Q?+8OE9JM7roGr8FZDGrugJ8tgVn5e2AWMm1ZycV4ohF40ZDRUIHYiWdkFnFjL?=
 =?us-ascii?Q?F6/uI+Srf/Y8ZDZGeQoLigBEDM+isidGH1ZG0ESTcjjNJqLS+VlaL3KZMxBf?=
 =?us-ascii?Q?9pQIpxE5URPK3I9Wz+LHUM02NobBqR+aYy9w0V8VtWbpuiiL7znnpHV0L/Hq?=
 =?us-ascii?Q?g1ZBZepwn8/ns+E+wDF5Qqq6P4GMlGdpqSc3YPxcqcAOm6cDR4pgIv7i89m2?=
 =?us-ascii?Q?XNpAqVCfJ1mSjzuRU/kfkfqI3GHEmU94ZjMph+rL1REXIlVPYWXE0eb7KOYl?=
 =?us-ascii?Q?3kh1+A7Doyjk9X4oUJy6zyr5Sl993qm0IWP9mHiAjRmjH05895Skkw4XGO6k?=
 =?us-ascii?Q?Hdcjn9ORpc14r2mUMsb+LJRboDpAYYzeGymaHWco9tAnoS8zZAekBA1u6dQF?=
 =?us-ascii?Q?UoHLRwiTzWxLVLWQxMfZyKKPmfdNRl+hei155xQM6orWcTd8sxOby381hS6R?=
 =?us-ascii?Q?7TgIbsuYXSdlYoyTlA1h7rfTUSmu18aoPHr5CZ77yJ1Mee3uzFSwNd6sisKv?=
 =?us-ascii?Q?kdcTTVzQHF2bKiF9Ip+sNNkeu5o7JhulI8FjxvwhSPzvUi2TSzr6rMu3Avxm?=
 =?us-ascii?Q?RGca2zl+O9kgs4VBWGw5oYyh3iO2UNf5c08Z9mItYB5pzt4U50BNa9vq5kuJ?=
 =?us-ascii?Q?aKrViqZQcx6cf7/f7Y53eom6e1aqoIl5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ju87C0EpcrFNzPd8Swc+6gV2WhgFH2sYM6j1NIOUN6pWRcayjkLLNbMBD1Mo?=
 =?us-ascii?Q?VOfgR8Dm6pVqVNBJ6A6WXzgL/S1b//e/gLBwWpq4F6FPXhfsKX/9qgDDyNnB?=
 =?us-ascii?Q?XquWJORvYKqqLJ6hJgL4GZ/UuqtGDxNXvvqf2W9AeekBsh41Kcx8agjOifcL?=
 =?us-ascii?Q?8NJO5ziyEuYSEigbOyIaelqFruwBQHE2/gj9UpUxowkGYDhqySQ7keDlverk?=
 =?us-ascii?Q?5nmXKftIM6aEvwe4NYO7OR6mMujgj4BKiWki7u2TE1OaUyTR2Dwbqq0nl+ds?=
 =?us-ascii?Q?/L3nWx4q6Ks9rVCcq5agBX980Eh94Y4hPujBRJDEd223haczZSsi0azT4BWx?=
 =?us-ascii?Q?eYYaMKqaPCrLGshMhAw46kHuaTlSQnNRVYJCzLoYfRj90xB+zCGCYrBlI1AQ?=
 =?us-ascii?Q?/oaEwxAV3DoUdGX2M4ZZxpkkOmZ5laMRgU4V/oQA79dBDsQIjDITos1VHbDj?=
 =?us-ascii?Q?bYm6fBhcxd0VVkZuG9e60QfZ6hPnSTLgshPll85D045GBd10p7cIjh35gWw0?=
 =?us-ascii?Q?25kYutLA3Bf6HpJYPRuZ0Eq6BHem1BL1Xf24pDJcg1xKfV7ygYHudGeJ/tTq?=
 =?us-ascii?Q?JyqiIyyGaBvnKWLXfcuBFcZuqjfLRA/UTNsoPRfKIT9s9LfEFuqkzfjZ2ltA?=
 =?us-ascii?Q?PScJ+9NYqjB8SN+XUBxRqRm/5o+islml52furOCQplNFgW0yP+TDvoGMcLqE?=
 =?us-ascii?Q?E3j/poXWzu2fIDiZd4ySyVBcQjrrLHAmw1piI2N0+acpgKUSLmM92qPdUfR2?=
 =?us-ascii?Q?PbnFkZNc6eJsRFJzGKK/4gdfk3x3mReC5PKXECwTItGkKG3jmUYxqT3vLdBg?=
 =?us-ascii?Q?8p+UqREPek8y9ltrfvwTOCa4gE0e7DqlMNMbEsXhCUdHSRcd0FNRTYW3MqYe?=
 =?us-ascii?Q?Q44VuznMmix/K31us1fBfpD0pLmIMKS+YVKd0IQraU51aFA3c5gi2hEuJRnC?=
 =?us-ascii?Q?CnoKpDzIN6jebOY36HQXIbR+2vzlz2/Epm3bqtnZEoB26zh0upR2jgGE2oeq?=
 =?us-ascii?Q?dVWEJuWDw5pE4tDw6QcYMAJZKLuN2R3Q42efFBJYSqznsbbYW1EWwP/S1Nju?=
 =?us-ascii?Q?m3FjJizFpLoOWoNmvIyT8zbjYAzU60Ahn9VRo/Ido1sYIHFz46WB1nV1oiPO?=
 =?us-ascii?Q?3FSlU53wV/a0Ji2Ll5AhTYXDzawZJKfBWCimsVs7Cn8u9jQ0tx1XU1QGbNIY?=
 =?us-ascii?Q?UQzpYocj1N+ZQGMTKDvPYEnKUJi3ESPlsolS5d6c0JZ27qcWjmjx4LQ+v3jZ?=
 =?us-ascii?Q?GvrIa3jJDqm+wYE98x9fFCB0KOWFeWdNBgIBsRWb/cBfT76zMFyo6Rt6xHcO?=
 =?us-ascii?Q?ZLXwtr7SgoODuNCcW2Djf9G4kZJMXp3Ar28WuwnNZrWjoNyVE0B8E45KO0qg?=
 =?us-ascii?Q?xCghrPLQ3IGyog2f4Dp9tXerrV84cPxqbuydl1OUVXBwU4UFUhD0bMvtzV5d?=
 =?us-ascii?Q?g8kkFctLi5lMqqb0OhH8fK1QFuSvvHjeXT9uJ/H/4kjb8K9j5awzGoD4Toc+?=
 =?us-ascii?Q?NDg+29UWPTnpY4CB/ad7ly0UYss5welpDjP97buu+yXlKNEiSCOuKO/Syz39?=
 =?us-ascii?Q?afi2upHUf+D6mE8qJOe21MlNJtr9awHQDZSrPjtp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a14072c-6b9f-401a-9397-08dd231d074f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:42:54.2991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2EuvsMhU1lyZu+pX5h1TAKbpCwR3S8Ionz4gMo/Lc4MWyQPRQYPy9q/KrNayjvlpl1uN/+LpmJzqOWQaJa36A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* Add kernel doc for struct dc_drm_device. (Dmitry)
* Fix regmap_config definitions by correcting name field, correcting read
  ranges and setting max_register field.
* Get instance numbers from device data(compatible strings) instead of OF
  aliases.
* Collect Maxime's R-b tag.
* Trivial tweaks.

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
 drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
 10 files changed, 810 insertions(+)
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
index 000000000000..1eaa7db56a9d
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
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
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
+	.name = "top",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_de_regmap_access_table,
+	.rd_table = &dc_de_regmap_access_table,
+	.max_register = POLARITYCTRL,
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
+	de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
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
+	{ .compatible = "fsl,imx8qxp-dc-display-engine0",
+	  .data = (const void *)DC_DE0, },
+	{ .compatible = "fsl,imx8qxp-dc-display-engine1",
+	  .data = (const void *)DC_DE1, },
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
index 000000000000..b504de5589a5
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
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <drm/drm_modes.h>
+
+#define DC_DISPLAYS	2
+
+enum dc_de_id {
+	DC_DE0,
+	DC_DE1,
+};
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
+	enum dc_de_id id;
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
index 000000000000..23ef715f5cd1
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -0,0 +1,29 @@
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
+/**
+ * struct dc_drm_device - DC specific drm_device
+ */
+struct dc_drm_device {
+	/** @base: base drm_device structure */
+	struct drm_device base;
+	/** @de: display engine list */
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
index 000000000000..b5a0441b2b13
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,378 @@
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
+#include <linux/platform_device.h>
+#include <linux/property.h>
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
+enum dc_fg_id {
+	DC_FG0,
+	DC_FG1,
+};
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
+static const struct regmap_range dc_fg_regmap_write_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGSLR),
+	regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
+};
+
+static const struct regmap_range dc_fg_regmap_read_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGENABLE),
+	regmap_reg_range(FGTIMESTAMP, FGCHSTAT),
+};
+
+static const struct regmap_access_table dc_fg_regmap_write_table = {
+	.yes_ranges = dc_fg_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges),
+};
+
+static const struct regmap_access_table dc_fg_regmap_read_table = {
+	.yes_ranges = dc_fg_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges),
+};
+
+static const struct regmap_config dc_fg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fg_regmap_write_table,
+	.rd_table = &dc_fg_regmap_read_table,
+	.max_register = FGCHSTATCLR,
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
+	enum dc_fg_id id;
+	struct dc_fg *fg;
+	struct dc_de *de;
+
+	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
+	if (!fg)
+		return -ENOMEM;
+
+	id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
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
+	{ .compatible = "fsl,imx8qxp-dc-framegen0",
+	  .data = (const void *)DC_FG0, },
+	{ .compatible = "fsl,imx8qxp-dc-framegen1",
+	  .data = (const void *)DC_FG1, },
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
index 000000000000..a7d04e6eb8bf
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
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
+enum dc_tc_id {
+	DC_TC0,
+	DC_TC1,
+};
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
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_tc_regmap_access_table,
+	.rd_table = &dc_tc_regmap_access_table,
+	.max_register = MAPBIT31_28,
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
+	enum dc_tc_id id;
+	struct dc_tc *tc;
+	struct dc_de *de;
+
+	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
+	if (!tc)
+		return -ENOMEM;
+
+	id = (enum dc_tc_id)(uintptr_t)device_get_match_data(dev);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
+	if (IS_ERR(tc->reg))
+		return PTR_ERR(tc->reg);
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
+	{ .compatible = "fsl,imx8qxp-dc-tcon0",
+	  .data = (const void *)DC_TC0, },
+	{ .compatible = "fsl,imx8qxp-dc-tcon1",
+	  .data = (const void *)DC_TC1, },
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

