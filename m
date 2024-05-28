Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BF8D2906
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEB911223E;
	Tue, 28 May 2024 23:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Su3+w8Jg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2057.outbound.protection.outlook.com [40.107.114.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D8B11223E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGjtuQyYvEeZ+gFACLE7Zs7vGLvoVot3LxRppLVWfBVZKGppbjWPc/0C2FmqD7E/ukKzIfcOiaQZQg/BDS8HE86ZUzByO7hSSukBS01O8eKvdWUWjKWXYuaWnMlrzCHyFqpxupYJwW20W3eoHCPc5DfSIbaspK8MIje6c6acqnTf9POlmDaxZDUPwn+mMVGo7EmG07sxY6tECVILN9iZ9ADiHopcMTvAS69hfWIvWX2sFN1oakoHymm+ukstCL7yIsJI8MA1BOMfL4T2BNQM1T9S6Hu4ccYBPEoLea/DEfiIYJcou4CK7NKa454XKsptOSmnD7pSlX5fZHpN0IX+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AflE0wTd/gC2/pi90zV18jpYHBCnhEamyrjrM01l3rM=;
 b=dqajXulD+ZT58fHCT86Nu4PsVXpPTmRUroh6eWCELn+AO4JAL7JTXtqfGDPvKtDit2Uij17HqPrbvmqFaIGA3qCv6U/6TYvSEgYYG42XYpb+7Ug00XRa34oA+/y4ZSD/PswIJrTZZ4kP2RErhnrqEyCRcP9lJf42MDUsLU3qQ1BLMK4IEy3X1pt1nQ3t1b8hHEXjz08CwjefWgpPfYMvpkHiV+UBAmn7pO2mqgS6G0wfTQ87qhhKeoWsDHr7jsjl3PGmZCJYCqOPnWCIBU+0T/+IglSWq64jUIP3oFEzqsQ7WG0ekplhV+wYyfIDfq5X3o9F6/05aG7fTVSeG8bVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AflE0wTd/gC2/pi90zV18jpYHBCnhEamyrjrM01l3rM=;
 b=Su3+w8JgoPEBO+fKdaASLlfhAW6lAYrK60tf1G0pI0pvtKvvwsYSQyW8NaobWyvnKGWgPjYS3kZ6W65gE3V0seP+7FwPc4kZ9qyiGpKjMVodUY73C0hU/YMdY2RJ+/VW7lI8Mt4dg/iaLFivAIG5UFP+l2Za7GvEHQrDNbeA8Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:37 +0000
Message-ID: <87ed9l4hl2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 3/8] media: platform: microchip: use
 for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:37 +0000
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bb3969-0cab-4bca-fd82-08dc7f71ac1a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e3tIqq8WhRj1tob2yZZGUMU7O02hDB5uTabtBlKDn5PrL9fY1WnXmTAUomT8?=
 =?us-ascii?Q?wlaLFMpKXOX+MHfBmOvKna91lzEI/jb7gnqbl3gpuptLhEhhtBvi/gOonu+W?=
 =?us-ascii?Q?SfYXweXF+ZLklDCFmCXqPxjEUMtINsDZyioalQEHPUV97nG4S8p32yXKfY6E?=
 =?us-ascii?Q?tuZvzaTAgtWXFomULl9CQ5x6l4JFPWeVDFH63IC/Ex0BJZDWUxucBVpOpTPr?=
 =?us-ascii?Q?9nBFf84m98+hnHgP+jhPdtTaErr+REaKdPukfr77sUFTsvw9EzvZAEvQwXlQ?=
 =?us-ascii?Q?YaX4G8HdMnmCKD40mjAwmQ4AyVxvDM8S04ROSyWBI907CvcwPyE1QOKjZcqB?=
 =?us-ascii?Q?cxRV4tqe4Xa+lHMzVWWgN+2wQAfn85Y1SzNvlVOgeAFFHC6DGYLWrY6UuYFo?=
 =?us-ascii?Q?xJuBIf0YA9U7tpGQjCcb0GgsIuVvDksngpa6hXlzLqTUB1LiPwyP+mjn7AGH?=
 =?us-ascii?Q?weaCtJ/uc7fS7fCyoFlWjkJYwJJ5VSVLkJUtx6zizVQOWq0hWiQQoM5YRpaX?=
 =?us-ascii?Q?vuI54b/7Ysu/iycYJHRmDZNu6nHf1/rfBTPoOCneZhfa2wycf6DJCr1dZQ1U?=
 =?us-ascii?Q?5Dyurr478U23Ej8ueT2junpuLyU9S+XMao0qSoyOGWoQrsYqdC9Ywk+aVi3H?=
 =?us-ascii?Q?zqQ5t8qez49Hxv9Nrvwt9C5e0ATTCz0LX456wqbbtLXwZWqdebBstiO0F5n6?=
 =?us-ascii?Q?2Y3uT9H/CJpMkgRbZLYx3USPQ7BvlWlnTueLn18kIG111jL3hXZU/vJVCPrv?=
 =?us-ascii?Q?uLUaW2AnnK94gqqXT8X+CKWDAre8UfE6l6cVGBfkho9e+QWQY/e4gf4EqK6J?=
 =?us-ascii?Q?7V6hqP45YZnTqvLTGtXE6Lp8f/C2zlIwS/3LCT98qJwHth/2/9rDcx5nOlmK?=
 =?us-ascii?Q?nlTLepbsvXVAPGKmSqXOn1234sjVaTukDptnVTke4SNApkm9X2GDzh3Q93qV?=
 =?us-ascii?Q?1dDcbwNLiLkZ3OmZk653zuCu2DMZZfPEjb/K4DhGL0NUtCLjE+W3UZ9lnBTG?=
 =?us-ascii?Q?4WpALqNKQUfzAMYKHBe4H3TqkRdQ7hZiZNk0t8tfk4ogLRGMYyXpqrj6ZcVe?=
 =?us-ascii?Q?T8e2xO5x6mFtsqbFnV6/PuSVBc5hQ34upzbl4L08jOKGGWAo8xTa39hEKTsp?=
 =?us-ascii?Q?McMgNMZEusPQmMRBoluCQ2iKnPocLbdDqAmlbyARqdn7/R23ml3eGbgq+bdi?=
 =?us-ascii?Q?8Y5pPLp37Ck2zP/ca29wnKsGVczJRprdY2wsSpLCGpskXzlDDgBfuEWoZDj6?=
 =?us-ascii?Q?OMK169cZzUhkjzcDVjH4Mee6JL17uRIfMkrbvt6MBfYUvybh/ehPQ20een7I?=
 =?us-ascii?Q?i+uLTVdBmyh5BpHpRhR10T9xNE8orH8QIRbcowhEUAxJYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RTikJBgPoxztzZRz5aDYhY/c6oz7j6avPuUVT1+h6E2xGkb9UsxPCJU3Ivy?=
 =?us-ascii?Q?aGOkZ98NBEPlkuTdsHVsq+1lfsLM0erZHNJQeq0mVuatGG8nCHRDFXpJ8WTB?=
 =?us-ascii?Q?YGwAfJhvomXiaWetkvKwoMrDV5o6M2SLXPNPQ8GpSEoLw1agDTWZSZ/SVj3n?=
 =?us-ascii?Q?5IY+x5GF6m8R3GEfuqIxU4DZhDM0bWwW6aP8wX3LZODBH57aUXydz3zOoJ2q?=
 =?us-ascii?Q?os5OrL56MxPp7DJVOKlqAWyrvmTVhPALbY4viGgwes+a27qcG8wDYhdrKJjx?=
 =?us-ascii?Q?OSOlxUmjvjuqEnbmq7iFgnydONnGhGA3Na0fnYChrHmncbOxtmuOktkUCebV?=
 =?us-ascii?Q?fwwxUHunzL6g/El75rOWZWcoCE8HhIYVIdNzxfT0hS/JPWZN2vRtFyWrlJqb?=
 =?us-ascii?Q?sf20DPPus4f6wssY1Wb1lYjkiHYg+g7ShROz8tnf28ctvNMIcgO7rIzC58/w?=
 =?us-ascii?Q?lgPNm+L0/xKCS6l0dM2zI0q6GVfZrSpOvvT/ScvHViI3/bnt6zKjNJnmFfWh?=
 =?us-ascii?Q?1OpHsl6CG1lW+PkzN8CkAnClEf3ELEALrZaDLTl3MKH+d4XgnJFEBcOOqF4Y?=
 =?us-ascii?Q?Ja4rXeF4pCtfP4o02iESxXoGR00gcqoP+dB63gO3WYBMUqAZMXYDBhCap4Y0?=
 =?us-ascii?Q?kQsMuk1anw5qTXFIuZ6cuWdUenQjGAsvqjzTij8+QZ9hJEKeE+uiX1hTBvf8?=
 =?us-ascii?Q?sZfZY8gKWq8hueaXNmtgq54n02F9vZoHmVcu0FEmWvFfjnMBOcCxpL/Uj1vw?=
 =?us-ascii?Q?RMzUEWdUGuY1dTLaVEin8v8Cgvf4Irh7n/4P3LDfzwIIgwQlpR954AG3j56h?=
 =?us-ascii?Q?EFRYeXjfPnedvME9hYxTW493VPmNQxOmUJb/VSvk/8nfEOzj/r4haMQXjbT2?=
 =?us-ascii?Q?e9e4xDH5ZOaN1C+RJLAMQ38QkEZp8Exf1yFbfZUpYgdVelwDuNrT+lHTiwQv?=
 =?us-ascii?Q?MMEvYpt88IGL6M3Bqgh7wIDWXs0O5qHTexNG9+3tRNAeOOzFneYxBUynj3Sl?=
 =?us-ascii?Q?xrrblca11IIkP2WvYtXiq4bpUm6uwbYnZ2l9OgNrRlf3X4Br5hjnibHSpQhY?=
 =?us-ascii?Q?vepmYlySZFfWryH8zzeGFu8YqcqvqIJJHNYE+MyMq2XZKPTIvxOebVSjGcid?=
 =?us-ascii?Q?qr3jjv7wcI21uD7/FhgGIAkWKU6f4IUGAjK/9pur3Nnp+CNbDz9D97m5kVVX?=
 =?us-ascii?Q?prb6wj3fByD9qQd4KJ6eq4gcf4Ug7lMszKaKFw02tZWm3cGuQbzoI7a6yDtZ?=
 =?us-ascii?Q?se3krEim6HGJujWlokxZoR+0E5xoOc4Zcz6xyIwYrZ1AZQOek9MM9llsNgG8?=
 =?us-ascii?Q?haDsDjmkSKPqKR7QA7IAhmvO2FFO0Q6Vr/VV5FSgBQorjd9uayH1PY+7wCO4?=
 =?us-ascii?Q?71CjpsAzRKg3EJXyL49AaTqExDmErvLUdHQK3xqIcpFMXcYGQMGOGjXQyqlt?=
 =?us-ascii?Q?9Cw6rZECUA7QwYt7v1c5C0+TEcO81Oqk+y4eCOQ31p2nbh/6m38PvJRA+i71?=
 =?us-ascii?Q?VRGSw1uHzycJMovLmuhU/oabLy5bRfvgxqwlGoj4KkfaD7g1Ww8qyang5KJM?=
 =?us-ascii?Q?GtTPDct+95gCI33Y9gN1sW7aYCQhImF3AErYZbSUiXXzL7Fz0sjMWe8jAsOy?=
 =?us-ascii?Q?20AA3b3ZUjqhrvedeXnCLX0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bb3969-0cab-4bca-fd82-08dc7f71ac1a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:37.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3YK9mkXRyQPL2kurtKM5nVINNo9CEvzCMJ8x1Bk/0vgtqWEXtdlHTfkejw8+G1b8t/JtfaysUpV5y6fsgDzZwc38ammYtTrzrTCEEmSk+mrI7+Rkcnq8EvFY1Pv1qIZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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
index 5ac149cf3647f..d9298771f5097 100644
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
index 73445f33d26ba..36204fee10aa2 100644
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
2.43.0

