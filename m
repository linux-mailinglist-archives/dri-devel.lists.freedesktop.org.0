Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4479BAB54
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6710E35D;
	Mon,  4 Nov 2024 03:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DtIW1Igx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2089.outbound.protection.outlook.com [40.107.103.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A865A10E35D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duyIjiO27vUsNlxkeq7kVeNOVJ9Cs9KFrr+DrS6jeVh3Hui20rqF8aPYREOiu+Qx1Honpv5NVaSZ6sL005IApLjXijCMNnMnyk1TXGNmegANVsy88Vj39sbDO1JAXrwttrac46vAIGEnMuhOjkktDwQOpwFc3Qqmxwvg08/2YlhomJI6M+0hNB8ZEqIVQ3M1mA+ZKumMLxthOjPdxbiHsadd2D4sSlcMB3Oa6tmpB26Zr65fRW6FqFM6GpRTJgAq49jAXC3ieuHEng4k9u4MEPr9cBaqvDvzSDAvC38A54btQbdfiq9+d7l9AeDkurSG2i6eOHCdKsXDz4idUSiJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsWPVuWzx4acrPo+d3e3ScqqAvj1ZlBZhcv+5u4ZiZ0=;
 b=XasoBxibXe8xfvV5Opn092l1cdyOGG+6+WdH+ks7PWGaEpAC/ENDgj3SPgPTSy/A4+pwaPjaeeENVVG7OQmH8xZSaP+4IE3YImIXw+Q7BOOyZbqtaxG42Qk0Cv6zmuwH5265czAht9HU+9U7c3OjCiSe3ZQ/cJ1mWqbIC8NbijFmUIWArx0uEmOsnH8UZmbMYwYwz0WRfNlyKifKeYvleTIVT+eM2wBHbDFOlkYA+C72dRwfSvoEuIe/L2Kea24Ql6dIL/ITFoYN4rJYv5zGq0SIV+mUgPUCr0Il4KUUKkruvDPxer3WZJwcJLu2ocjTJZoasDiE+jc+V+iHBUr1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsWPVuWzx4acrPo+d3e3ScqqAvj1ZlBZhcv+5u4ZiZ0=;
 b=DtIW1Igx+fdnLjSFnIc7aHuIufcC8wpnjiQ9/B7xUsn9AcAhU8+tQzxFqUubeeCBKhZvBYy3YjHN33lPh0a94cH7ZCRurlQPHYUkHb8QzV+stYtTF0HoXmCC5RbWqmDg5E+Bb5OobdvE804Argh9B1FjNhDW7CCKZgdkoz11hmIJb/r3G5bdM274uc/zsQc3ArKtFtWI+8CuPr57n4FYaR6N4R33YyUOaXA5md0fF1TOrGtC68ZliK442ASXH28pOE0RG3dq01vIUml9PFkUxbvKn9dOB/jt0qP0/g4XlEi8N9hwNJ5oyXiuCTO8KsstZ1lsO7DpnjjBRfRc5oniGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:29:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:29:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 06/13] drm: of: Add
 drm_of_lvds_get_dual_link_pixel_order_sink()
Date: Mon,  4 Nov 2024 11:27:59 +0800
Message-Id: <20241104032806.611890-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: ef29a1e9-5a8f-4cd9-dbc5-08dcfc80e32c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gmy/cFeQgOfT50vthat23vlyHQ7WnIjETcKofB7eVBpFdzLbYAYBcZ88QqzZ?=
 =?us-ascii?Q?ye7/DJ/YEQ1T9D/Imm5fwYL2nTCERDLoSXD/BJrIYEzH6H0VE6Wyn8mCr/Ct?=
 =?us-ascii?Q?pRk86hq+SNmIEG7/yXFYWhp3ztII7v8zxYTAOKTxuqbwXpZHELftjHFjuqjd?=
 =?us-ascii?Q?cr+ePnnaA17AKogFVlzfLIg6LlQYwiIMq8GqwwCMHHEcvjpyZ92oPeDPvMf+?=
 =?us-ascii?Q?4oJgN/9zx23OgS8iNvJGYzSb9ur7seh4kmrV/CmgDY27JlPQebpwpu7IdK20?=
 =?us-ascii?Q?1LjBo5xU0CfSuum8rNiQlS8ULfvcu/WuxTQx404ZCxgFFt/3znEqkOwNDNzG?=
 =?us-ascii?Q?V36xaZ8zZWo510s78MgzUvljJtpaz11xKj4R+w3m/AiQ1qQLphl94qkpzQe4?=
 =?us-ascii?Q?p0GTI5RQakddF13y+HGyi6Y0iKQLvouO2XND4+J9w00jJm9/LQMN3d31XTDh?=
 =?us-ascii?Q?nvM3qQyJNehz5S3uBc4MRs035fu8Yk14ksIXY0AZImb34DSprvxO9YmEgysa?=
 =?us-ascii?Q?muA4gRxHDYmQpGsqA/4eRA7NeMddqryEHB5CWYIh0nIWSnyL+3mF3zvrHYXk?=
 =?us-ascii?Q?m8l6K8ZCeI4qgi4ZnH5UJwSv7xHeHd/b9DblmdAbKOK6IuLUoBdqxkDoM4qW?=
 =?us-ascii?Q?p5sYG/7XZJeRZJXDOIFAxsp4v5fcDZ9Bsd2BraVW5Kl+eBpqAY5rEORzOnVF?=
 =?us-ascii?Q?g6BZU+d41MNtE302rDT4uYrl/xicrRa4mOyxYipxPYRds0s+f6OlYX/t2nAe?=
 =?us-ascii?Q?bHL40lcBQGhVBzKX5+WDaUjTLO8gmTQjECydgR4wLhQOPaIRQbGr7qyKroJQ?=
 =?us-ascii?Q?K94u4DN5asINpSZvs6GLjsAvmG7LyBHJjiRKPFR58yiGHVe39jm+iqngvH2f?=
 =?us-ascii?Q?aSpubH9Sz2mguzzdmtoUDYsLFUVEwGszAJ5BxunzGW2EdDObsfVzwuWra+uu?=
 =?us-ascii?Q?XvnuEipkokttTocaWUJILMXBPhNghWlHqTEz5ItNXowpBGzueJJOwvtNgKQC?=
 =?us-ascii?Q?x7fnHKBySn5I3Nm6zW8maWDNLMqgeczOmmISL7yarPExVl6mAo4F0O0BgcC5?=
 =?us-ascii?Q?sEcjkAQxx5jGxaX7WoN0QrU88WpErDvrXQo7w6tuYOHFpSCi1w4FBGjugp0O?=
 =?us-ascii?Q?NKA6FopjDXP+TSZ3KlNrNP6JkCqYNGeFY8krnvNDqx5gQw0tBImgtDgTnmQk?=
 =?us-ascii?Q?3fh2OKgqAq2dZGQGja8AIrUJqd9r4dh1Ouq6Xyr7FY1gK+tKE3Ov9DlrCc0w?=
 =?us-ascii?Q?kSzW65zUOz10EbHl3abeSkryJ5c+Z5BSXmFIntAj1nD/g2fSXJhjhTPGh6mW?=
 =?us-ascii?Q?Mvy9F/i6U5eXW1fERSbDflZ2D+eBOqYR54oPoLgg32qtlfEzVXwE/P+R67UE?=
 =?us-ascii?Q?VrBoFgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dtD65QG6JUSx02W0K3CNtAKALlmfpwhXRdD7LdDmU2QTmzN4Ypqo59z28UGv?=
 =?us-ascii?Q?LoSOudM20jja1hIjHgjEkZByXVBWThO/nDA3GBe6ySEeDtHLRBvF5SBwHhuW?=
 =?us-ascii?Q?SAhQaYfPiXMRbcomBNSfb04BrbnF/sBDYa3wOp8tTFEEnx6dv9YYxDkt8V9J?=
 =?us-ascii?Q?ZLdHMXJ1RS/MWpjcvEEwgWjdr37KpwRZatckc6PDGhc+g5ZyFBSGq3E5XcpW?=
 =?us-ascii?Q?MfipxPm7SMle/YCGmcIPUs4RJ4QLlq3ypXFoOl3Eta/2KjGaRifJEHvf0Ns9?=
 =?us-ascii?Q?6niyGeq1glh50103aTaB+a16+LNHUA6XIj4R9kzh3le5woCF1l+UbJHR0QQU?=
 =?us-ascii?Q?W8Zd0DuoJeTKi3LZy5P65zWD5refsPNX5FWs0kbTCwOW9lr71siOAExBVlCJ?=
 =?us-ascii?Q?QP+fcUfFm3nIrWU42oJ5/OZzkYuOIzf/eB0ZNVSfSwVzw0znlMo+u9I2TFgw?=
 =?us-ascii?Q?J/Cg9SpvtQheZ3foO+QseV6uz8i/TDoABooEsH6EEQR5B9MH3WW82rlaENki?=
 =?us-ascii?Q?tXs7m+sivOwkO1V7RDvAi4ycTTtr7LM2GeUVFtj1FDSj0nrpaxq4Apg1nw/q?=
 =?us-ascii?Q?uNgf3hlt31sEKKQkIo0xPX8lLug9vWlyoDFA6HUm14JIcTIwiR45Q6CVZn6D?=
 =?us-ascii?Q?cofjHYGwt+AnYoUZxcnnDzHQI3cI4pfldNmCMjrZbqiFT+mnXYn3lPYsMDyC?=
 =?us-ascii?Q?llJr/iRDR7BsDQFm7Qi8mg6RoShWKx2Y6M4dEJ5Y2IG6lGqIvnjzWi7xGo8q?=
 =?us-ascii?Q?I/FclFnzx4v6HYm5MZSlECdJTXl87KBsxz/VUxeUxBa9tW6DgM6kKSFy6nfO?=
 =?us-ascii?Q?F0lefU8dl2JnIOQ+v+VCYTSP6BnOmf3XCBtd/ZYT2HIpRpK1KRnHUqIZ7iBX?=
 =?us-ascii?Q?nnpIbgV/C53so6Jk5AtC9+q6Gs1B/0x/UpoO+ajv1ELVnZ0pBwpKDhrfLv8T?=
 =?us-ascii?Q?+KpeeWvu0mpIXA2QAvs8k0MIwWcZR122Tn74Z6MgIr3YSCwyBUvi+D3/bO61?=
 =?us-ascii?Q?Hbtwz2y01WX5QIMZ07tIrppGFcaoK+zNVNMgxw9a3v/z0tvIMg+OqytTyfvq?=
 =?us-ascii?Q?z0KXIcOQ75i5mORX5LcDAaDO/7K4Zi3b5V8GBuf54yZpnt4wu2/uQIvQEhVJ?=
 =?us-ascii?Q?ZhS7i2a7ggxuo0vjne65t6/37ayuBEtzcKI/LXDcLX3icmvQW7yB4neLRIjW?=
 =?us-ascii?Q?EaAfKCIt53YTCsogQALt2ELD4HkSCy/1VoEqrQmUOeYCmA/SrI0MGqR9WOzN?=
 =?us-ascii?Q?3SOTSfI9nMJr2+hdgtJfR+EbdgWkfXq96KkeHLv7pcL5ruEtctfAcCfLT6q1?=
 =?us-ascii?Q?/zZbdl6TzC+lRiX9ke3vAwOpULIlYhGcEh5wkbSY8vnLJsgAMFjD7rqLO2lg?=
 =?us-ascii?Q?MLGqqVWhhCLODwmCwkHoi3Z/ekepvsinHBs26xwl+/4tif0UJZ4DdfUKeAuv?=
 =?us-ascii?Q?n7Vmc2V3dqx/h3hG+x/NbMKyKEs/iY45PTPFjwKwRhcvqtByRHnvPN4+BcFo?=
 =?us-ascii?Q?hwzUqFZW1ycETGMDwGiP1E2lbxl9r3dE1/9TN0MeAFblzJey+wdgfx6ZKCDV?=
 =?us-ascii?Q?Xp+y9G/v8nnqB9u9L5dK/tOC5VkgDvXEAtpBteOH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef29a1e9-5a8f-4cd9-dbc5-08dcfc80e32c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:29:27.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tbigp49h1fi36KEqLQXJKVQfGHBPeyWIGOUckKZ7oiZH5JMwtwMveKdNwbxUsKTqxjaBgd2fTFaUrixBuo+sog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

drm_of_lvds_get_dual_link_pixel_order() gets LVDS dual-link source pixel
order.  Similar to it, add it's counterpart function
drm_of_lvds_get_dual_link_pixel_order_sink() to get LVDS dual-link sink
pixel order.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
* No change.

v4:
* Collect Dmitry's R-b tag.

v3:
* New patch.  (Dmitry)

 drivers/gpu/drm/drm_of.c | 76 ++++++++++++++++++++++++++++++++++------
 include/drm/drm_of.h     |  9 +++++
 2 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 89863a35c731..5c2abc9eca9c 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -341,8 +341,23 @@ static int drm_of_lvds_get_remote_pixels_type(
 	return pixels_type;
 }
 
+static int __drm_of_lvds_get_dual_link_pixel_order(int p1_pt, int p2_pt)
+{
+	/*
+	 * A valid dual-lVDS bus is found when one port is marked with
+	 * "dual-lvds-even-pixels", and the other port is marked with
+	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
+	 */
+	if (p1_pt + p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+		return -EINVAL;
+
+	return p1_pt == DRM_OF_LVDS_EVEN ?
+		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
+		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+}
+
 /**
- * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
+ * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link source pixel order
  * @port1: First DT port node of the Dual-link LVDS source
  * @port2: Second DT port node of the Dual-link LVDS source
  *
@@ -387,19 +402,58 @@ int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 	if (remote_p2_pt < 0)
 		return remote_p2_pt;
 
-	/*
-	 * A valid dual-lVDS bus is found when one remote port is marked with
-	 * "dual-lvds-even-pixels", and the other remote port is marked with
-	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
-	 */
-	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+	return __drm_of_lvds_get_dual_link_pixel_order(remote_p1_pt, remote_p2_pt);
+}
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+
+/**
+ * drm_of_lvds_get_dual_link_pixel_order_sink - Get LVDS dual-link sink pixel order
+ * @port1: First DT port node of the Dual-link LVDS sink
+ * @port2: Second DT port node of the Dual-link LVDS sink
+ *
+ * An LVDS dual-link connection is made of two links, with even pixels
+ * transitting on one link, and odd pixels on the other link. This function
+ * returns, for two ports of an LVDS dual-link sink, which port shall transmit
+ * the even and odd pixels, based on the requirements of the sink.
+ *
+ * The pixel order is determined from the dual-lvds-even-pixels and
+ * dual-lvds-odd-pixels properties in the sink's DT port nodes. If those
+ * properties are not present, or if their usage is not valid, this function
+ * returns -EINVAL.
+ *
+ * If either port is not connected, this function returns -EPIPE.
+ *
+ * @port1 and @port2 are typically DT sibling nodes, but may have different
+ * parents when, for instance, two separate LVDS decoders receive the even and
+ * odd pixels.
+ *
+ * Return:
+ * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 receives even pixels and @port2
+ *   receives odd pixels
+ * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @port1 receives odd pixels and @port2
+ *   receives even pixels
+ * * -EINVAL - @port1 or @port2 are NULL
+ * * -EPIPE - when @port1 or @port2 are not connected
+ */
+int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					       struct device_node *port2)
+{
+	int sink_p1_pt, sink_p2_pt;
+
+	if (!port1 || !port2)
 		return -EINVAL;
 
-	return remote_p1_pt == DRM_OF_LVDS_EVEN ?
-		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
-		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+	sink_p1_pt = drm_of_lvds_get_port_pixels_type(port1);
+	if (!sink_p1_pt)
+		return -EPIPE;
+
+	sink_p2_pt = drm_of_lvds_get_port_pixels_type(port2);
+	if (!sink_p2_pt)
+		return -EPIPE;
+
+	return __drm_of_lvds_get_dual_link_pixel_order(sink_p1_pt, sink_p2_pt);
 }
-EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order_sink);
 
 /**
  * drm_of_lvds_get_data_mapping - Get LVDS data mapping
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 02d1cdd7f798..7f0256dae3f1 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -52,6 +52,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
+int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					       struct device_node *port2);
 int drm_of_lvds_get_data_mapping(const struct device_node *port);
 int drm_of_get_data_lanes_count(const struct device_node *endpoint,
 				const unsigned int min, const unsigned int max);
@@ -109,6 +111,13 @@ drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
+					   struct device_node *port2)
+{
+	return -EINVAL;
+}
+
 static inline int
 drm_of_lvds_get_data_mapping(const struct device_node *port)
 {
-- 
2.34.1

