Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DD84C3A8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 05:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2456A10E93E;
	Wed,  7 Feb 2024 04:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="a2ApfRc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2081.outbound.protection.outlook.com [40.107.114.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C85110E93E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 04:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhhTQWxwenKS+av/JcqFAQK91V3IFU5x5bqJHNSJ+AD8cJGBPngPoB2VASuhvCYkUn5BDs+ofqUaipepV1OqnWqWpK5rRyKAmKdl/iQREDnS2MNo5wCapwFQLCcN56Hmdcu8gn3B40vNvFPseqzP61Wa92Qff5CEHy2IY93SmMNPO+Xrk1qmIDFXxkCAAaogQcu7/QIVYwiqnYwtySY1DGBCghVK3dvsuuudbSXeU1f3PCdlI3XnjSp0vsuU/1NQelqHn3gRtJ30PDiHIEM41CXvHeDGJP1jB4EFdawHXoh+dyPoVnkfLUCbj9532EPWWP96xIBXiynND0X+xsjRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrBUw1BWATzR6g0PWPOlP84Ez48OkFe8CqJi2JWgoJ4=;
 b=cPFXNnRoiFrGNAuZe76bYx256GvctgJ+30RrOvEKf7/58BdtkyEGYxXxEx88RXJ1ujm5qoFx350dZ58WMerUjVgHC9mki4AlkqlFAtf1/erDEaZHSP6yXS36opmIGbqrTt+NHIwlVBsu8qNOm/Z17KPpbrzEC3ob1TCn9/pfZ66oSmQn/sFi+C31QHyVfiOL+CbuKBxohF/cWtICeiU2nKyX+XGWTV9Q2QVlWAel9HhHkoP+jexP6ANQ8W0OAqV6gKWkP1hvG06J5cZZL6Fngwi+yRMtTu+MmmYFNM17H/uZFMxx0pINVnzqeQEIkrOFr/3skuxv9rgvLsbAZ0CMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrBUw1BWATzR6g0PWPOlP84Ez48OkFe8CqJi2JWgoJ4=;
 b=a2ApfRc1VF5v3mqVLzBcLwpWgzqYaoiwD2c/q+XUs3bM96prBKeMq155Eel09secSOmByBCOaV0DmzuNff3S0ms/qrCJDnCtPPkCojJFXrvZVoYrW8u/MVgiTxUb52O0VqKWs3MBCTcL0JBUilix3zBCr/TyUQMQQkbXov8Bu8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB8022.jpnprd01.prod.outlook.com
 (2603:1096:400:f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 04:38:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 04:38:21 +0000
Message-ID: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Eugen
 Hristev <eugen.hristev@collabora.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] of: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Feb 2024 04:38:20 +0000
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c31d17-41a2-4576-62f4-08dc27969d04
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lq2kHrgR4N17LqQsf7+SEMl4AJz/+G+EKinUmibE8tDVHCTSVwgJt8/nmraM6eJIOtjp7sIkGypo/qYECAgayNagbj27rT34OVYvNnfMYA7aoasuUN40RkTPOfPL02K7Rs121rcOJayW6W8g31z7BEvgo31S14Ey8ClJnZ/WNUhviwutPMAjhrd8AeGj0DzE1JCuGQTOTu5btp1eXiwIqpz1nG++Rle3PXgp6BdcXagUl2+k3BCsFR2Pe6wtaed65z71PeD07PRJegDUsn7dYSGz2WS9D2B5vlw8iEivjtTnyxbtULR4SygfSXQgySHjE2ZkBDmnKwmgbiGyXWNqbISk4fewPaDTx/TFbLusviBUD8wLtVTZXVuV9KQkJz7cxlqyfuMfc9ZFLUSycAPFbZL7vSIBUZwRJGV4kq+u7v4n+7pmJtxtxC3GtxT4oV1+YNWb8s8vsGIJhMVk6pEFvpxA0ob3aezsBK1ijoXpiYhinIvAy+tcG5WL0VTM3XVL2LYPJv708MS1/ydUsKfs4vJ82jOkT5XwI5xzGEpZvL7z99zkdSgtXyzZk3yQeRmG7tEOa5qMM9H5Him18wWqNzSEPEHLKZPzGSaSWiG2ntxgJNF6MWqgEZUztBtVyRrv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6512007)(6486002)(41300700001)(66946007)(66556008)(66476007)(38350700005)(316002)(26005)(8676002)(8936002)(86362001)(6506007)(83380400001)(2616005)(52116002)(110136005)(36756003)(478600001)(966005)(7416002)(2906002)(5660300002)(921011)(7406005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PWf11XEy//9PLTPxcqL5KbKt2BJnr+J4ROsMB2MgcKb/cwHf/1o/EEsJiju8?=
 =?us-ascii?Q?KVY+8uCbw7jqVxzh3glZmR0sR+Gkz8W54N+HB5Pkc5cueN9GUSDWSeVX67P9?=
 =?us-ascii?Q?Vo7yMdraoh7ekcI8Qc2piQVf4vbLnpIeXV/dXMHd3niB7hbdgFyyw6rjNh7x?=
 =?us-ascii?Q?wSxMK5ofGbCM0XNnujYDe/eNhANbOOZkjbiK8Pb+bz6iuJIgiyK73k8eIp6B?=
 =?us-ascii?Q?mom3/tEblx0xBrRx2O+QwfhDu+xMgVEuHIMg4UQYWP3QNT8t3Ttv+lPzyrLY?=
 =?us-ascii?Q?5CBoWfBz4ciubNCm+4RYdvvYVH+HHdwbUylk5gz08rSO4egJ1MM7aSRmSh6Y?=
 =?us-ascii?Q?byh0xO/WTR9NjODIAbYqVSFGKzyA9x4MwxWFExHGobalY5SfaCLql3OSvIEc?=
 =?us-ascii?Q?P97sljr6CJ2ig/o1EC69jMCdOc6lRuoQdfsP0HRhUrn07rQ3t356N+XvK+4o?=
 =?us-ascii?Q?2k8qOzt2zpzEpMo6Zas9p9u93Iz2zoQ5K8ibM1Tcnq7hBU/yesdkxH2kdAHf?=
 =?us-ascii?Q?tKkw6EcCFqp4nhArn40OtwqlkGm0TnNOkwyJWER+YSwQie54zjcH15YGdxy4?=
 =?us-ascii?Q?BwJCMfS0tWkFrSn4Hd6vQDUo1hgXcDaGMejLzDjvdWhm2O0BhNMBsAk9qajC?=
 =?us-ascii?Q?oE1TA+oqDgQQPHYnsGMJ074mZ9z0g2BHeem7IGH+f8HcHjQ4b0kZxiOJgRF2?=
 =?us-ascii?Q?/FLhG5W43u7SIApKo/8pj1nVnTtKLYs+ual9HPtu4nH+hJBcCJ+dhvRTFkZj?=
 =?us-ascii?Q?08DxIAF9mlxzifio31K5eWKQGdCpRwDSA4XEgV2VXtfrTWGzWDQTrTmFKahZ?=
 =?us-ascii?Q?UzaCucvooPOKUc3+1INeOnTZlkxTP+clsAtlOBCadFsAsFTRRIkfhv9qCz6N?=
 =?us-ascii?Q?h8mM/rKh9moeLO60xuxLkI/8MHMOH7omK1e1wEa5hQnMP0DZ58uFYnn1ZwQo?=
 =?us-ascii?Q?XHvjadpTa6ZukS3ICEwpGmRo7yJl6BMLCBmJf8+kYMqawO8C05HP/QQQs0px?=
 =?us-ascii?Q?5OWedEmS+hpGpfdP4Cma0Ghx9a0+msvUne51iAMFVNtP01OafQzj3YpVrGqH?=
 =?us-ascii?Q?VFD9JiONQ6Rn0RtHi12cNbpk1QFa87BKa1ERLdbkT4yTXuKIuEwt9RWRB/I+?=
 =?us-ascii?Q?+6SbDbb8lIwY9NGyJ79OugXFnpyRkevxZPxRZ0re4DlkSqeFAr6yecTYdHms?=
 =?us-ascii?Q?994qmdubf4XGQFqV7WpHOnFsGd19k7yH+TfXj7kKpKKKl9G+WZCne7MmNVAp?=
 =?us-ascii?Q?mvdVyD1+G9tz9KkPrAOC5WA/hgwFZqODVIOK7pP1V6Tv7hvvr9yRA3JTrbkw?=
 =?us-ascii?Q?suI8wiD653yRdJO2rpkaRAaDfkIxc/oo/pcyZOsuFOc9O5heLOPFHgWmHSyj?=
 =?us-ascii?Q?mIgUO7Oy5OZrXsvNMKHurjzj16ENJ60cKY2fFF6j/Tx96GU7PxVkyrVfU/Vc?=
 =?us-ascii?Q?dwPRxxtmfbysBjfK0JMGTXtnNy9wriliEHtTYDk1DsXxwP79YSXVNwY1Is1P?=
 =?us-ascii?Q?p397PjFVnyCu9WKETYoPo+NMIEwDv6fYT32eLO401m7sr/gANj4FWVA8vxqv?=
 =?us-ascii?Q?pcNbdM1lHRseEyT401dzhZnc+0XnpEtn1/FUacYeksaACBfD0R3K265VZiJv?=
 =?us-ascii?Q?+pAwiMff5Rwd7pE8VTWa03U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c31d17-41a2-4576-62f4-08dc27969d04
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 04:38:21.3498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3AvTF1G80SFy/58Hb1qyMunJueaabp3gynGthhvvVcu7e0ycHoocgX6AU1JR4tpsPlG+GksvjcNy3H50zkBobAviRFrnPGKZfW01NPYMK5A+IT3QY51P3C9ImLxTKNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8022
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

This is v2 of replace of_graph_get_next_endpoint()

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

v1 -> v2
	- add Reviewed-by from Launrent
	- use by_regs(xx, -1, -1) for some devices
	- add extra explain for drm_of_get_dsi_bus()
	- add FIXME and Link on adv7604.c
	- based on latest of branch

Kuninori Morimoto (4):
  gpu: drm: replace of_graph_get_next_endpoint()
  media: i2c: replace of_graph_get_next_endpoint()
  media: platform: replace of_graph_get_next_endpoint()
  video: fbdev: replace of_graph_get_next_endpoint()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/media/i2c/adv7343.c                   |  2 +-
 drivers/media/i2c/adv7604.c                   |  4 ++--
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
 .../platform/samsung/exynos4-is/mipi-csis.c   |  3 ++-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  4 ++--
 drivers/media/platform/ti/davinci/vpif.c      |  3 +--
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 29 files changed, 38 insertions(+), 53 deletions(-)

-- 
2.25.1

