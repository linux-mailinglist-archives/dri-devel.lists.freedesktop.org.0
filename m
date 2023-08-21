Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB07821E6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C3710E17D;
	Mon, 21 Aug 2023 03:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098C210E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDtwLFMmmliaZEp4Y8vNJjyXrrPNZqJwS8v/Jf4vwMIfZznTOeFCaH/pmAKBReMCLfJT+ZcCcoXEDmYYIt4TE27AydDI7+0PfpjwFCxaMwQgnUo3qw6mqek3BVtb5CDWzuWT/6J5ah8rrVBpAUIfBTA0cVD7oUhBHaWaN4z7enaYi2IteBAU0thmqiHn4tASlEwn3laHfXsf8TGQMpmrSGXJ3wfteiHoXBntiPQwGyl7/GqqaK896DLrP4y8VRcxQd3mrPFUdcefzTBM6IJIWt4mjB/V06x5VzYmqwwQEAHvj1cdlzbBwNqL5FKTqUmT0wcBqavPdtO3rkZu5/ot+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTajqDPDTlF5+IDmLkxFKLAOQB1bLTu/KYQ8rt5+wx0=;
 b=ZJEDI+MiS22urXuY2OX1UdvEZsUUggp27VayQPAn9mqkOLl0caBcHEkxoZRnEXzRUsCOnmVtTtXnu0NgmPqtEa+6pDe2uvucdy35lgAdLpx5UICyIL9NM1o4q7yYNNq9PyiVjz40kqbB3A32hBvqtILnd+fIpwlx3DK7ih/3ecpcvUVABZ0YdeTWOHlzNNSl3bToM8dUUwMQ5grifoThHqvUr9Il4gefgRoJCZKVjFWlwAaExBYOtm/+kJfbrqcbWS7IfR0HXq6gw0i+5iKSVHUMqlCDVn/JgI9nvnLxrL82lsAuQBHdcqcnKvRzIePDWHXf6x3ukBCvLYmRG/2ZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTajqDPDTlF5+IDmLkxFKLAOQB1bLTu/KYQ8rt5+wx0=;
 b=BiIg7TbSPnBwXmFDYPK1CQId1ZL9P7gu9dQLIT6oQnKto7IPYJqLmSomALpiFUcyLIIppdnomhxe5Vs+22z0OWnKPAvyTpv2cMQyqHN3+g8zI87hFXHgQU47NNRTLSn8KK29bW/k9j3ls4MQl7KCuypcZ56tRjTEHvrZINf+gIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:36:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:36:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input
 bus format negotiation support
Date: Mon, 21 Aug 2023 11:40:01 +0800
Message-Id: <20230821034008.3876938-3-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 07f31ee3-cb7c-49bd-9b2d-08dba1f7dec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEAj60bOZM6bN+LwCkMk+loCtgYJ0Pg3YQDC0HvvxV7N2llI3+Wbjk9ylR9A8fsEjMvBGyfAI6Y9wmi6IVAK44MOxZxHsvz1HUSAC9CGpnV0knFVmQQnYwooL7HMm98QM/lZjEIMaNKZA3zrUGwyA25zBR+NKsuFsIaBCyGXDfCz4e6DqIX5k0oCFl3JHw68cWdPQRHrN77X1OSmtCIIt68ljHdwdxN562Qi5lpsX99eRtbFVFTTr+7b5Mz5yDSImS5Nd7Ff5Wl81Bkr8AE2sr2IqVGYA9LB4IbArZi83wbofRyBFIiS8Ya6+Kt0xiKDqa2MjKfvi742AuFfsqsGXIlJ6EXLKDx3AVUxqYQ9lNMJrPl48hw5E/KrR7SGGptey2ZEYLhME/w7HRursiPf3keb3z/KMhfis3EvXEGNYdmT5vZbtxgpUxH5B+6SuXq4+lkWKtO2ryijLzORp4H+ZehF5JR8DIUBHVCkStTghz8RsHmCwyprZ1rehMkQIPAx1Zgttt5t2X8H54QJxNa+pqgI1MYq9ipo2Wf+8/vThpaWklwDwyj2WFznEIvgZF+FOzzfGoLI6KWFtUMrg3mlemdUb3AjNpVRtFyW4coQr3j62M0L2MgkzqLuOhMKoNvY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(6666004)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7qRhkDRIdStvFM8JnyFhh+EZXdu+dSZ+0Rn939Cn+frmAIBDCK9CqDkLUcTc?=
 =?us-ascii?Q?I7thPMwnRFd4c5QnQnTIqgeFTHt4Q7gMut77+0IywjjjVwkVbemUCRR4JYj2?=
 =?us-ascii?Q?AX8hfd/2iqWfW1pcAwOcSs/0tAfvI9knVami+L96vvcWQ30gu0fZYpz+m5IP?=
 =?us-ascii?Q?LnCyqTycLa2macq2zmIybwHaRG2ko8qhztBBsu36Y2V4L4Gbf26x3TMEZ6X1?=
 =?us-ascii?Q?mmjf7hvIihDjE8QOF2m5l8Gb5ZigxPRzmF+dH2nJNXetni25LysMUmvwVRRG?=
 =?us-ascii?Q?5zZPWLr2NZezpQ8NnnydXlUX4nbpOw7fT11v2FfwerDAXdwynTnf7LtGFtJ7?=
 =?us-ascii?Q?S1JCMLVs/apiP2TB7K5yrfpkdGTc3CmYm4fvAyZorlVWUPSL6EGg4yxYVx2U?=
 =?us-ascii?Q?Vyoc4PP96DeuJbE9UJYNQYwQW/V7rfxYxUTxHm2PU1lZ/o/TdgV3y9k4D7+K?=
 =?us-ascii?Q?/buzdFui1na4lc36jXk3qje3Y/JrD6LS2NyeSViGETA2KQLwT18lu92XZHfH?=
 =?us-ascii?Q?3RWN1ZopyoTZwJdJrAHl/ZKzMUEVPvAGE8A5TYQn/wYkPXZ0NR88MZQl4m1c?=
 =?us-ascii?Q?+VbJfp4CrpFu74mk6klPxj4SVcCMrtx+Hyl1Rt24zi63soB7MqReJig5B6eW?=
 =?us-ascii?Q?M2BSLeSOUDsLJJtNxqP6IRo6d/UZfKXFwRZ8Mhsg8kg3LSJXNQFKtqlmmd2m?=
 =?us-ascii?Q?3k2fI5DK4DT5I9muZuZp8Yoaj7KY4QxioFy5Y3HMavUF+67i1TiNzcS0XuQ/?=
 =?us-ascii?Q?g3b7yIKtNac012SuzLTkDK49XK19smdxHSAc7Vajo8lD+eehq2itEn6cJI6i?=
 =?us-ascii?Q?ZDZcC8htaJMvWVDegezfn10NISsdxcwOhXfKBLQvdoJyzIrzzOrtGZY6Qom3?=
 =?us-ascii?Q?3w+i2z+gvAba0qTPAUPL7EyQxbPBn8TfHuUJljSmOu0tjST4gIkD/PNmv87s?=
 =?us-ascii?Q?rCRvhky1XWSu2HVk/VfT5Se9Ej/CFyGDAJa3yGPX/+5IYCSQ7Y08e5+CRFiV?=
 =?us-ascii?Q?TJWNJg+yMne1+ZFre7CO2t8zJqOZz4ffO9EQZS3+3t728940nQsiRTij/vAS?=
 =?us-ascii?Q?bm13e8uzL83xJV5BcD7OORUZwDmGt7jHeqY3rqZhmfn5ty9gCnBbjbAc+mRI?=
 =?us-ascii?Q?cuQMCTHl2XactmS3gOvaGLPExV+VYiQQMvwn14brWtJoWi/rRn8i83LlbJKU?=
 =?us-ascii?Q?fsnWzRuK8l1WlXeB2OaPUqKMA1rVDZP/TCa6UfzRoTfipb6NzPAXQHuLqWdc?=
 =?us-ascii?Q?C5LqtImVK+hTC+3Y+ydl/r6Eu0fk8oB5SRFteMR8Gw8z+Ik7VaYk36rnaRdZ?=
 =?us-ascii?Q?cR3g+2Xh55XVJ4g4JfikojgiVe+r6jn72cS5ELFAC1VKWOY4II+eTU6xg2hB?=
 =?us-ascii?Q?sIevXshm+24a5iDyE52CjvN4afj6i+KK2CrC70es7Bcn3PwGiQN98qE+HbJI?=
 =?us-ascii?Q?8FaKf/2TWD5tOoYL/LJ1jD1ohd5x9D2OpDtnjsMxMi/EZcb8JTWMsGfLTtGV?=
 =?us-ascii?Q?4qOg4fc+Mkh9OIHNHxvEEGvt7XbPFiHIagiOTMQ89mc2RFCx/8AY27NgN+v4?=
 =?us-ascii?Q?ewLNTCfoz+qHMxLWhzHXCw4k2AtJVQCU5nfLwFkD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f31ee3-cb7c-49bd-9b2d-08dba1f7dec8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:36:57.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gTYBWsRrzZzWO5IJkFkXoF1zo9RgXyAzc1gLJkSQHVbDaYSx3YW2DyhrppuJnHL/oC6NY4fSonTna+RG5rFKQ==
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
index ba3cd2a3e339..945d46a76995 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -538,6 +539,34 @@ static const struct mipi_dsi_host_ops dw_mipi_dsi_host_ops = {
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
@@ -1006,6 +1035,7 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = dw_mipi_dsi_bridge_atomic_get_input_bus_fmts,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable	= dw_mipi_dsi_bridge_atomic_pre_enable,
 	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
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

