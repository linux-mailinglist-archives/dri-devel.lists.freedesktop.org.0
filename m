Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3D44A4F5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 03:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980436E5A4;
	Tue,  9 Nov 2021 02:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2095.outbound.protection.outlook.com [40.107.237.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6EE6E5A4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 02:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlyty77HHMlVyvtBJZjN88fR1f1RfwIVBOAnLW+0yf1VV/wz4aEX5Nk+ql8IRk8FBMuH5cyRYd33Y3KZSMkfxGEoNSJWqZjbo5iPW9SfeYdoj44WzQGQL9tfPiZ0oqibhjrMyW2GubccV6Xgw+w1GyXVVvGLMBJs2z0qPQGO/2BEF44tOZQpML3xTrGOVElxrA6PYtI0wkLvnd7itzg5f03ffMZmGX9Yik1qkuW4X2pCRYZKLPYPTSTbMubuxoa8AL8yvnuTcyJy67MxsTZUfofWK5vH4o1Ygn7aHokDxWLSitIYcd6fj9heJt3zwWUAOaQWz9Lt+RNBo29RbP2R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRxalayuapCoCcBFHOisVKK6OgsV+MpT8CKo2UfgPmY=;
 b=boFzitcEXUusQYho3JfbiiL5H7fGvLQhDy1CwD2cIMbIpsa+A0PkXLOoVifChs0EzqiHmPnDxd6/mKOgarDUx9czvLXpMdUmUCmE3CF7fOga5d4RItGcTBLW+HmyvNk4q9S5/yh10CZFDxeLFjOOiOifR2Y/bv7AFtsUJ9P1vvb81MBfKictpuBbrfTvweTQvYLPPNqJk53JQpdDI7nt3G3GMexgUX28GE2JHpy6x+qpj3zJerRqBLH6L7LEf5Q8zUxVdfA6hB8QOZJyeAFzOBSQh16uAIrkWjDIlXYuTozbn95lrfZjoPfeGguRHxmdpVEeGt9E4UBT/j6rfKphcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRxalayuapCoCcBFHOisVKK6OgsV+MpT8CKo2UfgPmY=;
 b=gNX3ZUw0GF8MmYY4Au6JpmxhtRnRdcl30jR7SvCCu9q/yMiQUPe0ew+wmsBbCPgrkjk60JBSea03j+FMBq75XKkS8AGjHyYL6ule0UalrS5zrEXYuaiDXQZWECH5q1NI8ViVHqEpHkHm5nJLNaFxNTlGokL+oarNTprC+Q1fhrY=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6566.namprd04.prod.outlook.com (2603:10b6:a03:1d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 02:42:55 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%4]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 02:42:55 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH 1/2] drm/bridge: anx7625: add HDCP support
Date: Tue,  9 Nov 2021 10:42:36 +0800
Message-Id: <20211109024237.3354741-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0072.apcprd04.prod.outlook.com
 (2603:1096:202:15::16) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0072.apcprd04.prod.outlook.com (2603:1096:202:15::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 02:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1bf3622-5628-419d-0f51-08d9a32aa22d
X-MS-TrafficTypeDiagnostic: BY5PR04MB6566:
X-Microsoft-Antispam-PRVS: <BY5PR04MB65668ED1AD067F6FEF44A11AC7929@BY5PR04MB6566.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqhaVjv6qEfGdlhzLxVX+avpcUrzIzE57BdfbJPQ7C1K8K+P/XqBMMlkAUXjMXMii1+Kwi84LUuMAnzSrcKoGsHLTiwDvDKtvfHo8rxQZNjYLn/i3UoBLX8vbnRXCdl84OLD2fGKNJsrsyLEpeugRHFMLNBibTAsAS/6GzuAtV7Mkut1P4hbqEOnab+R4lgx6bZ8fGmNZaC+JK4IMWFB62U2FeCAUJRlg97weBI3T9pvP6mQwd9vpPK7HNa+Z/9ITU+XqC2pU9IeuVu9iH+L5zH+g8Jkq1r1nqpZpLalYTX93iQVThcHKIEkyYs+hYCDW7eRdvxXWTwOwxsHSMdDAuXhYXocYZFbh+mAJfpTUnGbHHcV9Re1OZSnMOF90oMYUx6kPfl0GFL/QXU47d+uK3Qb4cw8AMnnHjpE4gmEnKSRkEP7GkujrqohO3DiFMjBXalUD1JaYFnUWwAM5pCZWdlyU79q+rmZJ56X9LzOSRLf99x5uQP02KlbRvWb2/EMhCHgIYgP05a5z0io8z0x69AMhl4OAxLPeigneNrYY7+bpnLsL5Fqe7T4wpA5Zgb+bVp5Mx1xA+e6GDCZDEVaBTkuifEglyLWer8bHthBg0kUi3YLLusY0RjpYTdjM6DI9PL4648iEdVJPMdcv2zQIePVVR8xC0/gV/EVvxHfoT0vr13GHzPk4VJ5Bj1sWUE1F8nGoU5MCWXC/0XYtpyDzy4kYl6adPHW0keXxUcJnDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(1076003)(956004)(7416002)(38350700002)(6496006)(508600001)(38100700002)(26005)(86362001)(6486002)(36756003)(52116002)(186003)(2616005)(2906002)(6666004)(66556008)(66476007)(83380400001)(5660300002)(6636002)(8936002)(55236004)(921005)(4326008)(8676002)(316002)(107886003)(30864003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bSod7G8qpam7tcwuc/8cMd6+dq6GVUUG2juvhQ1IC8Ce/2RakUcHv4Rt8vnq?=
 =?us-ascii?Q?n/htdD4kiJHnJegv4rK5+nA7lHZRmdVPsrzeO12L3RpL7qfnwb+fNcUxXWKV?=
 =?us-ascii?Q?h7RdGEPf3RTS0sUzYdqXlyNqqp4D84KU5Wl1xzHngVrAX/ZHqr7aQTwDjSkW?=
 =?us-ascii?Q?pxKfxRDAbyU4GJQGo9tdCDbNAs530z+v2uExDo+4ssuJxXlximyPHB+k32eC?=
 =?us-ascii?Q?OhAlq4h9QEV2uQDqaAGF1b3O9DBuFfoYOj5vQ32hkd0+D1GhHWhz/umhKTbB?=
 =?us-ascii?Q?CYxgjrcPDwmWvQKvANNX3QkA8lBC1OTseB9+A5NbOWbziysfTr0kLF26boAA?=
 =?us-ascii?Q?oM+mYIej0d3lJKV2nK2yA6RMI5ud4xb3IO/nKtNSjiU0+ZvlGWBKE4agDdz7?=
 =?us-ascii?Q?JYA4M8jemncF+dJOl36YlkWFscRA9MTK6HmdjK+tV3+0OR7W6comTieUwXIR?=
 =?us-ascii?Q?7YAXuZSqNPbD+hvEnLXhkMtpApkYQR1obTaNXWX7iXycd7kKxVelC21j6jTQ?=
 =?us-ascii?Q?9W2+VCkxEFnG9Wk1HV2cnp41wxm4B0z9upYWnd8JReseW2n0ZaDkbCUb/F1u?=
 =?us-ascii?Q?iaiQCbNWpMT/djaD0OBD9sVvsHVq8KWcUM0JqpVXKIJZ0PPPiU6bn/adzEq6?=
 =?us-ascii?Q?eWQyh5Rn1KxobKo8wS5HTgjTR9R82C5BjeqHAsu0qySw7fRL/jKMPWZVHK5P?=
 =?us-ascii?Q?1mvsirAzELXMKFm9mRuKHUSc7E5PW22nFXQA5Mje2hD1hwzzxWx/PpBzEX7z?=
 =?us-ascii?Q?foR/u4VxFpRVzddO68zwA9tVs/qR/SSW/YIqcaAxf2+G+6dauAANsL7mpxbA?=
 =?us-ascii?Q?GEqPZ857E/NWNb3djdFZpyZJwuzXdES0teZ4DjFgH01dljR9fv1nwbwihow6?=
 =?us-ascii?Q?OnkT9ZV2xGaiA+wMBXZF5QMn6uKni1fDEjXe0/ew1JuW1Ueu7myRzA9KINC3?=
 =?us-ascii?Q?nuBJNZeludphdih8oerFOPXIhFpxtN5TALZmQqi/U0T8X9XOEKL5MU5PhrEu?=
 =?us-ascii?Q?uoz39Yw+kHKC6Xp+ST64rrNDFCHRkJeScFeXpdNUGh8ErHZ9m+N5SEzbvwyM?=
 =?us-ascii?Q?qiAxMpV2kLHjGVM09OXPje2ftp8eE7PnxA64IcK7DzBhItiMNg+hbFSsdBLo?=
 =?us-ascii?Q?9/py4dY5DL7L62jwCIT0G9MPBDRq2IxsURwCoLJO482S+p1cG+IBntjbrSkD?=
 =?us-ascii?Q?JveBcTX+R1ba2WT6Ag5r9JBAIGWV7NU2h0Mc+nL1IxSJR2SKzHoOhVFEtwGG?=
 =?us-ascii?Q?JjwXEhXU79j5Etya/ubRwS4HYhUTRWM/Nw8JRGgWcK5tlo1CKNnA2vU04MKT?=
 =?us-ascii?Q?N9+FotgaPX7WxahNiqcjlAs6OvEK8IerZIzyJwL5D/7Zwh37N/lJces9zdOD?=
 =?us-ascii?Q?jpPtxlNTRPtibKgWGeTK+BlyGGMUt6ayRjD3qUuE9CRqt5Fecicc3kCdSKz3?=
 =?us-ascii?Q?SQyCoakMtUtGoheXgfE3c+ouSKUxjHIFziJSDuD4J+9AM5SYehPzuUQ2P/jM?=
 =?us-ascii?Q?TQ5e8RTpwEIkUUL/iZVjPJQtgnLq/PMJ75Ie32xOwjXKUqhXx6NFIVGbgRUG?=
 =?us-ascii?Q?QppMFfUWFjsj1hKzOD0xO3C6Qp7JNoqYVw2szeeoORPyP9JeJPrjxJTBtQEe?=
 =?us-ascii?Q?Uix5idIEN+GyrQ/W+aRKHaU=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bf3622-5628-419d-0f51-08d9a32aa22d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 02:42:55.7717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX7a+oanRj2ACA+uGo5mPgK/DkO1xBn8KMsS3OwlY4RjDdImCYbj6QdGT58kffq8F9PzrAB7gfmA3NQVmqjzXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6566
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

This patch provides HDCP setting interface for userspace to dynamic
enable/disable HDCP function.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 368 +++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h |  69 +++-
 2 files changed, 425 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..6d93026c2999 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_hdcp.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -213,6 +214,60 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 	return 0;
 }
 
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
+		return -EINVAL;
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
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
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
+}
+
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
 				      u8 status)
 {
@@ -669,6 +724,160 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
 	return ret;
 }
 
+static int anx7625_read_flash_status(struct anx7625_data *ctx)
+{
+	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
+}
+
+static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
+{
+	int ret, val;
+	struct device *dev = &ctx->client->dev;
+	u8 ident[32];
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				FLASH_ADDR_HIGH, 0x91);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_LOW, 0xA0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : set key flash address.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : set key flash len.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				R_FLASH_RW_CTRL, FLASH_READ);
+	ret |= readx_poll_timeout(anx7625_read_flash_status,
+				  ctx, val,
+				  ((val & FLASH_DONE) || (val < 0)),
+				  2000,
+				  2000 * 150);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "flash read access fail!\n");
+		return -EIO;
+	}
+
+	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
+				     FLASH_BUF_BASE_ADDR,
+				     FLASH_BUF_LEN, ident);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "read flash data fail!\n");
+		return -EIO;
+	}
+
+	if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
+{
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	/* Select HDCP 1.4 KEY */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				R_BOOT_RETRY, 0x12);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_HIGH, HDCP14KEY_START_ADDR >> 8);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_LOW, HDCP14KEY_START_ADDR & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_LEN_H, HDCP14KEY_SIZE >> 12);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_LEN_L, HDCP14KEY_SIZE >> 4);
+
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_ADDR_H, 0);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_ADDR_L, 0);
+	/* Enable HDCP 1.4 KEY load */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 R_RAM_CTRL, DECRYPT_EN | LOAD_START);
+	DRM_DEV_DEBUG_DRIVER(dev, "load HDCP 1.4 key done\n");
+	return ret;
+}
+
+static int anx7625_hdcp_config(struct anx7625_data *ctx, bool on)
+{
+	u8 bcap;
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	if (!on) {
+		DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP 1.4\n");
+
+		/* Disable HDCP */
+		ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
+		/* Try auth flag */
+		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
+		/* Interrupt for DRM */
+		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
+		if (ret < 0)
+			DRM_DEV_ERROR(dev, "fail to disable HDCP\n");
+
+		return anx7625_write_and(ctx, ctx->i2c.tx_p0_client,
+					 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
+	}
+
+	ret = anx7625_hdcp_key_probe(ctx);
+	if (ret) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no key found, not to do hdcp\n");
+		return ret;
+	}
+
+	anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
+	if (!(bcap & 0x01)) {
+		DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
+		return 0;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
+
+	/* First clear HDCP state */
+	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				TX_HDCP_CTRL0,
+				KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
+	usleep_range(1000, 1100);
+	/* Second clear HDCP state */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				 TX_HDCP_CTRL0,
+				 KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
+
+	/* Set time for waiting KSVR */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				 SP_TX_WAIT_KSVR_TIME, 0xc8);
+	/* Set time for waiting R0 */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
+				 SP_TX_WAIT_R0_TIME, 0xb0);
+	ret |= anx7625_hdcp_key_load(ctx);
+	if (ret) {
+		DRM_WARN("prepare HDCP key failed.\n");
+		return ret;
+	}
+
+	ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
+
+	/* Try auth flag */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
+	/* Interrupt for DRM */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "fail to enable HDCP\n");
+
+	return anx7625_write_or(ctx, ctx->i2c.tx_p0_client,
+				TX_HDCP_CTRL0, HARD_AUTH_EN);
+}
+
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
@@ -679,6 +888,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 		return;
 	}
 
+	/* Disable HDCP */
+	anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
+
 	if (ctx->pdata.is_dpi)
 		ret = anx7625_dpi_config(ctx);
 	else
@@ -686,6 +898,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
+
+	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+
+	ctx->dp_en = 1;
 }
 
 static void anx7625_dp_stop(struct anx7625_data *ctx)
@@ -705,6 +921,10 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	ret |= anx7625_video_mute_control(ctx, 1);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
+
+	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+
+	ctx->dp_en = 0;
 }
 
 static int sp_tx_rst_aux(struct anx7625_data *ctx)
@@ -859,7 +1079,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 				AP_AUX_ADDR_7_0, 0x50);
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
 				 AP_AUX_ADDR_15_8, 0);
-	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
 				 AP_AUX_ADDR_19_16, 0xf0);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "access aux channel IO error.\n");
@@ -1688,6 +1908,83 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	return 0;
 }
 
+void hdcp_check_work_func(struct work_struct *work)
+{
+	u8 status;
+	struct delayed_work *dwork;
+	struct anx7625_data *ctx;
+	struct device *dev;
+	struct drm_device *drm_dev;
+
+	dwork = to_delayed_work(work);
+	ctx = container_of(dwork, struct anx7625_data, hdcp_work);
+	dev = &ctx->client->dev;
+
+	if (!ctx->connector) {
+		DRM_ERROR("HDCP connector is null!");
+		return;
+	}
+
+	drm_dev = ctx->connector->dev;
+	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
+	mutex_lock(&ctx->hdcp_wq_lock);
+
+	status = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client, 0);
+	DRM_DEV_DEBUG_DRIVER(dev, "sink HDCP status check: %.02x\n", status);
+	if (status & BIT(1)) {
+		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_ENABLED;
+		drm_hdcp_update_content_protection(ctx->connector,
+						   ctx->hdcp_cp);
+		DRM_DEV_DEBUG_DRIVER(dev, "update CP to ENABLE\n");
+	}
+
+	mutex_unlock(&ctx->hdcp_wq_lock);
+	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
+}
+
+static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
+					  struct drm_connector_state *state)
+{
+	struct device *dev = &ctx->client->dev;
+	int cp;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "hdcp state check\n");
+	cp = state->content_protection;
+
+	if (cp == ctx->hdcp_cp)
+		return 0;
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		if (ctx->dp_en) {
+			DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP\n");
+			anx7625_hdcp_config(ctx, true);
+
+			queue_delayed_work(ctx->hdcp_workqueue,
+					   &ctx->hdcp_work,
+					   msecs_to_jiffies(2000));
+		}
+	}
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+			DRM_ERROR("current CP is not ENABLED\n");
+			return -EINVAL;
+		}
+		anx7625_hdcp_config(ctx, false);
+		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+		drm_hdcp_update_content_protection(ctx->connector,
+						   ctx->hdcp_cp);
+		DRM_DEV_DEBUG_DRIVER(dev, "update CP to UNDESIRE\n");
+	}
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		DRM_ERROR("Userspace illegal set to PROTECTION ENABLE\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
@@ -1902,25 +2199,58 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void anx7625_bridge_enable(struct drm_bridge *bridge)
+static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
+	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge atomic check\n");
+	anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
+				  &crtc_state->adjusted_mode);
+
+	return anx7625_connector_atomic_check(ctx, conn_state);
+}
+
+static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *state)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+	struct device *dev = &ctx->client->dev;
+	struct drm_connector *connector;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "drm atomic enable\n");
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(dev, "Parent encoder object not found");
+		return;
+	}
+
+	connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
+							     bridge->encoder);
+	if (!connector)
+		return;
+
+	ctx->connector = connector;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "attached content protection.\n");
 
 	pm_runtime_get_sync(dev);
 
 	anx7625_dp_start(ctx);
 }
 
-static void anx7625_bridge_disable(struct drm_bridge *bridge)
+static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = &ctx->client->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
 
+	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
 	pm_runtime_put_sync(dev);
@@ -1950,11 +2280,14 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
-	.disable = anx7625_bridge_disable,
 	.mode_valid = anx7625_bridge_mode_valid,
 	.mode_set = anx7625_bridge_mode_set,
-	.mode_fixup = anx7625_bridge_mode_fixup,
-	.enable = anx7625_bridge_enable,
+	.atomic_check = anx7625_bridge_atomic_check,
+	.atomic_enable = anx7625_bridge_atomic_enable,
+	.atomic_disable = anx7625_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.detect = anx7625_bridge_detect,
 	.get_edid = anx7625_bridge_get_edid,
 };
@@ -2134,6 +2467,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	anx7625_init_gpio(platform);
 
 	mutex_init(&platform->lock);
+	mutex_init(&platform->hdcp_wq_lock);
+
+	INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
+	platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
+	if (!platform->hdcp_workqueue) {
+		DRM_DEV_ERROR(dev, "fail to create work queue\n");
+		ret = -ENOMEM;
+		goto free_platform;
+	}
 
 	platform->pdata.intp_irq = client->irq;
 	if (platform->pdata.intp_irq) {
@@ -2143,7 +2485,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		if (!platform->workqueue) {
 			DRM_DEV_ERROR(dev, "fail to create work queue\n");
 			ret = -ENOMEM;
-			goto free_platform;
+			goto free_hdcp_wq;
 		}
 
 		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
@@ -2213,6 +2555,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
 
+free_hdcp_wq:
+	if (platform->hdcp_workqueue)
+		destroy_workqueue(platform->hdcp_workqueue);
+
 free_platform:
 	kfree(platform);
 
@@ -2228,6 +2574,12 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
+	if (platform->hdcp_workqueue) {
+		cancel_delayed_work(&platform->hdcp_work);
+		flush_workqueue(platform->workqueue);
+		destroy_workqueue(platform->workqueue);
+	}
+
 	if (!platform->pdata.low_power_mode)
 		pm_runtime_put_sync_suspend(&client->dev);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 3d79b6fb13c8..89b1b347a463 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -59,10 +59,23 @@
 
 /***************************************************************/
 /* Register definition of device address 0x70 */
-#define  I2C_ADDR_70_DPTX              0x70
-
-#define SP_TX_LINK_BW_SET_REG 0xA0
-#define SP_TX_LANE_COUNT_SET_REG 0xA1
+#define TX_HDCP_CTRL0			0x01
+#define STORE_AN			BIT(7)
+#define RX_REPEATER			BIT(6)
+#define RE_AUTHEN			BIT(5)
+#define SW_AUTH_OK			BIT(4)
+#define HARD_AUTH_EN			BIT(3)
+#define ENC_EN				BIT(2)
+#define BKSV_SRM_PASS			BIT(1)
+#define KSVLIST_VLD			BIT(0)
+
+#define SP_TX_WAIT_R0_TIME		0x40
+#define SP_TX_WAIT_KSVR_TIME		0x42
+#define SP_TX_SYS_CTRL1_REG		0x80
+#define HDCP2TX_FW_EN			BIT(4)
+
+#define SP_TX_LINK_BW_SET_REG		0xA0
+#define SP_TX_LANE_COUNT_SET_REG	0xA1
 
 #define M_VID_0 0xC0
 #define M_VID_1 0xC1
@@ -71,6 +84,12 @@
 #define N_VID_1 0xC4
 #define N_VID_2 0xC5
 
+#define KEY_START_ADDR			0x9000
+#define KEY_RESERVED			416
+
+#define HDCP14KEY_START_ADDR		(KEY_START_ADDR + KEY_RESERVED)
+#define HDCP14KEY_SIZE			624
+
 /***************************************************************/
 /* Register definition of device address 0x72 */
 #define AUX_RST	0x04
@@ -155,9 +174,43 @@
 
 #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
 
+#define R_BOOT_RETRY		0x00
+#define R_RAM_ADDR_H		0x01
+#define R_RAM_ADDR_L		0x02
+#define R_RAM_LEN_H		0x03
+#define R_RAM_LEN_L		0x04
 #define FLASH_LOAD_STA          0x05
 #define FLASH_LOAD_STA_CHK	BIT(7)
 
+#define R_RAM_CTRL              0x05
+/* bit positions */
+#define FLASH_DONE              BIT(7)
+#define BOOT_LOAD_DONE          BIT(6)
+#define CRC_OK                  BIT(5)
+#define LOAD_DONE               BIT(4)
+#define O_RW_DONE               BIT(3)
+#define FUSE_BUSY               BIT(2)
+#define DECRYPT_EN              BIT(1)
+#define LOAD_START              BIT(0)
+
+#define FLASH_ADDR_HIGH         0x0F
+#define FLASH_ADDR_LOW          0x10
+#define FLASH_LEN_HIGH          0x31
+#define FLASH_LEN_LOW           0x32
+#define R_FLASH_RW_CTRL         0x33
+/* bit positions */
+#define READ_DELAY_SELECT       BIT(7)
+#define GENERAL_INSTRUCTION_EN  BIT(6)
+#define FLASH_ERASE_EN          BIT(5)
+#define RDID_READ_EN            BIT(4)
+#define REMS_READ_EN            BIT(3)
+#define WRITE_STATUS_EN         BIT(2)
+#define FLASH_READ              BIT(1)
+#define FLASH_WRITE             BIT(0)
+
+#define FLASH_BUF_BASE_ADDR     0x60
+#define FLASH_BUF_LEN           0x20
+
 #define  XTAL_FRQ_SEL    0x3F
 /* bit field positions */
 #define  XTAL_FRQ_SEL_POS    5
@@ -392,21 +445,29 @@ struct anx7625_data {
 	struct platform_device *audio_pdev;
 	int hpd_status;
 	int hpd_high_cnt;
+	int dp_en;
+	int hdcp_cp;
 	/* Lock for work queue */
 	struct mutex lock;
 	struct i2c_client *client;
 	struct anx7625_i2c_client i2c;
 	struct i2c_client *last_client;
+	struct timer_list hdcp_timer;
 	struct s_edid_data slimport_edid_p;
 	struct device *codec_dev;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct work_struct work;
 	struct workqueue_struct *workqueue;
+	struct delayed_work hdcp_work;
+	struct workqueue_struct *hdcp_workqueue;
+	/* Lock for hdcp work queue */
+	struct mutex hdcp_wq_lock;
 	char edid_block;
 	struct display_timing dt;
 	u8 display_timing_valid;
 	struct drm_bridge bridge;
 	u8 bridge_attached;
+	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 };
 
-- 
2.25.1

