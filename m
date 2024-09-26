Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9CE986A01
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FC710E873;
	Thu, 26 Sep 2024 00:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="YmlCQTvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8963410E872
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brbwy7RPs4knDGlYOlg9yWUXhSfPncFu7gLFvoiiUAK2fY7gDNKkykL6WoYqYoWA/juTOfPC4PROzoVrSh5Ca++2USSWbt+3MyLFSpF0woP0v1k8sPnXCRGg1zUdzjt24do3+CzVwxN3kBQbhSaUE62GSp5WmzncuY/oYQsuBjrDAEaDYAUkE+0HhmaDypmwlJ0po4mSDb6TccsvMiQCIKA9/5l1hsR2MIe7u9hZo5RNznTrTUepnwMi7Vew4Q6J2ptFQuTubTD7vT1u3+o7nGQ8CsakIk+1JN0F1F+yvUXQ022+gP2tvLUB/Yzs1oMKP83IrbzST0ioMajJQbhvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of7vL0yjGsQed1yS6pcLnFbV59IKDDtbehs+KXCSEzg=;
 b=BRMPPEYIzS73TNrdaJna2owWgghX0W/jS5WDY7lQeB6U1p9FGjJ6bbD6SEAgSW+pRfN+KBNtIknDuBx5SGb5QuYNcPZ4Lklsu1zIqiKuBeKVojjp4bHIQBtSEMegXzEVw7aW1DHbKnArPWSHDkA8IkeLxCgiJRysQqgr19fY0AAWSomoNPBTkSG6Ju8Zc6pzF5OtfM64TeyTJ69xWcrBXm9TjRg6VucEDgHXlrXe426Cgt3hPmEPem2dEdwNBSKU8uVRj120Zy2mdDXSJTzHm9VxG228CfIkrb49SH0J9qMJOTYrkvBwdFVcyItvHQ1aiWiEpHLPqBPO03wvgIXVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of7vL0yjGsQed1yS6pcLnFbV59IKDDtbehs+KXCSEzg=;
 b=YmlCQTvbbfUctpW3y8UK7/zh5+9f/sX4dd96QQq/4EJvafj2Dj3VkzOjwvB6K2jQZPJwevRBMQBH//Emxc/IhmvH2/LBK32GKwsXAKoVMnbJC0AxGl6Cg6ArPa9otuCesUc88hERqqWORryTb1WIMT/NmUPY8319Or9k39iTlTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:00:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:18 +0000
Message-ID: <874j639td9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 2/9] of: property: add of_graph_get_next_port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
References: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 00:00:18 +0000
X-ClientProxiedBy: TYCP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: f66c20df-05d8-4bfc-05af-08dcddbe353b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SfmFNcJ8yaKA1WdwfE/OI54aMUzr7UvZo+23H9E7LMAPmPZevblci6Tro4ev?=
 =?us-ascii?Q?Q3Ot2pqU1Q6nepPjCSXYhFO0oj0ieceDBibSEnpRS7TiTjqs9WEbMsDsJOvw?=
 =?us-ascii?Q?hl0oCK68iX3nVpfhFwEB4RKfcyilmTHlilQRs5f5nNmw5as5iZHMaPsKvJiD?=
 =?us-ascii?Q?sMMcBLy7JhQ0AwxYpNmtrrpqpOiEYkvDfNhhT26o2o1LQlXl525HryeQT0Uu?=
 =?us-ascii?Q?Vx6WrEmu5UjgcJtrpdkziHznlA67mUeL2mvVP++FIYRDP4svqJDeZDyc4tr0?=
 =?us-ascii?Q?gcu3V60QEVc0odQLzChIxwgNaXtWxX8OXk7m/fNw5QOFARMfkrVhEOkBfKtK?=
 =?us-ascii?Q?0OIkJEtavq2t6qMnedh6AXqc1Eo9wivKpuz4nmGkxE1r1SjlMxXwVrtt7Ut7?=
 =?us-ascii?Q?bE72fNjKWBmyhncSt6Xi18vsgS6UwaWzegSIlvkn+3b1TaOYfRIORZk6mx/a?=
 =?us-ascii?Q?eNA/g2hAKnYrO3bRlVtIHTvAZUdBj++4QBzDPybZwpzyIMAQKQgzEhOBc5V5?=
 =?us-ascii?Q?Q6rbTDNq0jNilL7WGP9XGpK2a8coDofdZ8g7Iln6ThxdVi7hOJwfCLxZ+7ph?=
 =?us-ascii?Q?YxaJ7qVU/6jw0kRE8K2Uqp3hKZpRZUBBl63+0yGcddDRwVPezCBEZ3KIB/YN?=
 =?us-ascii?Q?subsChf/J9/vVQRFU+E45Olu6GNIC5ZmiD6KyylMgqnuGwORhOIDz0VE6y1t?=
 =?us-ascii?Q?cbEDwY2SrgP1Pet4H8DH5yYaMyhdCv8MbiytIb+gA6s6Tp9wVHU/AmT2GFiM?=
 =?us-ascii?Q?F8UORcvKcLt0IBiKx8OU37DEBldfKTv94hdKaAY8NKkch88LRYkF4On2ziXU?=
 =?us-ascii?Q?NntqCfhxYCCimh8MCXgTNllytdUUggd2gcepRingqGpBlvXZujkTTLZXeE/z?=
 =?us-ascii?Q?YEkNMKfj/IO9e84t++UYy0wffDBVm+mb0Aoy2bpRdJT4fDl7Bs1THm0Zs4g+?=
 =?us-ascii?Q?VkDOMsD5iXHOMX5Z5hnWP7PupmZAHSSkLQooOC8JnQ3rUyBX6mXcsicPduD3?=
 =?us-ascii?Q?sZLpgF+FJEXas1OFF1LpKTRJM31hWpXQbVOZe9x/VOFz5b9K1i85fZ1fvufM?=
 =?us-ascii?Q?LSCANCgc2CeCD89ifYeFvhe3Ku3t7vZuZQX96o72H4O2i/xVBgn3yEel7Q9+?=
 =?us-ascii?Q?TxPO5pTmaNb8ZVkFiaDdhNx3gszK4GshPmnqkLNTTeLr6xPYt4F/LqKIRE3b?=
 =?us-ascii?Q?tbI0g7lTT2lJHEK+GqAPKBHsMJunYHZ0mEy0w6eekV7E+ECHhRsTdkY3hB0f?=
 =?us-ascii?Q?Cx+h4epQnY98YZ66JkNIdQiCI9Rasw8tE/AFX7yFs6hsomE932KssMFPL94f?=
 =?us-ascii?Q?dGV1tZg2p/Kv8fi/Z6H8ld1pG8Lifsl0sp1hYyAk6EF1yhndmlUwTN/vNZWI?=
 =?us-ascii?Q?OWHU7OckUtvvNbipeLKaCXt4vcu53BG3vd1fSc99qYUo15L9VEr//vayhvRk?=
 =?us-ascii?Q?AFKOTGzHQi8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E7ArFshsGcM47hD8Xc3tm4VSU8Jk+r2v5AaU/dIWgymrZxlQH4lhd1TqFFMe?=
 =?us-ascii?Q?I7WPPHcT8iXrHifrUj9iuqc67akh+r+NQwRpkv7T4KUgwbMzQfwxU2op5GUJ?=
 =?us-ascii?Q?0AGc/9TiNHbJa8mxzKKptu6Z4RxK4F8/LpDo7D9iRN2DaWelokGrIsEgmQki?=
 =?us-ascii?Q?pHEefZn3lUACrGUtEmkslwSdcM+0TGNsNXVfGWG0VxaQMeB1ptbuNWyprtNy?=
 =?us-ascii?Q?tH3sVQngC/mqmjvXWgz4/0576ivXv/u1eXMSII1Rd7sVXXIDbhQA0gn6SrHb?=
 =?us-ascii?Q?5Kl+CvYQnDyIhwaenqdGTN//24YQUo5mf0HEmgsUgtNsDuJ5ZIEvsc4A1DZD?=
 =?us-ascii?Q?JTIl9yof78Aj3ZfDQUkDsw6f4/C6S87K1phUQKkxz+V7qUNBN4tRj4+1LTjl?=
 =?us-ascii?Q?KAJvYY9TQgJIv6HKgV0aPaum+ULXZ/Jdfhry4sF/gMbfDaymL0pWQkK/UR/5?=
 =?us-ascii?Q?dJPr8H8F5SBsSngNnpeWIy9m20Ytc9+nagy/EwUid2Hhsqwgnz4apFZ4ffqr?=
 =?us-ascii?Q?T96mCao+G0Qp5AHfsoUD/TYtE9L3Uq1WdKrDWw1vhzMUwNFFtDnofTjfDRcP?=
 =?us-ascii?Q?qmAb4m52zHkJepeFd5QR08WmcepVviYTwlCvc6hyogpu/5YoNYFgTZqalVGy?=
 =?us-ascii?Q?8IxiGlsPE1YnqZDGn1nvOOWccS1EvXmkemKTH4Poy4ZWmW1pAlxOsCg+sEtS?=
 =?us-ascii?Q?xaIsg2AaMT/5478Zil22x+qAieIf1qKuMm4wXsjYOjClLqHZth/fR7MwiCA9?=
 =?us-ascii?Q?oGZxAokaHZYXxUsSBWqCTYoy9uPKKqJpLfM59otDdVNCeqPLFFHdN9Qh6lGe?=
 =?us-ascii?Q?/TdDWrdhRVL0y0Q0iIFneagMykVbYls+zqegcdfU37c6Jpf5DH5HxW1CfR8I?=
 =?us-ascii?Q?FyPKucB3fcDiakK9JQmw6fBPQI1O85Ltt+1p8tXufNcyAbDKsbPiXb9w+2Et?=
 =?us-ascii?Q?4/QZE4jjPHBgmOvP6Xm/51UJLurHbf214r61QXVZbNgedpXXH7v/Q38t7T2s?=
 =?us-ascii?Q?Luvm5QicJ0pu7ViWiYx4ePopzmSSPQJAb5c7jUWZF9POYFqo3LYa0oBIj51h?=
 =?us-ascii?Q?Z6or06DKBTnQ3Wdtn1VQf6mzPf9m8Y3ektVLikqK74KSXhHPKiw6qyRcmsDQ?=
 =?us-ascii?Q?waecuCqHChTqrgTDmWgwd8SUiAPP/9EZ4SRKEVNIaTXgRBMpT79LYvCxkM4w?=
 =?us-ascii?Q?aKlzEfAgiYGGgij3Z+mXzmI31p83BOPp8xZotzuPrbIQgBcjlmTLcTJEdbzu?=
 =?us-ascii?Q?RHzsE1edjWfeSZBJ0iPQ62gVYROBPhdVcdKNOkMn5Kujkh1MRDPlwJRTft9L?=
 =?us-ascii?Q?M468PwneGvjyqGGRjWhdpCb7+mkD5AiTBDYSg4Mo1l0WWN21i/YdOVDg5oIa?=
 =?us-ascii?Q?r6quJ1cpRXtdN1Vo7f7IdXdBE17wgBuAy1Mgkraujvk0sYgEGgVATQp1EM1y?=
 =?us-ascii?Q?pgMBgMk7VSdDczDdYaesEI7w+dUCW2nLhGeTlS5aemcrGhmHaaW41jeiy0PG?=
 =?us-ascii?Q?N7ls/kkKJco7ZRD6DOCwQadG/7wPFas37RBdpwq/sIWIWDgU0pS319jIBrFR?=
 =?us-ascii?Q?JOAJ1VOkRVxR++beKC0NLz9zVPN1TeaQY6Tsd57uKfQky5mpvdT4WfBtEDDc?=
 =?us-ascii?Q?k54RaAhU1tIjDbJSKhPxATs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66c20df-05d8-4bfc-05af-08dcddbe353b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:18.8129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjOeZnGHTtQdPjrfvSaJubeOKUrHJyK21hJd4uxUqleS/O368k28DumEbjykZcp/snsVAPRQ/tPd/2TShM/nXOWOYG3PhhNvJMjSTh02nZkAXhBaHlQ4OFx3jX6WBiA+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7353
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

We already have of_graph_get_next_endpoint(), but it is not
intuitive to use in some case.

(X)	node {
(Y)		ports {
(P0)			port@0 { endpoint { remote-endpoint = ...; };};
(P10)			port@1 { endpoint { remote-endpoint = ...; };
(P11)				 endpoint { remote-endpoint = ...; };};
(P2)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= P10, P11),
I want to use like below

	P10 = of_graph_get_next_endpoint(port1, NULL);
	P11 = of_graph_get_next_endpoint(port1, P10);

But 1st one will be error, because of_graph_get_next_endpoint()
requested 1st parameter is "node" (X) or "ports" (Y), not but "port".
Below works well, but it will get P0

	P0 = of_graph_get_next_endpoint(node,  NULL);
	P0 = of_graph_get_next_endpoint(ports, NULL);

In other words, we can't handle P10/P11 directly via
of_graph_get_next_endpoint().

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get P10 pointer for some way, and if I want to
handle port@1 things by loop, I would like use it like below

	/*
	 * "ep" is now P10, and handle port1 things here,
	 * but we don't know how many endpoints port1 have.
	 *
	 * Because "ep" is non NULL now, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (ep = of_graph_get_next_endpoint(port1, ep))

But it also not worked as I expected.
I expect it will be P10 -> P11 -> NULL,
but      it will be P10 -> P11 -> P2,    because
of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".
It is not useful for generic driver.

To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()

	of_graph_get_next_port_endpoint(port1, NULL); // P10
	of_graph_get_next_port_endpoint(port1, P10);  // P11
	of_graph_get_next_port_endpoint(port1, P11);  // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 27 +++++++++++++++++++++++++++
 include/linux/of_graph.h | 21 +++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index f6cd614637181..9814414a781f2 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -721,6 +721,33 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_port_endpoint() - get next endpoint node in port.
+ * If it reached to end of the port, it will return NULL.
+ * @port: pointer to the target port node
+ * @prev: previous endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev)
+{
+	while (1) {
+		prev = of_get_next_child(port, prev);
+		if (!prev)
+			break;
+		if (WARN(!of_node_name_eq(prev, "endpoint"),
+			 "non endpoint node is used (%pOF)", prev))
+			continue;
+
+		break;
+	}
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 6fbd2c8696fd9..4a91de147604b 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -62,6 +62,18 @@ struct of_endpoint {
 	for (struct device_node *child __free(device_node) = of_graph_get_next_port(parent, NULL);\
 	     child != NULL; child = of_graph_get_next_port(parent, child))
 
+/**
+ * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
+ * @parent: parent port node
+ * @child: loop variable pointing to the current endpoint node
+ *
+ * When breaking out of the loop, and continue to use the @child, you need to
+ * use return_ptr(@child) or no_free_ptr(@child) not to call __free() for it.
+ */
+#define for_each_of_graph_port_endpoint(parent, child)			\
+	for (struct device_node *child __free(device_node) = of_graph_get_next_port_endpoint(parent, NULL);\
+	     child != NULL; child = of_graph_get_next_port_endpoint(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
@@ -76,6 +88,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
 					    struct device_node *ports);
 struct device_node *of_graph_get_next_port(struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -136,6 +150,13 @@ static inline struct device_node *of_graph_get_next_port(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port_endpoint(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg)
 {
-- 
2.43.0

