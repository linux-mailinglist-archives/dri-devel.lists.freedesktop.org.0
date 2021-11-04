Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12409444DCA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 04:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553107B62B;
	Thu,  4 Nov 2021 03:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2123.outbound.protection.outlook.com [40.107.243.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089C47B62B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 03:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN910K1fjh7TFmHuQh2mG/2YTeqzj41k856MFGGe8xRVvk/3eHS5Dn0TWQKnPzHx6p7Lef5FnKLwNwxbF7L8tgWe9z/wVlWcdBkkhVR+pBNggoOeUJhIe4AERvuvw8oupbNPRBm35I7n5VF+lCwzYpk5+SvxLt6ej/I6Ir51MsyW0YSgottRuCb7MnM5WIqsfPJ2FhT+Fp5mrLhQEFHA5MI+/ol9UFNvd5QX7mW/qBMVcPm8b9JlW4RiYi63HH2uO9ws09BSeIDXIgm5yQBLUZlg+ImH/VPv3BK+6gLLn159bjxGLtugbHnIbp/R38mWOiaPt76OA7+5lbJXzbB44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI4I4PFL7ux2e5iZDFcxqC/7kGl6roMNNOYYfyEidu4=;
 b=SW5Q7ZyGJFxiyLMPenCQhEOrh3NlU/jYIoAuxyGBl8SvZXlNNQ89TGxH9OUDOQrvPFFddCs4UCH7QzQnNuEg2S2FOTmmlXBjJDKEWxxJVdzJx6Ug6pPpg7wJOVLBnTkDuCijekf87Im7Y+lqe9t+7FL6sR4raFNdt8V1EVkrAI6pm1XQR7OCxKLLNc47mko3Sb+Ni+zgVBpkwVLnbTMilqdlzsDtQPvDTMENs/69QzGcCnwU6cI75Gk3qa9HH49vYuIHGztxO8VTixHA/Q9HD+XVL+vyxSZWqtSqhQicF17lB5y/z9fvWt2oejvHuV0aeT59w5Tv9At4QCGNNaOjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI4I4PFL7ux2e5iZDFcxqC/7kGl6roMNNOYYfyEidu4=;
 b=gqfHvzobS2c8wbxRTUdbfKg3Alq28IuqUX/TD+PMzrbbzZsnhcN6Fg5CgiE0PteEIoco+mH5WkAAR0gdpov2LK6GqHC8mcrioDJfE71ZAgd4sHjEDVscsl1c2S/pVmZw5FxRfZkkp+ub8CGOfmLn8UZpT3pIiGtG2jEZgYFelvg=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5750.namprd04.prod.outlook.com (2603:10b6:a03:10a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 03:37:38 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 03:37:38 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Date: Thu,  4 Nov 2021 11:36:39 +0800
Message-Id: <20211104033639.2634502-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 03:37:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c99eafd-1051-4372-cad6-08d99f447305
X-MS-TrafficTypeDiagnostic: BYAPR04MB5750:
X-Microsoft-Antispam-PRVS: <BYAPR04MB5750AF0A4B55101CB92ED9FBC78D9@BYAPR04MB5750.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3beRjTdwAD5mGlPUdK/48h1qvEDmdoxDGyejDXyuly2BgpxVo/h5B/DalXk/6zIYP3nWyBWVfkvvBWEWbjX7StbUpe9MBpeQVALr9AAexaYq/BYScftPZMvz/lGoooRVmTHsePFQzWxTcnT++7P9lCKeX6xGHj9a0KXdrsmgK4We2jp55sfZOUvQ5VjKIrn2JCXaH+7wHVRl6SlgVHtpW+qoZ/8LJg3fKL95z/AghmajdhUQmf4XuvO/9raynY6cCRSU9E02EtTZVbBxG+t3+61JWQ4hMufjvqiFfE95LStZKBmlWxuNmryo33hPNgynOxh2/Ih5NE0EsWxI1hv6XuOMDmaT8W/WBtR+M0QB8I9UliIN7AanAXU+WNnvwPLViIlTu6quYDbon6+XipUm58IOoLn4iaubPUbSr4fcjJ1w4pAvORlH5ZbIM+IZKR+g5C2jNA/rlI0E9Dbjyq5iwPdO8rkljV7mDwXTKfltg3IVERBpHJJkhxTC0Gbdzh0T7F6D7/CUrrz+bGShyptsa8qPNTT0oG7C88jPKcyA8G2nx/X6LvblTlX5wRQyJz07DWTusDqCSJo8oZie9QJ7gQbpWAqAOKWNXJv/g8xMalNBOqQ+DTVD6KY5ktl+mnpn/KEM8tRCFqCUhK7cy2EkxtK/1cQOfhriMKKXz8XYX1a7iGoTviGqxdkW/kl1z0w4Zs62S4NjzhJjyNfIJVg1TKx70TS3gBoLAtd6pGNvVNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(921005)(38100700002)(316002)(6496006)(508600001)(26005)(8936002)(83380400001)(6636002)(52116002)(2906002)(6486002)(4326008)(1076003)(66946007)(38350700002)(66556008)(7416002)(107886003)(86362001)(956004)(5660300002)(36756003)(2616005)(66476007)(8676002)(55236004)(186003)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+tyR3/4lxxv/YwIrETHk6/bO78V7dBqaPTTVgAxHCfN/O5RUlliHaztbl4+?=
 =?us-ascii?Q?BKoSrNs3tNH9HmiWF1NShhgtakJ9Y3AJsGpNN5rUruRx66wkKmjOtiNx6kOK?=
 =?us-ascii?Q?11vkFdhdPERhFgsWdx+8tBJn0o8S6iV6cJGqYFldUbz3NqMqjUsZxeLzmsUg?=
 =?us-ascii?Q?Q5PDiCSrKG9uhz/VmEXNBqgZBcH7yerfxewo+bhvD1T4hCtteiKNqIqHBofQ?=
 =?us-ascii?Q?kqGIKf3cdJfqvIDJyV4botJc1XSHE2fVoFT6kdw/E2kBQiEMdElZCJcMORL/?=
 =?us-ascii?Q?Ce2gBEx/zBbX5I8HZ4Bm+0Jk0oCi1iM4W/RwOv/4o8jR398LuvM4ASOLeXow?=
 =?us-ascii?Q?NS3FHAGVToDXmWgJwLXrz1/Jsnf0S4ywD0BHhY/LsPJ/ztyvvcmsT3mhCZpO?=
 =?us-ascii?Q?ZOEH8S5tOGbS4aYzzFAp/e1x+MQcEh8RctcqP2nnseeg9JM7Cg8WKnalYEFp?=
 =?us-ascii?Q?0XYGBluvHEWyE+UG/w0vqfEP44ynbRuo/QPSO5YlzJRTeXZiYTWIOwBMR9aY?=
 =?us-ascii?Q?7BmshFC04OMIewwra0vDxMu9FllAjEeQxRvQrNGDpUM2BE+uByun5xg6VkXS?=
 =?us-ascii?Q?O1Ek81+2PaUJXEbuzkGE7PH8/YJtjqK5n5Mnww0Ojy9dx8F1CccDnVirV8tP?=
 =?us-ascii?Q?YZT8YlM2lyFhP57cKr455dEVDXos2WoIOVuOTdy+1OUVKx2p2AdkbSIUdGFW?=
 =?us-ascii?Q?Kn0NYxQVUYgcZ6xsk5CGQe/MCV9alLAL36cEVtgPAMEq5AZU5x5Wg8xT50Ze?=
 =?us-ascii?Q?ln6R57+y1UO2MPR+3TPty9gnn2SEEYcz+0GtEb3zLOOIMlPe7bQJyOgjQC+w?=
 =?us-ascii?Q?PI7WVq1NqgeauRhHA0luWJqmZyHSel6FjdeeyOHvflnRVh23vDZfZlIhIDS2?=
 =?us-ascii?Q?EJZ1Qdq44TtKbajfbn8Fb4lirBJBbbfVRmKHRdgo1laqTWCddDfVp1/9uE86?=
 =?us-ascii?Q?phcg8g4HjOm05+4siPwdQrHLKKEy69J8L6A/75FV4iMQcabqx9mhd1eWSYIi?=
 =?us-ascii?Q?vL5tP+KrRAz4gf+ataBdZKqjm9BpHC9OW3sMuF29PnXagHskTebMGnhKmALV?=
 =?us-ascii?Q?3VsehFb5/rjJIFBMqnSfO0pMYDggJExYuMdNvkyqVPsA0+ewAGI24NWCcfGF?=
 =?us-ascii?Q?VOLCUWOFrqnQr4al4UO4aZSuGvbNhOO+ZXHjbPUy1ggGbdyzFB8X+cCKkyDp?=
 =?us-ascii?Q?FBDGOB4CbZvUOZbvzFABXQXu5p6ajNJr3oNCwOz8Lhr4i4VlVjLtfnN27DhF?=
 =?us-ascii?Q?3H0V/0cY50sO6a/GBfZXCGkH45Fk1a2GlXIY3IndyozUyrCVmqodtnkw1POp?=
 =?us-ascii?Q?4ZmiaUrQqbgE9gnhZve8wssTc+BZFVc+7kWiJ5mxZ/7x/Cws2Z6KavdebkT0?=
 =?us-ascii?Q?pd0Lxv/6Y1IYhYmSrZ67UFZPX8uD0G3oKqU1rg6+jQSZWfctO5AjJmX4HlD6?=
 =?us-ascii?Q?oob8QS0qI2Jlb9PjbsLMt2/+i2L0ndqxKUx708C3AY3+JihMpm+1d0leVNMW?=
 =?us-ascii?Q?JqqZlJJrigUjPQGdgJ0r4lMp7LO+1KVZHC4RGqHGtDlWu7SbzlljTB4uxORP?=
 =?us-ascii?Q?aX1LhsKQRuLpcQRYDBU/F53xB3dS4cOH+rRCBePF65js7su/PyEb3BfMWHiG?=
 =?us-ascii?Q?38RPbMnqubbRomL6Hollcv0=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c99eafd-1051-4372-cad6-08d99f447305
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 03:37:38.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYrMn+pmy8LHOHpL/s0j+XUivLm7Iud0xk5nXBSuFtncRFUpzTQxDGTNCkbdL2vPLH3VKRJ0e/c/WjQxqm2g4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5750
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The basic anx7625 driver only support MIPI DSI rx signal input.
This patch add MIPI DPI rx input configuration support, after apply
this patch, the driver can support DSI rx or DPI rx by adding
'bus-type' in DT.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
 2 files changed, 205 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index f48e91134c20..f7c3386c8929 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -32,6 +32,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <media/v4l2-fwnode.h>
 #include <video/display_timing.h>
 
 #include "anx7625.h"
@@ -152,18 +153,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
 	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
 }
 
-static int anx7625_write_and_or(struct anx7625_data *ctx,
-				struct i2c_client *client,
-				u8 offset, u8 and_mask, u8 or_mask)
+static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
 {
-	int val;
+	int i, ret;
 
-	val = anx7625_reg_read(ctx, client, offset);
-	if (val < 0)
-		return val;
+	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
+			       AUDIO_CONTROL_REGISTER, 0x80);
+	for (i = 0; i < 13; i++)
+		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+					 VIDEO_BIT_MATRIX_12 + i,
+					 0x18 + i);
 
-	return anx7625_reg_write(ctx, client,
-				 offset, (val & and_mask) | (or_mask));
+	return ret;
 }
 
 static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
@@ -221,38 +222,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
 	return ret;
 }
 
-static int anx7625_config_audio_input(struct anx7625_data *ctx)
-{
-	struct device *dev = &ctx->client->dev;
-	int ret;
-
-	/* Channel num */
-	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
-				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
-
-	/* FS */
-	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
-				    AUDIO_CHANNEL_STATUS_4,
-				    0xf0, AUDIO_FS_48K);
-	/* Word length */
-	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
-				    AUDIO_CHANNEL_STATUS_5,
-				    0xf0, AUDIO_W_LEN_24_24MAX);
-	/* I2S */
-	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
-				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
-	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
-				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
-	/* Audio change flag */
-	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
-				AP_AV_STATUS, AP_AUDIO_CHG);
-
-	if (ret < 0)
-		DRM_DEV_ERROR(dev, "fail to config audio.\n");
-
-	return ret;
-}
-
 /* Reduction of fraction a/b */
 static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
 {
@@ -431,7 +400,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
 			MIPI_LANE_CTRL_0, 0xfc);
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
-				MIPI_LANE_CTRL_0, 3);
+				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
 
 	/* Htotal */
 	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
@@ -615,6 +584,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
 	return ret;
 }
 
+static int anx7625_api_dpi_config(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+	u16 freq = ctx->dt.pixelclock.min / 1000;
+	int ret;
+
+	/* configure pixel clock */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				PIXEL_CLOCK_L, freq & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 PIXEL_CLOCK_H, (freq >> 8));
+
+	/* set DPI mode */
+	/* set to DPI PLL module sel */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_DIGITAL_PLL_9, 0x20);
+	/* power down MIPI */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_LANE_CTRL_10, 0x08);
+	/* enable DPI mode */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_DIGITAL_PLL_18, 0x1C);
+	/* set first edge */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 VIDEO_CONTROL_0, 0x06);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
+
+	return ret;
+}
+
+static int anx7625_dpi_config(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
+
+	/* DSC disable */
+	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+				R_DSC_CTRL_0, ~DSC_EN);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
+		return ret;
+	}
+
+	ret = anx7625_config_bit_matrix(ctx);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
+		return ret;
+	}
+
+	ret = anx7625_api_dpi_config(ctx);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
+		return ret;
+	}
+
+	/* set MIPI RX EN */
+	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+			       AP_AV_STATUS, AP_MIPI_RX_EN);
+	/* clear mute flag */
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
+
+	return ret;
+}
+
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
@@ -625,9 +664,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 		return;
 	}
 
-	anx7625_config_audio_input(ctx);
-
-	ret = anx7625_dsi_config(ctx);
+	if (ctx->pdata.is_dpi)
+		ret = anx7625_dpi_config(ctx);
+	else
+		ret = anx7625_dsi_config(ctx);
 
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
@@ -1075,6 +1115,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 		return;
 	}
 
+	ctx->hpd_status = 1;
 	ctx->hpd_high_cnt++;
 
 	/* Not support HDCP */
@@ -1084,8 +1125,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
 	/* Interrupt for DRM */
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
-	if (ret < 0)
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
 		return;
+	}
 
 	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
 	if (ret < 0)
@@ -1104,6 +1147,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
+	/* Interrupt mode, no need poll HPD status, just return */
+	if (ctx->pdata.intp_irq)
+		return;
+
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
@@ -1131,6 +1178,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
 	ctx->slimport_edid_p.edid_block_num = -1;
 }
 
+static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
+		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
+				  DP_TX_LANE0_SWING_REG0 + i,
+				  ctx->pdata.lane0_reg_data[i] & 0xFF);
+
+	for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
+		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
+				  DP_TX_LANE1_SWING_REG0 + i,
+				  ctx->pdata.lane1_reg_data[i] & 0xFF);
+}
+
 static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 {
 	struct device *dev = &ctx->client->dev;
@@ -1146,9 +1208,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
 		anx7625_start_dp_work(ctx);
+		anx7625_dp_adjust_swing(ctx);
 	}
-
-	ctx->hpd_status = 1;
 }
 
 static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
@@ -1225,20 +1286,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int anx7625_get_swing_setting(struct device *dev,
+				     struct anx7625_platform_data *pdata)
+{
+	int num_regs;
+
+	if (of_get_property(dev->of_node,
+			    "analogix,lane0-swing", &num_regs)) {
+		if (num_regs > DP_TX_SWING_REG_CNT)
+			num_regs = DP_TX_SWING_REG_CNT;
+
+		pdata->dp_lane0_swing_reg_cnt = num_regs;
+		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
+					   pdata->lane0_reg_data, num_regs);
+	}
+
+	if (of_get_property(dev->of_node,
+			    "analogix,lane1-swing", &num_regs)) {
+		if (num_regs > DP_TX_SWING_REG_CNT)
+			num_regs = DP_TX_SWING_REG_CNT;
+
+		pdata->dp_lane1_swing_reg_cnt = num_regs;
+		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
+					   pdata->lane1_reg_data, num_regs);
+	}
+
+	return 0;
+}
+
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev->of_node, *ep0;
 	struct drm_panel *panel;
 	int ret;
+	int bus_type, mipi_lanes;
+
+	anx7625_get_swing_setting(dev, pdata);
 
+	pdata->is_dpi = 1; /* default dpi mode */
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
 		return -ENODEV;
 	}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
+	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
+	mipi_lanes = MAX_LANES_SUPPORT;
+	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (ep0) {
+		if (of_property_read_u32(ep0, "bus-type", &bus_type))
+			bus_type = 0;
+
+		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
+	}
+
+	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
+		pdata->is_dpi = 0;
+
+	pdata->mipi_lanes = mipi_lanes;
+	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
+		pdata->mipi_lanes = MAX_LANES_SUPPORT;
+
+	if (pdata->is_dpi)
+		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
+	else
+		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
@@ -1301,9 +1414,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
+	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
 
-	return connector_status_connected;
+	if (ctx->pdata.panel_bridge)
+		return connector_status_connected;
+
+	return ctx->hpd_status ? connector_status_connected :
+				     connector_status_disconnected;
 }
 
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
@@ -1332,7 +1449,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi->lanes = 4;
+	dsi->lanes = ctx->pdata.mipi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
@@ -1460,6 +1577,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1835,14 +1956,22 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
-	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
+	if (!platform->pdata.panel_bridge)
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
+					DRM_BRIDGE_OP_DETECT;
+	platform->bridge.type = platform->pdata.panel_bridge ?
+				    DRM_MODE_CONNECTOR_eDP :
+				    DRM_MODE_CONNECTOR_DisplayPort;
+
 	drm_bridge_add(&platform->bridge);
 
-	ret = anx7625_attach_dsi(platform);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
-		goto unregister_bridge;
+	if (!platform->pdata.is_dpi) {
+		ret = anx7625_attach_dsi(platform);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
+			goto unregister_bridge;
+		}
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 6dcf64c703f9..3ef1d8f4e575 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -141,12 +141,20 @@
 #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
 
 /******** END of I2C Address 0x72 *********/
+
+/***************************************************************/
+/* Register definition of device address 0x7a */
+#define DP_TX_SWING_REG_CNT		0x14
+#define DP_TX_LANE0_SWING_REG0		0x00
+#define DP_TX_LANE1_SWING_REG0		0x14
+/******** END of I2C Address 0x7a *********/
+
 /***************************************************************/
 /* Register definition of device address 0x7e */
 
 #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
 
-#define FLASH_LOAD_STA 0x05
+#define FLASH_LOAD_STA          0x05
 #define FLASH_LOAD_STA_CHK	BIT(7)
 
 #define  XTAL_FRQ_SEL    0x3F
@@ -349,12 +357,20 @@ struct s_edid_data {
 
 /***************** Display End *****************/
 
+#define MAX_LANES_SUPPORT	4
+
 struct anx7625_platform_data {
 	struct gpio_desc *gpio_p_on;
 	struct gpio_desc *gpio_reset;
 	struct regulator_bulk_data supplies[3];
 	struct drm_bridge *panel_bridge;
 	int intp_irq;
+	int is_dpi;
+	int mipi_lanes;
+	int dp_lane0_swing_reg_cnt;
+	int lane0_reg_data[DP_TX_SWING_REG_CNT];
+	int dp_lane1_swing_reg_cnt;
+	int lane1_reg_data[DP_TX_SWING_REG_CNT];
 	u32 low_power_mode;
 	struct device_node *mipi_host_node;
 };
-- 
2.25.1

