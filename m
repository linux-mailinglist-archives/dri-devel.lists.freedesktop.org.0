Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA35796B112
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACECF10E602;
	Wed,  4 Sep 2024 06:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="FB1nYO4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE9610E5B5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDWIN9O+DAgP+Q/RuhOx28dOD0WJGqJNg5/XJ+xL0eg8ENypXjNwb6zPG7pVPslFf0gFxRPrRuKfxWdr3J6iLxYtzhnqGvzNgzD9f41/JPCB0Htve8+IuVKevlgUuQUGiMphYIyBjgmWH/Z2As9aXcNHbuC1nhjRuimU8++s4Xb/9KtPXKwuCO38RnYPPFxYL0P9VwPGoS7EC44d1YNhUZMsXQH6sD72FOMYZSmpJrtl3QNfo6PPqw4deqkMmWQGX8YP+0SdQPGy3mpJS/9YCh3zFz2ajvY7MggBe+bFl/3lAtFh2d1fnHRuqiNFrLA80UUepFbEjlqwHjZqlaZXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBdK7XNGwAFifeMrF8StvwRs0AlEsC+Eo4kDsXyG4t4=;
 b=o6RNm24njkiOQXU/sgZLPW1ZC/f4UMUrZhTzxTO3e/mg8HOofEOcSSOv16IA8QiQfCDiz81mSJuKJ/RwF/97ZXdmYa22WTFDOoKksbhrwU16kjhFi+psbbwQJob+KeRL9JMsBIGX62VbQLhRzpBLOG8SYLpA/DucqQyyYBXE5eDiPR+6EezypUkaxAuh1YOwJ0v2Z2Pn+mVbpvnu+uzdY8XbdALeHwMGuuPRUZcKZppqKiTz4CyPgNBtLWZHI50BoK88G/sjm7LayZYIGdE7uSVwgPFEzda4fuW2+b7VaXlkRlH/GWhHFRgbPzA10RBGC4P6wK9zoxRM+MINUS9/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBdK7XNGwAFifeMrF8StvwRs0AlEsC+Eo4kDsXyG4t4=;
 b=FB1nYO4tNxZD6u1K0sSDT5tp6KdrW1NsK457e240C02yDioUAcm9NjUMRhSYaGN7aEVYwKL1Xhc/djNTZulmXRBhYQdePkGzqBKmotormQW8htFuZClX418CcFKUPVuhvAv9yGNAADB+jF7Dm2tUoO/ZPYvlPLlOTh1AKcYcUWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:07 +0000
Message-ID: <87plpk6j9h.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/9] of: property: add of_graph_get_next_port()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:07 +0000
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fce479d-05c0-47e6-afd0-08dccca85d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K63N/xyLjWgLL2cdkVeOy605j/b4p9wDF3VjKWkq0ruGYJNXwf1qFrLH7Gxy?=
 =?us-ascii?Q?lV3MtOlOlQvRSGThHa+mbFbvU9fSdsK2QJ0+zU9Caf5wWjnGw8UT9I4WAsPt?=
 =?us-ascii?Q?LV0pqVGcNWctcGj7J/sb+5EMh7l6MtdmoVMOW6/boVlP7gST2cUmy6IaG+63?=
 =?us-ascii?Q?0Q+UBC4rHO01ZOOFKDHFvxoo3Q+10zYBROLsVs4wPVSYM3fgNf4ayjh9DXW7?=
 =?us-ascii?Q?vDbNnFMiehLo6uJavJeJ8SKQdlIxMK+Z2Lc+zM6MeKWCPP6Ll+3e7m/ReSIH?=
 =?us-ascii?Q?dnIct0jSyiIz5N0r0wzz3LKu5YL4dw6alMvtj/8IMXCtOoy7CAw54IF3BM8K?=
 =?us-ascii?Q?yTLMiUTaZuM7bd3kR4QQIFxRulxyy5rgUIYDk7xS93dJHWGB0qwKQa+VD482?=
 =?us-ascii?Q?ogoZg7WViBmxGjqpijG5With9k85IhpgdeD2hgu5y9rVhiuycbfdsjidT4aS?=
 =?us-ascii?Q?8r7IdDP6zSO075sK+L5KwQcqqjWcGd/lBrTQwXtB+XNhTzQHrkoMU2WdZMyd?=
 =?us-ascii?Q?OpgQRDmViab53v+tnBLlB6QS88Hyz5/NTIEJuFIj9NsZC7gbQshHx2fsKqNA?=
 =?us-ascii?Q?bpyvjovguD1gmnTQRc7cHr0KNHYPv5Dk5qTHsFMsj6H454NVqtaqJyn3osa2?=
 =?us-ascii?Q?Ii5ExI57NuAtTZZ57flD1ZAqfgopWZ2w0u/L39csaoydzpL/LQPT3uc+OkKV?=
 =?us-ascii?Q?1cUUXmAIc2wBCtsa4h4jnP3WtB5P2RsGKyrMAm8Fx5LCSE8695RcSfyzs7VV?=
 =?us-ascii?Q?SNG2Kq7kusD9ZPYiXHHrhDTyIN6bGTmEDGJSkWsnVMZtG1QiUHgN7JIXYtu4?=
 =?us-ascii?Q?P5nu751vYy0BrbDUtATidvLkqoy1D87/Qxc8Rr42hSnaS6iqX1Gtr8CD/wIT?=
 =?us-ascii?Q?zEJbzQD8xaWfRZCCAR28BVko/gEHEDY98dHSA+xztlwECdiNTd3Gtbj6mO9M?=
 =?us-ascii?Q?RpDOD82+OoIMK6q3YTZ6ZA4hs2WZV2MVwE/J5kWkGYNiPX17QpJA++T94eBN?=
 =?us-ascii?Q?tHaUFvTC7pNHgeX70fIT/+V6l5pJ/yZNkdrGTkuqVp8IYL1enl3EMKkkakZZ?=
 =?us-ascii?Q?kkE+Z1U3+uvpOEXSrsZSrBe2/zDjNWIcEcST0Sc5J9fBr9jOfe8eUIc3iI3e?=
 =?us-ascii?Q?N6fKzixxLGdpfM611YQ6KohLkyvC0fySDMGKK0qZKwapcvRIFSytE6Je6Jpi?=
 =?us-ascii?Q?ze0GMHPgL9LALonbU5RJHI5NaIlK9jJXRjc8H5QAc/eldTZ44oyuEkA8jnaz?=
 =?us-ascii?Q?FJbmyBRsVwmpmrzNINB8nTl8XUcG8SbmHs5NlDHHcCXhsBBtQ6iZNWGB06rI?=
 =?us-ascii?Q?PQUYc8gvzY4yPHwq6tZ7KYTIUQNhlMyEKLZ5dpBWp2AouAHlJba/KbbCH1g+?=
 =?us-ascii?Q?UrvhE0FGHHESAE24LrKCXPL3PlwUJj+qr1gsS7EcEELR55oDStHgCAiLoiKM?=
 =?us-ascii?Q?vdxSQNpd7GI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5O/yp6rfZygm+rqXrEKr85qmtbO3wpv9Z/MfFq9e0tOz3BRZGI+UPy9VTb4H?=
 =?us-ascii?Q?CO8Y2GGHJnf2p5hA9zAm3z9XBXXAByaemsRnWhQZDKH3hftGjniy6bSrzORC?=
 =?us-ascii?Q?/aJXc272+qgkRH/1wCJQJf2E9yjOjrKz+No0Aclp2s1XsOzODKIjUjTLkK4V?=
 =?us-ascii?Q?vKYlYlLHNTXxlJ5UInWbHOJnyZvR5UhZ08K70PhjtFoHOjGYqQNDOConPrtM?=
 =?us-ascii?Q?rLxI/dGdG4fd6WdcXnxFrQKLlysa4CV8m3/6GUg4aXanRlhtpjWKTeGZeaS5?=
 =?us-ascii?Q?OtsS5fxPdrVh5W0zYoeoKL1Is3ptNMWCUihVx8ZboXMGpi3RstPKLkSAobxy?=
 =?us-ascii?Q?IwzStHtX+YaQFlogNfHkEFwCoEK0ev68XLvq/tccJuc6orZMMaeWN+LZtI+D?=
 =?us-ascii?Q?C7zl7FO9iK5fx3GmXiohxmP5qdFrGg8/nUgvjsJ1v3crZwypY1EBdNKzhtcI?=
 =?us-ascii?Q?mECUthN+XwRSDD9a4/88QKzSThc6WsMSpCb4449NetmWafoJmbSyZW1fS3ha?=
 =?us-ascii?Q?+DuhI3HPFaLjPvWvpkDdptJGjL4GIZAPPB2kOz7yzPjK9k+DySM0zHgmh6E7?=
 =?us-ascii?Q?e6aMNBvnEO3780GOWgqZy5Y1Q5X8GP2/FJ1wHpVyKrE1nt9L12ruI9TEuyN1?=
 =?us-ascii?Q?3Dco7iLa+UWrKHcewRcdpuZm13qsq8efCz5fbpQdUkXIOBmF8BYvqNRZh3Hh?=
 =?us-ascii?Q?9CHeIJYwQ8SxVOzPDthHZaxXtrEa2swleZFARd8N3qa2FIYoKna8zvL8Q1EE?=
 =?us-ascii?Q?9w48NgaSjjz8YsPdDpTQCDXFHwbxy582A5lX5GzS8KtO9br/y0FDoNKirJsz?=
 =?us-ascii?Q?hdBy0ppj97c+M904+HZmOXeALlJTHU28jfr3s1UtyKa3hVe8S2oo4y3j6y6Q?=
 =?us-ascii?Q?D3HRfqpwn/Vs6W1UdZzwG77vdmnqr12vLafsufc5JKbxam+jfCq3l/2H00GF?=
 =?us-ascii?Q?NYehfszBVIpae2lv3qTiMDpiOoCZnGJ/ITkuU3wnz+RgRaZxD77/oNVal1p5?=
 =?us-ascii?Q?M9W9kGQ/ZPhU4ISdOxMNLVWOaBkET8NVKFFc2gbNpQdEICrt65B75SfXr/7m?=
 =?us-ascii?Q?Lv7ShcE+Agu9ZXok6dSR1zik97ciEWtFn7I2StYuaOxLmxHDqqCUdZd2XjVY?=
 =?us-ascii?Q?JT8d8GYYA2DCQ9kr/wIk+MvKzncfCPve+82R6IvvSFOKlyjiqEzX8u5YR2Ou?=
 =?us-ascii?Q?IchnI9wbYFzIDYHBLLK+7norKNlmOLzor1I0UYeADU9DcjUEOYkVjw8cyb8N?=
 =?us-ascii?Q?2FwJoDrWzF1hrhuThfwSThQTrOLal0SIv1xISVWuZLuh7CmxElOGCzAVq9Lf?=
 =?us-ascii?Q?/LqcefZ95+/5CqSkkGUse1kZVPpRTRjcY9mcGLr0v8UvgP/lDowR7nWkSRy1?=
 =?us-ascii?Q?4L4mPQxqw2tlS1h87WaJCJ24MVQ1Br9B5VZU+OaVN9HunMeAzDjVt8GtVtGL?=
 =?us-ascii?Q?6lI+QChECvR9jtYLKVQaZM22+mTCNBHSKRxfUWax24g1UnjNrI542wPgmUjJ?=
 =?us-ascii?Q?bdzOv46189/R9AWF3E+4vKADdB/4XInWGapWQ5nIrX5JXvE+cIKWkiFDZQbG?=
 =?us-ascii?Q?pNTdv6rkFb89oCJ8Iayt9DRD8tYF1hb06ijaIo59A0TbO4aBpulE8g2np5nx?=
 =?us-ascii?Q?0ksh079v+xaf98giaQFwMh8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fce479d-05c0-47e6-afd0-08dccca85d5f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:07.3934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j13Wl27GJDz2eWnvuAalg8el6HKoQXDRJTnRVFldJNm1ezlB+YvR6UqZVPUXDTQgg9RalqDuov3Oez6YD0Izz3yf2gKsdbTMAzn1/nClNP5hJ3gLNQP5o5+NKnwrQSyY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7309
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
index 164d77cb94458..ad834d8b8c1fe 100644
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

