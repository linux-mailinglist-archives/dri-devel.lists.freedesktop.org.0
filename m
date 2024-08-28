Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E856A961DE0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4810E497;
	Wed, 28 Aug 2024 05:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="UNidP+Dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6915710E497
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQJrf7fP5rpcErzN6iDM9WTIZrl9gF+gpUA/kbPERgCTPX2AYfdFTurs+pbhY1Fm6eckIzNjqm/fmHQ41IryV7F4inohlfNMVu4hYJPXJw/OTeol8NOU6JL8iW/s0wLdFyDvPGRYN2Av3yhvzhn4r40JgRPq+/9Zo5gpd6LPyvQPB3HTG8nQoCyOi+wTEOQsT949WRfHNtr7OBliz+mtByDdXFpeP6Fpb+a5nctjKB8AyAoZ141qGOu9Eog5Mh7AYDDYqiceyy/MdIQTgLR8rcwMJJ9Px3MFLHNm5Oc8by5el3qnmm06HTdHFUcEAyFz78J7wcxT9z+VKOrjUSWtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ3Q0/mts9BCJVhMN6tJG7zq3/dJiWfL268lC4wgoW0=;
 b=YHwlnihB4aYZszRb3Q3/9hKU88gQ4iS3fpIaozuZ/kNuqg6peynpj3o2JVreb1eL0HQscLTfXauuJvOeZ4ujpSNbrEIpcFO+mt5FA/Oz/3aynxrkXbeGfxiFen6dfLXaetJWE6WdGtJzICaU7KwtMbEvosepRJz/Oer9RlxB1nI06FMI3mKUHebpWhT503ogHwHXXUOqHu6U4GdA5jw50p+0dg8VIKUROuW2CnLttk4ukTbycCyinH0GlD0jcxfXcfdhlPuc4NNZcWKHvzfdNb7zTDE/0Z4Gj5RGf7pRaj1B+R8MaD9SpvGk0BAStT7Zlk+e76l4SEB6+dK2thqp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ3Q0/mts9BCJVhMN6tJG7zq3/dJiWfL268lC4wgoW0=;
 b=UNidP+Dtkfmynf+aLj+Tktq6LENGudp7F60a3B0OFPp/eqmbZ3PjZE+VOFBZ6iWXLVZl0GLu7p7xIiIwoyk2DixNZaBXnBATyo3mkB06x9DNgmHmht6IOYvjxmvTkzAa/85ODq6UgHJLBLEJB1JbOKN7qP0j1V6s9uafRUZ+Ffo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:11:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:11:37 +0000
Message-ID: <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/9] of: property: add of_graph_get_next_port()
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
In-Reply-To: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 05:11:37 +0000
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f1c982-bacb-46d7-ba70-08dcc71fe4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qni01Wile97Zj2T1KyRKapfuLbGz/YfU1Xdccu1gKeoHj+4A6xY367PTjCg6?=
 =?us-ascii?Q?X5TcplFnATnzTkz918uugu4boHlmyp9Pe9t6Ry/GM7Aa7tclcbX0SB2dwTLl?=
 =?us-ascii?Q?0Xq6dlH+vnesrrO/32j2PxDdrm7pz5+E9DOTgbCGK2nfqk/dJXQIOb/i2O08?=
 =?us-ascii?Q?OyLsKd3Y+NzbUgQOrhzLkhqNo0bj+Gxoy/WoMlXCJxHkQGIacgL69teLu+Kh?=
 =?us-ascii?Q?YsQq7hXE7AznLiLhN3OUMfowxgrTSl4Hw5Ek8g4KpiMSNYP4T3ztomVBffQ8?=
 =?us-ascii?Q?WKAwIQEBnXgZlu5RarUCBY1OcIpjKiq+Wv/nlv/XhQM21I7taVODYAcumk+2?=
 =?us-ascii?Q?fwztui0i3hHDMQZWFBN2TXNk+U7V+W5n/jgakqlctE7s3a+JJ0AFmH8CQRs0?=
 =?us-ascii?Q?9rJkp9QYX9oowjmEQBvsPBd4q0cVBsgts6L2S6+GIukma7eq1n1rFeJfqOj/?=
 =?us-ascii?Q?eFID5L9lXOAWzPCHTZZriO5tWjpcPf9ISpsB4bZ+G12UsdvPoNzHqR9B43gr?=
 =?us-ascii?Q?zdI16BQePN2CcSCiUCM2zRkjI7DZW8vKPBbQMGclz0PYSFO03KXWiis4QX5S?=
 =?us-ascii?Q?FBbAP7HKmJaOhqwtk98vODiFrJ/OsrWibLQ694dz2vBgVFEeeKSOYYXPLjRB?=
 =?us-ascii?Q?vjsyBkuCl5AyEo+q4TALoqSaTHK02p+meQrJ6fI+Iv5o7oNDbhMKHnjbArap?=
 =?us-ascii?Q?rPUxo5CvgOvciwbJ5lZ3zKrsgObVOr5zW2YsxGQ6vt1AALN/bqoXHFy0105c?=
 =?us-ascii?Q?GCKocT+/yGym5fGUvrJ4FEm30PktpEectNj/1u85Zr6G56FEyPf6kObopI3O?=
 =?us-ascii?Q?tZaIhBg9FTESFST6x3Eie4XReeus9Vfy1xFE0WMRyhuTEtJFhDQhN2V/Ib4l?=
 =?us-ascii?Q?ci63lm2k9Ea2hRepP34puRmJQEx4SMCo93b7BGIQb8uP/lK7c/MfKVkmelXr?=
 =?us-ascii?Q?LcqVA4fg/49HGp0ZD8t5lVDBRs3xbf3MtU+pjis9fDgfF8qcg/UGejGUICKw?=
 =?us-ascii?Q?eruFrTc1ykHkgQTZI0YalYZbnXpAikBBO9BJK8HvljtgHmoHj7FDcapx1bdD?=
 =?us-ascii?Q?CpWEXhYBbKhY8j5lc7f/Bg0K0tF3CyzzVQd18CG4HSb/GWvT6YFrEcRcGo0R?=
 =?us-ascii?Q?ZDnS+7/4BBpcNzzZFLwHtvTPAWqWPgjwrhKPcnzRA1pqDDVAMVW9L1vQwqqn?=
 =?us-ascii?Q?AO63Bc3l8rl9f0yuWJH+lwYN/G2wyAVVgOZxzoXSRwQMcq8jOg9YmHr53HDn?=
 =?us-ascii?Q?z08H0aPNsHmDxO1PaXFkfgw7mOm63+Y2psT0BzqkcNuPZyKf5d7xRWHrN3E/?=
 =?us-ascii?Q?yByFmDWCFdHKd/1DQUvXy6xzraR1JG82GLiJ1Ef34ZX+SnDq7QKt3TofE2zi?=
 =?us-ascii?Q?vipYFsQWFic6XWWFbTbNkSfLXmK8fOxsDTjeIur0CckaGrwbEABanCQO+mfV?=
 =?us-ascii?Q?IAYjG/Tt0nE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lA30kb00NFGnDco5ddsOb3FUZQcrxcpumWAEDjfKZODWMtMOiN2ZbVrizuto?=
 =?us-ascii?Q?mnGXRmXUryxAP0PYgUb4Z5MyqID/lo+08m3q+m4lpVnpJIRYIv+ESNlsarcU?=
 =?us-ascii?Q?o9ejpOAlLttksONde953Z5L9P5EaVorTcOo8UxKN4553OObt6v871vqVPlCN?=
 =?us-ascii?Q?ypqZ3IhtHMtJ87CreUYAtw93EJPoCWoAbOhOV4r6dRNMNvWyoefNSYNINb44?=
 =?us-ascii?Q?imsRvU/AmZJQhYcxEO83wWrJdVSbyAw4ChoSSFMdpYoV5ifavKWEFVkKijR3?=
 =?us-ascii?Q?Mm2KZbbwdxJQruM2FFjgnPFecxEixYa3WpBpcY+ojiPnFwfPSq1hr/PVQ7W1?=
 =?us-ascii?Q?diOSMjw22bhGd+Chy7zLGOPfBMl4I0EY/EozNJ6Mk8NVXyWgs8tx1yk5yXQO?=
 =?us-ascii?Q?fr3OsKQsdB5GFR7JcR+5B1wQCAuq0zZOnZUYTvBpCnYVFEQYH7chRCIpAwfH?=
 =?us-ascii?Q?79BHygvk5XXAPtybOhU9lV3suNZgHlmjIIgAWkEXoWdFkWE4BUWdmJ1YXxP7?=
 =?us-ascii?Q?k1xr7jZBemfTEUjLXHkllrF/xm2LdUOumEHzwP5qOfsq/RUx8ueWV0NKEnwu?=
 =?us-ascii?Q?9haMHfL58ozKR20MfzUTUy/Rlo/u2VaXTs5a9OD3GcBDw9/tSNr7IjbNiJTC?=
 =?us-ascii?Q?PAzJ74w4Y19sqHb0PiWXlL0sUMFx/phQNF8WJOepkwVUl7PA/nSP/Fy3F1r/?=
 =?us-ascii?Q?Uu+7JqC6ibGJqkAPlJIY5E7Gi6/N7iXamNa7CeKiOqwrIcKNtvo0BTQgcrjX?=
 =?us-ascii?Q?jKoExj1wZri0Qo+P3Fo6UJOT/qkT84KHW9utXPBTHgvhXIS86nFqFCpAdn9G?=
 =?us-ascii?Q?+Vgx2BIwe+FmVdcC30u0qd9Ee1oQsMoc0ShoRJRnklyiwKaxGPznLpfDAIgD?=
 =?us-ascii?Q?LC6pcukc0hZOaVQ1YvRHu0tvAB4tsMjCEyoXfVEspGGzVmx/N/zywP8sl8K4?=
 =?us-ascii?Q?t21lFDnxUd8/T9OV6Vt9EzsnirHMPswKN83tHBWnKakU1qxe+scVYccI+hc0?=
 =?us-ascii?Q?nILwI9gts2Jb7/1UoGX8Ibw+bflyPMJwuXKaelijSjs7U5HnvGGAINN/+uhy?=
 =?us-ascii?Q?gA3U21Xg0re8vPv28pCT3nfHQWoUejlEzSsVHsM8xlncV70Ejm5Sh9WW3HR2?=
 =?us-ascii?Q?whDd5OSulnqI2kXxEdX6MG2cijNxg/qk2WDLMXA+QALeCFGRCVYKmRrs4G0h?=
 =?us-ascii?Q?G2DIMFYmkRn7eRMonE9kBLROHEIYHjgPMWeWkKQPQxblooqv/0Pd1pLz2sNQ?=
 =?us-ascii?Q?zEoJhxsfP+TuH7cPJo/QXMjElKAejbFxAWTCUKkY4L7v77HqTlNVvl7nJLWv?=
 =?us-ascii?Q?qnGQTl2xHfqMZWvb8ahYvxZQLDJtNDpYzlkuhQTa0Rcfst1z09Xt00RgmjKo?=
 =?us-ascii?Q?92e6e/2u0sAx3gCoepdqfeTYgjby3CFEKgTCtF/gvWerjHlnIzPpA+aD9agc?=
 =?us-ascii?Q?sJml5brdTA0fOTkgrgRQwd7ZmXge5yrNYgqhEhDlvE/QNmpp4yMZcrzSsD+I?=
 =?us-ascii?Q?K3LdvIxS+gXGo3J9i4U+cgUW/bBt9BfhDweAf+PenXkx4sr2TSpcsMltwZ/r?=
 =?us-ascii?Q?VNnbMqQwXpk6wR00v5VTOTCu+Xbi1i1gwe7uWcfN0FjpkAkol5Q25Qohw0rL?=
 =?us-ascii?Q?+9CjqBT6cn62pBumPESAff0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f1c982-bacb-46d7-ba70-08dcc71fe4b2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:11:37.5392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gNkqrZXjqG5lpnQzwHFzmpQ+t/aKBzBqOsoUEE/r7LUsnGFUes/Y7TH/NsHBLaly2stuYZFQIz41NobtqIjwyKnEwr3l3WERkNu56fDfCbocRVAcbfnGjl/jmwnfXsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11955
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
 drivers/of/property.c    | 108 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h |  49 ++++++++++++++++++
 2 files changed, 157 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 164d77cb94458..d99b34dd2d5b4 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -625,6 +625,97 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
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
@@ -823,6 +914,23 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_endpoint_count);
 
+/**
+ * of_graph_get_port_count() - get the number of port in a device node
+ * @np: pointer to the parent device node or ports node
+ *
+ * Return: count of port of this device node
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
index a4bea62bfa290..d5e9d0ed3145d 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_OF_GRAPH_H
 #define __LINUX_OF_GRAPH_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/errno.h>
 
@@ -37,14 +38,43 @@ struct of_endpoint {
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
@@ -73,6 +103,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
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
@@ -86,6 +121,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
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

