Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AB54755A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C89112E77;
	Sat, 11 Jun 2022 14:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0199210FC7C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3YX491rzac6wuYWglEnxcgnjW6HMtRu8MQum1fgy1SDO+Ol2JfK1/irJZ2a/oB31KSLTFhcKCyyW9JlD+FY7wgW6t9hQA0ePeYuH+ovRSHZLIV/K/meIqF50gC+b4jTxXUVD60nOjm542BDPIBM2rwhTZJPrIyHaPk8ymX7RT9PLEy5+Ijr49CjMvDxeEaYauyBG1RctOfe0u61mtdwk++Lc7zhUEvFeMu66BN/Fbei8Uz0cJvHzk9u/kogZmW4NLgbAcPCoRJmDq7gDfrG0kcdeuZk8GkYsZUnnsXE2x4JFgJxvzL4U3dEH6NUa87r1geWE0/373SrzWJ8FuF5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqxJHncyHDZC6j30CWtx/fQT2935DAoNgRnUO3Oe7uc=;
 b=WV7N3OnmXjr4l/efOIIUjIu354yMMmT8iypwy1hVGGI9l2KsifwVLRSCMCSUSIWLJednAA6mepc0PbHM2/jqMUyQbmhwSbpPoUnuiO4rQnN+plBNUG7MjtKQ74Xc2DMF5glKyxfwg1ECBrKmHZJP6Nc5xNGf2MK3IqwR4ZdDQq6f9sAzDvvZRyrrvRVWTOb5dhUElr3JS6p2atAH5+pb/GPX5oViSvHxmC0O7ZV/oBlOH9uWUYMeQWdpELfxlvnTHres4gGlui4Xya7IU1IrtwkzGiv7ugPJ/Tkwwj+ZJEBXsIikE+NCT4i9iPoaKaG9eeuj4E8ZGcwUTxTWXd7vUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqxJHncyHDZC6j30CWtx/fQT2935DAoNgRnUO3Oe7uc=;
 b=VK+tVzauDAB2bFnHQ1nk3dFE7loGWj8HFjaF1+VFiXe7/5gj6TNZd9ix5BvgwVHD13n9UBhNis5qe9ZrfvZjWxq2HH2eWMUSaG4uSRPHo0OpNvszClZ1FW/C87Q4i9UxJuuxryviKh/CQ67tAiukdUCQxaKN2QrSQoE8VJzaMRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 09/14] drm/bridge: imx: Add LDB driver helper support
Date: Sat, 11 Jun 2022 22:14:16 +0800
Message-Id: <20220611141421.718743-10-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e6d38659-b97f-40a2-6256-08da4bb49b68
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB63472ACA177EAF8833F0358F98A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JsbZB2yKTIo1pHNzOMDqKsrXVK/mSmWk4TyEbyqfoFJtLvVRyANprOR5GCAsDJCTWxK5s1xgqQk50MoUhxppekln1/crTgnhtBG426yLpA9ox6/CG75iyKsWmhP4AvDRRMuGHgBHu36w5vfcNnuet7yNiKUxjZxmVEsZxC12XeOJnfMErssrGyEaPopK6+VrBomeT84Q+YqBuXObWR8KUe+D6JGqglWdEccr/8352EIfNVuZs+1NXObXjQNS4IQS8+nyeO21oeHvohrS8Js0zDr85maaCbrH9GjW69CkthL/15HFChKWcD9+vO7LK0qFNeyvjOiJ4YXg7tqr83bfI/Zc3w1kvxf7N2OfJMY/SBmi1BZDJ4AzyykTiin7lakOWIGAjuLF+mbfFDLU/jPCqatSQ7DlPmdaO7QkIdW4fKkJMed/czU0gE/y3AwAMQmWgFGBdek6Am/WftqR51q+KbWLvZd0AS1DbICFoq4DoSOwHyOVxTPVYyI5euDkFoTM6ke/gbwmUL1crNy+oAlvg76yztdlOZlFE9T71sCHGsRmFsUSapkl5wVTaQGyUB7KMMYTsCap/jsgHCq3oJuRda4Prxb4d/oUjH9DZBFAhQMY/beDmtyz24JruMTRJj6ZG0j6N1/yQVqJFCgBFXvh+4bH6sDiD/lqKqwftevJ+P7K2IMcT5+gr+3JoOCgfdvhycm6qp31WH8WP07A5NQjIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(52116002)(38350700002)(38100700002)(6512007)(26005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+XNWyrfhUgItJv2QaWGpQ06qedv3Y59CqgbZVIoKUSraQcdtQ4louJXkRjb3?=
 =?us-ascii?Q?UcfTnEzGxfjS83QjyfFeyJYmQnEaapBR0E4sWbmk5I31rYjVgs7wpDkLmkMA?=
 =?us-ascii?Q?hgH5uKoCFf0KM9c3i5l3H1gtQ1LNEkgLuwmkD5Fnntcs8auFqHCnUmLLEK5F?=
 =?us-ascii?Q?euzHMK7wKYJdjAD+3GzU5NAQVGKXWla34+Cj/SskCrxXIkf7kCa+MtYw7uc4?=
 =?us-ascii?Q?1NfrNHRWkuVv7NDUfHLauM4ZbbGKTz/fToKzFIB4e8c9l6J1RHUTDV3SjzpT?=
 =?us-ascii?Q?2dZlqJG4g6wcaH29vxK5uJB5W+IOZFVXy6fYOxv/IvmYC1H77c32a44dbxrR?=
 =?us-ascii?Q?oewqjsbCF9oNRaM+2U4IV1xLE1oSxVPq4pOZQny+9x6jIi5OwsIGKj3/zj7y?=
 =?us-ascii?Q?9IitREd1x+53HwIufDhtZ9LI+nMd9Llendu9dYM+dqv5H53okeUmLa8thY3r?=
 =?us-ascii?Q?3EriEu1SVpPyfy6IwYiHNvF2nz6T6d1i5GaKOPg/0e+N4ClRpRGUtDPDL/RF?=
 =?us-ascii?Q?Wm73PUffWF16fvOam6E5iJGljuiosB7A7sG1XnDllsysuRygn90nzhaUGIvm?=
 =?us-ascii?Q?8Tpn41VEnCPBlN4bAbjIrUlvsO+JQNgJkjMX3xsTVHs+LYFHMfSn3CbyNthw?=
 =?us-ascii?Q?/bVAUawJxmb4LfBxNM6eaAIE7L+g1caaY9z6liGntO+FYdM7abh/SOgdyUOz?=
 =?us-ascii?Q?EuBUtRIpL0HCQWT/Blml6XQRRKzu964IDY3pbDdF4Qm1CDes494LPHZhJzhZ?=
 =?us-ascii?Q?NrZm75k25W7ne741fZxA32yP7tv8RhNGCRbOZPCNmhftJQUFy285MCcQ3k3a?=
 =?us-ascii?Q?iN2YrSZK4G071m6PXf3nVDb4u+1FNGx87MHhAxJ5c2YQLkNhSgvW/4wIsc3w?=
 =?us-ascii?Q?otX1FW2zANzCkCPY5P8UoMVRoL7tnkkI0jnqTekqs+e4lxLPzFtj4Bo085yU?=
 =?us-ascii?Q?qZh1BWhy/99TRHzV4Ab5xEbnnbnl4BR6a6QufMO0uW5UmDXkqZU9VMqFMqhX?=
 =?us-ascii?Q?4e6aPAt6nuj1PHyI+kFFoCwXguq8n1qidB01YGcBXmLfkaRLlnjFpXpsii/c?=
 =?us-ascii?Q?nqANnU2F1dpeDwQTPKkz81KltGQpHjNmek5WET7DUQawBwYySC9ATdrAmWcQ?=
 =?us-ascii?Q?5dJgNwL3yNWb2eUEOHotFQ1T8vEFIRgl2sMcAr18vwWR+hPJWh05vZdGNIEU?=
 =?us-ascii?Q?rTClvztMWDfIEQJg2TqQFIxtQjG/xtawHX+yB4TsM35jzTUyQq/Jb/qxZalK?=
 =?us-ascii?Q?qyLmsjnZJdjEgchD7HdhpmjxuZi4/68cv2QuMaPcb1K2h6atzpBG9O6HfHQv?=
 =?us-ascii?Q?SbtS7G+Ih8WosWx2n+gJkwobW1lyM0MWfIUHVtsZ3fAC7OibEDop5NT0oNdg?=
 =?us-ascii?Q?I+jqnLm1Sf87RNNl70PvBK55wdxUeOv0Vc172e+Ol38P8YnadFVRmeEFCryz?=
 =?us-ascii?Q?NZmsTwyREYeUJmog2OiWMqDFzsAgOWBxQbpo2mkCNOaKq1G2PPlVEVU/agi6?=
 =?us-ascii?Q?atKri3A29LwYOASmWB9VL2ADj9HsbaBP+3BzfrszzIRPh0IrNNJw+va6SAJQ?=
 =?us-ascii?Q?JzXpZsrpRlBFVJMTL7cMgt8SY9cTsfGwpWc1DO175w84JBKnizNGlpskodo8?=
 =?us-ascii?Q?vVt3/DbAu+QUvVkwpwyGu7s3PezpbGSKTA6tymozr95WBq0Uk1pu7Ykk0I7l?=
 =?us-ascii?Q?Hn7qxukWk49IlFwvlZyGxhuOgS8ZcNlMuRjj6Sdm8s6U2McCAMiwZKg408I8?=
 =?us-ascii?Q?gjz0PJbdVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d38659-b97f-40a2-6256-08da4bb49b68
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:50.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdk4NdMD6nRFdVG1RhL1We/U4hqAYcbJMp943qxEccaxelDhdW7NvEeJMtipJgB+siv7RW5ZiScHRkfYJ3uIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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

This patch adds a helper to support LDB drm bridge drivers for
i.MX SoCs.  Helper functions supported by this helper should
implement common logics for all LDB modules embedded in i.MX SoCs.

Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Marcel, I add your T-b tag from v6, let me know if you want me to drop it, as
the checkpatch fix in v7 and the rebase in v8 are trivial.

v8->v9:
* No change.

v7->v8:
* Use devm_drm_of_get_bridge() due to the rebase upon v5.19-rc1.

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

 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 220 ++++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  96 +++++++++
 2 files changed, 316 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
new file mode 100644
index 000000000000..e85eb9ab5947
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ * Copyright 2019,2020,2022 NXP
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
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
+		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
+							     1, 0);
+		if (IS_ERR(ldb_ch->next_bridge)) {
+			ret = PTR_ERR(ldb_ch->next_bridge);
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev,
+					      "failed to get next bridge: %d\n",
+					      ret);
+			return ret;
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
index 000000000000..a0a5cde27fbc
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2019,2020,2022 NXP
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
2.25.1

