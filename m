Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA88D4357
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61D710EB6D;
	Thu, 30 May 2024 02:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="EYQb0Lin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2068.outbound.protection.outlook.com [40.107.113.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A0E10E536
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nabz4HtLjmGD+J6IcrJdRJnGezr/i/wQxC046nANn600WngzgxGdAKdRl8Dc+YJMG0Xh/TLdzGuosv/utkEdbvBvWUBXc+FoxwSh1ikcSYqi/ppqITB6+XZknQBJrPJP/fVea8GprTrSpqJlU7teDqj+zI43aWwCI+wyhLEFwJ3wWs5z9NGqqPcKrmfno+5V+sNs3WwFWoVKKyVUY1oxlT0bnLobZvxOo6stm2UFLV2zx3l+x1Iy7QDrmTcKt84Yj0WivSOXIb79nRHV14eQ1FWcGsqyg4spuV2tKdI4EtjpBVnKXvc6/+iRBLmVroJB2MNe24iQ0LKV3ZFPBMUeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REllXbKiXbTph1LoY5sZTemVlDAhDPlDjVQgZtSkG30=;
 b=HChtLQI6wwcXsNZSC96qHI+6WzPU8mBp6Sz/QBzrULTfH/QFZNF1EM7juQLbVeqIZnFAdMwHVoRCaDC6vj7kAE6CR1HaenEM1SlYna6iq94K23+rRMvD+/txrwqzUwpe8kwYVoj1tGwzMYRDtL8G5T59PCE3vOD1QR3i/xmPfdPsA3vgMCUbEaavC1LYb2QecVmmAHnZyEJNi1eMQVxc/TQ9VAFv58uZmck+3iq95eve3NhkJJfYY05o9m4XC81XxOaKPIvnPve6uHaWRfav1r4H+6amr8obzvXc5SKlLxJ/qAyxj8zolqQAIAs9JWQpbobhs7AOcBrPiV321UUl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REllXbKiXbTph1LoY5sZTemVlDAhDPlDjVQgZtSkG30=;
 b=EYQb0Linfzskw4OyxANtjtykS445NLrSZaxWXUCOSefOD7tZerMw9JTx0yTNWHvrvja8tAZE9VhzP/TGXlXhXSjxRUZOr8GMLbtA5RnTbfHCqkcE/cAd7dso2ROrybcIzP+vyA4oF4+Bvi9svuHIZm98AHmS9Hx4Zy3oqsUcNhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9900.jpnprd01.prod.outlook.com
 (2603:1096:400:223::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:05:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:05:57 +0000
Message-ID: <87h6egoxyz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/9] hwtracing: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
 linux-staging@lists.linux.dev
In-Reply-To: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 02:05:56 +0000
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 808ac797-d23a-4214-04ea-08dc804d0b59
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|52116005|1800799015|376005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qLqJmg8w6SVpcftne/4JlJyrmpNNfMDp73jefeZjYA9wLOtG5/+FHYSlM+Lm?=
 =?us-ascii?Q?XY6T87XYjIAxEr4hRJLk8b50als+imPsWiOtkQrrUmzMjnEo4qITgUpkvhrR?=
 =?us-ascii?Q?hnsv+rirVk3/RWoR2ejoFIFJLTlPfZ1Q0/bMYnKKZkMzYBabSK2H7IrNPbsH?=
 =?us-ascii?Q?IN4Wpn7MsfhMvcYS0DModLlwIBalV+t/zc9APesXMrJ5YDxKIiMVVGz1QaEI?=
 =?us-ascii?Q?VnvDozRk7zfz/DsLJHlolQbde0KK4OrCWZV3SuM4BVK/yChl2WfaN6mvbHru?=
 =?us-ascii?Q?IkqPlz6YGio5/Vzfi8mbF0GCO9o5yMpX7ln7P7f4t6z8CKAASxjLzlqaF2Hv?=
 =?us-ascii?Q?+yergNok8iSE47k2dq7fr7BfJpv6d5ywIoyL8lLis9btEiNu6DXhOYQujeeC?=
 =?us-ascii?Q?Y6303EBYEBOKV2y1+3N9BJBcIfFoc/mlmtyWn86C1p1VGpCa+dXI/OFx6dM4?=
 =?us-ascii?Q?Qk+CP61tspRBvE6QKqenqnKv5YS1t0OdIcvyxe6pSOa9D/M95pEJfBVtbtdR?=
 =?us-ascii?Q?2eYtOWKE/XBfrQ1SXeVrQEJkUx+OJZHlzvweUDzAUAyqyDwqDwXK84uiZu3J?=
 =?us-ascii?Q?aOtE3Zlln214tbieCuqHr4EMuYcvmQwmOR9Sp+D65t2DcDnO/0S3M/hEe15y?=
 =?us-ascii?Q?Wn0Z0NF+VWjqc4BQ5f7GECr9lxtXDoV0YvGbxKhSnHa5rovpEcH/xHJLICpd?=
 =?us-ascii?Q?Lx1UooKCEocwXrPOWTWOK9AM+AsyScDYd/4keeS1IbRxCil6n3yzIj4I+pQo?=
 =?us-ascii?Q?TjU8w45G54NROJER0a8RIjvlgi/JG8bfitkHrUoJ9SfGJRjnb7Z2YQacPFD7?=
 =?us-ascii?Q?Jtkxlslm9Tnt6gayYP/Qbw+3W0RODpEADuQ0hV59hbYN1rz7HjKZKqvjpakH?=
 =?us-ascii?Q?drJ+XYx0t7po3uZlFi5QAVjnSulxTWgPzXC7BhQvkSmJRjln940fL0DN5pKb?=
 =?us-ascii?Q?3vt9JfOs6DXyoMUdev1bPwMisYqtQ3cDXNcWS7wf0eYT7LY1Gvk4VSohpSa5?=
 =?us-ascii?Q?1aC0/6svH+ZvozxfaVR7uoodU8RABiTuEarmlwo1aobrWFNV8yu7ruVChass?=
 =?us-ascii?Q?f7tJi62HK1g4ETRJ1O6tasVv7xPZi14HPST209g2Ea1/NCX+gdrjtbJwk9Mv?=
 =?us-ascii?Q?2dpASn4JIHbCc5UHqp1cZl6dn8RsosvnNBjYtSinFFootXAuRfODg6Ir9Vv3?=
 =?us-ascii?Q?AIiwhbqsBMKdNSTY4n2kxFSQ8Jltn9n9eeFRoD5+hdXaScwD7JrfbVJr5oDS?=
 =?us-ascii?Q?eotvW1oQC5T5OJ/ankpMMVMgm6ePsetZaOoNDKWcD4IjBAKnOwrMhikmNNuZ?=
 =?us-ascii?Q?s2NVuVDErLf6zstbT5gwgCTApiPf7swlT2MOlXtW64CeEBAAnGpGbdh5fvw0?=
 =?us-ascii?Q?QsraNXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJ7btPrZmA7sdnM3P8SowIc78OwZwQCkc3w+mrXKTVSzcAi4FncATVcg5PqV?=
 =?us-ascii?Q?Bz9dC0WTskqCLZLhoHEo+0kBBr85UK4N+aC2IQdrrwQbN2wQ5kWylClnS4pm?=
 =?us-ascii?Q?vohdpLgTvwj+1lEuqYPcCC/JnVG+YQ7NxT/Dy+u2CkhYPDwyMCf7Zipt3v8g?=
 =?us-ascii?Q?90hv28A9f9Tf8RZvoALLYNCbgnJh/2wyMVlIi2BBqNgn7SQirDOqnmPgFjSr?=
 =?us-ascii?Q?rZrYgXns5BNpENCFehl8X18aZNnL5yo58+o8O7kMv8N4BEiY6vkLhxvVrIpk?=
 =?us-ascii?Q?jWjhOOGPK58TDVhy3MRYj6871Ze467Bkty6Pr4cPXHGXq6NJrW9PJgYd70vv?=
 =?us-ascii?Q?QknwawZfwmsrBxb3PVdxQWtpP9RFMNPJM1Ggw3YCIubWeKrfzVOKa9Dazfef?=
 =?us-ascii?Q?idS9Yc3oD4xf3pHsuta70a3FG+kdebL60P2HkuLaid2aeeGqiG6JjYQkmM7j?=
 =?us-ascii?Q?ayo+pj3y0TWOaDOv9Hqw1s8OQJFS5e432f5fDcfuQdyBNUoSV7i6q5PzNftp?=
 =?us-ascii?Q?UThGiN9wZHAecQpCla4T3F2RluEc/BpO/91nBlHWKxKvRg5YFiJLeruu4e8K?=
 =?us-ascii?Q?9Qd0np0A6hhUmr5PWG8eeHBnOADIDBDB+S2zUkESpgOpV83CK0cIbcfG/XJ8?=
 =?us-ascii?Q?WEwtyVaxqcMccWJU7kudiRZEEzoxd9Q70wZqfsQ3Mj7cLk2m3alMwcvuxjOm?=
 =?us-ascii?Q?0JdVau1tmBN68sM6g9Jpym3dBDFBUGlfw9iE0N22B5kDqWF1/LFgqAUtlBoz?=
 =?us-ascii?Q?3P4Ebq4bNlcwpI+ECZq9porOYpUSyBZlxp0zHppNlSHUxmdNzdxT1tmQkiFP?=
 =?us-ascii?Q?TwrAKB3Cv8DKkRK97WAN1N5znDSt7ACeVZ499aTRgrhLQxi4dl/9qdj03WXJ?=
 =?us-ascii?Q?qttVBLbPGTgYfoX028GVoSX0oEGQwSkc7OGUBeQqvajFylQvq/lmv2DX9N34?=
 =?us-ascii?Q?V1zGmLnhrMhiXDNPrBAPKHOZxui2OrfGU7O/uK5MILSRlBr9bzhsk3OJ9Bzr?=
 =?us-ascii?Q?u5tvWO7d2KFCSKMjnOUjv4/aWp+lH1WZVT/zmTniuCt1ZRi6UI9wibD2nkOS?=
 =?us-ascii?Q?N4WCl993g4hlY4R7ESr6X8QxVWLs3z3zmotGruOP8kHh9+I9sNh3opsTnSbb?=
 =?us-ascii?Q?eklt5gOgkD+/uKZA+ViwHu61VXo70yuHA5rQ+iNVu0GBh5iqmDi6v2cHLNw9?=
 =?us-ascii?Q?dL022PWlnLFDU3vfQF3gT5TZ+1c2ZGeax/ERZmwu2BQJQcMy4f3NlZkNHv+O?=
 =?us-ascii?Q?i+IdJ6lqSIbm4EqMaQ0C741cfFOIKmVb/aY8FTGhUs6pdFr3uB+41lgzYPyB?=
 =?us-ascii?Q?zX7Dka2+vvdVSmlKNSWC0no2FzPCMrgSvpY2J71iQ25hI5lb1Hsby8uxpVth?=
 =?us-ascii?Q?sNJqwfMDY5UWxcUUwv8QoKMygfYem5C+dxOVbvd0IipYGuy4tcmSf5yI4MaP?=
 =?us-ascii?Q?lQyst2a3byBr6J/c44tcmrHVIxs+Pnyycz5H0+lYM+4iNXBSnHb4ciQMl6WX?=
 =?us-ascii?Q?nZAs9vbXxHVF8cJctmQmKzgRbkCWLLqtpWZTispPq0EdNbASE8O/mUlW59Mc?=
 =?us-ascii?Q?H4uQ7QN8B+XrJT8VfSm0n7t+L+AGMl+XlAfu7/5svdhUoE3pVlFNJfku4WYE?=
 =?us-ascii?Q?DC/7q7Z2sEi/ENUobp1vXrw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808ac797-d23a-4214-04ea-08dc804d0b59
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:05:57.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7OVuVHKFJG0aEFh+J7i2I7JzG3EyXw7Q4/dXh9OHupdK+k7DAYh+SXMJlnnHtY3A/DFA6fO2PJJg+CoaLH4CtjupU7ucnGF7ebfOK/S0RYr7W1qWgMxmVVhg8ZbIa9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9900
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
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa8..e9683e613d520 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	 */
 	if (!parent) {
 		/*
-		 * Avoid warnings in of_graph_get_next_endpoint()
+		 * Avoid warnings in for_each_endpoint_of_node()
 		 * if the device doesn't have any graph connections
 		 */
 		if (!of_graph_is_present(node))
@@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	}
 
 	/* Iterate through each output port to discover topology */
-	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
+	for_each_endpoint_of_node(parent, ep) {
 		/*
 		 * Legacy binding mixes input/output ports under the
 		 * same parent. So, skip the input ports if we are dealing
-- 
2.43.0

