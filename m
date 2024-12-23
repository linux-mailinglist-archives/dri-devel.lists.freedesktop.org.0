Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AF9FAA95
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB8A10E40B;
	Mon, 23 Dec 2024 06:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hfs1vx2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D42810E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thQ6obuY2PW40wz8SmaHmEOLIruL69V86N4hKBmFig0Bqd0V0YsEYPeJJFt6KrIi6ohZlny4rOsY5ECWpj2LgCUK/zUX2bPiLOYlvJWu+rgNgHh/DKO9AAAEdbSjOne5hydRUwdrp1Echhjky8F5swVkDwchvOjO8MTZYv3O6gJ5FZrxVq5zTXpLKKw+4Ef+osvDPmkSr88fj/fgqowsUZLYXBLKYLg4JdE+Y5v69bvVoyQ540DjAxuWqgL89Y2CmMpJ09GrSiIJPAHvEL3QfAOoNQVGjyjK66snMXlwOFY/tQ/FOdUoCHHxa+aydBG2nc3fS3T4cewx8KM3RyL3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpDq32NOFHlSPy8giRuBRv8NGKpEy0FQgEjalPq5eSM=;
 b=SinVlgS9RcRUWEWowmxRogNmXXSDRV7r63D93HeC4iOkwBdK1YRlwb+3Ou7A/0DoD99q5lITMBtFTmiOjqBvfnMavMf0Xqey63dmt/NsPogGGDd9vhX3E5pXtIoyOLea2T+5MnIOFjEocG7bWqDTDHL9E3oP0gAGI+iTbxzkgInAsfF7CJ7FHvgjv8VD2eZYMPEkQ13aT+4Jl2JMuhHZzjAeJICGtThHPb2lYo/CgIvQqvGEw5zpt6ACZlRETbpEqouaI+50APlliTGebFmPJ/n1x+KaQEUKjvTVz21SuHKJhgwioG1ob10iYqmXL+SpUQdGQKj2j8DgI867QuqkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpDq32NOFHlSPy8giRuBRv8NGKpEy0FQgEjalPq5eSM=;
 b=hfs1vx2I/gh71f7eDbIC1i+g1aEjdl6nuiA5RChQ8hGWgqZU8YPV/fbba7VARHkGXi0jzNC9lPFYKiUxrwf8DxC+Ew7Z2Z/ZLYmrcs9sUCRT7CbRpzqIjjTHrDsnJq12YM+sF9Y+byXpWOhdi2DUZdRUiHL113idV7Z4mpObrEd9aCOruDh5Ckdztcn505roEYrVGgynoon+wtWuLwdg2dvcprkO6cntL+IfiYGzTR9LNYAXDl1c9APC4gqLiJkJXkiTUJ+IgG6uJRz8ymOSGdXl43r///8/KKYR9i0zO1hoHp9iPKFqsvgqrTs5+BumSlUfd8xm3jsnUwmnNE7kKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:43:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:43:09 +0000
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
Subject: [PATCH v7 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Mon, 23 Dec 2024 14:41:39 +0800
Message-Id: <20241223064147.3961652-12-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 42fe73f0-fcf1-4ba9-4a5e-08dd231d1076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wq9Ig29AnfVeNsUS7PFdfg8cp/fMIf0k5v1QI8tyHYAUUtodrnESl/hkX0vs?=
 =?us-ascii?Q?m35GtL2Znpo5wcE6kLgpmYgogP+QrYGIHhEoLkNwv8r6be6Ze8aF9j6uFxHd?=
 =?us-ascii?Q?Tsv+TSUyOl/Q7MeSRKE0zqSb5bwPHL8lu/mkwqRCSJmVKE2eVlEt5i087bsd?=
 =?us-ascii?Q?ZcYFm/w8baC2eFNjOKMxQBULl83pvwrcpBscxXQs2LJh3guya7djKfGJon9I?=
 =?us-ascii?Q?YBKylDWnQq/r9PhSKEE8LESd1Z8OyD8HgRgP/1jJHAN80HB2VlwivozNokmL?=
 =?us-ascii?Q?oGn6nlzEWCmstkdRQ906qL29s9looM38GjWb62KhqNdrx+x33ji74KTL7zmS?=
 =?us-ascii?Q?/N4cDfznVhDEhWoIpDMxIlg8m1hoofj2You/vMoTOMofw9hMMS6DTypP5Njm?=
 =?us-ascii?Q?sPvH2S5XQme34uXk/+3CKi24Rx9SIXyoYG4BQuV7ctfbWPzPspw/ApQ5C2xa?=
 =?us-ascii?Q?d7WmBWL+gVo1ndJJeTL4VhAWc9vHHkWidKNm2ZoCNIlQRgq0zSxKSvgEQuJz?=
 =?us-ascii?Q?hxrH65CIkKwgQPuJvbYEPGsfd55sCVQsNwSaUtqLaK/nsO2Hqra2Yf2mBK/g?=
 =?us-ascii?Q?WFV07XkH/B8crg4TTdi4jmYwEvhzs7fRSQXJIMzjsdaA/oO+eMN9QRCqSaV3?=
 =?us-ascii?Q?9P4S4j9UCH78e5y52Lhnp4aCtGq3O3Ab/UtNt7ewRx5gyE51B92pXq38P4wC?=
 =?us-ascii?Q?Nmuv0BSVVLczyslpwJFw+qTE5x33ZlEfXCbhtzG1g/hQjVr/N3YxJACyvn55?=
 =?us-ascii?Q?1iaEWOiJOw8oM2wYh/UmtvG2R2CAtvaVjU75XEbmVytPbrh/E/DxjvFbtZ+o?=
 =?us-ascii?Q?24MTKweTLhyKqgFEGsP05IFj9QHIAGqhXTY3++cFZtOJ9vfLU2NzeISbUR3G?=
 =?us-ascii?Q?7pE3lkpwDvPZy9XNbngwcdBTd5kRNu5C+kFX8RenHg4LR6PKwOAGh0a3CTkf?=
 =?us-ascii?Q?/ynRfGCSdGSWIw2Hjhc7MJxamczTGNUIRwgfyLTsweGN3qLG9AfqnCea1EG9?=
 =?us-ascii?Q?o/ZKc9Qz8EvTbRJbni8FpfZsWnKVP4YzjBXUeykb8RsMWK8MlaMEzKSuwFyj?=
 =?us-ascii?Q?3DUZt5b38R1z/eFQtllCGX1NRk6p/LN63W7IMflRaYWAUyxf2uQG/bNY8Jqp?=
 =?us-ascii?Q?+vy1B0+klLMyNp7LM2wc/1MYOyDakyJBjsnlYUe8wmo5UqUlv1L4muFzTQNq?=
 =?us-ascii?Q?93fc78x5SIv+WIMgaEMXKBsM+uN5lICWSzMuxI9pHzglbtiWbwe3OZjwiKXa?=
 =?us-ascii?Q?FT1XGd++l7cyT5VD8Vdp8UiIDdxcTQAc7wbwBOnTII3rKVLBCKFvcTLgXXVU?=
 =?us-ascii?Q?JAg081lfA3qUlu5PDgqlaJZUkMumUUfkNRW07HWXx4YsjS1Vi/isuimoNZ4h?=
 =?us-ascii?Q?jVNHO/95kF487Y4AhqGdb4LpG+HNeMYksVsPWHA/NW9N0UsQ5KBnhK5v4Q4i?=
 =?us-ascii?Q?XLOMk6hemqJEtdYCXnnBbl3kzr5/rhHP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mi2ECMR0MVKoMNpm7CKxIu5TvxSirmHhY1tLhd8YsfWElv6d5kKan+8ezZQw?=
 =?us-ascii?Q?VwG1+rN5Wmb8RQDwikeGOLYrNIgkdfJSBEJ/ik2X9sfuJFpKpHmKal2sF85b?=
 =?us-ascii?Q?VPDnGaIHl9y0b+u5CYR7gJ+ev8rLNLAP1L36yF4Z/P9jNYWmV/1tyVmiIgCQ?=
 =?us-ascii?Q?H3DXiGWIeE39OvhDS/LX5NderVGVTrp5lgmoO/zRk8XBUy2sI06C3rvx1Kkp?=
 =?us-ascii?Q?8kimiMUJteesnnf/j0FuToNR6oN/xwwSW7DXLb+av8Gj249/rtbfMOXmASlS?=
 =?us-ascii?Q?Dmeqe63u68UOM4PDdYKPkPeR78L4mgfFOgPvHM98uW3Ibm1d1TF/ZvzdzjAD?=
 =?us-ascii?Q?lzFa1OXhLM3Vvhe20cprnYQZJLfYiVtZTEXfs0A3EuR1/XUXbqSueoeXBHno?=
 =?us-ascii?Q?69UrXZjBOJBcAvGa3qUZ0v12eNEbJplbJ00HHMZ8sbM5yVPxi/0y6TbFpLNr?=
 =?us-ascii?Q?hRn4/6Mx/F3o9Uc15QTwy/L27epNUWpc+zzDt6HZDfE0u9LchPvpMHv/+IXL?=
 =?us-ascii?Q?+JoOU0a+SIr4LPB8SIunIo/yFUZR1mq2Pc1FmKBiSQ41yF1Tr2horsCi7s+/?=
 =?us-ascii?Q?TkyIgaY1HyxQfXnSElTQd8D01QMUzweLPrSFr5ER9ujvmaDZE7GrwgNKfcdJ?=
 =?us-ascii?Q?j4XkbdF1TllG8O6V+2lwZkOtyr/9mS8/fDQphISPO+2r1Uo77xa6fn/jZJlh?=
 =?us-ascii?Q?z+x+rRANc5o021CdMO+ohvEEDpZKapcaP+uiyaOq9/SbF8KEdKM4b7ckGUnr?=
 =?us-ascii?Q?3Dl+VUSR7gcA/zdgd9whIwtbU/TNEJEYA44LlfziL6yUsZy/97z5YjAbZckK?=
 =?us-ascii?Q?yJaZTE+ZSjMldfzDv7PCiuKzqXtBjF6L7Qoc/TSZW9zOxpq2m1qrXSeH9mKT?=
 =?us-ascii?Q?TJyszbZs5EKSYdFKRbojKZjYX9a7OTi+8rUEV03cFT6kfsjDWPBGPGcJWv3H?=
 =?us-ascii?Q?C6qqFTvbsAQPy0TfTRpPP9oU6kZpzqRQElCjIhpCUS1Vke4qNLF5s0/lB3qN?=
 =?us-ascii?Q?ro/bTY8gk6RZdSYAnty0Um31M1q4Xk+HE7MDlqAHy1StVIY0ci41SZpaVVau?=
 =?us-ascii?Q?edfbgFyZBBBycsfo668b/kI4x0t6QsATyzz0Soeksf04rvHlOdBGY9gkKjMD?=
 =?us-ascii?Q?HPefJjNVZDYG1CJvngBOKn5LYLzAlHADHpEHG14dGupE7y+1pTtg+teIQGky?=
 =?us-ascii?Q?a6twS1eoO3P/INs76EWF9fhV4Okq24lIQbhJnnknIjje4iXaxeRQILz8qxRP?=
 =?us-ascii?Q?SxCYKV1U1u8fFGkQcvoubtECO8ooylraOFCtcm/MYlzPUvgrgk9wL5AIQYkd?=
 =?us-ascii?Q?uTZt8zIF1FrMjv8VaNW4iikdWjJ7nX5bnVjMxYTXqJDBlFYPwNgY5mbaBXAY?=
 =?us-ascii?Q?3/2dI0wGWgMiG2QxLmYds1nohzOPo8RV2gT+IcjuBKC1HzhCmSGg76ZMNgWW?=
 =?us-ascii?Q?BT/a7PTmbgqQ0coF+oKkCI9/5lF/bj++uOdJ/K0n8f/6HU5bFOmXvcmdPdI9?=
 =?us-ascii?Q?Y9KqakRFqhsU+96P4kQHNW5EdRwdsWFv5n/QxrDd/Ir+9MfiRFZiuczmsiG6?=
 =?us-ascii?Q?AwtqxrGCMZUqqFTU7r45NCRFafnG8PBeUUdeg6kO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fe73f0-fcf1-4ba9-4a5e-08dd231d1076
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:43:09.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qI5v2vYpC8Nh3IZ940Ao25Syl0Qt/xVCmSHxW6d8/TslVB/kHqdrDwn6lA4b/2ESQ1UBUhI4kSogFD67PzXLBg==
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.  Add driver for it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* Fix regmap_config definition by removing name field, correcting read ranges
  and setting max_register field.
* Collect Maxime's R-b tag.

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
 drivers/gpu/drm/imx/dc/dc-ic.c  | 282 ++++++++++++++++++++++++++++++++
 5 files changed, 286 insertions(+), 1 deletion(-)
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
index e618a4228590..01f3c355beba 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -31,6 +31,7 @@ extern struct platform_driver dc_de_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
 extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
new file mode 100644
index 000000000000..66884ce72b5b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -0,0 +1,282 @@
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
+	regmap_reg_range(USERINTERRUPTMASK(0), INTERRUPTENABLE(1)),
+	regmap_reg_range(INTERRUPTSTATUS(0), INTERRUPTSTATUS(1)),
+	regmap_reg_range(USERINTERRUPTENABLE(0), USERINTERRUPTENABLE(1)),
+	regmap_reg_range(USERINTERRUPTSTATUS(0), USERINTERRUPTSTATUS(1)),
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
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ic_regmap_write_table,
+	.rd_table = &dc_ic_regmap_read_table,
+	.volatile_table = &dc_ic_regmap_volatile_table,
+	.max_register = USERINTERRUPTSTATUS(1),
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

