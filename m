Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6361B5020A1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 04:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237CF10E2F7;
	Fri, 15 Apr 2022 02:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C1110E2FE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 02:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkKNmLINe+2J7euduTrxnZnfPPAAvb6sJsAJ4Y2Ye5WY8k8xlD0Z2Bs3LQ526OoIDjTFMJD5W1BKhBHHWkW16jkql1ULACvl/qVkXzkzwBo9ktXyGv+D7miQ0DMCUYf3CuoEzlliX6sbR6mOw0OmGkW4sLOQYU2IS0dhu3JJDShorSt1R4N0mewk6sb8rll68VGp7BQl2BnPy1UkLx/THRJt/tNE9ZJdmjR2TIIBCFfh70XLGqDNc23+smYBC3SHeH5yEXz8huPMtkUdkrWvnpbXOi7ax+6D1sZxm9ZfL/Q07Kzn5ZhkUnHRrK4P13sc7xRgam9z2FFxVoRJf75cWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrU20bF+mQVqWwDSOStpYw2NvS4T7OG8L+C7AKwydEQ=;
 b=ijKBYSd4riTMkB85Y5SXyUIx/uZslmtaoPE7NWejtglQE4sAPiWBtaZ0RIVvgaejTHAGSp09FW8fs6m3w83jE6AFgLqPrwDoUpM30L60oKXTW4pwZeogRAxYQFAUVOb+rx7IWaZwxj0UCpV+BiP/5Jk30GBtKKDw6A01AH/KwpP62PQIbpj7ePHhzfiLZZRThsDIc4Tf4k4OwLtlRp1pqsZg8PojggNFYTkL4IGWT49uCywjphqfuv6U7HvnYFsqTOtuMPoDp44H5z09V8qiqHRS/pdLhlKp1zlZmfDBLjB5E+X3hQ+3SYzyv5FP6RHv48eELKmisYxIbeDyVJKFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrU20bF+mQVqWwDSOStpYw2NvS4T7OG8L+C7AKwydEQ=;
 b=QuPU2dQM0ij8nZdeaDb/qwKiUHkYGyJ+sHD2U2X24Hf9CKLoExkgNPYPXr4ObGLqZUoKPtRsUT0Gqn9xSQFH0c2vWJYfXAdPtXrJzyfs5zFw7TRv1+O9My6MU4WZcahP+ney5TwkpIzaQxUmDTcaywqS6RrDdKNxzOlKe3onqPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 02:43:55 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 02:43:55 +0000
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 2/4] drm: bridge: dw_hdmi: Enable GCP only for Deep Color
Date: Fri, 15 Apr 2022 10:42:48 +0800
Message-Id: <78fa41e4fb3d3d53354034bc221fcf870dbac617.1649989179.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649989179.git.Sandor.yu@nxp.com>
References: <cover.1649989179.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c4b4e44-a86a-4b3f-778b-08da1e89c89d
X-MS-TrafficTypeDiagnostic: DU2PR04MB9132:EE_
X-Microsoft-Antispam-PRVS: <DU2PR04MB91323D8DC12B2406A4142329F4EE9@DU2PR04MB9132.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWCGiZRY9+iisX+UhPEHGo/1Rp+0ZWQ+P2QyYoWT/5LU5l9N/8JcVKNaln+N56oVcqefRp4ixQPZPRDI1h/GF9Pt3UMU9XfMIon9KS753HN9Ea6cv3PgObR6ghGuF9XhGB9Ipolv2ztyQZZoD6nDpZ6OMl6dffMg9Nwa2VSc9tdvl53O2uosBoUncavSJUcgfhVv7nSZLYwbxNZmzurTLuDNajg6JvXStHQHWso5IYfoRdFIrPV2cXwsU09TzaiNax7LyYg+w4g7WV9+ZUGr9gXvHeBp30Zhb+kqO/xwiXsezXpLIIjfTegjAQrgPNo1c8jBzQZEyLdrk7skKQ/3LCC/4lkG8WBtbPJzhGTgiqOhmqeEFqFaWtaIPkR5sMnEA4r68NnRoELWwTQpvw1FG02fGb8MHVLUb7LG+cIjSSNXRXD8uUP859E8idJWMvCuTj1HeVzEblx5LVmiG20eYaY+LDnDeGcgy8caWlyVAzounx+kNzDIwawamask+c9i4f0D3vl+KJpqBnijZWmFE4NEZXCP4v7pVSWLjaXMXqbpCbkKAOrT+3Zv39rjOZIg0sP5Ct3vKjkBiEYS4j+FGZ9t5KvoRA7OYz5HbIYmz2MQaQKkslJkq1ESZlAvw4At4VkKLrlDQzHZMEZ3Yn9o/cYs6Zwo2bCktPuus7eU9D0kmtCP0iPjU5mCI0Anz5n3Z6eRI5xKb/u4IVFox+lkbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6512007)(26005)(2616005)(9686003)(186003)(6506007)(38100700002)(38350700002)(86362001)(66476007)(66556008)(66946007)(4326008)(7416002)(508600001)(8676002)(316002)(5660300002)(6486002)(36756003)(8936002)(52116002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Fcy9m8uAD+9Z4nwifG0KUfPYDis8OCB5iNoGjZwuX401ttiP6anwBXEqTLd?=
 =?us-ascii?Q?GZKHi4op8uh4xxqElVFgE1gB0Jej6Xh94eyqAX7+p8z2dHta36lo+n/gl3sO?=
 =?us-ascii?Q?6M/Hy+1x0AayP8lFLRjfg7jxqCm8pglpQwixpUDcuqcIVGWKZTASxaTydnHq?=
 =?us-ascii?Q?2S/ykaxqbsoVZXJmCvVNgS1aiLHx8w6Dqxw0Yp0bGRM1odqXmFS3W7LQk05i?=
 =?us-ascii?Q?yh4WuSdWG1ApfObDw6eZSpf8i0sKuRkcIoNfUuDbIyq1McDISLUooRW/s7z1?=
 =?us-ascii?Q?SA6yoXiTq9nA/zskC2+dWIPXbd4yTzcCMQBGmGiPRDzFOd+W2Tkkv0g6dQGz?=
 =?us-ascii?Q?qJRhQWAr469Ta51YnQdNFkjv2/twdA7z0jx+b+7WmnhER99HNE6TF3Wm02Hc?=
 =?us-ascii?Q?cVDpZ5Uf6d54jpPiRUMYUQLxqHmdqiogN5nhNc0112FGgbf4stVfOGCX3yjj?=
 =?us-ascii?Q?/wjiWxAmvgycLA1ft4OLs8v9BhzFKh35NrYJbwUNID43Ku+d/hr2Sn2eLZXz?=
 =?us-ascii?Q?egTMZY9tYvb4tNKd8qze+WLm8sGbLuM5wV3EMy1vdj5RhdapyXj4zagmCGck?=
 =?us-ascii?Q?/L2rsHG4FcTsbq+iN1hWhP3DalcMsjEXt/E5HhO7+4foIW5LIptdlWA39m5f?=
 =?us-ascii?Q?g4YZa9nv3zbUf//6qX9qm+x0cPhdjq+mMMYboYzFPUcypVevzCtRmz+AsuHi?=
 =?us-ascii?Q?qT9WjSYmvXP7/MmXeaC8Z62QxZ5134j93hDjMwQaJ4b8cfyfREGcRALNyE9g?=
 =?us-ascii?Q?c08Ik8KJIl/fnHwkqbe/XdQS0fIzvvLYy7ju0c2DYlcfD/QW+k/rfZW9ZhfU?=
 =?us-ascii?Q?QNej53lL6ewDm5D4b7yG4EHEttoYSDc4Xt9s3b6h2yt5aHe8iG4Sl/6N1MPn?=
 =?us-ascii?Q?buCa7YB80iN2OTb4k5cJWlhDz+62vykqh66pqi7dvATtgNiohEeWF9m/eHMP?=
 =?us-ascii?Q?mnW0MAYJb50sh6nknTHoRdjxDwRKIjGIceGEp9aAlIpXSk6P89gPe3R2AwTW?=
 =?us-ascii?Q?5AuB0ybYPndI1tOzkuX5NyXdLMYUuuIDFNOqB5/1w/d39LaX9yNou2IaU5JH?=
 =?us-ascii?Q?m/BTFuUA5npIuPghB84PFYmuPXxLYBO0W+yoOShFCW1HDFard97KOaRDhDM6?=
 =?us-ascii?Q?eLq2C9dLIAH5lDQP278ncfO8o98PYhaC+W5yWYK2FnDmUXamlBtEXdVo95sc?=
 =?us-ascii?Q?mkEJwkbUJrqEeCICvC+CmSpx+ldRDyOt04cDy9zGIRfPAReSlZHWV2DnJH3v?=
 =?us-ascii?Q?WkhwXkCywUObK9DrpTbNrmP+szLDUxHOg1GJseBRA5ZrZQp9paO/qKnTOzxS?=
 =?us-ascii?Q?oat2aHQ6QW+b0tIUClfIpSnnkFH60fI4aUcWeqTuKlLdp5NQv7w9SNuu5Zi3?=
 =?us-ascii?Q?y1XdQkbUQ3I+AitRNKB5tRPMEOhzoHm3n18KIrk2DJhQo6Gu2yu/1NLFI0La?=
 =?us-ascii?Q?JllumfNGmgfd3Fogao/URsL43F0JWynNV1LZ9D0qt9WgqwHqKENtkLzkUG7K?=
 =?us-ascii?Q?63N+jfBWAb3oUoFIHmhFISG1XkHoOFjxFGl+PTcChoXYsSjLLJ8t3OQXdDe0?=
 =?us-ascii?Q?uHzCvH4IWjEekciMd6t1pg0qqbZV8uAeA50hXv7kZaX57mMpfnyp4ccqV+Xq?=
 =?us-ascii?Q?7I++jklgp8luREDHtxrO7PbyFeYNelZRG5t6cBpQtBzqxT4eEUM9A9lI1qFT?=
 =?us-ascii?Q?BajMNqj5o3/dFXm/nCT80U5dUb3lExR3fCG/+ayQheHOKl5pSbxnVKNO6YJE?=
 =?us-ascii?Q?NRKs/StY0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4b4e44-a86a-4b3f-778b-08da1e89c89d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 02:43:55.2868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPtB/DhPrAv6rWi2H53ithVpFwZFgCF9VY+Re808pUxPttLGO58HjRZtD/jnjjLcqtnKMOA303f8EayZGua7xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

HDMI1.4b specification section 6.5.3:
Source shall only send GCPs with non-zero CD to sinks
that indicate support for Deep Color.

DW HDMI GCP default enabled, but only transmit CD
and do not handle AVMUTE, PP norDefault_Phase (yet).
Disable Auto GCP when 24-bit color for sinks that not support Deep Color.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 02d8f7e08814..312500921754 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1108,6 +1108,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 	unsigned int output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_PP;
 	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
 	u8 val, vp_conf;
+	u8 clear_gcp_auto = 0;
+
 
 	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
 	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
@@ -1117,6 +1119,7 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		case 8:
 			color_depth = 4;
 			output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_BYPASS;
+			clear_gcp_auto = 1;
 			break;
 		case 10:
 			color_depth = 5;
@@ -1136,6 +1139,7 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		case 0:
 		case 8:
 			remap_size = HDMI_VP_REMAP_YCC422_16bit;
+			clear_gcp_auto = 1;
 			break;
 		case 10:
 			remap_size = HDMI_VP_REMAP_YCC422_20bit;
@@ -1160,6 +1164,19 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
 		HDMI_VP_PR_CD_DESIRED_PR_FACTOR_MASK);
 	hdmi_writeb(hdmi, val, HDMI_VP_PR_CD);
 
+	/* HDMI1.4b specification section 6.5.3:
+	 * Source shall only send GCPs with non-zero CD to sinks
+	 * that indicate support for Deep Color.
+	 * GCP only transmit CD and do not handle AVMUTE, PP norDefault_Phase (yet).
+	 * Disable Auto GCP when 24-bit color for sinks that not support Deep Color.
+	 */
+	val = hdmi_readb(hdmi, HDMI_FC_DATAUTO3);
+	if (clear_gcp_auto == 1)
+		val &= ~HDMI_FC_DATAUTO3_GCP_AUTO;
+	else
+		val |= HDMI_FC_DATAUTO3_GCP_AUTO;
+	hdmi_writeb(hdmi, val, HDMI_FC_DATAUTO3);
+
 	hdmi_modb(hdmi, HDMI_VP_STUFF_PR_STUFFING_STUFFING_MODE,
 		  HDMI_VP_STUFF_PR_STUFFING_MASK, HDMI_VP_STUFF);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 1999db05bc3b..18df3e119553 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -850,6 +850,9 @@ enum {
 	HDMI_FC_DATAUTO0_VSD_MASK = 0x08,
 	HDMI_FC_DATAUTO0_VSD_OFFSET = 3,
 
+/* FC_DATAUTO3 field values */
+	HDMI_FC_DATAUTO3_GCP_AUTO = 0x04,
+
 /* PHY_CONF0 field values */
 	HDMI_PHY_CONF0_PDZ_MASK = 0x80,
 	HDMI_PHY_CONF0_PDZ_OFFSET = 7,
-- 
2.25.1

