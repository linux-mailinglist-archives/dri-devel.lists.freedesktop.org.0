Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5748D79A4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8910E17A;
	Mon,  3 Jun 2024 01:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="k3Uo79iX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112DE10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgbnN3mfoq8rCy4vib15qO1qualkCKtDO+K149kiXo/SEqLrhAp+jylFvMgaOFbqjz0PcpUb8ynxfSRktYz9ewE3u0bDEHiaFm03DOyAjeU6I7q6oE8GUcTabxFlZ90NW1JnDxF4UpLnqHCkzcNp//HRKsMssCvRRkSEvIt1/MkjUZjVsV1N3a40Ez9O/ABGYrIhJzPdu/ZMA91D6h9QgkBx8P1CP9iIqPGWbqdA/hb243I37Wi1XtbkKiIypCV4tN/SBIJL9Nm1pKlMXd2W7S/miR2ObmVOa82qyVdGMqkn5aHFvutcvfwOAZiOZuRHZMkA40UDEuh67HKNoDk67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJeioO+EW3xq2nPVxpRr6/AxHxgv9TxbDqgwEZtHUFY=;
 b=K9SJ7BzvYL+WBhSqXhWOK3y0C/yyMgCjUyWKH6pqVssdFu7p3w7igOF7gDrvkNup4+3MeAdSFdy/0UfFUDHEpTA7J5COmJS19QKN9AY/dzlHWFWu8rNK/8EzeiV/9lFfHBZcoK3llyPvBb5vmWzpGdOL2nrHy6f0GH60inB5PzFgKez9vyE9oMYycXTFiP2w3IbdLfxQ0xeYjUAG41cxgdpKLI1L9bJtUjkGlwcKNRciNSd4y/VmD80c0PUnJYoTjnVtYm2m5icU917K84b06+QIIyvJy/M3zJJdggb1UnaT8aHSxA+A4fZVzCKlPuLqqpSLBClfAjPeF/roUhovmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJeioO+EW3xq2nPVxpRr6/AxHxgv9TxbDqgwEZtHUFY=;
 b=k3Uo79iXm7zt/RZP2Rt1JXkndCt8FyrCzRns8HPPiJaZGcRcUdLegRG/RkMT1Jg79aF7qo03lNqrUhNaTlAKAEAATMTxaTkB6o5aRXkkic86A9Jvgzyl5Yibyzr5sZCoO5wjEshANWYUVus+pbm8JowdbfTvetQExlY1kfPWI1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11318.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 01:18:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:43 +0000
Message-ID: <87jzj64ydo.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
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
In-Reply-To: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 8/9] video: fbdev: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:43 +0000
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: d075dc8b-e22e-4abe-ce14-08dc836b1c3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EJLnPNGki7MWEi6Skh4daeB5kky+AbsFPq0X3PReTw+x0jimxnSGJorL1Qts?=
 =?us-ascii?Q?Dwkr6D2D+6f790PNeM6hX0JQRclp0P7XW85KwrdYLxtvv28pMrtzsnRjYtI0?=
 =?us-ascii?Q?qoZ3UM9eOJKVERFviJzGtneqgTSFm1Z6cvivNSA9qk5IPGFKBPuhFpK8eGYI?=
 =?us-ascii?Q?HSW2d32+3MrtwJJaJPS4MTeNjC30Z02OAP7R/O0EE+fSsESXzlnt0jbHUjsm?=
 =?us-ascii?Q?43c5XSfXTbxWe85vsFLoiEQ0GKIs7rnsNgT4CxtHBo6w+c6XAwBTRzy+Cqee?=
 =?us-ascii?Q?8dfyhhYJw7JRZ9U4++Yf35Qngy8WD3nFCdx0yvjBZckr5UWImWag9j/RmgL9?=
 =?us-ascii?Q?0UFBXxaxVg4n9FEQZstw1OuMRcR976Qrd1nKP6CFfhwIw0HKp6agzIZXmXtp?=
 =?us-ascii?Q?WtVza57IBnGQcCKN85gw5rmUybOyhB82PsTOmGtaab8Q4oWNj9URqXcrJ4CQ?=
 =?us-ascii?Q?+3/8A+yTODuSOa/Qh+uVip5sLL4cGsXPeU6ruOpWjzBHM7HS/0EIAP5PeCiT?=
 =?us-ascii?Q?KOw40OsYFIEUIGc/uamJviJBrNVGjWsvLEEwfQF5eZ4l2Vu5gydFiBkarTRg?=
 =?us-ascii?Q?UNlJ9xp3A58IYUk0aT++QpVIpx+VNw1G8RhzLdv1BqN3zrCnS+UGFNW4dqwV?=
 =?us-ascii?Q?/tmww2UTRvMMm1hnPU+qDYLfKd8bgdR2K58sjcTigwSqGOpcr4H2TXXjyFNC?=
 =?us-ascii?Q?nEyXEKy8jQaIk6RfRWUWEAYRoQ5v+8RzHR8G4KecrDP1aHwWh6NvY3+2NZa+?=
 =?us-ascii?Q?onqIZya+qj/C75DExjIUXYhdXlZm9MR9xTbitNQjz/wOs1+5huTis/COv6XW?=
 =?us-ascii?Q?LOgisoaYoVydL2Ol7JwvUfOlUNTqK+8HTvwYKpH0cF/QrWVLEKEmZr9dNNAx?=
 =?us-ascii?Q?YsJzlxqXVx0Xadq+iCj5vMu1qQhvUkwQ/zjaLsXQ6i5QiQWe48gK+yYTzPtX?=
 =?us-ascii?Q?y8gsTkm2IM6o3KpzZt3qAwiaiuZCiaDq6cCiRAiNXPDuWa8vAKgrgALywOMv?=
 =?us-ascii?Q?tfUXftfMO57jn/cWaxGqQ7e07bG0DA70kIsfz6pO4aJM7Hq/jniViu478Jmw?=
 =?us-ascii?Q?KlA0Kr9Zq+zwwKL6opMA67vfTBrVAjjkAGkGo4j9zhSqjIbAESKFOsRw2yL2?=
 =?us-ascii?Q?8tuiWydiwpThDZK+d8iao4fTCAGv+zsJ2e9XFRPLO5TSRcNp3l71iInPKiGB?=
 =?us-ascii?Q?swxgHIUBtM+9+l7rqAc6O22kJNZiIP+iGbnNoxaDIZ4s5Q53LeN5pswxx8QX?=
 =?us-ascii?Q?kFfeUATebtL/vB4c3mCFYoZY5ezcTr8CKNpQ60HDfYYhHBRL/90omNFX4y9Z?=
 =?us-ascii?Q?06OidYpQly1Jl7s4vn36BH8CwsKi5yoZPBFXN0noRJwrVs8IJeKcWr5bHiB5?=
 =?us-ascii?Q?eTX9ZDE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYAD/yZEtVC+AsqYsXZaq66WuNIa5WItWXeJuB1ohyttA7CT5354E9p1gcZ9?=
 =?us-ascii?Q?AkAH1vj1o00ptJRuasi2xM3X6fo5SUT8ibWmtpKptbGhkzFDfjEuI3FUidPI?=
 =?us-ascii?Q?uO17NdLiYdIR4hpck779QUIZ/pHjrbTdIYlqPLKNAB5BQoT2EniQt5yDPVtZ?=
 =?us-ascii?Q?keTaSIR9U1XzUWDbv2ypfAi+O8W0IEav+U4Nz6vePwX1G8cRxXKj3R38h/vg?=
 =?us-ascii?Q?Qz7yl8DukvMiLMy4Lo3MrO2px7phNGRwCzX37//myiXyAMcUrU11E6JrvXDg?=
 =?us-ascii?Q?S33ajguT8z9pnCZSBQCgWIePWTcS5U+zEWksUEvNql3dZaYj2ny7r65a5Fwr?=
 =?us-ascii?Q?37Pj1Sf0Ct4C7Bu34gqx7buhQcN+jGslWCAv39VwXJactjgFcNwDlp2Fdh7o?=
 =?us-ascii?Q?qwC467sv9Ly3uUdJaBXuLlYgnEaIbKeBnhc9+KM3Lj2oU0fhar5EPLKV7Y3d?=
 =?us-ascii?Q?bfzPXuipqH/WxBGmIhlj1bA7T2PDNgc1U1e+0GY/9XP6iN3sP0OqBfZIj7R1?=
 =?us-ascii?Q?I474c/qLmKDvHZ7U6SgZGV/Q40zTPi9+WiDtCmsvO2274tNgQvZ+34XRdNfg?=
 =?us-ascii?Q?QWFdDP4UQLtnry314N+mKJh5ypt30T+1H/Pf/Nn+gtvFNOGlfVXVvLJ/SeYF?=
 =?us-ascii?Q?7nk/HweCqFhDUdL5w8WRV1t9XFtWF56szj+dOG4HLNhcEFEP79rveP8adFuU?=
 =?us-ascii?Q?pPWhGDe6V7H9rBRV8LY0e8wSbD5Ay3T+xYqZKYUGlnON+FaPXRyzUSOKHXi7?=
 =?us-ascii?Q?VL6tRooWFYKFyqKAxSmBVmV1NBXaCoR2sAK1EODBIfKfdC946FDYr05awbGJ?=
 =?us-ascii?Q?8lmugBBudVbQ0ukAe+BBSLBeSVPjsbeldyaDbbPy3GbVDTsj6/9glFj4WyjO?=
 =?us-ascii?Q?nD7eKQS90+LjNfFfT3mA5qNW3GoeF+MnT1yGKnzJLgH6/LTV78X35BBMMP+5?=
 =?us-ascii?Q?tEw6lGR4UK3eygpvVmfONEt3wCmPbFi5p5/TQfDNAQvM3qxh55abOTxhCfAf?=
 =?us-ascii?Q?CE4Y+9i0PixUPpvarQgjPA2FUUOnknMadEhQFuUrOgen5m0sJqn1FhBuxbnb?=
 =?us-ascii?Q?7tH/fsKkVyaJWPHVdTnL1eO8y/Kpb36pMBK0KPnwad6m4h7pTSL1FBD8xi6u?=
 =?us-ascii?Q?RrAOVARpSGSCMu8AwjbJRenICVorNoZPknUNlgcEcFQtcOqzQV1rsHum+RD+?=
 =?us-ascii?Q?3PA9nPinMle69SDQJ79pOWgyOCVOOLZVHx7wdYpMwqPoTXZ4TNZZBmhe6WD9?=
 =?us-ascii?Q?UFW59aJ105d0JS63Mt4yeYxPGRH6k0iPJy+2PcJWSkZQ/it5Y7yw+aCn72en?=
 =?us-ascii?Q?uwvvQ520Fa0ZVCVDcVRQhpqdcKxEMsecofldkxGqH1dH9DL0baF6JiO3cCVA?=
 =?us-ascii?Q?Vu5mbTkT9EL1lPeAh4k1YhlJBTutQdhA6Vwt8a8pQdsugqUkwm0duLQeP9xV?=
 =?us-ascii?Q?TCuiOoy4oHFyCtdNDEQbRUEoEyligSY4we+Dow+oLysnNeaA4JuxD4Yy/MJA?=
 =?us-ascii?Q?f2r4tA2/BsGnF/T1pBOvXgqNOaPqXoKSMt2eDUa3ztJS43sowycwKoNMvT+0?=
 =?us-ascii?Q?GRFHUCZFF4MnasUQZi5TLjjjONc4mwAybKmM/mgihNQGDvwxg1JL/9RAqciw?=
 =?us-ascii?Q?jqYPuUC23H8mltOzmw2cxjI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d075dc8b-e22e-4abe-ce14-08dc836b1c3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:43.9242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5h36jsnuDdtjhx5RzWnwlQpbwClWxi1pPR/6KeEXZdWIlkVynMpIVKIHdBKGSo4kEPiuxOw372sov6WMaPovgvGUFs+qJ8f4EpDYZMJutPjIOn6/HyQqLxBBztLjkM1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11318
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

