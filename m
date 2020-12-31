Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0C2E7F6E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444A089B46;
	Thu, 31 Dec 2020 10:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2138.outbound.protection.outlook.com [40.107.223.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F8889893
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 02:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr3teDiT2WO6/6BTfP7+LTCPWaccq7Gxf+3Fl8a397u8/JNT9zJt39RT9lDBbjk5hq81NbVmwWXpq9HlFv0fsLspGImwoKz/TDH0x+Mn/t12O0OvbB8cWvuUYBQ4MGZIxw70X5OxEOLwTCha8NrwW4UfEoEe8/VNGmAttuNXRE4WQycqEXtcUiM3Eg1PEgdokirY6H8Qv2fjm6y9WD2EojnJs952ysOZ4KBmZoWuI2pWr7aY3ENo7MFNqBM2/FacZzOlj062ODxnn/3VJS+2tBS17nTq/okMC3h02QApsgjN4kngR3JMi0y4sPQDk6Twa5sbT2KVSSQJ7K/OAhW9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9dLX+F+Rj++i2+f2cHZ7MWosdyEiAZALpLPKJYCdQc=;
 b=ndw7tHXgJJFExzB6RbYqkoc5GW8UfHZSDJbPRhceo4TuBu3j7AV96gopt6kvF4ULzAioGX60K9zVvL5YLHbmTvUWtBKBEu0gHVb2ChVGoKo9f8dv9zPER7Vk+EmmPzDtPySbWq/I92iVMNLix3ZnWvIuk6hgg+be1785u4tjl638W6cwpbNTchCian0H6kDkDxwPInrylZGEz0HqmLzhG5WWYEDqsZ5PQnfRdIuVxqcNrxaQLo+tMopMVHSx/ZSeqKEYPgEG5qQYDzjaH7RTLwv0HjoQmu8/bxDYL1UZbm1UxuxRlKBbhk3AdWR5j6/HdS1Iriwcdj41uzw/2sCRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9dLX+F+Rj++i2+f2cHZ7MWosdyEiAZALpLPKJYCdQc=;
 b=MSZAS/Vo1JY3TQs32FcgnD9OjI3zc3qba9ZeexelF8jSyDGEpfSojKZYPi87PFojQe3MSyb8XHCv8Svb6wcDuS+wOT7U1ayFG/ok2TT76MLhLoUot6J0x/3zF/unCUAuvU6UVHTmF/I+1oUBbUN+wChIm4URQ/nS4Y4ehhp1V94=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7615.namprd04.prod.outlook.com (2603:10b6:a03:32b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Thu, 31 Dec
 2020 02:22:44 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::707e:7179:3257:e72b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::707e:7179:3257:e72b%8]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 02:22:44 +0000
Date: Thu, 31 Dec 2020 10:22:36 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 2/2] drm/bridge: anx7625: add MIPI DPI input feature support
Message-ID: <f7fce2657d3c98a4d705f88eb9684f97b646793e.1609380663.git.xji@analogixsemi.com>
References: <cover.1609380663.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1609380663.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR02CA0208.apcprd02.prod.outlook.com (2603:1096:201:20::20) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3721.20 via Frontend Transport; Thu, 31 Dec 2020 02:22:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 315b2055-0640-4a81-6f74-08d8ad32f4ec
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB761513F680D0CD320E38C3D6C7D60@SJ0PR04MB7615.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tiPPkFn36nAFWKmpqF94H4NgqiqF7JnvnEXy8yrBIDSB007XEFA3XIb4KH5sOghcMhoE+mitOqxJ/iv9rK2OU2jmPYM5KaHb3MPtVkylqBRHJe/HJmG1a4Y2B56C+dzZC6Jx4fy9o6VLhjJuymYJaNa/MFEeDVn1xONwWg4bwOIGWPxB2FfRxsWbGcP2DdqgXG1pLVu5MDQAvr9aOi/aPXqrbcG/vtJisFfkihwqmNd0oTF+cMBCM48+9kEyYbWziTL9z+bglE3z0ONOMWqN0ZK/+AHsVDKKc7u9D07Ome48zh8B5Rqhc9XGycixujmUvA490pzKvpWbo7XAEZS7lbANz+a1hDHq0Yj6wZTlh4qfjfX/X9woGUjlme1rlokRzEn3F1/aSGbiTU+rmHgMDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(346002)(136003)(396003)(110136005)(7416002)(478600001)(54906003)(8936002)(66476007)(66556008)(6496006)(8676002)(66946007)(4326008)(52116002)(36756003)(30864003)(86362001)(83380400001)(6666004)(6486002)(5660300002)(2906002)(26005)(956004)(2616005)(316002)(186003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ofr9ebahEQxSYuyIBJHtkAYxdCKuoDtvt5F3+nxRTAguE236T4UfxN0do3ZY?=
 =?us-ascii?Q?V6RXQSr3Q+N7EIbA/oJmIruUbOBowej6hmOmftqZD6EYdoeF0L+CZrdegCRf?=
 =?us-ascii?Q?GM3lvfOl6NsjnQ7encAkQ4P1Qm37kgx16yvnyaRBmLVzu2op7KSu/bnjfJLx?=
 =?us-ascii?Q?2d8fDAzOjQoDFJIqG6mJ+CF4Wz46/6TFMutAwKOmrqNN0Cavsxz2PSum6QYc?=
 =?us-ascii?Q?TDCgQALOzqyMuxASk5nKYIwlnJr9o9XJmExsh2KUXWxBQJrp50hOgm0QeVN8?=
 =?us-ascii?Q?P7BjNXcuSQxdDcraNcWWqiSdS2kbjafc1PkBVoyacT+eHa8RwyV5I9Fdf05m?=
 =?us-ascii?Q?UL3e5ui5PeC5BJiRSr6vh7bRGupc3Tehqk82T+70FdmkGsu0SMxtCu3QPAdl?=
 =?us-ascii?Q?EtfF646JKaiaAzovQz6ZgagPkobWCA2e5y9NMhiEupSiXETDBMEKOScqWIox?=
 =?us-ascii?Q?gSaI6gZnrXVj5ryZAHlDp5p+FGA9x4pWi8e3OCNFWK8Vp2jXznNZNMt9uQkO?=
 =?us-ascii?Q?0vEb4bJ8NyyJQXmM5MVp6g91RPmuF9IofrP1q+wtKd70tZp4s+Kf5RGiWEAR?=
 =?us-ascii?Q?v34e/YrPVX27wa3+pNhj9j+S6vrJ4rWAcUeOa7YAp/uIxGK74LvBVtiWWtI1?=
 =?us-ascii?Q?ADT/RCTCvs9EKYpucTbfd3j/S+jng6Xd4vxt6QH72weu1IefDJIu9PzEQKww?=
 =?us-ascii?Q?VQGxiMMSBFpCfdEvBrM0fjWdBMsLuPJG03Rnzzg2j9KEtQvH4y59qnJNRr4w?=
 =?us-ascii?Q?rlKMI5TaQ7FsKb+sjE81A/OFaX+g/oAynXOiczjVUb5ZU84NNNWEZDLzdTaf?=
 =?us-ascii?Q?6D61ottO5oOVEX2C+Se3XGuyaYrKgJSAExsKAEqnIbCEUC+hASCiMIAWq7VJ?=
 =?us-ascii?Q?NwAUvIJ5d2NxLbwpU7sDO+t1LmELrsdQ/pp55aKu4fvfKbBSsSw2/1CWCyKd?=
 =?us-ascii?Q?9o3pew9SR7ejUebtv2SDqvM/KSbI7lw8Uv6o49mkrpd2KYRYhKMH84AdWNC6?=
 =?us-ascii?Q?7ySQ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 02:22:44.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: 315b2055-0640-4a81-6f74-08d8ad32f4ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4354+p54wH4ZIDem81nFccYw1qd1dIi3aai30HxjWfLV5Es0H+x+pk3JqfJjFNM0tdQDSP3u38mg3PJAZNTskA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7615
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI rx DPI input support

Signed-off-by: Xin Ji <xji@analogixsemi.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 344 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  24 ++-
 2 files changed, 348 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc059..372b356 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -164,6 +164,20 @@ static int anx7625_write_and_or(struct anx7625_data *ctx,
 				 offset, (val & and_mask) | (or_mask));
 }
 
+static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
+{
+	int i, ret;
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				AUDIO_CONTROL_REGISTER, 0x80);
+	for (i = 0; i < 13; i++)
+		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+					 VIDEO_BIT_MATRIX_12 + i,
+					 0x18 + i);
+
+	return ret;
+}
+
 static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
 {
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, AP_AUX_CTRL_STATUS);
@@ -189,10 +203,64 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 			       AP_AUX_CTRL_STATUS);
 	if (val < 0 || (val & 0x0F)) {
 		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
-		val = -EIO;
+		return -EIO;
 	}
 
-	return val;
+	return 0;
+}
+
+static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
+				 u8 addrh, u8 addrm, u8 addrl,
+				 u8 len, u8 *buf)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+	u8 cmd;
+
+	if (len > MAX_DPCD_BUFFER_SIZE) {
+		DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
+		return -E2BIG;
+	}
+
+	cmd = ((len - 1) << 4) | 0x09;
+
+	/* Set command and length */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_COMMAND, cmd);
+
+	/* Set aux access address */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_7_0, addrl);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_15_8, addrm);
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_19_16, addrh);
+
+	/* Enable aux access */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
+
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
+		return -EIO;
+	}
+
+	usleep_range(2000, 2100);
+
+	ret = wait_aux_op_finish(ctx);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
+				     AP_AUX_BUFF_START, len, buf);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "read dpcd register failed\n");
+		return -EIO;
+	}
+
+	return 0;
 }
 
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
@@ -595,6 +663,101 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
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
+static int anx7625_hdcp_setting(struct anx7625_data *ctx)
+{
+	u8 bcap;
+	struct device *dev = &ctx->client->dev;
+
+	if (!(ctx->hdcp_support && ctx->hdcp_en)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "hdcp_support(%d), hdcp_en(%d)\n",
+				     ctx->hdcp_support, ctx->hdcp_en);
+		DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
+		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
+					 0xee, 0x9f);
+	}
+
+	anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
+	if (!(bcap & 0x01)) {
+		DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
+		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
+					 0xee, 0x9f);
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
+
+	return anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
+}
+
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
@@ -605,9 +768,15 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 		return;
 	}
 
+	/* HDCP config */
+	anx7625_hdcp_setting(ctx);
+
 	anx7625_config_audio_input(ctx);
 
-	ret = anx7625_dsi_config(ctx);
+	if (ctx->pdata.is_dpi)
+		ret = anx7625_dpi_config(ctx);
+	else
+		ret = anx7625_dsi_config(ctx);
 
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
@@ -688,8 +857,53 @@ static int sp_tx_get_edid_block(struct anx7625_data *ctx)
 	return c;
 }
 
-static int edid_read(struct anx7625_data *ctx,
-		     u8 offset, u8 *pblock_buf)
+static int check_hdcp_support(struct anx7625_data *ctx)
+{
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	/* Select HDCP1.4 Key load */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_SRAM_SEL, 0x12);
+	/* Select flash addr low byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_ADDR_LOW, 0x91);
+	/* Select flash addr high byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_ADDR_HIGH, 0xa0);
+	/* Select sram length high byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_LEN_HIGH, 0x00);
+	/* Select sram length low byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_LEN_LOW, 0x27);
+	/* Select flash length high byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LEN_HIGH, 0x02);
+	/* Select flash length low byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LEN_LOW, 0x70);
+	/* Select sram addr high byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_ADDR_HIGH, 0x00);
+	/* Select sram addr low byte */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_ADDR_LOW, 0x00);
+	/* Enable load with decrypt_en */
+	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA, 0x03);
+
+	usleep_range(10000, 11000);
+
+	/* Check load status */
+	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : access flash load.\n");
+		return ret;
+	}
+
+	if ((ret & 0xF2) != 0xF2) {
+		ctx->hdcp_support = 0;
+		DRM_DEV_DEBUG_DRIVER(dev, "not support HDCP\n");
+	} else {
+		ctx->hdcp_support = 1;
+		DRM_DEV_DEBUG_DRIVER(dev, "support HDCP\n");
+	}
+
+	return 0;
+}
+
+static int edid_read(struct anx7625_data *ctx, u8 offset, u8 *pblock_buf)
 {
 	int ret, cnt;
 	struct device *dev = &ctx->client->dev;
@@ -992,8 +1206,10 @@ static void anx7625_chip_control(struct anx7625_data *ctx, int state)
 
 	if (state) {
 		atomic_inc(&ctx->power_status);
-		if (atomic_read(&ctx->power_status) == 1)
+		if (atomic_read(&ctx->power_status) == 1) {
 			anx7625_power_on_init(ctx);
+			check_hdcp_support(ctx);
+		}
 	} else {
 		if (atomic_read(&ctx->power_status)) {
 			atomic_dec(&ctx->power_status);
@@ -1051,6 +1267,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 		return;
 	}
 
+	ctx->hpd_status = 1;
 	ctx->hpd_high_cnt++;
 
 	/* Not support HDCP */
@@ -1060,8 +1277,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
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
@@ -1080,6 +1299,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
+	/* Interrupt mode, no need poll HPD status, just return */
+	if (ctx->pdata.intp_irq)
+		return;
+
 	if (atomic_read(&ctx->power_status) != 1) {
 		DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
 		return;
@@ -1130,6 +1353,22 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
 	ctx->slimport_edid_p.edid_block_num = -1;
 }
 
+static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+	int i;
+
+	if (!ctx->pdata.reg_table_size)
+		return;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "adjust DP tx swing\n");
+
+	for (i = 0; i < ctx->pdata.reg_table_size; i++)
+		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
+				  ctx->pdata.art[i].offset & 0xFF,
+				  ctx->pdata.art[i].data & 0xFF);
+}
+
 static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 {
 	struct device *dev = &ctx->client->dev;
@@ -1145,9 +1384,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
 		anx7625_start_dp_work(ctx);
+		anx7625_dp_adjust_swing(ctx);
 	}
-
-	ctx->hpd_status = 1;
 }
 
 static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
@@ -1224,12 +1462,64 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int anx7625_get_u32_value(struct device_node *np,
+				 const char *name,
+				 int start_pos,
+				 int *reg_data)
+{
+	int i, ret;
+
+	/* each slot has 2 cells */
+	for (i = 0; i < 2; i++) {
+		ret = of_property_read_u32_index(np, name,
+						 start_pos + i,
+						 &reg_data[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
 	struct device_node *np = dev->of_node;
 	struct drm_panel *panel;
-	int ret;
+	int ret, i;
+	int reg_data[2];
+	int total_size, num_regs, start_pos;
+
+	if (of_get_property(dev->of_node,
+			    "analogix,swing-setting", &total_size)) {
+		/* each slot has 2 cells */
+		num_regs = total_size / (sizeof(u32) * 2);
+		if (num_regs > MAX_REG_SIZE)
+			num_regs = MAX_REG_SIZE;
+
+		pdata->reg_table_size = num_regs;
+
+		for (i = 0; i < num_regs; i++) {
+			start_pos = i * 2;
+			ret = anx7625_get_u32_value(np, "analogix,swing-setting",
+						    start_pos, reg_data);
+			if (ret) {
+				DRM_DEV_ERROR(dev, "get swing-setting at %d\n",
+					      start_pos);
+				return -ENODEV;
+			}
+			pdata->art[i].offset = reg_data[0];
+			pdata->art[i].data = reg_data[1];
+		}
+	}
+
+	ret = of_property_read_u32(dev->of_node, "analogix,mipi-dpi-in",
+				   &pdata->is_dpi);
+	if (ret)
+		pdata->is_dpi = 0; /* default dsi mode */
+
+	DRM_DEV_DEBUG_DRIVER(dev, "MIPI RX is %s.\n",
+			     pdata->is_dpi ? "DPI" : "DSI");
 
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
@@ -1237,7 +1527,7 @@ static int anx7625_parse_dt(struct device *dev,
 		return -ENODEV;
 	}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
+	DRM_DEV_DEBUG_DRIVER(dev, "found MIPI host node.\n");
 
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
@@ -1300,9 +1590,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
+	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
+
+	if (ctx->pdata.panel_bridge)
+		return connector_status_connected;
 
-	return connector_status_connected;
+	return ctx->hpd_status ? connector_status_connected :
+				     connector_status_disconnected;
 }
 
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
@@ -1376,10 +1670,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	err = anx7625_attach_dsi(ctx);
-	if (err) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
-		return err;
+	if (!ctx->pdata.is_dpi) {
+		err = anx7625_attach_dsi(ctx);
+		if (err) {
+			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
+			return err;
+		}
 	}
 
 	if (ctx->pdata.panel_bridge) {
@@ -1478,6 +1774,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1777,6 +2077,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
 	if (platform->pdata.low_power_mode == 0) {
 		anx7625_disable_pd_protocol(platform);
+		check_hdcp_support(platform);
 		atomic_set(&platform->power_status, 1);
 	}
 
@@ -1786,8 +2087,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
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
 	drm_bridge_add(&platform->bridge);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 193ad86..0223e07 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -146,9 +146,19 @@
 
 #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
 
-#define FLASH_LOAD_STA 0x05
+#define FLASH_SRAM_SEL          0x00
+#define SRAM_ADDR_HIGH          0x01
+#define SRAM_ADDR_LOW           0x02
+#define SRAM_LEN_HIGH           0x03
+#define SRAM_LEN_LOW            0x04
+#define FLASH_LOAD_STA          0x05
 #define FLASH_LOAD_STA_CHK	BIT(7)
 
+#define FLASH_ADDR_LOW          0x0F
+#define FLASH_ADDR_HIGH         0x10
+#define FLASH_LEN_HIGH          0x31
+#define FLASH_LEN_LOW           0x32
+
 #define  XTAL_FRQ_SEL    0x3F
 /* bit field positions */
 #define  XTAL_FRQ_SEL_POS    5
@@ -340,6 +350,8 @@ enum audio_wd_len {
 #define EDID_TRY_CNT	3
 #define SUPPORT_PIXEL_CLOCK	300000
 
+#define MAX_REG_SIZE	64
+
 struct s_edid_data {
 	int edid_block_num;
 	u8 edid_raw_data[FOUR_BLOCK_SIZE];
@@ -347,11 +359,19 @@ struct s_edid_data {
 
 /***************** Display End *****************/
 
+struct anx7625_reg_table {
+	int offset;
+	int data;
+};
+
 struct anx7625_platform_data {
 	struct gpio_desc *gpio_p_on;
 	struct gpio_desc *gpio_reset;
 	struct drm_bridge *panel_bridge;
 	int intp_irq;
+	int is_dpi;
+	int reg_table_size;
+	struct anx7625_reg_table art[MAX_REG_SIZE];
 	u32 low_power_mode;
 	struct device_node *mipi_host_node;
 };
@@ -371,6 +391,8 @@ struct anx7625_data {
 	atomic_t power_status;
 	int hpd_status;
 	int hpd_high_cnt;
+	int hdcp_support;
+	int hdcp_en;
 	/* Lock for work queue */
 	struct mutex lock;
 	struct i2c_client *client;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
