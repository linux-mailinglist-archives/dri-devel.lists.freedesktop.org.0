Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54F961DE3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958D810E49A;
	Wed, 28 Aug 2024 05:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="eJMR+mY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23C910E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7xKNAit5lvTg5lK1wlyG07i7hBluCZ+Ie+wppg1g/Kld8pNXo4nSNCfF4pm3L021/7XCVZYhzOqwWeiMttkLZfCmV3GDgetQxkDdPRt76Va0QzqgDTpZVS86/UlyDUnts/SNlrJXCbjvLZHvm8LaIlYcJRIg8SlmrogM0K/W6C47GyAQBWTzRm2/0q1D+60Kt38u0V1FY1mh1qVSuGKNB2omNC8EwJP8dzkFo5dEZrAG+0NLrb3UxDJaX+3sIQfLNd4DqDmnfriauTqBwpUJWCtDxZwJz5HoSmXrRyp/LIG8IaItR+EaE2mWnFxVW0BQhLGbtWQX0jO1/GQ5T11Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caINNuwjSdjF5e9AjP2qw+j3mL2DYJ7HEtdeMmZlYc4=;
 b=o5HFwKKhXQhdOqzwYa8GBoRH/6Qy5vTToXY9xwhzjRdY9eZR8Aog8KCt9gVUIw4Azg1gZRmAtmVw33wBRnBuEYn9hI6aIiZQebxR+C9XjAG894QY2Lz1kEokWFCfdezs+xLvva3zmviyjmLdg4sUVks4L3NWZ54dyaZ63fiN+99PrZLLjAMB+DlUNGKoirPqLcR525rIF5pdwYhMWF7nK7MrgynHnY08/SWDKUM5TfXxY/XRYLlKZ61UHoErrxJZ0cSMhozdwNo8JctHo6iSjJHnsIc1+4Qp+Coam9GE08GetJXXqVCCvEOOjzUsaZOj/SXimjpqv0YU25D5Tx+zUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caINNuwjSdjF5e9AjP2qw+j3mL2DYJ7HEtdeMmZlYc4=;
 b=eJMR+mY45S8BIBiMnMqdNIFn4FRhKvkwGOS1dmLYsvIhyvcWns9lBIsQgzCznCfGTywYQyBsB8aCPgVQD+gCXJS2d6WGRv4BPhnhBRYgSfyX7q3ieX1xF3QbT12DOrztAd4bkFPYbhQJqSNOWhn2cZIKRXVJ/KAj5JV3quGd2WE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:11:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:11:44 +0000
Message-ID: <878qwh2pv4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 2/9] of: property: add of_graph_get_next_port_endpoint()
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
Date: Wed, 28 Aug 2024 05:11:43 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: d97b14c9-464b-415f-395a-08dcc71fe8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oa6eVMwPEpGJhsN1OwZLwXytS5P8bIrFEv7JyA1vboNndVoiG/eUAm24XlKt?=
 =?us-ascii?Q?TB3cX65YJcdJ6pQUO0Q67uxrnCCwTBvRfvtQ22wuSyiRMi+YyNyBivb6FdgI?=
 =?us-ascii?Q?Xqf6zlP4FL9szkxQ0+egQNXkzVpPZQdyuen4elHwCk3lUixTR1GuhVpADbrY?=
 =?us-ascii?Q?kJjpRJjTJcXZaVGVcefgzqL6ifC4pSqRz2TYTw2sUsR0nWyAur1hlwWhuwr7?=
 =?us-ascii?Q?QcwFs148TsC+/OH08qx99FPL65RGWr/u/R/bRI3BqMJ+ojb53bn46h/HPsV2?=
 =?us-ascii?Q?dZYipqJAls8+GhERH3a8Q2oQqEUaPitDF0isqVmX5qefN1TG2ICAWHIqtFXv?=
 =?us-ascii?Q?LAvqK9Jq5WFJaam3TDO3OUETPlQQ/NY1vFoCUPuHl2EXpNJJbAVGuEdyXa5H?=
 =?us-ascii?Q?SNiz/YLjgQSGc3ub9GNeegm/z5qwzB97A0kAk188rZox/35RMqz1x15I7X3W?=
 =?us-ascii?Q?KZgZgY1Kd/S0O5nEI6Q8lQZW+jnViBvyE0+NGYTifHCHwkXZblACYaSx1Z1T?=
 =?us-ascii?Q?1TdMR9RLDgcGlZTPf8MV+hFB2TMzLv30fSlRH4RMHpZcfsoqXjov7iA+KnJv?=
 =?us-ascii?Q?+c/CBjof35FWT5dX++QePVAmgMaEaMe7MLKkBIF9jD4VuspHQ6CafDMvwxH2?=
 =?us-ascii?Q?8Bah8EK9xd6nvLHJpf2hJlxa2Eo4Ooyy0cKPF1jIV6fP5WI5EzBzKcf7eu+F?=
 =?us-ascii?Q?zhTCK+qfyXVCWgdeT+xVn1yGs6EZ9C9R7FHEicxU1DYkg2gTrlegFZ6qtb33?=
 =?us-ascii?Q?9qld1ohp+as8cl1stP9jBkMLrNEOdnaM4v3G4xT1xDq6p+wvSs1s+AGMfxJp?=
 =?us-ascii?Q?YFGYURowLKMInu8wd6G0z9nMLI7I3WUD0AFD3AXE05mP33NOhRjTVdWrIomZ?=
 =?us-ascii?Q?9UgMNiOv+WZrtHFm72+UVDxSNgVGxZLccIekrhtBOnj7DpvOjOskWGzJoydN?=
 =?us-ascii?Q?dZLzRwIwX8N9RY1ipLVLO0y2IcvYCYSMpJzIGludlEv2fGKdILA7kKlyck1P?=
 =?us-ascii?Q?kygsoMPJmDtpL9BJphfkT/U/iRESWKf2Im0mjmBolY7Evt25LbQrJrQ8Pa4I?=
 =?us-ascii?Q?9Vm78Yt9XfqTpHUlCiFFpTLNmTFeNQ7YRAAC+MUttasPBMbNnmt6vTVdUhuQ?=
 =?us-ascii?Q?D5wiSYUGu59rto2SwVVHgXvJ0KAcI8+eLjH4NCn7uAuV6EPrtm7ZbvBf274V?=
 =?us-ascii?Q?2wrIVkBD8kE4sMk/dsjwIiAPJ1u3M1AvokZG1cJJCn2XSz9lmRgq5h+gyLcC?=
 =?us-ascii?Q?oYOhcpyH1/WyjnaHQc3V27lF604jF1momeZBPOui5KQKnVNKrxZ/9C1MAf54?=
 =?us-ascii?Q?p0BPnqt/nK/4qMFtBd77KCjCXZturMYYX5M7svBdICvPwMkClNny+2s+c9NV?=
 =?us-ascii?Q?5JtelMiAwh/Bzf/A2gN9IA13p7OXafCEZ+KE9EVPY3k66MtFmCAZFvYhnmw6?=
 =?us-ascii?Q?3GwLHoRlGJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUllNGSUJEfeW9XOgjL18bwLekuVomNOC+ILtLxrFETUjQs7BMXCItkfvu6k?=
 =?us-ascii?Q?fD8smz4dEiU6RHing1wPib9/1yNfCVrw5IW1FtBBt1cyi5n8wDTfATZoLS3Y?=
 =?us-ascii?Q?jqJXY1DeaJlH93+8Ak+8DIoSncMR2JUJ+cc/xazAd63PNPMr5c3R4OmwV5gC?=
 =?us-ascii?Q?kMEGFLtl3Mnxf42NJzp73XETZHYZT4Je5xP9/dwG/A6MyIciEcRxuoMvWSYK?=
 =?us-ascii?Q?+lfCiFHDEpYxahhzLnthfRLFlCLvA94BccBfJPNjEPlhw+WXmmU5zIHQb1tV?=
 =?us-ascii?Q?UX8txSo9EqLYxsfhA+b1GFzFQkGp3Fg5R9anTk5pNWBzA2hJhWjeFwAPlu1X?=
 =?us-ascii?Q?quEwNfJ4vGWNJhXUWlxwKoZmE7Fvh8OUyAdgbZpP6rZNPMPW3f2pqhG0yL71?=
 =?us-ascii?Q?i0xgLIYrkIUhW3YFo70wjAmlpfPWvJ20w/VCO6ntCNmDeFsHO9hcmfrRP1j1?=
 =?us-ascii?Q?1+Dr+EBdzny5dlpsKq8qrav4XYdxrnp3snkqO9HWKIlFGPoILnOjjwvIqgMm?=
 =?us-ascii?Q?99cjmFhd04lUveWD+d1DB0wV7Qhq+kyMpn/+sRdGITOSyweXyCfaVVsRrwWM?=
 =?us-ascii?Q?KJ2S/6/Aawr0kbXdxWfGDOy4iKIWoB5nOpH0bf97OnvIs50IfjAqV1F3lTZM?=
 =?us-ascii?Q?i+aAqXZC/ABpFInEQxCUOygE6/t5MJXwOtWSxt/TcHaR0vUCm/xpjHa1qH+1?=
 =?us-ascii?Q?MX6L39LkQj1lbYo2qobwQWyc147Bwv9OaT4Ui8isJxS8sRtOoiIW4tjB9B1P?=
 =?us-ascii?Q?4aRFHzTRSCmft6Yo40yD7fZdTn/mqdDprUJScywlWu+aHY0Qae7JDZc39udV?=
 =?us-ascii?Q?KwdcfdCQfrplYU3D2tqzWv52GsEaOYc7elMruZs818ahjLB3aFT7EeuUaw15?=
 =?us-ascii?Q?cynzgiomezf6iEprM7jI4G0HSvZPGOOSOx5o62lKj5fN8wvO3+pOqmJOCVBB?=
 =?us-ascii?Q?KhuACQab2rLv4MNvwnrszsX2betgZMi+RPiJLTvocU/Z8VIDsBH2PxqF3fAR?=
 =?us-ascii?Q?Y58qSbhdNs93BSrYCwsCu39dvZ4a96URtrZjPREBb5+QLtVoxHUXRqJw6ZBY?=
 =?us-ascii?Q?xOzs+vaJHrkp+uRgqaVTc+3XGUhknDLtb7txskRyTFZSW5wMKwfcMwWz5iHY?=
 =?us-ascii?Q?0+YMwsSFOZTkqhNJM81l6m1j9i1btGwtAwIAYtW/Cq9aElJoyR+1dEnu5VSB?=
 =?us-ascii?Q?cY5R7EAmXcAhiGA8eviZnjq7BgEgKQDhjAmzVgeeXEzxGd04CYTWL5pEqoEf?=
 =?us-ascii?Q?lWt5CahovVGFnXg3E2rVgcfpBPkbNyfJgNTvKngB2lGfefUT/wz5ur4oRKyQ?=
 =?us-ascii?Q?eLh4rNAH7+TNvC2HG466s6RK71eVZjqzcShR9/6n0xsyYWMcp4tH9QMF5QZB?=
 =?us-ascii?Q?PE7NiAXR/PpAgC+zWVwkrZsVkpg9MtE5DNSbtKME4yIoJOXXrO7R7ytG3dAU?=
 =?us-ascii?Q?dysrMn7AKPemyze3DiA48KFjjwKdILRIzEJnqSnjIshOqGNbKks6XSmlCjG9?=
 =?us-ascii?Q?nD4AMT3KMVFHK6q2p0QoXRcmCRXUwMtj97hjs/mZXJ1pqDF8k1kCIR0o0jIY?=
 =?us-ascii?Q?3bAFw4hytIMfkv2ptX20Flnm9oqJEUCal50l9Er6rYtD0ydFYKwBpuN8psii?=
 =?us-ascii?Q?LLqHOEJTgE7YQg0Bs2d3wbI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97b14c9-464b-415f-395a-08dcc71fe8ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:11:44.1932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lcx24qF5zuu5rgBf6QPn7c/HOJpJtHwE3DlV+W3QjarPgadw9UzZgjGIT9B1JIkY1o/XTjfghDEHl/Q/rcm59QCm947haD9dGF0iXECc9imXbxWWQSkBb8v8Fqmy269m
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
index d99b34dd2d5b4..5d253ca365aca 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -716,6 +716,33 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
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
index d5e9d0ed3145d..83bcdac22169d 100644
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
@@ -75,6 +87,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
 					    struct device_node *ports);
 struct device_node *of_graph_get_next_port(struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -135,6 +149,13 @@ static inline struct device_node *of_graph_get_next_port(
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

