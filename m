Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDC90A100
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80410E02B;
	Mon, 17 Jun 2024 00:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="YNye63zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2056.outbound.protection.outlook.com [40.107.113.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205210E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHODmjw0Uow9GIJBm7rEFyGXsn4hDbxF9sSSk4BPz1Ee6jpfPo0Q4KWEeRta7/4SjikVR+AsICOWiQEAShHHjsRCKe9QE9EsRu3ttdqvzTZYXeuiRMHsuQmwrawNMu+eq2v1K+OOyXVGX2QP2mxNnu9HXWqTp1jYrfe95igexEL2SzAjaiGvg4X43UEJ3d/+m0/eoAfvzvTbt+EfC16g4AphgFqBa6cEaFZcRL6NaUP8J3zI7jrI2OPhYj5L1eSwY5aB22bpQ9i8jSsxVpjyoEUXzsdTX5/DtOYy6Gc8Bc0jrZ3f9cxZJtgAMpVxoMavQ9eBfiFHTGxAFSVSq2bX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyfIYqxd2BdEIVWLTouEr1cL3EpDNgZmDEYKLnWFGIc=;
 b=E6jNTPSS87mP7cPkBzz3HUH25Rz6ToZ+c4zwkyo8SPAQfReuzBYRwmnGQlwexCK7sHnUKPUzVLGtl+8FyE4D5X3TGrMMVkQXQ5YTCxoUKgmqmo/vfzHlnGODSBFW/kZjG0owbWIJ+oGf18mVI7W2yhVg4L5Q5LRVstnHVA5zWVgSBWIJgfpByJSMX+SK9BbnWR3F0q1oRAvMt35KWITqbhbZ0BzFURSBNzpAxF2XHYVSxhOrd78UVtYZnh4YSYj+l63g49sA3bP2OoncjZr/8DGYVESVeJHdpentRNFMy+R9kRlTc+7M3LwRHEvIZ8/kxQVlvs5ehodK+1Q/X9X4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyfIYqxd2BdEIVWLTouEr1cL3EpDNgZmDEYKLnWFGIc=;
 b=YNye63zbDSt/CtTto3KCymWC+uYWNjid1VPYdPxChQixKeLrmeekmoiKyo8+YOBXNdk/1k+TO+d3ZmuKKTwgditli19aaSv39tzxgZifYszf7JW41M84qAZbEaoxC8ApAL5puyFQBLlCUcAzBO6RFyB1PdRF3fXhT6zatmF5n+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:58:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:58:28 +0000
Message-ID: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, linux-omap
 @vger.kernel.org, linux-staging@lists.linux.dev,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v4 resend 0/9] use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:58:27 +0000
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f48c659-2330-4d9e-ef92-08dc8e68998e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?motYYQ68hPAjp51RnuqkFIZ56AZH6EUiIdiFoBnr6gKsFagQMfp1UuXPSCt9?=
 =?us-ascii?Q?ie0fhyS6NgYKS6SHQdvy7bueuzfCy85ZO2mcNGUXn6uAfXRSYNT8hRHMyUIX?=
 =?us-ascii?Q?Ptm/hh/aq1ZlCXD20scoW2OEtPGTME4eG5qPawFPPoRIGcc72jqj9V7fjvd/?=
 =?us-ascii?Q?HyEXDIeXFZECiczcl1dQ2ODuhxU3hgj4uix+z39bX9XZk4cfDGk6z1n6M8vp?=
 =?us-ascii?Q?OyQqqnCC1WS44+/hHn2flc7q3oJNfP+DlP26KTVN5LC8JeKmixSIPc27Qv4V?=
 =?us-ascii?Q?VWd0pDzYz6Ls1VAkcSbustzVP7hx36iucT54jHEET023N/Vt1vqs93FMAwHd?=
 =?us-ascii?Q?n/Zj1YzjMmhQhkqBjcZV8boe7OOkroFG8MFGyl0O8kSjSMn9cwbuRDQwy5UZ?=
 =?us-ascii?Q?D5u+tSzxEMoJB3/9sMfbzBHBio+lBaptuL2sF5n7d921VIitVAhtv5bFCa9K?=
 =?us-ascii?Q?b9kftcrvHli/WCc/cVtqBttyMK78g28R642kr+yQ8l4CPwB+4YmMwqVGkXtb?=
 =?us-ascii?Q?u2bE9vWhRsOjU3CcvT4d5JD+31Q4gBFJy6a32V6frLqRF1cz+Jv4rxNeUGn+?=
 =?us-ascii?Q?Cn6qIuFnUkFGjJRpy0EeCJsOS+n+I3N2TSnrtDdxNbBKyW3zqs75AK9GmASx?=
 =?us-ascii?Q?lsJSfwWRE3agqc33Rxe0iAtMWWAp+F5yqgZHqzE7p1SdYXbFtpCadrX2Q4Jv?=
 =?us-ascii?Q?K5Ko7kePfy0Wotigz0gnpPIspApRAwWeYPJ+RHt2ryXcSDrdInPnaF7M2vfC?=
 =?us-ascii?Q?Ewqp+2OYoWkU/QEIrWXV9/QbT/aBafe4peVKE46WshoBRtfIZd4gspgK5cVA?=
 =?us-ascii?Q?brNrl/v6hsccFdje65pbFIWRw+6mm572V8ePsgOq1zF1/+HF8iYA83tHCQiE?=
 =?us-ascii?Q?dOz1UaLNk2U+p+Dsf+aoiNxMjACbZrRzC+cmz7cvEDVY4ilAt9z5wsTrOzV6?=
 =?us-ascii?Q?DEvHQLyDJB2zEbiWCGutwTkr3CQM8/WIttLoEB730Iz4cZStyud760lZSgRA?=
 =?us-ascii?Q?GV/MBm/Wv7W61BukH+FPO3DZrDJGjKv9UL9BtqgYGJtmYEpcd+3rGTi1y9Kw?=
 =?us-ascii?Q?GWjsTEEUY10rAzjfbBXxftc0Yrxw9YMtUZgoW116tr4CWmSp2sUNyrkK3sAt?=
 =?us-ascii?Q?UbOyTmoRbHUlrw2H5I+iHiQqaR6lFsgqPNWECWSDG8nfK+TG8ANxBSJqZcg2?=
 =?us-ascii?Q?RuEeVf/antUaZKErYu0OZmC5LFUYUqfHg2oV7dSvYUSDyxQSufHesw9xyroA?=
 =?us-ascii?Q?ZYb6A41Zn8wRHitdhMGb405yH/n0Aepfaf1c7UDFs1TqJKelRk6RE18/SoDe?=
 =?us-ascii?Q?xIR7Uv23xYuZXhEFIRnjLf5GWU1jT6MZiDQg87T/v+5bOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S7eQdD8LBrnkw0WcJ6cIvY7mnVdB1bWQ8iQ54seXLHDvr+aABfCirSZrkWfl?=
 =?us-ascii?Q?pE5aW8aT0u2zEPEKqI/qvpKuW0oqEvJStvFRTh39SPrjPdD1/+3G5jv95JyF?=
 =?us-ascii?Q?o+nr/AG2YZL396YvC1m5Gi8yUIG2MKCB/yor25xfwHmdlObdD3kHLqQx5TS5?=
 =?us-ascii?Q?fSM6x2TFx6w5j5GySptstkGsom4tt+P4AU1oci8RdNsv4tGUs3HtQBaHigrV?=
 =?us-ascii?Q?W6tz/jAi8Mckx1EsXvVenmhcI/ti7s3/ivKO8jUUGxGx0Ks/aGu9UZswot1X?=
 =?us-ascii?Q?GVOp0aYnf2uJ+WaujJ+yU7ZZcWO7EdZ3lGlGD7zJO2k39Q9k2n8mCl1M4ViS?=
 =?us-ascii?Q?7rzdJcN1LuAQwriB/ftiIoNP7dhfK5laGUphPXYlO0msR9UZB34gNXBbMDyg?=
 =?us-ascii?Q?8wDdCJ1CoFDylE4N7KuAhT8U92EC4gQUy+hAcWT89OfkUWFaiF6AzPZhbLrY?=
 =?us-ascii?Q?pdElvkfxD2ETRq2VQk/OCQ8s6qqBI3Cs5lDDcvHDEZLUvrv9PGfECQVL1F73?=
 =?us-ascii?Q?CZFabEGXV9wKQNlQOgOW00DXI4SP+tMo+PlVXedajul0pbuEbny3vW81dyTs?=
 =?us-ascii?Q?S6olIgR31OUiAnLSevB9KC/lrQ49edJ5ZGpzGTgjfaNR+dAta/hwE8ahXdhW?=
 =?us-ascii?Q?ndUAKtD/0OM7e8WyLusykX6LIlUXOFdezSIYwl20eatGVYIHozUHKMG5Sl3y?=
 =?us-ascii?Q?SWt9hwNINjuyPzF8rVFUKf7smJ2R4CHkiAZU+XKpu4nXrLsDz1js3oGvBEa8?=
 =?us-ascii?Q?eQegJb+izLTygSDmlu03TEifGqY8Ej03R65JMXWTloD3YL86xBPpaJGpHBDB?=
 =?us-ascii?Q?aCxjKca7dhC+YuGDal5IacwEACU+wThSJH34MSrvzqKie2+ZMFnIoSkW/X+R?=
 =?us-ascii?Q?PoMrGEM0AB7s27OsQ4fM8UWuILKh4aTpdwe3K9NM9Nex6QlbXmnbkS6kmYMs?=
 =?us-ascii?Q?rWkad9k/mggwaCXz8Hlask+A2sb5KoxvFI/2s2Bm4RuPQ6QUofn44wm9M4QY?=
 =?us-ascii?Q?kP1qerXNUsR/MwDYq/FBBKG4SjofAQEumWOrIRrlP/skZSuq0sv2vlrOacoR?=
 =?us-ascii?Q?hQmrTIViNvMpzxYKkFklYsGHRXWtDsv6E5M+eqsS2lw6PEQBa6qV5x7iArp3?=
 =?us-ascii?Q?F1GSMt44QkcCqGcOfYWaQXNQ67ewuLp86kgzrCRYkGG8ig3h/ntiG7M/3WP8?=
 =?us-ascii?Q?Dle5HtOyNJBAr54FrFne8rtaxMbcJgogxGjmld/IIrYXuh/+e049Va4U9oOI?=
 =?us-ascii?Q?qmrctbSZy/BfVmzpjG/p29N9Zl5BuczRVWdIpCIRFzDt3L+6jPNRggmMIkRz?=
 =?us-ascii?Q?Yf9ZrExXfiqavUOxd5VphKFzJISfXdcvaJnn2BlwlEIVDOVfu85rFFt4miWE?=
 =?us-ascii?Q?BJhBKF3wTAJxz9C+dd33yMoEf+klzPuDV2Bhdcc3UpqVCk1fn9H37b4Bf1hH?=
 =?us-ascii?Q?8lGd4fnZnNs0vimEqTim8c4DojB6U0p2nEe+TNCiohZsY85rOmPMhtV+x3v1?=
 =?us-ascii?Q?/hrmAUbtw/GhwXavxszMAgskH2u7wEOWo7DYSXg2rOKONGPtdz7z9Ni0FgIP?=
 =?us-ascii?Q?uW254WgfAwhv5yLdTOsSI5DVddzPq0Xa4jKy/o/WMx/DzJUtyoq+XnA1QPwY?=
 =?us-ascii?Q?R4ozWY5LFmEHf7OpKzHFo8Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f48c659-2330-4d9e-ef92-08dc8e68998e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:58:28.5361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0p4zZsoA6qyx43IVQfdPacXErCwRlYWyjaq0MnWP8oRNBkvIaXMYRtfU7X8G60U0cuGbNfFKX6ZPy4s4sSM6wMCIgnCumg3ZOxJMtAr9O7nnb/wf7ER+4DE2EOf4Mgv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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


Hi Rob, Helge, +Sakari, +Hans

2 weeks past. This is resend v4 patch-set.
I add +Sakari, +Hans on To.

We already have for_each_endpoint_of_node(), but some drivers are
not using it. This patch-set replace it.

This patch-set is related to "OF" (= Rob), but many driveres are for
"MultiMedia" (= Helge). I'm not sure who handle these.

I noticed that my posted 1 patch on (A) was not yet included on
linus/master. I have included it.

Dan is indicating it needs _scoped() macro, but it is new new feature.
So I think we want to have separate this patch-set and _scoped() patch-set.
I asked it to ML/Maintainer but no responce, so v4 doesn't include it.
It will be handled by other patch-set in the future.

[o] done
[*] this patch-set

	[o] tidyup of_graph_get_endpoint_count()
(A)	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[ ] add new port function
	[ ] add new endpoint function

v3 -> v4
	- fixup ret handling

v2 -> v3
	- don't initialize pointer.
	- add Reviewed-by / Acked-by
	- include not-yet applied missing patch

v1 -> v2
	- fixup TI patch

Link: https://lore.kernel.org/r/8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87le3soy08.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (9):
  gpu: drm: replace of_graph_get_next_endpoint()
  gpu: drm: use for_each_endpoint_of_node()
  hwtracing: use for_each_endpoint_of_node()
  media: platform: microchip: use for_each_endpoint_of_node()
  media: platform: ti: use for_each_endpoint_of_node()
  media: platform: xilinx: use for_each_endpoint_of_node()
  staging: media: atmel: use for_each_endpoint_of_node()
  video: fbdev: use for_each_endpoint_of_node()
  fbdev: omapfb: use of_graph_get_remote_port()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 drivers/gpu/drm/omapdrm/dss/base.c            |  3 +--
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 .../hwtracing/coresight/coresight-platform.c  |  4 ++--
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 .../media/platform/ti/am437x/am437x-vpfe.c    | 12 +++++------
 .../media/platform/ti/davinci/vpif_capture.c  | 14 ++++++-------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  9 ++------
 .../deprecated/atmel/atmel-sama5d2-isc.c      | 10 +++------
 .../deprecated/atmel/atmel-sama7g5-isc.c      | 10 +++------
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +------------
 .../omap2/omapfb/dss/omapdss-boot-init.c      |  3 +--
 14 files changed, 46 insertions(+), 84 deletions(-)

-- 
2.43.0

