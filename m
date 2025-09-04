Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B6B43364
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0710E986;
	Thu,  4 Sep 2025 07:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J7Z4Ycl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166D910E986
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDWdlnUJ5hqlGfRGpi5daaC433qfaeAlQWjAjDMwlNJvxEsC9v4DKHYfmcIMXnmru99bAB0DyXnbQvBa6JKZV2rFjwfHdNNLF3NNX/YacjjN40Fa1cYC4vj0oNbjz7TemRX+wo27+komzNzggDWMrVtIsuSIwnl9wl7j0WrMQyodhlxpeppgwXupv9DBkRptKoM/fPiBHdmeEpXVurVS1qmA44q7/urDRn7YNzYwUbSjKJN75rHbJ+lM7zZAstXCSErXND14+PPBDpK8G3ZRuhCwd5K2mRkMDcjKt6isxE+1TCG+sFoXHbvOmfbRjlUaCUSDOI5ihWPMb3aaCJOBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdo/z73Npt9ybPywP2lr9lHgy1PcfMNqlyiU6OtRDJE=;
 b=Xta86cjZjkYAHxvh5tAstRLQ4AjmBZmZNyKBfjus+rGB5xbfR8nvGEJD/EodBxIndNWwk8JtwQMbcU3dV0MhFcW7YSI0kwr01sOdgoSumwFJDVdSFdieRMATe7NbEL9m3j1quA4COYnM8mNp59KVBz/HpDq9fn8OMtrtz4/wtrpPMD7F5K/+nM4qnG7AfOuaiYaSh0R119TG6XsFoPzWDDqn9EDiLZfKzkvBaJPADa87+wiq+4DXnd5r79o2wTv1Ldz4yMgYdKlGWnKPKyd8Pu5LvOzwVjBkQRSCSsbLwU8+OUxjNuN9D8q/K171BUvrPFAjzPLTQzUo9gHmr3ZBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdo/z73Npt9ybPywP2lr9lHgy1PcfMNqlyiU6OtRDJE=;
 b=J7Z4Ycl1D8pkUFAxCgN7x5/MLF6SWA6HbsZw6DUmGqRWR+xjnV0y6IO1zcFzxqHgQo9t/j1kFEQH4lWzUsD4YMMz+mQv0VTayMQSSAol+HTfhEdBSlii0PEll390lhF5pt5LKVPVjuMz1y4FTlVMMzqHXm++WeT5wYr1cLUCp5sXdVZTk70vMMej6ghd9QWzkiEg20GhLSNm+47IzFlz+rCcas/f7gU9ZmCZZyGwFLfkA+YpaLOc+XVwuVUGUua1YtZE8eBc1ylvxG9PAYHZ6AbEAd2R5B3vDeeJYsaQd5anVsaNLaIFM5MEfkMymT5inNLMtB53Ct0hKvoXBhHNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:07:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:07:32 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: imx8mp-evk: enable hdmi_pai device
Date: Thu,  4 Sep 2025 15:06:00 +0800
Message-Id: <20250904070600.1361165-8-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
References: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 443c3bae-4e48-449a-068c-08ddeb81b7ea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vnOApbFddLNvBtjT+nX9mX0Bezg0LYHN/X0sw4y1OgC2b2jMta/UvRHnFdjY?=
 =?us-ascii?Q?RQGj5qVdxwfdshlb/Mt/TLHApzlyDO4i7T4lZ8hRv2rIQIyV7XEh2hCkVS5A?=
 =?us-ascii?Q?o34GOvXPyQtauA4WopfCZCHxC7Fdgi/KjV4YWSNJT0TrbW9NCz8mLCUday2G?=
 =?us-ascii?Q?5af9JcDNEZCko7Gyy7Lrv8W3a8g0zE2ejU0pzYT/YMhah3HsG/WFAB0dXWn5?=
 =?us-ascii?Q?8nqXQ8PxVtl3wth0wnUhSW8lu4cc5fuDLgB8rm7WFjm1ouc4HXpmEZPfhOV9?=
 =?us-ascii?Q?iV3wIVxzPSrHc4N1DJHzf1a/tYGCQBnUwebkC/BCn2HGmatB4CJFMsMpIgDF?=
 =?us-ascii?Q?3oFI5KrY/I60KE3gIkcWA2naRP5hNnaaRa4XNDO2bGLeR7hxpUrFWio4/pUA?=
 =?us-ascii?Q?LxUR3ak8zKTrrHWYlZEVbpGRXB5Xp04tcanS0i3h5FdJt+Z5+pumFfyio1XE?=
 =?us-ascii?Q?g4jTLhfqXJCFOd9tQ0UBLp7JlHlByjCnu9ghq3JIsHi7DFO4yKQxzw86g+Zu?=
 =?us-ascii?Q?9j4idmdpQtF3M0KD0PM5ET6wDodWzS2tPXhFwfXQ3nk8zLNc9xzssHV1oOcA?=
 =?us-ascii?Q?hAtkAIgW6qUkpup0y/hUq1f/WptaplMUgRx72H+CdgfAQw6FuArINqu7uNWQ?=
 =?us-ascii?Q?/IsaFf0yv3XN91UR0vFZI2AuTIf1kkGABxLj5ArDU36RinNuLrtf/kI8wQHy?=
 =?us-ascii?Q?v1mgUfZtNFoNlLBkZ2UsMEVyADAGXxPS5eTgSOSHkAvr607ZKcWulR9qmZ/W?=
 =?us-ascii?Q?m/jptEUjCOm5iX4O8X0qcyBJrv3ybVed9bttHAPMbUV2hWSsmHw9CMZkogUd?=
 =?us-ascii?Q?+HSskhFD6sb7rb/uvPh09swDlZm+EPdWa4d5W8VaaipoC0yvS2SeS4Vwj5gP?=
 =?us-ascii?Q?fMKnqmkZc6C2E8XXepJYBNZC+RZw9/bwNHH5Uc8z6dxWjHj7WMgKNpDzojS6?=
 =?us-ascii?Q?osWkRCThWD/cg38pCj1oFtrKldQ5oXo1b8vwfI119/ThmlSo1w8zFmFk1a/h?=
 =?us-ascii?Q?mgeDOxC+rPMl9QEZirmTWiPZJYm6TlE1unuOhrDEOS5rP8Uej/jFwXdX5BPM?=
 =?us-ascii?Q?eOX5h3xySvoFBGLQMsUqfzsUXjCeyVFugvUT9ThaJ9ukdOFE5gfE9fSs24/c?=
 =?us-ascii?Q?CipNjc5gWJeBkUjOLn0MnZHYTTM0PVACZ84c56OiFl6jeZT7KcSMr7yFd+wd?=
 =?us-ascii?Q?EA3Mm0YwcMPIkDuZWFr0wFrmL6qI/YJUxT6hGsXA167DyR5BTxNyhdG+h3ek?=
 =?us-ascii?Q?M437mefCSpvimKOciOYnlBrCLFwKL8ke66l0jDoHe7ape3SsBgzHd/OCOm9H?=
 =?us-ascii?Q?S95AziyvV1ZtjlM3LF7k+LhmoKmQ2clj8gjhObwiUHJdy0IFBKa0MHlK5nyw?=
 =?us-ascii?Q?ZPZB7vv+pIFyhZA7bLZXHm/jOetHk/TR/IBxDgXidRxGyYLYBGmOiOq3N9Et?=
 =?us-ascii?Q?vmlENu1D7BrFf8g1z9ntCyrpxr5nV/iYGQ9nKSrdocMZ1NLUx7WtEqyfqdtS?=
 =?us-ascii?Q?hEcu9xijLUBO5SY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0UpX53JQLY0qA7N31LBnmRL+LIRQgsTEBXnRVqorLM+S5Kutrc9ocW7WU954?=
 =?us-ascii?Q?pRYD9E0c9wL4qpHdymQzb107fKwTscLDxq2OShifEmy+y113jZrmdMHdQ9Xr?=
 =?us-ascii?Q?ClT3OgSIEb1rr/Ia38KNJelcJtIDIBmRmMGqemhQwMvYwEdm3O31xUrv9lsu?=
 =?us-ascii?Q?lJRsGDOXTSkMUKDVleFBV9P9bG2mJa5x6XuXDCT3N2Nk4Q7ZPIjy6R+eJ29S?=
 =?us-ascii?Q?A0yuwMqY71TH3PiiE8CgonyQAhtsoq91I55VrDf8r/tiAwc/7LQFQd9B43qM?=
 =?us-ascii?Q?5FWK74TbmLY77DIYVkrCoUYybZHxDLVW0yemoqTJecvxDKa6l9hsHpo9351Z?=
 =?us-ascii?Q?rdkpicWFsx+lVucS591hp6I7znQGzxFNX0b2g6+zDqDLWxGpATVWwsKkmGDx?=
 =?us-ascii?Q?C9s9SuxSI93ZOcXb0TdtzwZLEuT0Oog73lOQ7qluiMrJIjTSjvS5DoS+cg54?=
 =?us-ascii?Q?tTvVpcLQ9FPSnDRAjdBheL5O4JGXNJqZWD54daau4CQsX9ZRNCbEblHy9tYV?=
 =?us-ascii?Q?gmSXYdNy+++lv/2NtDoQY4lvzHzXzVJ7fQ3QONS9V8kEWZjDkwNd1BoBOeT4?=
 =?us-ascii?Q?UE9hjneNb7butcJpslgDz2xvX/lOVRHyPiBqDpx9HPh0DuOpUY2Y5peGVNva?=
 =?us-ascii?Q?SSty9sUvG9tJ++GSLdsEMsGiPAu1RUw4ZL/0CvWGk/5DzPvg7MmD5+RMOvXs?=
 =?us-ascii?Q?1uuQUR0HXKg0uLHx8TEcUvkFrBqBg/Z0vVdgqezTagBqmw2wGueOJn9mfnQV?=
 =?us-ascii?Q?iAjQfonMr7WMRtLRzLyJboDhs+W0Ae+et90plYPfOaSptsRVTWjImFHG/JsD?=
 =?us-ascii?Q?mfXsLV1TK7ty4hGJXheaKqZZfwLQPYQWsjifdQauRq1/ivyele00ZJO2nCRZ?=
 =?us-ascii?Q?dRJKJMGS9VAOa04XTLY0fFI3h37c1YAI+7+ilRu8ZEBsD4F+u/Nwj7lhS6xP?=
 =?us-ascii?Q?RC5qu97dKN4L2HAKCUa293n6yhrHrg8fpSAw8vSAbAbemrOD5P8Tt1lDBqyP?=
 =?us-ascii?Q?4eoo06dyZ4ugh9OQ37TMzJ+2Nh6zo8Vdsbmk1TUtLlnltAbwJp3lYzChB/vA?=
 =?us-ascii?Q?9quojIhaQipdzu6yE2LgE4HBmjKxJ9Mvhfg2OmVtiONntf/un4b9Fok24S/x?=
 =?us-ascii?Q?CUbv4zWXV5H5jSY4O+ku83NZr1eUBZgjo7U42GWSH2HGrt6s/rqpHYDi4wMX?=
 =?us-ascii?Q?n3ZLi0idyfvnjw+c33wUlICZwQ/ygp5rxI20Fk7Q3NWpLBFx7umuiDZwGRD1?=
 =?us-ascii?Q?QuUbfWWmL+1jnRtwLZQfA5gsYL4zqGhlhKMdhNZDt8z00VLDnE91EaHVtNMr?=
 =?us-ascii?Q?T19AnMFVGxazuHNyKN3TbdAix30Wvj+/8C4+0FpHXaQ4GnOAzjKU57VlcA92?=
 =?us-ascii?Q?g2RaEB8b0vkE8I/pCNPSPOAhmJyRDxc8tLANp7VXchg53QiCOdMpqm/JMTuM?=
 =?us-ascii?Q?tKC+jZDYMEexnCy4yxBAurfWoASZg0X4uXn0BhqZJU1racjoTFla4WMtPBaR?=
 =?us-ascii?Q?13/VTMjdwqgp8ExSaLHuhZLSuglwrNIKq/nv0CMTMvBX2wI+w2BOg2v25UiK?=
 =?us-ascii?Q?vYH3Ad00Z3w0kWM/Zc5/s6CG32Bw6cxKt3Hk/U7Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443c3bae-4e48-449a-068c-08ddeb81b7ea
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:07:32.8552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4qjN7bzLUYALlAxtCaeZMQMoD1iobBFoJ6wctoqLq2JtjfGLI4I2tQ/gFZfMAjGcZLxXIQ3b2EM6PDqXFTxRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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

Enable hdmi_pai device.

Aud2htx module, hdmi_pai and hdmi controller compose the hdmi audio
pipeline.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3730792daf50..20c400766ea8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -442,6 +442,10 @@ &flexcan2 {
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.34.1

