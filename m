Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1195E6C3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233D610E086;
	Mon, 26 Aug 2024 02:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="CgnP5OKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A3B10E086
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLpQIJjabtHwpE2jlKeGsz0ahQecSyvh4dMpIyogUEt+NojRrimzllNKwLlyxC3lriEq5v3HNrod6pahJoxomWeBVQpROse3TeCVzZ+6/+6B4ntawHYtPOMWO1F6gnSasFSjQyM2UxukNh0jXHEQ/blzmg0KGyizy3FYVEVca9eheTIlPylyF3t2y8nhO0zGUeMpLyVbUqfBi+Z3Zt0WjWOGlTyVy6IpzXTYQJ6YTHU03n+Mg+7EUZTcKxUob52r8d001lnm+IAWvVTK6z6juiv1sBI+3dzy65+yu6cimwp7GvtPEJLiDNcDCZTlLU12opczT58NwFKVv6Ynh6XU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ/ew77jr2hYtKOiRjmmJMQ+IWwgAH7M8AI4tJnqpo8=;
 b=cGIhoE80vrS7PVdm6gpkBjDXvsbwE4G2LtQr0a6nFt25Ox+pKCS7uzpIfCKXX62vA6qyID2ih7OcY5Gm5izrgkYRnbCTTJi0wLfRx5nGvl9RApQdrpFBuHBsOHiwvR1eKr0MmCTAlDKR5waxTKYHC73KK29ijaEfDcYAuTqaSF3lMI3jIP2ufIorX2bodqmRD73FaJZtKkDE25CzTJ0uscfib3QylfqDmo6j7eBWzdYWgPKOwflxZ8m3Z2dc079twJuPGY/587hLD6Rd7sXyt+hPsJM4L1R9sNxGaWf5vnaDvN4Y7gq3m+FvbcwY+ihq+9ZUlsXeZEiUhMQsSVhyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ/ew77jr2hYtKOiRjmmJMQ+IWwgAH7M8AI4tJnqpo8=;
 b=CgnP5OKRKJaiIFRQGctwx2b7B2uD+QRA/LOON7zlEcMmztFjHeRmGvbhsMJTjPK36EHricPyL/rXgbw7aq8XIyljUr2PLuZMcPO+MnXaf6CSmU/8oG0DLELGmKq/ftIoLGBpbBiUstAsrb0FS3UShU/WD4w0fqFP/232rX1V9wc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:05 +0000
Message-ID: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 02:43:05 +0000
X-ClientProxiedBy: TYCPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:3::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae8c3dc-d970-40d7-d8b0-08dcc578d00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ehjsbjNnr6mLg45O9pS+hInyw3dB349cFXp3N/owvh9fWEIJuzB/A5L1Yvba?=
 =?us-ascii?Q?FeNJloTIoC68KIf6ffxpLaT2HjvGa3ZFFdFTXJhS03QbtlBtb/ejxc5WbbL6?=
 =?us-ascii?Q?1H5lep3AyLVKQirSsf5AiaQgZM4AQIib3/Et/xMajDpz7imNnHlOCA9Yc5P2?=
 =?us-ascii?Q?VhbMM1mW/SO1SVYqpebTuV0irZOKfPAHCh743harC7nzqgmE1UZVBjbBdiMf?=
 =?us-ascii?Q?A15yBwB9QbzpcjQi0KS4bl5PeROgRu+GA5ZjThETHJvKwE9fHiaX6RwNb8X+?=
 =?us-ascii?Q?clDXnBvC+42u9Fi5R59e2Zr589XpWTloUmwEXuqCqXqyOPhWF6hsi/4qGf18?=
 =?us-ascii?Q?Qvg2LegPHLzsiNsILmlvFUO7g3rx8q9qz91xtxXLwU1rSgCjHcj532bmq5GL?=
 =?us-ascii?Q?gKZY1YKZ5Q8lSz0VIgbTH1WU0yVgG6rT7/hvzkVwpzVwTHzhZ7fbVp4pElPb?=
 =?us-ascii?Q?Iyik9Q9mrJd1WT66aqoeTPUlQU1Ar8PwE37AXqsR03WtK5Vfg+VSlCD7pKqX?=
 =?us-ascii?Q?LmFEgqw+ccVRgyNyANE/g5IHRGurpTBa5/ViTyIfrAPEVJRIlFVn/qLAZBZa?=
 =?us-ascii?Q?HgGBjmQaMKPR9jHUDyDDkiFPNF9ZzYrt7+d74Rmi5WqpwQOvxIDKNtk9NmxZ?=
 =?us-ascii?Q?+TNx3HraTiMUsSb0st5+StmYqZaMhFyAb9jTBbS4rYWrDByITGEZ3ToZDs1F?=
 =?us-ascii?Q?w2hA+9Es9JK6jTSo2akSIEcpetOIDWRTl++TYqk6FGQfs83t712P7bGCflqO?=
 =?us-ascii?Q?hYAkT3ZFqkBn6jQmzS03mYjR11EmIgibFzjOkUVhO1SrfxNzFvhD36gz6vX/?=
 =?us-ascii?Q?GthPPGH2Ws7RIgbbbiu+F7PJzLrIQux3C7SDjdBqhk/7IMwKWp0/3XX9H2of?=
 =?us-ascii?Q?XSvIAQHXrLLuAYf0klJyvfXW+Gv705i0I3y5xflx2LDsyeXhs/gMG84e1ij2?=
 =?us-ascii?Q?IZbBa6XVjQG5KpkfFgOboKhs6gJCxpuZldOWYqLWbnqghOxj4TCc73ZQv17X?=
 =?us-ascii?Q?CEq2LXGNLPY8VXY5Vaax+1SlWx4bBx2E1xCzQKFYennnwpVjDe4SjteELk8l?=
 =?us-ascii?Q?HHVccEx/RR0cmUZuE25EKIFSf4ipC/31drNMcuiGZYcpNn0MXDC4gDSjTf6k?=
 =?us-ascii?Q?M/jvmk5lXtHI29tsOZFycDArp3pKSWppqAT/24W/HYDyIZeDaOzQsjXKHP0D?=
 =?us-ascii?Q?HvJ6+NNZPrRdCWPlTcTmtw8HCagh/72TQuUg3CapYm/+S5q9OvsQSi8u0J2M?=
 =?us-ascii?Q?j/9LtHvkMYkyVRK6Df9ulweGPiKXwz8s1q2eYRB7XQNL8n2hL2U56QT2xKhl?=
 =?us-ascii?Q?UTOmrhmxdDuvYnMO/HtZsVaeFrZfqgH68jgcenOYyQNpKq7uBgn3Ammr5ffQ?=
 =?us-ascii?Q?GFe84ht1m+kWEBYFe0wet357SNfpXQ0nUb7LlK79NmN/L1/tzHWi13J3rmOx?=
 =?us-ascii?Q?rNAf7WfuNRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NtJp7qRvjcJQki7fIgcGSpe0McRmR/NEyyt84VgSvfb+S5NADEee131+OvPA?=
 =?us-ascii?Q?oiG57ms/xr7AA7MwI/nQcWopj/vA/47q7+K7kLkoBQvdnnPWCjwO5FyCswsT?=
 =?us-ascii?Q?Hb5c9MphJQfW+LvQbm2paHOjR2pSWor3bU+/8mYTj2xFtes96KkME0kn2tB+?=
 =?us-ascii?Q?4Y3TPJUJYBVIiYAOGFKLk98rf+DGfBVllYGQGu3jCrKaGw0xZRdLbQQLMXD4?=
 =?us-ascii?Q?/6DrzBKOE4bY0nZGJPvX76BvaZrf0BO5Yuc0LYmjraJkXjqsalAWkOqjrDld?=
 =?us-ascii?Q?eOAvyOYPFt/x7PwlodwQHc+zSDonzJHu+qs+1TIMcfKK9aF+OBKNdELgaGLu?=
 =?us-ascii?Q?pgX6XnjrC8AVxZqfWedI+OUWHuaU5noPnu8l8jYMPTI4a2FoLfZ8UBUHW07o?=
 =?us-ascii?Q?ZLl2sA2KdcGtSCW9eO4PRRXEo1i+0UZZl8BlwatkcxlLYCKkdTW5LEhacpmG?=
 =?us-ascii?Q?CiFFzbOUtsHu4BfQs7Fco3kBxH6vh93noIZdJp29u7EDuUXweBGkJd97Xyhe?=
 =?us-ascii?Q?Hb1cHhbXTbdXa9zfDfKND2a/J7nSDK6E/omXUO2JaJIO7vpPiiqdOxobSBXs?=
 =?us-ascii?Q?jdeCZHDIKez2KWuu4+tsUNihvkrbIFmhM1kHKE6DwGP8uKZRXB1Fe9Lqhkoy?=
 =?us-ascii?Q?pn/2wIDyvACYYXWT7GIPGa5Wf3sq+l+cBzFazL4um1Fr0+CpMPmC+2K6WPv/?=
 =?us-ascii?Q?3XdvpmKWria8Ky0E/XLIPGedXMUYWTPCWMJugzHaH2SlSHMWImKfB7zFyZKq?=
 =?us-ascii?Q?gq6XKzXIKu5A+biFLuMA1dIONe2J4nnbnxB1C4IQynnke9BFzzYuzsmUyE4t?=
 =?us-ascii?Q?gytGCNfHUqvAtlHvZqsOiXgYFxPK9fEPpYNNwHadC3egup2BJZyttgSOBK27?=
 =?us-ascii?Q?0wZGxvq4HLxHw+/Akd7DRiOp3Was7gvRlLpmHuyqOk66ZHQOZ++R5jmaAjuH?=
 =?us-ascii?Q?4AxjjQp/j+xZc5pc/I7ozlC0bLbzKtBHwF8q9AtBXqOnhRcyzJloLWzbMJLO?=
 =?us-ascii?Q?4HegE6FGlnWPYlYQIDhje8wAQsrSdcG0NbPaPYGrQz49G5cxzw93Rb2wT0Si?=
 =?us-ascii?Q?d3JPmnx+m9QLI1Qpx4cc3NpL1/gCfuyY4P/c3vx0k23a2cKaJVeEhH03Y8wL?=
 =?us-ascii?Q?2KmzQNJJJ0e9kOy4YtZZW43NwEHq/2q5gjq7qZuza1RvXrbxK64Vpbexkc6l?=
 =?us-ascii?Q?cERi6jLdnUokPWEZRtNO8UyPEPkrSXhWkhUaK8a/nvoif065qPNhmrXH1W1i?=
 =?us-ascii?Q?ekAb2t6FSjd0JEjjRpwu0fZ+J/kCeZaPAaSjdHYUYwEMuO5u3TV3haTAAoYQ?=
 =?us-ascii?Q?uztLe1yWKCqWo3GLTGRUse4q0a2r/SnbHJOBfSKQC9gBkYbjSfMIaOOSz3yB?=
 =?us-ascii?Q?G4YBWudnllrz6BCGzXKc9Vq22wxgz1eZQ0ro/lR1SAcK3Fh/+BU9TKHkTmIJ?=
 =?us-ascii?Q?WyEV+qQCDG0R8qofWSJc50fqE/05vMx7JNtAb0APQrsY8d1oLit2tzBZt2b6?=
 =?us-ascii?Q?NsxXr8FcbG+jWP9PmU9KYpkS9MYcPXc1doNVbB7P1zSP70EEcz1eKRqaZEnx?=
 =?us-ascii?Q?zwdPgYng9KkNXEOKWVOyCO2/uU3mb1g/ZHlEQY7nz3m3pr36hVi5QuiC5oL5?=
 =?us-ascii?Q?z0l6tpCGaEcqS+q2YLDa0RA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae8c3dc-d970-40d7-d8b0-08dcc578d00c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:05.7986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9SYfVvRbFdx9ITugHfug+9z9LAONsEfWYL4o5YTKHvVxXNkjGG1G6/0IVYJI6t3kRU7ae5Sx+XM3wQsdQEaeQ4FrIob2wvLznL2OKTwJK0K2xDenbXx7zPAsGoiCVqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616
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

Hi Rob, Saravana, Tomi, Laurent, Sakari

This is v3 patch-set

I have been posting to add new port base for loop function
as below steps.

[o] done
[@] this patch set

	[o] tidyup of_graph_get_endpoint_count()
	[o] replace endpoint func - use endpoint_by_regs()
	[o] replace endpoint func - use for_each()
	[@] add new port function

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.

v2 -> v3
	- return NULL if it it doesn't have ports / port
	- add visible comment on of_graph_get_next_ports()

v1 -> v2
	- add each Reviewed-by / Acked-by
	- tidyup/update Kernel Docs
	- use prev as parameter
	- update git-log explanation
	- remove extra changes


Kuninori Morimoto (9):
  of: property: add of_graph_get_next_port()
  of: property: add of_graph_get_next_port_endpoint()
  ASoC: test-component: use new of_graph functions
  ASoC: rcar_snd: use new of_graph functions
  ASoC: audio-graph-card: use new of_graph functions
  ASoC: audio-graph-card2: use new of_graph functions
  gpu: drm: omapdrm: use new of_graph functions
  fbdev: omapfb: use new of_graph functions
  media: xilinx-tpg: use new of_graph functions

 drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   3 +-
 drivers/of/property.c                         | 134 ++++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 ---------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  66 +++++++++
 include/video/omapfb_dss.h                    |   8 --
 sound/soc/generic/audio-graph-card.c          |   5 +-
 sound/soc/generic/audio-graph-card2.c         | 111 +++++++--------
 sound/soc/generic/test-component.c            |   4 +-
 sound/soc/sh/rcar/core.c                      |  12 +-
 14 files changed, 270 insertions(+), 160 deletions(-)

-- 
2.43.0

