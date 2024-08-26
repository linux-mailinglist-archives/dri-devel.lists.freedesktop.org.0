Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403E95E6CB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03ED10E090;
	Mon, 26 Aug 2024 02:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="KEIugbhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414910E097
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgCDIBii9dWeqgfU3/102jPf34i7vazgXiB3XTWCYwSy5kg2nTCIw9FwcHXRC4VP284FVlct92YNaf3YZHXVS3sdZs1CdDYA8xZAk4F49YCV7Aeirn9QwOSl3pyEC3u8Ht8accum3GLyDPTlzFLLNor+PoIp4LgbGQkrVsGdpCR77zwt+H2n1JsUiGGl6byg+IBU5XZxY1hLX3Ifnu/Qrll211U6IdbIhhW+UwRzHegOj690hp/phB1/rwl1Mt3oHKvGZMDZdrgYvBQ0q9KY/PNlu5VKB6ls3Z/kBIWmIb6uOSQoofLrOLa6h7RataZeRlKNa0ryrD0YfDvGqalrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5wCXam7eyk+9ZHVTp2xwx/12vJhqGXCaR39njBrXpE=;
 b=OEol569a6ss1hjtJKoTZ16SrsPgYvr549moHzs5DaUMRkKlJQcpNwvi598x6qJoT1j23EKFklISm48Dpur1lak4BHIlwDEsL+FVvYhBcMjIdzkdBHYkpu5laMDEHbeH/sl2U0gshWvV30BizBA3N4nwSioJFtlzxkoIB66+/QJ1R6NJMOcx1CZxQRMTGbhyCjuDnSZ59rMAxr8qt9Tfy/y+I2OhIdPoRf1jhXjdQZk5VUjk31uUmxKwzdekC8ujmVuHEksmPReAkehD5UvriDX7TykjYF32qNFO0iQP2GvWyEJDJB0/5ZarkxpvL3A0RvUtj1NEF2NhZxzxjpdLcBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5wCXam7eyk+9ZHVTp2xwx/12vJhqGXCaR39njBrXpE=;
 b=KEIugbhB0oEwdReQLeUZ2wg3Ik4pb8oeeoIXEDKPCGarSKM7EQW+/NkFEbcEEPfet0JZgRmC/E0eDqXEfX1CsgoR+RGhVAp6pgXFdBFJ1aEBE3Fpl72e1lWk0Fd/lycgWxXRJB2t/+GPngi9E/7irpk+YhMmzaGorbBXV0IHxYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:28 +0000
Message-ID: <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
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
In-Reply-To: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 02:43:28 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae6722a-8a7c-4b68-a1ce-08dcc578dd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+AK3nPDYbC4CL8Nuf2TXkgoAFWvNTtsFte2zieY6zcK1a9/lCRVB2wnT+rG?=
 =?us-ascii?Q?7/cN5MOzM4g2DEOULnj6FICCXmzEj2FMS7QRC+QiQznqkLFulqlvEMySqWGX?=
 =?us-ascii?Q?k4BSrPiLc8iAzYMojYwcToA/xpptG9utuTLbzvtaNnPEpXzUDNbjZuYCd3pp?=
 =?us-ascii?Q?oV02zAiunfso9JH9NKzFeUMWzb91SoRYvnlempfw8q7BLef8+f21XX5N3G0P?=
 =?us-ascii?Q?OkfEzpqZN4JpA/v6PC90BoiF3qBLIUi0TJsWVp5M2yacdrXMMPFSHxD/4FJ6?=
 =?us-ascii?Q?jg3m3n76VsI8zI0BMyAfF8tqsoSoq/36ctIEqCzKQp+w3vkLkASLg3LywEkU?=
 =?us-ascii?Q?wfFd/D6wj9zXlT/nSy/ofDd7TGq9ySPsC+4tM5Uu7s/eKs+N8caEKxgUtP9r?=
 =?us-ascii?Q?y1dzBAQHjmHoiqu+7zc6kHxBeePZsUy2ia0rkvFcNwvRkmIDVHb9+OFU1Kf9?=
 =?us-ascii?Q?VssMSL8YseV6au9VKz5bnhhIT+VIcvnqthZRUvA+qjc2s1D3ejyBF6OX5+2P?=
 =?us-ascii?Q?LFGEt4kIGqEtFanB6oEa5oE3q4suuG38DgVGt9wbQTjUCxkOtlCHobMG/hmY?=
 =?us-ascii?Q?ocAExXR8G4dEEknJKkfJ28mgp5FxHR0oAVGeJws3VHZucfikEN5+IFjU/oYO?=
 =?us-ascii?Q?tHb5THOJbtyPy3fSkVDfRjpFwfsqkUVkApqyK+BTFLkwgRiX8zObszk9Zdu9?=
 =?us-ascii?Q?IdZLTSldwqenWLXYuXITc82D8f8Ww3GCNhK5ieFLdQ4bzAkQpa72cUQcffwQ?=
 =?us-ascii?Q?+7OI6Xj1ZJpJwSejfeHhC5k1ZWN94/8+GSKTFflF6fsZi3d/AnfzVhcWussa?=
 =?us-ascii?Q?+Dd7QqQdENlkYScYmwIb01rbIbFSdJmojaTjz36LtV5o9xjKLGn0XaZ3YLby?=
 =?us-ascii?Q?dpzJYajDcqYtSwykShjae8z2zgRmkpeHW7/IFoXeyzPwVXI8MnvO0nzuKjBA?=
 =?us-ascii?Q?O27b07vwjphmjml+oy8CB4EdNRSuapnT1dvBN0Dj6WDkEz5Rh3DgPF0+mtTP?=
 =?us-ascii?Q?4C4FdK2nCZVP2YQI1Wq89G/yBILFaaOyh6FN/VAZtIJQXsSM5m3cpKerCy3d?=
 =?us-ascii?Q?OOBKtYBWkhGWVM3m2avYJXsbxkyisOITh3dzin/vOZUhGoLi3BtG5tDr7xyY?=
 =?us-ascii?Q?kkOWdDj32yhFkOBuNoKah2qG89QTavU9OfDzNMEW0kuWmcwSa5MEm4hGzLh5?=
 =?us-ascii?Q?x7rjm4BcQQF17DDnUV3fkAunAm2o5bmHACjF+ydsr7Zdt6lUXvLjGwTYgnZ6?=
 =?us-ascii?Q?jnZe/Wyu7WPvW41uUNN7BGT1eO3oPNBsMFu1U0VeSFUZa8bzkD+yeICdDcmL?=
 =?us-ascii?Q?nnj63m+Y4nmFHK09lNBotI/fNCpru5Lw42gIoWtDjT5E9qBGBNwtcY9XEqNv?=
 =?us-ascii?Q?nFvnndUHwgnbC2Qn9wV4XNajDI5GNgt5MtNM9DoM/JPSymh8C4JlQ4Nq9Wuv?=
 =?us-ascii?Q?aT5rY8ZOLAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ySCMOO0dlCHMRkwdjVj7d4mp09/K8QZtLqAVsY1E1a1un1FXetApBPSOGMkD?=
 =?us-ascii?Q?7U8MIAKE45VvQj8pLir4lynfOpS9jcF0KKB9GbZIpIOqaa4SX03k9Uk8Ditc?=
 =?us-ascii?Q?AuDwCeGs5VlA/XclqMFBM0jypusAIKzmh+LpK6NaGkNlB66SdAmJF3cV0xWB?=
 =?us-ascii?Q?M6JI6tEJfSfv/5qNWwdTFwsOLyXlo+zNsi0A8LdTtHQpg7hPhJGDTcXkMgvh?=
 =?us-ascii?Q?3VZCPNYypDegeL0tZPme1/QC+tLHE4d/Nsdu9/DTekroGl2p5IHXw8RTVcSv?=
 =?us-ascii?Q?gjkPpqcSoAcIurTXp9VNf+CHWGYivVnPIEYn49Xmft6sS2rc9fUiR3HiWLf9?=
 =?us-ascii?Q?o8W7BX4oNYcpVHtYHBlnIwi+TWzzrm4ShTcSu3ThR2FvewaqqFLFl/Azxr/n?=
 =?us-ascii?Q?WP2623O//Q4DByCrYP5Le30RSvPAKiKvIbgJWEBMsLyalZLghDqP7WyeoKUK?=
 =?us-ascii?Q?/bAg5vgTnIFThuyjj2NbFDCfYkDQ8jK2efAY4WXNh1vYPoB3bBYmGbNqWjXq?=
 =?us-ascii?Q?tKZy4T7pMXR9ERjjuPS98S+Dzr67TeJ9omV3N88YMxtDIHCr8lkVvmjKCO9B?=
 =?us-ascii?Q?vTeQtLk2PeKIYaOp86Wt3AOk4b9l7zge6tz9YX/8ctj1VR73TFAGgyzJiW+N?=
 =?us-ascii?Q?2vPjPzb+OJFD4vow8zYycMWp3gsacCDiO3llrYeDt7m+LyYLgxdeOYenZ9QZ?=
 =?us-ascii?Q?QliDVTBQyRlbyDgr2Tj4IojANmbQbgq47WdUiwZ56UF8yvufTquMFr0bf3Pg?=
 =?us-ascii?Q?5fYsZDAaD97MxVsL1mU0AmG5tBhhUe20gi6UakX04qvHVHHreE0IQ6MDrsQN?=
 =?us-ascii?Q?EnnE5rCfkb+c5GCVHHJwMlNIvAFlSP6d4YpyYdOSt4Pu9zMt76xYWu3qX8+8?=
 =?us-ascii?Q?Kg/rZNRNxm05IJnMVzVNzUA2uwAqQ3/anytVU8pz1Wb1LpSPxTaGHHVRW6mg?=
 =?us-ascii?Q?xiyFlUyVcKPZzUZvFn73Q2+SWC87d/StZSvfwdJTR+rq+pd50BVV4ZUHFWlm?=
 =?us-ascii?Q?7x/dqyv9NNLolR7Ys8Zs6aZlxqmcOgfTC+YC/j9lcy4vUAyH+GljCzfmr3ui?=
 =?us-ascii?Q?GZ2dv2/sl5DtTW6cqjk4ddpioE2mNTwy1R7x8eeaAAG2Vt4VlfcXsaYXLC0n?=
 =?us-ascii?Q?efYldSs7BrO6c9kIQ7wxmuve3lTDuDG7sFJNnX8zXro0Ejw1hzPrRnCFSeiJ?=
 =?us-ascii?Q?N5uBzyWtj5ZDcSbc42drELQN1LxLyNs594I5orQUzgboqF6Dk0Zb/qLBvopN?=
 =?us-ascii?Q?by1wDpMGE3QRJwuxAjwzepgrnoeGZr+M2rI1wxTU19c0ROXqRrXBzUrxz37H?=
 =?us-ascii?Q?r7LGPDhyi9Pvb1iVoiYMseYIuXQjrrRcZPSVH5OsXhvbEb1rCgQefm3BeInn?=
 =?us-ascii?Q?yj2xwj1TpqQAGEa4hpH19I419nv/UtLoh0SkZ11Om6JV8onH4nKPagU414ue?=
 =?us-ascii?Q?zth04QVvJunBC/vZ5Odvm9frvO7s03F0bVdLCa4PkbaJjYid2bh81GkGvU0R?=
 =?us-ascii?Q?bwy7lSBO6lKl4oZaFhQ0azDTc9THiA+oxWNpfStkIprdATPnpB/yDs98cpvA?=
 =?us-ascii?Q?NkiC7XG3HRKVAANUuVEZmjdz+CiIa3wNjVspL6gtrngpLSdRWFqZG31dMs8R?=
 =?us-ascii?Q?h7Bqd9RlMHAmaVH5hMr99Xg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae6722a-8a7c-4b68-a1ce-08dcc578dd8c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:28.4222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkuIz7EY4ZyIj551LeQoQ4WU82FUQKydsnkLhfnVKIFBF/T1Vb3YPcqAhx4Ra7PqDhZwWslWM7lWH67BGk2KKhjX60nYN2pZZ/IjcB8/5iS35wMaLymmeBEzVVEL7g7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616
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
requested "parent" means "node" (X) or "ports" (Y), not "port".
Below works, but it will get P0

	/* These will be node/ports/port@0/endpoint */
	P0 = of_graph_get_next_endpoint(node,  NULL);
	P0 = of_graph_get_next_endpoint(ports, NULL);

In other words, we can't handle P10/P11 directly via
of_graph_get_next_endpoint() so far.

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get P10 pointer for some way, and if I want to
handle port@1 things, I would like use it like below

	/*
	 * "ep" is now P10, and handle port1 things here,
	 * but we don't know how many endpoints port1 has.
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

It is not useful on generic driver.
It uses of_get_next_child() instead for now, but it is not intuitive.
And it doesn't check node name (= "endpoint").

To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()

	of_graph_get_next_port_endpoint(port1, NULL); // P10
	of_graph_get_next_port_endpoint(port1, P10);  // P11
	of_graph_get_next_port_endpoint(port1, P11);  // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 22 ++++++++++++++++++++++
 include/linux/of_graph.h | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index aec6ac9f70064..90820e43bc973 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -719,6 +719,28 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
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
+	do {
+		prev = of_get_next_child(port, prev);
+		if (!prev)
+			break;
+	} while (!of_node_name_eq(prev, "endpoint"));
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a6b91577700a8..967ee14a1ff37 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -59,6 +59,17 @@ struct of_endpoint {
 	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_port(parent, child))
 
+/**
+ * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
+ * @parent: parent port node
+ * @child: loop variable pointing to the current endpoint node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_of_graph_port_endpoint(parent, child)			\
+		for (child = of_graph_get_next_port_endpoint(parent, NULL); child != NULL; \
+		     child = of_graph_get_next_port_endpoint(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
@@ -72,6 +83,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
 					    struct device_node *ports);
 struct device_node *of_graph_get_next_port(struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -132,6 +145,13 @@ static inline struct device_node *of_graph_get_next_port(
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

