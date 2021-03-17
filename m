Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3733E801
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C8289C84;
	Wed, 17 Mar 2021 03:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5889C89C60
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOD74j56pKKZKZvIXHJdxwomHT9inoTD6QOfUJPhcAt/ZNIPIIXX0K04XGe+0FFB8V2DuJT6nf7YQg0KRf4aylOnUr0oLNJDIyqkogTT1xy8Xq/aX3IqQmvcZ5dzX1KgutVhGtm1vk6MW9JW4EJLuzmxA/mYSoypPN4pjLZvmcoyx+TNBJCtO4eqAKjcplhesHRYelEQuSWvAa0WJBWaq5Knyd4k7N2TeaptIjIX8OTf+clC6GaJ5IJMH69lvECJDmwXv4QWeE+mgRnhPvEtUcuqtTKLib1mgBcDG+ApSrG0i9c2YmaTt+laykqcZGod3wPE3wT4fxdsFZqb4jtQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AmJDD0juRXtlm1CpeLcdr3bh9SZNfq+Cr5pkyVXKmI=;
 b=GH6ZVbbBvNAycAWe0fN8a6jej/KqSbYD09duIju0CTN9j8CvVFRiAusEo/15qYMEXhxF+4TOkDi92L7QyhiG6FtUoJqOU+qhj+2zO78tx4XeUN0Z0oK1zLxcsDVF6VFANGXLBJjP6Yv1GnVpF519pylp43yVX7hZmx42iNTeuzQ6WOzIV5OJW9G4o27XjVCJ67xMw/rJeEErIsw+kGDNK5lhByZa0qztwZXSIoB5OSnp1PlyZewbe9NRaMB5uWKKNOACn6BNxGYCGHeFz58kZ7HfcXkzZpDASgC3yqsh/Ij62Z+/PL3ywbN3CUIkdSkuo9hh99t9eNg2KUvYutlTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AmJDD0juRXtlm1CpeLcdr3bh9SZNfq+Cr5pkyVXKmI=;
 b=FZt8SuBspz6vXsYnzkqgnM6vrdQFkrMayRD9Y0YQLDowdXV2n4+aJm45zImGiy9KPpuQHqwrMd0SmNnvEDcWck/uT+s+SHQa1TSWZw0Mw3TD+MYcMd+cTrzF29/JRo/mMHi4zwlxk2rI8DFsdoDbh/XBbgZnTyrP7i+YEaeUHxk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:57:20 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:57:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 10/14] drm/bridge: imx: Add LDB driver helper support
Date: Wed, 17 Mar 2021 11:42:45 +0800
Message-Id: <1615952569-4711-11-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:57:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09578d67-8ca9-4132-62a6-08d8e8f8c356
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61410F948C1764A61978FC1D986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYesXYx6UuUkg7hxKuFe/RcOy41blsrN5oCrNT4YxYpzu7pAE513ArcyddFYFXe3nIq16GwqbOq46CQo1fAheItjis5oMYaAsXTGmWlVEuIjyhwtEAqP9MJYh9JyYpZxYwQRk4UZrekJsolaesGo63HDSp3j2w2yTaFDBRRDUa7Cd4/c+qVyH4UE9xt7WVa4YauYC/kREwfc98hQBQw/iQ751SlYkIQnqssAQfgrTxJLTPgmsxdyBUte4lkHbpfbzAODNDtuEmOsPQbJgv4H0vPSGKEmv3oRFK4XCuvBKfko4qkjGLk/HLqgIvYD74jrygBWkGxZ6tXYTEzUCDR+GGRbSPth+9OX3tbqsnp30t1qwaCPaAUVnrAEQ364QKWLeTmoder4Mm9j9DMr3uNbsXsqVofqR/LE/iRXOnBaMdjALRpQ5Bjpl1Fw/0nbMNQUtpVxTxzAJNzOo9P04qSqyzvwead7vgIAWE1gH+H0mNGxSQJ8L37rLcRTHqdP3MUL8tsMHzXkVK9+kwxrE10IB2cnerww9cbSuPZ5GiBw+SgIUmPo1TjrTnAJAMrWPyEWymJCj0AFUXQiEf4slu7Gc7v11IWawBtnSAWXz0QgFCFnC810ygGRYWMoABkdwGaW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7avyRUJ3j0RdvN/FZCRPsUXlMGTHbEqjX6ZgrnodY76RlRB0s5vhEJz0meAr?=
 =?us-ascii?Q?bKyF/i5e46aTr0/+yxIzdYpFNu0kw0hjoA0ULr3/UiYKFcQtojoiVD26BG4X?=
 =?us-ascii?Q?bYHPu4wHHlLogUgMbWbU8gncDiGqFIW4oF1/fyhSdDzdV2PZdA5Qgj8lD5wD?=
 =?us-ascii?Q?774/NM0TN4u7YHB0NQ7I3tGjzL9y7N5BQ2WaX2P8+FIXnrPQHBgc68xQ5G1f?=
 =?us-ascii?Q?VWG24sCcNrvZmn7dsFhioFo9CRxOwfmWVLWfNzJEFHu92T9qS4dsepfQXHJZ?=
 =?us-ascii?Q?npTJbzfYgXN67yH5HSw+GPvFUp6t5gsFzPtVKUE9+JS1V492TOsbqsvWfA9c?=
 =?us-ascii?Q?c5DlVCCZYHwuEvcrF6M/fAwLyUZUxDtz98XDogyt0/97NWnt0GoptST6R7a2?=
 =?us-ascii?Q?3YKPuEiohpCcU/OcHxQRuRQhdhjjUzaX3kYxKZzJNL8keKYqX/rSE0RwP+I6?=
 =?us-ascii?Q?atSwl/WH1qb2GP0RMYw86Lb8XI9ad//qT1ryUoOm3a+nHbdK8U28v+jPTOG9?=
 =?us-ascii?Q?gWGIoH5QnYarJBEdqNNDjc0Ef+ZEj/zT94jzlwdgCMkZ5VOKclXbS36pCnNP?=
 =?us-ascii?Q?K51Kw7MmFA2hMC1D/HGTWE+wmQFFDF+xpqM+4fDzTufj8LsdVvSsJ7ZwNF9c?=
 =?us-ascii?Q?u/aeMGYHAP5MSltxsZ0plST00CmVy+OfJI38z4gB+cidfXpK6V+D16ZDGWug?=
 =?us-ascii?Q?XOwQDawhaR/PjMLdj7tttH67dfDfaID2yF76HrIqHXVz21H+/s2L9kH6uL/W?=
 =?us-ascii?Q?s4sKYiJFFijl+CszV+BdYVsDFtTlddy0BsaKiKES4hv59KQiUyUFUdbqyDPm?=
 =?us-ascii?Q?TGNrPqh//xHl+Dpxb7ku6/CRkSmthc2BICjjElBFKdW8/CKmdPLPvi73cwBP?=
 =?us-ascii?Q?Uuadwsrvmxgmt7h0lfbT0NQ9l5DjoIUIjL4D7praqCjwazSyz7LeKfTBLb/O?=
 =?us-ascii?Q?FZssn2M1WipoCcTX+cymd0eonqUDoil3gvQb13GTFDdSgUpoHg9bqO26bj5t?=
 =?us-ascii?Q?XrwtN01x2OOin5eP/UlpYm3skwtEAlba2zHlobcSsUHnUv/I18x/0NY4h/zO?=
 =?us-ascii?Q?xa5l6M/2iQTFX1Qr/ZLGcCN6b3t4aufSKu4+6M0Ok7nA+BL+9Zn8E5sWy0Fn?=
 =?us-ascii?Q?4StFsyYEFwrAl/3eNm8gK+QqUadDUYbaW9vp+kPFSOKqGrM26Li0b0WPyEYM?=
 =?us-ascii?Q?IaF5LVRDWfLNFoAIDi9k8f32s5QfePcCKfu/MnVyE8jgEKQCfBPmc2YAbiPT?=
 =?us-ascii?Q?nbFG1xccRZSECqyodV7EZAtVLdmBYOVnv/2zyJwLSofXScf7bB41fjTUQFUL?=
 =?us-ascii?Q?yvek61myXd/H01ZxhIJfAszz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09578d67-8ca9-4132-62a6-08d8e8f8c356
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:57:20.1745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBQHGHTmc+iL5+T0WJlJtGKwdqLXL+rFsz/d8ySpMDxjAuI7D1m84cJ06b/9IHHipPmzqKwdHqkYoEt+1NQnaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a helper to support LDB drm bridge drivers for
i.MX SoCs.  Helper functions supported by this helper should
implement common logics for all LDB modules embedded in i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index 00000000..d01c4ff9
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
+					"failed to find panel or bridge: %d\n",
+									ret);
+			return ret;
+		}
+
+		if (ldb_ch->panel) {
+			ldb_ch->next_bridge = devm_drm_panel_bridge_add(dev,
+								ldb_ch->panel);
+			if (IS_ERR(ldb_ch->next_bridge)) {
+				ret = PTR_ERR(ldb_ch->next_bridge);
+				DRM_DEV_ERROR(dev,
+					"failed to add panel bridge: %d\n",
+									ret);
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
index 00000000..748c378
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
+#define LDB_CH0_MODE_EN_TO_DI0		(1 << 0)
+#define LDB_CH0_MODE_EN_TO_DI1		(3 << 0)
+#define LDB_CH0_MODE_EN_MASK		(3 << 0)
+#define LDB_CH1_MODE_EN_TO_DI0		(1 << 2)
+#define LDB_CH1_MODE_EN_TO_DI1		(3 << 2)
+#define LDB_CH1_MODE_EN_MASK		(3 << 2)
+#define LDB_SPLIT_MODE_EN		(1 << 4)
+#define LDB_DATA_WIDTH_CH0_24		(1 << 5)
+#define LDB_BIT_MAP_CH0_JEIDA		(1 << 6)
+#define LDB_DATA_WIDTH_CH1_24		(1 << 7)
+#define LDB_BIT_MAP_CH1_JEIDA		(1 << 8)
+#define LDB_DI0_VS_POL_ACT_LOW		(1 << 9)
+#define LDB_DI1_VS_POL_ACT_LOW		(1 << 10)
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
