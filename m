Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2484AC6C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30D110F194;
	Tue,  6 Feb 2024 02:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="kEiyjiPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8C010F194
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 02:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+ieCyxWybpYH9SuXDxhBeHeWDbTGcLPjRC9qoGIhXXljMYpTEQO+gPqPA2lq+8WLdGxLTmGs20JvXqU4gnAFc4vebMY6KUN6aFIVfeFnZYJKznR0tZvSjg2deqLhF/frydJN1p4xlX2q6sTD4VQACwhBDLTTCFfxDqSc7L6yUEcZdLR/QirsYs2Y76dmGiVlCmE+RyYfOwF77gAkiyyhTAId5OgsBUAG7z9H8CBTzSpEqiMzQ5njocUgQIJ3Ygwt5LfNcsfA6bYma/waNKxz1ZTXkH/m9g7k1VKzDbSe34TSEvk68G6nvD5qavGNqNtChdMWbsF4TqI3bm2Vxpscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWAYyZ/WU+PkFtK7rW7bf06qLxVO4EcOq61arcoJRWE=;
 b=CtJSqrlIV82G7j+3AVZ33rp0DGzlQpPGhHJ9+e3YUZHWfAKz8JOJL6eHK4TCLo3cmXvkGGJvLCy/Yx+Ove3rNqpQybXOX16NZGc0qNgk+iGeMr6raMALbl47qM+IflLJTTgRncnNLHaqgPwe4hXwNUXM/ikKdutWfTmky62ugLm5ZYRirJ1RS5F1Y7XgJ6ie3UtaI13n8A39H1Cb+V23CqL5oQIlqwuGT5eo9B4F6bXIfudbXQHI0mX+zrDxw3FEBVntZQpu/zgvcewcDs5y0qyhfaquFLlV7p/UiafdrvUUe5J6hr+6vU3mNUdpmsbh7EChBP5d40W3XB1f0EYn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWAYyZ/WU+PkFtK7rW7bf06qLxVO4EcOq61arcoJRWE=;
 b=kEiyjiPIpGoaOi9cU2107Jbb4ITMTihWXfR5SZG291CROwdV3d5nNhJX2cRMHLk41pWIbN9uWzkUPE21HviXWKUPCZCqShhtovHrntHeVd75TViCJnsEOWaHLgYBowUCmjIqA/prgDRPC2xaEq1korG5f+1LU5ON+/aWA3jszvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9518.jpnprd01.prod.outlook.com
 (2603:1096:604:1d4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:54:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 02:54:13 +0000
Message-ID: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 u.kleine-koenig@pengutronix.de,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maa
 rten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/4] of: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 6 Feb 2024 02:54:10 +0000
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: bf022802-de56-4506-324c-08dc26bee65c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/kkYXAQLE5c81/q9pBp+1/84G8WPEb/OWRRcOHcLWtulQxdZK0zMBKlKvb5Mt4LpK/Zhesxwt6KsNuwFJW3NJIgt93KLepNMPq/Hbarmu/kAJh9hIqlUzRLRBSc9T4+jPnBRmpc/Lt5dfPo+fsABnH72tikwPrCGU3YWsIGZZhkMU+kVUn4AiBxK18vBoADoq5kWQLmMbjdGNPPp2kasMIfLc4rq86sYYCCy7eWfmnXN2cHzBFrWgNIVmVJK1AiBvCpzsOGq+nFOWL+L4JHRoPsNyLOA4Y8Hb6NFoQJT44kCXYJC2xcqitLcwhNmRWbZWdbIR2hU9LSA5wpFPHH73+HShL1xeulEapcsbFekWARqv6IxG1eUltd4N7y6eG+t9v6LRKq7iIvi4pUh3PW3AGz+J8bzofS1l5gw1JGb8bw0cbTmNepOEzfstMkpWBFskknuqS3GmbR31JZmnxkEiZdEoAH94N57ihD9Tdest1X3OM/I2u8CjEcbztc4ejROZdOAIc9dmrelc+46amHrlddNf7z2txw3gUXGmyqye0cUCGySL7DyL4GiHgRbBgXbnu4PqVnQXcDjmWC+eFEHK6MX9vdKQuAPG2+Lor3ktrcOgvCK6QpLqMrCoDvUVwg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(52116002)(6506007)(316002)(83380400001)(26005)(86362001)(2616005)(41300700001)(8676002)(8936002)(6512007)(36756003)(921011)(2906002)(478600001)(6486002)(966005)(7416002)(7406005)(5660300002)(66556008)(66946007)(66476007)(38350700005)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jj+EIlDwm84taHwhRoQj05MPjJJ+Wg//U3XzRRayjdbE0fWm9VwURhh13Pq8?=
 =?us-ascii?Q?WBKQhWuQTS82PJcwYoLSl14yDxS+mcXr+xUYowFSmvNF5Qn/i4Dq1mGFMhQI?=
 =?us-ascii?Q?543wK7ERtY5uVs9UPvQzgFhDOsy1kDfWECLGOYolb/+n6mCm3ma7N8y3kate?=
 =?us-ascii?Q?wb6NjNuIeO01V1wPyYxeNK2HbYFRIl6Cq+FQ12ZOz+FryB8002wjNYpgLPLz?=
 =?us-ascii?Q?e1wo9eLNuaJUGBbzC38vXgmwhNGG81agMkx1nn0TlAjcUWaPEdfVvsQv38J9?=
 =?us-ascii?Q?BjKclS6yjRHhuLFWhIlzeps6C/lheOlZPy32z+cr1yTZMEHMYiWdnElYyrem?=
 =?us-ascii?Q?xuNLlVgc1TCjx4mmO7yMasNT160ca+xRSmnSc1Cy/rxbs88AC2hKfJXCDohB?=
 =?us-ascii?Q?kMKNqNeQLXZ8tfvrzCbMN8duCA3pXCPbid1vYtjjbUqt+WaPbeVUYx7ZG2rB?=
 =?us-ascii?Q?NgXCrDTKr9M2HmanUb9/7CqpdCXC5mVlZxuGQOuUfKgfzmkLHtHvvLnYoAts?=
 =?us-ascii?Q?otZt4xuH7aYybI1FzqMFk2mGVL8e2k4MYemPYK/KiqnMh+rtKDZ6RO13nhjh?=
 =?us-ascii?Q?Uly3K+Cy4AkZLNbhXUhVfIV3ef68O/kYAWGksYJfvg0crOgdHJ6xpdYO5f6C?=
 =?us-ascii?Q?1xHFhXe20s5tjuqE0mtqBTM8q/WLIRIaDwfEt8mJocNJb5Xx7xjWPTl0tZ0S?=
 =?us-ascii?Q?kCGk9wkJ3StHYhVzXGnKhoDilmQPe4+FCI+3zV4rwkpjHj7brXvrhRLt+nUK?=
 =?us-ascii?Q?ZFYA03DzyU6KhlnrxTcZ/zTluzRJ9AghN9zi0asgFaZTDoXLv/DYUie+eGNd?=
 =?us-ascii?Q?MYhlhOIa0MksBIDXFhmOnry1LSm2c+vnR/DV7gizgVBVkji9xEmx0l8MAtBF?=
 =?us-ascii?Q?FlAzLXXSfbHpG310U07mhd/nSGH2H9Uv8DrCrmVLuzTjHk+eLwiIlhypMuaS?=
 =?us-ascii?Q?aurx+gVxEG6XlCYeldM4FNCyOO9wH6vBzHRIgSFkhChUk8hinjG7iqTSutQs?=
 =?us-ascii?Q?8hbOV3nNWUdN6ItT3J9LEhS9OrCcTN6nliPPeWj9jUJ6KnhHGfHK6EC8EUMt?=
 =?us-ascii?Q?4zMYBC0nKf04CrG9AdNm19QeelVV/nGh4eWPKrmL2LBSk2MIbj5IjXqtAZfh?=
 =?us-ascii?Q?JqOyViJiaNK84P+2Fi4oytRNlYNVkukBUZ78xicnMPyxKxJFiR95aWu/J6GU?=
 =?us-ascii?Q?L1zl1/kClP2P9/t8ppG7HUU5KEPYPZn5RqKltvhP7LCh4E2jMqZ6FUadMIfJ?=
 =?us-ascii?Q?sPLlzVZNqC1zSL06dLkp9yy7dr+8ZYTmJbeu8oWYg67aS92cmMtBRjbK5oXm?=
 =?us-ascii?Q?AzWUO/nDft2ErITWqmbVjg9mx1o8IK96l56wx63mm3MM/UQpB3jjRU6bXNyW?=
 =?us-ascii?Q?ALB0gaB9l9DJ34DLkK3EO7vlA0Ty1r6NnTPthcnmF0vl10MNtQSJckkiWLhK?=
 =?us-ascii?Q?ettvOlVnJ/gJPTZJIw9Qi2aRiTeBCNIM+JktrJBRDLud5/RYIPRYz38D3r3T?=
 =?us-ascii?Q?E6mu9ZcMCgdbE0ZRpo6f8gU/BkNxRAOCOMSt8s9hrl4YAfTpavNqqoP6I5Ms?=
 =?us-ascii?Q?0LeGQbrOeMGkNGrdrKVPf0h0STMq2EWctmJBtsZnY0kzER3qr6Io1sRxDGx5?=
 =?us-ascii?Q?Nld/FceMH6P7o5UW0xlSGuY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf022802-de56-4506-324c-08dc26bee65c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:54:13.1450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3QwofiB4R9rYGsBAxqAMKYuUm6nTlcAVabDEzJau6jcXrQ7cCpP/2sN+DixLBDVa/str0OLt6QkX4YpQskOI3hwakdPxbrNis5f6C1YK56Awsqgt6yrZF6Cdztn44cf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9518
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


Hi Rob

We should get rid of or minimize of_graph_get_next_endpoint() in
its current form. In general, drivers should be asking for a specific 
port number because their function is fixed in the binding.

	https://lore.kernel.org/r/20240131184347.GA1906672-robh@kernel.org

This patch-set replace of_graph_get_next_endpoint() by
of_graph_get_endpoint_by_regs(). There are still next_endpoint()
after this patch-set, but it will be replaced by
for_each_endpoint_of_node() in next patch-set (A)

[*] this patch-set
[o] done

	[o] tidyup of_graph_get_endpoint_count()
	[*] replace endpoint func - use endpoint_by_regs()
(A)	[ ] replace endpoint func - use for_each()
	[ ] rename endpoint func to device_endpoint
	[ ] add new port function
	[ ] add new endpont function
	[ ] remove of_graph_get_next_device_endpoint()

Kuninori Morimoto (4):
  gpu: drm: replace of_graph_get_next_endpoint()
  media: i2c: replace of_graph_get_next_endpoint()
  media: platform: replace of_graph_get_next_endpoint()
  video: fbdev: replace of_graph_get_next_endpoint()

 drivers/gpu/drm/drm_of.c                      |  2 +-
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/media/i2c/adv7343.c                   |  2 +-
 drivers/media/i2c/adv7604.c                   |  2 +-
 drivers/media/i2c/mt9p031.c                   |  2 +-
 drivers/media/i2c/mt9v032.c                   |  2 +-
 drivers/media/i2c/ov2659.c                    |  2 +-
 drivers/media/i2c/ov5645.c                    |  2 +-
 drivers/media/i2c/ov5647.c                    |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +-
 drivers/media/i2c/s5k5baf.c                   |  2 +-
 drivers/media/i2c/tc358743.c                  |  2 +-
 drivers/media/i2c/tda1997x.c                  |  2 +-
 drivers/media/i2c/tvp514x.c                   |  2 +-
 drivers/media/i2c/tvp7002.c                   |  2 +-
 drivers/media/platform/atmel/atmel-isi.c      |  4 ++--
 drivers/media/platform/intel/pxa_camera.c     |  2 +-
 .../platform/samsung/exynos4-is/fimc-is.c     |  2 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |  2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  4 ++--
 drivers/media/platform/ti/davinci/vpif.c      |  3 +--
 drivers/video/fbdev/amba-clcd.c               |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 30 files changed, 35 insertions(+), 53 deletions(-)

-- 
2.25.1

