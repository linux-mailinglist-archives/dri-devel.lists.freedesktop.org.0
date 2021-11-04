Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2134444DCE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 04:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017B26EB0E;
	Thu,  4 Nov 2021 03:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2113.outbound.protection.outlook.com [40.107.102.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09AC6EB0E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 03:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZIXxSVU2V6X0ZgKMbMGIlgNZM9uBNRMTWFh93br3rs6pTh8wZYpmljchUDuuyvwg9e3Jf954Mq0pLAY57hM3TsIgwa0nhHWWVIoZZF/SvtMXfHRb3IsIrC5/cm/WgQGD/WSuvE8W85k2DRw7sJByNBlTFqHqBNH1w6weOcx9WakG8rfJQ189ovM2rQKh3UiH42lGAEsTPwFKc5DkPO9ezy4T0yk8RvyYPQyrUKbQLd3OjjaMWjElyHu4EvPrP8a6gOLE4GoolNVcQos6Ncf0IvyOzcVWqOhuNZ7yW9UOAndtZ7I0xTEpXR7J1A0IjNqfgDmPVsfw/iDZEJYls4xHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYNY39O8VLKh8ppmxcKEQPNG5TJTHSK2MBe5xAk3SZg=;
 b=Y+srRr7y/SYv6Pr2RvUN9QI9C7hdVXRpqx0XYdrUOB+oJQ7ImTBqOAzeGiZya+mKz9J4vHoorNMwiKqtXViISx89pIT8lN03JlDOdoGP0MooBmeqvzRItDvh5AGndQFGXtwQstuFJvVcX4MwU+/+kQWW/B2Qw9BKgQpsq2futJ2VbvTxEjyq1r9arIuY1LlgnAGoo4J5GwfLoz2+PlYfNgSsUJkwtx0pAp86DqM+LmdTCAMLfN4oV9fPl40NmEJ57H6GQCa1p0+8Bk4YwQwt3b05FkgtPjWAa9sF51+ke1rzb1uUZFBWpzlfJhXFIsAEDyaK83jmISYZ7ZTn4Z+eXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYNY39O8VLKh8ppmxcKEQPNG5TJTHSK2MBe5xAk3SZg=;
 b=RYALy8QtGVDUmRVDDL/Vq7/V+Dxw6F7Yb+xXkdJUJH9ecuVBU9tQMisK8ADT6LpGBRBvtgGIDBoN028PKwIVcIy46FgKqWZDTtfbY4BF3XmRD9GBkIONCrMUoc7Eer4Zjff0o9JaffrzPhWpHS9oTrXrVeP9LLcCSK/V/iCAbDg=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4741.namprd04.prod.outlook.com (2603:10b6:a03:12::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 03:39:05 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 03:39:05 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v12 4/4] drm/bridge: anx7625: add HDMI audio function
Date: Thu,  4 Nov 2021 11:38:57 +0800
Message-Id: <20211104033857.2634562-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 03:39:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d10c461-4496-45e1-7f13-08d99f44a6aa
X-MS-TrafficTypeDiagnostic: BYAPR04MB4741:
X-Microsoft-Antispam-PRVS: <BYAPR04MB47417C474110ABBA24DAF713C78D9@BYAPR04MB4741.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CE1PVt1010X4t0KBQWaPF1x9RtBhIVlset+4A98IKYPD1SYLvZmXWIATgTQcan4doDdufB6b0EvKdc+Dcxs52I2ZK/NkClMhQbMKDaXkVZVV/h1pY6dWFC3xkK6OmqzcrHNUf/AwYzG4TkhGttAmp9we53VKGXIhFUUENk3Kxcl3+zrN2/FWZf/nVS8ZGd5ZaXNbz/JRh6O8GagenV32uADb5nn+p8KYyjxPQ4Tk9WXCKu4U/3ZHavHs7JQfeGa4nXW5Zjmeoolpg+a0QSmZOQDuobpQUixDcdILV2XL4ltcVu8OCVQdoDwMaZIx9/otdKvMXv4gJyanofjtnp+2mh4917wWzIdWMd1Jt295QCSV8SDpStxhkqV04b41HHjeSFc6jJpLqDbi3g87hq+exGk/nGxRSL2iVU8VKSp7KEoVLKcB0YT3cnLkIjGMO9D5zboV52COf4omkyRFkll10CxK/BNsfqvV8rB2pNNa89dcQ5LXx/4DTMWDPJoGuKirLjgTw+OzGAJbCKovn0lXYMn9yD/KZyirwNbcese4FJdAWsTEF+MmjXL/Nc3rFHQ3vYCRLOKfrkH4xyBLDpOzcHOcepVpFX3S27nD5hY4Tt37hq6gEBmc0Z/w0iPTn+nRcpkze6Mq2NmDFydnenKjjk/gXpAJYIVmyp2hOcKAeam+KG+kgf9xKgQXJhzn9rFFHB9yJNZTMtGK1wVYP/AClFhhhWPQP0qpOeVQXawutUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(1076003)(66556008)(8676002)(921005)(8936002)(316002)(6486002)(6496006)(38350700002)(508600001)(66476007)(52116002)(107886003)(36756003)(83380400001)(86362001)(26005)(38100700002)(7416002)(186003)(5660300002)(66946007)(55236004)(956004)(2616005)(6666004)(6636002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6etj0HtNRw5opDwqurxeGHBEPwK7HNhyRFOLfB+MVMNvKRo1l8BsUrGylvuQ?=
 =?us-ascii?Q?lsts49ku4nG8ue8XC5MXb6ujPpSvXD6EGN/Fri2IoHKr+JzxfztpilRHT5Ll?=
 =?us-ascii?Q?PTkwEwneMRnqFDdEgZ0W6p/co0MA6ulVawOQPwusWmT4+942qs/Q8e7v/9tw?=
 =?us-ascii?Q?Y2RRGZoRlYfWLsHba5/auLpSDDRXco2lXhsurN5CbEzYKNHftSLHZVFYCioX?=
 =?us-ascii?Q?0OcpkQOzNKD4OU0Z6pw3lXLGx3CnxPm7USrQBjMvDVebTlrGdUg24ud09kv2?=
 =?us-ascii?Q?7ELvAfayM/X8Sq7f89fGkQ4SF5aV7m+Ki4TafSoB7PaSHPrKVh9Lb6TIKMjF?=
 =?us-ascii?Q?TjnnOpklcJGwYXJZbDVMOi0kqAd0UbdzOeJQkaZC+QNpNxVULwMaawrN+hij?=
 =?us-ascii?Q?ueaikjNm1fy04S5ygqZBMV4gajNIxeX2X/LY3c3g2A1+3kjHiFsHIa7k+vLk?=
 =?us-ascii?Q?AkkwPezVMihK71vsggxYxELgGQZ7jX88Lxi+pFkn4ymA2imBwfQgH2qCNaBB?=
 =?us-ascii?Q?NzTMRVNCau9ysLg6R9Iyu6SN4z7WW99KfaUjjq+ETC22PZJcIv004nUrINi2?=
 =?us-ascii?Q?WUe31T/6G+3zG9S/B7uNRTULmsT089tHERQ0klO1WqtStUPEjTkc9X910frl?=
 =?us-ascii?Q?erqaOy0ELGWl4KuqMU3QYTxMSkANJODk/bxRIKR/3bfFd90oEPBfyvc/xaw+?=
 =?us-ascii?Q?P2ClATDxwhKM3zZZOxHcmVAMzxsDnmNaPv62pySFy7lDvLKWrA803+cXzPGZ?=
 =?us-ascii?Q?CJ48OlS8hshDdlUDzOTDBsOGcibglX1wKy/VXk+FWRWxX0wHKl3roA1SCfhc?=
 =?us-ascii?Q?Vu2IHbnKGFJXXBEr5HX5UQaauWyPDSwLFKflszf4gdf9gIIZwDdViMqtym81?=
 =?us-ascii?Q?XlnhYdx9fIAxNUMdPRFktPlD9x0ATW1rVgO9XeTLZvmhR4JtKp5i/VSJwz8A?=
 =?us-ascii?Q?MqogDUNFqn4qHkTZ/5c/teLuG99a/LzlnfU63iVy+78IXb+OfgU7DTsi4F+y?=
 =?us-ascii?Q?FD1cFSDianX1IbUHR6z5YT7qxBfCOmgljogW01psdUUo6ze+1vLFIsGt1dLg?=
 =?us-ascii?Q?Tp5vf8AyO/j0ickvpZBfIkaYqa809UQZWCaUvNgbXaLjWDdl1HCVQzMHfpOK?=
 =?us-ascii?Q?M6Yi4RCgBH9jglvdcptIytZf2TIgpI7a4k3Zv4Rt3VJiX1WszVdE6OR0Ud8y?=
 =?us-ascii?Q?VwQT+5JBKZYtA8X4dxwc8jiPdLT7yiJm9VtCQiv97QNHBGhFEj3fDqzUa5Y4?=
 =?us-ascii?Q?16+VUxmRKkmU3m8/3mmhBB0psYJk8LUp36YGamExHezliG12sRF+6dz5YOkT?=
 =?us-ascii?Q?o+zgxh64g4nOGqUlj1z+XhHXGfMSuHe8rzP659RnTO/39TLdJLvZjhqoQ9t9?=
 =?us-ascii?Q?jWgZv0wklx/4h+zu0e1LXRHet5xy0TMpul/1A7wbubWyhTKzxA95xnMYE+uv?=
 =?us-ascii?Q?AEnbK2rhkGPXMyhkAD+mT20/4MP1zzlU9/8q6aC83NnajBYLIPLwdrna4+S/?=
 =?us-ascii?Q?Yg5uKLFtmD8aiB2Ro17FSNtrEe/7xgm2rDMl2YQ8eTAEITVyYKOmksesyTl3?=
 =?us-ascii?Q?R1etyMZ5PtWd8BbeMdqzLUS8sv6tDXRpsUShSQA7K6eE1cfXygzYe3lrhmPV?=
 =?us-ascii?Q?seUzAMQeWLSNtMxuE5WLa7I=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d10c461-4496-45e1-7f13-08d99f44a6aa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 03:39:05.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMxeJeT474U1MOBQwHTXCI6kPyJxjtM5Zmol3Dx+46KzHsnw2DduQncscaVskTPXnFDNIt/z8OYjnr9Ejrl4oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
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

Add audio HDMI codec function support, enable it through device true
flag "analogix,audio-enable".

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 226 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |   5 +
 2 files changed, 231 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index f7c3386c8929..001fb39d9919 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -33,6 +33,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include <media/v4l2-fwnode.h>
+#include <sound/hdmi-codec.h>
 #include <video/display_timing.h>
 
 #include "anx7625.h"
@@ -153,6 +154,20 @@ static int anx7625_write_and(struct anx7625_data *ctx,
 	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
 }
 
+static int anx7625_write_and_or(struct anx7625_data *ctx,
+				struct i2c_client *client,
+				u8 offset, u8 and_mask, u8 or_mask)
+{
+	int val;
+
+	val = anx7625_reg_read(ctx, client, offset);
+	if (val < 0)
+		return val;
+
+	return anx7625_reg_write(ctx, client,
+				 offset, (val & and_mask) | (or_mask));
+}
+
 static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
 {
 	int i, ret;
@@ -1353,6 +1368,9 @@ static int anx7625_parse_dt(struct device *dev,
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
+	if (of_property_read_bool(np, "analogix,audio-enable"))
+		pdata->audio_en = 1;
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1423,6 +1441,208 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 				     connector_status_disconnected;
 }
 
+static int anx7625_audio_hw_params(struct device *dev, void *data,
+				   struct hdmi_codec_daifmt *fmt,
+				   struct hdmi_codec_params *params)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+	int wl, ch, rate;
+	int ret = 0;
+
+	if (fmt->fmt != HDMI_DSP_A) {
+		DRM_DEV_ERROR(dev, "only supports DSP_A\n");
+		return -EINVAL;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "setting %d Hz, %d bit, %d channels\n",
+			     params->sample_rate, params->sample_width,
+			     params->cea.channels);
+
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+				    AUDIO_CHANNEL_STATUS_6,
+				    ~I2S_SLAVE_MODE,
+				    TDM_SLAVE_MODE);
+
+	/* Word length */
+	switch (params->sample_width) {
+	case 16:
+		wl = AUDIO_W_LEN_16_20MAX;
+		break;
+	case 18:
+		wl = AUDIO_W_LEN_18_20MAX;
+		break;
+	case 20:
+		wl = AUDIO_W_LEN_20_20MAX;
+		break;
+	case 24:
+		wl = AUDIO_W_LEN_24_24MAX;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
+				     params->sample_width);
+		return -EINVAL;
+	}
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+				    AUDIO_CHANNEL_STATUS_5,
+				    0xf0, wl);
+
+	/* Channel num */
+	switch (params->cea.channels) {
+	case 2:
+		ch = I2S_CH_2;
+		break;
+	case 4:
+		ch = TDM_CH_4;
+		break;
+	case 6:
+		ch = TDM_CH_6;
+		break;
+	case 8:
+		ch = TDM_CH_8;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
+				     params->cea.channels);
+		return -EINVAL;
+	}
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+			       AUDIO_CHANNEL_STATUS_6, 0x1f, ch << 5);
+	if (ch > I2S_CH_2)
+		ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
+				AUDIO_CHANNEL_STATUS_6, AUDIO_LAYOUT);
+	else
+		ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
+				AUDIO_CHANNEL_STATUS_6, ~AUDIO_LAYOUT);
+
+	/* FS */
+	switch (params->sample_rate) {
+	case 32000:
+		rate = AUDIO_FS_32K;
+		break;
+	case 44100:
+		rate = AUDIO_FS_441K;
+		break;
+	case 48000:
+		rate = AUDIO_FS_48K;
+		break;
+	case 88200:
+		rate = AUDIO_FS_882K;
+		break;
+	case 96000:
+		rate = AUDIO_FS_96K;
+		break;
+	case 176400:
+		rate = AUDIO_FS_1764K;
+		break;
+	case 192000:
+		rate = AUDIO_FS_192K;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "sample rate: %d not support",
+				     params->sample_rate);
+		return -EINVAL;
+	}
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+				    AUDIO_CHANNEL_STATUS_4,
+				    0xf0, rate);
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+				AP_AV_STATUS, AP_AUDIO_CHG);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : config audio.\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void anx7625_audio_shutdown(struct device *dev, void *data)
+{
+	DRM_DEV_DEBUG_DRIVER(dev, "stop audio\n");
+}
+
+static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
+				       struct device_node *endpoint)
+{
+	struct of_endpoint of_ep;
+	int ret;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * HDMI sound should be located at external DPI port
+	 * Didn't have good way to check where is internal(DSI)
+	 * or external(DPI) bridge
+	 */
+	return 0;
+}
+
+static void
+anx7625_audio_update_connector_status(struct anx7625_data *ctx,
+				      enum drm_connector_status status)
+{
+	if (ctx->plugged_cb && ctx->codec_dev) {
+		ctx->plugged_cb(ctx->codec_dev,
+				status == connector_status_connected);
+	}
+}
+
+static int anx7625_audio_hook_plugged_cb(struct device *dev, void *data,
+					 hdmi_codec_plugged_cb fn,
+					 struct device *codec_dev)
+{
+	struct anx7625_data *ctx = data;
+
+	ctx->plugged_cb = fn;
+	ctx->codec_dev = codec_dev;
+	anx7625_audio_update_connector_status(ctx, anx7625_sink_detect(ctx));
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops anx7625_codec_ops = {
+	.hw_params	= anx7625_audio_hw_params,
+	.audio_shutdown = anx7625_audio_shutdown,
+	.get_dai_id	= anx7625_hdmi_i2s_get_dai_id,
+	.hook_plugged_cb = anx7625_audio_hook_plugged_cb,
+};
+
+static void anx7625_unregister_audio(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+
+	if (ctx->audio_pdev) {
+		platform_device_unregister(ctx->audio_pdev);
+		ctx->audio_pdev = NULL;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "unbound to %s", HDMI_CODEC_DRV_NAME);
+}
+
+static int anx7625_register_audio(struct device *dev, struct anx7625_data *ctx)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &anx7625_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = ctx,
+	};
+
+	ctx->audio_pdev = platform_device_register_data(dev,
+							HDMI_CODEC_DRV_NAME,
+							PLATFORM_DEVID_AUTO,
+							&codec_data,
+							sizeof(codec_data));
+
+	if (IS_ERR(ctx->audio_pdev))
+		return IS_ERR(ctx->audio_pdev);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+
+	return 0;
+}
+
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
 {
 	struct mipi_dsi_device *dsi;
@@ -1974,6 +2194,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		}
 	}
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -2010,6 +2233,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	anx7625_unregister_i2c_dummy_clients(platform);
 
+	if (platform->pdata.audio_en)
+		anx7625_unregister_audio(platform);
+
 	kfree(platform);
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 3ef1d8f4e575..3d79b6fb13c8 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -111,6 +111,7 @@
 #define AUDIO_CHANNEL_STATUS_6 0xd5
 #define TDM_SLAVE_MODE 0x10
 #define I2S_SLAVE_MODE 0x08
+#define AUDIO_LAYOUT   0x01
 
 #define AUDIO_CONTROL_REGISTER 0xe6
 #define TDM_TIMING_MODE 0x08
@@ -367,6 +368,7 @@ struct anx7625_platform_data {
 	int intp_irq;
 	int is_dpi;
 	int mipi_lanes;
+	int audio_en;
 	int dp_lane0_swing_reg_cnt;
 	int lane0_reg_data[DP_TX_SWING_REG_CNT];
 	int dp_lane1_swing_reg_cnt;
@@ -387,6 +389,7 @@ struct anx7625_i2c_client {
 
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
+	struct platform_device *audio_pdev;
 	int hpd_status;
 	int hpd_high_cnt;
 	/* Lock for work queue */
@@ -395,6 +398,8 @@ struct anx7625_data {
 	struct anx7625_i2c_client i2c;
 	struct i2c_client *last_client;
 	struct s_edid_data slimport_edid_p;
+	struct device *codec_dev;
+	hdmi_codec_plugged_cb plugged_cb;
 	struct work_struct work;
 	struct workqueue_struct *workqueue;
 	char edid_block;
-- 
2.25.1

