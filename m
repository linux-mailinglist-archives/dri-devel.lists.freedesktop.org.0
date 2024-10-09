Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2C995D2C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE5710E19B;
	Wed,  9 Oct 2024 01:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Eg/BdxZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978210E19B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1gRpfili8kbfTaN4/YOjKNq49VzB6TiTmDzXHiQLm/56PcP4aDqpRK5UHB6eInSypNA9KFMpeY5/qIMREdgAWHIEJDoV+eby4LfCYkraCjhYwPU6D8eXrKGh4rItDnfDMgcarW6zkBhpfB7TE1lUXYUluNIcf30wpYR8qLTAdL6HEPDQ+uIwceQtqN3TJMUdt7cVrPOb/DbVFIDTjFMCYhu44bzhNEHiCtPbnkiOP5e8/xQ56jyrc2Z9d2mftBaHhfrtflPDzouV5psgBla9/qqpWJr60nWqd/fcu74Jor78/Uz7+kMwzCEw+UsDxwev+plY1AAhCB7yM06NNqtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz6V8B16HB3zXxv+PkJ0LJVsnzvKfamQPbE2r0h8pWY=;
 b=ML/PyKVS23auVjaj7yzNPMS8v0Y0xSuC6XDA+Q37Q+vsY13mEBR8JE+PTQq2zuQ8Q2V8zuDeAFQGLWdidQGtvLipv0Nzf8attj9XpfHj6gc8ydW5yDEIUU2eMZH0lhNFEG5P43Wogd6/RqU3Gheszt9cnhPpshXcqCwAoVYq6ZEYY9wWw6tKdILGtaSW1lTjh6fWELT+n+1ao6L8vrcdsE3UbVlpEZs7I1ghAv+Awp/6h3P/A2EtugTqYWAF07aFN1Lne/ue5JGI7vGR+4PLt+n5y7enyn7EUjNtmBJLCXVO3FK6sUg1kAtM9Mt++JkzZUk6BNKxp8RZnpZcOo/Qpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz6V8B16HB3zXxv+PkJ0LJVsnzvKfamQPbE2r0h8pWY=;
 b=Eg/BdxZJnXwNRI6ubx3skTMkqgvNdoRHrjSb4e4jxqYdLUFGpAaV4pUTGgvMN/yV3DxzOHH82nOLprFocaHBSwlv5eHlyYBsJkJaaMbrzZSSixo1YBHxntYxI/NfDclPTDLcR1yagVwLCIl4f5cfbqQi2WnLp9LVA9CUKxjwdD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11140.jpnprd01.prod.outlook.com
 (2603:1096:400:3df::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 01:44:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:44:30 +0000
Message-ID: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v7 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:44:30 +0000
X-ClientProxiedBy: TY2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:404:a6::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1461f7e2-a6ba-4c54-4861-08dce803eafa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rhlx0Xz1yavgdLr3bHTdlNcsjKZYZCzKSYaY6zukZeHUUXKNjTYmsiIW/uI4?=
 =?us-ascii?Q?A2bf9BYS7b8bty0usNeuKeEE8qTZevNGBwT2RMgbS7ZnCNB/brbps913bzum?=
 =?us-ascii?Q?XxFTcwAmXU+tqSrXx87npg8J2FgD5LQRY8IY5qUmyCHXzgBWMIIoS9eHYK5v?=
 =?us-ascii?Q?vRtQiJ0oVGV9bIFI0dGYwnu5AOKvJFuLdm3Svf4wYpGaDcA3HYM7CHXiFbcC?=
 =?us-ascii?Q?tfM5VSPrJjS1i12apck0c3erPck/WWEWGq9xvR6ByDm3Jo66JyC8YEXiGTA3?=
 =?us-ascii?Q?tvE+2htdwpNdtl+ealMB+bsUdxemTT2CouFMvd9d+RVb0+RV0OS3ayChU5Wz?=
 =?us-ascii?Q?rvcTU1nvJXpLPO059YWSnDlSiw1vU33Hm/x7cEHlA86XZiD8Bn3EK3EcuMd7?=
 =?us-ascii?Q?RXpHQ2VtnHJdOHme++5FsXRcfvMKkmehaXbTJZoQXmF8YeE8lvDzl5gw7SzT?=
 =?us-ascii?Q?RMtUQaT7VnwfWHrKPhE6v6G4oGD2BgVAEnbN1co3JjO4mqIB3fTMUyzL0GjS?=
 =?us-ascii?Q?/uMz4pZom33HX2iB3js2khNtQFbr29RDpuHB6fbQEKFyZiS+zmQkXRNOA7xM?=
 =?us-ascii?Q?SKHxmUed+r3KW8J3Pyr6yES0k9JXo9jGyakVf8cEdwIWnN6z6HaD9yK3s3yZ?=
 =?us-ascii?Q?y2pyvhXLaCZ2F5tTv1nZdg2bJVGqcU3612G68+OK58BMxrJukpY886eGfxQM?=
 =?us-ascii?Q?l9P6HhBnsjeYYj44G600J3kRlbwg6yHnZY0YM9R3fngbpTpJyzvWIvtwx6Zx?=
 =?us-ascii?Q?uwM3RVSICItwsTWRUd2biSYr97tr2bmCPKMX/kIa1+tcJUXLghu/0jyPxBLh?=
 =?us-ascii?Q?6r/KDuBOV/hd9UNCEz0HIhNdWWDqM0wSgLYl+bXRaZ3a65ZBLBY3vJLXKm2C?=
 =?us-ascii?Q?zY3sdVV7Jwf9kkJUvRxlsoAwHhm6iCVyGN2m5zGDMR69wyvRaMuIGR64Ua7R?=
 =?us-ascii?Q?5S4O6GZ2C9mIVpIr2a3hUX91TtG5q5FV1EQHnbkEFA7btdqqFvlcmt0tjXxI?=
 =?us-ascii?Q?covMlzfu/CcNrLNGy6sT6qFUW4CJTzNChPwg0ijk+bn55xLpRidD6BVOWxRX?=
 =?us-ascii?Q?r+xxhqwZd44INfZxSp5iS3zzRBVotznkqusGOJgK6zbQ8+B8+r6rTTKfvg7K?=
 =?us-ascii?Q?dv11g8FD2xn4wqIRXdaUfGOk/7nHe3e1ch0ddp3atkUGqUp7n3WHNyDz/6KI?=
 =?us-ascii?Q?xL7QPi8MnONcqTgXF+4Tm2FQfVXvLFvN/gwDzBb0CZtu7DKNQYHc4qITnQeY?=
 =?us-ascii?Q?pMAMW0mHW8hq+mXjBNnHFWPNETKGT2c1tNRxdWF/xmuDosjDa3IrLjAtVeD/?=
 =?us-ascii?Q?kQIGabPQpBhoZF3jQJTZiASyJcfum8LXYMoxxyrHcbSgrjQ51mGR0bLQKiNg?=
 =?us-ascii?Q?aO+Uzbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?edfBgF/VOQH6Do4dsnbFxYrpbSCgpkeghBXI3S2keEQN6vtR+pH7AWlIIdY+?=
 =?us-ascii?Q?hvpetap0rWT2+cT0QWh6om6/Xuv1EQryalKSNbkymwexqx8m2I5M+Ocg0UpG?=
 =?us-ascii?Q?kpAGCQwybs0NqLajbs3bKRlzMJiG6xHuEi8i+thdfLN3hRL3LEENucFrcUEj?=
 =?us-ascii?Q?JAF3r0QLU36qUKO0TzUOr18Wxv/vA+3EDLN9ge8ocj406icj4aAVALGPkB0U?=
 =?us-ascii?Q?go9NrRbVwMVs0cXWNasl6bsJW9tnQkkrkmcgbceCqxXB5DrMNXzmZYTtH+B1?=
 =?us-ascii?Q?6SBmWF2TIS/7mu9j4r8hgjBN/ZzXhbgPjmRP6Xnitiy6G881LVFy7+AuryPy?=
 =?us-ascii?Q?iRYJUjYwhjvb8v81kSGZ86QvSolQg0HkHjEhsxYDrQPT4+QpJzkhxMhMAmZt?=
 =?us-ascii?Q?FZNqIIzfbc3o1qgzhSMzYFjVcqEUUBQ76Mg2dEqr3ZWT+OK5Qb+C0w70bP+p?=
 =?us-ascii?Q?39k8/N3DasEwPeST8taGNqHwLijUulCpCoK9/W7LesG8xCAcmMvS6Y08Rbvr?=
 =?us-ascii?Q?stNf28psTYdTci72S4EnxqlclVmKct/v01KPCPfhXpkPO/ki5KBTQHHJ+FQ5?=
 =?us-ascii?Q?6hET7rsXH/rSfQXMXNEwv9Q+CfTtT9jxUvgAdMrHB4ZLTq0En3ij86ptTjfY?=
 =?us-ascii?Q?WHr+W89iviHU1Z5XSReauKuJ1J6ciDqj+hoLW3N5tILzyHl18Aw9v1tHNGd+?=
 =?us-ascii?Q?a5CV26o9RfumrDn/dLnFd03EJiC7lXwubyThXnWPCTuVHU9GoR/EMjlKd9TY?=
 =?us-ascii?Q?LngXn3tMC1MYSYd07broD64l8LoK1OeDzuAT6Julq1VDvKIXK1IuJNJsMp/k?=
 =?us-ascii?Q?b2kg7dWa2h7wQ/VdwvCZdBfMXSTZWZmBIh5z4g9uQW2abotVqXchiEsz4y40?=
 =?us-ascii?Q?zblEGO7Z8tGJQ0oHFRtJ+PUUnP+t5H3Xfnn2k33fiuxu6jWqyQNKJfAov45f?=
 =?us-ascii?Q?89JsS4GF8T2Hq6PPvycCjdrmEzIRKgRNkT5hBIcjBmxPpdvtQsGjbKF/AvTN?=
 =?us-ascii?Q?QwHSqNvdqx5raLvCfu59e9b1MlfYK2fxYiWGDRlt3w2zQP0KoIHRt7zFZc4y?=
 =?us-ascii?Q?zRN+yOnPcHjEo/wGaDaW4iAjaOjM54XtVBDpPpQFJxVjpDoLHzwYo2yXTJQc?=
 =?us-ascii?Q?X3VOaiVDECikiTGJRti+JTTXKwzFbIz2/uytyohqsIyJP/AlGZy0FC5ZwOvK?=
 =?us-ascii?Q?oKMrJQH7XGB31xAOZZMp9amWVEbLn4Li9k+jp4zgdMJO1CH5R/eRmh7D7AVv?=
 =?us-ascii?Q?4MxfyJ5hwUYDUV01mIRzTuR8heRbRFTb99SVp3KDjpb06X670CxoRkW323GV?=
 =?us-ascii?Q?T+IyZW2ori7aXDZreljbJsrMI1FxoT6MbMfJeDeRU29FLJ1f6WqMKbTfy3TA?=
 =?us-ascii?Q?Loh+78MBg0QYpo+SV6A/uThQFGOPKuBjqlKN8+XOzy6J0WbOlOwv0g3odRH/?=
 =?us-ascii?Q?BsCUD8+ZXTF03lb8EugioG1PwHF3A/t6dvTOhFxJMOOZOL+wSG052xN/fB2V?=
 =?us-ascii?Q?KCuK5BdgKIse1baMFogqAvD+FOTopLSuz2XFDa2zOjNW9IhGvzWz7doFyfDg?=
 =?us-ascii?Q?jKFzNG79Dd21p0nWpzZ3+jugp6eGZgkfKSShy59H79l9Bb0Kr41ZTFkzIxbO?=
 =?us-ascii?Q?j4HZxI7Y/NZlPTowR65DZ60=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1461f7e2-a6ba-4c54-4861-08dce803eafa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:44:30.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9Y3Zt3x1ZccHarP1kNyfjeOsTtX6dU8z4L3galXkAyUvO4gBWHHERw96V91r5GwrlN7iQ369OGOdDSZEoRajcCOAdZSrhPHHIfmwqhdBmvdDfWRxtND3JYUPrjHWCLE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11140
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


Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark

This is v7 patch-set

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.

v6 -> v7
	- based on latest linus/master branch
	- remove "ports" base functions
	- use "port" base function on "endpoint" function ([3/9])
	- tidyup [1/9] explanation

v5 -> v6
	- based on latest linus/master branch
	- [9/9]: fixed compile warrning

v4 -> v5
	- tidyup comments
	- [8/9]: parent NULL check was removed
	- [9/9]: use for_each_of_graph_port()

v3 -> v4
	- new for_each loop includes __free()
	 - comment indicates to use return_ptr() or no_free_ptr() if
	   it need to continue to use node
	 - each driver based on it
	- care "prev" leak on of_graph_get_next_ports()
	- of_graph_get_next_port_endpoint() indicates WARN() if port
	  has non-endpoint node
	- tidyup each git-log

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
  of: property: use new of_graph functions
  ASoC: test-component: use new of_graph functions
  ASoC: audio-graph-card: use new of_graph functions
  ASoC: audio-graph-card2: use new of_graph functions
  gpu: drm: omapdrm: use new of_graph functions
  fbdev: omapfb: use new of_graph functions
  media: xilinx-tpg: use new of_graph functions

 drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |  14 +--
 drivers/of/property.c                         |  99 ++++++++++++++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 ++--
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  49 +++++++++
 include/video/omapfb_dss.h                    |   8 --
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         | 104 ++++++++----------
 sound/soc/generic/test-component.c            |   3 +-
 13 files changed, 205 insertions(+), 172 deletions(-)

-- 
2.43.0

