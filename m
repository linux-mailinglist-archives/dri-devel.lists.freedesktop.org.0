Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E895E6C8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA7E10E08D;
	Mon, 26 Aug 2024 02:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PMfB1JzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A210E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbvyqWNVfIwVVDLV7M4XNaYSv0A9NGW7FricS7y9CJ4uxabth1KF3+Z1EBNabSoB/3+FFcNdUiYSA6+vEDdqHt6D/5ZWXSe83xiY8kSfIORrm4RFQ4Txv9ZEL8fsbTLUmYHkzrjqscZFm7WSZHvdE0S1I15NaFz1a3vxbwKnGY6OOWk9InSmjGDi1V3qXk3nSuMXYVFTLMOG258Yb6iyIcrBOs/Yz7upa3LpGAuvMV34rGsM8k5/X+OBApqRNxsqgy4Vb0yRS+AjyAUfOnqCBqwm9WoF++nWevFX1yfkRUCeMLKo4zINl2PP2o/tTpFu9qvGR1OsURECuTnycmPstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbM+qTIc7kxSIVX5wMZ9A9LBJGysBXbu+GTaNKKqHlc=;
 b=huy6NXH3+R/SFSiJoFjJHIbw+tFZmmXSs1KDUc69Gn0VbynX/hb6gsP1Bd/XYn8NPvh6CYa1NvwLJ2HJX5JSZ9TdbMksXj7qORghnd11PQofFBSCIIijQ164uO4IENKlgFjFMFjVH1/5mY9CW0mIc3YHIzt1MLjbrF6zpiYfUCi+OxTT1MBuR2cYE0awwiOuqUZXQvhG3gre+aeP6an9w56Bpxu+zA351wnqB7kb5OR/OFqH2D8sdgF4Udb1TjMVhswgO7+lzTSMHW/Ol8UbM76wGIVB1jWOt87/nRN5OgtEWYYgncHJJVwqtOCvXEPV4K71HpyH8/r7QfneFqAu+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbM+qTIc7kxSIVX5wMZ9A9LBJGysBXbu+GTaNKKqHlc=;
 b=PMfB1JzNe/UnddCxt4CGsT2bEXzIjZ9TSN19szwtAna6cM0LVYxLEXTHVGjIVsXyYcisDgzPCD7E00aytxWGEPLFcV65ysqwe6Qh32oGd5qOJQyX/NQaZej4yoCmEkUYsWM2bk1SUQRQGuxxh47grKM6jI1on0/peiTZB0BwAHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:24 +0000
Message-ID: <87bk1gqa0k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/9] of: property: add of_graph_get_next_port()
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
Date: Mon, 26 Aug 2024 02:43:23 +0000
X-ClientProxiedBy: TY2PR06CA0038.apcprd06.prod.outlook.com
 (2603:1096:404:2e::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1a86e4-cf53-44cf-979b-08dcc578daf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QdWPFICBG5GhrWf84GR2jdYuTA7AIYiYFc0gOX/Bw/rchmgurKD0n3wWaCvi?=
 =?us-ascii?Q?Ty3tjyrBIRGGYNA3DK332O7RQ5N4QncgXgc6nF03ceMEI40Ki7MJ2eI+NAih?=
 =?us-ascii?Q?HjlrqWikTnTU4N8RaXrM4pG8tttSaWfTSJ4486QmZktpNTQdYKM59mqrbxhO?=
 =?us-ascii?Q?F4rXZGzc4/V5bSNt1cHj6HzGPGAW6O4WI29YrWJV8W8zL8KCI5/HJpr/C/Q7?=
 =?us-ascii?Q?JY33c7rLZ1NKl2Tg1n8pMy0L0DkvF/+zWEGyXxieJ4Jiece64W/kXPK5gJqr?=
 =?us-ascii?Q?q91sJNoRyXyAXEuj8705QjAiRyai0UW1JqSm/0gE257yrHhweE98v7B0xaBp?=
 =?us-ascii?Q?PZLhGZZs9gmE8+nKk4sE/iwoIkOazLhV3evZZWssyRm3mRUUlb2U33FpLvmp?=
 =?us-ascii?Q?qmtBuy1fY7f2SPnd9DCsTbsflxudqe4M7g+492tc5hfz1i7mu1/cH/OQ3/hR?=
 =?us-ascii?Q?wYUCLG7k6D8x2kOUdKgtBJToqnKT9j1EXy5pJVPZQSMDiX870Huq3zBgpC8f?=
 =?us-ascii?Q?prPkaCsI4WEZn0gKkLPWP8OyuNaYFyu0sonh2zub1dbmz0JRGLZBc0exHvvr?=
 =?us-ascii?Q?r4hOm5QOw3FZ0HF1wm6ntaHlf7mLHpfED2s/rN2jv15ex1Go4NrRdFIG4Ds+?=
 =?us-ascii?Q?SzAgCYwe98wSIkZHJSXi/jZBC02g8NwR8Rrf+qTGyOOtlzfrrDdA5Eej0pqL?=
 =?us-ascii?Q?qu8M32izHxRJoi7QxBkVyN+oyJ3fC3AkusaORRNGlTlt/TL6JPMGMFFjU/wf?=
 =?us-ascii?Q?ks3YAH/UEhdAHfzUI4JmMgsEMPUz8AO+6Rm5lNIuUoNtulwy7DlfmXHa5tgQ?=
 =?us-ascii?Q?gSTaeBtDUAkAhM0f6+nUUlUus83r2EXTBtZeybPltIrzoA36XrjyI6amDze1?=
 =?us-ascii?Q?WmAE5YkGBwNbKfVPYqJq7uHU8gtJ6bbet/bb9m+c41CBJowukH4gTEz+l3Ly?=
 =?us-ascii?Q?SxHfYxftXZwL+uBwfmnHvrX4hJFyMvs9SHo4CRbq55jAfQgJrjsvOS4WBt5/?=
 =?us-ascii?Q?wbyQW+tGUKxJFUboXUcsIPVrATWX4jEirkEioOJZCg+wSDD0k5vNcXhs74gb?=
 =?us-ascii?Q?XU8f+qVYvO60bqkSEiCwtN9DUK8fN1LvheZhqlt9QonKAgCaWJ68Ab/6lsKn?=
 =?us-ascii?Q?ZDrRodcjo/fSwZ/wnVNm7E+CYAT4e9O/UOjg1HQGy0VsYYjcUbrIJb5n8UW2?=
 =?us-ascii?Q?3/0/T9hxymiYK7boeWtzgHkxO+xAI5899tfSBKJaGnwow4Uwf4+OP4UqMCPy?=
 =?us-ascii?Q?ZU1b3VmKKXZZdqs7QIM9/dXnf1r62rLnk60YkT4BzLo99eSXon7I0hCAaPgb?=
 =?us-ascii?Q?E7/SLuShQGW8jxcO1OaHS0y0l5l0MZNVIZoBov9nLMCfgq+4w0ZXZ8tyYG0h?=
 =?us-ascii?Q?5ChNpjcM05A1WRp/88K6k1OZ/6u5ruZMvSgumoziQhy3tDZ398RpX/nFnmek?=
 =?us-ascii?Q?8t5IhYbFnSQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Xf9S58mdpJ7KNGqG3ulcCzQXZC4JZaFe/b50yWPrILHoFM8O3bWU3ZUDA+i?=
 =?us-ascii?Q?9nj/+/l7ANR2VpErbd6ThDTcdW4hOu4pGY/GIPXHyRfqwLws5JetRz39cT86?=
 =?us-ascii?Q?HOhMpqIwNUFoPzQmX9S3ppOC8tFklkzAL5C9HWSxwieUTELeiC8woDA1m1ti?=
 =?us-ascii?Q?t5vMSnI7ox3leUq2dfZMZyq1ORumkIs7D+OqEIt+qt3kaEewndvmlERgoUdi?=
 =?us-ascii?Q?IEFU7oQCar4tu4OBZia/XSTV5j6cFULoGW2tZvKiZppXZR49QLnWNv044uOV?=
 =?us-ascii?Q?3UduhpI3E1CCQd9+QmJYPMTf1b0APjblaF4PEoexRizXX5cA325twzFy8+3n?=
 =?us-ascii?Q?DbcMbR+mty0BP9BTw/Ws1X0Umn86dBxiYKnrBLBf6vXSqaN7iccN3yL3g8sF?=
 =?us-ascii?Q?W/w9yzOt9/ksW6t4A6HHIT8UObdbDuFSDgdiGPnaHTi066HhfQDX7FHMvIGj?=
 =?us-ascii?Q?JU2693BeFX3R1zIqgQZj0cdtPXSKhm/XRDfmWAG3WIAzv6X7Z+V4iB+WKgXO?=
 =?us-ascii?Q?rhU/rSapnMW7DAZpW+VQXym5z+glCdIk/qg3mRNaN6eepl+raHImmRX47aEz?=
 =?us-ascii?Q?CZBfX0624fjjSNvoiYaKz3TazPdB15gnzC8OpPk5hh1Ey3ADtn2qKSiyReXf?=
 =?us-ascii?Q?qr0R56RoE813pFlmq5Oip4k8Fr5aS/4xflke5x/B9S1FpF9Mu4RaxwVW1jo2?=
 =?us-ascii?Q?cHz1xIjfLbmSIIrdMqp1lR2MT0I3GZ+fe7i5FtKggxHgcr8HgHjoomPbAtWj?=
 =?us-ascii?Q?oNpIWxpnycJF0JUDZyE/sKDAfdUAd1X4zo40IclbCuv1fWmd0R6Io7McuP4R?=
 =?us-ascii?Q?SR69yg0R8nzTKA1OG5wnFMHzmHRrgS5uhLwDxWcXiKiNOM57rU5h6z7Zyhj0?=
 =?us-ascii?Q?vjSUArUOy2Rp/tscZp8+YLYy/J/5CqwbSM2u5ApyrgyBGPaQVMNcO5xcrfEa?=
 =?us-ascii?Q?rY5J99neDYs9w9VqDlp15YG1ZJY0EzXsIDBi42kWGTQLWK75ALhsPi7NKq+v?=
 =?us-ascii?Q?hn2p+/kwyp0xVnFqCzPQ40HCuMNxIB2yKOX20Otqhrfzv/6Dx9fEjeOqnMYu?=
 =?us-ascii?Q?waEwCIb5yNJczn3G0YH/VWYUHM5Jf6thvK9akycDNDaAah5vpo8xzEdXfzTV?=
 =?us-ascii?Q?ygLRAQ+IXhZt57xLnfxSBr5uKya6PpUIPMSmFNGb+397uxZMiIzsZ2CIu48F?=
 =?us-ascii?Q?jWF82B2MEOfDTDjwvF1L45ZdY1NQJqEKzpGlBR5qrfCj0BQnpbg3uvJ0bkgi?=
 =?us-ascii?Q?85dNj28stABlTH6t3Rtdd9AwzsrPRq0Gw7ZlBNpr33h7vJGQ+J4diELHTx/X?=
 =?us-ascii?Q?p5Gign/71SixtmB3ndvjsl2crQhHa5jlZtHQ0ZiLzhvN2GGmG8UjoPOMCiR6?=
 =?us-ascii?Q?Iyzju6U/QZ3RNok0vxLhO6UGAHb/Rg0t/xkVgbhGII21spNU4IHq12pxgu2k?=
 =?us-ascii?Q?Vkzo9Iyj8DtfU3M5Fay9SAP/InD/HFMaloMYcyR/etcikRbKmGpbN+kJf5dK?=
 =?us-ascii?Q?qRmhDdX3Lz1zJl7MXmOBF5y8zl7G2FN2icYAheha2ItW+VzxDExa7rd19Mfp?=
 =?us-ascii?Q?D923a7wrSU1M3/I3OSiVCnLP3E4gTwjg7maXWQoq2upd5oV1hgDM8Bf5ckst?=
 =?us-ascii?Q?2+kok3+mn+o2vwVlX3ME0HY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1a86e4-cf53-44cf-979b-08dcc578daf3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:24.0654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqreCHxCxqYLa7YFNJS5UlvGcZyMC8HCeePFx5zSz8sA4y6PFGekJgL1eJcM2NpBWUbLH9BehwlRrnv1eDz/r8emi8pqQ4qeC99PnvL1OKUyLjGBnbgyiwJSFbJ68UA/
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
But, it is very difficult to handle each "port" via
for_each_of_graph_device_endpoint(). Getting "port" by using
of_get_parent() from "endpoint" doesn't work. see below.

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

In the same time, same reason, we want to handle "ports" same as "port".

	node {
=>		ports@0 {
			port@0 {
				endpoint@0 {...};
				endpoint@1 {...};
				...
			};
			port@1 {
				endpoint@0 {...};
				endpoint@1 {...};
				...
			};
			...
		};
=>		ports@1 {
			...
		};
	};

Add "ports" / "port" base functions.
For above case, we can use

	for_each_of_graph_ports(node, ports) {
		for_each_of_graph_port(ports, port) {
			...
		}
	}

This loop works both "node" have / doesn't have "ports", like below

	node {
		port { };
	};

	node {
		ports {
			port { };
		};
	};

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 112 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h |  46 ++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 164d77cb94458..aec6ac9f70064 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -625,6 +625,100 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
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
+			prev = of_node_get(parent);
+
+			/* check wether it has port node */
+			struct device_node *port __free(device_node) =
+				of_get_child_by_name(prev, "port");
+
+			if (!port)
+				prev = NULL;
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
@@ -823,6 +917,24 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_endpoint_count);
 
+/**
+ * of_graph_get_port_count() - get the number of port in a device node
+ * @np: pointer to the parent device node
+ *
+ * Return: count of port of this device node
+ */
+unsigned int of_graph_get_port_count(struct device_node *np)
+{
+	struct device_node *port = NULL;
+	unsigned int num = 0;
+
+	for_each_of_graph_port(np, port)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_port_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a4bea62bfa290..a6b91577700a8 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -37,14 +37,41 @@ struct of_endpoint {
 	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_endpoint(parent, child))
 
+/**
+ * for_each_of_graph_ports - iterate over every ports in a device node
+ * @parent: parent device node containing ports
+ * @child: loop variable pointing to the current ports node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_of_graph_ports(parent, child)				\
+	for (child = of_graph_get_next_ports(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_ports(parent, child))
+
+/**
+ * for_each_of_graph_port - iterate over every port in a device or ports node
+ * @parent: parent device or ports node containing port
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_of_graph_port(parent, child)			\
+	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_port(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 unsigned int of_graph_get_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_port_count(struct device_node *np);
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
@@ -73,6 +100,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
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
@@ -86,6 +118,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
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

