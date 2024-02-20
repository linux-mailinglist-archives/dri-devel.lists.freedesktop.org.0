Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC8C85B049
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 02:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898B10E010;
	Tue, 20 Feb 2024 01:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="fzN0LOKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2057.outbound.protection.outlook.com [40.107.113.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAD010E010
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTxHxJtaxA8sa+G4g43fbu0XvvXcF7jNVXzxDX3I+EUIisaqzbUzIEre4Uou5LjEidXb/Y1xCVt8L9OgkTFM/HTlsi0lt082sV1PuofHuACSOw5TKE+SxT8UD7gSQm6ByntFosQG0xn6BOcwGqzJMuPaTrQlH1gp8yBrXxxY67e6wfoXVeFx3lel80gg0gPlUAdYZxoLJww5ni3E76LoIpEKWoryG2lEt5pLVZJWs6Hz/NidP11tNFOuo94OPgc1zPrYNbzRAFmeS6/FMYcvsIPJzVtvcriXuQpN5/nvd9/Sqxsp9G1q8xFzHRUkvPNAt1UhtvR7vAQaKoSfHpxyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s0I5LH7+wq5eXtbHjAN0c5fw6/2Na9YnGXIeaB7fzg=;
 b=eM98Xoqn8H3LyRXWsh7hL8hpJwWHUdsx0BhwE3KJ2kB0lDsgtU7maqh1Q06DwyjfaKprnFo8+y7FB87Yo2fd+BV/6AscphILcvPvDa/U9pj4Q6nf0lEFNIWx+zaJvHYO2b++OxMHOdrSpNaC5E5kfhFsCBnA2s3ONza0xu+aq5zv6NqVyE1YI444JmWpv4HqccEAMINDSmXxwAXvkqLkIgG4BouQgZOJaHRjHEhqKHmfMRfjj5ogcFRn1hvQ/uM1VLHRtRtp+zR8G+prqbDFO31nSEG3AvHcLJ2LYZc0dKMDWacCa8e8vAU+wYgnsjLCgTVrbdbuEcXWY2u2Q/Q71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s0I5LH7+wq5eXtbHjAN0c5fw6/2Na9YnGXIeaB7fzg=;
 b=fzN0LOKc5CO8CsyQgxSCt8RLHU7hnQFIdq16sQZTeze6EBLO0fLVtb2ajd0+enKIucdoPD5MD4uMCcpjoRNeTzFzVyu8dU7esfkbrQ7qUM3W7G1hwW1JZhMPwcrYkZ9bIlWWFC9sB2BX76CBMk5ZM4jQrfUwSqDrXZIytT6x+J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5621.jpnprd01.prod.outlook.com
 (2603:1096:604:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 01:13:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 01:13:57 +0000
Message-ID: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 resend 0/4] of: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Feb 2024 01:13:56 +0000
X-ClientProxiedBy: TY2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:404:56::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e267491-5dfb-4d21-391f-08dc31b13675
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGP/19dofZfMWjPj3zfzTotAyY8ajTJKzBRZcgeUwepBpkVpk7uelp7DUgZNegoxqPuEwTI/LxLmBf9MQHW0HfCGMOhFEwPyinHuwBJkWa0Yfj5cq1kUvPmLe+U/E4duooEzjAteCR2zSx1NhBkqpzTRZ8UDb31uPiqQTZrT58vmzuqNYWWR4hNrXMunJBM9vN49qbgLCxCTh0jWgVBaoRfLX5dDGvSNi+2VhdjMzc3391wS2apNsW+F5GTtVCAwrkRosJh+e4USQvlxPFqXz5fTVcyxXPp7w6401clemux5Y1ni4ZjZT+QpJFf13XrzvlIO0vwXy1d2IDa6xhovJHYM2qvQICKWV9gzOsVz2ydd/dGX2ff/sZhqx3PZyv3NL8QoSwNmH8XEK8K/SDv7Ce1Aci/ge50aTeZUtlDIMJ2j+EEYqCUJJT1eopwsIcdVKBVyYjvYWdvvVm+cAWUcI87ZL6gyFdSxEeRnJTLIU9H2SeA7MGOaPGvQO/yPIqq4vnWIOO6gkedLYKpA/dKMBjosqGjgKmZfcCERk876dSrqdnhVXEt7rvOT93CjU/ajeIBxGVE0zkWtt7gt7/YYgS439c0bVimL3Gwt106SvgYN2kjvCqfcDLE5pB4LqlN8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ay1QPguOQz5AL1ebYNqioZy0IpzIDgRUPedehTSiG+ZQlXjviWoQc6yCRgNx?=
 =?us-ascii?Q?XFPsTTO0cuwGF/fGhiw6QtbTgcWLU71eKJBR4idTpYUqgrpMLxoJGWVG964v?=
 =?us-ascii?Q?F2tu55rwi3GttoLsaM+9XgMdYvYeBpHst97PE9POrxhwsH49iOkpFtSL8K1t?=
 =?us-ascii?Q?Jg1EKtcAP0gP0rP5fOcIwMTQmwW11HRgjGNHspTBdnTPV34SVdq+G+AYRi5j?=
 =?us-ascii?Q?kVJfvH2fDwSN+ob0t+OWw9jqRbLn0UbFF+JQHv2M+PhO/6Cbe/orZfJLlphU?=
 =?us-ascii?Q?ohC1w1lUm44UxhSelhvVOj2gPVWljSj8+qz+d7nm1r4eP/NM27zU6BWKQHkY?=
 =?us-ascii?Q?IUrCPUkloz6ObcOC1DeyjgNE3/fzOyQI/utMJYIc//tphezPU9vHwSFNIkRK?=
 =?us-ascii?Q?5ePFc0BMc4lWDPO2b+8UgF+mZ8TGgATKDZc1wUX+/2jdhxbsHFVmpjqmq3U+?=
 =?us-ascii?Q?f4dH6/lyOrAAc8kJQeAOmiIATunTjz0gYUemORl8TpnIM4M+B6LMY8/zbgic?=
 =?us-ascii?Q?/SvGX72vDgntim2biBYexQ4lE3b1Lhs/rWgl7Ych9yOn3/CA9pBPu6/ZZfzb?=
 =?us-ascii?Q?cAjFRpH0b4ien24qN/jd/JYcR1Z9mGpPIKFJ+fqDB/lTuadLFvaVpiGEIybL?=
 =?us-ascii?Q?8hBbGQf4UQ9h5i/VXdgyQCuvbzv5Z2GhVwg4svcBBKwQa2Ra9/XBjL34eQik?=
 =?us-ascii?Q?bvIJ+P+QtLIIbT7VCoyPZKLmw6MfEVPMimaquoAk99fSNdgw/i22TJXZNaGB?=
 =?us-ascii?Q?PydcodfUEau0TkRO0N0FISiyQDcIeLnRYHA/SGj6BWevlEpwQwtr7+vpQHRf?=
 =?us-ascii?Q?kyktAZkuNfO+nNx+nkv95lQsPOii6rO7ZYSdkaBAQL59xmuOQAGfVvp696sB?=
 =?us-ascii?Q?aIKFskhrWT1E9z/rWJFp4sv+kCZ+VT1Ya6gpX7M99ft3pKfxOx1axosnIl9W?=
 =?us-ascii?Q?gee0Cz9oSbZFuEXn84dQUEVYG9LLXTCe0JcAAG6+I62/HY3bJCxZ+72jWoja?=
 =?us-ascii?Q?nuCh4G73pm4Jud4VK1qxnbvCGnC+oCnQazhTuqnhIANdGjWPCGTINbW9X13w?=
 =?us-ascii?Q?rJ80STBz+8txWUzXRX55ggqhKusS14ou1Vtt1gyhlNuCtJdNbxTSmBWVi4fP?=
 =?us-ascii?Q?7juZolYTdEKc6NX8v2R4+fs90JlGvPNp9wbxWS8Su3vnjQpZxw+AB3ODHRTR?=
 =?us-ascii?Q?zQVe8pdmwJHo0xiHjq8RqhIEWOvnLZfc6mDYT9J+T/GB4E8nEfY+b0+QBlMV?=
 =?us-ascii?Q?adO2H+YZD5kHCglTxPo4KASfeJ1ozM9oD7HGOX6gMcXihsvczgUROY4wGLEo?=
 =?us-ascii?Q?sWx2haKtI3/3fUUwXeHq3oSTdNO1cK0BdcOVf4VJmd/t9jSPla94aUh2PMiw?=
 =?us-ascii?Q?RjeeNdv1J0FV6VNL0JRqYqGUoYNj1pubpTf/V0dSQuzWA19+yVJe8xBysGiQ?=
 =?us-ascii?Q?Vnjbv4WawV2VqK5JYsn0/kZFlS3Hc6pgz68nJeQ3YEuVY6gXVCbaRekk7WDe?=
 =?us-ascii?Q?4wHKO5izxV8dJ1f2HiOzm1xIMDRjThHH+tJOHLB9vRyVMVFWbY1xelTaHtaE?=
 =?us-ascii?Q?uWGzVEtAN/0kWeVXjYlG3Inpd4kgw+kPg2MEeJ3Z+2m5LfXs3u3kPMmE1Jwk?=
 =?us-ascii?Q?JW5zu1DDgS8B0BwhrFqjA24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e267491-5dfb-4d21-391f-08dc31b13675
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:13:57.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhaBo6Ov5BvJLLwCuO7Z3rV7yjJFojB2au9vCS1CLJZA+7KkGNkyfUIosdxck90uUBXMaYKvePyKNzeefJR4ufimaITqbgGAuJBAH7keFpkwLQU5oYyCz9SXfdjhjv2K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5621
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

This is resend v2 of replace of_graph_get_next_endpoint()

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

