Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82D77195E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0710E1BD;
	Mon,  7 Aug 2023 05:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2072.outbound.protection.outlook.com [40.107.105.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656DE10E1BD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDIeV9VMdYbaMtfpzA4kfIHZVT2iw/+emYSY+uABZyju7RDu8WfNmgh/7NB3Qplz/9UdvJEQKuteYDDPejCnkMyMa2Okhu6Fax/RPm3tZiK9dtawVk7AJqlqLJKb+2mdRcyCGjg+dAXfn3NZu/A9hFIVpiwIeLB4z+GNUQBnomQ3JVgF9fX4/oy0R+A63I8aZyZSUvuw+pN2aM5MCimQEwzRdVuGZ/+kor5ESRDEJm71E7cOn6ZAZCDDutzYpjIQGv6XLVjhXC1+Ld8G5cHpfaeebe3oG3/awyFfwLv8fkd6jgOPRMYWhGixfqRZl+/3G6N5e/vddXu65iLuhwyB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzECK82M9MNzisvsalW9kbKoYfziy5bbytBxt4RYry4=;
 b=eNKO4yiiL6b/2CR0hG2M2QDUbMMW01ZSN/yT7eoONcoZby+tb1SWj2PBUpw7pwvLuzSn/Wrp2hMv+kWsoQgqD3peopC2L9dPQXeRfSzK4R/aVdHT8Z78IXuTVOJ7iVCFQ7hk3PG3nSMabF7FDF+X5/gDnKJ2iw25aNcNzkwGez4u7fjSTO4FCHMpH7vaNsnh1dtLWu9xreSehGSg98cvB9lhAq9V9/crmuAYQRclwlqnPwm1qkNe+20noBMmVtrQ0OVrRbBYaN0NCcE9ALd2XXv0sJbAqrJVCahcfBdDvbwe5d9Vs1epI3pIyW+fnk7n8m0bIkbvHmjA06eesmUmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzECK82M9MNzisvsalW9kbKoYfziy5bbytBxt4RYry4=;
 b=SjAjujmO7DQnN3AAV1TUwXmqQTsH62F6FDKyGh06tEJixAAPqRTqrVoLgyqxMd5V1feF8MPXm9yZFIFctvK347a4rzoekoyUpUPOsiQAfuHv4BgmQV65LZ8Yqi/+X8FMKPQA/neFPXaUcb/eD2XikAHQGaoKzv2pGilN6LkF72w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 05:22:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:22:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus
 format negotiation support
Date: Mon,  7 Aug 2023 13:26:01 +0800
Message-Id: <20230807052608.3038698-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230807052608.3038698-1-victor.liu@nxp.com>
References: <20230807052608.3038698-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bb36b2-9e50-4386-75bd-08db97063a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yVQlxMemxuv6xTTq18Hmg/TFbpCkF2A/KWAz8GoJCjgi7SDDjG5trcqBqO/fmmUlSyRxXIpnibPUi9QmcRJpDmw4+lHTG/BKQFMO3sij/vFr7siHfhCGEmMH6xNMO1IDtpif97Nf9gZ2KG/K1qHrRuvJ+9VSlb1PzRj3+1ff7Uy6HOGtgCLrlw3xMk2RtlLt8OElYeMQ717cTceIB1fg8fi4FuIqIyiGxoHSiZOvlqlmr0CwG9rj46VdUv7BkjCXVALuupTr+hiUm+6UNb1iLGnY9r5cVVF2OEZNUarN2DZ6QFotU790KeeLzu7tVgTh1JQmeCzYmONNdrJyhMCp8DqJweuWrhM5LsM1l9DuOpYvs+g1jhLUXDEAqspRX5O5myebbN/1o/RrJRMn/2oJODf8I30v7JqZMdr9HOwib2N6GJPEW81m2xhGjigwac02TpFpT6OeT5f6erGou5BmuIZVFaYbmtDaEpu0DBmRj2K6/h/0A/4e9QJS+YTUzu/HMaM8BNEApxLI6e/1aBDCMoW9xJP9WO6ac4pyAfUPhhWoE9PvOFRIcB3kL213rUzCEb9iLMOpQ3nld/f5uDMIL9uQOxw1f0mvoYuFsUaWhfItg9aiBdhqxndGv5sGPWH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(52116002)(6512007)(478600001)(86362001)(26005)(36756003)(1076003)(6506007)(41300700001)(316002)(8936002)(5660300002)(8676002)(7416002)(38350700002)(4326008)(2906002)(66946007)(66556008)(66476007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Os7Y3jVUoG10PQM665CXZkZb6J6dwp0ypVhd9eFYvuvnLWdIInWOzkGhBCN8?=
 =?us-ascii?Q?Q3M18BOGhWTivudWRYVf9Ui3h1Hk9isZhDXPiX35ZCdvLWcjgPZE3dWPDBLq?=
 =?us-ascii?Q?Rbjim2cWboiGdMHWK6CQnlqySlLE7alCLLAFxdTmT5YN7losIBdd3Z1r1GBg?=
 =?us-ascii?Q?3x+Kwh/sayDYUgHmBArDLKx3FbIRWvy2VytDl7YXKuDEuo1w34Nxs+KtRoM5?=
 =?us-ascii?Q?HI552H6T/iVcPI7xpjs17Qp2qYAv5gzN5wP38ZzLi5N4i8/3mRwnvkN49nuO?=
 =?us-ascii?Q?7oGCwZFSsux7i4CzSqq1lpa4fOZ+dzcOwuq/YjUmp4OD3+X/OoOjwsRwL4FH?=
 =?us-ascii?Q?+kOGe0NLVoTvetpWfpyX1d4g0tCyXmn9KOmHa2QXFT8ZIKS+e5lVqcvx9XQ9?=
 =?us-ascii?Q?RPfY6okhg3+8BcUBNWkBKCNJ8VjTgdQUtdT4V32F5lDWgrRLDc6t4dGnO94u?=
 =?us-ascii?Q?FIx69XPV7fPvMhdSx7FvhRl3Ec5wVBpA6sR4rLM0FDN8l3BZJaulmQ0B7MX/?=
 =?us-ascii?Q?OVM3veq5Q4c6z5ZaoLdaBUKPFrJTdcgkI+PvjstmKTmMg7zq0U/EX/ro00vq?=
 =?us-ascii?Q?hynvUI00fJfoKjPO4E2+1BZoh/TOIQJtoEs34dxYWfNGfTbBFyBzfL+bwCKY?=
 =?us-ascii?Q?vsz4Xab3BvacGiIRW2GtHnJPNb9WlXdXNy37Yj/Bi4D0K6zV0FH7sqCv2Z4p?=
 =?us-ascii?Q?qO9KHg0fY+vU7asDJOJOYPw/H/iFPsOhnuaD7RreX2BoD6kfw9UeY96XqL0O?=
 =?us-ascii?Q?fRivemajx/39SO2TfqCJWD4Kp8dmKx8/kmLo6w11vTgL20MEC4G1uRGxBEIK?=
 =?us-ascii?Q?EALrFDrbmsNGHQYDPoj5khdlIIg7zTf8FzNJW/I+NcREkPcLGaVqRF0U70Jr?=
 =?us-ascii?Q?fSszs7kH+gK67CWBeno89SUJvvAqQWpcRFJpEy841WQYk8+XzvkY2QnROHZS?=
 =?us-ascii?Q?2ZV6K6/Csrb6M0hQFhIluaCe25o0iw5oBuswfx5pP693bRaQA/pIvLBRchCE?=
 =?us-ascii?Q?oSJeCvySCI54OIwz2486UxCbn+XhZzdjMATImYKvRwr9J8bNzvgUCutorinM?=
 =?us-ascii?Q?Tl5hDi8fOIiVch+uO/TzEZJZWNQYa7g3PsFwB9emYjx3uO5pDG6DhKIpIZPY?=
 =?us-ascii?Q?j1D8OAAx4/Q7nfAHnCYev79A2taj+vnrq4H+t970waLk82+wiw3VqodUBzTk?=
 =?us-ascii?Q?FTUxcKQSdUBM1zim2lq2b1YIgtFjQm1qyijtq4ycm2p/hWFSaNAtqwZNt+S0?=
 =?us-ascii?Q?D45nipO0JLoV+KCvgI6hwFEiI2rPNNobqCdpEsv6pY3pkqQq98fq2dWRND09?=
 =?us-ascii?Q?6+RjfuYbVamW6JmLV6IsT0zHZ7yQq3jYEkDVhsBbnaDy83daq1Yrlyriz1rq?=
 =?us-ascii?Q?byeIVBTVX7O9SJ/qtyixt8TNDGG41joYoesyU1Ml8PHTpXxdUhnHOoCoe2zM?=
 =?us-ascii?Q?epMPlDczDOTtxPfhqIW2BilUsWIdUbqUJfNCLazNcjM404yRNaSk46FR+SMs?=
 =?us-ascii?Q?n7jbuqWtFi9unxCBq2xLpEIZCCp+ZmTi/4p57Ed+12rhX8hMj3PgEtqZFc9n?=
 =?us-ascii?Q?FitzKrPMWM9qFoVWZ4cNNRsNF3dHIuMurb7NpFBr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bb36b2-9e50-4386-75bd-08db97063a3a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:22:00.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QfuvpvhlR/hEufSeou9PFhmN3qJESUBZqnxHX9cw3zzdz7HtlNNzijK1Es3X/vf1mrTBdbECM6GJH5Rw+eEhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390
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

Introduce ->get_input_bus_fmts() callback to struct dw_mipi_dsi_plat_data
so that vendor drivers can implement specific methods to get input bus
formats for Synopsys DW MIPI DSI.

While at it, implement a generic callback for ->atomic_get_input_bus_fmts(),
where we try to get the input bus formats through pdata->get_input_bus_fmts()
first.  If it's unavailable, fall back to the only format - MEDIA_BUS_FMT_FIXED,
which matches the default behavior if ->atomic_get_input_bus_fmts() is not
implemented as ->atomic_get_input_bus_fmts()'s kerneldoc indicates.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v3:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 30 +++++++++++++++++++
 include/drm/bridge/dw_mipi_dsi.h              | 11 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 57eae0fdd970..8580b8a97fb1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
@@ -536,6 +537,34 @@ static const struct mipi_dsi_host_ops dw_mipi_dsi_host_ops = {
 	.transfer = dw_mipi_dsi_host_transfer,
 };
 
+static u32 *
+dw_mipi_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     u32 output_fmt,
+					     unsigned int *num_input_fmts)
+{
+	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
+	u32 *input_fmts;
+
+	if (pdata->get_input_bus_fmts)
+		return pdata->get_input_bus_fmts(pdata->priv_data,
+						 bridge, bridge_state,
+						 crtc_state, conn_state,
+						 output_fmt, num_input_fmts);
+
+	/* Fall back to MEDIA_BUS_FMT_FIXED as the only input format. */
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+	input_fmts[0] = MEDIA_BUS_FMT_FIXED;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 {
 	u32 val;
@@ -1003,6 +1032,7 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = dw_mipi_dsi_bridge_atomic_get_input_bus_fmts,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
 	.atomic_post_disable	= dw_mipi_dsi_bridge_post_atomic_disable,
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index f54621b17a69..246650f2814f 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -11,7 +11,10 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_modes.h>
 
 struct drm_display_mode;
@@ -56,6 +59,14 @@ struct dw_mipi_dsi_plat_data {
 					   unsigned long mode_flags,
 					   u32 lanes, u32 format);
 
+	u32 *(*get_input_bus_fmts)(void *priv_data,
+				   struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state,
+				   u32 output_fmt,
+				   unsigned int *num_input_fmts);
+
 	const struct dw_mipi_dsi_phy_ops *phy_ops;
 	const struct dw_mipi_dsi_host_ops *host_ops;
 
-- 
2.37.1

