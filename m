Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8B986A1F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A275210EA7D;
	Thu, 26 Sep 2024 00:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="SKPPIrg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359110EA7F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:01:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We4fH0NaDwx+JLYbzLnRL2KvBrJJrHWIMg0piBwz/cxfBN2HDxRyMbNrEnx60vf7fYtkwjlagdzTzc9wvbb3ZPQ6JW6gQmomUaUobCQMWi57VSn9d/QoFDgtImD9MCWBvNbudkkR1i42IgASckeL9bPuvVj2xaPRXLGuumPwH+Y5xtJ/NMzsWnisSs4/tba+ZD1pA+xIiW4/BA0G8tOTOKjRV018UpU/D/Mg6fdbSDlDh1Obd9BKHIy/Cn/nY0YAqu4yNPvbM+Z82aMgV4rsQx5ouLln2eUBRtc86dKEtTtJRtCHAQ3YLqFlsmwyKAf91pIG6rH1wn0hvmM+Gsxvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHgw6GC5axbivs2dQKRUpOp7ZjZ23MoMVhFLEtfLidc=;
 b=ZZO/wnDMYb7gYWFL96MVSAQvM7YwWuva/HM4VSitNq7A823iSqNA5Iia53I+Ftgzmg9MaH1Cqw5WSYwNOAmUOOMze/zpf8vBxZP97LbUEJqDt9V0glppLbQUFQw4MrtypyKG9DOA76dtQu7kp6RSUYFTokXU0LeVi+s9D20uAhTUurY9TENgkoSo6WXzZJZzQIzKEgc3orkYQAsiEP88nGpPIVFtxQdEODkRTKkflDwrK9RFwAFrwPycw+MkeSzyD9p0TWzhmZ4OJBXWVEWjFFaSAxdX66fEu+M6lRic8J1qOCkG6fOV7hHsPZVKrrkvKZy0fhHoUdiWThYlMua9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHgw6GC5axbivs2dQKRUpOp7ZjZ23MoMVhFLEtfLidc=;
 b=SKPPIrg/7nIKr4rXPtuyfC+VMnej6Nr9MiEYSdlOtY6LK2NUPE3LhmCKCYBtacG754AFfuIJlwVnKQ+893Hp4j2CWkI5lds3uXPABkKX3P9BRiyoHrux2OsttjsPbEpoFxKfxDdnwGk4XfyGpsDwIHksXDoWPgx0/gfi8HLMt1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:00:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:57 +0000
Message-ID: <87v7yj8err.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 8/9] fbdev: omapfb: use new of_graph functions
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
Date: Thu, 26 Sep 2024 00:00:56 +0000
X-ClientProxiedBy: TYWP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 413bf290-18e0-4108-9ee7-08dcddbe4c22
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H4q1AeKSsf7tsqQlojcq/ps3XqvTFzJh8PgO9qYlQFg2qD7aSmWBNBfGKB7R?=
 =?us-ascii?Q?Q3N/Wxcic5afepLKxkFm9eIs97XvVdqPvwJ3Sr1Eoter8p5wIeWPjp0Pm8wE?=
 =?us-ascii?Q?acmbd5JAwP7+/jlHhOihU0OroArojWQHWk6Inf3M9Zk28TeWqoeZsxrrdsul?=
 =?us-ascii?Q?DL0YxxfUuaQc96UMCC89hUm9HwYYAGT5RQq6JjktnEUnTdnzuoOxIwclyUHW?=
 =?us-ascii?Q?QJyXFN1xzeejcZTQRjZYv9UKkDgo+hbQDtRE7Szd+a0CFOKrxXC831mMxmEC?=
 =?us-ascii?Q?99ZICYPZKmq4+eyxksAtV0vOoIk4Shb8Lc13wWRmwkakFzvpBTwe0hKs5Ffq?=
 =?us-ascii?Q?sjqGPilxJkoqV2+bp5aXHwy5TTYr8eLfR8310Izq2Yna5l8XMa9qd+p/xxz3?=
 =?us-ascii?Q?icI/3QncacYHFrMk7k4mO3zXoEfiR9urj9IOBKZQTaRUp5yy4Wos9nnEW7f5?=
 =?us-ascii?Q?FUSrBX5Wly/4qcIPVPrHPV8l65CC+LYUtGyLsPR+4Runlu+2OsVBQmE3BBbZ?=
 =?us-ascii?Q?9P/ZTmF6ztQ4M3MGSVM+WiIBZInuVZThGKNq3Do40HdFsFXT/Y/1nALKiwaV?=
 =?us-ascii?Q?alzB0On7KfXwpZx6XSrdbWjCc8pmMJP914A9hAr6WKfwlLV26us9izPuEzDW?=
 =?us-ascii?Q?/BO6OKsjjiJFxfWHhIwOj+ipv1SbElExzA992a8KZ9rhMQx+SZfNZAF4RNea?=
 =?us-ascii?Q?JqEwh1t9BUHDLQFLjd5TZ+3rVczmCCGzMa+jqRLFDdkvSs3B1MADfI9zZupT?=
 =?us-ascii?Q?7mIeYxydmA14gDJWiZLYMQOFhZDCKfcyrY/dW+pZju6eysr9lTXSUeB3/M5G?=
 =?us-ascii?Q?Epw6+H9B1ZDrtGq/VUZO0wotfwBRiFW1WOPSxcxprZaOi6vux776G45RhRm2?=
 =?us-ascii?Q?vQ4cph30sIBkg9ERuyeC6cba9xHUG+52XPCHkhuhQ2KraS8OimIgA8V5Gmxx?=
 =?us-ascii?Q?qczh3lI+sL3FqpLfHQI0AOWh/zSYO3FmMoHADxhZ4InDxv0Vxi8qL2ev+UZ0?=
 =?us-ascii?Q?O1vuqDxfd9IskocAChr59Kf7R0sifGcfdVs0aPgSdOfIJ9JbW15mVIp+TkjW?=
 =?us-ascii?Q?GDTQUjLb8SoD7mAGYrzbiZW1ecGhH4379RxYsNSt71mBumZgwCOFbh8YLP3f?=
 =?us-ascii?Q?ADHdGVRxIPx84QSPtP+KqMDBhvoPbhVzpbIrh2uJniYsRN5ciivvQ4WlNiNs?=
 =?us-ascii?Q?olnCi0Zf9Ml7XpUJfvdMYLwSWDqurvdXb7LtrMenxQVbBYMjNVfdTH+joCYw?=
 =?us-ascii?Q?MbVuP0Ki6voqTo6ApDebUJkSYv8q8ZtwP62RN2HcBuQgWV27FXBqa1qIu8Uo?=
 =?us-ascii?Q?LnzPXmUJEtpykQ93eZAuD2lOWgXsuIKwJWSvSMGnLm5UePmZW0L7nY7D9Avi?=
 =?us-ascii?Q?IrCN1bsxfZId5w/XrPxbMrBcLVGagODtZj3g/D+Gyt9xsCK5MHxidam6S/Gl?=
 =?us-ascii?Q?Kwwu63I+EyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5hwo+WpRS7mDP1AUBPIP3SEM0ADBEqBzD+hD5dMfvULK2mSsgCjft3KBr319?=
 =?us-ascii?Q?xh1kxS7CWbdGPDp3Ut72M8zfb+L72scH8xjFo5f0DJ1ppISNYTvVVkZIoWJE?=
 =?us-ascii?Q?4ZX0frzapnFqNPqoHGbQBY+yp2L3xfXomjdYyXZxnaWJdMRcra1ZjQfTRi5B?=
 =?us-ascii?Q?8jn3w00rnf5TgsD8snrM+bEFrBIeLmsa49S+7D8/9u6ccaPHRriQ+xTDeA+h?=
 =?us-ascii?Q?un7HzeUTsPHZ82zVlk1vPIhqM8UVPn7d1NDZuOO2SstcxvHpUBZpky+8euGu?=
 =?us-ascii?Q?LHeqwqBMkb4i0uTfgT8XsITbrCtTqlRiDeN15PB5OgP6SgWkML7o5uIV5FnG?=
 =?us-ascii?Q?FlxjyhQ/Nf110XRlXrcC//gyMSekBAADFZgR+kvBDTPlc3TCW9bRHCbxngex?=
 =?us-ascii?Q?YGJBgs9KC41QVFVWUzN274hC0j4nrvizYlg6XwSYbNE9WWxhZbwz3o9YcOQT?=
 =?us-ascii?Q?hRjZ5ed48F8gXQDDyJLgolMyuI4OneK4Q3Qevnelp0KVFuwKCaGOyXzqR71L?=
 =?us-ascii?Q?S+63XAOocV+9b3YwRcKHIC0hCi64iUNzb3o1LRKX65r6R+9ZaMuz4C3Ts7rM?=
 =?us-ascii?Q?6mehJOTyq0mJKTKKEkfZ175J8PhjwUeSpaLPBuAL2GQeUlDJLSMyrlb5lKkE?=
 =?us-ascii?Q?m7AQWdRX0qi6Yt6mW3xTT/MGGlezEAhrfibeGvI84ZAv31vhkEHgk2qniRTz?=
 =?us-ascii?Q?XgLPUifDFPGA1kDxhu0734YouPq8IYWO9F+cyxboFFK6hNv3pNpwLdXnng13?=
 =?us-ascii?Q?jj5T5Z7NkgyOOWVrQKKZfKpihj2nanlnFRymovF0fDpXHVPZ/Le/UeaiEGcC?=
 =?us-ascii?Q?sd5X2OKFOWTdVaVG8MKqECH20Ut2GRDo6DhByCr0wAfZljyL0ITx31FZALrS?=
 =?us-ascii?Q?0UjNwWqv8OKQkEkrGdHxImGx/A8kQHuj08sVz1btYVSRxQdWowpAh+Juy02p?=
 =?us-ascii?Q?vO5BGH4k5OkVhZdbK9N3WODEGESO4lteK5BdI7oHUSpOmgiNPe0G1mkVdW74?=
 =?us-ascii?Q?6Vo/e9H+7e2CYW2IWugBGxRzBXAR8UOOs5llH7nlPDWtwHCxLZeewbgHMzDD?=
 =?us-ascii?Q?b1z+AvYVkC2OkWd4Ed2W7NHHFqFiRrMLAONQpD0b+iLNrHmDKgp8O59455A2?=
 =?us-ascii?Q?VAbxEZfsieszaWnPcKWb0AGqAASwtH/pKcfxI9P0VsF3NQ5glsFx9/iLv6hA?=
 =?us-ascii?Q?xQI3fHsYYgAi4M6vYzTzG6b9uV3CAwx0AlQlUVXjFBxUVd0XBNLJhG08dSyR?=
 =?us-ascii?Q?rBECWiktJ6l4TMZVZHXNkFB3B5MZMbiU9xkOIk8wsuqCLLfOCsfrVw9A3MrF?=
 =?us-ascii?Q?KYoEu8HSJQiUAkCwIP0T20LWpj8wVE3znnPJS2XS4dGPpN1IRwRuJcJ4RKDA?=
 =?us-ascii?Q?OtgKmao4jIMc9rCD77jtdZVkFlLFL/xwRJjECwNPuld+NJoU27DGdjcKSqqy?=
 =?us-ascii?Q?58KA7Ib0917WkRH+jDjhc2qo/D7d+JS3Gny6rki5+NW0z2t+S3auMHX4ctBP?=
 =?us-ascii?Q?+LbLfbjFhVUmDWrgotcIt+60dr/ZllQnpP8NPXXhQqugpK4X5R65Mf0TF0Ro?=
 =?us-ascii?Q?ka0hEz3F4KOOdi/z8WjLi2Dq7QbRp2JBsQoYEE2VUvYVcAxu6OzDI4Ic779D?=
 =?us-ascii?Q?Ql1jlIfSBRic8p8XhTPu47M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413bf290-18e0-4108-9ee7-08dcddbe4c22
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:57.2412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy/faLtCqcMCtZpeqWHLQUPdd2ZCVrUBQd7rTSMCDUSUmEh2LRtWWY93PoTxCRcgSp/+97httCxsZ+jNEetToo+qB/fT10/n4VpwjPQvVKzax3Rfi5dAZpVJGBkSIuI/
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    | 20 +++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
 include/video/omapfb_dss.h                    |  8 ---
 5 files changed, 13 insertions(+), 87 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389aa..395b1139a5ae7 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 
@@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 4040e247e026e..efb7d2e4ce85d 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,72 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev)
-{
-	struct device_node *port = NULL;
-
-	if (!parent)
-		return NULL;
-
-	if (!prev) {
-		struct device_node *ports;
-		/*
-		 * It's the first call, we have to find a port subnode
-		 * within this node or within an optional 'ports' node.
-		 */
-		ports = of_get_child_by_name(parent, "ports");
-		if (ports)
-			parent = ports;
-
-		port = of_get_child_by_name(parent, "port");
-
-		/* release the 'ports' node */
-		of_node_put(ports);
-	} else {
-		struct device_node *ports;
-
-		ports = of_get_parent(prev);
-		if (!ports)
-			return NULL;
-
-		do {
-			port = of_get_next_child(ports, prev);
-			if (!port) {
-				of_node_put(ports);
-				return NULL;
-			}
-			prev = port;
-		} while (!of_node_name_eq(port, "port"));
-
-		of_node_put(ports);
-	}
-
-	return port;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (!of_node_name_eq(ep, "endpoint"));
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index d814e4baa4b33..70bb35ef48b5b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 #include <linux/component.h>
@@ -919,10 +920,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	struct device_node *port;
 	int r, ret = 0;
 
-	if (parent == NULL)
-		return 0;
-
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -952,8 +950,9 @@ static int dss_init_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+
+		port = of_graph_get_next_port(parent, port);
+	} while (!ret && port);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -966,10 +965,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
 
-	if (parent == NULL)
-		return;
-
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +996,9 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+
+		port = of_graph_get_next_port(parent, port);
+	} while (port);
 }
 
 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b165..22a6243d7abfb 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -405,7 +406,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index a8c0c3eeeb5ba..d133190e31438 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,14 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
-- 
2.43.0

