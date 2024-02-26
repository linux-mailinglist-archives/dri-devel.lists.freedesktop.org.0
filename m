Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51886847E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 00:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC65610E09B;
	Mon, 26 Feb 2024 23:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="mr4ZSjxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2082.outbound.protection.outlook.com [40.107.114.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A386810E09B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 23:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUuj+bu5a27KjFJNx3h5OBRRntkyrX7K6m90fMONgBg+qgwZ0JM7cvxUfefzBk16ZwRjOi5hPdD4mdDy0CBCEo8V8ElQXFNeQbMZT94J6L1QOw/dzFpg3h5cT+WtK+0tH5JzZONrEwvKm3212gyaRSvQKAlKg02Oc3ZMS6W5TknIjDPdk34tf+TQXRrs34RxcUuZw7q3U9M/9UXuiozU5IAyVBGSNGi4ffuQQSJpYeWjrVLef/6KE6fKWEON5pDty4HXhhJb1UPl/np5oBd47bysHe4e79PWtdeQyH5DKkDnL1/JwCLgd7emXRrC+wpgg7dSx2vx2WA3ffCPaJXT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXXugxo2ZUfHCg6UgagQdjvhdJ+zKAazECya6dQvmgM=;
 b=EFUwjXoG46bav8zl3O3V+lHE9lpVQCiC2y9VPaFM10GZGTZpNKb4SUNQrmiUeTkJRMDcSj6z3SdfgD/Bzb0iqFf+V/cTHptcYr3OAgeCm5U4EHGhfEQCUyXzt+GyRQBdFuYFiwtlvSWwxHilKhUTYogl40COP0vCySQrr0KkEUc0Yc3+X+5SXHjQjJNYPFbxi5lnIyYwN3drFEPOWZT2TYBBd7NM+nGxOaj+ep9Lm+KYCBXEsZN7Ez1d3EsukTCN48nxo07k0EflNUggcMiacxQbQdQK4KvEGruTZ/3goGgGKmSD42nnJLSXB/wX/2VlXISKeOSnmljkbjCZASMIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXXugxo2ZUfHCg6UgagQdjvhdJ+zKAazECya6dQvmgM=;
 b=mr4ZSjxH4ZYez3Kfgiby7MSbmA937RMnX+JGvhjBQYtcnaIniJZDEH86d3EXQ7Ov2RSDh3FFdl9o1ZzTKEfC4KBClHFCEJdfjQFHHmAVzsNaCv8/8yBmxG8DC550dG7WLJdpY/fKAtibEvpRJa2iREIGlZX1QVuJ+83FEzI9l2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7966.jpnprd01.prod.outlook.com
 (2603:1096:400:187::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.23; Mon, 26 Feb
 2024 23:11:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7316.035; Mon, 26 Feb 2024
 23:11:07 +0000
Message-ID: <87le763jp1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>,	Alain
 Volmat <alain.volmat@foss.st.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,	Andrzej Hajda
 <andrzej.hajda@intel.com>,	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Daniel Vetter <daniel@ffwll.ch>,	Dave Stevenson
 <dave.stevenson@raspberrypi.com>,	David Airlie <airlied@gmail.com>,	Eugen
 Hristev <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>,	Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>,	Jessica Zhang
 <quic_jesszhan@quicinc.com>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Sam Ravnborg <sam@ravnborg.org>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>,	dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,	linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org,	linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,	linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 resend 0/4] of: replace of_graph_get_next_endpoint()
In-Reply-To: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
References: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Feb 2024 23:11:06 +0000
X-ClientProxiedBy: TYCP286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 53eebd88-bb3d-4ee9-6917-08dc37203675
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4TLuMdZe2UrGbLSwOMX3qAUx3etUFt8/ebWO0RWLuaX6tHc9HoYv0RHfF9/pRmW6t0Oi3AUQpdWuj7OM1uzw6NJpNVc4whpsG2qPkQbsDj4FQ4kerQ9kKPe8Uhf12FiPSKqF/LtadEEnCTPYC9prC4EvUSGSYF3xS5hNnJ+SjqGfRLhskerg2oM+Wv6Wm9bhH628u167hZ/YeL7da0stNcb3XGezQAU3jLahupcYzmEwqIIouaMq3oCPxLR9Bt9TyVDR7DEiSVUmCbXnXDKjHpwVd4HVag/Qaz8awf9A9HcgFyPN13/sCf0alZDQzW8a5BhFWIzCBMCfczTJQLWTKBUiyI3Ujt5fky/xVztVMWZ+FpxkUhVImTwozRRgoAn/lBZGGZM7A1cXX7bL+Txocb4sPtFKdOfpErHWBYNHGWnth/G4DE/ujyxbc7vZgCjneicskTehX20ybdDGcyzHKpBvvYBUbxRgGyzjdzticbNEe2PIdmIz8KHD/PusfInuFV+FowSePTYqz8vFCTQdNywEV7OobKZdfb2m9E2Gy6ltHDSf0vahLFXgwTpjhQ6M5XXehzBf/2KnMRU1HVqkuHYnA4UlC8oi5AgKxP0hKVEjaUZXvZ5Nf9SwrrzzJ2RPuTJPugISOYENDFznzhaIGnt5sr5I/tVb06R/AcG/qFivAQ1T4YNhqouSfraJPvtGIUdnYh5+mSx1kW/OEuZNue0HSimr880kgVD8IbJpB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEwKy6rg60KUjAcH9YvnN1Za0NwkPQuBmO5STcUdhOhmBeKccUbuYcna9rYt?=
 =?us-ascii?Q?PgReV3arQFEY3hAWsQqRVRGqxvSFyEVuSuS7UH6/Uv12BEYxqjhSmsKKWSR2?=
 =?us-ascii?Q?7YvYT/5AioaJeEMEbQAi0HpKlkgzvempl1DOXg0I9mAv0MMajUdUhhy489Eo?=
 =?us-ascii?Q?+etYryFNexKWtqdVLgT2LsQyecMGZCB6AVelT05XRqY8UvbPg9Dmh5GRhX0u?=
 =?us-ascii?Q?X/P8jxUBuiP4+aos4n2NiItF1KEC+00VtztOroLREEOnNSkTb08ZOJc0SORE?=
 =?us-ascii?Q?Hi6jQGSygllbKF2NXtwHizHB1zkCX/Kllg/cjMlkh4Y1+yiabCeWKUA6bHdW?=
 =?us-ascii?Q?mIi9PgYTJFDVNZQU6x4xsSVt2074ln671ex4Vnm9vreqUXpwpzz6tpIalfdK?=
 =?us-ascii?Q?F5CXwhgPnrjLYS3mrCocTWtCkctRI+89XoMzjD/3xANd3PaDnhKgU0zjz8AC?=
 =?us-ascii?Q?/SYhN/E8JWuAreu0iACM4BdlDXGVneEJQFsbqA5UdYuCVRGK3Ayn6va5jKa+?=
 =?us-ascii?Q?0d8PF+2qoHMfg4MR9vh8xiuhwIqPyMiWrVeyjxLS+rEO1wuqlkl10Cfu0ee6?=
 =?us-ascii?Q?U8dikBFAigIwn5Eu6YjmzLRJpCScegnoV+eGVq68AmqY9brb8G7qFsRPOHbc?=
 =?us-ascii?Q?aiSFTAIijTQmd06E3WbGmt/0e31Kd7Y2cTkTxLRNJOHGAJGcwsXitKZk64Aa?=
 =?us-ascii?Q?aAQL4SnO/kEekmO7xMqYXpmjGFtFSoqaEdIhE/G2tnQ54ci/4J/Zjn8n3auj?=
 =?us-ascii?Q?bJz3qm27GPVNNYsODHTp+XmUfAbV7wmFYeUnI//5U9i+EZReeKVGXYh5/5f1?=
 =?us-ascii?Q?zAAujd6ni9RX7y72oGcj/r/5VmvuW+kkj1L7ZpnlMb7HwmHoOSlXQZnRv+4+?=
 =?us-ascii?Q?yot4pRfhR6L32akqdDeFbT+rc6m08Jtc/Bqc/aOm4mpyZbPbywo6XXLZJk+c?=
 =?us-ascii?Q?eJoWrWTyyba3Mhg5rus/1Qh6OdHmZsuARRoZVBqtQ+Ec39dUVKq8udfJmf62?=
 =?us-ascii?Q?15WO+vBpPAWZSOpa3P2LVTDliM8oIDTLVG4O48HQMoeIt6OWUpIY7/t9ZPo1?=
 =?us-ascii?Q?rdixf3neqzZuKaDtUNv/+Z64JVoBEnNMtHODRTsV7OftJpwmssHPQbBZKvld?=
 =?us-ascii?Q?z9/p4F3Yt1CahJzMMJFDXbI7thDhiPTyGET8AZhu+GVdeEcP6fSi6oKa368J?=
 =?us-ascii?Q?tvuc79ZGcKDYky9YSIJjXuBRIXrrzs85yUTSNnCIGxOWRII5rRBUMknNboGv?=
 =?us-ascii?Q?gCDPJefQ5c5ePpbIwf6kYaTJGVIMkJNs/IKsW03tw6a6vdx4pDISR1aHKlHt?=
 =?us-ascii?Q?/FtEdi2o0tRzeUrsbSVPEre61jKu7kyjHeAeFFLj3HqcSJe46pjvx/a4fwW5?=
 =?us-ascii?Q?jxhqb7Yu3YQHAG7oHxlsbK2/RHUhTkGfwxEcFBrMcgtRgwZwVM9OMEczsnjn?=
 =?us-ascii?Q?3VB1BqOyO5B6pGQzcfuedsO4mPBH/lx0M823/xeURRpwwjcwfjVxpTdfkT06?=
 =?us-ascii?Q?QcVw+lYhHQwaKY6IMfsbMZipVUhIe8LU+tx/hKT/fCRgK7TWZVy6zo6R5yuJ?=
 =?us-ascii?Q?7Tw8kcyGBO2EJ6pZ9addj4MYGdQIztnFdU2PHYidWQnz64NTGq0M2tZg3LB+?=
 =?us-ascii?Q?p9jDzkJ6qb5TRU4MRBLuxl8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53eebd88-bb3d-4ee9-6917-08dc37203675
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 23:11:07.2907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOC9MiyOud+lfwzoUJHTxct0UaPpJ/Ghhl0bTvyDE7jqIrq2Ko3osbhFIr8cgx98DPwqxHXhvfdAxUp1jZWO+ix+Nvn+OhY5vJnTeZlOD82DQ5NULR/wpaTpn7jrimv5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7966
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

> This is resend v2 of replace of_graph_get_next_endpoint()
> 
> We should get rid of or minimize of_graph_get_next_endpoint() in
> its current form. In general, drivers should be asking for a specific 
> port number because their function is fixed in the binding.
> 
> 	https://lore.kernel.org/r/20240131184347.GA1906672-robh@kernel.org
> 
> This patch-set replace of_graph_get_next_endpoint() by
> of_graph_get_endpoint_by_regs(). There are still next_endpoint()
> after this patch-set, but it will be replaced by
> for_each_endpoint_of_node() in next patch-set (A)
> 
> [*] this patch-set
> [o] done
> 
> 	[o] tidyup of_graph_get_endpoint_count()
> 	[*] replace endpoint func - use endpoint_by_regs()
> (A)	[ ] replace endpoint func - use for_each()
> 	[ ] rename endpoint func to device_endpoint
> 	[ ] add new port function
> 	[ ] add new endpont function
> 	[ ] remove of_graph_get_next_device_endpoint()
> 
> v1 -> v2
> 	- add Reviewed-by from Launrent
> 	- use by_regs(xx, -1, -1) for some devices
> 	- add extra explain for drm_of_get_dsi_bus()
> 	- add FIXME and Link on adv7604.c
> 	- based on latest of branch
> 
> Kuninori Morimoto (4):
>   gpu: drm: replace of_graph_get_next_endpoint()
>   media: i2c: replace of_graph_get_next_endpoint()
>   media: platform: replace of_graph_get_next_endpoint()
>   video: fbdev: replace of_graph_get_next_endpoint()

I wonder who should handle this patch-set ??
I'm posting these as part of "of patch-set" (= to Rob)
but does these should be handled by each driver maintainer ?
(I believe all maintainers are listed on To)

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
