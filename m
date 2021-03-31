Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6AF34F917
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BD16E9EF;
	Wed, 31 Mar 2021 06:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E786E9EF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgQ6vC34nhKqua1agQNFbaDNvgiOjifhD2FmNExTeGic15A8DRnSRAoGmU56HkETt9IH/VcLLZW1l7nkIF65pZAzbhxI1F6CpELM2RdKsPnWlHUkYdPT6EHpp2oiR1F80ukVUzkWvhnuaWGYAdONbamq3Z06s+o9qRP8yoTkEGCKl5SRQ0HC4Wp2W1qqIJ9uNKFRCYQqx15DzBUv9ZfX7qk1KfzEKScBqkkcyf/RL98typ1aYTRNd76+OCpS/on1lMSwWrq5aQSj+FqMW6uIe97Z00UHsvOuAnd64xenMjNr9B7CoBKdu+uE1LNvM4hBazkXgGsxwwadxHNsapekLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHThHkeEz7Xr/t0E8mrjESs/8sP92r2HbPMzb6nZJ6w=;
 b=XlU0U2ZLAbeAJZRLAKqNiNg67qy4tSMDHUPwcHAFL3CnU4sDHS+vjtyXNVQQVJY+OtOrUHmHCzfMajcqWumjvHb9V8SbB4aX3WOuSxvST+lZ/MPWRqYIFOLnx5GTQbn4tFDPkQMIheglE9Cepb5akixz+GxN4itKzm48VxKKmxWSqwNAQUHpSwYm2a3CncV6Oy8H4Q8fXtjDVrtRefHAcFuAMZqhqwZ5IVz4I4q9XfWRxZJlc640bhEz3jd9JWM1dJNP4WST+IleXSVEnVhU+5gqfP5vgBSXYiXfWKeFjKzPPhgVAXJ9xUOhQGcpZAzfIBcJUQ0wzAo/Q/NckbPIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHThHkeEz7Xr/t0E8mrjESs/8sP92r2HbPMzb6nZJ6w=;
 b=C2ejYemYDqQxJUHDrYSXbdbqVN/KY8E53OryrKT733RrY7vXFE0FT/PRbhIg5j8gvXgtNNt8WjD45QBBrJ61x12uO9Yiq3ATBxT9YDn9L080lY2E+bUKIbItN1DZiff8z9pXF7Bb1YCe/wBu1HJsP/eP5XTJj3GtLI+/YEm7/T8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 06:49:36 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 10/14] drm/bridge: imx: Add LDB driver helper support
Date: Wed, 31 Mar 2021 14:33:21 +0800
Message-Id: <1617172405-12962-11-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 971081ec-f739-4a90-8c82-08d8f4112615
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23182D4DF72A5078A7190665987C9@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLyrNRlxZYOXpemNtDj1tik+rQ2DRSHMy7qqr/I9KLXlYrNbfmOcTWlSaa7HacZ8W+BA6EKTskfROFq2wcP+dLf5pMWfCVImAE1PcWmDSUYRCEjer/2InPOUCU0JkDqYBB3hgnUtexf0/FurOrq4gPfjiaimOZwxrhaEzNFYTVEKyzVXVgSmlrpbmxjo+LCvVdNjCicI6NepMxKxu4ON2o5+Nt7WUsTdz86y+zbwyrjRdHxMFk1P5CgSKlvGzSr4xxAX3U96yXs+nGNxFGV5azis9BFHcCbfwzdFT4WngoEFc/JHUZ6NTDQ3sfRuwcrgpO9jhlxselYXwZ2lEX5vGEp0FkamHPjho2MBMlekDW6x84Hv6RwBsZJu6IZ0yVvPzCBz7DzXSh9DzEffMjH6f8ZGxcnNPLZt8/QwMKjgye6DUXPK3P7+ewHLf6co2rnhj7tEPximMvz2WLFlA61qTeGyr3UdzGtqBpmLmBOYjTl6IitsZuLwlKOk7FSdEFYyNlrg8xq4Qe/Yexa45sFJD9Fiad2UBT4ztpg19AI8qJsklWK9vMUSAGLdIOrbeh0YAoiCUWqFckwr4GVnrB2+/7G7XvsOCXvTq8kZNZ2mOxpR/mcZsLori3f3sR8B+APXqyDDqdBv8JGWf0Fl9rlz4ReCvBKW+L5JCZHBnhbFisZ46OWGZUNJMeooV1Q2uB7q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(69590400012)(36756003)(498600001)(956004)(16526019)(186003)(6486002)(26005)(6506007)(6512007)(66476007)(66946007)(66556008)(38100700001)(2616005)(4326008)(30864003)(86362001)(5660300002)(7416002)(8676002)(2906002)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3Xm3GJ5MgkZqKUcU8GZ0Pfb5iWUA8pEXtCabOeXCEeGbyAzMYwfJUNs1wYlR?=
 =?us-ascii?Q?Aca1xkRxDQDNGZkSPh6SYJuRX0lunjur8vZjBPqEI60/U51SRqgTkRCHHX6y?=
 =?us-ascii?Q?fDkdj4fJAvvzYMUUCPPqP1ALafzbZM/Tha8NTiFbZJSgcJxtOt5eBLDinI/T?=
 =?us-ascii?Q?FdW5Hli9Fet9h2YRLK5NMW+f1hTIgbUTHAzb7dmHI6/58PbMFzESnzvF4fzy?=
 =?us-ascii?Q?5rpc8zfSsVglpPOd/9M62YA23M0UU8rLIp9CvsRqltvZpaKeztxLOeVEIrNQ?=
 =?us-ascii?Q?+NShYPdlFaQIhDWqYcqw+8iS2/yd0NMoMIrBBj1AwE13NeCln/uu7XPLbkS8?=
 =?us-ascii?Q?Z3NhLaX/FQ2RlFUxx1HnEmz9eoBu55m7Hrxs9bqZjhYiIxzWvjqwp2pLwWHl?=
 =?us-ascii?Q?ipohehek2naKorx6AjmE3qDELPceGREasJQuqx1FH7kgjBgudqu5C4QvPQ3B?=
 =?us-ascii?Q?jI3h2sNWrxh+jQsRfuZSS5weMzpdskY9zd4TX4y9a8m2SaHFg4kL3KZx2xVQ?=
 =?us-ascii?Q?y15+sm5kplovKjqf8pUQkR6GwlFGeTd/edamOQStTJ6sj017NkK3rjshcJwr?=
 =?us-ascii?Q?+zoetRYapg2gMIXmfcn76b9agHCS/AiDKNo8vhkdOgbGeFELNHdNedj7FRKQ?=
 =?us-ascii?Q?tb6USPPWSup2ChqYaX6zbdC2mKk57HJAnqcQ5+yAIchrpSVI7mt4KEvtdRBA?=
 =?us-ascii?Q?I96LRNuyEyqR72naMs7nlGB+/xv9lpOlTXBy2qZLTf4M4dsUAtUWigMFWvBF?=
 =?us-ascii?Q?cAiC6xUMe17r/6YZj0jlStwAwzZbYWCY4snyPBrLYLrvZoKCvy5DwArrBkDr?=
 =?us-ascii?Q?R8NYyNNxEz26tp2J8pjGtnZlOV6Z1pQQPHjqh2w0tpHczHsxzQD2qaiOByTQ?=
 =?us-ascii?Q?MKz6I1bOsq/SQxidjAvno2qEROs6hxYv2vktgBsLT75ti6BqO9z9bi3Rvmfe?=
 =?us-ascii?Q?l/cWZg7VKyKv03CHm8z3ItEajfkxnqIvUu0XwRz0fU/Nn9NIRV3igmndREtM?=
 =?us-ascii?Q?eiaDV4QEciZV+I63J/WTD9MbG3GdEtVHrJ0fByGzM3ZccW1npalKUuau6ZQn?=
 =?us-ascii?Q?ltUDep6Fs7Jv+Kv4m4QzkzrRv5j4qDZd1AdRWB/Lio8Q7ZjQtI9OLBya1BVS?=
 =?us-ascii?Q?WeqUN8pU+kR7belkFWR3Pn0+Alg8P6mcgwViGX5rIjtzlpuIPH80ix/57aWU?=
 =?us-ascii?Q?NP1ED07AteaGSa2n8NcC3lGbWgJ+xx34QpQQLmbe62XZsxk0CvXjFQkL4UKR?=
 =?us-ascii?Q?H0002r7RwWQgg7SOg1VR2FKR/qALQbTw4f23SBCYpmv4FLaJl2+JlySHircz?=
 =?us-ascii?Q?viA7LcAaq5utyIMnSWD2wH5Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971081ec-f739-4a90-8c82-08d8f4112615
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:36.6151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/HRRvwzJCRouwXHxZ3/k8TP7udLchSFH7mRGtoWP8J7JQZdIoiIswu9bqvEnBIptB1MmgAibo+pZ9aqF4+dsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a helper to support LDB drm bridge drivers for
i.MX SoCs.  Helper functions supported by this helper should
implement common logics for all LDB modules embedded in i.MX SoCs.

Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Marcel, I add your T-b tag from v6, let me know if you want me to drop it, as
the checkpatch fix in v7 is trivial.

v6->v7:
* Fix below complaints from 'checkpatch.pl --strict'. (Robert)
   - 'Alignment should match open parenthesis'
   - 'Prefer using the BIT macro'
* Add Marcel's T-b tag.
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* Make imx-ldb-helper be a pure object to be linked with i.MX8qxp LDB bridge
  driver and i.MX8qm LDB bridge driver. (Robert)
* Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-helper.h'.
  (Robert)
* s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.

v3->v4:
* No change.

v2->v3:
* Call syscon_node_to_regmap() to get regmap instead of
  syscon_regmap_lookup_by_phandle().

v1->v2:
* No change.

 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 232 ++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  98 ++++++++++++
 2 files changed, 330 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
new file mode 100644
index 00000000..67425fc
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ * Copyright 2019,2020 NXP
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#include "imx-ldb-helper.h"
+
+bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
+{
+	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
+}
+
+bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
+{
+	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
+	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
+}
+
+int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+
+	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
+	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
+
+	return 0;
+}
+
+void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	if (is_split)
+		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
+
+	switch (ldb_ch->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
+					 LDB_BIT_MAP_CH0_JEIDA;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
+					 LDB_BIT_MAP_CH1_JEIDA;
+		break;
+	}
+}
+
+void ldb_bridge_enable_helper(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+
+	/*
+	 * Platform specific bridge drivers should set ldb_ctrl properly
+	 * for the enablement, so just write the ctrl_reg here.
+	 */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+}
+
+void ldb_bridge_disable_helper(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	if (ldb_ch->chno == 0 || is_split)
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+	if (ldb_ch->chno == 1 || is_split)
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+
+	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+}
+
+int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(ldb->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				ldb_ch->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+int ldb_init_helper(struct ldb *ldb)
+{
+	struct device *dev = ldb->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret;
+	u32 i;
+
+	ldb->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(ldb->regmap)) {
+		ret = PTR_ERR(ldb->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	for_each_available_child_of_node(np, child) {
+		struct ldb_channel *ldb_ch;
+
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(dev,
+				      "invalid channel node address: %u\n", i);
+			of_node_put(child);
+			return ret;
+		}
+
+		ldb_ch = ldb->channel[i];
+		ldb_ch->ldb = ldb;
+		ldb_ch->chno = i;
+		ldb_ch->is_available = true;
+		ldb_ch->np = child;
+
+		ldb->available_ch_cnt++;
+	}
+
+	return 0;
+}
+
+int ldb_find_next_bridge_helper(struct ldb *ldb)
+{
+	struct device *dev = ldb->dev;
+	struct ldb_channel *ldb_ch;
+	int ret, i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		ret = drm_of_find_panel_or_bridge(ldb_ch->np, 1, 0,
+						  &ldb_ch->panel,
+						  &ldb_ch->next_bridge);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev,
+					      "failed to find panel or bridge: %d\n",
+					      ret);
+			return ret;
+		}
+
+		if (ldb_ch->panel) {
+			ldb_ch->next_bridge =
+				devm_drm_panel_bridge_add(dev, ldb_ch->panel);
+			if (IS_ERR(ldb_ch->next_bridge)) {
+				ret = PTR_ERR(ldb_ch->next_bridge);
+				DRM_DEV_ERROR(dev,
+					      "failed to add panel bridge: %d\n",
+					      ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+void ldb_add_bridge_helper(struct ldb *ldb,
+			   const struct drm_bridge_funcs *bridge_funcs)
+{
+	struct ldb_channel *ldb_ch;
+	int i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		ldb_ch->bridge.driver_private = ldb_ch;
+		ldb_ch->bridge.funcs = bridge_funcs;
+		ldb_ch->bridge.of_node = ldb_ch->np;
+
+		drm_bridge_add(&ldb_ch->bridge);
+	}
+}
+
+void ldb_remove_bridge_helper(struct ldb *ldb)
+{
+	struct ldb_channel *ldb_ch;
+	int i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		drm_bridge_remove(&ldb_ch->bridge);
+	}
+}
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
new file mode 100644
index 00000000..54dfe28
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2019,2020 NXP
+ */
+
+#ifndef __IMX_LDB_HELPER__
+#define __IMX_LDB_HELPER__
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panel.h>
+
+#define LDB_CH0_MODE_EN_TO_DI0		BIT(0)
+#define LDB_CH0_MODE_EN_TO_DI1		(3 << 0)
+#define LDB_CH0_MODE_EN_MASK		(3 << 0)
+#define LDB_CH1_MODE_EN_TO_DI0		BIT(2)
+#define LDB_CH1_MODE_EN_TO_DI1		(3 << 2)
+#define LDB_CH1_MODE_EN_MASK		(3 << 2)
+#define LDB_SPLIT_MODE_EN		BIT(4)
+#define LDB_DATA_WIDTH_CH0_24		BIT(5)
+#define LDB_BIT_MAP_CH0_JEIDA		BIT(6)
+#define LDB_DATA_WIDTH_CH1_24		BIT(7)
+#define LDB_BIT_MAP_CH1_JEIDA		BIT(8)
+#define LDB_DI0_VS_POL_ACT_LOW		BIT(9)
+#define LDB_DI1_VS_POL_ACT_LOW		BIT(10)
+
+#define MAX_LDB_CHAN_NUM		2
+
+enum ldb_channel_link_type {
+	LDB_CH_SINGLE_LINK,
+	LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
+	LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
+};
+
+struct ldb;
+
+struct ldb_channel {
+	struct ldb *ldb;
+	struct drm_bridge bridge;
+	struct drm_panel *panel;
+	struct drm_bridge *next_bridge;
+	struct device_node *np;
+	u32 chno;
+	bool is_available;
+	u32 in_bus_format;
+	u32 out_bus_format;
+	enum ldb_channel_link_type link_type;
+};
+
+struct ldb {
+	struct regmap *regmap;
+	struct device *dev;
+	struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
+	unsigned int ctrl_reg;
+	u32 ldb_ctrl;
+	unsigned int available_ch_cnt;
+};
+
+#define bridge_to_ldb_ch(b)	container_of(b, struct ldb_channel, bridge)
+
+bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
+bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
+
+int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state);
+
+void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode);
+
+void ldb_bridge_enable_helper(struct drm_bridge *bridge);
+
+void ldb_bridge_disable_helper(struct drm_bridge *bridge);
+
+int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags);
+
+int ldb_init_helper(struct ldb *ldb);
+
+int ldb_find_next_bridge_helper(struct ldb *ldb);
+
+void ldb_add_bridge_helper(struct ldb *ldb,
+			   const struct drm_bridge_funcs *bridge_funcs);
+
+void ldb_remove_bridge_helper(struct ldb *ldb);
+
+#endif /* __IMX_LDB_HELPER__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
