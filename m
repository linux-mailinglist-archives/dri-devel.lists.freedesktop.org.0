Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A118F8889E1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA22410E527;
	Mon, 25 Mar 2024 03:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="AkIpBsKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2065.outbound.protection.outlook.com [40.107.113.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2378A10E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTQAPD30C+r8qaxXDOced2O7OR9DG/Ct07/7Lo7Ajh/6f/W7kRfjBWYg+xHQ1LVv0pJF5LKvxgKJMCmD66BD1Pj1Jot3k5zLyUoavm7ootNLGmww1jvjFzHKPIdKBUZiOuvVx3cbal5RnOaPouLb+G3fy8Sd6qv6YmjA2LvjV8HWZJmRSAsFFMWswDy0c5qgjXQ7vPAIEGTsXBcvnptoZIMwhOFB4QqGKaFRn9oB69Koy2fxVuBHJeSLKu2hXEHd0oAVaFelW/r6EljzFbjPOy1VvTNw9lxT/QzDmZHLBla4di2WJ8Q1W1Z7bAduvHYO+6vlv+zgWZgnOWz6vcJgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4brAv8IRjvQv8+uHm6V2KjfYIs6aEml9p7JOjKUA4M=;
 b=Fc9qyfplWLpqzzQaHkQ2HwBWSFNhoCVzi78RMeDlie7k1ydgRnb3EHd8dHzOCMnAVKAspUdq+3Pn2S1pvbg83EWZX1lUt4CV/rsT0ch+5RRStcrs4Chm/XjA4/zU7BRunF3IGUpq4mnrOVQdufKIQy/UBIRSkcclVcvnU7AbcfYMFt80Kbeifmtjq/cPUWNJJWDHVpbVZaDKfE8XvFSpRj009QUdczC+DFt8a4QNXZijTC5+ae/c8etUY9gQVq53bGmK1w0/zkrKG59NFSiw1Ow2QhmXJcMtTT9MVvR/7m9nztQUH3cV7wzTDMaqf9jR1+206I1Xo3yHh1+Gx9Go3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4brAv8IRjvQv8+uHm6V2KjfYIs6aEml9p7JOjKUA4M=;
 b=AkIpBsKKTH6Xjtbuhb1tSxUJXvtdVQ20loUE23iKR+EJp5FclANqgTCwS0MGnoNJ4rxQVenQ50VdtRhSPunx11OiVm1RTyfxg2DObyMxtRk9YLJJbEQyW20lT3VMx2DSIvNezkopZHkv4bd39Y+7d4tz+lVCJzkarjQsU2hQhF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:44 +0000
Message-ID: <87sf0f57uf.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/8] video: fbdev: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:44 +0000
X-ClientProxiedBy: TYCP286CA0233.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: cf577584-d288-4c5c-f1d8-08dc4c787664
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5YFGJeTZlH4mT448bs6m7oKnt4L/ruVgPmcp9H2nO47RW6GrIAKNC2p8q3s2/MV5kMtJPASfu/V3oaiN2EWcGSE79+IOernueeRqJZ/AFp5a7ak1zZ+rW6prW7O/8Oa8C14sI4OIhrtw1mUZb5c/K1YEjPZMud7iCvlHcs5i3t4RUjsBZQiBgGnbnrIRQlHoKmvCUDxWEMOjzruxNRYNsCc07jXfoNJ+KAglozoKEyF/dA8dk3nHrAnL+mIYhcTHpMxApq+W7xbB7M8ba0FtidXo6t8Uhe7vJwmRxtg4wPOQPFBhJO2lGfpbTUxJtIJVXwklczjSqnZBIdcOiaxdO/DVjBonJGizgPaMML3xOfuodTe48rE+UNh8VHFF0MEQ9NNNN7xb6ZdDqNx10FnGHB9WnxE4Fa+fxzK6UosbiC7g6phbaGtk/akwEpe/PJrvYNfrsx/Xstj+oEWgfU/+6FrxsBWWh64cCVzHtHpzwBsvRp/D3qE1K+7Y/Bf+jkQsO5QzX+fuu5HXX2WTsDr1Fm7NKDW/VzMM0a21czEcUCE83BERk8txXe5VmQ5CmDAv3gSUIFAcLQA0QM9Z40nIbkcdmifPuRyhGaGwrpXOP/AwQd+TXx2cpv4iu9kMB/LkDh/VNl3A59p9X86oFvR4KSxYHpEFq5oJhKdVAd8RCeIlmVnGxLq8RnWyUjepqX6BDL5VUlVQINKPP6bQf6ZcGmabEsjafbREn+wq3yPwmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1oM1evRrF+JAr/jEGF0uKw2KJCuA54Iesw+yJuFw07lcY0hVkBxdqWITiDbn?=
 =?us-ascii?Q?TVFEHyfPbIKiodHpgJW+XgSvCF02vSFtyJhHcNTSKCqkvMTIQ+CyzqOwqzsR?=
 =?us-ascii?Q?y0J3D684WFjcIfRpw9RrgjiyK4gaENZlXuUDvPtBZyb7d6/lvAlJRhdfihkT?=
 =?us-ascii?Q?xxEmQucprGUFdL7gY0dKt3U1/5pJLzR8fEPbPKivg0APUaXwKkOyLGhB4UrK?=
 =?us-ascii?Q?dXL1+J3un+xS4nz93DrNAuFBNWYWquTriBTbtSOYOKH19zkjxX8MaN9eWmmt?=
 =?us-ascii?Q?pk66jrGF0RQVBAx8J7CPxjVuWeiUqFRjG4cFS5RXIvEEKlk6wMClixfYByyl?=
 =?us-ascii?Q?55Oiko39GIzFujzp5P85B3y2FhgFeNtCt7txnoPDWgHfP5neXWpqj7qAYao6?=
 =?us-ascii?Q?vhL/IsMYA0ykx8GxybW0LvacCVppmO3jcK83VDQAIJ83Y4B2v+lpSXBwQrd4?=
 =?us-ascii?Q?T8FJXZaTmqaxpwtsVZgTXLwEbIuzzk4hPWfvelfqSjtp53jCRBu3zMA43irL?=
 =?us-ascii?Q?zLH42xZAFW93J9rWhO4Opd4s+JZHO9/+VeHXk6H+lIhuhz8ywAFQ8inTCf3v?=
 =?us-ascii?Q?CUyIlvf3FSVbkVywoF0PoNcW3lOwluGjIgBdvuyiYMvi/oa9PvkGtjLEQnvx?=
 =?us-ascii?Q?OO1gbByNFADpJbqJh1vLFntBVV7a1N0JmhS7mbLzcmJAgEjwCJHxAlNhr1A7?=
 =?us-ascii?Q?6oofh8vaYglDA/QTXvrfdDg/XJKxD5PpTVdUEPGH9C8ZyqVrzmZUos6Ylg9q?=
 =?us-ascii?Q?sklwrRs6KGhvt4pXHkCbNsaq5fKohpX5vpYdeGtJuydnSWMwzYiEiTQEkKm0?=
 =?us-ascii?Q?LTtATTSWfFRH1RLJpXjyJyZeL4Xn5k+OMk8YDa8BhpIxHras1JzB1Hkaol8s?=
 =?us-ascii?Q?h/eiVjvhRHR8r/bw31vEFl89AS1fqhLyVytQWDSahOy+6jglNBWSukYTO1UD?=
 =?us-ascii?Q?k7M5bl4WCXC10puTydJDY1OQeGyQi9V/O4Vl+HBbXHyTNDIWUvWCYk42SUbp?=
 =?us-ascii?Q?th4vfmDbVYfXH9J9A3Miy1YD0I5JvW933YWTs6eSNY5heKnU+AlRm/+GuNgh?=
 =?us-ascii?Q?vdWeIdIhBRDZMWKpfoSg5PnYVq4arJl/b/jt3ktXnCGFlwjWySiRkMSG/WHj?=
 =?us-ascii?Q?i8C2yv5o5aqg+mbtmsn38BWI+YMx3TTQsKHWU4Jy2/YX+c98CxnF1tCstL70?=
 =?us-ascii?Q?toiEaSOibic5atZQ+jOyvAaR5zyVjZ4yHHEZD3gOeIyrzZ6VIA07gWPZ3fbw?=
 =?us-ascii?Q?DKdZdV0aLMkJvbIcFKi9yVJTQ47O0dIiPCstLC104QtDabjg4oEpb6vTUy/Z?=
 =?us-ascii?Q?4vwZSuzSXdW8FIm2lavmIotpm7EToxHZnYaaGn2IFfRtI2ZEYdZY/LBy0gt9?=
 =?us-ascii?Q?W/E8Ffu5uDypeyJqKbWJge432RXn5GsNc0UCxMilLiivOebH6IFjy/dfxuQ2?=
 =?us-ascii?Q?LXvL9LupScXu0daQryxOg7TKlAlHmuEXgOijV8mIly2tlTIW0htB7RMItrBf?=
 =?us-ascii?Q?zaBt8882Ty49l2CyVfm4AyclRoR5s31oTjqf6yvkaHx+mOiJ9ibKyOKy8ziU?=
 =?us-ascii?Q?oUJMyKZASlQkMz4kpELoEqZ/b/oBZFh9js4fIatWE+ut+P3oTVsOIpgwQyZ2?=
 =?us-ascii?Q?mwPt0dAz8yzA0PO2/+A4qNI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf577584-d288-4c5c-f1d8-08dc4c787664
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:44.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVdR0pbAjh1MsJIcNrdMOtYM2SUiH+ROFYc9xHeqoib/Gyi/bu41uj335IJ7gBbOP6my21gyarXB6AMcz4jB//mmk1N7UPorfZUiSu4miav2cRKIhJLAXQXsQrn/nmnU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 09f719af0d0c..d80720c84323 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -149,8 +149,7 @@ static void __init omapdss_walk_device(struct device_node *node, bool root)
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn;
 
 		pn = of_graph_get_remote_port_parent(n);
-- 
2.25.1

