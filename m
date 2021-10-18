Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E21430E0D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 05:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7C36E93C;
	Mon, 18 Oct 2021 03:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2137.outbound.protection.outlook.com [40.107.93.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D86E93C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 03:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX5X4EIQNkUbIcMjEGZYveGCe2SsMwIqqyIE/4tZy2kMXqWsoHrs2zJon+B5uLflvgPlcHKQVY69UtzrRKLTuwoBnG6rYte78bEefub9m3dWCppQcWJDlEOVmuIA8YZiUucxeNwVvbURw/Zicr+vP/dRj2/0f+ovmYFiXuZjUd5AKt1u+BDtIZXMFkjEQDHt+W+dGelJls9Z6FzZOap/PDS3VWsEIkQcGLEsp831Gsc5iqUqhL3j0R5LYCs0eSkXhbr8F/IKKzl4fecRF3GiW8f7CfayYN6nnTvWbLJ1p8sxx/59gqVYFZOin0ZfrJkLtwb98JdjE6VFw5YCll/zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ+3A67ark+GsYXqC8DOMoM8pX35HdPxUpprYPR5uSM=;
 b=egqq02iOyn7WfBeaHPI1cRBYMrmm43BZ/Ro615i6hqKQ7Pyfwx+8vLCwmCQScyyo1mEZKy3DZd+MEJ4Yx0TGB8c1YVB+58g/SEkub7rp3O74tlcMWftPn6X8N1VhomXmaYQPVCKhLaDgDlyrYYgVYSQwedA5BQJ4ku/VzaUSCNpumjYj+qVLYXA4Csr2MmZyEP2iS8aBi2cJi+4dZwtzSzYyDIh9MTF1dZEwQVWA4MmhNDGxBgiutbb73avyBNuYI5yhmH4qUjvHhFE9iA1Y02eBIFFLzfRGxrCFsMw2Nt7cK/ptEEPf2y0stA4m0jSQkUE78yMpiQuXLMsHJ1rGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ+3A67ark+GsYXqC8DOMoM8pX35HdPxUpprYPR5uSM=;
 b=q37ButoPBaAwaZXTlWOByeBQgr4qTAZ6s8AjeHz6/BnoiRIzkGPtmjWlurBWqDxXZLVQ7Q7nrOAgVXEg9J/4l5dbRm1Re0SxKM3gGR7fwKYZOeDQDuxPq44C0hOln60KZitEXclsjoMhsnPuYT4c+Sua+FtxNSJIeNk7iRvsdJ4=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4741.namprd04.prod.outlook.com (2603:10b6:a03:12::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 03:05:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 03:05:37 +0000
From: Xin Ji <xji@analogixsemi.com>
To: xji@analogixsemi.com
Cc: Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com, airlied@linux.ie,
 anarsoul@gmail.com, bliang@analogixsemi.com, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com, daniel@ffwll.ch, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, drinkcat@google.com, duwe@lst.de,
 hsinyi@chromium.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 m.szyprowski@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 sam@ravnborg.org, span@analogixsemi.com, zhenli@analogixsemi.com
Subject: [PATCH v11 4/4] drm/bridge: anx7625: add HDMI audio function
Date: Mon, 18 Oct 2021 11:05:29 +0800
Message-Id: <20211018030529.2055255-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
References: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0127.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::31) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 SG2PR01CA0127.apcprd01.prod.exchangelabs.com (2603:1096:4:40::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Mon, 18 Oct 2021 03:05:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0181789d-966b-4afd-1284-08d991e4285a
X-MS-TrafficTypeDiagnostic: BYAPR04MB4741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB474132066878F654101E2C3CC7BC9@BYAPR04MB4741.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJ8RroHJAtRYW4vnnXTcFwDumP3p5w68wRducmmuoVdVUgEawG5IW0tfQ4Anoop/yUrPFIReRbxsuYlO9mdEGIfNXKX7Lwesc9T10Kr+ctwOFGaa7m/x6Lx3eLE7X+YTQMxknZB5ii5u1OcMSjsy7N9q2KIuKZsVUNux5Fi2ouQKmUsU6vbpFfwz2KWsLDif3iDXm7e6X4KVTezesAGlBDox8uET7uQpQd6UmottpGsRPxqlRokvOzfsZe216Q5+MGwOlSVnhVUwG1CnKc7Rml+ng8e1Kv6SDiJRcVZRBOiOB7kLU5S2Ekrf5w0VT7315oFvmCoNhJWvoCXmc/vlz1negmUqfpqAy9c6yNbbFle+zFaY6+y9gkPvPrZo6B9IrB5Qz155cuibgAhdwiO81WqgMSBzdyE5cOrOjSdpdu7uHlqHeQA6K3YZOlwk0zyg/iGYBU814d6m48zud6szrj1VbnRjg948BMy+T6FvViAhps9DxMFuR0u1I79/tjT1n+ulopBQHZf9BxBjyrgPPe5l8UHqqFgVIKl5C19YNciZZ2juSVNqlLp+enn4dl0TvO+Q5Wfz8Qau5y3rlkxG0lLj0eX+WKJz59dHsDnmtkWLWVrQTphFL6NZJHPzt4cLu4t1RDwqYKyMHO3jVjWyHLsQFymCwzFpRBrFmQLAT+dowyrWBRrFwfWnvXcWZ0BzugIfCCMIFGfTl/1bl2ppaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7416002)(8936002)(186003)(37006003)(2616005)(86362001)(6496006)(6666004)(55236004)(107886003)(36756003)(38350700002)(956004)(508600001)(66556008)(4326008)(316002)(52116002)(66476007)(5660300002)(1076003)(26005)(2906002)(66946007)(34206002)(38100700002)(8676002)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fSSXUm5onC1LMiHWJG//EGaDjxlA8jElNWynHgfSr8w1bqiMEGRSoRwnXjdt?=
 =?us-ascii?Q?4Tl5cVy6zRQDLt0dWFc9i5jUwuVG6yYhSDI4Idg/w+7dlcbdra+hI/tMrHQ/?=
 =?us-ascii?Q?iXY6w63grl+lSguIOi8MI5c6Y1KKJgZ/e9U3pLRlKICLS28UZMFVCkqRvSdW?=
 =?us-ascii?Q?+LJk3JCYIo9F5UKmM8/5N6wvNgU8n0ZVaFMVeQhPfNd82UAttZVCSqvuVt5X?=
 =?us-ascii?Q?t+X4bUbdVybhQCueI9zWKKy/xa7eVizRH2+hZaHdBh6RkO6/1T6vjRdVBl/f?=
 =?us-ascii?Q?68JjixWCN8HRLcw5lpAOZ22fff9DxUchKW6NoQ569LS3ODu6VpLUYStLhyLb?=
 =?us-ascii?Q?NU2tn59S6WxzGfz5RNri3OMmGTJpuLsxFw9mMbpiQx96rCfMIzHOfQbZ8i8t?=
 =?us-ascii?Q?mHtC6xrQrw4NF4fSysp88GPp/+no1ebqBt+p3yBQIHK9/bqor417tRKk5yuy?=
 =?us-ascii?Q?lbCDjwuYdsNV5cSUcA58UgYO6Yd1GUEpYPBb50/wDTB2Gt2bgL134AW/fnVH?=
 =?us-ascii?Q?htDWEFTwr5NaZtRQ4telvyeHIGoQBwhN8By0h+SW8YqPpgjvjM8vE2ndvSlM?=
 =?us-ascii?Q?+kCbi51tnOT2/X51FiY83Sghqd0O+aLGTxc1veo/KbDC8BxQo2BqG6jz5rFy?=
 =?us-ascii?Q?0nGwPw9f3/Plg49f009CJJ4dVGcYVNphc6FBQAdkYodlX+EJiet4/OciZSjm?=
 =?us-ascii?Q?0l0nsndRV27CwaxsYD2yP/9ixLbnXz/I/wfe4lT84YRhYe+J+sa8xS3wVoCp?=
 =?us-ascii?Q?FpF73HlN4mel9Dv0c5UqVdSIFcS4kk6xGAbfCrt7U1nsTmdHu8xdncWnQOBc?=
 =?us-ascii?Q?EbeAl91gs/y//YBHRYy50f/5ZbyaIdKMC1wrSsA2/G39pvrr7EmZX5dabqEm?=
 =?us-ascii?Q?uQzNmHw0IYWSw3dHSKSK6YTmVapmHiSo+4RUNSL2zGJKQaHP5/OMLmjygbPu?=
 =?us-ascii?Q?id9avA1TEQbpPMdAB/IetDHODK08PJXWyamaOnO5WVPlzNR/QACd+dv586Fj?=
 =?us-ascii?Q?DXLRd9B/3GEjfTQpsacjrzW1BX0T8oDuY0SHM7s3Bh9ejS9vqEjSaq3GxJLE?=
 =?us-ascii?Q?vD4QXTVi4JUfg+fbAOe2feKRAsVGcmySKlVEyhOl91uVFeCHA5z2bmnf1ECM?=
 =?us-ascii?Q?DV118wB7GAicpiY4RyTd/r+UQ3GrrvuxmuGB1jx6zOJ3jIlF3vlPVQdnMyh2?=
 =?us-ascii?Q?zYfi4eZLWW1j2dojDCpK4gLUK0gw/WxJBetYY2Kirxp5RrShV+OqNBUg8EYZ?=
 =?us-ascii?Q?aSpmck4+bEc4y3D0zU8R914YrBWZdSOr45QSluRdHVTCYvK/SWPzFxmjzCYw?=
 =?us-ascii?Q?7aT2euQPYomEZfwQkChL/L9s?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0181789d-966b-4afd-1284-08d991e4285a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 03:05:36.9658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYf3cbu5OKrJZFN9IDImCWRwALUTLzzKPN7q78/hDKou5F/3Suu6/oEcVQNtD84Zm7+ivl1qWFWvHi2e7y2Qag==
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
index 92038c4661ff..12e148298ba9 100644
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
@@ -1983,6 +2203,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&platform->bridge);
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -2011,6 +2234,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
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

