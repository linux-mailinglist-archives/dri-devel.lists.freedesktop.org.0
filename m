Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B118889D8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64010E567;
	Mon, 25 Mar 2024 03:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="mcaSDjWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2060.outbound.protection.outlook.com [40.107.114.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBDE10E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWIrXNmb+I5Fpm/POezXzKVhnDYJZ5RBP7RGjorav7wCHg5iJs7aSWzgkjyVuISbuNzAUY2VH8bQfa5V6BbFSbbu2tdlYWr1+ySVw1AGrafK4/V6QmQwTI6hoXlj3hS08Ghnhp4r3K7N3Y4TgI/sAuSQqmuOFbYmgE4snB4AbNMAJRzx3ak4I2BPrEHd62etPoNjFgsDdJGeSGev578KHnHxDqZ8ZHqaW06PvWPzyLjsKyBmuuEYRdEGcTM9BCohEkzaRaVVbRQuZyITQ1UTAcfu3CZEDsuRllVNi/QBH84a7Ht2P16wsYHEThMYcGpADk9KoNs9zB1ImqxqPiUwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyRXIBsVOEuvEsI+HIz1KBO2P7gmWNbvh+DmO4P6oN0=;
 b=lZKuC0IdYkXFHZvLBftIzfkAjkfFxBqoZLEK12OnREixOijO4kVQMKPQxZhgf9JLrpkthlqvaTctGiTIRs69g+5FmoxRqLFCMzBXULH8vHylxRuofkT1h/20JFYRtyUfpGq4srcjE2vFKFsAOHwiYom5VgloOzg3YM+z4Bd+/IPjn7maJmpazB6SbRFcW1vDXgkesEQq+6gsP8cYALFZRGCCYs+yG4Lx48n+iLdyHPzT+7kK6EMSWE5Z8hu3uv1hYU1gbp44bVOKpHseL8LJqX22XO11t0XS7zdfwAcWIsQVnE1da7vDAPvUPFFh4JtS/xz40F1l325ndUDNzeuNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyRXIBsVOEuvEsI+HIz1KBO2P7gmWNbvh+DmO4P6oN0=;
 b=mcaSDjWH3R4LWvfxMhrNtzFrLkw1ZcKVBaKOMnuf4ITuqGdUjYiWc9j0zl65FPd5Wx3lU5kRcFrKzFpdK7PHN2a5xUS7fCmepKb8ODWHvOsfAzN0PsnZ40b2hTLRcjl+Og2SQlzXTQ2T3pU6UsfRmLXfQBfr8JUd1FQIAkmwTnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:21 +0000
Message-ID: <87y1a757v2.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/8] media: platform: microchip: use
 for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:21 +0000
X-ClientProxiedBy: TYCPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:405::28)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b73231-50a1-4345-6412-08dc4c7868ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cc7NZGTUx3A7kgsb8D27sL9mYjy/PZt+/+P79h1lDmap9tZof4EsKbtay6cN5Ra+XQVgcu17JG5RsZiPwIIdxyY3pD329DHGTh3mxFTSpMk7PQhhTFWxmSKomG80AEtgiZQqx1j/+rArU0bt+HyOO8kZ+1e9q68wfseGgQ0LQo1Z8c4PyPQ8OgGlBZCEBG2oJtyU74VDlKtz33dAacjcGCFHMgKDUlRBu5V1WmfYceDZN2YSc36q+y3U22T68+iB1JnTCnAHNF5LLo7mL3Pq5/w95XpkMzOyeZ7Wu+PNHoqn6q/ImUlbNwqRzb2TqWvBkc5exVyJFCA/t81UBcJyfIvxnbOddOMn6IQ9o2LuGQDJCD8feA2pYt0OM1KN+Du2ORHTeTFtDeOhOIRncTYhQGTfvrSypWaRH0Y0BpCE1DZpg/K6Iflo2U34O+khcQZ1T2fIiXqQJ90VLdIC8EHvff5nEhq0kqxljIW/AjZ9YMKlbIlusZmjE+an+yy1/Go/0QCZQo/dQjeFAXn8MDUVvFM0Pt/5Cnalqn8oTyS2EAmoaOBVi1lSE/SZGcP5eeHbMXZMEdHvFGWvrsqEnOddyniRyXj/eiX6d/hZhEFEUXaGEVtV1/hPn7TwZb5NFwYOeGOlmFMSdxi+onu0gx9Wt0nVyUnZQ/Q9yCNRqp6p+BFwyAZD+APoiQXuzBwcSsvBmoPNIB/Jlj48dHzhEl+Djhc6kjyODTsxtiuqFSLnTXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SpI0iEn8LD8frFuyNLj6hrmNMrup4VEfeM2feKQYi0tT2XGSaF3sNduhQzWR?=
 =?us-ascii?Q?0m8owvr1c6Dvsx2T6sdtnK9IgEi3YzsLlnHFfjSjgMyUcNC5PUdMg8x32QrR?=
 =?us-ascii?Q?DnRJ1YpMx3tfQ24GEYnpeDMEc0xxHq+0hj8ImBFL2HB+vTp83sSgDntTMg0M?=
 =?us-ascii?Q?aUDdKnckGiIt9Y9sdAVtxwNI5HPCdGNfD2y+9B8mov7rF469wz1jRJjYqmWO?=
 =?us-ascii?Q?8tdCsdwAG6PGvM0G55M8unk3IYNV7E9AfW836CRedyU8l/rEtIX/klamX2+A?=
 =?us-ascii?Q?cwBUcr72iQidZUlCRoO9CuC1BgQIRWy/c8oUz850IOLkHorhziuApCq0J8cS?=
 =?us-ascii?Q?iRf4E07xNXKtJ1lRxetiO3i7x3x1nWAZ0Z70zJw62W5aLQuxZI2Ocb+3kK6G?=
 =?us-ascii?Q?1hcUCvLXduYAsOEMQStl+S2h7KDWeLtyioxMP5rcKXZnTlGdwgx2CBIUbTdp?=
 =?us-ascii?Q?Q/Qdpdq5PeJ3QY6Fvvz+Lmicy0CdpRELsZmsR/xg/KGCEJ1s6xOVi4Qx3D13?=
 =?us-ascii?Q?q8ko+Mmg4u9MnDn7bamsysfUIpBtLy7DL76uq5CagNI8lJ8QJ7ua/9rSw3G3?=
 =?us-ascii?Q?MW4K8JxoZTFA+Hu7gsieN36IYLWSUPomfePwgSSbyD8JBNJ5JfZ/+CcWa2Dq?=
 =?us-ascii?Q?Q7p3huZX92GjCAzM4EfeqPq/hfTzB13/EDvWnyDGp52ut0uyjlTZ6D3UU/aR?=
 =?us-ascii?Q?wKkE72L6llrPxFDbrGc4RPp0FMsXUcdkN0Lo/kxI+3fjmKuoMHfTRgv0s7ID?=
 =?us-ascii?Q?3CS+Xu2rs/D5WKdRl7dFAa0uUzlTQzsCQcXMBJh6mR0MptsMqoKSyYwwWiZC?=
 =?us-ascii?Q?vcvRudfBcQpgBrMjkbmQJCHl+kE+FHAK3ol9ROChqnmO9rHtGNPUoYEErQZt?=
 =?us-ascii?Q?ADXo7Tb/g4HaNztLMI5y5JoZz8hzH9kJ59eR8rcwNBH+6uDptx6KnKT9JY1T?=
 =?us-ascii?Q?O1puoxNjxWo8rvo1ESznUKPCuwSGHpMB7aPdnvNB8UqFeB07nAl6lwOvc3i+?=
 =?us-ascii?Q?Q2pU95+hRF58ZDVJSIhM/YoEMvWCSTvzYFlUFl3mLMX3nlSGFNiNEMGsPRay?=
 =?us-ascii?Q?ZejWdSCfmbvI8/GdoT2rPkimtcTyjVkXp8YkQjlKhim++8+bDJRlOr8H6lZs?=
 =?us-ascii?Q?oioezXZDPu/LlUjaEcb8JiVBtnvVltmZJZ/65LWaTnSBmcDzZSIkoYOUd49+?=
 =?us-ascii?Q?cIeTLSW67GuOdE9FgFAFvFQ5chIXJyA7V6HIF9CRUZRw3iYxCZqDKQUd5qyg?=
 =?us-ascii?Q?imu2cVr/dtppMHlGKMmzjr7Im9cFWFp4vxb5yp9JA887AvSiH+MehKbSDThw?=
 =?us-ascii?Q?Ni7SCJ2i1rW/uRLUuqez4aAdC+eDXHOq9et/sCSK/Rcx4eeiJtbpSaKJGtf3?=
 =?us-ascii?Q?P8lfASkX7YEkPC7t3x8MuqlxAUJui2ss6nwNbxNylHTPtx6WdwTn3U9tEK81?=
 =?us-ascii?Q?zhq+XhFohTOQ7Kdiz8dFOr0rA0B163JAPN7bTuxvDK4EUrxhrhZsYFJIpHp9?=
 =?us-ascii?Q?hTfY+GWRDtGodFcsb6lK+dQEfA6Qkgf/GlCsJHwbbQane8UDxusCQy//DGKy?=
 =?us-ascii?Q?64fKvwzNoZsyrvtdytn0+oAy+U8Sri52HNmyWpfhr+EG2NztaZRgp5XM02Bg?=
 =?us-ascii?Q?f0RUpWue+hiZ67deGGqxhYI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b73231-50a1-4345-6412-08dc4c7868ce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:21.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDdqig2Tt7xGNYS/HtgLrjCj9jOJ2qQVrfCnawnU9T8wPBoqxPaIAfNzwKSeO6hZuQUhK9IXPomkf2FmeD4Oo/3k8xIdGTsKSBvVsC0Sl5pn5GZpOkJou8BqUbxa8O3Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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

