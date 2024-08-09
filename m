Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26AA94C920
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4110E84F;
	Fri,  9 Aug 2024 04:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LgLLO/yc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D5510E84F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhIFhOwskAwoFI+qrERNqHSlNtW3nNf6GovlmC7GIFE7rxDZ39XWznUADsia9K22bFRyiBKuHBOyhU6X0Uko6cTcNRz3PLDanvAEG6GogwuQ992VVWkPgwrPedWAmHgCzE7SrNk1I+NLmXK3L2oNWf3Zvy47RX47M0aOer7FrE7v+nvhqOaAqrn+fUWAidIh+rr3nQ055XZW62KozNu4lzlW6wZDU0BA2sFOfbmYfWVeTPJUd7eL4YUZNlb2unxI+BxPFSIEj+vnUa60mxMFGZ8w4BtBnqVgYJptHXulIoC1nmbjrw+1EHwKo4uW5BwcrV/3II+8hCDdLPcZ/Y6Znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxYZARE5YIAVlLCOn5vCZq4OcG85LHMVzjMRxhWqpK8=;
 b=sUTKHb2OIJEQreRaxN8bXQ8b6CU2H/H7kK7qlyVg0p388Gl8DLbSTypYy9f6NkFS0KACBXZ7GexmqAZjBUeVpvrCWzIfuQecO9gSTQs/LjzYzkcKDupqXumrLNosTxjQztO+WT3BJBpAhoF7Ff3g4HuacKV56/bDhwwP4HHjE5ELI5iPC7zcDNDTek3sPFHB9BItKmQc7INRFKCzBPdfuUZtkhjoYIX14+FEJac9rSTpdtUqF+k/7MRZmz1bMn9SI4Ceu86LD9hGh35RMPV+BdssGfmYFLCVQ84VgtS5vyqI9mTfyd9s6WHG0k19jImdbnXqQ9fdmznWaiZn6rCucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxYZARE5YIAVlLCOn5vCZq4OcG85LHMVzjMRxhWqpK8=;
 b=LgLLO/yc3VW00kqYwaP/LJs/nirzvao+wbb+QkC5Eq7iwTr4HOU6WunDKlniO1zDiDSeZOYQ/09dS/gApg5BY/CZm8VlsPMvDPj3bb6ahxuX2dW7CnPCkA4T7tTD9lQlfdRSKud40CqDdSkCOVwMDGouepxREC1bOJQvmZGI8ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9639.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:22:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:22:22 +0000
Message-ID: <874j7u8gw2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/9] of: property: add of_graph_get_next_port()
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
 linux-sound@vger.kernel.org
In-Reply-To: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Aug 2024 04:22:22 +0000
X-ClientProxiedBy: TYCP286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cbeb3d-e069-4c01-c282-08dcb82add7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dLxi3Cb3W5HPd15o+MIW/6BgnAf3EfNbAOqwlNZbL3udeKrvjXJvrbdnou2C?=
 =?us-ascii?Q?WPl82D7dwxjttQIeYzLKXhb3ZlWE6o2Ok7KNYeESgZvCSEhhNCzNk5kevZ7U?=
 =?us-ascii?Q?80b+p999T6bB9snwTl6yjsAbzqcctVAObHTrldRv6qHWgz/Sj0S+TLd9KKmv?=
 =?us-ascii?Q?1os02BJR62BiiMElAsJrDpIFH9X3hoPw3VrnDVexccl1MgMlEsnsgZA3YEf6?=
 =?us-ascii?Q?2Sgy/W3+90Hg8EKcMBS5BQw8aoMrt2+lZhxUZjjLCa7zP+/cJAb6yUvx2d9R?=
 =?us-ascii?Q?qDtb+e6ENu95j9ue1ZBfS2edJT57djCxnxwjuJ7/PsVKwvh/GHMXWRTuB58Z?=
 =?us-ascii?Q?jmMoqRl+jxWPhNvs+zlLv4w4hnXPiYFUK+VQqsPw2DGnThd9ltsKIjkf3aPZ?=
 =?us-ascii?Q?K5a9j9xkTyT732ZVkXdtPnzWGOqeZdbru4HtqSDVuZUbb8YM99BxEta6r0QJ?=
 =?us-ascii?Q?Rc8W1NrnkBX93ALXhmbFASFmQ5MrtF/o5TYWi7JeYLPIvNkBMnKKtUXKQMWH?=
 =?us-ascii?Q?BnHTr0KP1yMUwjISC0tI2Vz/d+TrwpDguC6amgF8S7RdIbpFPFeEnk7s7cxf?=
 =?us-ascii?Q?F7y3sf1nu+CoXbbk1VSe5WkF8cw2eoFdGwac/BIfgghce3Jvtqvp2CibzXaG?=
 =?us-ascii?Q?u10EhIBGpnNL681ta4w1RHcJJZuZ0gGyEr09Sz9jujct1LMPKv8ZcIJWaCsF?=
 =?us-ascii?Q?nwTVAAwnDe+FImcVRSmsge45JeUnHp2GJ8C9LB8+1zqKpn4wi750hMCNcAsh?=
 =?us-ascii?Q?VgMIOfxylR2V+MZVr4zuUsS7MlYGpfnaM7Ia4psMOdwTaD5NKZRgUk3MRWo4?=
 =?us-ascii?Q?4PlAzGE1QiIrpqww4wUyIY7pfrCqCfudj7cjqqFHzuZOO4Dk05Xgt1qSb1PC?=
 =?us-ascii?Q?pTetAOB+KrI9T5GUug1l4dRNXtHaTMuCU7kCcithvjsWF/2ItogmrJOnFCCf?=
 =?us-ascii?Q?voGSwqg0XEyGpzh2uTpRA6TStsDGa4D6d7ecWkdWeAYYGcmF3fPkVOJQnqm0?=
 =?us-ascii?Q?uRUHhMddifnLoVPE7xBz035jMncxTzVLgnPGvEqycJJxUCb5uQ/9it+URjqW?=
 =?us-ascii?Q?Hcfawjo1c9CUv8vLCsl/jfXQ9Yl1eHUPIkAC31MAhOcCLfIIgzJFnD+qac5m?=
 =?us-ascii?Q?RUjK1p330Ytf0Ze7AiF2rEqQnLERYtGTHs4LfiUVxN4wky0iM5NheRPnDFds?=
 =?us-ascii?Q?fELRlK1LBNix5fwcF7ruR0k4NhscwSKBhplqo52dPeIlBsazRt7EmSYwKZPD?=
 =?us-ascii?Q?blrz2YF5NM3825IR1A+m3lrUEmCzO/KJFwuAZJKmvm8QqCAg7flDyoYWvTQw?=
 =?us-ascii?Q?3uuDDHDJJNGNDT1kXpjxM3/2zIlThmFnnt2rzUnaRef8sPUODyXAu3SCcBcA?=
 =?us-ascii?Q?PVgteG3xqykd+2FEwfAc+Zh63PK7c7A02AeNjiaYslEZOjABS3xXqz1wPS/c?=
 =?us-ascii?Q?XxRTOHkk5Pg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TJ05b5OnsEvmj8cofx8DxYLA1eGTsvPvpcv9pZk0OOn/HEsCvfZZeN70b4Es?=
 =?us-ascii?Q?TgnkU0ucMpjVFQJQzswXhxH3xiOhk/9g5dBYuntP2wHJJCxhFEyLMLfl+utb?=
 =?us-ascii?Q?1taQIqkj4ikN5qJ4TD6jmDvuCaeWCbS60ppclDTBCMgmM/a4+s0aZNY3Cmp3?=
 =?us-ascii?Q?gGV3fKQQk4WnWRCqlfcUbO4qwOx1HPkl8EP5gJLypr/DC3MClCeMsml8SGiS?=
 =?us-ascii?Q?BBb2wYHnOrmz3rB25IaQZfH+hAgBgcGHM1CBqjRqk4ZV4mOxVwf8/+9Q/YQ9?=
 =?us-ascii?Q?AZgUEn2u5l2zub2R2O7rjo+O+SQ/jv43WxCC93rHzdhGu9UsGvTwwrC8r3pf?=
 =?us-ascii?Q?x7cMAPnOUVAGKuZWXV4kI5BrLgJu5uKAMgPlVgTNjEoEzOB01jAOIS0ATACf?=
 =?us-ascii?Q?qtC04JtTVSuCP7vdxAfefiwydz9lMYiNcSjpVx/JMqq4OqeVdPgzsLXaCayu?=
 =?us-ascii?Q?oeDlvUl+pg7ljyXmH/1UUyO5uKF7r3scHLpW4w1OOWL/hVWVQrMJdUfyz0yf?=
 =?us-ascii?Q?gW1W2XU+pYCVL2KUd0wbsW0B+2YpJAM7FJKTco0AxxfzFM4eptZV1TKTuwaS?=
 =?us-ascii?Q?LKYcIbznzJmTq4T2uSR4C03KmLbmJyjKOy8mOOuaqsQUISj3/zluSYxm2Wok?=
 =?us-ascii?Q?Ja69DSjwZzFQSMciufqYkBE32emVYayw/ndBeUSkdHHsdIKBmXtRjstma7AS?=
 =?us-ascii?Q?eklvr0jYd6vhay/v1vr8pDowa+ZMDQmM4vJeW+byc/ZzE1O7T7WheO277JWc?=
 =?us-ascii?Q?cJcEXSWAlBhDuVxwILttoO1lsItPGAjBO919eB7W6uGq0vLhVevM/QDqaElR?=
 =?us-ascii?Q?iTGYIf2dUuIhZLi3tw0jd6yYqD0n4kUze8PuK2axGCcIA+Kwb3QggXGELGzG?=
 =?us-ascii?Q?9XiV20B+Z5CSlt0VJqm9zdkWMluyWyL4LcYVOkdYp0/pYBQvLpDGFu1nqwB7?=
 =?us-ascii?Q?0mrX0c4cXq4Ehbj63BjFSbAw1VvcyxCsU45cuCEc9hL5LQtmuy9oCJpH1FBu?=
 =?us-ascii?Q?xc7ngNy4sXtKIMwKEW7LCOfhc9qDmhLm2tlH/umrkwVU+fpULzl3vIcnRW3V?=
 =?us-ascii?Q?3nxa9fNhpxl3HutpGyhC792DIV9eyc1CautMF/aYyuYPcom/OKeKrZ8tdZL8?=
 =?us-ascii?Q?GUFlxIZQWO1iFIBA/uwC7OjCB13YIkIANK4ZbqKL3rkMDXtysbZBPEdptKG5?=
 =?us-ascii?Q?7nq90bvBFYTA43T2PFtjYUiIVIpQbVRr0gM2aKnqjchjVop7rLDBfzTBANfL?=
 =?us-ascii?Q?sXDRBAt3VCUkoSPwZfZ8QfN2dHwPtbBmwJTdunQpKNjZQj/RVoS1AcOxbjoF?=
 =?us-ascii?Q?WD/c1A9fIe9Z9OeWB1h7STDKlgDz4yeSUbxVXw3C7nE9reNbsbnwYToHmqfq?=
 =?us-ascii?Q?2co7ledW+6KMRu0A1wwJTwGm215jGmOCq+h8ojm+9HwSNoVMjk6SAfyknG+O?=
 =?us-ascii?Q?fFn+hELy3HxVHteKC0fck9o2krExR+dgqxGOwaVi1wVm4IvoRjFUQt0up72U?=
 =?us-ascii?Q?QnfU6nChNqaYWL98LzdpdL4uO3kLdt1OCY89nHyfwfovuL5/2at6kqwrSyR6?=
 =?us-ascii?Q?4wEoBs9wyANyxHzkZL/DJkUXobNvBztLQAg8HVyYxq0CCCkaMDQVQxvdDwUl?=
 =?us-ascii?Q?WAZnLFfaIaQIZ+e4zjpNkyU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cbeb3d-e069-4c01-c282-08dcb82add7b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:22:22.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2HmD28QVV9bFjfEEcg/WK0T96T2XXqKvKGv8/E9dlYWIE/hgLOIv/8N9iGJ4uD9Q3AMnxGHW0ghcpDZeJJUR9f8uzDhXA7ZCeXBPFrB3NKj3FAagoSrj2fhCDt+DXHX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9639
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

This loop works in case of "node" doesn't have "ports" also.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 88 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 46 +++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 164d77cb9445..e4d5dfe70104 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -625,6 +625,76 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
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
+		prev = of_get_child_by_name(parent, "ports");
+
+		/* use parent as its ports of this device if it not exist */
+		if (!prev)
+			prev = of_node_get(parent);
+
+		return prev;
+	}
+
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
@@ -823,6 +893,24 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
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
+	int num = 0;
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
index a4bea62bfa29..a6b91577700a 100644
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

