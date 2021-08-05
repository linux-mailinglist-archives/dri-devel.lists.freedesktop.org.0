Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D903E1393
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CB36E99B;
	Thu,  5 Aug 2021 11:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2130.outbound.protection.outlook.com [40.107.220.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A176E99B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcbTo9vx3OFMIS/SBDFVOvLW7Fkfg4w4owwskClnFledABUdNmpcvHwYMj5tuhYlmi5KrQsMoxoS5hr+sESNtf/cG2d7m+S1uE6czvsHQdEdZooNfnlP0lci69xLnq2iz1M7+hnJTUs4u4AtwylfTH5M0N8CzJywHTRMjU0+mOCrPavmREWY1K/X+Lmk28Mlpcp/ynOccDN/My1Mkg8yXt+WVZssriBSkUycV2z8c5DXKWgQu8JBD6M309PVZiM5J6io9J1LqSjOoPsDftM07pN2Y4XVD939/MC4EYHysSQW1Ot0B3OWKN3lIcRey4rw3gIVU6+bqq9jwZbREfY+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzAKmazeTdRPPEd+gIWSZKEAL5bDvhh4oRnNWRugv6c=;
 b=dRvI+AF5gzRaa2xTvKfICGN0DDB4mGGZY572y63PrtorR5GPmTB8vbiMTKPwuSFDDH8cwfhOyT+vVB/YuWjA9zlkfzPk3ft+WjT8nFcb646Wq7D7wyXAGgELSJuOOUwMm11pUC5tpsQaYHzZuxbyRkgNhk9JYFEweLvugNr24fxJCVbHPfp9J8emuFn+LxQxF74bABXjvneaqnELD0gjKi44mZL9QR6rIouQ2vVRIkDhf0iLTMiWxxMLjw6AfdqMPs6a6zHHtp6rXlZuwKoXj9bBJszVqTQU7a4twmUBP1k1U8o2v8J/ia4HER6A8U3APRgZvy2ud/B2NOo7sJOmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzAKmazeTdRPPEd+gIWSZKEAL5bDvhh4oRnNWRugv6c=;
 b=WlGLbsPN/gXJAPFMYIy3JzawM5XVH6jSbdHz3bvMJSVBdzFBC6hXshFm22pYgPaPfofghOmeFps799Oej5/c/602WgYCBJzFi8E54mfcOMXFxLoURQhx8HSegPDuEPBNdpXCPkjPejFEMHR6EhJpvmfTAs7RlJZR2mtuJbvYkT4=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4901.namprd04.prod.outlook.com (2603:10b6:a03:4f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.24; Thu, 5 Aug
 2021 11:10:39 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 11:10:39 +0000
Date: Thu, 5 Aug 2021 19:10:32 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sheng Pan <span@analogixsemi.com>, Bernie Liang <bliang@analogixsemi.com>,
 Zhen Li <zhenli@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v11 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
References: <cover.1628161369.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1628161369.git.xji@analogixsemi.com>
X-ClientProxiedBy: HK2PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:202:2::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0013.apcprd04.prod.outlook.com (2603:1096:202:2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 11:10:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1aeac91-d848-43fa-ea55-08d95801a7f4
X-MS-TrafficTypeDiagnostic: BYAPR04MB4901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4901CCFE7CF80771BC6358D9C7F29@BYAPR04MB4901.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cldcB8N8Azq8O9ZiFnDvTst1pCthN2ISg/VtkCSN2pDg/rACUSdo5Z4xs9lPdBJTo/TVCqjkceHwIvjjTF76RAMSY9bs8UKkWLKl9Og3z8QP8liaSpx6TuBPYY2ImwHpHqlIw5PQ+lVUPeukyjvMNgRszl8urUgJBSUKSwYZrRMGzXrUmVBxl8+VCsEnQXTXOjBoPkeOLz4x3fc2WS12F8JPUILlMAkvmpQ7Xg54ka8aD87ons6ZMQDfgukqLan4AGn0d4uOm7GttWyzm6ddq5QapK6sFzg0EUOAp7748IzW23hdsOzCFA8rXqZP2ZmrgJBwQugyfjO5+L2icBvhEfMu4jsXAhJ0nsapicsrhhqTwrJsGp3aDqPhbzGHoWiahCUB0EOXVKDzcaEBws9MuhwxT+MyXCwlzFtbLYg6dgZkGHBslPH32T/RDzKEmwOBv18Rt7MnpmoUK0utj0B0FW83bpepG1thtiMVK+G33sEyFhRfXc6FzxDfBFr3yFRQIcdAtHYn5Sa4h1Gu8crsHa7cZv1jGGxrPRz9LZrnOc5Qc8jA5cf4Uc/Syexr9wDw+SY9X+4YbfMd48OFzlEydeoWQHUDzKOYpLopayGlDvABmOSNS6BWec+dzFQgBB2S4q3739EkakgIluUeecbDqNqBRnInz192thtGpGZiXoFRDRWV4a92FPS4wDvYW5F9a1YUSWpZRzQ3nHO7dYs16g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(396003)(366004)(39850400004)(86362001)(4326008)(36756003)(2616005)(26005)(55236004)(6486002)(956004)(38100700002)(38350700002)(52116002)(83380400001)(6496006)(54906003)(8676002)(2906002)(8936002)(5660300002)(316002)(66556008)(7416002)(6666004)(478600001)(186003)(66476007)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RdtUEkWYqaVYNLHgIWaVJ6SHhyq3sQ0erUQiEGKrj8C9OI+Ptnt/pVqyTynh?=
 =?us-ascii?Q?OKNbw0gRyNQNGDCcUKFRXydEvT9wShxDNGK1sCKFMRuUNBh6+3JIalfcoAkj?=
 =?us-ascii?Q?0TcbLalyy2UEoKmWZYyVf9jkmq4tCyf52D6PNSa9cYCoP5sPAW0krsdc5k2s?=
 =?us-ascii?Q?yhH/TPmypUV0k1o9BxGRxKEE2SLQcaFYTZK+l6cWbjooi+WShdA3fglzRtBK?=
 =?us-ascii?Q?4UYmfX8t8IoQ1dUnm5SPkeeevPRWY+j7n+xIxVAIdSfHSPPviLCp+H6WD8lH?=
 =?us-ascii?Q?L+1DKLvql3gYszqSHgWshR4BldHy1tiJa1g3IgOM90M6Mo9a2SLZx08JaEvg?=
 =?us-ascii?Q?kqBn3yPoUphed/6wDRWdmRXGMJXoBDGz7wbQzourPwObZpxVBLTUB1lK9sz1?=
 =?us-ascii?Q?OX3FU3KKYDAOiCtiQMeKjcwrvSa+fEBe5x9zNpRNCoMKjVGUBuvMlYA1ZmyE?=
 =?us-ascii?Q?KpLXe3mjW+7x3DcuBzrgnC9AfJ9l7eSOog4X4ieTIk435I1+LX4r1Zvdty9k?=
 =?us-ascii?Q?1PEyoNk/sji2QwscxwL9DCIMF5sjdKhiNy/lQH4RMecfHNEVFpYimnXfai7B?=
 =?us-ascii?Q?kbu2SJ8n393CWcH44+dKvg1MiYnCN9WZEIzomwM9nqohKZGlPVhIPxgRMs6k?=
 =?us-ascii?Q?kVy+/x+rwNQxNOtAGcFEwOZ8WDNzVPZiA2ks/egw29u/ZAztjl9E3zJ1bZWQ?=
 =?us-ascii?Q?HTWdGsx6+ulZ54OAIMdy4t713CVZhEsMXph+WAgDn2j599SmtyiGqtjJZjbs?=
 =?us-ascii?Q?ZUBKMRZ4OIOD5/5AU33Y5UWKL73X6besdrlSdE5roX9dwyAMwTBEVuxnFKEv?=
 =?us-ascii?Q?BNNlhNVxZlMFTQ0Ci3Sc7f0fLpVuV0tVZJjUPdxNqu/sq4qqFJ02RpMKQSyF?=
 =?us-ascii?Q?ZJuifJcRBd51t9OdkbynUnX1b42kDtmVSxO4MSsqHaFpaKPtHsYbZPMwnElA?=
 =?us-ascii?Q?st/+wEvN1LO9i8tksezKA+SLWtwOZ0pdIXlefCnh3Yg1N/cONkVV0RF5r75q?=
 =?us-ascii?Q?qHRcUS1Vn3zoyfxZ4c99/EORsB/dJ6KeDPMY9PKQ79pz2dm0lkW6VhflR/nl?=
 =?us-ascii?Q?KASGHOeHYfcDMa404wkIANpLz2QnIIc5ZwzkfPEaYM7crqaiZnSV0xtSTsZt?=
 =?us-ascii?Q?9xynPqpN7hb0XgZpKXLaVTbZSgGA+7Ipvi5unZGTC+EIKgL9ssxNg2lv/yqT?=
 =?us-ascii?Q?VU7qVbQOx6QQzdY+dMVEOunn9Nym+kM1A0mMOdl/wWoXzkPgIVWyxtop8PHk?=
 =?us-ascii?Q?gmLTCpI9T61tA2rj8N/RIMtvlv0eQwPNxGwjMU+YdRpRSMFMT5lpQXlMDxFi?=
 =?us-ascii?Q?LrU/0QesOB6SJ+HCYxMs5req?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1aeac91-d848-43fa-ea55-08d95801a7f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 11:10:38.7724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TE+XQv0FjEO3mW9jAQeD5fOnkwz7GpMzdwk6GaLWx/qWouHW2LuX71UTHErxUDzJ5HpzoQDeOZTeheGPyyK+zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4901
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

