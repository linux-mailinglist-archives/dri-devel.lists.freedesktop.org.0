Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC92893670
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CBF10EC52;
	Mon,  1 Apr 2024 00:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="XhJzAbYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07ED10EC52
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGazy9fsTdMeACToC9ne+78DlPGaRioJt/maIKMqt2GPVJPnapvKUeLz4GEUVGjgL4IyzUcTcoYuloOAgo6xHacCZdHwJDwzO8kuzwfSts8Kr0PqKPC4oaBklxGuJMY/ISGt8jCaQGgHGE8b8jg5+27P9OkA0buYsmvf8woHnX7O6QO2UKttmntEgx9pYuUdnlNmqBfeOKc4q+fNays1FL10NyQbt/i+/1BQ4KXPJ5AnO4x5WN9nHGH+QodyNjoA5siocrwcyJ5eOZVDjQL8i2Hm7G2G9p0HcjyJHI5xfzBY3J8vEimT0cxuLR4Cvk2D6gxdEb8AWoxyTJbzWHjKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyRXIBsVOEuvEsI+HIz1KBO2P7gmWNbvh+DmO4P6oN0=;
 b=D5eVUUmo7Nx8l0j2Q9d+DmDXhHtuIidg8mNA5Vt8lyB2GgxAaBOQymHVoRQx5yo4CBJkAqfbzvpGXlzHqGbhqgcgZghneZjxt2a71KhiP2qos41BIXsByBn4YEcJVMxzk6hiuTeI7zFjaNzRmbcJIImoTDXU2HFMvYJe2jC0d2vKISUzUIWSYhRHEfBWPu73NRLhVn8MxkhvdWvcq8Dci2WZRCpKilK+SxPAjKhgC1ibXKqvKEUKJj8WSHMexanSpiUMJUcLJG32FaYPvZui01iTVNB3N3a0woSp/V2hoe9L7O1JxLK5mWAQYgEkFhs/D29A6O6DXJ5z+mTYwuling==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyRXIBsVOEuvEsI+HIz1KBO2P7gmWNbvh+DmO4P6oN0=;
 b=XhJzAbYoFF4r2DmnszfQiaoReVE48EA+3uEch5oGF5Fo9thFxqJENUU9g8s5xUpArxaO+AN9hsl+Sh/dzul4FxkOlqaNVxyrWAkge1F6Aalm5NtpJxhtpnNxP0OKo0Mr89dUKcDdslZNHRQ1ZrdAO4QRd3McV6ZEDH+h8XkWCro=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7826.jpnprd01.prod.outlook.com
 (2603:1096:604:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:05:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:05:54 +0000
Message-ID: <878r1yueu6.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/8] media: platform: microchip: use
 for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:05:54 +0000
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7826:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CwSm7xsiX1NZ6fCy5313Lmt2v5cv8ZlZcHAiR4uf30MDjYYNmj8kL4YnIFvBrm58VdXdoTDWfhRjXmeArXTd/TWFGGNfIwXz4kiPOtv5e6oMo/SERVSSCgm8IM3ghlRKvxyIjvxWtc4HSvA4ovNaahE5yB+uQ5vvnW8oHHGCKVolwsOG0l9vSxdwi5+PhJuO14J9Rysj+E8ZUKbZXcPe8PTJfaax2pDHcgOqi+jTD/FZTMkWIdTsyVcwY6mBZSSPRVGzgFEAcrtzQTZs5vWSyTMOAfCWhjHcu7K/dUy5ptu27vrmykZtlh5VwDSvSROI4cz/ymMAtP5Y2+C/uEH3Ua9qfMVYtZ5oxmgO1V9OjiGmiUavVMyvdZabKG8QUWDRNFYif6f7s7y/vU5M8bnLr7eqfYa18pf1Vtpd37FjVWHE74QmL585xhxWNbDneRVm/h7il/zlJClsigUT37SRLqx78bbcjFe4Oq8doyOPsf5Naix8oULJoowDPXnFMKiyhhFPIVe0ooN15jTKJDEYaFKl6BECCUKCkBTdIpxnaDt3hrUjMgINKEr7q+4Gku4plFRNsrueykJ9M2hdOmsiiQYsps2e0y3WhlAX5ouQXyUyWUNR0DPIj9ApYxTDLCaiM+RxGsOhWgVnAfdOi2lHLlYiTCLsZKNJHy36H4No6t/8sfY2VPz0RkV4rxtBEzsCDUoTwPcCDHLJAMCgH+qng1+z1MPgPMK/Edgu/QGhIcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ugaFha11OrynSRHxVm952CU29Hl0dl4obe2Ig2xEtzZKGPjOBvmF8Nc/JiLW?=
 =?us-ascii?Q?BoxOtJe17Yle4a0dOcPjt7yTL0TEK7Hph4MC2sBgGaInRNrvdsQX4LQWWvso?=
 =?us-ascii?Q?INSbftd/vCzW28MaXfNL3WfqMjqmBG19Mshj5LLvwdV5pG27HXsOE5v9YUIX?=
 =?us-ascii?Q?1ZGjLixSagVkPtTEsToMm5PNRudLdZOIcpRFDINiJwJT6rmN0q1blYO2M/1X?=
 =?us-ascii?Q?HpJtHka0V6vJKoHu7+C7VHEWMnBYaPOJA3LbM/ciMLREThn6SzrfpQR4bhgw?=
 =?us-ascii?Q?+UHFMb4G+CQONkHhuGnXPyYxMqXXE7tUS7F6Rmy6kfxMT5hexGZXMu97KCQ0?=
 =?us-ascii?Q?WZGWvZl6TZhV5GOSAQzwC3FPaV2DzwzfjFG/D2I1qh05jFZc5AGizINAIHfj?=
 =?us-ascii?Q?WMvXkYULXnkXsZBFk0danVfB8xrL+fCw7xXaCEu/d77f90Qy5VM7zoMdqNU/?=
 =?us-ascii?Q?I05rTG8BtSWS2lo20zO6EU0aGm++OKI4vlTrac85kjWQ2zugplIC7RBsWTYU?=
 =?us-ascii?Q?DuKBA0mCa7nJ33wM00DRHQhMBfAqyQDzUJW7aCB8GPKLUThquWrJaBoHkDLq?=
 =?us-ascii?Q?FqI+mRYSj44WF/TrVx6nuWjznbaKte4HB9w1EDOoFsO7pp5GPcY2Z6UKzrle?=
 =?us-ascii?Q?K5+6+mCkpmeoz24G5Axftjqs/B0GgddMYyMlleZhq+SVIw9wJP+0nQ/umQbk?=
 =?us-ascii?Q?6uXgnwlJ3D+mAg5c1+dRIWwBWMfHb88pIuyywuZYjWEk5dxC3w2XsNaSCWX/?=
 =?us-ascii?Q?3U8O2PT/RMXKGFLJ2h/Kd1jVHipBpYWzfvpTSnO5JGBf9tVuXpvIzoh/0NX1?=
 =?us-ascii?Q?zw5hVOItewgPMF6RcT0ZEH53myRoKBT4HOma9IB3Y70sGLxHso0YfXFIyRM+?=
 =?us-ascii?Q?6G+K4CFKQfixv/47j7okOSn+RKS562B/QMVG14fFrEgKmzV5vzg2j+QQE3Nf?=
 =?us-ascii?Q?KYPbRWwR6M6E6B/VzCsqGyfS0EABRMaI3b7LWBtVK02kq8yU5pXdQAirqstn?=
 =?us-ascii?Q?POB+t1XIdAPLJYIcOM0f6oK3g7SmtrVKaU3dToKrjuLUM3vJ2bVmQGFLNW7s?=
 =?us-ascii?Q?D5++cKFzhIIyJqeBrlIkO5UWJdIC8RM3o+LxVqNK6EhEo8CbZ1Fc9q5/03//?=
 =?us-ascii?Q?Sp5PtearfalAGUENF5XMyvCfsW0XJqaZUqdF0ZifHBawANf12+bxQnARU5Ys?=
 =?us-ascii?Q?SOQTuSCR1xrmtXKWwPyx7rxOnCmr9IoJRsWi/yraiylOZ+j0v+edImyDEgCN?=
 =?us-ascii?Q?CfdiJOPoLnopRWnct+6GxWRWxO//xqxRuLxpxoBaOMz46yneT/7aknfsvLDb?=
 =?us-ascii?Q?ccyw6KwklZD+dV8bfalc7h6+f8oOUBbaW6g0SvJFs6mGcGKPA/2h1/ifLdP9?=
 =?us-ascii?Q?VoJIkA1/5Fby1bTfYhN9rGu38iijL3/bRzrvZcS9J08JI44gnS0g8WyWzFoh?=
 =?us-ascii?Q?pjPERcpqCvNTT1VBvuuUKEOulC7SCgOZXre/8UXT7+lDv2VtvW2kmA8rqGR8?=
 =?us-ascii?Q?biVMeYgcohSWk1O/M34uQlp8A5rszUUwPLeDAVsahvPEgiDbRZi1F3Tht3P/?=
 =?us-ascii?Q?zovVUaXPjyfpgwTtr/J//lwbZPjzI3ZB9fzevvyfG09LnCpfIKixXiU8Dh3s?=
 =?us-ascii?Q?6JZkcOnjP0TjHjTRbXAizaY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add25e60-5fc7-4ad9-ab2f-08dc51df7fb2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:05:54.3268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhLXQqeWEQxTA0OWHrHUkVxqYK6kVVnFXEJPDY73oLnwQwo0++ok/2Plbss2q/dQUSUR9//33V8wy9JpgjYPgsNslhlvZePp9VWgeT0lo/9HHOpe+ZCkSQFUjWshi34X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7826
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../microchip/microchip-sama5d2-isc.c         | 19 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 19 +++++++------------
 2 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5ac149cf3647..d9298771f509 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -356,30 +356,26 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 	struct device_node *epn = NULL;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -400,9 +396,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_isc_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 73445f33d26b..36204fee10aa 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -339,33 +339,29 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 	struct device_node *epn = NULL;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -389,9 +385,8 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_xisc_probe(struct platform_device *pdev)
-- 
2.25.1

