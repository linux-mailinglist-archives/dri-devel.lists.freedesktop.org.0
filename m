Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAC3B049B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BAA89E15;
	Tue, 22 Jun 2021 12:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2096.outbound.protection.outlook.com [40.107.244.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E24A89BFF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIrCwwYkiufUUMWCr3clflWDiL8TE/S39JPFQHyHQR2zAXo01fHUYdE7pWKT0+UAsCWY/HLFN940XnApyd+WBO93NMTDK9dorM2AxiKmPE6VE3eudSzSI6r/V13Yjl9mLP5Kq98BHjGgXyZ+Gslr9fsjECaHiHpIXKB5AXE5bnliWuWntK+gU8RUW5M174FldFR4AAtmV1k0xp3hjyIvhPJEiDKllnyaEH/a/4ZVCpE8+5Ttr+ZXV3cN8YHuE6m/ejlMDyPGLQk/ky2BdknL7JpI6DIhQu7MmgZVLHh4BZaBsPRv1JQvJs5tl38aopRxnJt1jHnC//j3A6gInqMTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzAKmazeTdRPPEd+gIWSZKEAL5bDvhh4oRnNWRugv6c=;
 b=f6aA2USALOiZ8ZwLa2ma47p613HkYJcUJ8CdX/8luJYbeH6pd4jskUc3rdKBHSyXxTYY1kGLkfzAfhSbJUkyecMJ7ADYIQ1xT0Eg3gPCt6a5ljzpYXKe5PoBj0aK/IJNF8QQCeKbGhXDOZyq+050+smG3xzHMGxplD41ULAoAEfmxK4kmBsloLQcHI6hk8F8ICS81NOR5k08gjeTTbdxFTaNOzjL5kjckVg3YAb0apCzSEVSwF9IQk1fmwcjuCrhHqhd+RePu4sIUActI0CX7/VI1xTRHQhxt0r3xWnXcqSLGrIeDy4z2g1HehrcxDy3MLwWU/vewOFAeHsYsLjR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzAKmazeTdRPPEd+gIWSZKEAL5bDvhh4oRnNWRugv6c=;
 b=mW0CNpjsutDq/SNU/RgGKC4YoyqiwsmlpD6+A169iWOhsjM+b6BMcbYJBKHVNEUf+Ycdh294XjRyHKPFI0Hv7nS5fN7nlJ2gzvWr9lsi1Ki4kje54h4VwVMBVROpxRnYYj9I+RnLhmJdeIuydVjWM4Aql6AynKG2xq09Id76Idk=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6785.namprd04.prod.outlook.com (2603:10b6:a03:218::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 12:33:26 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 12:33:26 +0000
Date: Tue, 22 Jun 2021 20:33:12 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v9 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <6a6fb67dff0bb0ca57143bd6731edff6b11d2813.1624349480.git.xji@analogixsemi.com>
References: <cover.1624349479.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624349479.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: TYAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:404:15::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 TYAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:404:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 12:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dd79ac1-efde-48c9-d768-08d93579eead
X-MS-TrafficTypeDiagnostic: BY5PR04MB6785:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB67853041620A10CA861E7847C7099@BY5PR04MB6785.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ipenNiCUSjcty7TyLD8N6rjV3rIe7osRh9duXaxS8UDmRraJ/jxF9uIaZ1QnfLclRITMHsT5nmsP0VOD3fT4xg3n8P6bUNXgbg8kjT3/24aKfENB54xpgN+cbbrj/gfrv4ZxTSSGBE0w5Ci3EC7j54h7qMw8jqGGnmzelTb9crqevU7tVJ1yBWMCl0ax5rOIBCp1QV5qDzdx0jtjlr1uYTL2rCkncFT3t+kWbbnS09f/vpdq71UPiSVLs7fJl5UvLhkNr0rKwgiaLTp9ZcACd3TIuB9qZlDE3vrtFcLCRqdyXMf7vkBEp1rGCF+bl20Jl6Q23wtI7tp3WHwFPjxaaX9gKUbv3omgRyVpERUxOfuEv08eeRXMemnFuwlO3e3HwtY9uMHmAMXBHJU6mfDQ7USdBCgUN6uRGCYHADVy1DAfpoihZ0ZuXMBeeivuVCQEUZ7xWL5FdxLlwxWaNH2f+5eOQoam7FAwM8rBFoki+hhcjeJdeYX8NSFVUx4/88Isa72pU2hz85p3JKpzVkv/px14JVDbb6GNQv65EJ8sFeSixXwyGOU4Hmcwx0NVbflYiBvDDdGZTmSINL8aQF0zHJRwC/Ivh2/cfCXRmVTu6hwA1NV52HlI1EED53R8/0h3MbkzmXmKWmqURxF6b4o7bX91PNK83TODtNljtr289twHua5DkH/M5tGEpHy9W1NOgmjQAzJReq6EEhem7Uxqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(376002)(39850400004)(366004)(86362001)(7416002)(66556008)(2616005)(16526019)(66946007)(2906002)(4326008)(6666004)(956004)(36756003)(66476007)(55236004)(26005)(38350700002)(83380400001)(38100700002)(186003)(6486002)(110136005)(8676002)(52116002)(316002)(5660300002)(54906003)(478600001)(8936002)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qu4Q+4CDdN2BY3Q9n2MTlI5RyVusISBEhJ+87rupoB0Zj+0nn2ijCxh5bHQ9?=
 =?us-ascii?Q?nYYSGYwhDSVQ6nb5BD0ylYI3nlzDJgOaXY+va/Ix3hQD3cZuF+iPDFoVDgmh?=
 =?us-ascii?Q?WY7WVqY79Jvemam8iJSTUTj+CH0fRwtVLaVrP2g5YSUoQfAB6fXKyQTcbzPU?=
 =?us-ascii?Q?z5IAcQC058mV/nPiKW3eIiIney29LshD4z2hmmTFw8QGkiHM2bhyuBbXaUt3?=
 =?us-ascii?Q?KcjUw5ncnyb6CWHG7q9fxcn5ad9h0F017/QNQCjVAznf93yfkLryAR0hg9W7?=
 =?us-ascii?Q?1BJ7yR8o3WVpJqgDuJL+fEnWj+r+vnqSlmHKtjJDsbb4OsweKV5CRfbQghf1?=
 =?us-ascii?Q?VWWSGQg7buvu5OFS8qVbdhDQFl8xzPWpoGR1r5dfMdu18/8J0gP0aNcpmGa+?=
 =?us-ascii?Q?ddkDf3MDZaqBYeRWl37EiFrqZJ1bxBEZFWOgGBO3ZltmsFlxLaNbkoM/O0oD?=
 =?us-ascii?Q?/+EzSpaVlgleVhU71vuAeQLxyxpmoSCuNGD57zoh8xuSevJE4Ry1lhvg2WvJ?=
 =?us-ascii?Q?wXBav4H1fsoH0GjVL73920a5kiSVok54MOrVsEs+n9Jowqqc5AQMVRnTz/bz?=
 =?us-ascii?Q?+TdMoG7rAM6szefxBMyTUXOGgzYLMKJ4qGIK3JRrXwMwqZIW+2USe1Blv0Se?=
 =?us-ascii?Q?x4FGJyAsS2EbPkqKo+8yAy35u2v44qTMFVxecGrDbN4hRy/oTqY7dUDhJeha?=
 =?us-ascii?Q?KU72RArucL2OIwzTgU3wcmvWr1sHPDK6FNJJxrDRd8w5HUrgfM/deSa/JUgJ?=
 =?us-ascii?Q?fS3kXDjiKGyJX5UvWAZ74FdyHLG1OO1HSfZyT84i6i6kACVIDg/9HPIFv4cY?=
 =?us-ascii?Q?As0GlaViAg1y3S70MA82Nj5FM0XQbkPKlJzHcvBHRwE1vFjhjFXgfyzVxrDN?=
 =?us-ascii?Q?exyAb2nXrlJQhf4/WO8c81FNMdsgOBjXwFfVV+GacyVSVSUMqEQcCkOicbQE?=
 =?us-ascii?Q?e1Q5nUiSbtDilZozAy2u1RVRTY+WPDHc9C1vSw2O1QjTm8ps5uD2FLogFUQJ?=
 =?us-ascii?Q?GqBjq+QrW/SiZm8PPdGPZSMX8YTn041FJBIvtzis/QUHWzq+Y9ElIh0+mtEP?=
 =?us-ascii?Q?AucHBAymIPq1uLsddGc7DWrQ252Qu2Bz673gX8CUsoSULozqvTLIBmNmw5fJ?=
 =?us-ascii?Q?58umH3vG1CcvnwCuHztbfw4cLdzGtFJxUrf/ljou92mK4A+S8daktxUNUpE/?=
 =?us-ascii?Q?IwemJNJhSGuFWa2AFHFhv72ty5x93IoX2Hrd9+wsavpTWbxKO72wX8GcrQj9?=
 =?us-ascii?Q?+PB5IUQOZrgXVpXajFXIBGDK8ClwHXMGmOVYukhCKXUR6DbMR8tud9Bg6hgk?=
 =?us-ascii?Q?fhWKXQ0rxiReYKfN304w39Q1?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd79ac1-efde-48c9-d768-08d93579eead
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 12:33:26.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4FXHlwPjMr09kgANz8j0dTAzf2FCdHBw9t8R9zI2udtpMRVI3j4DptPHQGneRsybN6fALjqv+tZYDpksXLZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6785
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
Cc: devel@driverdev.osuosl.org, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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
index a5a20cc0f3e0..44ab0893f600 100644
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
@@ -1325,6 +1340,9 @@ static int anx7625_parse_dt(struct device *dev,
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
+	if (of_property_read_bool(np, "analogix,audio-enable"))
+		pdata->audio_en = 1;
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1395,6 +1413,208 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
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
@@ -1959,6 +2179,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&platform->bridge);
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -1987,6 +2210,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	anx7625_unregister_i2c_dummy_clients(platform);
 
+	if (platform->pdata.audio_en)
+		anx7625_unregister_audio(platform);
+
 	kfree(platform);
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 65db38e5da9a..a9bdf05a1f66 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -111,6 +111,7 @@
 #define AUDIO_CHANNEL_STATUS_6 0xd5
 #define TDM_SLAVE_MODE 0x10
 #define I2S_SLAVE_MODE 0x08
+#define AUDIO_LAYOUT   0x01
 
 #define AUDIO_CONTROL_REGISTER 0xe6
 #define TDM_TIMING_MODE 0x08
@@ -365,6 +366,7 @@ struct anx7625_platform_data {
 	int intp_irq;
 	int is_dpi;
 	int mipi_lanes;
+	int audio_en;
 	int dp_lane0_swing_reg_cnt;
 	int lane0_reg_data[DP_TX_SWING_REG_CNT];
 	int dp_lane1_swing_reg_cnt;
@@ -385,6 +387,7 @@ struct anx7625_i2c_client {
 
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
+	struct platform_device *audio_pdev;
 	int hpd_status;
 	int hpd_high_cnt;
 	/* Lock for work queue */
@@ -393,6 +396,8 @@ struct anx7625_data {
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

