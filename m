Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8625888982
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 03:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D31210E4C6;
	Mon, 25 Mar 2024 02:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ORA+ij9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011008.outbound.protection.outlook.com [52.101.228.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4809510E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 02:56:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lObyjO+ebnYUFRH6vAwM3TTMRG3POL45XtAaaRFNA+16+u6YpuDT6gCBKgZG8qO18OvxLipObdGcxrucx2Bm76XDIswltRbIreRSb//uW8sQFQqK61y4iiKOcXdB5+f13KmRm3TR386wzBAHYSwTCVyzBF/jlh4i36R3kTvFxQ6lrBBj/NQDjiyJAfzrPgf0wcEHarFO1yHheyW9yu1Jcq4UaxFhlD3iRP78+dJyh/leOS8J/yLf2d61W/osyBXLypTp70i1V0cmqNrQSQvEnYEBknNYQncin/8ipMTVOYFyuPTCAsM//nHA/etBJtcuTmjceTRM5y6NFEKgWS9edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV5QCGo/232GQdRXFLBDTHJ6LKOdjP3Qf/6uOtwDCZA=;
 b=BBIBcYYWSz374mHYt78UYuol9Vgh2PIwVg2kZTobjf2aLItkZLT+cBrYr/SGDvrz+8p1GzB2s0JAcZSkPlibfZZxyjWVDKRLn4LkSn8LYupgm3m6jjA6W80a1/4oSnlhzrIq5lUPSe2qBStehPp2qdCKqY8qEGBsUIyZwzneaFR/shD9EunmMQAqXMUrM3IuIz/OR1SaDdGVXD1S9YEkl629tV+YBK2PFEYfYA292C9tXe8EstzAYLZ0sZ6dsmH1jSl/Rk+Ko1pmMo3OEoAmFk0m5WB7qi1CvpleWi+XvtTr2N2PhOqv2gGzFgng/XNNPqVXANmPSp5/BLXhHM62dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV5QCGo/232GQdRXFLBDTHJ6LKOdjP3Qf/6uOtwDCZA=;
 b=ORA+ij9z70pHMQAy+H4QhuKjjB3ed21D6+Sl+8LO3wOcfSraw34ESzJee1zoEj1m0hR9muDxo5jQCiLMzUwnyXlJOl/VQwvLVdJKp1E7j2DKOCM84TipbIFBgHrA6hjEXPh6M+6F6kan0k9kqCafWdHrdxBeOPvJfAH4fmGHxGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6831.jpnprd01.prod.outlook.com
 (2603:1096:604:13d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 02:56:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 02:56:36 +0000
Message-ID: <877chr6mu5.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] of: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 02:56:35 +0000
X-ClientProxiedBy: TY2PR0101CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d91556-27b7-44ce-899a-08dc4c772f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 70EtgyRIW8O3CAzkD0ReScL+49q7Ld5ZRRoyLWLidKHQKFvo1eXwD7ZIxXnKNudbluLeWrvFIMk8vt4qR66F3Rz/fi6IRqyhfkC5nertnhIOuU4FWwhkB7hzuj0z06ZPHEPO0BBNZmaGOaa5Gdww64vm2aaKdGs4ctVAfBYOH8s7xKJ1Nd0hU285rciVlBAOWJsRNhjevJcGFawQfbSDiE9c8qFpvHT9lA1aGZkf32JWyPkK1PBRZz1CsFf+wF5IXH0zSkBaPvGLjDJFgfW2+J3fiS37FM7d8YFCnGBku2gKKyteMyKI+2I2JskoFGES4TzDfL+SHTujYGMBirE0p4zbe4qp2m7lJLeANO+mWuNtRmV5sBzEmOzXMZfpDAV3SuPXId62HAuQiJeXJgKHkmJz5PSMlaO3iqZyuvgQymc3fuhc0wMFqWSLL5GeTdFnL0v4BJ1RgcOLylA03eoBcvTkhQyX5N6HydO60Pm4ec9njyz7R68Xn9RVuys0avKK9UDFmDTqOR8+CeM7qrJqudSwcVs7Hlk37c65GgFfZpOG5SzX77EwiiJxpeofUEgkEPbmRlGAg7I38azQyAmX7YO0OQVyYihKHyThILDvPQB3vg3CxvqT6UiFE+MDbxeY6wPzc2OdvDRkHSuO9fhvoD6CHgA8rb7ruRBF/2pyTx4cQ1oPkHWU54ym/0U8HEck
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(52116005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7rPw/bH5D4TJg/CH8EqhLFCqT29xwgjXckeH3a5IBphhhb4qT+UFw7g2Cl7K?=
 =?us-ascii?Q?mc+4Gkszy6efRQfrDEIhOEGTGAlhioCFFrGou3HXwGvvfK/vX1BkTnkFDEVm?=
 =?us-ascii?Q?q2jG4kKPKH5J4Az0gem2ZCIXNBD0LXki1iB7E1CT2VcCl1hvw4Ot58ItKx+3?=
 =?us-ascii?Q?ZsAvC4hpHYNTO4/BoTWJt5cGM7LApyDiDtqJ0fOPxGZL3zzrOgOXvwt56lZn?=
 =?us-ascii?Q?cjBuRbIsR2J1hhTnR+MM/HNBtgbvp7cH2b3FUQIimtMLXLIM0DxttK/fSrKs?=
 =?us-ascii?Q?VvwcnfkK5Bbp+cQna9WnB69bq5htYyGIENcXa8yJxHEngey61GVCB+lNiMHe?=
 =?us-ascii?Q?FAbaxvevPFUSJ/9w0+Kk/ZieVzM9z8uPpYNaQpVedzPkSI/G0sxrjMtQti6t?=
 =?us-ascii?Q?WobYiydQ8DGJmV6OXfzB5CjZWYNH0I8+4eFaB2cp7/LRKCPW5ZrF+fnDBxU4?=
 =?us-ascii?Q?ghdvYzfE92nt+zQexH5jAnrp9Li+pz8PLT9yIGemhxL3SHw/sNywjblAEXEM?=
 =?us-ascii?Q?qNQLlRUAavXXUEtpzCBsKYn17mA7ccNzIezd68FYOvsJLzqIYwXapQQAKdz8?=
 =?us-ascii?Q?/n2eIL1Ng8oV3d4L1rnVwEJL5DJ0nM0m95zcXPJ9k7HDam/nAuCFMH9rpy50?=
 =?us-ascii?Q?gO11Ij/7bzysRCeoV9OZyLeWzyZaW1Oh5x7J2j5C63KJpz4af3s9FmWCqqDu?=
 =?us-ascii?Q?6/2T0l9/xm7iS7NEK1qdz8fnmJ/uDSSTYhSyrw3gPQhcRbLAt3qRlQ2eYUdn?=
 =?us-ascii?Q?jCwC6+8iLXEE04v2ujeFxVXJZ7occQUs+A3wcf/aG8/sJLay8yUFynkCLSkJ?=
 =?us-ascii?Q?bXqE/TBBid9p7WsvgOANv9shKjQTRKSxrNX36Q+k3KGmwsdK7AvQwgWOHtgV?=
 =?us-ascii?Q?Kar0KV4+aVfVJdEHgwuYG/RfslTpvdmBLDgEy98XNVlMxakK1LHl6KEDawag?=
 =?us-ascii?Q?I4UnWkUt2i2RhvJzMcSHRMS+81VduqLP9TUwdc417K0uTlQiF69A7faZNADi?=
 =?us-ascii?Q?OkAnxTDqqseK1XWW7ckrAVTkQUJ6ij4UttehAqmC7GYAyYpFdvc7h61CHDxd?=
 =?us-ascii?Q?egrm8gPhPEB+N6eVyg5/9NiFpohcIzbFtXXYL9ntca/V92DwfCGBlNkQ0pH6?=
 =?us-ascii?Q?cSsmoE0FdQjnAXudm1k7bH7hEzmnIcol6b0tuAGzLY621Lh3uwzwF3XmYrxv?=
 =?us-ascii?Q?6Wb+TmIFs1ZHXgUjI3EBB513EWWMpoq+U04WqGvuj/QZJcN9/aNR0hadpAlF?=
 =?us-ascii?Q?VdZCEczDoAaHhR41vybCbf+qGbOHejhhgGrJGfy/mqPc0AaUwoChBJntGqpy?=
 =?us-ascii?Q?S7oQVPetYtSx5PJ15rgjo9GvkpYwN4VbUO6qHwn14L1jatSPk7TRX0CL38s9?=
 =?us-ascii?Q?FrhJCC5lk4fi2snZUOIeRk7vPrddU6Fhytit5sSKx07vzewFs8MERhI0h8Nc?=
 =?us-ascii?Q?EHj1i9MAsiHhQ/96d2Bmej83tfFTHsdL6qJhi3LZK3u124xEm1aVDi3m3/fu?=
 =?us-ascii?Q?OJ3DDHuMBMqo9WEEU+Ape3FK2OBPPYDaQp8CkmSDJVuSd/5+iDPzNr281rtW?=
 =?us-ascii?Q?P3v4LdX8KCrNIZxHMCL9iJ7nPEEi1SWUpl7tHu9y5gvGuwipG7VxnCWIy8Sv?=
 =?us-ascii?Q?NZUT/1UZ1nUL28gJZerQ4WM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d91556-27b7-44ce-899a-08dc4c772f84
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 02:56:36.2755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMggqp4ze9He3eoN9AhqtkTOY/Ijoz37tRjFN3j5yDx79ZgJmNWAHXhwIl06G9yez9C2C7+AdSDOyJnTMzir0h3RnFFVKArImxzWYzBnojt/pqRozJX1HQ1JTz+OIMrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6831
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


Hi Rob, Helge

This is resend of remain of replace of_graph_get_next_endpoint()
(In previous patch-set, media maintainer accepted some of them).
This patches are for GPU/Video, I'm not sure who should handle it.
GPU/Video maintainer as Video, or Rom as OF ?

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

Kuninori Morimoto (2):
  gpu: drm: replace of_graph_get_next_endpoint()
  video: fbdev: replace of_graph_get_next_endpoint()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 10 files changed, 15 insertions(+), 30 deletions(-)

-- 
2.25.1

