Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1754755C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A810FD6D;
	Sat, 11 Jun 2022 14:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4A810FD6D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1Ty/+PAEBUU7ifPDh/V1NBr0yZgqupUFqaLhTZ7xhG3hmdyfYmX/JjDkgoFkLQ1FammqbIq/hffouxnmRCQHIDp/MzJbA5z31sh/XTR+fcPeWIrcMnwo9j5rzDA3Ins9SaVxHyHnHa3Vq61JGbZTCXCxYwLSYT4ywkl3BO0iEuUjsnBcoEaPKXfUNadq3OVnyVcIDHpbIedTtH7504hKnQdkuCpgxPf/AhOWL1wFHaTF3GzHCPsLouI41U82T+sCXQTNcKkrqTR+0ARGjVbfyhNX/B+zUfemlxr1NW4bhIbzweXcP0ldME75vGsZz/s+yHSTTng1m5zoEOJiLPgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IcYQliG2B0EGhA7wp0AXNr347RF7BaEmrfkGwRr5AA=;
 b=c2pIfLcYtsgYAX/cyGm/jzkRu0dpDIfimd1vyRq8Jc248sVoA1ElioQGUTWdfR04XZpIOj5BLR6bYZi388PSwqAjtHa/pp4Lfv/JspXmncr29B8PilVMBoGQRti7b3jpfEtl9T4HVbfFGfIP/EYl+k1VsppwP0KOs8zkIf0ShI1xosaXtaWsGgQYmHe6B4n3m5EF1fc4lVCOFN51bmYg8z9skCy6ZGXTEupfd8hCfnw3iLpm2jUijQQgztwC/2DEv31L1XeU26lQZEue898KjtYpiPiKsVTX40zokBznZhaXCccRoxCs85sceCFU85RVPpscMnWuth8nkLENJWlTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IcYQliG2B0EGhA7wp0AXNr347RF7BaEmrfkGwRr5AA=;
 b=h4Clr12cX7wxi01i14JhnGwA1ZhUWyONZyUAxufqlZNGS3zSvA5pnng017IEIYx7TC3Y6hl8CFf7pSAIZnwNo9tNiAgEbiQymBxN42dIUt+JqvRjKtC2BDFcMoJBhsRkxPyawcLxVCfy1V/z23ikJapRR4wvMmQuU/JLntsSTU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Sat, 11 Jun
 2022 14:14:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:14:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 11/14] drm/bridge: imx: Add LDB support for i.MX8qxp
Date: Sat, 11 Jun 2022 22:14:18 +0800
Message-Id: <20220611141421.718743-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e3208f-7394-4adb-c354-08da4bb4a2df
X-MS-TrafficTypeDiagnostic: DB9PR04MB8249:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB9PR04MB8249B1E99CFC2DB9E062D7A598A99@DB9PR04MB8249.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFi8dctIEuzuXNZSoMHuZ0QR1wW7NyvxYXy6fO7qwZaEke06kuY/zzb344msZoA/h07Bbsu7zvZuu8dOnCZYOwxl0TZgErr7GGzvzii4sq9ZFtTF3erx4Et1r4VixW9TH0Oj9y1dA/DAXBefaYDaAgwX/ncdtSb6mMuGyvzrD5uql40b1u9gzl15nT4gqDgWXh4u41yYCucwD/vLifuXVH/JVHeQYOAN9tO1fJxf6MlsxwiJFGrMHiCPEwpgFXJ8mzvx+Vjl+Zv6JceR8K35sNUz675+7pnKMK/nudC5ZTENP9Q//LRKNppjbOcfBzFBsV5nIHP+56DPWyfAnvLzNegQdY+e6MhYMsY5ddiUOtf+URjGYcW/Fg923oKMDdsghnHDhryixPtNlPCl6LpiJ2LKLeNAqyO9idf7h+QCCFirLxC0j5/wTiA69QJBPS7YtkHbSJ1wOX4HrcWARazMKxiVEbZ+6f7jECagr9756rWlD6BmiAVyYfT3C1fbDo1+zvLmzGFiTlVswjNGQOjYQMPg/n1RXwZXkMpvDeg6KsTIaBcCaAuK5hpeYZ+sXp/RBfjeZ/Lccj0vQVBe8X/4JA/YPMZ5TilgCv4dpXI5es1NcACTeSMILZ4h0679Rn+/bOhNneLP2k7LWDIiEfKIQeTN3QAEudm9XlURG9ha1HwWHKliCx8YSG8tbkQE4Yzo6paG4ysuOJCC/2nz7gfSIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(26005)(6512007)(38100700002)(38350700002)(83380400001)(86362001)(186003)(1076003)(2616005)(8936002)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(8676002)(36756003)(30864003)(7416002)(2906002)(508600001)(6486002)(6506007)(6666004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QVJKlYAdJVeTEVOVMll/ETl1DeMiMlBPWlu85L9K1Nex4ZCk3CJc92IUHW9U?=
 =?us-ascii?Q?YkSoZ4hM04m2knCIUDAkYBteDT19jAewvZ33SfGue2HodbN+yhK5OBZ5Nq/i?=
 =?us-ascii?Q?kAT1UUD1BbPZHKPGFyDDel9Ygq+y333KxPqXvjTNqBUANVasXT1aOQ/5TBVl?=
 =?us-ascii?Q?iKovGpVdZymMw1mDaDWrplkeHWHk690WCXIRH/7FEWzMJSOtIQFD/Dd0f894?=
 =?us-ascii?Q?Jo1aYOaPBNyF3Tyx2R/Q535JNDobhcW6qoRwcJDGrmyxyADmMi6ms+QOiQzR?=
 =?us-ascii?Q?3Ye54yfp2fLNfZkq/LmcEZRBNleo494kzLeNtyfHCfbjF3i2EaP/2vM6cwIC?=
 =?us-ascii?Q?/fh7XoPDFUU5QjboAFz7j93pcjh9ICIKVjdB98x9yY915yFecasazlwBgNLD?=
 =?us-ascii?Q?pqiFXIMCMWR2je9OYdYmu5RpDhh+64I6sQACj+CBj7juFxqGnaIPHtKJdIZI?=
 =?us-ascii?Q?qJJjtxAGjHw7LI0TNc2lPpmIiQVAVe7G1nPIXYfnL6aMmQ0IVjbUHnIxU06g?=
 =?us-ascii?Q?e3Q+np7W4zj68LCDBkD6IXexhtYvwzjfi2hCwE6rWV5XGbXvTUoHJCMSQuo4?=
 =?us-ascii?Q?cDuqZR6QRPHdA6g679deaZMCZsAHQpWpsGGR5ZNCRxKatz1C62dInhlcuH6E?=
 =?us-ascii?Q?m9B/XhjL1SW3S8NkWNODKkQf3g84CESqvHiS5YCvTyjyxzlnE5Nfyurh6Mz3?=
 =?us-ascii?Q?kIeEoYEZToVB5e3ttY8EDMakg9c1IbCywXUV7IL4VXpgIfM1o6b4tDGUzrv9?=
 =?us-ascii?Q?o6pXMiZFwObvL6aAyrkfTOV/hFGkuc29KPrv+VrCMDmhAsAYNi482I/eicwf?=
 =?us-ascii?Q?guSbx3GbmfZ3F8nNBM+TAUGw1bwTKYpnklTykyNn7iMjYsi7xKSylApYTfH1?=
 =?us-ascii?Q?qB17o9BfzKPy9lpo1HgQW4hCCRGQX2JIs2nqHokFdETvloCFOHbYThh1Z81f?=
 =?us-ascii?Q?v6vpZawZdMXQ9e+hFzU3oJRXB/fkyv6ul/kBCHqPxNucwWgBoUsjgOu45cfu?=
 =?us-ascii?Q?brE7PlMAoGSbtdZGWrm8jlcEE+NignSofJVqIlTFwA0AN75sYopeVo4uZCMb?=
 =?us-ascii?Q?/JVt2Wj3XAiPd9hjeFnhZxn+VIlufyGdvToMo1eUZzgO6SLWt2pi6R11cUJT?=
 =?us-ascii?Q?uRXUw1yk+ds+tVO1hlnnI6hYa7xwpqu9AruBy1U4f/R+PXQSjKbeC9DJtOPr?=
 =?us-ascii?Q?KzJmU1hcIzYoM7VnqL1LPzpg1FcZ5qctAUE/4FZ8YFlFfaAJT4JBOTiq8fUD?=
 =?us-ascii?Q?G28MDD9bDELYjNs7LinRPbNR15DUTB2R36zQX8RtsW55JBdNVnmbuHvJRwIb?=
 =?us-ascii?Q?4eYhhS+IEt0/BmhpjxODOayJ4FsUh0v7lcnJyk4yQmaO5Zo0LBg873+B9jMB?=
 =?us-ascii?Q?IcgGf+ONDF2j1jpL42oMW0kNTBBQK2UIzWFRoTnrFeBpL5u3ZnYM66siwWiG?=
 =?us-ascii?Q?z+dYiH3nDJm9VXFnE3g2qyXdhkKTKLVFm59sJTGLnq1YO2lDk9yKCwc6zUXm?=
 =?us-ascii?Q?OYXUaQms+9EP/ytgRa+4rDbwf/95SpP74BnkI1JJXSRT3QVN1xw1mHWdZ37r?=
 =?us-ascii?Q?YrGgg04Xa/651j3VjPP+D8zhzFcHtaxvoIZkDo7oSx2agQwMEc/KHvLL4Twf?=
 =?us-ascii?Q?kwAS3O4jcCIYV+8cw4tm1ddUQSoP1kWU2E1KVZHbcNp0y/EKgntzaMKCyeE8?=
 =?us-ascii?Q?7/cBmLOzur2gdSOrfskgNai5DYrJhxD6DlOU8yr/1wijuSY4tUrKhUCh/uHf?=
 =?us-ascii?Q?+QGH5jQAUQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e3208f-7394-4adb-c354-08da4bb4a2df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:14:02.7459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6IYWaIZ5pGJgYZnqyLzMelard22edBrsPoj2he1rnAfaiM5kTlzFcGc81sy6YHw0jaHTBBSb0oqR0pGnLNEJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8249
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a drm bridge driver for i.MX8qxp LVDS display bridge(LDB)
which is officially named as pixel mapper.  The LDB has two channels.
Each of them supports up to 24bpp parallel input color format and can map
the input to VESA or JEIDA standards.  The two channels cannot be used
simultaneously, that is to say, the user should pick one of them to use.
Two LDB channels from two LDB instances can work together in LDB split
mode to support a dual link LVDS display.  The channel indexes have to be
different.  Channel0 outputs odd pixels and channel1 outputs even pixels.
This patch supports the LDB single mode and split mode.

Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Marcel, I add your T-b tag from v6, let me know if you want me to drop it, as
the checkpatch fix in v7 is trivial.

v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* Fix below complaints from 'checkpatch.pl --strict'. (Robert)
   - 'Prefer using the BIT macro'
   - 'Alignment should match open parenthesis'
   - 'Comparison to NULL could be written "!companion_port"'
   - 'ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP'
* Add Marcel's T-b tag.
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* Link with the imx-ldb-helper object. (Robert)
* Correspondingly, rename 'imx8qxp-ldb.c' to 'imx8qxp-ldb-drv.c'.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* Drop unnecessary DT validation.
* Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
  get the input remote endpoint in imx8qxp_ldb_set_di_id().
* Avoid using companion_port OF node after putting it in
  imx8qxp_ldb_parse_dt_companion().
* Mention i.MX8qxp LDB official name 'pixel mapper' in the bridge driver
  and Kconfig help message.

 drivers/gpu/drm/bridge/imx/Kconfig           |   9 +
 drivers/gpu/drm/bridge/imx/Makefile          |   3 +
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c | 722 +++++++++++++++++++
 3 files changed, 734 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 53001650a61a..f33d67be54dc 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,3 +1,12 @@
+config DRM_IMX8QXP_LDB
+	tristate "Freescale i.MX8QXP LVDS display bridge"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
+	  Freescale i.MX8qxp processor.  Official name of LDB is pixel mapper.
+
 config DRM_IMX8QXP_PIXEL_COMBINER
 	tristate "Freescale i.MX8QM/QXP pixel combiner"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index e74dd6422e95..96d5d1e9659d 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,3 +1,6 @@
+imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
+obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
+
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
new file mode 100644
index 000000000000..1cca5fc96a4b
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
@@ -0,0 +1,722 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#include "imx-ldb-helper.h"
+
+#define  LDB_CH_SEL		BIT(28)
+
+#define SS_CTRL			0x20
+#define  CH_HSYNC_M(id)		BIT(0 + ((id) * 2))
+#define  CH_VSYNC_M(id)		BIT(1 + ((id) * 2))
+#define  CH_PHSYNC(id)		BIT(0 + ((id) * 2))
+#define  CH_PVSYNC(id)		BIT(1 + ((id) * 2))
+
+#define DRIVER_NAME		"imx8qxp-ldb"
+
+struct imx8qxp_ldb_channel {
+	struct ldb_channel base;
+	struct phy *phy;
+	unsigned int di_id;
+};
+
+struct imx8qxp_ldb {
+	struct ldb base;
+	struct device *dev;
+	struct imx8qxp_ldb_channel channel[MAX_LDB_CHAN_NUM];
+	struct clk *clk_pixel;
+	struct clk *clk_bypass;
+	struct drm_bridge *companion;
+	int active_chno;
+};
+
+static inline struct imx8qxp_ldb_channel *
+base_to_imx8qxp_ldb_channel(struct ldb_channel *base)
+{
+	return container_of(base, struct imx8qxp_ldb_channel, base);
+}
+
+static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
+{
+	return container_of(base, struct imx8qxp_ldb, base);
+}
+
+static void imx8qxp_ldb_set_phy_cfg(struct imx8qxp_ldb *imx8qxp_ldb,
+				    unsigned long di_clk, bool is_split,
+				    struct phy_configure_opts_lvds *phy_cfg)
+{
+	phy_cfg->bits_per_lane_and_dclk_cycle = 7;
+	phy_cfg->lanes = 4;
+
+	if (is_split) {
+		phy_cfg->differential_clk_rate = di_clk / 2;
+		phy_cfg->is_slave = !imx8qxp_ldb->companion;
+	} else {
+		phy_cfg->differential_clk_rate = di_clk;
+		phy_cfg->is_slave = false;
+	}
+}
+
+static int
+imx8qxp_ldb_bridge_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
+	unsigned long di_clk = adj->clock * 1000;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	union phy_configure_opts opts = { };
+	struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
+	int ret;
+
+	ret = ldb_bridge_atomic_check_helper(bridge, bridge_state,
+					     crtc_state, conn_state);
+	if (ret)
+		return ret;
+
+	imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
+	ret = phy_validate(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(imx8qxp_ldb->dev,
+				     "failed to validate PHY: %d\n", ret);
+		return ret;
+	}
+
+	if (is_split && companion) {
+		ret = companion->funcs->atomic_check(companion,
+					bridge_state, crtc_state, conn_state);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static void
+imx8qxp_ldb_bridge_mode_set(struct drm_bridge *bridge,
+			    const struct drm_display_mode *mode,
+			    const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb_channel *companion_ldb_ch;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct device *dev = imx8qxp_ldb->dev;
+	unsigned long di_clk = adjusted_mode->clock * 1000;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	union phy_configure_opts opts = { };
+	struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
+	u32 chno = ldb_ch->chno;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to get runtime PM sync: %d\n", ret);
+
+	ret = phy_init(imx8qxp_ldb_ch->phy);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
+
+	ret = phy_set_mode(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to set PHY mode: %d\n", ret);
+
+	if (is_split && companion) {
+		companion_ldb_ch = bridge_to_ldb_ch(companion);
+
+		companion_ldb_ch->in_bus_format = ldb_ch->in_bus_format;
+		companion_ldb_ch->out_bus_format = ldb_ch->out_bus_format;
+	}
+
+	clk_set_rate(imx8qxp_ldb->clk_bypass, di_clk);
+	clk_set_rate(imx8qxp_ldb->clk_pixel, di_clk);
+
+	imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
+	ret = phy_configure(imx8qxp_ldb_ch->phy, &opts);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
+
+	if (chno == 0)
+		ldb->ldb_ctrl &= ~LDB_CH_SEL;
+	else
+		ldb->ldb_ctrl |= LDB_CH_SEL;
+
+	/* input VSYNC signal from pixel link is active low */
+	if (imx8qxp_ldb_ch->di_id == 0)
+		ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
+	else
+		ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
+
+	/*
+	 * For split mode, settle input VSYNC signal polarity and
+	 * channel selection down early.
+	 */
+	if (is_split)
+		regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+
+	ldb_bridge_mode_set_helper(bridge, mode, adjusted_mode);
+
+	if (adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL, CH_VSYNC_M(chno), 0);
+	else if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL,
+				   CH_VSYNC_M(chno), CH_PVSYNC(chno));
+
+	if (adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL, CH_HSYNC_M(chno), 0);
+	else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL,
+				   CH_HSYNC_M(chno), CH_PHSYNC(chno));
+
+	if (is_split && companion)
+		companion->funcs->mode_set(companion, mode, adjusted_mode);
+}
+
+static void
+imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	clk_prepare_enable(imx8qxp_ldb->clk_pixel);
+	clk_prepare_enable(imx8qxp_ldb->clk_bypass);
+
+	if (is_split && companion)
+		companion->funcs->atomic_pre_enable(companion, old_bridge_state);
+}
+
+static void
+imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct device *dev = imx8qxp_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	if (ldb_ch->chno == 0 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+		ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
+				LDB_CH0_MODE_EN_TO_DI0 : LDB_CH0_MODE_EN_TO_DI1;
+	}
+	if (ldb_ch->chno == 1 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+		ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
+				LDB_CH1_MODE_EN_TO_DI0 : LDB_CH1_MODE_EN_TO_DI1;
+	}
+
+	ldb_bridge_enable_helper(bridge);
+
+	ret = phy_power_on(imx8qxp_ldb_ch->phy);
+	if (ret)
+		DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
+
+	if (is_split && companion)
+		companion->funcs->atomic_enable(companion, old_bridge_state);
+}
+
+static void
+imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct device *dev = imx8qxp_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	ret = phy_power_off(imx8qxp_ldb_ch->phy);
+	if (ret)
+		DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
+
+	ret = phy_exit(imx8qxp_ldb_ch->phy);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to teardown PHY: %d\n", ret);
+
+	ldb_bridge_disable_helper(bridge);
+
+	clk_disable_unprepare(imx8qxp_ldb->clk_bypass);
+	clk_disable_unprepare(imx8qxp_ldb->clk_pixel);
+
+	if (is_split && companion)
+		companion->funcs->atomic_disable(companion, old_bridge_state);
+
+	ret = pm_runtime_put(dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qxp_ldb_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool imx8qxp_ldb_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts); i++) {
+		if (imx8qxp_ldb_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     u32 output_fmt,
+					     unsigned int *num_input_fmts)
+{
+	struct drm_display_info *di;
+	const struct drm_format_info *finfo;
+	u32 *input_fmts;
+
+	if (!imx8qxp_ldb_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		di = &conn_state->connector->display_info;
+
+		/*
+		 * Look at the first bus format to determine input format.
+		 * Default to MEDIA_BUS_FMT_RGB888_1X24, if no match.
+		 */
+		if (di->num_bus_formats) {
+			finfo = drm_format_info(di->bus_formats[0]);
+
+			input_fmts[0] = finfo->depth == 18 ?
+					MEDIA_BUS_FMT_RGB666_1X24_CPADHI :
+					MEDIA_BUS_FMT_RGB888_1X24;
+		} else {
+			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					      struct drm_bridge_state *bridge_state,
+					      struct drm_crtc_state *crtc_state,
+					      struct drm_connector_state *conn_state,
+					      unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts);
+	return kmemdup(imx8qxp_ldb_bus_output_fmts,
+			sizeof(imx8qxp_ldb_bus_output_fmts), GFP_KERNEL);
+}
+
+static enum drm_mode_status
+imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
+			      const struct drm_display_info *info,
+			      const struct drm_display_mode *mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	bool is_single = ldb_channel_is_single_link(ldb_ch);
+
+	if (mode->clock > 170000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock > 150000 && is_single)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qxp_ldb_bridge_mode_valid,
+	.attach			= ldb_bridge_attach_helper,
+	.atomic_check		= imx8qxp_ldb_bridge_atomic_check,
+	.mode_set		= imx8qxp_ldb_bridge_mode_set,
+	.atomic_pre_enable	= imx8qxp_ldb_bridge_atomic_pre_enable,
+	.atomic_enable		= imx8qxp_ldb_bridge_atomic_enable,
+	.atomic_disable		= imx8qxp_ldb_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_ldb_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_ldb_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_ldb_set_di_id(struct imx8qxp_ldb *imx8qxp_ldb)
+{
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
+	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
+	struct device_node *ep, *remote;
+	struct device *dev = imx8qxp_ldb->dev;
+	struct of_endpoint endpoint;
+	int ret;
+
+	ep = of_graph_get_endpoint_by_regs(ldb_ch->np, 0, -1);
+	if (!ep) {
+		DRM_DEV_ERROR(dev, "failed to get port0 endpoint\n");
+		return -EINVAL;
+	}
+
+	remote = of_graph_get_remote_endpoint(ep);
+	of_node_put(ep);
+	if (!remote) {
+		DRM_DEV_ERROR(dev, "failed to get port0 remote endpoint\n");
+		return -EINVAL;
+	}
+
+	ret = of_graph_parse_endpoint(remote, &endpoint);
+	of_node_put(remote);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to parse port0 remote endpoint: %d\n",
+			      ret);
+		return ret;
+	}
+
+	imx8qxp_ldb_ch->di_id = endpoint.id;
+
+	return 0;
+}
+
+static int
+imx8qxp_ldb_check_chno_and_dual_link(struct ldb_channel *ldb_ch, int link)
+{
+	if ((link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS && ldb_ch->chno != 0) ||
+	    (link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS && ldb_ch->chno != 1))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
+{
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
+	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
+	struct ldb_channel *companion_ldb_ch;
+	struct device_node *companion;
+	struct device_node *child;
+	struct device_node *companion_port = NULL;
+	struct device_node *port1, *port2;
+	struct device *dev = imx8qxp_ldb->dev;
+	const struct of_device_id *match;
+	u32 i;
+	int dual_link;
+	int ret;
+
+	/* Locate the companion LDB for dual-link operation, if any. */
+	companion = of_parse_phandle(dev->of_node, "fsl,companion-ldb", 0);
+	if (!companion)
+		return 0;
+
+	if (!of_device_is_available(companion)) {
+		DRM_DEV_ERROR(dev, "companion LDB is not available\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/*
+	 * Sanity check: the companion bridge must have the same compatible
+	 * string.
+	 */
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_device_is_compatible(companion, match->compatible)) {
+		DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
+		ret = -ENXIO;
+		goto out;
+	}
+
+	for_each_available_child_of_node(companion, child) {
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
+			DRM_DEV_ERROR(dev,
+				      "invalid channel node address: %u\n", i);
+			ret = -EINVAL;
+			of_node_put(child);
+			goto out;
+		}
+
+		/*
+		 * Channel numbers have to be different, because channel0
+		 * transmits odd pixels and channel1 transmits even pixels.
+		 */
+		if (i == (ldb_ch->chno ^ 0x1)) {
+			companion_port = child;
+			break;
+		}
+	}
+
+	if (!companion_port) {
+		DRM_DEV_ERROR(dev,
+			      "failed to find companion LDB channel port\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode.  We do this by looking at the DT port nodes we are
+	 * connected to.  If they are marked as expecting odd pixels and
+	 * even pixels than we need to enable LDB split mode.
+	 */
+	port1 = of_graph_get_port_by_id(ldb_ch->np, 1);
+	port2 = of_graph_get_port_by_id(companion_port, 1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+	of_node_put(port1);
+	of_node_put(port2);
+
+	switch (dual_link) {
+	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
+		ldb_ch->link_type = LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
+		break;
+	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
+		ldb_ch->link_type = LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS;
+		break;
+	default:
+		ret = dual_link;
+		DRM_DEV_ERROR(dev,
+			      "failed to get dual link pixel order: %d\n", ret);
+		goto out;
+	}
+
+	ret = imx8qxp_ldb_check_chno_and_dual_link(ldb_ch, dual_link);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev,
+			      "unmatched channel number(%u) vs dual link(%d)\n",
+			      ldb_ch->chno, dual_link);
+		goto out;
+	}
+
+	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
+	if (!imx8qxp_ldb->companion) {
+		ret = -EPROBE_DEFER;
+		DRM_DEV_DEBUG_DRIVER(dev,
+				     "failed to find bridge for companion bridge: %d\n",
+				     ret);
+		goto out;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev,
+			     "dual-link configuration detected (companion bridge %pOF)\n",
+			     companion);
+
+	companion_ldb_ch = bridge_to_ldb_ch(imx8qxp_ldb->companion);
+	companion_ldb_ch->link_type = ldb_ch->link_type;
+out:
+	of_node_put(companion_port);
+	of_node_put(companion);
+	return ret;
+}
+
+static int imx8qxp_ldb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx8qxp_ldb *imx8qxp_ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch;
+	struct ldb *ldb;
+	struct ldb_channel *ldb_ch;
+	int ret, i;
+
+	imx8qxp_ldb = devm_kzalloc(dev, sizeof(*imx8qxp_ldb), GFP_KERNEL);
+	if (!imx8qxp_ldb)
+		return -ENOMEM;
+
+	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
+	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
+		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get pixel clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
+	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
+		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get bypass clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qxp_ldb->dev = dev;
+
+	ldb = &imx8qxp_ldb->base;
+	ldb->dev = dev;
+	ldb->ctrl_reg = 0xe0;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
+		ldb->channel[i] = &imx8qxp_ldb->channel[i].base;
+
+	ret = ldb_init_helper(ldb);
+	if (ret)
+		return ret;
+
+	if (ldb->available_ch_cnt == 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
+		return 0;
+	} else if (ldb->available_ch_cnt > 1) {
+		DRM_DEV_ERROR(dev, "invalid available channel number(%u)\n",
+			      ldb->available_ch_cnt);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx8qxp_ldb_ch = &imx8qxp_ldb->channel[i];
+		ldb_ch = &imx8qxp_ldb_ch->base;
+
+		if (ldb_ch->is_available) {
+			imx8qxp_ldb->active_chno = ldb_ch->chno;
+			break;
+		}
+	}
+
+	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
+	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
+		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
+				      imx8qxp_ldb->active_chno, ret);
+		return ret;
+	}
+
+	ret = ldb_find_next_bridge_helper(ldb);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_ldb_set_di_id(imx8qxp_ldb);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_ldb_parse_dt_companion(imx8qxp_ldb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, imx8qxp_ldb);
+	pm_runtime_enable(dev);
+
+	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
+
+	return ret;
+}
+
+static int imx8qxp_ldb_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_ldb *imx8qxp_ldb = platform_get_drvdata(pdev);
+	struct ldb *ldb = &imx8qxp_ldb->base;
+
+	ldb_remove_bridge_helper(ldb);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
+{
+	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
+	struct ldb *ldb = &imx8qxp_ldb->base;
+
+	/* disable LDB by resetting the control register to POR default */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend,
+			   imx8qxp_ldb_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-ldb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
+
+static struct platform_driver imx8qxp_ldb_driver = {
+	.probe	= imx8qxp_ldb_probe,
+	.remove = imx8qxp_ldb_remove,
+	.driver	= {
+		.pm = &imx8qxp_ldb_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qxp_ldb_dt_ids,
+	},
+};
+module_platform_driver(imx8qxp_ldb_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP LVDS Display Bridge(LDB)/Pixel Mapper bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.25.1

