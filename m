Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41128D2909
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561E112A27;
	Tue, 28 May 2024 23:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="l/XPHuaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2040.outbound.protection.outlook.com [40.107.114.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA351126F7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNleaFAMnnJXzU8QGq27CSThZwc5x9apbiz3OnoPFQyTMg6Cl1saIg5+iF5kEv0yo85kCeOoqNLTkv6sZRjI7SGhobJL3HloEnwX7rNMD2UWC8BbC3sDq+FaHZtrhO58djHaSSbFHN4iy2a+ebWlWJdSwGnMg/FLi63vvF3oETInPEdfD0Z9TiJgy7k9/1gtHWCodSeq4ilSHQnf7Ory7FNr9tw4Lf6GIVnywPOP2/nVmsY6ptwVlImSU77UUp9vo134mAbrWIHUO57ax6emcvwYSJ3xsfenpznpMdwBAvYpKb45EUJjk/uRKvD7CfiQv68GUydI3M4mGMrtzy53hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KmrqbIJDPS6nDHWqhAdPaZ8p5YlNa2toW2S6vqQ9os=;
 b=OEjte84m8D2Y311/Nh//t9T5jNKPL4B2i2YYiU5DscY2vKbMBGzcTY0b6XyosyIToyz2pQ43PMOGSxgdfB21iHk4z4kHVdwRUT/NapKFsyvEBR5TZ0YLMyLQEzoRuelgRVvauM0aajE0l0SoBOcTaG0I66HxBmLFiEZFa4E/2wn/sfbfU6pk6V98KO+znIurlIfNYPvKKiLu60s0/8E+Wc2kZkPE3fxPNvQQOa9By/xNNp92IAPVLkKW2u0f8JSQvp44ecybwbNlI/NE0gr66RPIl6EFveGv+aUuqMfGPZGFiDB6AO8HmDIZqj3ahYr2GITm547ljKBjnS3QL53oZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KmrqbIJDPS6nDHWqhAdPaZ8p5YlNa2toW2S6vqQ9os=;
 b=l/XPHuaSScph4ux9r/uMaxk7JOl9SHxgHK5EA3FuDn3Nuqc5UTTmHv+v54OkSky+xzhTiEzpCUBBACywZW0sQjfeCayoJrpMdt1xRZo2R9S1fn1KX1KRviUQqgNBn4U0s+FFFlMp6clv54AJf4G1+Di17AZp2tfjn1eVGjU390Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:55 +0000
Message-ID: <878qzt4hkk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 7/8] video: fbdev: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:55 +0000
X-ClientProxiedBy: TYAPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:404:28::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: 277e3005-0713-4c3d-0e9c-08dc7f71b700
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YkuhznUv43vddSGUBAR59A3h2M4vxQlI0nHOkCP02nvere0kPDBSp3rNSCqw?=
 =?us-ascii?Q?Dc3PQRlO9Qy3yHOAxjK8ouNHUQfYeptl9VAPoImnbU/Gq5eDjpDJalGAB+8c?=
 =?us-ascii?Q?hFzMaaP1ISD5jghTIlEaYBkBe+Ltgaz0auksGYgca2E0KffIObzNposOiODi?=
 =?us-ascii?Q?GIQ9W8HicOv6SjSJkV/uxsLTwLTpfWbBMX5jnWuEAAjCMmBrIxO1N0t26E+g?=
 =?us-ascii?Q?Yo9MWo1b8IFPnYmHOSggGjucGY+TBxQmjBRgz/epBoZOMmApPiEnviRRYpTM?=
 =?us-ascii?Q?D9o8ngVZkuTuxs6CqLWG5YveeP/oG19McA+sCZHJi5t7vwxHycvROxmtgcvQ?=
 =?us-ascii?Q?7i81p1muvT/GrCqdjIc34UwrV9lUMbKNG/ZroEkVIx6a37FZvjJDslgZXJbO?=
 =?us-ascii?Q?uDvYcaBBAaE4eXcGGy9eBYOBHdTqYq5b6aNQK5uEi5gETGxkDtHNzYYbCIsB?=
 =?us-ascii?Q?tRVP0W45Rbtdom6nmjQ/QmTKTDHA0zyAFlxbgDziyWbPoIhJCPKBRmZsF12b?=
 =?us-ascii?Q?xK5nxus4vaBdue6vRTkJ6ameNmjhUIbhH/fnNZ8qRWuz1nUzSxoySpuRVbLS?=
 =?us-ascii?Q?zrEkP38kiaIS60Ij9FiajwizwvWCQlAFtKQDLoId9Igh5mgjTA8l511Ih8wH?=
 =?us-ascii?Q?U5/kcjnn3ywpAXj4xla49KLSto70KOHeovgi+S85VCqVB4+i3K4JbNxkuHfw?=
 =?us-ascii?Q?LXgc3jccbWyJQB1VXt/nk2TEr+2gQXvn0Oo34Y/WFCgtwJGAG4LjzjqJMEro?=
 =?us-ascii?Q?wmin/wSl3wEjdQ8OUd9uBqHruWemYHJZizrRjLu+ICTY5YIwebX6PhdWnVsn?=
 =?us-ascii?Q?5X1AOyd4V7BUsXp+lY39zJRmS++aochX/gSS4BodjU7oHZcTbC/3BY/ex1zi?=
 =?us-ascii?Q?AK/cVfuWrye2SBO7Qz3mPEZrcByWfl1QbVYshiOfqJYEpTaFRoGP0brOhMpN?=
 =?us-ascii?Q?qafGdCzvF5RVx+/32n85T/aMzp8ci9EVgPSEo+/l7nQPRmSKkxmnrictF+LO?=
 =?us-ascii?Q?UD5BIJeYS+c+pxV1QW6cD6pj+RmaY+6og7esQK1AfkaQI1PmkAg02LS2adh7?=
 =?us-ascii?Q?A9I3oEGjLxSNenGJq4C+cIXrqD3q9xnz27FmQVEURogSxbuVPAahcT0YxjNt?=
 =?us-ascii?Q?+MtvKwPSct2St0+FgnCdy+cR+n47i0gD+yVZxLCdyUPn4bUJgJPxebrjfRCK?=
 =?us-ascii?Q?88yFfjqKh42ajpKqRWycYSSo/1OlVrZFNjSAs8e6R6vjNW64bGeKLwQu5lmI?=
 =?us-ascii?Q?OeGS7lWpSzfHWAV93oJOO8/ICRcV7teLyN//2YDlMLpV+P1JKc3sqAq+xTlF?=
 =?us-ascii?Q?ujMQVlG7eFuAcBq1hLNPOIF/GTAYr4eLS1Jd/VdkcH6JjGCTKJfLDYQV82Pm?=
 =?us-ascii?Q?5aAoJoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8w2ql4p7BXF8acoL2nru5mIuPDRxfGqH+rQf7ahtbLaUBBck8KDoGyC7+geH?=
 =?us-ascii?Q?8f9DfDcmMhzg3wwa5S6rsUCvInFBUmRj36cyl7u8I1ccQcFOdxaQ2Wzx2WIA?=
 =?us-ascii?Q?UC6jHq6aHvUacz/9B+pFJP1G05pe4tcvtDfHLlud5vhS/VIqET4gl1tCh286?=
 =?us-ascii?Q?dHbZp0pgOi9fkhuKUg5dre1gB/rXgtJX+EvJU9YDT4oKZfje1LqlWWWUm3k7?=
 =?us-ascii?Q?SpZlU55M3E9by3RucXCq7/n5wpcTGV44Ug8xl+ZLmIfbggnpIArHSccVx4Eq?=
 =?us-ascii?Q?4jAfRTz0gI9EQboatCj2e3CeWx+PL8G2atr59zEQGe2ADsk2GVlpa1vW5XJu?=
 =?us-ascii?Q?UFq3usqItnoy3atHOEx0FozQV8czpQv5iTtYGiHjEFUSvdVAfKzq1ps2RvtJ?=
 =?us-ascii?Q?izSQysS8j8Q7Vx8w+4NdiHoW05mZfPuXRrzfYmM254Fosl7HHe2YvZpu2ykP?=
 =?us-ascii?Q?oPgzBFj2Un10S2mc46HSCteRurQYJ8nSRxFWhlJdkb3t+U9apoMN8S8e8I/V?=
 =?us-ascii?Q?1bUbEbQJ46qG3g2Gd0H4cN2MTR+3FQ9/3/QB3fbUVsZlNkyTtugBVHCSOA17?=
 =?us-ascii?Q?st7Kh8xK5K7EF8ZHFFLOMIYZbO/6yq4hahWbHVNrFdJPX+RQTvxu+WYk87/G?=
 =?us-ascii?Q?PwcxBEA8M/ms6a7BuA+fMte+UVV2nDCptv2dCW3e8RrDSPTRFpLZ/bEA0w+1?=
 =?us-ascii?Q?xTpl/vWVqXI/bepzWjfphCickYZ1hO3DIl+hfpfgE5GRkXKBIzLehRTmmOCT?=
 =?us-ascii?Q?SWGfOtUJTgyFk5oQQ1WgMVVWHv1jjXWbSqL8WO6JUZxqoUbHMQ+XfhKE7iGe?=
 =?us-ascii?Q?lxUWKrKLqKuQzw55USmCVzktp5j8D4u7p/tKYi7F2+cxPqB9eIWiEl+esum8?=
 =?us-ascii?Q?cP/NqtX4sQKavlYvRKNLM6eGTomIsA2/LEZzcfeEZ0K9QbqstW3t3SX2WBgm?=
 =?us-ascii?Q?fo5xDc4wETtkG9zuVvQ0rLC6k1pn1tzHxkNlC68X9vDEy2tnkpFB6GVVQory?=
 =?us-ascii?Q?/trZ6gp0jKmrv+K/8aSE4vqj9710LMMxcyVH960fGhAERm5ieVIhn//ApfMy?=
 =?us-ascii?Q?xZ1bm6iA/kWRI1jXnJgn0yyIUm/Vu6qQ13umM3XY5GXz4cT/1FaGPEhJwtev?=
 =?us-ascii?Q?2CKDJF9S3hO/sefqb7rlqaWM+22EEl/6TD4AzIB4q1BvVgdI6qoRcurpZxQ7?=
 =?us-ascii?Q?AOvqHdhPy1TYiBfcBkGcs2iP1wSZu8ph7nsw2anCGSJO/1IvcD81VDNA18y6?=
 =?us-ascii?Q?hce3ehiog2bKAvE0WtHkBkMPDIKqk37QJ35bSWxefE/Su4Z2xpcaXKatq0sr?=
 =?us-ascii?Q?+a8lqS7+zogbRtYsdTn/rx3omiPN3Bt08sLakxWvR9dUGfPfh81G9VMG0hXQ?=
 =?us-ascii?Q?ySt1fqV/M5ZU8sTEYPxQ6aXyGQV5bR3ejpohIM+4KcP8rA/wNlEEPi7DvAh8?=
 =?us-ascii?Q?pPDiq7PM4anHRjMCs0cz0ORnHaQ8i6esqLc61Y5EjqQekKY3JRYmx6RUXKdk?=
 =?us-ascii?Q?Z5cn8CdJhHUbEwrGSzNnUco/xukZmpa7A0+73aahyRQLbG5WF10OY4BW8vqX?=
 =?us-ascii?Q?DUWQGp3nP/bBpxX8qEvwTCOSHHBgdIoM1rrm3ZotsnfSd58uvIrMr53mgD42?=
 =?us-ascii?Q?D5tWo7+hnVlEazRpKGRcHyk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277e3005-0713-4c3d-0e9c-08dc7f71b700
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:55.8886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQEIQjLk9jKNT87w6xzO3xrV3SNp8xo/d3GU7XZDNBFvRu1j5MfMLU6Vn/DLLI2JoJsB4ed8cuKTbj5ZLpcnKwxfq4s2mKqBC4DGA97jDmXSCgeIblG5OaXS6OT7BNHa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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
index 09f719af0d0c9..d80720c843235 100644
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
2.43.0

