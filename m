Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C209AD9A5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275F10E887;
	Thu, 24 Oct 2024 02:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="YyosNEqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3688710E887
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNaHXppTwazAIyGJyhMoCGZ6gvBAXdGGUok2J5Xl+7p4sR+puZ3Zf3iIQkGZisXtebtfdtiEb3CbXOdh7zn6JBhTWaWQKrV8F6rN5dyO9LR5cGwgoNMQhi1Hyel6bJmNsnllV48Z9/+okH0Sf0J7tK3V3V9Zf/8GaXNGf1ZGSlNgafSbI/CVRw8ky9KY07mynI1/2HBXsT8aT5VRfrT35iwpYSlqhKyk1Sg9mLDrIy4vAeeUIa4oKNqARju62Y5nBKBaUKkgOGG4NJCyhe9pbdQ3R1TfYuE38/h0hLUIFgitd53HN/0pz9/AFoqQccFY9RR1kGXut6+nmk5B8/9gCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJLhHsD3BHXJ4wIk58zeTG2N0Bpz71CtBXO3IQhjJ90=;
 b=NM+Qp/krxE+x+c0+BDWNBKhv/tflstJo1a3Mz6ZjK2dzocPsUEZFx+l3HNcoVi+ZclSPGL4qSwlKCm6wR8S2yVcKDTa1wnWhLvIS2Kr9JNEOLpMr+yta+VHluvmTmwihrAzHJu/1JNhs22Cze1HipwXXeWXjzJA/8CjzE2OJdnPBZjI9uMyTlUQQ4FW6+9b8+dlIWX+hLLrP309aCXTskFunVQ1xaGQlEQn3Zw63FAOOx5RoJ2DYATagikWwrKTFofDkCP/qnivWWTfIK2p/yEdaQy0hszzSG5lHDQ2eQvtyKZmVp5/3U+kZ8ynzakeJ6tv3N0Ji+fhdcaFi2fhlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJLhHsD3BHXJ4wIk58zeTG2N0Bpz71CtBXO3IQhjJ90=;
 b=YyosNEqZtbdeyeDd9U9gxX73NLpuxOxU4vzr8604hXGBP9V8TLCXlXjE/zMt0+uJEUuh+LmHoRMQgfpO5g0kArdj3zSgpp3JypTxhPPiygTJCo/bBCSkohZJsESrULWNx76XohqYaIkpEQDcGeFhwwkiyWcv9okZlsaP+ouY7p8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:02 +0000
Message-ID: <87ldyeb5t9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 1/9] of: property: add of_graph_get_next_port()
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
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:20:02 +0000
X-ClientProxiedBy: TYCP286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fc2c77-3303-4395-3fe9-08dcf3d25df4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vi+jD0SOho4J5RBGNuDYbZIfeGIzfJ0t37U4jaWUnn0VKBBCiRozUNrpWROc?=
 =?us-ascii?Q?TX6myAnuX4Doaqe6KTlusCoRtD+dqjn6U2UijuUI3DyIHx1BMcAAblSd3E7w?=
 =?us-ascii?Q?TCxLuLoJXLLBhISKO7ieEWsPDmXcKdD4zbRf3zVDCq29lSZsdRtsmF+uwJh9?=
 =?us-ascii?Q?TEH5CwOdj1jnV9MMldhcXmSXZRYjRNqXEuwrX7SMnfeDD1ITzRD1IVv7CNLe?=
 =?us-ascii?Q?6pECITFNxdzV8penpbxRWyzB2KecZmWRXMQEo2mkzZO4jmNmuQN3rt59NEdX?=
 =?us-ascii?Q?xs7FAf9CIkgFJrT4gnKu5Uxb7Pm2PDPJil2NPuvO96D5HPpm9l7m5LUN3Rt/?=
 =?us-ascii?Q?M2S6vd/qS0/BIHSW7WpQRQy46eqSjrBbe02taXl4doEyMDg27Y6Txn8bUt4N?=
 =?us-ascii?Q?vazMne/5Ssqu5EREWp62k8Z4J++ZKkDooRWrhfr5WTB1mtZkeaPc1ws0eFPD?=
 =?us-ascii?Q?GExkJD7bJXEcGAp0ttUSRTidwgCbdAi7BvH+zOUxrGMQdWyLIc5oh76LxbpM?=
 =?us-ascii?Q?8sHiRS/cMFLUq/y+so54xZ6xGdg/zTjOl5ftnZED3P4nqWtU8FiSSr6zsVES?=
 =?us-ascii?Q?j17Pn2NUlA2BnDA/G/CSPKoTLPUwSlcWV9pXMkB/87u6eZa77jfOkrl/o6yI?=
 =?us-ascii?Q?d9QCwDRtolwWeB29mL03BmXcm6CUPfrGgLOSNc4hbd9EG6h60UmZbjTTgfSc?=
 =?us-ascii?Q?h6VofXGotcKuv+K7Wq+W3pd+F0TXlF6Oh/GnbzUGyd+ZwwNHmaSQVTHmVT4X?=
 =?us-ascii?Q?oLn50HcgJCbLuBNf1LLteJyZtVjsziJBdtXHcK+gNMoF73DCumNaDkOd1u2x?=
 =?us-ascii?Q?ANyqvSkibhWCQ0uZY1zH8SMfwFzYrBFczzhZiecpGptlUyIM1S3WQU2JFPRB?=
 =?us-ascii?Q?kwLhqHgYjwoEfKEQ9XrWAc0FhBHS3+vYWrQvZcwptOBS3R/B/BKzED/cdQiF?=
 =?us-ascii?Q?T6pYvNYz+TMq57Lw/YRX8KULYUXvvizg6RNnQgTkZKijQGcAe5PBAnnwefVA?=
 =?us-ascii?Q?l/KmC6LyKftYG32JR6Jxsk4pAYNmetQplOJMCdqRiLMAMASx0nXFeodjfW3m?=
 =?us-ascii?Q?JvK+cfHMpWPqGSWxDmJH0c9I1G7nZ/xTFiClDMcOjq0saKLCfh5zNCM8ARZ0?=
 =?us-ascii?Q?T+HEEVmaqXlZBQuI/DyT3B5XG6aQAJiPjUuXF8AHtk5rn2fLRnm0aCVJNbna?=
 =?us-ascii?Q?HVbk+lLR/nCiaBctv8e/5cg2PqAn+7RjQRsjMCm1by9qKAA4OXivypKhODCR?=
 =?us-ascii?Q?fazuyg1ntJXp27Z42qunToTVMupez9+J6LK4Hz4Eus0a+oTWRqBMqoNpE5uM?=
 =?us-ascii?Q?OIDWcUIocTn0i2jodeSPj6xZhH6PmKwQmMDr7Z8IBiOPsGRlCt/6hWWY9AMp?=
 =?us-ascii?Q?7Z8UC++PWNjxgZa+XhllNOsFhKt5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PEhu155sEaicb+6Hu7qLxSbnZ7te+01RhL7JvvE51aphBOYEYE3sv6Ay5pen?=
 =?us-ascii?Q?Sh86HarOlvFCSyMidFdssoJ9wsdYF0vgwXRYjMkcNONPPj+NYXw8kG4uVqvI?=
 =?us-ascii?Q?QvTq11jCMbFyqNjfHhNgZhxVyC0Md7x75RXEwYsxOU6sSw7ciE43OJx/PK9F?=
 =?us-ascii?Q?fPqX1gy+49qzv4ebYEAOcn++6XUcT7eN0d5pymOxAPpB1lBp0Xnh4Td0cJdL?=
 =?us-ascii?Q?X2ERwKhPZt7EBK6VyGDduuNCcyLWyEeDh0hgNf7/FsthIM0pOu62hrswo+AM?=
 =?us-ascii?Q?DmlP2UQn2ypS32vg2XbfO/aLOykGPy5SSSC33VgjH9vpjR9lm3gb8EYcDMeO?=
 =?us-ascii?Q?FkwSWHhFlRRO7dswPze1Q6pAbHYlR3q1iYCxO3uPnLUV52A9yISyytkp3j6W?=
 =?us-ascii?Q?TUgzHXZd84kRZm9KAzEeX7p4+BpagDqaKwvuTaJiNguIXuPY/WsoF01WtqUd?=
 =?us-ascii?Q?47lXdwE6fr8qUSguc9IDMESRTJfz+07Db6YVyMTrcXKo9JxxdihgX15U3ygd?=
 =?us-ascii?Q?PMfljHFzV6175l0ycHziLopTPQ+0lh+GTUtMs68F22dem0NDrpScYDZwyLuU?=
 =?us-ascii?Q?AZdVkjupPSgCpGkYeuh9EMqDmj+Jh69W5NDt1PoG6h/UmO1vylfEHbv/X7RU?=
 =?us-ascii?Q?j88Plgz+3tqjBEO3vlk0LSejn73OYQIEjdxh2SZbNMIbvxyfT+7UtWkq+x3/?=
 =?us-ascii?Q?cIUSgkpT+Qbqfv5DxO6PV4gyq2qIE/dEzQ4vj7K3eOIqx4gL6m6Yo72EFvEu?=
 =?us-ascii?Q?0pQmZzHRsCnwgVriXjCFePevY/k5Xnm0rk5zukE2jO7Itph0LLhj/iPBcNJX?=
 =?us-ascii?Q?npo+IcC8F6NlY8ei5AAG2B/JtJkubgqEzmMvsphmci9eLo0KMwJErBRI8fh8?=
 =?us-ascii?Q?OVt6mkysBoZEbNXY5/YF5jR9Ofnz+WxHDEiIfwubZxkfHEMfndqVD3VrPYRq?=
 =?us-ascii?Q?p0sCi4IWuvM4Qzgnob5Dram62/2+t2zICXBVo8XAY4xX09fpnJI9pMrbIf0m?=
 =?us-ascii?Q?iOse1HKaHn0LjEkfyCVzV0cyinCVW+dfJU8fQW6GwYlVxsVb9ioZt6/2VqqI?=
 =?us-ascii?Q?PkfwVkRpInmc7MpxXshz3Wjs21AHnt3JTE4rOPfmw7LNHNnsclq5vdRzgR82?=
 =?us-ascii?Q?t+Jm26VohmQ9cRRQG+gCZ+Hzin2yE5eS8qaEpTQlC79Hwq2K8PWJgvOcnTjr?=
 =?us-ascii?Q?ui4TCztfPK762Cr7pq5N4hlk0EVYF98U+bv+IOx9YMG3ODwv+3/Rjxa9pRVM?=
 =?us-ascii?Q?f/k8FE5K5/LOQVW5gRXNApOhSeYAPMPjrEqRyHrTfVsPFj6FoYfmThWY0VWM?=
 =?us-ascii?Q?1YJ1NRAgTxB1nWsBycHN4bA1VummR4dQhbcMpfKLKfx4jR5bNnN3XqkEj1YN?=
 =?us-ascii?Q?3eOhomSqKZ78zlVs0fLM9T7Ni6U5bgs3EgmhZ6BlgMxQufP7ZRBV9N/Q2DLG?=
 =?us-ascii?Q?pxV9rKpCiUUx5Z5UwOEplxwsp1Ccl6/RjKy69O4veXwh5GBK3us6YNXFMJLY?=
 =?us-ascii?Q?kTSzZexnaYv8bHS/g1JakzduXvkkejA563er9qlF+6MS1srZKCOpHMI+zdDI?=
 =?us-ascii?Q?eEhIhtCMrnhMmyOlljnPIA0PJz6WNpGYhB1J6z8OhAGPlFRdiUPKGOXGjEtc?=
 =?us-ascii?Q?cS0zFT1uu4H9ID7TstISUA8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fc2c77-3303-4395-3fe9-08dcf3d25df4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:02.5703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jN78FxnfGxk+UXubneVyf4uBoDtlWAYO5G8ek9ZUKZK4ULL/Z67qDEZDhS/PA0Eo+8n4ZjOILWbfq5jAmkapoBPhhwqui+vlMG/ub8ExLJJEbBti08gh6ai7PgwHVE7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629
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
	- of_graph_get_next_endpoint()
	- of_graph_get_endpoint_count()
	- for_each_endpoint_of_node()

Here, for_each_endpoint_of_node() loop finds each endpoints

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

For example Sound Generic Card driver which is very flexible/generic and
used from many venders can't know how many ports are used, and used for
what, because it depends on each vender SoC and/or its used board.

And more, the port can have multi endpoints. For example Generic Sound
Card case, it supports many type of connection between CPU / Codec, and
some of them uses multi endpoint in one port. see below.

	ports {
(A)		port@0 {
(1)			endpoint@0 {...};
(2)			endpoint@1 {...};
		};
(B)		port@1 {
(3)			endpoint {...};
		};
		...
	};

Generic Sound Card want to handle each connection via "port" base instead
of "endpoint" base. But, it is very difficult to handle each "port" via
existing for_each_endpoint_of_node(). Because getting each "port" via
of_get_parent() from each "endpoint" doesn't work. For example in above
case, both (1) (2) endpoint has same "port" (= A).

Add "port" base functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 54 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 28 +++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 11b922fde7af1..375d81fad8bf8 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 }
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
+/**
+ * of_graph_get_next_port() - get next port node.
+ * @parent: pointer to the parent device node, or parent ports node
+ * @prev: previous port node, or NULL to get first
+ *
+ * Parent device node can be used as @parent whether device node has ports node
+ * or not. It will work same as ports@0 node.
+ *
+ * Return: A 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *prev)
+{
+	if (!parent)
+		return NULL;
+
+	if (!prev) {
+		struct device_node *node __free(device_node) =
+			of_get_child_by_name(parent, "ports");
+
+		if (node)
+			parent = node;
+
+		return of_get_child_by_name(parent, "port");
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
@@ -823,6 +860,23 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
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
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a4bea62bfa290..44518f3583a44 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_OF_GRAPH_H
 #define __LINUX_OF_GRAPH_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/errno.h>
 
@@ -37,14 +38,29 @@ struct of_endpoint {
 	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_endpoint(parent, child))
 
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
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *port);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -73,6 +89,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
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
@@ -86,6 +107,13 @@ static inline struct device_node *of_graph_get_next_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port(
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

