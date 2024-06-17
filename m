Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB890A114
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B2F10E0F3;
	Mon, 17 Jun 2024 00:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Fzuwy12Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2060.outbound.protection.outlook.com [40.107.113.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66E10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK67/qMwXjkwT4wvlXXFPVx3F/1+YqKR0+n0/mPaQrproqrCaFFKqYMTHthk1NQWFDzvilBuj4JOpa4xLQFybq9V4UjBcqR0i3EpNYJl5VzBwxqh3cOFLN40H94xSwx3dOje16PlUJgsMxMxtGTyroWQTv6kTQ9EAnBXe/J/ip2PrfRJfZRI6nBEbVKg+ZFPvZAdR8OYN+AT+ssX7oUVQVbjSiAyZgwooEgLkYiMECGmsboUksJlxL197gOcqEBMRV6Ea+uFBuFu+N+V3/Q+cnNCbYT0pOsr1ldtnlgzRoaF0GsVaYl8e/Tw3W1Ju9vt49Vgvf0Z7ZaCHqgt/TPbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=IGOWRJirrNdZimnYbSoFqdWIo8BAAWQUnPoG0vRCo6eg05dkwFipTAXXCfHKucuNbwx1q37ZFzGlP8/5uRjnlpOL8k+tZvuH82ht/76d420Dy2paPw0O/jDOl+P5dtmHizwBCHVIcJAn+/EVf0BRYg5kHTvyLHI4/AfCFlBcSwhBUD6cXoLNphrcAnUuYwVJwaEjE8kyaGdFbyvSmcHOllQjcZwvXF3BeedAjMuUVlwYUe8uFYtQIRuDNCsfj+vqtCWpSIVn8/DUW7boRmlMXP32r/Au+wXKKou8PUn//JfSV71abrWd9/DYD4p7xmHex3SjVHIT9ETZ7wC5Qe8FxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=Fzuwy12Ydl7exl22CFDWhBTMfSe4lTtHg9dgChwPiAy9tr2M7L1cvnZUPPG/fqHVrrUkVNqZy63yl88sL+Z9m99WkBTpd5pDH+Y9/PDrdnHAgRWB/9XfuCdWJtX+EF7JjJ3v4wy/tmqRcFb4VGMCsZ7PEAVCFu5dTXiFsyfgeJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:21 +0000
Message-ID: <87msnks7tj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 6/9] media: platform: xilinx: use
 for_each_endpoint_of_node()
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
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
 linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:59:20 +0000
X-ClientProxiedBy: TYCPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 97283901-a5de-43fd-200d-08dc8e68b8f7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lp/eih9Foa68sVUD5z9T3mA2fKql5IEiUA1Py/cmVuCEqnA+Nlmv0xnHEVtj?=
 =?us-ascii?Q?xuMre/9TN5alw2v12YPj74VBY274RVtAGTKEcUNHhH6/P/ISn0Bo7ZW/f83T?=
 =?us-ascii?Q?GN4mhvYWBpWrxPAAoM79t24+n03oVPF+Ksk9D/mzIOCIRXcxA+BzBgbCT7iW?=
 =?us-ascii?Q?ZnpBZFJT7/fQbirxaeCjJ8zB9nJYU1GsVwsEKtp0H/av/RUuUA8kqKJfImFI?=
 =?us-ascii?Q?dyxd3M93EO1/GPWfIdXg0Mh7heCQqshm53j6qQjCt6MuRZL87MNiGWqxcoOq?=
 =?us-ascii?Q?VchbZEt9tEVycOf1D6oAg6vW931CYXqVNUnTP4fodyzxS1i5FHrnGtraexI+?=
 =?us-ascii?Q?OvWhvvRNLiyphp+8KL4pB7v+WUcPuk1NzOO9BMoVEsJbE9a3GJTHPAJZ6k2e?=
 =?us-ascii?Q?OTq9yRn0QA47N2wtCh64Vz+bDNso7nwuorJVNN0VpLbWODDqFOACmD2D/ze9?=
 =?us-ascii?Q?vFcXCaGSb55sn5EsH9IMUs++3kd33ocuOqZjd/OJgD9lhHwgYTsEbNZXhJXr?=
 =?us-ascii?Q?lmYF2pl5n5yfcoN3eqdhFTOcDNSheGuE+xa/355ejA8EYk9yINQBLNet0LWG?=
 =?us-ascii?Q?mNjPIQvADFpkFnLsfqyDYFw9JSKt3w+tVsFVh+gPCzS6dJ4mc1YaWxQj2UNV?=
 =?us-ascii?Q?QBCSGF72jwEQtHNyQw+wAWAJ46QslMxI5k8DpgoOed/Oib79cMEj11CNrclp?=
 =?us-ascii?Q?SzpeadUlfZinSEZ9GI9K5I4fCN5Y08bW8vtG2wYwUYBtT/8Sc1HUCUudtbUz?=
 =?us-ascii?Q?yGDnQbz8x0By70sG6j+NZqatKsY41jRioNwX7waa9dPVPACdqVtXYx7rAdMy?=
 =?us-ascii?Q?eu9AaXlFUakr4IVBrFe01M8U7S/jgf+Zvv67gpukUjDzqiT8s2klgpeoMw/9?=
 =?us-ascii?Q?vvOaIuyfN0KpiqhY9IY4XsWQMcRpVJD+2ck/V1ffdZ2EKs7ukocYiMI1WGHN?=
 =?us-ascii?Q?4TWZUg87Jr0yJOKsKV3SalGTk/MtGcr2T8WnwYRRIOZMYICcUc8y+abLpBHk?=
 =?us-ascii?Q?obRzLyseOfVcMX2QN4JMJooIG4vc9Nl+K0jzmP+S6eZOlUriFIfyKskWEwm6?=
 =?us-ascii?Q?902Krr4zA92R49L4LMUrj+aUHZaMeM51376T5Xej5yopElhnIZLnnW3oZRkd?=
 =?us-ascii?Q?P3MF+Hz4Xw5/QtojZPkO3dMwMyboZkjO2Z0+8bjWEitsiI2MRyiwyjVFc572?=
 =?us-ascii?Q?glyn9t8OIgOiTZ0ilXibAtO1Uhcpg22saxwMXawEeZW3NtFKKX6CW/62s8iw?=
 =?us-ascii?Q?/tPT/47AFawhQh06xHzBiKSh1XHbERjNhUa/6m2AXriNdWoH+3hDhUsyNgOy?=
 =?us-ascii?Q?A2uD1nRhEGSkxYTlckGDHxAnFVtfn+u0tMJjHMaiahqtbL4Ie7zvZNxQKwlJ?=
 =?us-ascii?Q?RmVraQwPQ9ozEu5Inrt77R5eAhbv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ndHGorYUcgBssk6QamX4vhrmgA6UsAgHUX9OozVbb7aKOLA4RYtmVAzpWR23?=
 =?us-ascii?Q?1GZXg2qg2ndnZSi362U5D7G396eoVM9r57b5AhRNei/TUb01esqOSPZtpif7?=
 =?us-ascii?Q?BRavRIB91BJiLVZSniPjoeWBNnfkf9dhOks3Kw4ReBZXWTdoNp+YpXzIhs0b?=
 =?us-ascii?Q?/b4yaQu5Kmm3qJGgzwQpI1q1r1BljDAgj38Q99rf6Fq3Oi0b46MK120FW+ej?=
 =?us-ascii?Q?i/B5yoga9UdMwu30CzmNuOjZjXH8veP4htVZtTTfwfn3JyToDATBybgAbUA7?=
 =?us-ascii?Q?zgAlqA9/pibqMYs5n9mBGMN4vMviCd9KPgZvuVV/0fQRu6UA+J4QqJufJjf8?=
 =?us-ascii?Q?m5KXZsvuZvTYRJGabwMNoKq/17zrBWPz2py28RiBBD8lLqGeL6xir8uzFDRG?=
 =?us-ascii?Q?+DqSltUiAGy1kTFW4uBrVQA0SFbBO3GX52OVQYwCRhaJu2JM+wj7dlI7MLAe?=
 =?us-ascii?Q?5LZyLbvc6sfBc2bdx4gHDXButwzGkxEYpfh5kNi1c2lwM8owWXM9sVmmSaAX?=
 =?us-ascii?Q?osOrIFnPaM+sC9czhmEndKX+O61sP8YjMeEGl7Mc33/Ju0GIQBvilFfOxZPx?=
 =?us-ascii?Q?CnTAfx0jxgR+RV2kxe7ZZF2+F+hlIg3rQQOJmXSUrHsj4vejppybH0OKDcJf?=
 =?us-ascii?Q?xaW4L3ik8PR5wYmo9pdXk/uL1cnWQwVbNJa7uzKHTqJ0VzTuXTRQXuhvt4cn?=
 =?us-ascii?Q?kOB3pokWo7EvaEuuz63CgBHMpm1j0xexi6ygOHuj/UTuj9i9m0UF626TaPE8?=
 =?us-ascii?Q?yeQMk27SfsWMvEDU2/4sLomB6aWsIlHwh73j+cKp1y41U1m4IMtRgztjdjdE?=
 =?us-ascii?Q?X9zxQt69cRd0Y2JI5cU/96nA10Anna56QXMj4sdg9JyTdGfDQZzOpBbU6Rxq?=
 =?us-ascii?Q?5bRGhicXhPA378wqAjP6VMiulWOLQwTI8hkuAFBlnYdKQGHfIkOb2Pvz6vUH?=
 =?us-ascii?Q?bwi59yMOOVCTsQarSoUlM93WmxVWtwg3VNwevovf++PsyTh0rKU+S0RxrHam?=
 =?us-ascii?Q?KFi0Vinuqq3fh6SC3b/h4jdudlNSX1mDito7WXbCshFehswP0d5HvI7ECcuQ?=
 =?us-ascii?Q?8Kx1qApJQoKgXkUff1FhlGaZsq+jPX7wzWLseKC2c9NEzSei4o940PMy4mIb?=
 =?us-ascii?Q?1mT1zXGV7d3ogeFxTYlfj0KWdfin5O/lmSOuuGXXLLBzyJ1eLJMTZUvCLZOf?=
 =?us-ascii?Q?UWJ31SHGtxzZD90Eyukh2NHrNRwtPlq+9WEeVM4sGMIFHQoO9xl4w3acAYhd?=
 =?us-ascii?Q?mpiwYHSINF7W7V5vZDOoDn2XL7DnLwIfSFwuwUMOdMYIPABaCFyBsxn1R1WN?=
 =?us-ascii?Q?5Ma7j98uckfXYQp5Ut6RheVbYl8DFe1jIU9mqWXefFOsFDPMrkA3bsjY+lJq?=
 =?us-ascii?Q?/uS8hB0KgrOmo4di7Vixu+W3nWeVEgl+5fuyIqAhIQwCCIwhs0eDHQ9Ytgo+?=
 =?us-ascii?Q?ZIRVtWkGGnjJW+mD+vz6wURAdLHMNd20K5NVlV8/Ks0F4Nc8qKhA0pPzRjqv?=
 =?us-ascii?Q?j3LiasLPsPwlY6spQGc7JCFJ8dSgENTByyDJ5V7JVi7thcVO1cHLLzCG3iP7?=
 =?us-ascii?Q?ywtMeNFGukIGd1qNQJIYNvY8HHLrCfDVwohbxgPu/BGiFwITB/WdogXE6EZV?=
 =?us-ascii?Q?ondcETTlxudJJB7f4LNDgVw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97283901-a5de-43fd-200d-08dc8e68b8f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:21.2029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zi5tiCkJOOuJuA/ooYpzcqB7bhRajdcVesEpP88dbpUtZppRlrJ+HytqoIcEqWd5dT+MGGnE4luO4l4e9xTMg+weCu5ZCBcQDC32OgOhFIpJ7NbPmwmkTqgACU43zb+0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a730383..bfe48cc0ab525 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -199,18 +199,13 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 	struct media_pad *sink_pad;
 	struct xvip_graph_entity *ent;
 	struct v4l2_fwnode_link link;
-	struct device_node *ep = NULL;
+	struct device_node *ep;
 	struct xvip_dma *dma;
 	int ret = 0;
 
 	dev_dbg(xdev->dev, "creating links for DMA engines\n");
 
-	while (1) {
-		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
-		if (ep == NULL)
-			break;
-
+	for_each_endpoint_of_node(node, ep) {
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
 		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-- 
2.43.0

