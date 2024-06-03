Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447048D799C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D94210E168;
	Mon,  3 Jun 2024 01:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PwxNyStK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3601810E168
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlAyfg+dNISPkSr4Tb1jIXXCeRTxi4Ez8qZUq/JrJ/qFk/xjkydXQLXQJpmKUMHzFK1dV/SuQ+DDyw4Y84FLHxd5wpaU66PEh9UtiLpYgT8e7/eQomZifxDZmPNSuN4eOUe81o0jMR5SYeelK9iY1469rVRTx/ifUsMpWcN5IKywuYdZEv7YM4F5iJ0h+T8G27wkDzLkQyheJKxP1AbPfAO5uMPtOZ2DqArCIz3q0ps9UdLTSl5OvtFxImZff7LFLOJh1Zs+PwguKTOpt2JH8zHF5o2kPyQhMOPf1hbfBfgcn8NQ5iNeAZ2bYjFz9jzPrD3NFFhbtpocmSLbElhQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=TiOzDqoS6xKeWAUgSLojQuQtM/4+dj2/oeOIs6uK0w2VXyFu6oUx7f1IPnu3Ix1V4bC4hmRhuMdsIWtP/8kx5w1QUFnQVq/qarm0SedpqEWsLgtMnp8eF+W+1lcQzZ12C5CjG0wPSmOcCY6/d6oB8wy1SUiS+wHivCYIfybq44MRlV6Q2OWqj9KEhTBb7Dm/VmnpnR8Uq3B+2xzhvpocIu/BnG3ormfHFRUTzNChUSOTNWPZdksbRgdX3EUZiWZWXiqpt8T8JN91Jw0+XMLJ9A3IG41Pkw15GWkGvZyguccawVWQSDnXttyA5A+cWhrrRNlNITCPnIYLcW92Va14yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=PwxNyStKhJyKCTqkIGcGUAxuu/1QSiRP4ANawQhRtnfjJipV7rWsNMSWAOcu1pjaC52I/ID17jW09bbkNY/VuPEUIXOGOtHKV4dYSvRQh9FG3PpP6LA1SWdSAz2jwQ87Jj/YEBWewuiFd0Jsl2exdCIeVYPJdVxnSFWxrrs8D1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11318.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 01:18:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:33 +0000
Message-ID: <87mso24ydy.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 6/9] media: platform: xilinx: use
 for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:33 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d84380-15f5-480f-1037-08dc836b160c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mFvZoBcltZGuzjnRd/agLOsyrABtWRltVxn8aW9Vvl9mviwU3WWfh70nNVT?=
 =?us-ascii?Q?i5XRd8RFbj4BMCBoxwu0iEuKXCYo4CHc/I0advJXDsDOgPNNkb10DmyneAAx?=
 =?us-ascii?Q?AaNPVfYIHRh8f9mKprZW0/y4IoT4nwr8TkDnKds/LPWuEVyitO1+wthoyDq5?=
 =?us-ascii?Q?FAxlIY4B7UYD0GWhrpu5S/1dRd+4v4QjxIfA1uPdNHb153v5x5mAIgJP3vBA?=
 =?us-ascii?Q?CxaX0lgGBcOf3G6tjakCqT3KCEKhGnnR91nn/rdNWXDzdztknbHUP1f3U4NX?=
 =?us-ascii?Q?pGm3bkHjrHCZyPaTi13tNNIv/aTtHW8Mv/Og/NqnsDDsbQt9OV0TB7QVh7Wz?=
 =?us-ascii?Q?A1m/IVzzdN/GaqoNZsKh/BNYiw05xU7yaMb0eZM1M9GVc3xhAlcKVkyDC6bW?=
 =?us-ascii?Q?gzcdSvgZcGq8b7Ghgk2+2pTZXrGvVXKD/wdem8+pofR8Za5TEPabqSPKyJSZ?=
 =?us-ascii?Q?jIOf0lM8zDkxuCa8HIdhPcaR0BFOhWCIUwy5JucNdq3DBupqiu3N8Td4KRS9?=
 =?us-ascii?Q?/twjBFYqxSpmJXQkYZNU6jMWgvvFY8Ad9jqMCd3VZU4C+0D89QVlqPv1D3/o?=
 =?us-ascii?Q?pPTrNgV7QZWoVbqkuRYhKg+I1EyjL1ZjdxfOVU+oUsJI/serccq8mF64gDdl?=
 =?us-ascii?Q?cAICx4xNINVou13EEsJXeVvwLZ3kpt/ZzGwRzdYXgPbTUaZxsAx+YKU630uo?=
 =?us-ascii?Q?ojv6eELAi0DRaO/L70/+ca2TeL7O6w4JOdioND8XmOnwoT22GEFz1neIUvP0?=
 =?us-ascii?Q?3DwaZpd901BQLnv0+r/BpWG32w8ZUQJgL0Kfxe2G9aKWg0/LGop0G5tLbX/d?=
 =?us-ascii?Q?Dntk2aHtkpw6+8CbnJDhyPxbyUWyBoUnNx8fskScxL7SDbn/OQT5lY5H/x29?=
 =?us-ascii?Q?6qoSwby/Zk24wjkWirxv+aYjTLmtBVSxHfDM9zzbN5MoD4SMsyN4AbQwaaSr?=
 =?us-ascii?Q?4bjphJeeTpnUXW61C0AaLx1o7cXRxtL02rYbvm0fXNozQ2AmrpYAraqIbopA?=
 =?us-ascii?Q?aSmbCY8S0I34rl4ftklDb+He25w2JlexPQcmY6bID40JixJUMeS4de0WKEjl?=
 =?us-ascii?Q?LQy73Y+N5opziRS2XN0qzGFTYvzKQl6tfTbWtt47Tx6/KGf/MxQvLz3Scxlo?=
 =?us-ascii?Q?0GqoGgLrUIyy6MKdgIDIzZzfj/wmk3xkdj1YkwBSpQP2YGl3SJWiJlRQyjMB?=
 =?us-ascii?Q?VMTzhoI/TNctSYsS0aTV9IXIAJBDn6F6qSy89l8W+QpWUD0WwtJuUk66eRZd?=
 =?us-ascii?Q?ze+FQ+/Z+IVs7ZwQh8fvAsqUEZWTXFGjgpDswIb97gJAhJsCN3LJqUjo5R+F?=
 =?us-ascii?Q?UlTZvC8BYwQlRXHGVlAPz3AS2ie4uXncdZsMir4r60wFOkM1VYsoRS1pG+gM?=
 =?us-ascii?Q?bnyEkGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0R3aZb6jWjR0PTSmYPYTok1XvZhJVROBsAVXoxgh4N6k/yg2OAu5AnOuiHX?=
 =?us-ascii?Q?/a3kPFbPOpxR/mDHf6EZOiD4I96GsMaAfFqjwLrnmfOJl++9ApXgdeHZCc+K?=
 =?us-ascii?Q?yOMpCsgDVti3S8XsFz3KI+d9NghD2QJ6jjMoNNJDGt7+BOPxWS18ZlXiq+24?=
 =?us-ascii?Q?ybRv7TEzSnERX8PqKFLA2YucvDw6qGYVIT6xP52uwnAShhI+JDOnpKirDr1i?=
 =?us-ascii?Q?vACRd8yTtsV2K4NGjqecQ11x2r211jQeZiVTyZCfdVvvu0Ct1YJmWC4hYKCD?=
 =?us-ascii?Q?v9sgO1lOug+j8BjFOb7qPMwkm+TzBfq8NeyuhJ5JvHYZnUhhhDC2VBHYGwUM?=
 =?us-ascii?Q?0OM+N63AgaAIOO6TCYRqklzigcpTIFawksiAOhmE+D/MgwvTMm76I2tjI89O?=
 =?us-ascii?Q?KJuKFhNSkuF4G+KOsFwikFO6UN8V9AGUIJ6Lwji2xdiXsix2gVMWeY97jHjf?=
 =?us-ascii?Q?VfpwwryxAIe0NpSxmu7TmmAxBNUgjFOxN8ZNNegKkIdwc1SxnBbRsoeTayoy?=
 =?us-ascii?Q?ToQX3UC60SWlpPXs8T8ziPUONTrDRdyGla3uIviCdPAb1Q2zBlx81qGzQyrt?=
 =?us-ascii?Q?JVQP1/GWo7p06FrsxM/8gxRV79BzAlYVnUvyXblYMModJR5Ink0QKyA/xnKh?=
 =?us-ascii?Q?K1gulVAAVn4AOqbU7Vna80zmDF2cN0wyG+FRWMRJD7h+DU6OMX+3TCsBQpUw?=
 =?us-ascii?Q?rOPdYkbWSBRwAPhE6qmYzSmiuEzhm85UbQk9UixAnkWDad9mBs4vezWEYj6b?=
 =?us-ascii?Q?pmMReU7ZF5l/2bcrdKa7j+POdLGN5IV844+sLSa7oev5Qvj6uWUTy4Gxq16k?=
 =?us-ascii?Q?1L6EBGZUsqloJve1ki8ldQwWcoK7Df2+dNJsMy+LawwFjDoJElHye3xuVbar?=
 =?us-ascii?Q?JizeKiIVuVeG24RQHqormOFLIxh75d6xE29JcS/Lj6KL77rHwwo22hpB4mrs?=
 =?us-ascii?Q?kyqOgY0OXC/AGiuCVQfw0MNI4ozC+ObI7aHUneA8vcaMv+y4gROXgYRz67n4?=
 =?us-ascii?Q?jsZsxKfFH/GnfhiFZ4kqJFzTctTuTBU6+hOJhrJD7suLEAMgVuvzmd9cGmCq?=
 =?us-ascii?Q?Ls6/495+Kd6tKTJqErRIa/m/Z21zhmDwZ2LDZx1D0WvW0l7YK3wH3Bhu+a0I?=
 =?us-ascii?Q?zKfKKgFa3XHN7210Z9UrlVkc8dsytFCk5YYNgRLGEZdTwzocGp5vHMP9cwT1?=
 =?us-ascii?Q?8RopOhrFYJa97t7M2wRXUtF1tccZqRR35Jtz3BOcahDFVD6KJajPRly2Bs/S?=
 =?us-ascii?Q?gI366I348G8Aiqt2RnsoQ4ZB4Ql5SPPWbWWOXRvXcNQVtRj5JHQeha6txyDc?=
 =?us-ascii?Q?rV2bzgwwRbLvX+k7Dk42raThkl+I12e+adRm65RlAB7hec9bvfhL9yvCB935?=
 =?us-ascii?Q?VIVqw0uD91GydP7g2zRhwsq4kNBpwvY2p/M1w6dVBNZVsQU8EVMrPXEZHddb?=
 =?us-ascii?Q?dwnlFkox0mFerX10wMfUgTyV6nftCTOP6tLZvZAay5RlRXv/7FaM1JqUWGJ1?=
 =?us-ascii?Q?pktmkrtyuQmRj7pIowbWKcOafMtLSDOBTL8epJl+oAELXtZ4HQ8IV38RzkQ3?=
 =?us-ascii?Q?+0fMlYsovCSoOJmVwI/HVKmb9WJks2TauB0y5+yR1juGsew5eiOYE2ojp0Ml?=
 =?us-ascii?Q?GFZTbub7QXrPuK0Y9tuWsDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d84380-15f5-480f-1037-08dc836b160c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:33.5339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Mz4xL87rw3/XBEX5mpsKSXtEWDqnZyH4laQLiffbpK67ifJfwbc4kqKIWVdZlVS7UNVrkflkCi20yneCC4CE2lvMaL161WtSGONwSdCA366k7zbnrG36QSwC1fuGBE8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11318
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

