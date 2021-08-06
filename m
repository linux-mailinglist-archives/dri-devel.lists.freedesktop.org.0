Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB73E2763
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 11:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724F76EB07;
	Fri,  6 Aug 2021 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2118.outbound.protection.outlook.com [40.107.96.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FF66EB07
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6s+P+pztLyESNSE6p1yXQA6ha2WUydcg0MzOrclUyy54991+NeqPDA0Jhf/pfjzeKHhJJ7nzdV5fgrmqVcPiivO5Uy+KhFsJ09292Zh7txOF3ahATFqNwNH05yD6xb9hMPcqEiKg6H5JLMAIb/Tn/GvDZ1jUzt5iN32V5NHdOofRRB3xtx5ghf9SX5+MJSjx997MdPqsBckHqTJg3e1yRyUk4pSm7MpJhs0LRBpdNGP1qmt+26oOZs4oKP5VOPB0UJwDQ54d0nKICpPPTdwqrjB2LtGsMghBY5L1xyLTW4UZpIQIE+DVXSI4HwiVgP6AeC7lCtB2B3qKsX45VM0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WheNvOQb7m5Nb2xbnVsY1/4nzMe7gWxmw7EIWbYnNb0=;
 b=fV/y3JndkAlDb0/AUDrE1eLGvv3tnd1MMmmr5U2g51npXsZM9s+8vvUB1SW3TiA9WYHMuh2UnX2VhVh1bNDdBT3AmbPAs2XoZ5KZ0vw/PiyhI2A1g3WKV3HTYilWgibmAjyjOKd2tPqqpzM7a5VOknAZ1ok17wSK3MkwPspoljyHv9PY1lIoCj0lqkz9W5s4pq4j1Da3vtRo8DCbhXiuquqCaBlRsMoUOPpPaYdDcmt7n+0P74N86suh41dWBbNCVQMT1HgXSlgEFHZ8lK3r1VJ0w0FXwXgt7SOOZsEuBK1g1rNtdPzyboQXtTX4Km2Oeb3jaVsyfbT35ilL6TzyLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WheNvOQb7m5Nb2xbnVsY1/4nzMe7gWxmw7EIWbYnNb0=;
 b=RoJE96kQ3r1Zh9XkRsDwwmZ0NOa47g3jmImYw4rYv9fnvC+wBJyIj+Vhr3s7XZHPB/c0ByqzpMbuCGjrdU3lb3U9ZZfJNoJvlPuXNithxNq6wyohB2KfExdxH+uxCOlQJQ793QbdXoWor2gkD0FOWTi0M51hhrPo/ZJu4PbsvPk=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6786.namprd04.prod.outlook.com (2603:10b6:a03:221::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 09:35:42 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 09:35:42 +0000
Date: Fri, 6 Aug 2021 17:35:35 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Torsten Duwe <duwe@lst.de>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v2 1/1] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <a02c0a414bd3d0f67bf7d77c10415196743f1c0d.1628242192.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HK2PR02CA0188.apcprd02.prod.outlook.com
 (2603:1096:201:21::24) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0188.apcprd02.prod.outlook.com (2603:1096:201:21::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 09:35:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d56317-af2e-4b2d-cf9a-08d958bd8efc
X-MS-TrafficTypeDiagnostic: BY5PR04MB6786:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB67867E1C7298EA2F3A053E18C7F39@BY5PR04MB6786.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /K6LtZmzncsk7LwOuVoRKfzP2EzdiZqo69oZbt1RipJ3yVODYsOFB2PRwNseYgHokKAbkK1fguwwdqPgyu5ZfeeRXLTBHkBFCiMylPlkxzsQvJ2H+o5+lWoqmpsxIbJj7SQAPPE6AYxbsXV0bmFKj5dgWFuKDMQU2aiwZJ0Y4Eia4+KsbE5v+tfqrbaffFOty1Zk7Lak71cHuM2bLiaMFsGHNV/yUz8D7CpM8MfGiOWKyyq52Lhy6EFvAWmSoVu2CZUaW68eI1UFEiWDWNrQBA5JUESi0jFuWWVNT0+M47O8f2uMT5G+WHDMaJdp3UEpPZe6VY4HMnjVGnvWEDWAnXM/nZLD9mj8SIhqFd9yCeb19Rafcoig3BAYvBKpknYADXWRCCclqvHXctMldHjS35sT8nW7bytcF/CLkkB9BY2ARYAWr6mOBp3SwWzYSP1cfWCkixgzM+wqhUNMIrjKy1egci4PN4iasdfKT4+lWqmo1hfJo8CKcPAY1YV9u1bsrBcfmxl7sRtvOjbcvn1cukz5qonVcG7nKjHNPI6pxlVwpkOwsyMAmxEBoJ8ckRyBz9HauCSzWi/GFQ6GQR66id6S2PqJRSWNcoDyFoRDUzn4jQgWfUl6SoyJsVjeVs5VC5Kkg5+nXQ/DEk0TZ0T6MH4DqKbz4VrFvNbPhkwdPNYnUZzOx+Rs3Nw6SJEnfYBl9LtH/dQwS6ZmXBzKEIamDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39840400004)(346002)(136003)(396003)(86362001)(6666004)(38350700002)(38100700002)(36756003)(83380400001)(52116002)(6496006)(478600001)(26005)(66556008)(186003)(66476007)(55236004)(66946007)(8936002)(8676002)(2906002)(7416002)(6486002)(5660300002)(4326008)(316002)(54906003)(110136005)(2616005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8xypd/H1zSnt74K/9LdeZ7du+qL0zgO1gzNLT6o2utdQ6LeIxI/BVddCyieG?=
 =?us-ascii?Q?zf1uQgeAB7k8CwRoWU/mrLT3eg+7sWp37CCR1Z24hQRDZFXtORFy1zj4X55W?=
 =?us-ascii?Q?qu7abHVFyafOHsbHsqp9M6zFxfqyCnzqj2KY7sNvfYV84c/S0znQRv4aPBgL?=
 =?us-ascii?Q?6YxraVFbczJzO3vOOpRm/YJyWs0dUkyWIIA3VJIbctEgUYcXIdFQw+Co4M89?=
 =?us-ascii?Q?zHq6WsmblLvtUqKO4U49PuzUQFqae0aqIi9ZfOlXdYSPriXMswtLjf7BSV7v?=
 =?us-ascii?Q?4f48aGRFJL0cfsxbZii5rF76Afvjy9LwOwi2gd3+zZgOXKE4svMcwm8hY8VQ?=
 =?us-ascii?Q?4XeHEa1T/WLXXqdEp5wP3oakR2I3t0QEo//0Z7cboSN3vYhbUffHgicAMWQV?=
 =?us-ascii?Q?Qejhpm8sggCknFYtmP0omvqFonV9gjVl36dc3Hu4TTPfykqUlCt0MRqomAMI?=
 =?us-ascii?Q?fWsSqkpI0oGLTBZFR3jpDbcJ2C8XLFACJtgv4pKmKvu+rZOEJRD/hbMZ+/fq?=
 =?us-ascii?Q?2IwvnNI8jThMbkzNHUHP5wA310oGo+89SzxehtiyKEjVrtNe7GW5tq8q8/Uh?=
 =?us-ascii?Q?DH1UphvoKnH4mf3V3Xv2oKdgncaxDEp69GgkBcLjh2aAxNV/WoDxRXF+tNP7?=
 =?us-ascii?Q?lMP55+uEHly1W0iwST7k751LaEpB3vebWvaUHJLWV0J/Lo1bGwCJPKxGbZmB?=
 =?us-ascii?Q?qe2FeQK8uAxlPgDDaTo+uIglktwI+FZoeKQIuW0x+I742pPAE1b9igIipHbM?=
 =?us-ascii?Q?Vppz6wmPF92u3BA+c+HEJpIpY98sp1y5oGaDWnaduzfCaCOkCMmc/8RqYGP7?=
 =?us-ascii?Q?7Ty4ds4ZUMQwnzkP8ZHtfVGmYcpG54z+3r12XLnMpXFTvnwzOkvfJrx+wN1r?=
 =?us-ascii?Q?sciTKIszOno040OtQsIiFbVeKmVy8GqHKO3UKf0bp8nKDeEbXWfp3gjASXMG?=
 =?us-ascii?Q?9uDTFShUFWnOyJVZJ4qiFs/0IJnjbp7hug51ZIa5t+cUoGHStsbUCeqIfAFR?=
 =?us-ascii?Q?/fqWIiAYQyeVIwNotELmHUcdzj0b+dEI4pv0IhV7M6iW2Cl8cW4ExhrMUHSC?=
 =?us-ascii?Q?oWZt6fOaeWgTw37DLojn575uSQMm/Sox2zNXj49Apcmr7r/LCBdG/icBOvja?=
 =?us-ascii?Q?WoRXFWr3nZ/rJ/fwFp3+z4qBlMvQ5t+YALRekwxUz+hakqhB2c6qQUWYDy1x?=
 =?us-ascii?Q?GMoqTEbfk0iy46Z6irMZBdJJLrifQ6ZVcjRdILHZwVbNwa1QRJgXGBEx+JJo?=
 =?us-ascii?Q?yHRVlUjg6+Gt888NpHlfrryyrVtA6E5m5uNgHwtzHCLZUK/XhB5UFXYVF0H9?=
 =?us-ascii?Q?pDBlgt0xBblEJZiaxvCnyQ3+?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d56317-af2e-4b2d-cf9a-08d958bd8efc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 09:35:42.3529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsgwJum1eaN4VPVP4PXPN6+Nv0alHpsFTaHWB632Kl/n1TUPBznyNWJDIXY2TKUi96oOGz9X6PVJdw/l2U7t/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6786
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

IVO panel require less input video clock variation than video clock
variation in DP CTS spec.

This patch decreases the K value of ANX7625 which will shrink eDP Tx
video clock variation to meet IVO panel's requirement.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 24 ++++++++++++++++++++---
 drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..9b9e3984dd38 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -384,6 +384,25 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
 	return ret;
 }
 
+/*
+ * The MIPI source video data exist large variation (e.g. 59Hz ~ 61Hz),
+ * anx7625 defined K ratio for matching MIPI input video clock and
+ * DP output video clock. Increase K value can match bigger video data
+ * variation. IVO panel has small variation than DP CTS spec, need
+ * decrease the K value.
+ */
+static int anx7625_set_k_value(struct anx7625_data *ctx)
+{
+	struct edid *edid = (struct edid *)ctx->slimport_edid_p.edid_raw_data;
+
+	if (edid->mfg_id[0] == IVO_MID0 && edid->mfg_id[1] == IVO_MID1)
+		return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+					 MIPI_DIGITAL_ADJ_1, 0x3B);
+
+	return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_DIGITAL_ADJ_1, 0x3D);
+}
+
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
@@ -470,9 +489,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 			MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
 			(n & 0xff));
-	/* Diff */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
-			MIPI_DIGITAL_ADJ_1, 0x3D);
+
+	anx7625_set_k_value(ctx);
 
 	ret |= anx7625_odfc_config(ctx, post_divider - 1);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 034c3840028f..6dcf64c703f9 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -210,7 +210,9 @@
 #define  MIPI_VIDEO_STABLE_CNT           0x0A
 
 #define  MIPI_LANE_CTRL_10               0x0F
-#define  MIPI_DIGITAL_ADJ_1   0x1B
+#define  MIPI_DIGITAL_ADJ_1     0x1B
+#define  IVO_MID0               0x26
+#define  IVO_MID1               0xCF
 
 #define  MIPI_PLL_M_NUM_23_16   0x1E
 #define  MIPI_PLL_M_NUM_15_8    0x1F
-- 
2.25.1

