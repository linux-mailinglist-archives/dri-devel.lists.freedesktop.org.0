Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB594C922
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CB910E850;
	Fri,  9 Aug 2024 04:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Vde10mO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4510E850
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDEsoSkWM6EeQXu2R7v0b52Q3aUMlE5yemlH8gXt+yJuHZrwyH6e65/+Avhl826z/gTIBfR+TL/Ws5zZj/Cz8AAIHClupK4pM9ep/xczIOoKslEUPbpYhFuEDtsr31AnJsFwE2v5PZsBksMiivcM5tnnLkeWmZOzALsVl3XVm5rKWlVmn1JZolsQpcYp2iyFrbJGQKWOD8cjsErL53GziEpg7E9jMXmZh4hYDk2YPVBi8zpxSwmkGeIpd/2RLwY1/pTmEJKiW3D+l2r04BfntbpFdKy52xE/hJ1bbwfHyQEOF9Z/Wh1aXjWAu/UG3vAXXEzrL7hA1daliTeN7KiK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXQQqmUo51ENL/MH4ndFN6momsYZa5Od/gAnQOEoSJ0=;
 b=WezevS9QeuTSY4AHGOG1aGi9BTeoswJnXrzodQSgvqksijq6fNMy4lG/KUlx99SCLpFKlwvco//ztDCz2FCeSIU3xg6xvW8/Hk4zAXXp0cf+irAXWrbCJ1qNrV68pYakPq6fjlKsaTMA/Ceh4fU5RMohYkq5bM+hvkf8sk1ikjTDQ7qruXLOMJlJGpZnGXs6jMb0PHd9tY4iTT7gnNzgJGwPEdi4EPGmX8raY3ugI0d+2GsWvIi7J103aprFTd+bBNyinLW3YxSri2+yGIARsf7EyImFdox2JP8eybXA3pQ54ZrzHoyAsJE0TH+Rc3dTLypS9/1d07KYR9JWweb3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXQQqmUo51ENL/MH4ndFN6momsYZa5Od/gAnQOEoSJ0=;
 b=Vde10mO9qDIm4E3AI1CP0hfg7cA1ESR8lkSqFPtX3Fs5/AYKWiWSUwZMVelQIhyskKBunE5bR+1p/jfR79jWW1yieW3d6u4WdVTO6Hw4Qzunfz6owMtwqENvLQpDTn7PveMbx8FlUioOSVdrObl1pydOhruZX5B5y8SkcsUVKMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9639.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:22:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:22:28 +0000
Message-ID: <8734ne8gvw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/9] of: property: add of_graph_get_next_port_endpoint()
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
Date: Fri, 9 Aug 2024 04:22:27 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cba215-7dd6-461b-2e32-08dcb82ae0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uxpLa0DdYjOGnptlybFHH/hraRbdwgpDST3trQWyV8kzA7nYR5WVpH677jMT?=
 =?us-ascii?Q?xBTInprIL4TtMQsxqreaR4xC8+FctMpmpo8+BPGuWccq7VgZFCy4RLEVY+vX?=
 =?us-ascii?Q?7DQBVGw8Rmu2AdjssYSseUIab5D+QYExiIUKjQOCHpMsQox3O6W+JZ6AE0UA?=
 =?us-ascii?Q?jEfxZjdsOkOS0Kp95aEXUGkRFHo1YS+8osb5eVIy+jp64cE/mOeu5CxwcWob?=
 =?us-ascii?Q?qF31EcBoFq3BX/uIOkNc00fU4/KZHT5hTlP48XKoEm0czcZoGD8X3lIeWZWW?=
 =?us-ascii?Q?/Tg5C0flqhUBNO8v9Jv9PGNjE3AVjKbEGytlVI1fphmgyvv1RKS4mIdAY84K?=
 =?us-ascii?Q?8cKc307OeBE5y+4TPJwJLDemDWsbxaFnDrg1RCBh0qv87giz4HKvT1vrUCGU?=
 =?us-ascii?Q?rwQwkACM4mgAU97Mh3xV/k+kYwcOLNOMeizx4HDG0urQn95KvoPiQesRF3v1?=
 =?us-ascii?Q?NpPCjGFLOigJqU2wTKSgaJQ26oqwDoTfVV3DHvKh+zRIZj+AZLcTonRUfMVO?=
 =?us-ascii?Q?6QroubQqDiuPbQhJtDmCeNJqT9hhag2+ygKPJThr2GwdsgNuCiD67nrDvWwl?=
 =?us-ascii?Q?VJhGkPiYxvf7OTUeQUOGC23Z7GpFl6cMddlI44yWmobdUSyojMTTgn1LCX7u?=
 =?us-ascii?Q?bvlr6ufwW3//FcsaNRvEE3FAwNOb3NM/EYAkpSixUR70jlYb7iIoMXaoJUH3?=
 =?us-ascii?Q?UThgwy9XlcvU0s4u5yOnXzAyvokCizYb1f+d02tUoDXhEdvsCCruVJfMjOYT?=
 =?us-ascii?Q?OAQ01B93006M0bxpAImgjrURzIEUZbs5I4loshq951kVIL/zsi6tMOEvtEhN?=
 =?us-ascii?Q?+EZVex16lsxAP4dK/8jUKDzBvVQBjpaTR6dPifCXIsTFduttNbX/5QZD7JV9?=
 =?us-ascii?Q?cHkO8NGhYbEpK8Wa7c8l9T+cB4s8HN71+McdswSg5Ne08zInFtzq9ZiVpyz1?=
 =?us-ascii?Q?4Say0SHAjAFAyxxTpY2KZFVdi8J+wAS2r3oNqIHkDJVgJTNbqQ59L/0AQy5I?=
 =?us-ascii?Q?P3fOv4zm3uUBD2Y7d3F7p6SJwraCxQT2/IwIeQqNOPAXJXjKJbyeRtJC1JrJ?=
 =?us-ascii?Q?nSMzvjlVfI17QedrUjFM71PIKVdimsrqYKkXtuWXbsEWEy1QWdKEc0B5duXZ?=
 =?us-ascii?Q?U3sEckepTPYKdVyLRl+/pbDPRhrwG3ntb58hnBpVv/bHRpZQWtmFHrkQQ5gZ?=
 =?us-ascii?Q?2rWgBu/D/XDp55x0I2daMJHRJsVepNpSzFkmdTVagrzzFmK6tJPU09IW0ZyD?=
 =?us-ascii?Q?5kYKjfEbMmAyzjB7LD80Gl2COcMKSQNKgCQM71rbXIXIIxvLf/dr2sosNa8N?=
 =?us-ascii?Q?Nbthl/SZmZ8n6FuZq/Fj5QLf40j7Ibdt/KJ6GHezZ/vVfGR+cFTFCVniE/UE?=
 =?us-ascii?Q?7IFvNY2zojkwAj5tP21p2u9gHytzCviHjAhFDr4/ihDrnALpXpngTD5nlILk?=
 =?us-ascii?Q?wzbVnphr6pg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5nL6jOSJo9tbLnkhLuD9oPfB/sXeEFR18q7g+NamYP2VMmh/BH0XC7va3SS?=
 =?us-ascii?Q?tM3NYYEmsN7lODisA4mHNI4VPfM/f1B0ixUv3h+BgaNS0ip4XW5c70WN74v4?=
 =?us-ascii?Q?gfeQrSlMZgTvwBTqfBUFF7MOH5bC+JmmSkoDpFB0Qq59qszTw2EllG+872sx?=
 =?us-ascii?Q?X7TojswEQfWdJcF9xTWix3fNFZXpNqW+dxj6UuL/RJj6HUEz0jN+1VuQH/oy?=
 =?us-ascii?Q?5DodxAwySxdHBoz3f5DeIMWfPcLr4ahEw09RMaozkXTDlsqMFjyxsUPsr9XC?=
 =?us-ascii?Q?B8x9EBvg5zMjE1gk0BmQ9t3KOe0tiFjfebk3fiPa2bqSQEmDyTy1jPL4Y6Vi?=
 =?us-ascii?Q?43iEy3feUYujweK/QdqRYWTgf2jj2R+cSdfjZE2ginxEDwUU4StIZKr5kt36?=
 =?us-ascii?Q?zaJmqCpoM4R/41CJcI/uqwE6o2fpIihf1GrRomSbHNOM8VYfmq/Dg5og7TIa?=
 =?us-ascii?Q?6E98E3ZC40gjLM+91FXhMYizXBxmRlzf/24In29MInacBw+R4bXYzisCXDRG?=
 =?us-ascii?Q?9g2lUZbHY4x665ppYeqUzKVku1xA/sm39OTAYLKkTKlwNJ4sY18FZEtaYH9t?=
 =?us-ascii?Q?eF/nq4Xkkso26/+DUrQkgFG0Qy1JTTdCNhPCcruJWaOBqjYmX2DOtO6DlNWd?=
 =?us-ascii?Q?JCTFKhfnQjAnHtm6Ddx7KNxTQGROC6eoL0sy9/dA2SOwNRHVgY80++s5xn6r?=
 =?us-ascii?Q?B2CyLD/vAUxf3dqj4lXpCW1mcgS+xbAiU/PtJwmxow1LGytdZgxbAbj3GWzC?=
 =?us-ascii?Q?eNzc6ISvPTjKMn/QTWn8PXM5O3A5bSiPuK7KorP+i4WHU9GofwxWgFujFK9r?=
 =?us-ascii?Q?AJdeI+gEu2hqmhoRTzb7+dyqDfS0/Nai9UCA7yhGeDMQg/aTyfjfG04quC3O?=
 =?us-ascii?Q?TYhJJDWLClP7U3wCe7lHzLMb6z5pmBbwagKBikyzlNG9ItpV0XR+rzJAbWko?=
 =?us-ascii?Q?f3wtT9G0aXNVH3HFugdsot1f8T5FZM4NxjJQeZwa7hLElK6l8hRcY2xMpR3Q?=
 =?us-ascii?Q?ovZVvBLv4ZU+jDBWTEW6WdMVwZE2ps2Sr6r+OI1P5+4okzUIWYj9aH6f/dtq?=
 =?us-ascii?Q?pW5m7Ky88R/O9jWIdrtYiitw/LNKvVg23hjwjA2FU+MdD+5asexWj5H7Dv4v?=
 =?us-ascii?Q?kankOdqTU6P8H+6ijAMOITVFAiypl7pLWDChIILKBu1/GJq1EtXJATveNCcN?=
 =?us-ascii?Q?4lSZiIOhBittipOYo5NMjO7GB669fOLnIHmsH8AoZ9hurGlwKoO9j8cnc0O1?=
 =?us-ascii?Q?gVwNca//TDCtJADkDAivNwktoORLdgRpyt/lSkJzstOiMQ+VCvHK2b2e1Ub2?=
 =?us-ascii?Q?dYTYpvht6XeWoKJeoXjrUHWW4TqPVcZX4AjoyUSkn7A9bgrm2wjjRAcw8Cnz?=
 =?us-ascii?Q?1DU7ah0QxqzBlWIwGvFGqmOL7Pa+p5ww8rnTt8gePtHn+kUgrwTytG3DtW9S?=
 =?us-ascii?Q?ujDk9lP2Vmu3qF3hwDwXxeQZ4NzWiamho5zDRFMSpDNPr69WcHElnEeGRPuE?=
 =?us-ascii?Q?qoMCT6JUoEMBjBAjZV6LFW8S3blRWJBLAoENusJdtj3LmDOb9smY5lQRbouJ?=
 =?us-ascii?Q?eq99Z3Pj0f64M/6OXhYZsyeeOsIKqZC/lC8Hrbu8RvEjm2RWkY3RO9LqUb62?=
 =?us-ascii?Q?H8LRRCEfSfedrJfj8oqDKm4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cba215-7dd6-461b-2e32-08dcb82ae0e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:22:28.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbjS2+x0pO6KD/s+viEUWso2XAtgCFfIUHu97ORmGfpTmSc8IM1m71k7cV8mA7SuCLyn++IY0xWrOPy0se3go4JbRV1/ugTk7kmhF+xvqndc0Ajtqy1pTklQoZKlUvui
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

We already have of_graph_get_next_endpoint(), but it is not
intuitive to use.

(X)	node {
(Y)		ports {
			port@0 { endpoint { remote-endpoint = ...; };};
(A1)			port@1 { endpoint { remote-endpoint = ...; };
(A2)				 endpoint { remote-endpoint = ...; };};
(B)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= A1, A2),
I want to use like below

	A1 = of_graph_get_next_endpoint(port1, NULL);
	A2 = of_graph_get_next_endpoint(port1, A1);

But 1st one will be error, because of_graph_get_next_endpoint()
requested "parent" means "node" (X) or "ports" (Y), not "port".
Below are OK

	/* These will be node/ports/port@0/endpoint */
	of_graph_get_next_endpoint(node,  NULL);
	of_graph_get_next_endpoint(ports, NULL);

In other words, we can't handle A1/A2 directly via
of_graph_get_next_endpoint() so far.

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get A1 pointer for some way, and if I want to
handle port@1 things, I would like use it like below

	/*
	 * "ep" is now A1, and handle port1 things here,
	 * but we don't know how many endpoints port1 has.
	 *
	 * Because "ep" is non NULL, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (ep = of_graph_get_next_endpoint(port1, ep))

But it also not worked as I expected.
I expect it will be A1 -> A2 -> NULL,
but      it will be A1 -> A2 -> B,    because
of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".

It is not useful on generic driver like Generic Sound Card.
It uses of_get_next_child() instead for now, but it is not intuitive.
And it doesn't check node name (= "endpoint").

To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()

	of_graph_get_next_port_endpoint(port1, NULL); // A1
	of_graph_get_next_port_endpoint(port1, A1);   // A2
	of_graph_get_next_port_endpoint(port1, A2);   // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 22 ++++++++++++++++++++++
 include/linux/of_graph.h | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index e4d5dfe70104..dace154baaab 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -695,6 +695,28 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
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
index a6b91577700a..967ee14a1ff3 100644
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

