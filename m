Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5185B88D2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 15:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBC510E8F8;
	Wed, 14 Sep 2022 13:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2076.outbound.protection.outlook.com [40.92.21.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE9410E8F7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 13:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6O+nf/DGd+zBK8iRK/R3dAsv0L7JxWkFpfkVMTRoCbd19q9lefJupR2p5F2Tywjh4eATGJAlpOqGGVlUHd0RD7s+P5asOvcOn73i266zH3wulDuIUae1TLjqCFY2RsP77shgsyej9+AM49c2v4kgnhDrfcGnSr2GrQSKbsgLV45+arWd2JNt5ZVM+6zE0+n0o0ssjEv9x350Z9Ani1zakvMTtamGz/SMKMsorV1QHSUTEDwU6/N1R1aob+TNTS6Wzr4hRNbo3MIt81ywtzG62AInXl2v5Ykk7dZySYVqKVN5POqEfpfHDpe3O/TXCww9KVkLrDOHdW/6Ai2oSQdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du9Nq7qHl7hjv6dGRhsXCIEkZu6Y7YSdfi8tBygltGM=;
 b=hCtlpQygeliNQgi+wiHJS2lp21rYNMbQaAil7ajk8Xg9yauP9NOSX7XItgepurnnvUq9Dd/Ctmps9R/bjkjYh4g0B1mhpXlQl+5DWXX5Xaxx9D7VVBuc4tzigWCbd4qqhJta7+nTjrk10sgb74n7gMHf//MOtZEytzyds6wP617svoTBYtvVhWy9E9qxKtV9X5ytplsffsGyyWD5nXmZq73RHnbxkQYTFrMV4CYuHvxPrekAaO/FQTZY3bun/PV+KiQKGn0hKzTfdBqWCuzbhK10bFVW3t9rJTm9P9bfjcS7LNzDsf1uUZN9Pos38ObR/6lkfAxpIXWv9aloj15qJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du9Nq7qHl7hjv6dGRhsXCIEkZu6Y7YSdfi8tBygltGM=;
 b=d44koIWaB02UwVqLj3c0miGllgwF/pXYaPB6h8Eqgpr6Hk6M//yMY3CURXpSxxmm3MGJVj2gHC0jeKqfJCVbU/kT/j19eWT5YpMECqmthQ+0N7Q5zdyR2rHKh85fmf3OU5IxtuLAnwPIhSLDBGnP5ysSRaP5rUzZMBXiU2p68qzbtaKsSm6IAXvvXBJdGtIaXx4Z1QvcFFn5v7AOX6jskhiLCUYeZZbyBPxLMWUGrj5tPRgZxA9ojpkRNty+3rfjRy1TWN0hRoW2N+OaXpogg7iUROnwb+NiYhpxekA4if3bX+RhaFzVia4N6jeBn6rLvsjfmyPnVuC4II6xJYW+Hw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by PH0PR06MB7673.namprd06.prod.outlook.com (2603:10b6:510:e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 13:04:21 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 13:04:21 +0000
Date: Wed, 14 Sep 2022 08:04:18 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Message-ID: <SN6PR06MB53426F3713C84EDB67F65133A5469@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220912180242.499-1-macroalpha82@gmail.com>
 <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
 <20220914064927.GS6477@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914064927.GS6477@pengutronix.de>
X-TMN: [rKuArmgLQ047UXHoBjqaJ8T59M0Uw05N]
X-ClientProxiedBy: SN4PR0501CA0119.namprd05.prod.outlook.com
 (2603:10b6:803:42::36) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220914130418.GA67@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|PH0PR06MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 237f0d91-31a9-4cb1-95da-08da9651a3a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: My+FMj0GhmAK1fbfethssG0p+ua44I3VQ+oHkoNFgw56glfBlqo1ZWXKSycnMdlN9smZqC0ayAYp9BivCw1GHJnCVgKAhY6R5hwuLPTYBMhmKKT9e1BBqyPeCgOyZW1w0V4pyKxQc1CZm5OvQppRZcisFvJJah7uDRYgwWhHdDfDGeZisR7dF4KhuUdUHUWEeuOSzEVhoUxM/3ZCPYTgXpBV6e1nu9StY911lQxJt23VJQG4gqx2j5GyoCQnZOl+y2u7bmVdPpbKUe+9lG9kw3fnfSoFMxgHRVIvkZ+7Zpr+qw4aqJBSwOiDLXGQ9F33dieGQSJG9cG8IYUyoEHniDCZnrLl/yrTUjmnGISIMcmcP3xhaVQyyvZEJnqZWJE0bFq1tyirRDd81Lw2Oa7waK8kgwBRy2EeDiTP+OQtv+bwyBtPiLhZUzhxVqW6Sz6i3QD1uXxUQwo7cCMtLZUOjcYlufy5b5NZ0zDIqx7pPgDuxujFaCJKoJ21ICrsJOuKpv7rsWBzCN3xzkfkSRgWmtHy061m3w4ZcRAB5isd90dli7MYFZO/sZOisu2Xi2hjl1lJC2orwj6KWebx4h6beaCG8V3UUDuKhg6V/wr7Ck9Zvg4OaAmaREW1zEDEakRWDw3yMCaBoFn70jo/WQKJmnxITm9/IWazw+/JdB8GWds=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rteFgUnha4Wj3RZEdSbDfgOIeuYpPb2XSmqrejhPxKDiVoDJh0Cc1TgPyC4K?=
 =?us-ascii?Q?NZwQaHN7o78/OzY7iE0+wBkYXG97ZWXnmj6nAh1eoiWkzmRVbq8uBa7vsjEt?=
 =?us-ascii?Q?OhIn/y2vlZFyaOEDbg2FuKhip4Q/NyerU+gcuiPWPUMao86efPjhRlBRU1n3?=
 =?us-ascii?Q?j4S9SAfI76N+orgAdb4gKCuiG3SmZQAsyctaPilYAc3XUL1cs87o3QruDc7E?=
 =?us-ascii?Q?djq/fD0ffoqFyIhoM1FUhdph8REIoOsNBruJi8OlJxSA0uuUrGKCOxASb8y6?=
 =?us-ascii?Q?8ZqUMGCMJmikdsZFLX+Xco4MEkQBLj8TtxjnIWC+MamvB4lzSfzmokaSw/gw?=
 =?us-ascii?Q?8HA3t7IA2Dq9DfQ2mJzD0jkkIHL8smbf/nDwcoanpQgAOQCM+Erqa4vnJOdH?=
 =?us-ascii?Q?N+jgQmyWXkERWUIHve9x8d2aJd6Mg+uPUG2cXtyQrTCjNpeRxFWEYtYhq0ij?=
 =?us-ascii?Q?Qirif1leW/fsvlE/cnOAa8JM2cVpIlozYYGjlN4Mc7o7WOPEuo2Ng1p6pRJN?=
 =?us-ascii?Q?VVRhkTY0bOyh+aLpbS9a2e5pV6CJkgOrvlzAPwf7e1/eDd9eOgEw6pkF1CRb?=
 =?us-ascii?Q?jUwFzPm5LvyAGZqr99L+p2D4XA+C8N9Ud/lnFSHzyAjGGUXSXSuDCZoPEVoi?=
 =?us-ascii?Q?RQSC/HS03DjuIvGRsOeYS9aMkT0YxpbcJ88GYdhVFQDLVsewdujPNQsCnxlM?=
 =?us-ascii?Q?mxFPwH9b+3DeJyXwKSrh3wbmOaGW3cwAIFVZgGs5tKgYv292DuP5RmBPBx9i?=
 =?us-ascii?Q?oiVQ7C20hvpmSu2s/hWa0E0wHlePmprdqAywMlE0Yk5w+dcyybOp9QMyXGyJ?=
 =?us-ascii?Q?YoKqWi/rizpcZ/v52U9Us3wckdboo64mGxOEqg+4TyotyyHI2+N2eqbRwJEl?=
 =?us-ascii?Q?JPm3IDUIuPpMPO5G22YmpPWxHnYyU4xFVpGbIJW2yN8m+N8j9Fh/mxuj+7cr?=
 =?us-ascii?Q?jTbbJRXxlmjyciybENt3sgLRqvQSNRHtHwnVfN6ynHmTgH8AXPtLokxRk4Y+?=
 =?us-ascii?Q?Gph3v6Kp9aHzT5pOAemqTrIqBlbN26SYYjfbsqT0SXR7pYYwinY9g/Q6+QZ7?=
 =?us-ascii?Q?+K+BZcdRROaw00w+kUQu5GI/UHoGycjtKoQwA+8LdjNldA9lwnWD9GDKvYNr?=
 =?us-ascii?Q?YcZoMhaewHKuH6/vxZXwxaiszGrQGZoJekfe8fajQjbd04xyH+9xlOEgTv0W?=
 =?us-ascii?Q?0nBHXFvy1GlhDCh9uXo+vRY5wtmWJ4h/Q2ObxvMKWvGHQ/2C9ZZ/t0Fqh1ti?=
 =?us-ascii?Q?slC9y0Bv0yBJOKD6CbN0JLWLQAW8HsRs6/MNzcWssg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 237f0d91-31a9-4cb1-95da-08da9651a3a6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 13:04:21.2842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB7673
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 14, 2022 at 08:49:27AM +0200, Sascha Hauer wrote:
> On Tue, Sep 13, 2022 at 08:55:22AM +0200, Michael Riesch wrote:
> > Hi,
> > 
> > On 9/12/22 20:02, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Cc: Sascha -> any thoughts on this one?
> > 
> > Best regards,
> > Michael
> > 
> > > If I use more than one VP to output on an RK3566 based device I
> > > receive the following error (and then everything freezes):
> > > 
> > > [    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
> > > [    0.839191] Mem abort info:
> > > [    0.839442]   ESR = 0x0000000096000005
> > > [    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > [    0.840256]   SET = 0, FnV = 0
> > > [    0.840530]   EA = 0, S1PTW = 0
> > > [    0.840821]   FSC = 0x05: level 1 translation fault
> > > [    0.841254] Data abort info:
> > > [    0.841512]   ISV = 0, ISS = 0x00000005
> > > [    0.841864]   CM = 0, WnR = 0
> > > [    0.842130] [0000000000000250] user address but active_mm is swapper
> > > [    0.842704] Internal error: Oops: 96000005 [#1] SMP
> > > [    0.843139] Modules linked in:
> > > [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
> > > [    0.844013] Hardware name: RG503 (DT)
> > > [    0.844343] Workqueue: events_unbound deferred_probe_work_func
> > > [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
> > > [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
> > > [    0.846399] sp : ffffffc00a7a3710
> > > [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
> > > [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
> > > [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
> > > [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
> > > [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
> > > [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
> > > [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
> > > [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
> > > [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
> > > [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
> > > [    0.853048] Call trace:
> > > [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
> > > [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
> > > [    0.854118]  vop2_bind+0x89c/0x920
> > > [    0.854429]  component_bind_all+0x18c/0x290
> > > [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
> > > [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
> > > [    0.855639]  __component_add+0x110/0x168
> > > [    0.855991]  component_add+0x1c/0x28
> > > [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
> > > [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
> > > [    0.857184]  mipi_dsi_attach+0x30/0x44
> > > [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
> > > [    0.857896]  ams495qa01_probe+0x2d4/0x33c
> > > [    0.858257]  spi_probe+0x8c/0xb8
> > > [    0.858550]  really_probe+0x1e0/0x3b8
> > > [    0.858881]  __driver_probe_device+0x16c/0x184
> > > [    0.859278]  driver_probe_device+0x4c/0xfc
> > > [    0.859646]  __device_attach_driver+0xf0/0x170
> > > [    0.860043]  bus_for_each_drv+0xa4/0xcc
> > > [    0.860389]  __device_attach+0xfc/0x1a8
> > > [    0.860733]  device_initial_probe+0x1c/0x28
> > > [    0.861108]  bus_probe_device+0x38/0x9c
> > > [    0.861452]  deferred_probe_work_func+0xdc/0xf0
> > > [    0.861855]  process_one_work+0x1b0/0x260
> > > [    0.862217]  process_scheduled_works+0x4c/0x50
> > > [    0.862614]  worker_thread+0x1f0/0x26c
> > > [    0.862949]  kthread+0xc4/0xd4
> > > [    0.863227]  ret_from_fork+0x10/0x20
> > > [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
> > > [    0.864095] ---[ end trace 0000000000000000 ]---
> > > 
> > > A cursory reading of the datasheet suggests it's possible to have
> > > simultaneous output to 2 distinct outputs. On page 13 it states:
> > > 
> > > Support two simultaneous displays(same source) in the following interfaces:
> > > - MIPI_DSI_TX
> > > - LVDS
> > > - HDMI
> > > - eDP
> > > 
> > > In order to achieve this though, I need to output to VP0 and VP1 (or
> > > any 2 distinct VPs really). This is so I can have the ref clock set
> > > to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
> > > example above it's 33.5MHz).  Currently, only by removing this code
> > > block is such a thing possible, though I'm not sure if long-term
> > > there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
> > > along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
> > > 
> > > Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
> > >  1 file changed, 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > index e4631f515ba4..f18d7f6f9f86 100644
> > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
> > >  		struct vop2_win *win = &vop2->win[i];
> > >  		u32 possible_crtcs;
> > >  
> > > -		if (vop2->data->soc_id == 3566) {
> > > -			/*
> > > -			 * On RK3566 these windows don't have an independent
> > > -			 * framebuffer. They share the framebuffer with smart0,
> > > -			 * esmart0 and cluster0 respectively.
> > > -			 */
> > > -			switch (win->data->phys_id) {
> > > -			case ROCKCHIP_VOP2_SMART1:
> > > -			case ROCKCHIP_VOP2_ESMART1:
> > > -			case ROCKCHIP_VOP2_CLUSTER1:
> > > -				continue;
> > > -			}
> > > -		}
> 
> Let me say that a "window" in the Rockchip terminology is what a plane
> is in the DRM terminology, and a video port (vp) corresponds to a crtc.
> 
> On the RK3566 some windows do not have their own framebuffer, for
> example the smart1 window always shows what the smart0 window shows.
> This "feature" makes these windows unusable as planes, so the idea is to
> simply not use them.
> 
> If skipping these windows from initialization results in a NULL pointer
> deref then there's something wrong in the driver logic, but it's not the
> lines you are removing here that are wrong. Nothing should prevent you
> from using multiple VPs when the unusable windows on RK3566 are not
> registered.

I'll tell you what I "think" is causing the null pointer deref, but like
always I reserve the right to be wrong.

The driver checks for the primary planes and assigns them to active
video ports. For the rk3566 it's skipping the 3 planes mentioned
above for the RK3566. As a result if there is more than 1 active video
port for the rk3566 (or more than 2 for the rk3568 I'm assuming) it
doesn't set vp->primary_plane = win for that port. Slightly below that
it iterates through the active video ports again and runs
drm_crtc_init_with_planes on them. Only in this case one of the ports
doesn't have a plane, which is where it does the null pointer deref,
because the plane is null.

> 
> I looked over the VOP2 driver and haven't found the cause for the crash.
> I found another issue though which might bite you later. At some point
> we do a:
> 
> 	drm_plane_create_zpos_property(&win->base, win->win_id, 0,
> 				       vop2->registered_num_wins - 1);
> 
> registered_num_wins is the total number of windows present in the
> system. What we should use here instead is the number of windows that
> are actually registered which would be 3 windows less in the RK3566
> case.

Should we just set it right in rockchip_vop2_reg.c? The vop2_win_data
it is using for the rk3566 is identical to the rk3568, but should it
be?

I'll level with you, I'm out of my element trying to solve a problem
with a board that has both a DSI and HDMI output. If I try to use
the DSI and HDMI output on the same video port, the HDMI sets the
DCLK_VOPx (where x is whichever port) to 24000000, and as a result
the panel is displayed wrong. I'm pretty sure I'm not going to be
able to simultaneously display an image on the DSI panel and the
HDMI (though if I could that would be cool), but I'd like to have
them both enabled so I can switch between them. For now I can get
it to work if I put them on different video ports, of course that
means I have to either disable the HDMI or remove the code listed
in this "fix". It should be noted that I can now confirm that while
this fixes the null pointer dereference it brings back some of the
issues you found earlier in testing, so obviously this isn't the
right way to do it and I'm withdrawing this as a patch.

Thank you.

> 
> Sascha
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.pengutronix.de%2F&amp;data=05%7C01%7C%7C9417cf2acb5f4ce2823b08da961d4ab1%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637987349870888766%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=7KQyfEKfXdLQDdz6y5HIffVY5Tj8%2BthwPWMJRS6eTDE%3D&amp;reserved=0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
