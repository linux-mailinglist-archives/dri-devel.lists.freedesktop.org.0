Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F95755B45
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68CF10E1D5;
	Mon, 17 Jul 2023 06:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089B10E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4pTYKb0X+lbI46hmPIDoG69tLGjqnQ1LaIVJuxZvIhSqO79W09Y6OnbLuY9+qnqIdtURpxsYkfQ+iFdMHIRL4cvOxmpRyV5lgh2BUkIcuEG4c2TsyzMIa14ajXajVhoLri/etPiym2mhOMt6fITbcgxhuR8IR536bOUqsnuumLmkUKS4FNju+ynTF3jveYQghFM8SdCKWvM9Uz77wAJIl/YJwtDQ2pWkXRKOSy/4mqjX/crydzbRYySTrbMKxIIRFXQMN+A5qKFkwEmkq/2iOpkuKLDNQVc+SJl+3shiJD8ng4plUrdkuf9yAiPD1EejCc/UfM2Ksfb62N8Pl6sBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvGx1zP/4y+/bB06DgRXuFtbQfWbA3mwbaUtO4739p8=;
 b=XwGvjhiJtp8fetpn0ZTvS+oA7PcpNUG52SYR1AHD8SpAduLRjwOqJ9u8FLkM5e3mkDuWx74GJPvdaB5Lc1rTvhMSaE8q5e2BMy2wqsMAGySQd5By0rQ80evG0QlvTm+uoCL+1T/UVX/um1tE1iNgqxO7urNDOGTjdpUnDcdY6j3qaDRxc+PW+X40hTHem7sTIUbygvRttLZMETdZrU5P/rqqvU9Ej5RM792Awhcfd4wcq74XxMPrjub59n+TgmbgyMpO3ZMd6IWQpZ4HBIXae3lD2mpdX26RpMHZO/Xw3nTegBc2g/vJ2NhuTpYBw7Q34Yj++BXK9T2Im4WyWS+8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvGx1zP/4y+/bB06DgRXuFtbQfWbA3mwbaUtO4739p8=;
 b=FJa/U/KABxm2UtFUNyGjq+w8eX3hm5d33qrvTGxQEJeEip4ldJ/iZEe1POJMwtv+6MJjYJ6HG4BUWZo7GLm1Ou2tCPIRb1cJa8ZzpvzTA2Xw25HF2LqhQwkyTcphSMKfrkzuVyU6JfHSeXd08tP3IzIigGGg5EORxsF1fcnPNm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:13:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:13:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/9] drm/bridge: synopsys: dw-mipi-dsi: Add input bus format
 negotiation support
Date: Mon, 17 Jul 2023 14:18:24 +0800
Message-Id: <20230717061831.1826878-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f9e7b7-474a-40da-1ab3-08db868d0240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slSKFMAIoc2mYlycEzaf5i4gWP2oQYJBscRfQLPRBas2ji7BZwuKeUaSI6zFNyhb/AT1JJIusoQ8Omub+6mYo1vN6Z8iug4uY5/c6edZlrvB61MROW3UWxY/og4wo9BaqpsF0KGGBRJ7iuNJp4xPqjtIbcZ61JSnLJ02UXzCTo+0WXr9kiShHDjN4PhH1m3v6kNP6TVBbvmei1V0PFPAyVetL2/Hgpoqf4Hk4cxDwptpYtDw7BOMpx/Hdxq5p5bs89b/a3ZL5PAJ6PthoZJb8jNQFbkG+J38yerrH/4QBVz1X6DhQcXuwvteLjEWMQAV+U0Jxw+1hsqPhW8AbhfOeAakui2C1lxGQqGISVLH7WiNFMh19ltmYwzI+YoSs2ArtNV38lmPn+jOMLKKhC80N9osPQXiQ8mX0GNZ4EG0uHN3EFxFg2EIdSn/Akge9+3CLQE3fB0+c9Rksr4oDjBj8UnpLviXEtHYUoVsLVLHtWt0/qWUthfr6TNktXOoNNJctZSi/W7eyBLkJ76fKx1Fy9SITxkYwDlHIdxhT3T+/iGkhwrpi8UzxmpCYcYwaGQg9l9bAuShS9lsJX0jRQahDYka1vcEJ2ItOgQcTDVfQKGacQShLJMlSTbWEMZIBC/G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4jQZuGqBn2SDhh9wDOYghyMpyKNq1J639Vbbh3PadiKKtcToZjim+HdN/lFe?=
 =?us-ascii?Q?XAaqP5o7poaflm3y/ILzcUAhj29pKAAxjDzgxH7b3AJX8AxL2C2mGTxAeLeG?=
 =?us-ascii?Q?IaxR8sCwToO4aboPZ5n2WFnCcX+0iRCiG7CRF5EFqYPjX05t3IDBPq6mziZv?=
 =?us-ascii?Q?eh9GExCImbof4o84+TJPt62FpeoAAQ4gtFetFD7SXsm4U7B/b2W+6gxwHejt?=
 =?us-ascii?Q?glRx3dCom6/drnNRJ3iW7Jf8vtz3brJt39nEDwAth224PVflCQZhMyITmdRK?=
 =?us-ascii?Q?O85lmYWQB/7hBud0ozpXELNl5x1oqky+xHEh2UCKhqXyn/1EVsger51QbvuU?=
 =?us-ascii?Q?Ij/iXKuMdzUStNCGt86O3qhBBWaerBqgIfLo9nHJ43nMzfaC9JqDOu6eb7FJ?=
 =?us-ascii?Q?b1wcDTx9KAFtU01fNrPIdjP+hJejqSuPJrEWTDlSpOuUmm8o32L6l2CrnAfl?=
 =?us-ascii?Q?T0QU90DYK/kQCBp0rUJLN9bZ04+3LIslJdpmRwDfpd3xw/VQ74pW/VygR+eC?=
 =?us-ascii?Q?lQp2b/dC5sq9r+Gpt9O6azbcQYguEbwdFaDEmMZs59l8xc917Qk2nCFNwbIu?=
 =?us-ascii?Q?psZ+ljeyycszf8tN8rd5CHcaHSoH8H/GAXIAgdFT343NsUksDOSbTHcCkuRL?=
 =?us-ascii?Q?YoLrd1b0hDwPbtFrbgdLNN/twDWEXWmKkHovdKirulNnuJtdDTgUrSKqNHeZ?=
 =?us-ascii?Q?0c+Uhuf3EaCNBrZx8AMQuQ//2nQUb118Me4oWoZLRbGOWOqAqFyJC2Ci7DlQ?=
 =?us-ascii?Q?2/TenvIeJcSudsoQy39L39NuxroE15kSxxLbHCz77YekzArESEmn/LbLqLK5?=
 =?us-ascii?Q?6X67xLVgGqVukeCO2b9hqYeFgKkqQZVyanNg7FlVAvOQl4NOxo3lkPo3aPlh?=
 =?us-ascii?Q?rHxkAiGoTyxGJ07sqpJLnLzyQl9v6NhLQGkLM6dOQ8IKJ2L/z7wDGsjYN6l6?=
 =?us-ascii?Q?m6+F5i3U7WwfdZ5bvZPHHZ0itt+NwS5iNoniTA/LlCa/YReIhqz2CD7Xx2DJ?=
 =?us-ascii?Q?Dnx9zcQWOssu5M+aIFAwnpo4GtXsSfKUX2ASYoelnUAbMJT+eL3/MdM/sief?=
 =?us-ascii?Q?h8ZVGMQqJbFvKGHRseFFtlutZH5i9hi/2TGMv/bPb+08g9MQwDj3FDRlFQcc?=
 =?us-ascii?Q?J8u41mqVt1MN/z6YJjSmepx+NmJMVilg2ptSq+9Pt1Z2cQTN4FKOCxjfDpbp?=
 =?us-ascii?Q?I53+3D5h8HvVoYMJeK8Y3t0ug1rxfxO4b68M6dW70uGJmp93//J6WB6qpU28?=
 =?us-ascii?Q?X4CM8mnUxQbj3fVM7+pzCMPJW59kmhfTQEp7ERLX64uXZz/CNWhnel60uUTO?=
 =?us-ascii?Q?VBjgr4cUhVaG8+PAXJvSSuscQAspza+vdae7bqeWLtUXhE3CCc8w1cyvcYM7?=
 =?us-ascii?Q?nOzY9pP2WCfz18g+ah/gnw/NNhh1od2NpEyuWNwc1ELxZ/WZfo2pD7ItEb0b?=
 =?us-ascii?Q?zIIS9ccOOetB6wayQ6BD9cHy1B3BWaBzrZtobYmtwr1BxmHDTu6D2jCtiK0d?=
 =?us-ascii?Q?N2rRFo+U19Vqp13cESfGZ91ZsgpTzH9SZygMoIq0gq6fWy26wna7zhQ36yUK?=
 =?us-ascii?Q?zXxqivgk3FuIkZzHsOzEs4HGvEV7WQMUUbFiP/he?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f9e7b7-474a-40da-1ab3-08db868d0240
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:13:59.0949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNKSqUkA5SR4u1V/Tl5s7hKVr0FiNbnVUztPoxs8htqsA63c51eZHBOjGYL9u/y2HXFuPv91O8BgNN4+HLuRFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
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

