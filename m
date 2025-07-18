Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD774B0A3DA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B3710E99A;
	Fri, 18 Jul 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="n8r9u07+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013028.outbound.protection.outlook.com
 [40.107.162.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8399110E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFRWv7rA9mwdW0c+u7tOjNleKqDnyRl7NsHJOmcxBKVjiODKvaTKBQoqOECKu0nhTmCJTBAMkR7vDDjKNTTrOD100K+VSPyWsoFVVYynZKVhnpSj1prVou8Ol0gfgSSUPVc+lToHfOlGjdiL5MIDgt+BaggsshtlBPkrowFpbLz6EXkMWIShOWi36IFPHjaUm/3MXrw6l4FR5ik6waj69nepN+6gg+uiP8hW98FJpYhapCm5aaLgIJuJtUhCZudGemayp2AuYrC5/38mqBssn2k/fPmu+SelS1agSMUmc7cuvZG14g+FQBI61NGsDqS1qhqEsT8TOXgVhWcoJa3P0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/8oRPQz8O0KV0+9v0+c34n3I86jF3efa0lqCRGe73g=;
 b=KIhCUJBf2rxx/T5LezvQDuNSpEjfYI71+KuV+hiohDU5RF9xX576aP5KGHvb5Xdhcthj3Iw8mKJ6RNhXDd61YyV7kaedwRTKlSt5yxKbbF6b/WaV19BQslLCnFEQqo6nU5WOCKe1RncMYxYuyA8i07yrbMgyMATKhy+6VNkfCYI7Qg9B66SsUOklRPZh3WA1c84zq+P2fnGgzA4WMMJbiJnuD78R2fnilddTD2WgAWLBDDLhoGy/3dHeqPV0enwnnNIAjBGEqnPlIVWPdx4Xb8sQ0Pjb8PACjcMSRKSLny+PIr5LpzuzhpNt9c4/rkQS/9WanacNkwrAS1GfWVSHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/8oRPQz8O0KV0+9v0+c34n3I86jF3efa0lqCRGe73g=;
 b=n8r9u07+fWwZQtLgzjCDH/XrlRALaQk9r8ibUpzZequGLWqLvR/t4BCWX7JZ23nIWBw3yn40O8eAQ3GZjlQVGjI+c+StMOkPkRsXzDKrdwXX9RLVtt27R5AOxDt1pJUcNyosXwnfnIvKQfzyQQLxLKJH4y8BRz5XKPkSjOY/SyVwtuJV8Wg2+mHYN9vJ0Gf+2LUVoAb/Sl1QtWzT9rc2aEhLeLUMGovi4d/m3UVez4eELcNyMAPOi0Wb/YCh+8QdHopRBKhJSWWhNdH28yQn2tAB8EZITxaBeaguAU80KB6MIXZyCY9a/lorSrRBHI2cpyWaDU3ez4BQdHP40gxfaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:12:39 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 10:12:39 +0000
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
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
Date: Fri, 18 Jul 2025 18:11:47 +0800
Message-Id: <20250718101150.3681002-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd0001d-a9f3-416d-ebac-08ddc5e3a017
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IHXnlhgzy0AmCCwryaoKi95kAVA9U8KZCss9FmZ5ShwfXf66va2kBc6RUKKp?=
 =?us-ascii?Q?K1zUkAWTBncFhMi7Oz3hBbgWvurXeRO+dh8TQsMkcus+awI6PplyW6pU/pOG?=
 =?us-ascii?Q?mq4goL2gai859BDpKYNXRNym/ZbqidvdbBJ00/koOps58aoYmrH/udFwLkbE?=
 =?us-ascii?Q?5d8S/UIdB4a+h4lteqSZLOhSHWFz20KdvxaA/lJ2Y6CuWj9rgTJlNAMBDfZm?=
 =?us-ascii?Q?9gHHDHgLBY43tX9l9rLaxEztPYtp4s+E9mO5kxiKHFhkcEH83U5GNt7HkCdA?=
 =?us-ascii?Q?5RVu13zh33SvjusdxI7CYtH/U99s88WhVCCN6jJt/nXiq6A9O12KHMj4Hr6k?=
 =?us-ascii?Q?hJv/KsqS68KGido9Oe6f0a6uC/VNX49M0oLwK3jbGSChRAnf+SlWTMTM2AeU?=
 =?us-ascii?Q?AY7KPHJ6h+wcHF6YTHj2If3e+iKOWqr6/X2k1pWP3lB8bfTguFyNSL27vYas?=
 =?us-ascii?Q?mVCjTLxmhZ70Izhf1Z71BckDAuDVvMGF9POWkyUKtNZdLlmnUaV5XnEL0zq8?=
 =?us-ascii?Q?1QPxmtVRExmK9DRjjERvTQAsiFRM2hWnv+tvLfrCSvqsGrMTJUGRnkPhi5tt?=
 =?us-ascii?Q?6+j+zV7FH1t7qYbpHeo3Qsy09m78dsNPR5zbHtFUMUJZDwBzO6pTKtYXalCS?=
 =?us-ascii?Q?ybqozHJCc2vZD8MP3E63Yi0SmapF7GX6e8sJ8sIoVesw9IEiyL2dpcntTYeE?=
 =?us-ascii?Q?H8RudW5UL/XsVJpslTZEHdjCBceplpxGzVue1xH+97DgLdosAd003nyVgFMB?=
 =?us-ascii?Q?B/YKp9XbipjGjP7xUJwV0IscTjvn9hBbsqTLr4wiejx20xw7vQ98M+qMWp8q?=
 =?us-ascii?Q?yEVZp2FkjFcS1EkdCAScAtBInVKKxCWyLZM+M3gwqrN5KX7AQKl6UksTAeyB?=
 =?us-ascii?Q?YdP/3MuGQ6R4q0vBDa38O4Pad2w3W1p7sXZTvjWB7+DmZlTPlhOWWs2O5FuP?=
 =?us-ascii?Q?VslKYnGeKLnJHFl6JsKJldCVHU1t8MvhxwoZtCkY6O1qZSlvq5aPLY9x7GH+?=
 =?us-ascii?Q?31WlABKCImvKpLqjG2lHksRPiuHZrdVa1HylxuwV+fjtRrVONLKAde4dzzYO?=
 =?us-ascii?Q?WTdRaM4xVFAPSzRTuNmSpCNFZgzUZ7YS7mzd4+JFyUDLm2bugFR+w5Hv7zbp?=
 =?us-ascii?Q?oZ3383nC2GB+E/zDxu2vwTBzvp6ZnAiTkbGHHyDScEJx+IQYZx/fvxhZszpM?=
 =?us-ascii?Q?cg/nMRAXgpk6XIl8BtlgFtE/0Jy3PsI0gZE8e40igFpTihu9H05+DoCCe2sN?=
 =?us-ascii?Q?BxOWa0Zb2w4N59GtZdP9tXtZFi0AkO1Rsnf32ESH86QIpPIscXGd2DXF28vv?=
 =?us-ascii?Q?8eDZzm44KSL4gVVcotBURTY5Dtu3Kr9hh9QGiqw0ZdCHu0nxJYj1CXWe5yaB?=
 =?us-ascii?Q?buib1RfdLFXqu9lJ2PsLurz4gtl7FllEUhLBl33eZaIpih0sZ12XWMXnU5aN?=
 =?us-ascii?Q?P5ARDczdbvhYEQgNaaeU9KZKTY9JB/JPCe6Hr+YHxfuzL4MAHjjbD6U+OlmO?=
 =?us-ascii?Q?j3AOxc+2fV0N6Yw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UogD0CyqCEHOp+Aoko4BORm5PaRJbRFxjeDdCdbP9B9Tlwchq7FXJ84Ace1/?=
 =?us-ascii?Q?4+QlPeiUuUbR6GskJHijWxP2ZxIA77VahH4KXbt/bgoiCUHLvi1vzqffIFTh?=
 =?us-ascii?Q?OCj7CFaDfK8r9H851yVuJ5INXvxHji+viiqnAt03lA4BmtHxYziQ8MKCwFph?=
 =?us-ascii?Q?+TDSpgdUOnh9caS/9MZgrQCMp5xVKBQa5kKC2kCoHyWba7UFv8WB+x33nMc1?=
 =?us-ascii?Q?grz1kqaAe/tAEjG3XjX3g31GY60soeZeSIhX2ROAZoR13E8kxV6ai6Wh9AFP?=
 =?us-ascii?Q?zc62kaKqnMYXOaOJvLAyGL9pzn4mcYWTdt/mtR2NPxVo4I7Li0NuZXUy9o8q?=
 =?us-ascii?Q?Acvrnvd/A5vj/OvkVq3o+0IGyrxT+O219Xl0DYSEidV7g2XLxMDtCMDByEzc?=
 =?us-ascii?Q?UULaODOfIYZfcCWaM3rSNOefTeXD2vQ/LBHZPH1K2n3GczMC16cgnf0PhEwf?=
 =?us-ascii?Q?NFnoaqIBroRFGBM8bhSrGGeSeOSVNCSWjYaoBFKymkIo+kAYYuy3Ez1V+j4n?=
 =?us-ascii?Q?9alxlePeIvqkUnR80pVimarMg+lSSH8MC///2y+o+huruxiKuzg2Vw/sym8F?=
 =?us-ascii?Q?2AO5sp6Y4NpL1UV/md7/s88pttGyRgGF/BuwFM+LeZir0J2yP4zZiJqwxoxx?=
 =?us-ascii?Q?sPWdFk1cS9ih5wK3ZK2iAPr3XRQpo4nlR1FyjpFK9TGZtQuECNHLVbXYkBJo?=
 =?us-ascii?Q?KXXCZf+UGtUrSvCjK6vzSVMDns7As+sNtHusRZyvSPG10EumEUaxBT1ZXEHM?=
 =?us-ascii?Q?/ssvBXmKtYImqEHAoDat8CI87745JXVUz0YzZnhCSZH6vjs4JtW0sGxGoYOK?=
 =?us-ascii?Q?S/GeT43qY5Sw7dN9t3hPa/vlUobNJfujivrPS5g8doECbmpDIVT7P5Je5yh2?=
 =?us-ascii?Q?0S+9kcXBCiQz0KkXMkClmCwx4HcCwd2Q/TF1DkCy9rdS2GVgXvwn5iI0ww1u?=
 =?us-ascii?Q?Ap1+ofTEPuJ0v2+hzkFjoLPFyitP9bK/QG7PJvcDrr99zcZf0AMqa8F8sH2/?=
 =?us-ascii?Q?MSeBw+Q1O2IojhDHGvutJctVvU70BNska1byXK6Gh7tFP0bgnfk62VBs8BuI?=
 =?us-ascii?Q?vfO7b8SuIw3u9KfmxBXJN//NgviaJx/dP/mhrIkRWIZ3nEcl8RxqgqZCy9wJ?=
 =?us-ascii?Q?eRx3iOcK05/pdcemQ3L80R9IqFNk+U5FvQBXOrC3azPVRid2oouXAkkFfSC6?=
 =?us-ascii?Q?Ct3mnpd2hyyYulw656myX/0HC4+63rMATNl3N7CvY9XA8yqBaVbGI49AYZiD?=
 =?us-ascii?Q?v2O23cnnN/lyUtLUEJYew/J1qEgd99WWLyNQRkjPgmV40KGBNXPJQthGThvb?=
 =?us-ascii?Q?AFERCOpkOIC5mnGJ0flz2HXvk9qZXbot8qqpbzhkF6pvRVSQyA1Lun/D/1Gg?=
 =?us-ascii?Q?1pskfkBqeh2KpR3/dINprQ3kPpQE9N6cbL726Ipt47k0UwHb6Dw0my7dGSk5?=
 =?us-ascii?Q?hG0at8Av/BWPxqU6+/6NYUigqz4HB8iGSATxzOVLA8JjtmB3hupAcf6zvxRA?=
 =?us-ascii?Q?hk0dWssftr96jrAGYQnbMEtO3KzJmoKperZpqTLZ4lNvgXFuyo/qTJN+r6aW?=
 =?us-ascii?Q?hH6YEZMfEor08sAgf8jBth2ahNSU5UCJeiHzXPYS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd0001d-a9f3-416d-ebac-08ddc5e3a017
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:12:39.3027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWh3w7rPd6RIBDYoMMA9oxgZT7mQQjB0dVqk9YPUHtVqO33QLmHbkC82HGyGR3UAnz5qapBx+707GilzN15YpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

The enable_audio() and disable_audio() callback pointers are in
plat_data structure, and the audio device driver needs to get plat_data
for assign these pointers. So add a function to export plat_data
structure.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 76c6570e2a85..3dfa42178f6c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -198,6 +198,12 @@ struct dw_hdmi {
 	enum drm_connector_status last_connector_result;
 };
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
+{
+	return hdmi->plat_data;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
+
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
 	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
 	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737c..a56a3519a22a 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi);
 #endif /* __IMX_HDMI_H__ */
-- 
2.34.1

