Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB09B22DD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA389B01;
	Mon, 28 Oct 2024 02:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CLxiW5tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8F310E318
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaxlzsChkBjLbXnJuquEo8avMtFLXibPcVjwPydY7wNItqJKsgKk4eq01yvG0kFVVXwbbaxHXFhFoQ9ncZA5hIoGnGMH+FLuFCs8Nl8Wl+XYWjioV6UGksUZMFVDvwmpF8wIYgIMw8UtJ1fyPPXAe6rrcIZKVeEpiKIEs9WIlRM1QPJ+N4pXhuxn38dXQS7MbG2XBBQL2g+2lnr7uTtDR5A/0CMQdQke97aXN7eGQ6zGFbVYvENlgI3sJOOCVma0yKsf7q/64cVmnMZpqdhXJt9MQKFYT156lQadmcSghYylncG7PTIS5b9cjf77Xt3zDphATwg/vcd0YdSer8pRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yLZRLw4FnE8Zv26lfSLgELbjXxmALHeRVy0E7hJNX0=;
 b=jnLpj6aXYXSx/iGAZBeUnfdK5CagnpfymKGws7SbglMsfXjxhDB3moH+RDs8IkNBiNnZ74yDHnwmOP+yLwFiNjLf3bzelMWhWB+68CtzsRcQeOQw7B5YqhkPHEbtlY6tl3Ci4eQ8lSBTYvO15kSfSPOTxMVsy863pHBh5mc1amRVCIveZtr/5d1bc2rD40s+QW6GMXzFf3zgN9FqGrykexTqVjoKc8ATIcFxaj8DK64sr0e5AJFk7D7spcDxc0Yp8nwXJzgYYGjkeesC9AijbKfps1MsrJrYYp+3n3AVHHo5cGqjWNk0rZSRA43eRjsIayarZz+5qhlzkKNoViNvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yLZRLw4FnE8Zv26lfSLgELbjXxmALHeRVy0E7hJNX0=;
 b=CLxiW5tw3LfZQISna1h4Owa97327nGyGyHc0O6TXhkuyyhVjO0SyGGYF5qIMSgIlmTQWwylk2qwRwYsitbGFI6QJAVKTwwDx0kVcfnDbk3Y9GGrOHFmMA8jfuDWUJSHpsTBSsqolPKEqHA3fJwdOtVhhGCYjTCNCHA11knB0TN/zvVGfg0P4eiV9lYiuNrbGNbG8jblpCHmHUrdRdBVgKmGx+BIjyKQWPQNq2BEcpXEEiLp4fxly+SL/mqC79a1QEv3pddznzpGNIYiRLRVqqmwNTybSnwMKrlpw8dLzXY116KClRHayS5FhhUdZyOrw3+VXkZbvXtM9WbuvjV5k0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:38:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:38:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 06/13] drm: of: Add
 drm_of_lvds_get_dual_link_pixel_order_sink()
Date: Mon, 28 Oct 2024 10:37:33 +0800
Message-Id: <20241028023740.19732-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 14787fdc-05bf-4596-72a1-08dcf6f9a7de
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TyLhFT0PD1P3aimuJ6AZ7YUertE+lqpACczFFY/BuYibTIk+Zmg2LvnNXef8?=
 =?us-ascii?Q?cSjZ0WXQKxCNd2tr2dniK3nlLC/fRbjtqvNIZ/BbenyW6SW2G2o8bUGObDNu?=
 =?us-ascii?Q?TOpxvQsRWfy375PXS5SzFN/UII0B1OMlIOfc+zrNSpPHGje9QvlOuEGNoa1b?=
 =?us-ascii?Q?azRPTDAsvElsl5nnb3uEKh6+TWCUBFCuNRAgXxbe5NhGvNKh4sm12up3Yj8C?=
 =?us-ascii?Q?/oYB7rZaLwEWs3uirQJFZeYFW/XP9G66Q8p1LOwlTIhFHH475GJU0gcyUeTc?=
 =?us-ascii?Q?QKNyjuedQOZK+YJy8Fc54gaaPkSZT0I/Sj9+xTzmhPQ91rcIbU9Rr4raEkoy?=
 =?us-ascii?Q?eZSU/2VfbxAz1tbrd67M9RVrTIO9X9wd0A09aAAXa+ELaely7EqEG+wgbONX?=
 =?us-ascii?Q?/m7BJBgTsHzEUqsq+1NEDsPaktiD9z7f+lQ+MGOB4guLGv5lCLQm9SBED/j9?=
 =?us-ascii?Q?jYIXBgx7b5Qj7FxFu9tvhWRNhcsLjLm4F3qGMil7QnVHCkFmpbEIVOjk/VnT?=
 =?us-ascii?Q?y3hF3Go26t0QIryKqaeqGyrQtkF4YezXQN38Y1ewm4KRrArwXqt5rPWL3IrH?=
 =?us-ascii?Q?Lj1mhhT2Hp9I7dJk+b4istOMY9BePY+xRf4jSvSYxkhwx/c7Bi54IlKhzqEP?=
 =?us-ascii?Q?P2qlZbhg4KTAb+ATNaYhgdng5yD7y03+JkHTltfeLUYUIP0Gp/TbhhtF92qF?=
 =?us-ascii?Q?ckSd6RS05c78fvHeWwN1mBR0+iUxLA43W3ftCVsx+G90WtMA+5fDUNaQjCyS?=
 =?us-ascii?Q?VeuHlixsmShn0ynr+gARWpadH76ndAfQq+LHyk+vL3bfiSY/lCiQ4iy7RtRD?=
 =?us-ascii?Q?zmat5QHurGAi6UPA5xG0z7EIi+u4tQlfOp/DLHM/clbDksv3zjItaR3iLkIu?=
 =?us-ascii?Q?PnzQmBhG1jgDVtiRXkfoCWucxYgIF76wrWY75Yo7NGRlINdL7mEw4PNiESUi?=
 =?us-ascii?Q?z9rp3SGmDrE+VVg46gN6lWSxoauCHJXpaZMfdGFEnncBrjDkBcWj6zQ5b8Cx?=
 =?us-ascii?Q?n85Qjy596MmuCX1BPeuIkLZ9IRP/2VkyJirNJvC8Ui7PXtaqsnAHys9ky6zw?=
 =?us-ascii?Q?wzopJtsW/8FR7kBKvHhl2L03sYgVezT5x4p7QWpDp6imxFWbvvB81Q3MWsyi?=
 =?us-ascii?Q?DBEt7xWIuuwSOwcmvx9cHJmHIK36Lurwqb1991XuQO76EjbHl5H5yKOqVCZb?=
 =?us-ascii?Q?jO42RRbL9wXm5xVIWYlkilGFwL2RpOOqCXvtkrLpRZe46Bs3N0RO2PElsFgC?=
 =?us-ascii?Q?yHfzGHLCT9menAc32MjVXyxn4SLGpVp1YCbbNwI2mUjXQXcnVBJyn5Hne/YP?=
 =?us-ascii?Q?AW9lVG//XH2wRqSWRwKnYdag3U5jj5DhXFFa7/dKVKOKzerT4eC5m8ZTLh32?=
 =?us-ascii?Q?f4G5Qg4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sNrer2qlaJMrwUV19CjpgzWxpB/9qntI2PBxgTb3AsmtoXbl0euZU9JR93iI?=
 =?us-ascii?Q?fZEdXLNFL5q4gXiHQ0rjucPUCKuF9kPS25N1E39PNd7XiocMVXzNIdR7B4gB?=
 =?us-ascii?Q?3g9Pth3UhDNtxVfa1N8wjiJUMADzfjecVgFtD0F0l6GF5b3gM24iF9xl5AVO?=
 =?us-ascii?Q?Omk6vt0kXtdnofvouaTOxsBB5Z5jMm+Wk8YHcbxnhC97XqHJZRzPs3EvJV9u?=
 =?us-ascii?Q?qOvmYUBTJM5gKsm1jNJifKSvRJxnGpi+E1EJrDsIiMjAy4nMMBaQuRW28JaU?=
 =?us-ascii?Q?zAGZ2Dx742r1Cdhh0OOeAJ8EaeeQjQVvWkLCcUl7ThUo0PS98dwgLcaL5i0x?=
 =?us-ascii?Q?P4+MNOTRUqzYJdEmSl3Bs6/qnP6ML0SADJJGeJDzIbz2uZp2XdjN/kBLkVVu?=
 =?us-ascii?Q?7qhSatKmRl4jUnu4XFFH0W4/QkOjvKeFzatNdzXrDtr5Bgdy4idzPiizzyUX?=
 =?us-ascii?Q?YLZfwLfyYwEXMf7WvTvjKPTyJys7C5E066h1rPUtiiGdLqETLYBTOqO83hro?=
 =?us-ascii?Q?DJ1Ku3jcLdc9cKA/j6VHY0EguXo65efVJXs0CBSJMb5SIQZqxAydFB5uaY71?=
 =?us-ascii?Q?0MZ675A1ofb4koL9yLxw7yGS4N0IcnB8RMaghr3bwPUN7ssuas99UXQN9RbR?=
 =?us-ascii?Q?BUpNn0WXajDRSZj9cUf83U6oqO4D9aODoZmElprNXoK5bAh5lcw4xJJdPYDZ?=
 =?us-ascii?Q?jkkfpxsxPM+2JSvXv9H4Piue3EWe8yhykrOwUb4GycNVPjGBOFYLlLzM8Bs5?=
 =?us-ascii?Q?XNCQULEMnMMTD1r+danVYCXW+O6Vg8BmEJfTAjvMQrjWvY2JZMwZVoDmqmpx?=
 =?us-ascii?Q?CnhtujVYYdZVaIfE1RA8gtPwWyHTdetQPqhvRu5Ze4PceEB74KQDAreNyxnD?=
 =?us-ascii?Q?zSqKuC60Z4J+IXfSbKZiJWRMuHD88th57WIafFIoKoe6fN/F8ZCpEwBPmZ9A?=
 =?us-ascii?Q?sk+MEb4JjHawSS/0MiySBrk0U2HhULRtk3ixU/9sv1IjXyBEmRfOKNhvr65q?=
 =?us-ascii?Q?f9/tTOvMjHNb5REtaIgDC05XbdfFyzOtxEQ7FOQrWSTHd+U5Ysv9meUdBEmz?=
 =?us-ascii?Q?l398iLsFN8mAotq4j8kXEdgndHaQ5gtzuDizG6ig5o4rkXxpMI+TePWLZ8dH?=
 =?us-ascii?Q?mHm+S5mTe8TsL5CAI7cNKeytT+DlWT8MmpUnOM9onZbC0bY4XiIfJYqCcERa?=
 =?us-ascii?Q?eGs9qyJmHUIX/+ceufGrQw8+dtZsnfZLCqacflqfWD4b46PerXAZgiJywMZd?=
 =?us-ascii?Q?6AMBpNrQvvmScEKncIdDgws2nZ26oEY99DrxLT/m7Wd0tVDiFVit4qQ26+Ak?=
 =?us-ascii?Q?TDCEmF56qSEnXIrlP8CPj+OFyUMWn1XzW2oMUC7kV0kHI9O0T8pK5pBXiGtH?=
 =?us-ascii?Q?W1CpPPUD3rFP/B6LCjzRfsc0qPEAimML1i23V+sI6g1uH3m6zIq/B2oKY25F?=
 =?us-ascii?Q?BDf8Gbx86n0tLRO6iRH9TidFa4A2DhUtwppoT/xHjsruC+kTOiMaVcYApPZg?=
 =?us-ascii?Q?dPDqrQSCqtiG92JAcnr/ohZv1ci7Qp1OtBUhu48zLDpmaVz9+rI0jTOPB98e?=
 =?us-ascii?Q?5tvbEpeHjjxExilyhBrLD6MZeUmuEo472b6FfV1F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14787fdc-05bf-4596-72a1-08dcf6f9a7de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:38:50.5888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gv0Baqi4ozFq52r7Bnb2Kw9UUZRNj8CR1uMTmEmwPcS1fvYaLUa6GX9/i6WfBfV1665GpNPYzueomWZ62xk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_of_lvds_get_dual_link_pixel_order() gets LVDS dual-link source pixel
order.  Similar to it, add it's counterpart function
drm_of_lvds_get_dual_link_pixel_order_sink() to get LVDS dual-link sink
pixel order.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v4:
* Collect Dmitry's R-b tag.

v3:
* New patch.  (Dmitry)

 drivers/gpu/drm/drm_of.c | 76 ++++++++++++++++++++++++++++++++++------
 include/drm/drm_of.h     |  9 +++++
 2 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 89863a35c731..5c2abc9eca9c 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -341,8 +341,23 @@ static int drm_of_lvds_get_remote_pixels_type(
 	return pixels_type;
 }
 
+static int __drm_of_lvds_get_dual_link_pixel_order(int p1_pt, int p2_pt)
+{
+	/*
+	 * A valid dual-lVDS bus is found when one port is marked with
+	 * "dual-lvds-even-pixels", and the other port is marked with
+	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
+	 */
+	if (p1_pt + p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+		return -EINVAL;
+
+	return p1_pt == DRM_OF_LVDS_EVEN ?
+		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
+		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+}
+
 /**
- * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
+ * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link source pixel order
  * @port1: First DT port node of the Dual-link LVDS source
  * @port2: Second DT port node of the Dual-link LVDS source
  *
@@ -387,19 +402,58 @@ int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 	if (remote_p2_pt < 0)
 		return remote_p2_pt;
 
-	/*
-	 * A valid dual-lVDS bus is found when one remote port is marked with
-	 * "dual-lvds-even-pixels", and the other remote port is marked with
-	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
-	 */
-	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+	return __drm_of_lvds_get_dual_link_pixel_order(remote_p1_pt, remote_p2_pt);
+}
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+
+/**
+ * drm_of_lvds_get_dual_link_pixel_order_sink - Get LVDS dual-link sink pixel order
+ * @port1: First DT port node of the Dual-link LVDS sink
+ * @port2: Second DT port node of the Dual-link LVDS sink
+ *
+ * An LVDS dual-link connection is made of two links, with even pixels
+ * transitting on one link, and odd pixels on the other link. This function
+ * returns, for two ports of an LVDS dual-link sink, which port shall transmit
+ * the even and odd pixels, based on the requirements of the sink.
+ *
+ * The pixel order is determined from the dual-lvds-even-pixels and
+ * dual-lvds-odd-pixels properties in the sink's DT port nodes. If those
+ * properties are not present, or if their usage is not valid, this function
+ * returns -EINVAL.
+ *
+ * If either port is not connected, this function returns -EPIPE.
+ *
+ * @port1 and @port2 are typically DT sibling nodes, but may have different
+ * parents when, for instance, two separate LVDS decoders receive the even and
+ * odd pixels.
+ *
+ * Return:
+ * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 receives even pixels and @port2
+ *   receives odd pixels
+ * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @port1 receives odd pixels and @port2
+ *   receives even pixels
+ * * -EINVAL - @port1 or @port2 are NULL
+ * * -EPIPE - when @port1 or @port2 are not connected
+ */
+int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					       struct device_node *port2)
+{
+	int sink_p1_pt, sink_p2_pt;
+
+	if (!port1 || !port2)
 		return -EINVAL;
 
-	return remote_p1_pt == DRM_OF_LVDS_EVEN ?
-		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
-		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+	sink_p1_pt = drm_of_lvds_get_port_pixels_type(port1);
+	if (!sink_p1_pt)
+		return -EPIPE;
+
+	sink_p2_pt = drm_of_lvds_get_port_pixels_type(port2);
+	if (!sink_p2_pt)
+		return -EPIPE;
+
+	return __drm_of_lvds_get_dual_link_pixel_order(sink_p1_pt, sink_p2_pt);
 }
-EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order_sink);
 
 /**
  * drm_of_lvds_get_data_mapping - Get LVDS data mapping
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 02d1cdd7f798..7f0256dae3f1 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -52,6 +52,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
+int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					       struct device_node *port2);
 int drm_of_lvds_get_data_mapping(const struct device_node *port);
 int drm_of_get_data_lanes_count(const struct device_node *endpoint,
 				const unsigned int min, const unsigned int max);
@@ -109,6 +111,13 @@ drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					   struct device_node *port2)
+{
+	return -EINVAL;
+}
+
 static inline int
 drm_of_lvds_get_data_mapping(const struct device_node *port)
 {
-- 
2.34.1

