Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291A54755D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F491126B4;
	Sat, 11 Jun 2022 14:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2CB112101
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:14:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSoQguPjksahxvxU3xqUaIj8mpu85CG+oUK5tmcVTZJquY1vopFkblbHnPdmSH9vNmO6BgIGB5Ad653+bfbh9w/xsHJkHUU8S483A3BE//x3QuRxzATGCu5td62YoMM74E+8D8br6RQUhZY8elaFAHn0upWuZWoUBtvmLESFaGaR4pOUNuPtjsjxDM06Elm0B68e2JncsXNbN8tkBiP8FLATLk98K348+UmQf07M0rmr5SPj9CrecXCmumrXA49m+Kb17qNZSfWRpWTDp1Z6SwzxjwjtNhuVaVxkO8sOzZr04g4foGjzhWrS2Uo+TRMy5nsYDd5UWQLDHdvwmil0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VzrsP8vH9QSHBeUaNRq288OiG2B2c45vYqRHTqZ398=;
 b=QHl+peH2QacYcJ+Zyu+au3VHi0q3J4HnGHCi2uX0dVNnDWs5qt1VYxtudccXY6svGKVodtIuJcFdd39sNSUrN0FCIEE7gKiws62iEOZ0uIMOOoE0PgLhDlGcs69FqorctDTlluf3PmioLBfYrNa4pA6O7S+38m/gqAi4hKwY4aJdVgmMagkjhKRr+EcGyt+iRtzbXVNeAcEuhvb/E4PzA5Wxy79Ra09oDFZxPtkZtCKoPVdXyU2f5IKxFwCE974lfFsDoSIPTlNdPrSdTJD2ZMjfhIoJjBhOO3iHjvwuYSZ+kNy/H666J3Q2Hp4NLjjBM0Lrn+JfDAhlvW/q60U7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VzrsP8vH9QSHBeUaNRq288OiG2B2c45vYqRHTqZ398=;
 b=BreZUfhTgRvs6VyjmmuzWMrDf1tkqx8w5kmedmEizRQA8PlZ8MLohnc13WOJ05VLDM3+uxKd9R29xEoxS0gl7xmUV5BjsnZ3GQZHA0jJZIuZmtC34V0U9Q32pNUysFlTHS9sRDV4bQaCqAkxXOezf/+PupSL5jEsBrcUjCBJvMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Sat, 11 Jun
 2022 14:14:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:14:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 12/14] drm/bridge: imx: Add LDB support for i.MX8qm
Date: Sat, 11 Jun 2022 22:14:19 +0800
Message-Id: <20220611141421.718743-13-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: da5f6727-ab02-4c3e-ed5a-08da4bb4a694
X-MS-TrafficTypeDiagnostic: DB9PR04MB8249:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB9PR04MB824921DED171238E7BA1C3AC98A99@DB9PR04MB8249.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqqm5apIuuLQrYnWZxAbTDd7O3Js7Q8ejkOpZKP1FAE0ciUqry/32X9rpdTg1rctu9OaHW1Phq4W4jzeyPUGOogZXUXdF1jOu2b+YO0enK/sOd9hoVQFKsDFaT6eXdzODECU8R5GiAJTxqis6kkB/G8OsWhEO9L0LDfqH/4iZWDayw61PTe+WRZM/9PmFIefa3CH/9YFxWA9vKhmFbdKYtQVEFmOyHwh8ldl1Ll2eO7cban224s4+fQg+xj/EJxdYMnxbhoLM8tvqVB7xQUnuaZ6zfHv3VVEWT5VWVz3NNXho8rJbI58xT/N9l1FGgVghedF1MJyUCPIw3dm3n9zRIWmDFA0DJZKi7WsHKYIyEtMuskim4dTOjZprzZgITFE3sffIP04OripC4Ar6vJDbRFyLRPkmvDr9gd1PA8QNXORmc9G79xHfbTjjV1lkznqLj3fSRQkSvkGR5k/eXJ1Agm1zxTixAObUIgs8/Br63N8Pv5ZLqf5gUBeTAMMI6p1vEKCHxVJlug8Q+SLCczkGF6bU5lRYgew5ZNLIh+B4AOuEDOo5PTsihj2/0G5ri+fX4nfOIEt4gxzPCPOlePHxiqPjOfGK6F0bp0H9vxyGq4zkt40ZwS4vk8iI2dvnMg2eoFS0zL2SnfjiQGoYLBAXy8pRsP1XNeFw3BOTC8N/p0vE9YKdp4ktlNMXNoVNFwyJ2DMwe+VqOENl9WLGGlgFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(26005)(6512007)(38100700002)(38350700002)(83380400001)(86362001)(186003)(1076003)(2616005)(8936002)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(8676002)(36756003)(30864003)(7416002)(2906002)(508600001)(6486002)(6506007)(6666004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1QLr14SVAkTVjCrcaAuQrfDuo0YTxg3x43GyW2iLCiZsy+Jq7i1JlpejGfdd?=
 =?us-ascii?Q?6s4mLPtlKM7hGVLfpPOZ4DCj65fzvVWi1aPM9nj7qnbiBhgKazb09nMCd6DO?=
 =?us-ascii?Q?KfbFyzF4gsl1Ou23cy30zkouG/vHxoqsjTmEBGnbBYrUpEBbl3eGI80y3XTj?=
 =?us-ascii?Q?DYdGU+L3CPQM3Tnn3ySCplXbxsxDHIGUCxfkePyYeZqMPcmB/pak8iJ1A/B6?=
 =?us-ascii?Q?tN/q+g8Y0+KUgaUBKIwDtNCgovYRYsWdqos2HWrH12/qZZd2/5fXzmWn2asn?=
 =?us-ascii?Q?bS/mER9SrHMtokxuWBsky9SrAOxXvv/x0U8Of4waU5U4HeeT7Yzb47F/iK4y?=
 =?us-ascii?Q?1WjgeGjpx+m4JUPkSoQNGgbDtuHMrGVrHOpi4myjlGESMo7s0niBGVih3qeZ?=
 =?us-ascii?Q?LK5SmqiPcmRiwBYvs4oZberKdAbRsgNafOitSkQwdJboXgeuzEpxgPS1xmtT?=
 =?us-ascii?Q?nezKBHVf5fEAEWeg9zXf9VfeYEB3sXl1F2uqa3S6a8DhOd3zFscBg5PHKnOz?=
 =?us-ascii?Q?7gg4/b3u22XDLMxAew3dFN3gfex+m/TAAI7aBU5H4lR2QNhnGB5E5DdvMj+k?=
 =?us-ascii?Q?Qxg5hQm++BNSqgRuNB3qcUUE3YCgsTVKDzet7aYhsqsFdp+lANof0YDBtYS6?=
 =?us-ascii?Q?JV5wiVJ2pgvtvDcwf/sVNDbTqN2QmoVXhPFxw+mIBko2cVSzdwpz4zpVCSln?=
 =?us-ascii?Q?O3/xrzQmUauxhwSB9iJlyQ7O5jP61/mRemBkOkgBfqIjbkKwYab3zL8eJfko?=
 =?us-ascii?Q?S8G5LPgNBJt8d4dg0ymFKxX9qYDNk53fQHx+5yQQeuhfQzIaRy3MjK8iaVX2?=
 =?us-ascii?Q?uuYP2Fzx0ZtPLdd0ssq2qdSzrN8S8KJs0B0PhTjjDhGLkKypBJ78uKzt3Zgi?=
 =?us-ascii?Q?7hz5xq0gIej0IAJKePnyeKebN/OQmPm+ikGgT7O9jb4JD3YrOLJ9ZZuRBZRh?=
 =?us-ascii?Q?OtXg86TNWxhEWD0Rc8+igIWvL7xQK0jepMT5m0M2UixIyy0MG5AjDfVCI6qT?=
 =?us-ascii?Q?6N9i6a5X+KjLB8gopTzqY9557wvqT3Hgu+y14AO6u5dAhOFSXsqjAZFxTull?=
 =?us-ascii?Q?n1mGcyUdBZrqKoIkkjPSHe3JkzTzSXX/Wr+1NE/ip0qfrs09+0PDQOUIx5dT?=
 =?us-ascii?Q?xZ5xTc/T+A/5yfzLJz1LjwzBT6opohLpBBV9DFG+UTjyKor3wFDgDXf7JG9T?=
 =?us-ascii?Q?iWVjV6f08bSTNFsz5IEO+ILYxHQGlNY32RtvxXbI+KSEzqG+f1AgaWXZghb2?=
 =?us-ascii?Q?AbCZSuQXD2D3p0Yuem4MrY8U1fXgeIF2oMzVK2B1EDdUwWH6EtgLroa2bzxE?=
 =?us-ascii?Q?PPoFf8KiwuYNmvpAuOwJOC2exwcLZmy/xeS6+CK5NaWceVzqRsYy+++aedX9?=
 =?us-ascii?Q?qD/XYd6zEvLXe33e69SdXm45yskqdxpvNca7JHHLhu3ilKL1ViFjvyJ7k0WQ?=
 =?us-ascii?Q?GtchiA/N60x94/Cv73rBCXwSOvZXEl2BpvmG6my+pdPlYwoEUchSaCV9GYac?=
 =?us-ascii?Q?99R2P/NRUJXLrzKHdd+lRdPHLfaEhBtuCFtHrtRwPsQR9V54EBuIck/vqyyQ?=
 =?us-ascii?Q?0NEt659eHS17Q/xzLaSoYQ5wJAHO1ZLwLu+Lme5MJgJ6yQrUiEcNiU5Lhao6?=
 =?us-ascii?Q?6OXR0iJW6ME9dcaE8Vre8daXjpJgUVNZl1B3xglPlY0G9gjuf3rV2fNj7jr5?=
 =?us-ascii?Q?BGn497HFz7NLgLvDnVHkk823FWtRmmpAJYe+JcPZOZJjvBeCknkWQwc5lkNl?=
 =?us-ascii?Q?jX8V0ulWEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5f6727-ab02-4c3e-ed5a-08da4bb4a694
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:14:08.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRYXwr7BEtMbezJXfU0FrCiw08K8NoVSiFqO8X9ABaXRtyrXNPt3hxzMlp/ceBhVnpuMQJ3wW1NkO5WWzC0EQQ==
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

This patch adds a drm bridge driver for i.MX8qm LVDS display bridge(LDB)
which is officially named as pixel mapper.  The LDB has two channels.
Each of them supports up to 30bpp parallel input color format and can
map the input to VESA or JEIDA standards.  The two channels can be used
simultaneously, either in dual mode or split mode.  In dual mode, the
two channels output identical data.  In split mode, channel0 outputs
odd pixels and channel1 outputs even pixels.  This patch supports the
LDB single mode and split mode.

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
* Add Marcel's T-b tag.
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* Link with the imx-ldb-helper object. (Robert)
* Correspondingly, rename 'imx8qm-ldb.c' to 'imx8qm-ldb-drv.c'.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* Drop unnecessary check for maximum available LDB channels.
* Mention i.MX8qm LDB official name 'pixel mapper' in the bridge driver
  and Kconfig help message.

 drivers/gpu/drm/bridge/imx/Kconfig          |   9 +
 drivers/gpu/drm/bridge/imx/Makefile         |   3 +
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c | 587 ++++++++++++++++++++
 3 files changed, 599 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index f33d67be54dc..212a7b0e64fd 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,3 +1,12 @@
+config DRM_IMX8QM_LDB
+	tristate "Freescale i.MX8QM LVDS display bridge"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
+	  Freescale i.MX8qm processor.  Official name of LDB is pixel mapper.
+
 config DRM_IMX8QXP_LDB
 	tristate "Freescale i.MX8QXP LVDS display bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 96d5d1e9659d..aa90ec8d5433 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,3 +1,6 @@
+imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
+obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
+
 imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
new file mode 100644
index 000000000000..29f8f36f814e
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
@@ -0,0 +1,587 @@
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
+#define  LDB_CH0_10BIT_EN		BIT(22)
+#define  LDB_CH1_10BIT_EN		BIT(23)
+#define  LDB_CH0_DATA_WIDTH_24BIT	BIT(24)
+#define  LDB_CH1_DATA_WIDTH_24BIT	BIT(26)
+#define  LDB_CH0_DATA_WIDTH_30BIT	(2 << 24)
+#define  LDB_CH1_DATA_WIDTH_30BIT	(2 << 26)
+
+#define SS_CTRL				0x20
+#define  CH_HSYNC_M(id)			BIT(0 + ((id) * 2))
+#define  CH_VSYNC_M(id)			BIT(1 + ((id) * 2))
+#define  CH_PHSYNC(id)			BIT(0 + ((id) * 2))
+#define  CH_PVSYNC(id)			BIT(1 + ((id) * 2))
+
+#define DRIVER_NAME			"imx8qm-ldb"
+
+struct imx8qm_ldb_channel {
+	struct ldb_channel base;
+	struct phy *phy;
+};
+
+struct imx8qm_ldb {
+	struct ldb base;
+	struct device *dev;
+	struct imx8qm_ldb_channel channel[MAX_LDB_CHAN_NUM];
+	struct clk *clk_pixel;
+	struct clk *clk_bypass;
+	int active_chno;
+};
+
+static inline struct imx8qm_ldb_channel *
+base_to_imx8qm_ldb_channel(struct ldb_channel *base)
+{
+	return container_of(base, struct imx8qm_ldb_channel, base);
+}
+
+static inline struct imx8qm_ldb *base_to_imx8qm_ldb(struct ldb *base)
+{
+	return container_of(base, struct imx8qm_ldb, base);
+}
+
+static void imx8qm_ldb_set_phy_cfg(struct imx8qm_ldb *imx8qm_ldb,
+				   unsigned long di_clk,
+				   bool is_split, bool is_slave,
+				   struct phy_configure_opts_lvds *phy_cfg)
+{
+	phy_cfg->bits_per_lane_and_dclk_cycle = 7;
+	phy_cfg->lanes = 4;
+	phy_cfg->differential_clk_rate = is_split ? di_clk / 2 : di_clk;
+	phy_cfg->is_slave = is_slave;
+}
+
+static int imx8qm_ldb_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
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
+	imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, false, phy_cfg);
+	ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(imx8qm_ldb->dev,
+				     "failed to validate PHY: %d\n", ret);
+		return ret;
+	}
+
+	if (is_split) {
+		imx8qm_ldb_ch =
+			&imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
+		imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
+				       phy_cfg);
+		ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
+		if (ret < 0) {
+			DRM_DEV_DEBUG_DRIVER(imx8qm_ldb->dev,
+					     "failed to validate slave PHY: %d\n",
+					     ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void
+imx8qm_ldb_bridge_mode_set(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct device *dev = imx8qm_ldb->dev;
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
+	ret = phy_init(imx8qm_ldb_ch->phy);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
+
+	clk_set_rate(imx8qm_ldb->clk_bypass, di_clk);
+	clk_set_rate(imx8qm_ldb->clk_pixel, di_clk);
+
+	imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, false, phy_cfg);
+	ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
+
+	if (is_split) {
+		imx8qm_ldb_ch =
+			&imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
+		imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
+				       phy_cfg);
+		ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
+		if (ret < 0)
+			DRM_DEV_ERROR(dev, "failed to configure slave PHY: %d\n",
+				      ret);
+	}
+
+	/* input VSYNC signal from pixel link is active low */
+	if (ldb_ch->chno == 0 || is_split)
+		ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
+	if (ldb_ch->chno == 1 || is_split)
+		ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
+
+	switch (ldb_ch->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_CH0_DATA_WIDTH_24BIT;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_CH1_DATA_WIDTH_24BIT;
+		break;
+	}
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
+}
+
+static void
+imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct device *dev = imx8qm_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	clk_prepare_enable(imx8qm_ldb->clk_pixel);
+	clk_prepare_enable(imx8qm_ldb->clk_bypass);
+
+	/* both DI0 and DI1 connect with pixel link, so ok to use DI0 only */
+	if (ldb_ch->chno == 0 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+		ldb->ldb_ctrl |= LDB_CH0_MODE_EN_TO_DI0;
+	}
+	if (ldb_ch->chno == 1 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+		ldb->ldb_ctrl |= LDB_CH1_MODE_EN_TO_DI0;
+	}
+
+	if (is_split) {
+		ret = phy_power_on(imx8qm_ldb->channel[0].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power on channel0 PHY: %d\n",
+				      ret);
+
+		ret = phy_power_on(imx8qm_ldb->channel[1].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power on channel1 PHY: %d\n",
+				      ret);
+	} else {
+		ret = phy_power_on(imx8qm_ldb_ch->phy);
+		if (ret)
+			DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
+	}
+
+	ldb_bridge_enable_helper(bridge);
+}
+
+static void
+imx8qm_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct device *dev = imx8qm_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	ldb_bridge_disable_helper(bridge);
+
+	if (is_split) {
+		ret = phy_power_off(imx8qm_ldb->channel[0].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power off channel0 PHY: %d\n",
+				      ret);
+		ret = phy_power_off(imx8qm_ldb->channel[1].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power off channel1 PHY: %d\n",
+				      ret);
+	} else {
+		ret = phy_power_off(imx8qm_ldb_ch->phy);
+		if (ret)
+			DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
+	}
+
+	clk_disable_unprepare(imx8qm_ldb->clk_bypass);
+	clk_disable_unprepare(imx8qm_ldb->clk_pixel);
+
+	ret = pm_runtime_put(dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qm_ldb_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool imx8qm_ldb_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qm_ldb_bus_output_fmts); i++) {
+		if (imx8qm_ldb_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qm_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	struct drm_display_info *di;
+	const struct drm_format_info *finfo;
+	u32 *input_fmts;
+
+	if (!imx8qm_ldb_bus_output_fmt_supported(output_fmt))
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
+		 * Default to MEDIA_BUS_FMT_RGB888_1X36_CPADLO, if no match.
+		 */
+		if (di->num_bus_formats) {
+			finfo = drm_format_info(di->bus_formats[0]);
+
+			input_fmts[0] = finfo->depth == 18 ?
+					MEDIA_BUS_FMT_RGB666_1X36_CPADLO :
+					MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		} else {
+			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		}
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
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
+imx8qm_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qm_ldb_bus_output_fmts);
+	return kmemdup(imx8qm_ldb_bus_output_fmts,
+			sizeof(imx8qm_ldb_bus_output_fmts), GFP_KERNEL);
+}
+
+static enum drm_mode_status
+imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	bool is_single = ldb_channel_is_single_link(ldb_ch);
+
+	if (mode->clock > 300000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock > 150000 && is_single)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
+	.attach			= ldb_bridge_attach_helper,
+	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
+	.mode_set		= imx8qm_ldb_bridge_mode_set,
+	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,
+	.atomic_disable		= imx8qm_ldb_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qm_ldb_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qm_ldb_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qm_ldb_get_phy(struct imx8qm_ldb *imx8qm_ldb)
+{
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch;
+	struct ldb_channel *ldb_ch;
+	struct device *dev = imx8qm_ldb->dev;
+	int i, ret;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
+		ldb_ch = &imx8qm_ldb_ch->base;
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		imx8qm_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np,
+						     "lvds_phy");
+		if (IS_ERR(imx8qm_ldb_ch->phy)) {
+			ret = PTR_ERR(imx8qm_ldb_ch->phy);
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev,
+					      "failed to get channel%d PHY: %d\n",
+					      i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int imx8qm_ldb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx8qm_ldb *imx8qm_ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch;
+	struct ldb *ldb;
+	struct ldb_channel *ldb_ch;
+	struct device_node *port1, *port2;
+	int pixel_order;
+	int ret, i;
+
+	imx8qm_ldb = devm_kzalloc(dev, sizeof(*imx8qm_ldb), GFP_KERNEL);
+	if (!imx8qm_ldb)
+		return -ENOMEM;
+
+	imx8qm_ldb->clk_pixel = devm_clk_get(dev, "pixel");
+	if (IS_ERR(imx8qm_ldb->clk_pixel)) {
+		ret = PTR_ERR(imx8qm_ldb->clk_pixel);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get pixel clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qm_ldb->clk_bypass = devm_clk_get(dev, "bypass");
+	if (IS_ERR(imx8qm_ldb->clk_bypass)) {
+		ret = PTR_ERR(imx8qm_ldb->clk_bypass);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get bypass clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qm_ldb->dev = dev;
+
+	ldb = &imx8qm_ldb->base;
+	ldb->dev = dev;
+	ldb->ctrl_reg = 0xe0;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
+		ldb->channel[i] = &imx8qm_ldb->channel[i].base;
+
+	ret = ldb_init_helper(ldb);
+	if (ret)
+		return ret;
+
+	if (ldb->available_ch_cnt == 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
+		return 0;
+	}
+
+	if (ldb->available_ch_cnt == 2) {
+		port1 = of_graph_get_port_by_id(ldb->channel[0]->np, 1);
+		port2 = of_graph_get_port_by_id(ldb->channel[1]->np, 1);
+		pixel_order =
+			drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+		of_node_put(port1);
+		of_node_put(port2);
+
+		if (pixel_order != DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
+			DRM_DEV_ERROR(dev, "invalid dual link pixel order: %d\n",
+				      pixel_order);
+			return -EINVAL;
+		}
+
+		imx8qm_ldb->active_chno = 0;
+		imx8qm_ldb_ch = &imx8qm_ldb->channel[0];
+		ldb_ch = &imx8qm_ldb_ch->base;
+		ldb_ch->link_type = pixel_order;
+	} else {
+		for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+			imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
+			ldb_ch = &imx8qm_ldb_ch->base;
+
+			if (ldb_ch->is_available) {
+				imx8qm_ldb->active_chno = ldb_ch->chno;
+				break;
+			}
+		}
+	}
+
+	ret = imx8qm_ldb_get_phy(imx8qm_ldb);
+	if (ret)
+		return ret;
+
+	ret = ldb_find_next_bridge_helper(ldb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, imx8qm_ldb);
+	pm_runtime_enable(dev);
+
+	ldb_add_bridge_helper(ldb, &imx8qm_ldb_bridge_funcs);
+
+	return ret;
+}
+
+static int imx8qm_ldb_remove(struct platform_device *pdev)
+{
+	struct imx8qm_ldb *imx8qm_ldb = platform_get_drvdata(pdev);
+	struct ldb *ldb = &imx8qm_ldb->base;
+
+	ldb_remove_bridge_helper(ldb);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
+{
+	struct imx8qm_ldb *imx8qm_ldb = dev_get_drvdata(dev);
+	struct ldb *ldb = &imx8qm_ldb->base;
+
+	/* disable LDB by resetting the control register to POR default */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx8qm_ldb_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend,
+			   imx8qm_ldb_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qm_ldb_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-ldb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
+
+static struct platform_driver imx8qm_ldb_driver = {
+	.probe	= imx8qm_ldb_probe,
+	.remove = imx8qm_ldb_remove,
+	.driver	= {
+		.pm = &imx8qm_ldb_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qm_ldb_dt_ids,
+	},
+};
+module_platform_driver(imx8qm_ldb_driver);
+
+MODULE_DESCRIPTION("i.MX8QM LVDS Display Bridge(LDB)/Pixel Mapper bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.25.1

