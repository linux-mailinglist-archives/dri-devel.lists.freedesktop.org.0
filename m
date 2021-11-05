Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF17C445E88
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04446E154;
	Fri,  5 Nov 2021 03:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2123.outbound.protection.outlook.com [40.107.223.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADA46E154
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvKYqMG12Qh7lUGpnJhcZ4RSdq8ZmDL7ITeBX0GMu8XFl5FQ8vpM366unmnV9ZTQ9Kx6K7+uengOTD/3MuCL6mZtDl0N7WJH83erRXK6tfFKoRSkihPsCiUTWimGj9t/k3VUK9ZbfO6V1CpV6FETd7EpWjhqerqUqZqIK7xNxYCkCjW9YjYq5AGSaqotr9xYrcgJj1jNAWTONfJrxJX0qK9evBDymYplUNFTkrcTbWgpfnurirAKo7H9VX7IwUhWTAWJ36nH0Uy39UJzK7s87GaLDAtHf7lGoaLFWlxjYsQMbfjuzheJskub7aauumwxDV6xXB9jpK4KfUrm9ZT29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYNY39O8VLKh8ppmxcKEQPNG5TJTHSK2MBe5xAk3SZg=;
 b=In5TCXEeFm8ovW2VNY4kWLJ5Po9sWkWazwF38oXrIC1B8mGcILQqRcjbXB5FNNRKXH/isQzkI0SBzUqZExkMxapzD0ZP4dFX2z16h10HmORm+NOCxhtY2FKoY52LDA+wGCME4rQFT2lG/+NAv7qXym74Eo5+4LJrkbHDhNTInUoDJ5eMFgmQxRw/HOTkeykmCBnEI2xLYY4WuRW+xJs0EhtgZ/3BLvXCvVvdz12ERdjWnxq0xR9cnDZPhdaxwTnctIso3jHZywO1AjhNBLaUn4ZPPz2nyJGYi0JNJ5oHvF1sK++Kb5FVRo91HM7oqyyqH7pKLj7DqaIQ2hLbu8a/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYNY39O8VLKh8ppmxcKEQPNG5TJTHSK2MBe5xAk3SZg=;
 b=LPC7PvXq0DcSyc8o8BgWcpajoyt9LRVpiIjGJSHo8OcRVa4HRgDxrgTkbPVwqaKLV15mZSguRO1LlnmB3wcOIpMgSkXzcLdeqROIiM+fXh5rdeJiy0i65wlHUWehOoeeJGW7UPITKIoQF5f28ngt8vMKvZ6wkrZumBwANfLILIs=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6438.namprd04.prod.outlook.com (2603:10b6:a03:1f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 03:19:55 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 03:19:56 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v12 4/4] drm/bridge: anx7625: add HDMI audio function
Date: Fri,  5 Nov 2021 11:19:04 +0800
Message-Id: <20211105031904.2641088-4-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105031904.2641088-1-xji@analogixsemi.com>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR03CA0050.apcprd03.prod.outlook.com (2603:1096:202:17::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.5 via Frontend Transport; Fri, 5 Nov 2021 03:19:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e61764d1-f8ee-434e-0839-08d9a00b23d9
X-MS-TrafficTypeDiagnostic: BY5PR04MB6438:
X-Microsoft-Antispam-PRVS: <BY5PR04MB643866A55CF31DE7FF0E4BA6C78E9@BY5PR04MB6438.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QcsOngyDNXIDGwaKWrkEVGBHvtslt+CPtipa8oTSMvZDvryAe57N3U6mfLNUF4Kx1P32q10v9qfvprpwI6HO+I89UwI3rdy6VVYdvq/N6Yo2ByB/8qzLAcBC3NHVbmyIT/Or/wpuSlB9oFlOFe8EdUzh4XEnmc1sA55+jTitHhAtQxbDPDw/Jzxzbl1ysit/rskj+59gg5jSp+MVAIlFMCgklO3b/VEHtqFECMncdrmQwKzT4gXntj8wUTk7cljATFOSxr4sFTdV0+pzacqzLk/okXiTEI+f/Ifx7VtGp0OxzuIqtOVadp+loCaLQfkgsVYYGsB3QU2wSQlpxGNAco3we2ssIZMVbNt9RDjAWDYQArGIbMylUof805EiSIWkIeek43TGfqLg7pTNjpyRpqX1RpwDOxv4n9mz5euo1aGNPNxqrOqGAePwLwAe2PrN4N58bHh1/OOR6LYHsMcHTBQ7yFtvhghuDm+oMWfQ8baaJVTePDoepj1UvqwnbJeDnXqwBw54PmAqeyKaAgz+k/fX6DBTRIXmZDo06wfYLQ7FoV7m+R9oE/iKRY4AtCKYqjzpidtMRTof6kLrVbUNfB6s5ldhpwdufJJy5tCyDtXc2P26T1bZeEtsdrdZL5WeuW8ahJbvDoj9B+G6UecMpDuSVax7uY6AZl0swmPO78flRvXY6BsXSvvBqGMJtXmU8fhoim16OYMbF2E5VjKm8WFV7uKhsWM9Xc9k1YwnpLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(66556008)(316002)(66476007)(38350700002)(55236004)(66946007)(38100700002)(8936002)(4326008)(7416002)(508600001)(1076003)(6666004)(83380400001)(8676002)(36756003)(86362001)(921005)(26005)(186003)(5660300002)(956004)(107886003)(2616005)(2906002)(52116002)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ph2FFBE7HbHOk6bGa9f8lfd8ohVzEOHHIMc7DdMgC+LJCyFVOpUMbj+6Ew94?=
 =?us-ascii?Q?SH8XjhMPP9bmoPeVVxI6FfuP1mkAoksxqg8oZg84wfOnT16S3PK+IDxtlJrS?=
 =?us-ascii?Q?afUP5mIj0O4HpEubS2+KKEAuzQoXXIac43aI3pfAz4uYDGR0LlRH6wUv9/oA?=
 =?us-ascii?Q?QCr3+izprsky7zPELOeKT8va7cZOKNyzUD0Pkl3Ynz3wAB/RTp4uPhAgL1NQ?=
 =?us-ascii?Q?hrCggUAYKI6ASRgSEnOPtGqGfAJIpkJtkXFBMQosuPVmOD88wn7yymVVDCzq?=
 =?us-ascii?Q?PFctCYrTdpeFJkh6mMLjWxPAi8YoyF6AloKH1EuN4l1kv4bs0PDw/0hQ5bLm?=
 =?us-ascii?Q?lyY6DCJFMgsJ2lZfsk9LxnH8swsxvyHJxmBJvEbxQ8XTYJABxHBTLzeIz0oN?=
 =?us-ascii?Q?y9zaGZwkXYIiEv6480gBlCQr6RoBpcM8GiKYrCJ19LdAhQkF+VCgrkGkkY7P?=
 =?us-ascii?Q?NeuqA2O+atxi8Kj98uLl62SDD9FLL6N8XOR0fdvOe0MuIdwshrWP3AQoDS3A?=
 =?us-ascii?Q?XrTY2fHIRi2i56TM01ZVyYetu5KVvjetXJVpa2n7W7IWwqwZb9jltjww95yP?=
 =?us-ascii?Q?x+ArG3aYHm6vQt7lwneRLCB0+q0tw4YOLSAr++iPOR2fb2DmwkUyXm9D9VIB?=
 =?us-ascii?Q?NXHXyalKNN2TaNUTRKwDWCt1z4Cr6ZPPUtJMaSF01SUs+RVc2CzHqZ7ExolV?=
 =?us-ascii?Q?Thf7ELg3JH9XPIhAH274NyoRfaNNLUgn39YBC2myh0/XbrwkFClPchYek2zs?=
 =?us-ascii?Q?f3s5vRXfgwGRz4UNt+IdbQPPRnAeSzuawuQyytwQBYQvc4LXRToRXVo6XGnZ?=
 =?us-ascii?Q?EO/2jBLsH2rn/Kw0prOT5hX6rJ49ngMu3R2ETRMkQWYilu8HEE8cV1otUBNg?=
 =?us-ascii?Q?SOKmlkzY2d/vaCODotG1n4ldPJxeAIYb5l3wrZ/Q5hGy9LOsB9dt1LH9i1MX?=
 =?us-ascii?Q?PJWtVFY3Z+Z6mABvX74NKrItlivhwtcA8SJGIN98WHt+hVILURCISJg54EBu?=
 =?us-ascii?Q?YGjtyvocP1o/guwPBC3/g8JEyObl+ZHg/u9JhI4KmZTRhNOcp+M/tnRyAGiF?=
 =?us-ascii?Q?Xhrb1C9VbQiCfdGhFXEu5p/RwW1wH9K+LedZ6NDz3kD4dqRbz4TL5hgyN8Ky?=
 =?us-ascii?Q?Nwap9mutSiQL/1qLPH6TdxZFejuvmZg8GdzXOhg28PXfgKL5RAXK+0nwlaeA?=
 =?us-ascii?Q?flagPeH95SQH/58n9PPCj5iFBN/DnaNbPVdw6PHJl/Z61AHvbu5BLDonKg8/?=
 =?us-ascii?Q?+RVnvj6qqPf0+xDGhorBBkfWTbd3XbT8+0j9yqNkK7l9o5/mtp//ngJC7Ez3?=
 =?us-ascii?Q?8qspezA2zxwvS+plK2Vb1VPE5KpbzgMXM98AYr9FvViTDYyuWZRzI+BfWjz4?=
 =?us-ascii?Q?ftHcU2iMjR0L27YYEfZ+dlxhOSXnPmdOpG9r7z/tWH9xSc4VpDEinruFfhbh?=
 =?us-ascii?Q?mqhc5UxPqwV1VZXm2Ppz3k0yMaOGd8iCZFth27nmtVxpCUIVXp0gRd986zsf?=
 =?us-ascii?Q?PPB5kkY39SuFUeCdjdGlJWqUIyxsN1jOPixCxUyF3fZ+Ypz9aHBYo7zYm6Ix?=
 =?us-ascii?Q?KNz8SV9swLRMDR/kIvZJyKWGINx1ap8qCDGpuCSlPUcHgljG2GNmUEB2+FFK?=
 =?us-ascii?Q?1BYDZHZmHOzw750AdQ7BwBg=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61764d1-f8ee-434e-0839-08d9a00b23d9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 03:19:55.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbn/pgH6MCBKMwM5RmY1J2mWhtNdYD5VKRovtej6YYa+yoa8yMRwcRBWM4EDTyfd97/u2cOjA1IVzMLeaV25Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6438
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

