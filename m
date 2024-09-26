Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B19869FC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C024810E866;
	Thu, 26 Sep 2024 00:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="c5PKDmWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFE810E866
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFInghLsvTZ/TTSZf5Zf6gbMuRMa0Lkv3eYJT7rQZwE5xAd4PHNsg7lycCB4RdR4RC1VO/5I/Pqve2XpeLg++nZIGoBoTk//hikZgJXIh4WKp1PQZsK7fAlv3REnzHoiudhvOB7Y7+1R0LCwYntoAqx1dqXSWj+sZU028ZQbVz6Q0JMHFArujqTS4I1DgvlqQJwqWnkIjSsGgSdc2mwQZiyOdBzfaEPWGkTFtXbJg1/1rIVVC9ESoR3XAabCY5+M2gRDBg367E21btLWZ0jKdP9ChD8b2Oi/SqUW77hnyRrF3MybV6eYUv+qtxdb6mazWlktbk2U/RWdFgVl5t9nxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoRhWG28gxX+heC8uU4vMSaaRrU8bfYQHyHoVRrepsI=;
 b=n2/YdQbhyjKrKcB/JSID7vefG9GRSFMGmBe7U7BkpUmiD+h16qoNj29wjmeyguaCutB2ph23ijbOEy2/8c6vbcLfU3n9MbToT/glo1JtvtXF6InTQsLtK0lBjqG3NTFRZKbktNPuWnGEwGrWlTgUVZmoWfbXUkrIqA8M5Yjg6xX8QihzAEZ4DRRlBDua1CquMCNSa8m2OPWPRx3yFrBlwjyQ3uFHMy+qp38l4+lQCNmCTGic9Os7Mptw056RksW/xqJwyfc8vbXT6JkZ4Otwn3kDtYnnueqx5As8C/KT2tZiTWtDKK33HIR949MthqIavnyuPC+VtmfjWWl/T3uWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoRhWG28gxX+heC8uU4vMSaaRrU8bfYQHyHoVRrepsI=;
 b=c5PKDmWT/TfnFWLYELgXjs/WRYtH/urXIFx0RbV2NpKZ3IUwMiYFnaRUm7J7Oyvd4be+HoDe4vuicaW2dFht41T4OW+ZhFKhXxVVxgoZJDamScif9zC087VgTkEFshyFjjgZhYvxhqwJPCPOPvT3LR+8hhYlKACidOGfEctFzT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB13322.jpnprd01.prod.outlook.com
 (2603:1096:604:310::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 00:00:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:12 +0000
Message-ID: <875xqj9tdf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 1/9] of: property: add of_graph_get_next_port()
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
Date: Thu, 26 Sep 2024 00:00:12 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB13322:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c8c880-3a9f-4b38-888f-08dcddbe319a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H+kXeJOWxqlqGj3hqDrADMGRvHrcu8Pi8PMO+ycUuii59CKhZ79FMnN1DBk9?=
 =?us-ascii?Q?XlXQmb+Ekp8Ld0ERpsNjiG35lPxYwR39rKNEqCR9XmuIsT7rSXqBJxlU3lEJ?=
 =?us-ascii?Q?kUwX9Ujz9KXTQq2Nn39wlo21sHAte2l5tT7RgWPL4xuOCLP0a5i/HB5Np0L4?=
 =?us-ascii?Q?vbstcoiTd61kY3Wt9Fsi9JPxS1irsC3paBbJOOOy2T66cqBAEz3vM+XYDp+6?=
 =?us-ascii?Q?P/kEtk9igiOdCN2aMLkcsENvOXCdG/FNpKoJymaUS1FDNs27DmWSmpOVD6Fu?=
 =?us-ascii?Q?+CXaw9mixmkkdCEVo2EoHw064A9sC4NzKhZbxTg2kHg41a4ptEcesTQ6qu4+?=
 =?us-ascii?Q?4HcVoOd6buaOryKD189zg9sYyJAJj61QUaYBNYYRIoiKWP+WGu3IBjGslVsU?=
 =?us-ascii?Q?roOqMUAUuRyn2qCfcz9A8yG/1xgR6NRgiVwoG8rYp6q0/yn65kN++Bi0GVYz?=
 =?us-ascii?Q?yl0Y3IEDJSYZsEAekbZhPpSv6hgB86VKcZ5QI3NYDfmIx352Oy7kgoDIwbLi?=
 =?us-ascii?Q?/3Acx7TXiS1wd5g7FoaJxT0aAtIarTmEZMsNwxiyIy+lYZPY4FH8IIPkopBj?=
 =?us-ascii?Q?l5KXZNwyqyb9/4MzAEW/hPMF62b6eoaBLVfKqB3373zDQNrohwuPi4y8ZfH9?=
 =?us-ascii?Q?0am8dOkyNkZNH6nBTCb2qWBKfd1KdD9COP/4D86tYrHsEY7XYPZtC1Tm9y6C?=
 =?us-ascii?Q?wOVmTSmpNMSPLRnsjzJ9h2jq9vu+Sa3pLak2DKotIwoH/rXMjrXZa56HsNta?=
 =?us-ascii?Q?M9vAkp0vkb7pPuqP9OVQCA/CaA8/lo+5fVSMnOibc/oAP4ImTE2nJRUmaJgg?=
 =?us-ascii?Q?jj8wFEd3oyxbbDLNavUiubArSA2tkJPBYuuIyKfpf+DXPPYktf+O3edXiCnk?=
 =?us-ascii?Q?aQweeRONZkSR3JC1KbMb+drsLnR/RdWbMKWa5QeNosrUAf5z/lTksyhinWdr?=
 =?us-ascii?Q?L8piB6KQEdJ6K1cirjFLWPU6kmZyKnKbPw4RxDd/x5Zw8cTPaGRYGnYbKpfT?=
 =?us-ascii?Q?sfa86mB07SCbTXlhh/jniNlOkIdHoXEz9TH81CP8A7GoNv37g4Yd/fqddy7Q?=
 =?us-ascii?Q?IURtGUefmDOOSiFTm58DEJ0V6DMo17qWvUBNF5Ht24gRCfdWvXeBOcHW037q?=
 =?us-ascii?Q?/n2YyvdlBxt10WNfNUV5EQHPZH6fyonxtX8fsZFqZJMxcuawZ7hw3OQapIxK?=
 =?us-ascii?Q?PGsosDFH0E3q2jKCwCiyiYf2hp+p6aiTRU6yWbbEbiSdUxxoaAjaKEj+JWtN?=
 =?us-ascii?Q?ev3nbX2jq95sxZgaH0fAodAnKo1BODtW8Fhn2/Lwq+e8jZxmWH86mc8T8sBC?=
 =?us-ascii?Q?j830BtywDk0XG/XAm07ftEKFwU/gkD3oDuyVlovyIP1abQk6xcXDoMXzPJpw?=
 =?us-ascii?Q?HTBLur4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ieHMhMWIpD9ix1SMX3GuIVa/7J33NVeHUWMArBLmjDoGQQ1dZqlDWUkQuQ9U?=
 =?us-ascii?Q?ekUp/nJt71+1anJFytWeIKpvfUPGzKU7F35es5v2aL/eS6piUtkkfciW+htA?=
 =?us-ascii?Q?J8omG0OieA8lFGq9Z9RgjjHYtWlfAO95155fu3bCaWrrVVqTFAg6fUlbPKRO?=
 =?us-ascii?Q?IFjIX/HBd3MNn+gJKGbGR4Ohghg9vkhbIWE4tGQT2jUO3RlPtle/RHJ/Gt6o?=
 =?us-ascii?Q?9WmY3qOyGbum23hwv1mVp3BQNLFHGPgY+Iu1yGozdaTarX1XR076EBUqq+Qb?=
 =?us-ascii?Q?xN8GRMXzC+2EnxUTSafyhYFtEeeV9vBl1iXeQKCVSpvbFMHS2tbqrei82KkO?=
 =?us-ascii?Q?dN+B3+GFSL0+0MPKjZWJMdd3noISrQ+qJ7vRepmKQr6wxro4JpyZX1kUk8FG?=
 =?us-ascii?Q?a93UILwEIJOppo+WfVjppUCZ34zm2F8cENO2q9yHAWV7lELcq9djJDDPT0gm?=
 =?us-ascii?Q?kk1p2XQyrfkUcY6qtau4SPwfH+jV1gcoF333rjoDThmT0QmtpmFN0rAin/PI?=
 =?us-ascii?Q?tBpKxDuQ6QRcKexl0U+/zatrQ4vl0G0jv/mDxgwyNAjRfxOZfl+g3coNFq+r?=
 =?us-ascii?Q?xpFPEBwMKyNs64lB/j9nBbuDeUPTvbC6NWeiLEk42869NTB9SLnwmnExiqPq?=
 =?us-ascii?Q?n2C+ok22QjGbI4OsqAe3HAWyT2Q9Dz7Pp24ds26+ulHX19K96ql723HY3cq+?=
 =?us-ascii?Q?BfTIjCZxZF1r5sIY28XK71PRTJfOQYMXw9bD0SWE4Z0n5DhsqDGskDMVwyDe?=
 =?us-ascii?Q?JiGYgOLWlaCjK6vwuBRP4Ow6kAn1IsBtLANeqNeCJbHYy+05z4anSy8ekM9+?=
 =?us-ascii?Q?IrD9oHcKV8GXe8nx1Nrqt1dWqA/kX1TrNy8Lef/COW8M01IHfLCN455xdSci?=
 =?us-ascii?Q?qPJW7DszQGPWvQURopTltrS4sGu+n7RXRMwQouSCaljXxp4f+p49T8P2c44U?=
 =?us-ascii?Q?UtF79EcKfEgybnxr8KZ7gT2Psa5EEKMJMAyYTlcAyGEd4Tit0JiIooxQeln1?=
 =?us-ascii?Q?vlMj0O9knEnNibbh+SstVj/VK+GaDVFoGIlyTczk3Lu2+c8MWfxcKjMBQ71s?=
 =?us-ascii?Q?9mdbPoMbxFyoc0d8Q2RBwOgIG63UAbXFJVo+9iBHyoG/mHwKN/BJ7zdYVamY?=
 =?us-ascii?Q?mqNLG+HWXcbmknqYPmfeXVs7e4zglqdaVGF5nXBgNXboW8Kc2TuPYYYRq5IR?=
 =?us-ascii?Q?gqJ8t4QujU81dK3NK7jdq2C9PM6LffGwIDVuDM0FNrWYmlihtrc9HIiwOmwG?=
 =?us-ascii?Q?Gjbp+jrpY05HqgcBq9SsyiYactyiT5xbnAkGx0SiLq+c305Xce1rQZagb9ut?=
 =?us-ascii?Q?TORrOFszTZRI5JB9+MlJeaZ+d5IWYTGBfo1jKXzikosh54uY3A1CaDk3FXl8?=
 =?us-ascii?Q?lCCn5e5bD3F5KIFQuoY7hPE7unZeggU38zdZa2ifh0QpisepgMn1fTdJMj4c?=
 =?us-ascii?Q?3F+shdBPTPpLl6CeW6wCw+P8jpTBwi1b+LXOWUeGtdulbN6517VmQ3n/j5Uv?=
 =?us-ascii?Q?M7jv712D4EGEDAYCiyGxdje+uVl/uIU9pEUdu5ohEVTiocGmUXDPJ9mqR2Wp?=
 =?us-ascii?Q?tBsgDB+T7+PDV4niC9WAMPxkbOTMDAVFhN1DyG+sOUE2pAAY0G6421VT6JXG?=
 =?us-ascii?Q?ht76jgkggPPK4aQalfcmsII=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c8c880-3a9f-4b38-888f-08dcddbe319a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:12.7729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLuDFXT0AXbfSGt6qc7ZGSynkyXcF5B9r2/3/Eb3liZPJxZcc/+59ukdN4Mbc1DTyzYrnQWtcUtuskNkB0UQexLSsHul/FycjJC/QGVSHtbV4pL/UWYNHaI5PNkWtCTG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13322
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

We have endpoint base functions
	- of_graph_get_next_device_endpoint()
	- of_graph_get_device_endpoint_count()
	- for_each_of_graph_device_endpoint()

Here, for_each_of_graph_device_endpoint() loop finds each endpoints

	ports {
		port@0 {
(1)			endpoint {...};
		};
		port@1 {
(2)			endpoint {...};
		};
		...
	};

In above case, it finds endpoint as (1) -> (2) -> ...

Basically, user/driver knows which port is used for what, but not in
all cases. For example on flexible/generic driver case, how many ports
are used is not fixed.

For example Sound Generic Card driver which is used from many venders
can't know how many ports are used. Because the driver is very
flexible/generic, it is impossible to know how many ports are used,
it depends on each vender SoC and/or its used board.

And more, the port can have multi endpoints. For example Generic Sound
Card case, it supports many type of connection between CPU / Codec, and
some of them uses multi endpoint in one port.
Then, Generic Sound Card want to handle each connection via "port"
instead of "endpoint".
But, it is very difficult to handle each "port" via existing
for_each_of_graph_device_endpoint(). Getting "port" via of_get_parent()
from "endpoint" doesn't work. see below.

	ports {
		port@0 {
(1)			endpoint@0 {...};
(2)			endpoint@1 {...};
		};
		port@1 {
(3)			endpoint {...};
		};
		...
	};

In other case, we want to handle "ports" same as "port" for some reasons.

	node {
=>		ports@0 {
			port@0 { ... };
			port@1 { ... };
			...
		};
=>		ports@1 {
			...
		};
	};

Add "ports" / "port" base functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 127 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h |  50 +++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 11b922fde7af1..f6cd614637181 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -630,6 +630,97 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 }
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
+/**
+ * of_graph_get_next_ports() - get next ports node.
+ * @parent: pointer to the parent device node
+ * @prev: previous ports node, or NULL to get first
+ *
+ * If "parent" node doesn't have "ports" node, it returns "parent" node itself as "ports" node.
+ *
+ * Return: A 'ports' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_ports(struct device_node *parent,
+					    struct device_node *prev)
+{
+	if (!parent)
+		return NULL;
+
+	if (!prev) {
+		/*
+		 * Find "ports" node from parent
+		 *
+		 *	parent {
+		 * =>		ports {
+		 *			port {...};
+		 *		};
+		 *	};
+		 */
+		prev = of_get_child_by_name(parent, "ports");
+
+		/*
+		 * Use parent as its ports if it not exist
+		 *
+		 * =>	parent {
+		 *		port {...};
+		 *	};
+		 */
+		if (!prev) {
+			/* check whether "parent" has "port" node */
+			struct device_node *port __free(device_node) = of_get_child_by_name(parent, "port");
+
+			if (port)
+				prev = of_node_get(parent);
+		}
+
+		return prev;
+	}
+
+	/* Find next ports */
+	do {
+		prev = of_get_next_child(parent, prev);
+		if (!prev)
+			break;
+	} while (!of_node_name_eq(prev, "ports"));
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_ports);
+
+/**
+ * of_graph_get_next_port() - get next port node.
+ * @parent: pointer to the parent device node, or parent ports node
+ * @prev: previous port node, or NULL to get first
+ *
+ * Parent device node can be used as @parent whether device node has ports node or not.
+ * It will work same as ports@0 node.
+ *
+ * Return: A 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(struct device_node *parent,
+					   struct device_node *prev)
+{
+	if (!parent)
+		return NULL;
+
+	if (!prev) {
+		struct device_node *ports __free(device_node) =
+			of_graph_get_next_ports(parent, NULL);
+
+		return of_get_child_by_name(ports, "port");
+	}
+
+	do {
+		prev = of_get_next_child(parent, prev);
+		if (!prev)
+			break;
+	} while (!of_node_name_eq(prev, "port"));
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_port);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
@@ -823,6 +914,42 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_endpoint_count);
 
+/**
+ * of_graph_get_port_count() - get the number of port in a device or ports node
+ * @np: pointer to the device or ports node
+ *
+ * Return: count of port of this device or ports node
+ */
+unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	unsigned int num = 0;
+
+	for_each_of_graph_port(np, port)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_port_count);
+
+/**
+ * of_graph_get_ports_count() - get the number of ports in a device node
+ * @np: pointer to the device node
+ *
+ * If device node doesn't have ports node, it assumes device node itself as ports node.
+ *
+ * Return: count of ports of this device node
+ */
+unsigned int of_graph_get_ports_count(struct device_node *np)
+{
+	unsigned int num = 0;
+
+	for_each_of_graph_ports(np, ports)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_ports_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a4bea62bfa290..6fbd2c8696fd9 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_OF_GRAPH_H
 #define __LINUX_OF_GRAPH_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/errno.h>
 
@@ -37,14 +38,44 @@ struct of_endpoint {
 	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_endpoint(parent, child))
 
+/**
+ * for_each_of_graph_ports - iterate over every ports in a device node
+ * @parent: parent device node containing ports
+ * @child: loop variable pointing to the current ports node
+ *
+ * When breaking out of the loop, and continue to use the @child, you need to
+ * use return_ptr(@child) or no_free_ptr(@child) not to call __free() for it.
+ */
+#define for_each_of_graph_ports(parent, child)				\
+	for (struct device_node *child __free(device_node) = of_graph_get_next_ports(parent, NULL);\
+	     child != NULL; child = of_graph_get_next_ports(parent, child))
+
+/**
+ * for_each_of_graph_port - iterate over every port in a device or ports node
+ * @parent: parent device or ports node containing port
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, and continue to use the @child, you need to
+ * use return_ptr(@child) or no_free_ptr(@child) not to call __free() for it.
+ */
+#define for_each_of_graph_port(parent, child)			\
+	for (struct device_node *child __free(device_node) = of_graph_get_next_port(parent, NULL);\
+	     child != NULL; child = of_graph_get_next_port(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 unsigned int of_graph_get_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_port_count(struct device_node *np);
+unsigned int of_graph_get_ports_count(struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_ports(struct device_node *parent,
+					    struct device_node *ports);
+struct device_node *of_graph_get_next_port(struct device_node *parent,
+					   struct device_node *port);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -73,6 +104,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
 	return 0;
 }
 
+static inline unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	return 0;
+}
+
 static inline struct device_node *of_graph_get_port_by_id(
 					struct device_node *node, u32 id)
 {
@@ -86,6 +122,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_ports(
+					struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
+static inline struct device_node *of_graph_get_next_port(
+					struct device_node *parent,
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

