Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD854441A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2D0113DB0;
	Thu,  9 Jun 2022 06:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50079.outbound.protection.outlook.com [40.107.5.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAE6113DC0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brrT30xhjQwMhsurwZhx5CKyu/5L2IcKNQcK1Rj9MZ2NR+pe67sXFqkyq1g0ooFTMS/n6Ls3s+03ecVGCgxf6TqngJQgtTukWRLZVTtwJeTV8wNpIV2LlbA/MtQqu24LU0djKaSpFjx6aysKob9HGDhztpC8zcSNFfPtL7SP7y4kYQRm50fSxOuiAukmjIboRp0Uq8ETDMNHofO4+JVtYz6xwLgyXeRK7v1/sobvf4LVaqeYbNLz4du2znS/mLldlYRYiKxqaTpALpZYr243JjNIf/HnHHjqPsGv5JCh/zRvm8J5YuNyEMee/DrIHLoFKqdLk0zfcKCH9BQic/sE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35q5gNTRD4hbS3U87IquhQw8LuCT97T3pSkO05MznYc=;
 b=VRyzkWJSAzYMlArh2/aHSxNeX5UsgwDbri/bkI6/LXGjBOeWO5WHNlhcn1Ex49GyGAxJ9rXYDFSuNDrx3LyJ3K9eb2ixcvfFKek1kJwpeY2nuBtYTyML4wKJEDJiNN2ZVc/7DuGpDqBcTTNu17kR82J+knpaC6KcGSnqCOSaIcYTfhWDJJ7yQo3e9fNub1b3syeI1Hu+klagmfTfEUVRnQpInETZU8QtYCo2Fy9yNChZyUrfGPV8yBsRXtPxWsk+u2NXjdQkLcgUVI8Wc6FS9SIRcZBh/byzRUvVc3dwgmtFNROm0NpZCqd44DeYStPC2leGKPs5mURiTSFkAGW0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35q5gNTRD4hbS3U87IquhQw8LuCT97T3pSkO05MznYc=;
 b=Mdin6aGo4eRfyYdeKRVdCr9dqWTQoDNs9iwAvBYp5lir6vlO4cgkmF5ZcUW6goHBF8YHg2EMASVe8r4Y3xcqb6wYOKCpkn/IBI7ycJmjhTDyD2wnwqM1yvuNsxsBpbfjLb9wXVpT4VwM+HDi4JVxzB5N+Qb4c+7Ko9ozBlQwLjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB5280.eurprd04.prod.outlook.com (2603:10a6:803:5f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:49:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:49:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 09/14] drm/bridge: imx: Add LDB driver helper support
Date: Thu,  9 Jun 2022 14:49:26 +0800
Message-Id: <20220609064931.3068601-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab956d99-5c4e-43da-2f40-08da49e4251d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5280:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR04MB528074BDD3C6B4B85E6AD6E898A79@VI1PR04MB5280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRU9OeGzzCbOAN8qegDARYfjF9Coh3eUX+Ca/l2JSbRhBYomeLWSZ2XfhNVh3bxMrR8OYvLtBQFXvAoKU7TcTrCdQw5qKKe3GD0SeBL31M42BqPH9UgA1/MMNG2IdWiQTCQFjfCNTUtTmTVi+8C5cf+edNJaC5aZEpQGGffgH00E8N3b3lbw65l+9+mdCRamZo1fq/e1iIvqLszSH7njjzDrrniX3/TYV6RwlRVHh61RYkUd/TtQWnEOJxLLQjsjU748rRwFnw5HXHFPZ+klEMFmyTfNlN8iOqLmfyI7aIc/+AqFv4Lh1fQQb8aL+2gLAmd7QnhU7Lw8GyUzV2C0lhSoELUSE6CwAYtue29oBaKLRjdwZvArhrfXSI/sbz4Vwuui2EgiOMsa1sjSoYxude27rkMMm4gFGuOKCUKOabKQ6kF6uJJH3LT55RyByTCwfEby18CdWZ/eRmjgb4DGkWHcNoVH0E5qBGZKCtk7Uqr+Uqa9ecK4VuhObdKymdC4bqJRCCnWPHgOJkBDkzzfFl1daEIPAjCzbDBGUcPHZ/o+uhxNIEIVfFyoAf+cT6LJcT0karlUdM3wbYnsR0zn6/3YjelaG7FZIL/7Pf8WXmFg4OZyrLq3PQCkZRY3SLeEufpc+mrJxHZexyVlPN1yn4QHHVPK9rF8Tr6dNcngFWHojYzXBe7UsXOXz5bQdg5YambjhLsywbDvE6k2/KCg+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(186003)(38350700002)(38100700002)(6506007)(6666004)(36756003)(2906002)(52116002)(316002)(6512007)(508600001)(66946007)(6486002)(2616005)(66476007)(66556008)(8676002)(4326008)(7416002)(5660300002)(8936002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ih9LDAnRI2fBpJkvOVCoidIc3+axi8Rwed4GqYIW9GJydeWOKuUVB0s4YZJg?=
 =?us-ascii?Q?ThRWKWRs2+PUgW0wSUEOGBFGmGD0XOpGML9FJxvdokVLj9ZvGWNJtx0Kraup?=
 =?us-ascii?Q?8XNwCYm5QOtjq9czIb06YhASA4QUnsk0XCCIzSuJihKn6wW4AArU1nxodWpi?=
 =?us-ascii?Q?jz/Zsm+1CoX56vs0nOvrwqVGjaR3Si9e4ueQrdUB51TCqWLnaEwifgY74c2i?=
 =?us-ascii?Q?UBTfXI/3daPsTaWJn6rP2kUOM6aeUoQhQkuCChJoxo6dAd388eY/3uqAQVtx?=
 =?us-ascii?Q?1oz/u2ajkQU9tCLmLCdFoSxyc8aijlhM48y4mleb59NxBQ3in4HQs8Y0biex?=
 =?us-ascii?Q?DnGYbNwPD6f3eRCr30Qao75bmXjIwnnaeNSIsst8wgdy0Br8UqU0wqhspUfk?=
 =?us-ascii?Q?Dp9mPF2tRaIKywqXAZANyKw9Gp4hDrNvZUvhrJaD2SPofYOyil0knZliaZmr?=
 =?us-ascii?Q?Ytqyy1ks993/VAjqw2f6kyQRYIBOxDbn/RSFQbWxmt3wvoNA9PZtl0imeCMy?=
 =?us-ascii?Q?qe0PAx5V9xAZg9zmQ4pKZUhYRQzpLcVynnegr0z9GTwVOcTVspp/z2SpD9E3?=
 =?us-ascii?Q?opx6dUYTat4y4Q3DtawuLpt2qu0BWVSgXUyjIA+dwFlKLxcZBHh415sk4pRx?=
 =?us-ascii?Q?SpoMhf1TaNeg8hPKw4enZ6nAOtpDgduGyVB8ac5yMVm99FAnIfOZCoAQb/Rc?=
 =?us-ascii?Q?BY/0haTcZ3V+743JZCJRXCWVvAQEmFdCFiq88f3Kg3DFHRlPXVIUgSxUJ3go?=
 =?us-ascii?Q?NVq8HfYFyY/Y3Pl60dqGb7mf6x/ileiWSE5pZWDm9fEFsdNaCQ/rzMQqZpOg?=
 =?us-ascii?Q?MEjHS1Uh25sF1sswkrU9zP+0Vfn66tp1D94PtRC67zM46cN3yahcs0zRkhcG?=
 =?us-ascii?Q?0wOyayC+gym8EDf5bB+6M/31kFbueJQfIMCDIOa7KYs4b3xrUQzLYenFav+T?=
 =?us-ascii?Q?m1lmbjf++cvJpaC1AklCqtX+uxUMz3J5CpLNqiu46V5qajpJ/glUbsPGtayL?=
 =?us-ascii?Q?M+Wzn2+xvffWRNvF7xnSO2bOh8cHXEYRmmn1lUpkTJ3OrUkQ9+wkT7xqe/2P?=
 =?us-ascii?Q?0fLoiENF0KDHGX+RXlCjsAVXVn6yRfyNZ9vrJUfHhe9dYdAGHJroBdZK9+MZ?=
 =?us-ascii?Q?NJgeiSWIyXND4RYRY+RXhtb1HBZg0WcR+iJPOwkXhZWqIIC8DKFS+LHTQrxK?=
 =?us-ascii?Q?MwDcLalcupgj9GscbF0qvQ4KUoye4KXeGstTemMYLVUbG1SjDh0FgLZqmZ6M?=
 =?us-ascii?Q?nN9oXl48j8DkD6lrlIBw5NYscAxftS1xTDP9ZijjPkztaMb1OYdi9g0r2RZF?=
 =?us-ascii?Q?IB16zFCoGvcU4GQgHudXdqwzPOJWL0VlMUKooFAa6C5Q+LYI8fkR6F11MsZT?=
 =?us-ascii?Q?zzBv/N5Mt8Lb9Opdy0OwF3FAW7z/BgjsfjwzREk/XMS1nif7kKU5ly2YqaDI?=
 =?us-ascii?Q?MD15mroWszxg3NGj7FE9o094dh5yByuMeIW/DxJUZvnxM/C7f+3rQGdOCGgJ?=
 =?us-ascii?Q?+8IrozuwRZX8WpY9YyManh4uHwVfgmc2TAIlGy6V2FzPuohFHOrG9E20MDFW?=
 =?us-ascii?Q?cTMbGR3nL+e9SQHMIvKYn5jgNWflxpwS7pdSNkm4dD57QopmHPNp5AkzHtws?=
 =?us-ascii?Q?/vgNle2I54EDU2uRjj+VIP5pB2SocvOXGe3XYyvC2Tc/1G0Jm4BiYtjNu0rw?=
 =?us-ascii?Q?f6OWrpzVW4p1AoHaJqwmGBeJx18jmPwC0eg7/75VtJlFleQ9aBIzxr2ou+QX?=
 =?us-ascii?Q?w/azr+ItwQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab956d99-5c4e-43da-2f40-08da49e4251d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:49:05.2886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivXvOJ0ikEKQ0LsDg3VJPBY16IiS+jZf+nfpGE87uC8LfftoNVFCDemhKFD40E/ZhvdOMGEOK0sPhOP4yEJo5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5280
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

