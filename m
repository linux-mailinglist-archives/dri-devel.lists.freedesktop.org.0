Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA177821EC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D0510E17A;
	Mon, 21 Aug 2023 03:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062.outbound.protection.outlook.com [40.107.104.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C8710E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:37:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwJbvLfkJnjg5lH1cquNrB63HWRSKg5CaVXDdOjBsWEx+7FSTslqDgjPf71iMvrI6JcD/4Usfr+r6xdTQ8jnWdS0WunzGj69Wy+mXzjFsk17EQn6SvIiOryHdSGEjVx9bgqQ1XjY1AHn3jM1xBklAqv1S7NuEJK4eGErgkchBKLxEMg6xn7CK4Q0UFzn4Y+Z510rqzWeaFqu/7UtVS91XOWfGXuzwjdW5tRiCUangbwWZ4gla+ds5zYRaY+358uE/9ltYrU4JD/FxRYZX6WfiTKMSJLDTW+lRwPCs0FsD5X7Nf4VcEfvIYIInoyE4k2JMBnrb44WKbPr+d8vBbpKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9pohsnP03WT5gNWkT4QfeROXZdvrfaWd96SBV+bF+E=;
 b=JLDsn7X4kg5GFICvZN06yIu7UWdXnTqm6dwxFw3KfPk2gnddPIknGpcxBj300uAT29msTF5SL2WERlANYD50sHGfp1tI5vYRejlXyF4OL1UZMB0LzPojALEHN4EBKwRXWljHlDsO/0f9SVMgvZ7g8C6kgdcmgYX7ryqfQZk1vRFHmecmrS1vCKRmEwOt1Ttx51Je33Jcfm+wY0RU6/yxR9+Mb5nwRmYQdRDNkaaLYrEGPd7z/Mibuk6TWuKtK577hQuJj2pz4WLfGd2JfPfAzFDhWQc9v8VdvWPxnMucIw/hC9yuoU35NqgmH5UwXme42EGLhs7BLOa42bBxTSyqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9pohsnP03WT5gNWkT4QfeROXZdvrfaWd96SBV+bF+E=;
 b=HeMq56O5uL4bjig3zVQv77TrUz0Gg32Rzh/K+HQ9O67VwZ+GWekN+S7g+ftExprkyAx2hw/y/OFYnysBiQvq1bb4cTuoHQ26OwEEmQIQhWu80gry1oDT4QSe+m3qJCbG7rraabNcwnmF8OOtf0ixak3ck1nN84VhwGV170XJ/Dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:37:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:37:04 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 3/9] drm/bridge: synopsys: dw-mipi-dsi: Force input
 bus flags
Date: Mon, 21 Aug 2023 11:40:02 +0800
Message-Id: <20230821034008.3876938-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230821034008.3876938-1-victor.liu@nxp.com>
References: <20230821034008.3876938-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: b51e69dc-9d62-4ed1-a6d5-08dba1f7e339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2bXwdLl9+4ZK9KE/uRuA8sdWF7+dFmdULWNzok/AuGSBkIsHrDsUOu6l5P33//XJCHDe6sxV+6yvhVHWT4/mBZAd1JABHWSF2DTvW3Damk3mo0kiHgM3f6bYcR1C1mfjePGConE0dHgw2stoqLCKb3F6/MyNio2RJ7QQ/8Mn6ly7EYwM+ZeyD31HGyf/gTmDEf445Pjn0Xe5yqP//A/5/1FdYR/vf3+r0KOl/zws/+1nVZHqJLTmF0wvhsxYeSaYJqe7ReLIbJHmcbBInH6YeO0xr6f7v5+m9OpZGS+GSqbosEtoQbZs4wcEyyAxCZ9Ccy43RGAv0adk0fSWjcwax9kTxzHnY5ExaCQ2xPxmdi15VDePEwqa2V1lxU+KcqMssD1Z8xYVgUZJ7hR1H64CXUij6/Hhkdpp1C0c6bu3VFOpF0xxRPynAvBeyh1J3gSRlotSeny9Y58E0PZsf05w//dcSy6baRi3LfhqX5FWcAqCSi07ae8o0pLlvhPa8Ij3YruMYTahpIJNGHn37E6cpz1by5PBV6gho86UcVNV7f3zwufy6eyETpCjRWlwqbvBKhycjxjAh4mmwj74ofkqcQALQ5i8m5+ji/Sa8mJ/Xm0uNVmBi+8A6OigYgCQtdd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+tNuj4N76SYNVjrFngoGHwXaOBjFVHWrYKRsK9BtDLqj4NhgyV+CMr/FpXMS?=
 =?us-ascii?Q?22tUgxk8Jrhls8dAdhdnm/VzSqueqeCZV63VuPAN2x2TTrIc7p70hz+UjB9y?=
 =?us-ascii?Q?pppI7LLe68tSvlHTInA7wOR+0UuYK8oNB5fJmXu3YbeD+fdWU6B8V1bk6P4A?=
 =?us-ascii?Q?v4/rxr6fC73IvzayXc0xFPAIMa3hk16wIo5zga4KlrTGHTf7d8N33TeerzWN?=
 =?us-ascii?Q?lPTo8v4xojTq8L3XvJVW0e/ovUL+Wpz8PW8Ot3i37geFnR+ylM0Sb/Sq7zJ9?=
 =?us-ascii?Q?CpOZpx1VHQq7y4jIF6cD6RKUyWq+l2531vPsFtiRvWRVIBQRRMj7mBGcJq8z?=
 =?us-ascii?Q?fro+RGL2hcV+aPPIaXbh8qrr14Y5rvvT5og0NIi7lNLoP1MvPnHFZuwubfyC?=
 =?us-ascii?Q?5HawOyOHPmd3dOHfKJxeXYxFfwzlWKmKDUCgxVDlq6sUhCdxSacXf44LSS7u?=
 =?us-ascii?Q?s+wO+gtDJP+fcZ1XZ6EIgUud2x9SSrisTuMEgFdVrEO3R73mcFzOpqmnhfXA?=
 =?us-ascii?Q?z5aR2lothqdm5CmmzhbrczM29L2eSYH5JxHmiREd9GdAYw4vqmZRfcKHQ0ws?=
 =?us-ascii?Q?1eDkAIrJVC4Oy5BfTHN5fQNjDYGXBrtLjp8maJapYSSe6jbm+McxUOx9aXBC?=
 =?us-ascii?Q?seOLmA+vpCzmHYyQtRhji7pnRYAIzmSlsLSGeklwYNYJBLxxjBosDDuoGjBv?=
 =?us-ascii?Q?NSumtAJzuWHtYaXWLpO1RECh/zceoV27er5uZTavvpgIWgarN2njoRxkHZci?=
 =?us-ascii?Q?ci+R2OOlHXUOrG6U9qfzqAJD+suC8SodQYi4g6yGPFnUVaK4q2EcnsCPp6XJ?=
 =?us-ascii?Q?Mw5Sfr91hnYqRa+KyF9SVx3q63k3OJY+07Qo6RT87Esgvw7wDmJ6vkGm4K/U?=
 =?us-ascii?Q?Qw0f7laYKjbR/8KEWlnpwvuLwLh92Na5GN+br1dkKjcCXPVNKIrCk3NP73+O?=
 =?us-ascii?Q?/JuJU3L+luEavgYSoyj8sVl97OC7DwByPRrJbenFAP5GiCuselWCKnQiTKwb?=
 =?us-ascii?Q?2wiBOtHZlMBSgaHBrWPk3M67Dq3MszdQKGQi+siT0AbMpVvzzq4/pPcOEItZ?=
 =?us-ascii?Q?KbuqvHRHrCfsS+jX0j/ww6+O4bwztWm7IAyxPybiGpcOLHUIbBiNV0G8V6u8?=
 =?us-ascii?Q?7FJCQumucztUCzBWcg8mlsxSQgayBx3R/5Qt7P4dl8tgIu5oIvsehIDNqGyi?=
 =?us-ascii?Q?Yzr5lshMv+G6bookShQxIX791TkX0kQK952MYbN/UohzTPzC7tJZoS/locm4?=
 =?us-ascii?Q?iU8tbrZCUZqqVDaFfXip4LM+UnvZOTtrta9hZ5yeUtjG7/KDQNXaGvCwBjDz?=
 =?us-ascii?Q?NmohKflRv+jZOYnYLwNOFoAfZvaIHfWQPU29qcChj1dvB+wmeqdzJYrkhI+0?=
 =?us-ascii?Q?GBi7MowjM5yKUmUwyX0/YLvBpWY13itoOHLMRtRdS7LLHOOoLEYX9rAJTc1A?=
 =?us-ascii?Q?pl3VN6KqH3fRYfnwY4zh8whBDFePIMxrbL1gNNiWOqbuRgONnqozxvK9M8t4?=
 =?us-ascii?Q?2t0Bi0KreSYuwTiTJl5ZguCUIPOogE5Ucnv6zSd26d93lCdXetPhYBIJbM11?=
 =?us-ascii?Q?Cxf9ph1GCeC5XD2q96EK+IUfdv0oGOnRSu8u5pc0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51e69dc-9d62-4ed1-a6d5-08dba1f7e339
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:37:04.6711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcWkeLMGkKQyhz1QyOYnhMcORIVcY+ydWjRZL0Id27f7Kjbo93Ph8KzrwyXI0lsz0TWndz9etTRJFxg2FJKg7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DATAEN_ACTIVE_LOW bit in DSI_DPI_CFG_POL register is set to zero,
so set the DRM_BUS_FLAG_DE_HIGH flag in input_bus_cfg.flags.  It appears
that the DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE flag also makes sense, so
set it in input_bus_cfg.flags too.  With this patch, the flags set by
drm_atomic_bridge_propagate_bus_flags() are overridden (see comment in
that function) in case any downstream bridges propagates invalid flags
to this bridge.  A real problematic case is to connect a RM67191 MIPI
DSI panel whose driver sets DRM_BUS_FLAG_DE_LOW and
DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE bus flags.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v3:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 945d46a76995..ed9288a9c444 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -23,6 +23,7 @@
 #include <drm/bridge/dw_mipi_dsi.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
@@ -567,6 +568,17 @@ dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int dw_mipi_dsi_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	bridge_state->input_bus_cfg.flags =
+		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+
+	return 0;
+}
+
 static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 {
 	u32 val;
@@ -1036,6 +1048,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = dw_mipi_dsi_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= dw_mipi_dsi_bridge_atomic_check,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable	= dw_mipi_dsi_bridge_atomic_pre_enable,
 	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
-- 
2.37.1

