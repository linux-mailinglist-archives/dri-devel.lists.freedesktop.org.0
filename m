Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC425B9E7C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 17:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A0C10E1F2;
	Thu, 15 Sep 2022 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D4F10E1F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 15:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVF1dcDkFH0wAQ/PWGvkKgmfML0lEYUgVJQamlre4BytH3DEl6QfGF3bowJR7Jwo8LcmkyNOIbnQeP3f+ljebrK2npj40U+v+aqZZeD3Zdtd+Dy7W/NV37nhZQAmswrXll7vc5ONJXmqRCOC+m8MtZMp3cgER65QANuPJjZEt20DYTb/9D66qdwoF6jvFIM6yMUOCq1lmKbRM+Du1yajv2MB9pLns0UdpSyww5Z625Ia+1Eyp62Mu88MS7tr+LPh79V5qgbDKiMvR8lbphuzw6Nx3sXcmVzY3TpDG8w4xE9c4RdF3UarJ5b8eDlLvkmZnGFbva/M9pw6+O9toXdRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih6iPK1WFQxXRsBAs087YdvGRv6FjKuTtBO5XXKaCIo=;
 b=lgAsjLAUjNS2YwMMZN6FIyp6e9Pk00n9zQS5x0TwtYP6yWynFreXxsSpsjsjMb98oPh9cO12iPe/NI2dxadKw4g9dzK/yvQqiL7K79nnf05GPxFh/7QjS3+ojqcR0/Xpd2be7J8/xsFwmSRZXuUVols5zsTcFOk9GkS3cyVHTEDvB68/hmUh+dnsg61ZTVeeR4cp3lQNM2IKZUb3BXRdqk9/mfpCuSbmvZGkaulUzuIfZ2rcZ1Zr7Elpl8rLZ0bZtQzxc0UCh70gyR4KNlVa6laMEikc42U3EUqCW3z6+jEXRYkOmFar2f+nKvbbDfSb7s1222tPeiJrO6Hd4yvKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih6iPK1WFQxXRsBAs087YdvGRv6FjKuTtBO5XXKaCIo=;
 b=bMe5RFS76OWwik8MqBCFnG4SNqZ5RA0BOZ1SMLdpYXs1M2tBfJdAtE0JKeiFQsMaMq14eTdqHD1M5UE4EoDjg2d7annHFg0EhSukvRQ0qveufqP4pzkbEJLVxV9D9fjfpe282yXdqM3wsHs3WaG82J46/jN9dr7cDhwhE1xbJ/iljfpqsqFlLAygSiPXzcg4pXcU9WCPViitsndHudi4LP7yb6MA4SEPs96PGVUDCFYMEJFM43fbB48KeDWAhnpBWDNZiTCSTMIa5UuwZMRmbeYS8uU5UV6HWwfCSQRF4m23gOFfFQOpyytCd1TwS8yiiZm92vMPGxv3ySDK1OaeCg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SN7PR06MB7039.namprd06.prod.outlook.com (2603:10b6:806:109::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 15:13:48 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 15:13:48 +0000
Date: Thu, 15 Sep 2022 10:13:44 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Message-ID: <SN6PR06MB5342F0D99F3AF0D7149AD100A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220912180242.499-1-macroalpha82@gmail.com>
 <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
 <20220914064927.GS6477@pengutronix.de>
 <SN6PR06MB53426F3713C84EDB67F65133A5469@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20220914133530.GW6477@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914133530.GW6477@pengutronix.de>
X-TMN: [3RJwR//v0P95XSWTLqc4fELoH9o0Rt4n]
X-ClientProxiedBy: DS7PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220915151344.GA28567@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SN7PR06MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4eb123-80d0-4bea-ab48-08da972ce3cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+aGYGZjIbTjX9F3gsFz9HSrFrX/iRtDdli/TazM3+7Di7oeOvNS5As+y+6gTr2x7vWiM3yDkFdJYpd0GHYxDEj3cZHowup+ahs5//Q1nOds0sfpnTPo3vaY9T+GViQYHDnGxjtPuih+XgPIrUDPtVA8FrHGEEJc5OXYzqZrCHy1V7JP1BjhfdHOSbNCbruxlIWLQpm7STEx5Tj1EmmKqCyGF+yd06wLimLwsqhcjPq7Dp4nI7YC2tNjyoCL0QetBXxR5qSVmZW7cv8XM9uGQDNGiJosS5Y5Pwz0X0NUthqDW2VL17fmLtsXlryabkruRRzxW8x3LniN+b1ADPE+nYibZN1GPg48oYzaZfokUS5u+uJZm1X/m3R7JHQ19LxTPWSh6B6lD752IHslaJDidQqC0ye7JSKhTZIaEiCnMM2i/pjFhoKmhakq4C1rknWxxpGDe34/ww4tjLdQv9jTeGTZsM+OGfFmIzPv4jloGRNipG5ceGEUbYJklyvUlwHNCg8UXGNmmXItxkXPlma7pZrbehulk3AuFmP3jQeRDlPxGf5QRbI04P6lfwoVuDDO/AgBjjApJT67CNpBLSeRvZaF0ZCK30rbENz+0X0llGz5Rotr9zAK+Bg405ksVKwFWJ/pQTNrWEXLaQg0czP9t9IY7VAI+FD0fAp+SnbNa/4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7bScDk/XNHnPvNs9NyjTIdLnzLVjXcdC7TjRh2P+hJCPbPI8b2XDE6EEZvrf?=
 =?us-ascii?Q?1WTCwJy9AJnnc2DH+XYbMhF5OaYqL5Xcf5medlhJlwQZV9VqCRchC8L+zN72?=
 =?us-ascii?Q?3n4IsLQw/OSjyh6DXKFcjNWSAI7cBml8OkTLDUNG7Lh8ZX0kq+KDwoluKXDK?=
 =?us-ascii?Q?itE4TSfqctDuBmhCVYGvQy00wnDpNLwfrVQlAUhoxkLn9FU8QSNNgJNVsDEQ?=
 =?us-ascii?Q?rQQZaXXhfrMIlr+XqCipYibdecxGSqjW8d6/S8TpmuR6nL9ucMBe3NKu73Vh?=
 =?us-ascii?Q?T5kIBYoH5GkL5XTi5JbxGsgr9AXauAKcpyd5wnbJWhMCZLd9ZRzjkAouoZC2?=
 =?us-ascii?Q?EZ2yjgFXGZ6HeDBbTWoNN54/He9rdf3e2nre03gwZ3h4JkX7WCTllVMlkYct?=
 =?us-ascii?Q?wAZP0rT5/iCcUcCuXARCqkLBdrFJMVqU94GDWJd2yh2Z8XM6yogp54UWHLGW?=
 =?us-ascii?Q?ts47Acad4h64oN+V69S5Mezgu8rLkjpCtOCvIQfleRxrrSEPdjJhQGwqkBTj?=
 =?us-ascii?Q?fxuUvsWF9s7SY6oc9pCdj1BpoP0wFuVYvT6ESShhxZg//U5QeniSvPxjU4gv?=
 =?us-ascii?Q?Q0gnCp0dS8xh9AE3cFsbLf6dHJdwwg+xeZt/EkjBwkeKLM6KH2U/KfncJ809?=
 =?us-ascii?Q?N3En5SVQM+ibrgkQx8TRSETiqf2mFZq/SiC+Nhnxxi9+Tb8x8+2CSTpqFMgJ?=
 =?us-ascii?Q?EEe4jwQnpqkpgymd2ckBpkIEBbYKCepQdqr7vy97n2Qr80oQqAUsYRKMXxef?=
 =?us-ascii?Q?UoYupHWJcjwE0ldCbJlOQRxZkYiZ8zp7mIrdcj2AF1HXO8QcEV+PTcRr9+2k?=
 =?us-ascii?Q?+qyU0HwdoS0OokvqdN7WiIwpgi1br9VXHRBUiKfA8IJLaH+6bXUCN4dQyCAc?=
 =?us-ascii?Q?9brO27d+7++kRl0ZRN00vH2DQomebW3v6oozUoi+MLctYpprydsKBF+QS42r?=
 =?us-ascii?Q?dwL39jOsMTJ7BUf1+OskNyWXOGaNH77AjNJ1NGiC8o5bpGHrJciMDfFrbD/G?=
 =?us-ascii?Q?QmcDuatGu38Q2vCd7A54vLYiiR9S3GWtci7GzYh9g1kl7cWeySyYIaG7UBn8?=
 =?us-ascii?Q?0H1iAo9IdRczOeKs2UZOlzMxU2jHyzuFl52LMdmNMgKjFFaNkV+Xnsozgwem?=
 =?us-ascii?Q?UUruYhb519ly9HqTTJUHnMWbsGiTBTrK4FmcXp2M72WCJF2MNNLEK6+Vs7rx?=
 =?us-ascii?Q?LBUiaNOw+gsDtMMnW9NiBnJP1c2CYl+20Ddyr7T4Yy59Y/KcIpzHNnqCut/Y?=
 =?us-ascii?Q?boUN3CL2F2wY9DcxYYEkjOia7YZztzpdfVrec7uVWg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4eb123-80d0-4bea-ab48-08da972ce3cb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:13:48.7789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR06MB7039
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

On Wed, Sep 14, 2022 at 03:35:30PM +0200, Sascha Hauer wrote:
> On Wed, Sep 14, 2022 at 08:04:18AM -0500, Chris Morgan wrote:
> > On Wed, Sep 14, 2022 at 08:49:27AM +0200, Sascha Hauer wrote:
> > > On Tue, Sep 13, 2022 at 08:55:22AM +0200, Michael Riesch wrote:
> > > > Hi,
> > > > 
> > > > On 9/12/22 20:02, Chris Morgan wrote:
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Cc: Sascha -> any thoughts on this one?
> > > > 
> > > > Best regards,
> > > > Michael
> > > > 
> > > > > If I use more than one VP to output on an RK3566 based device I
> > > > > receive the following error (and then everything freezes):
> > > > > 
> > > > > [    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
> > > > > [    0.839191] Mem abort info:
> > > > > [    0.839442]   ESR = 0x0000000096000005
> > > > > [    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > > > [    0.840256]   SET = 0, FnV = 0
> > > > > [    0.840530]   EA = 0, S1PTW = 0
> > > > > [    0.840821]   FSC = 0x05: level 1 translation fault
> > > > > [    0.841254] Data abort info:
> > > > > [    0.841512]   ISV = 0, ISS = 0x00000005
> > > > > [    0.841864]   CM = 0, WnR = 0
> > > > > [    0.842130] [0000000000000250] user address but active_mm is swapper
> > > > > [    0.842704] Internal error: Oops: 96000005 [#1] SMP
> > > > > [    0.843139] Modules linked in:
> > > > > [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
> > > > > [    0.844013] Hardware name: RG503 (DT)
> > > > > [    0.844343] Workqueue: events_unbound deferred_probe_work_func
> > > > > [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > > > [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
> > > > > [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
> > > > > [    0.846399] sp : ffffffc00a7a3710
> > > > > [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
> > > > > [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
> > > > > [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
> > > > > [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
> > > > > [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
> > > > > [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
> > > > > [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
> > > > > [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
> > > > > [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
> > > > > [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
> > > > > [    0.853048] Call trace:
> > > > > [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
> > > > > [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
> > > > > [    0.854118]  vop2_bind+0x89c/0x920
> > > > > [    0.854429]  component_bind_all+0x18c/0x290
> > > > > [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
> > > > > [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
> > > > > [    0.855639]  __component_add+0x110/0x168
> > > > > [    0.855991]  component_add+0x1c/0x28
> > > > > [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
> > > > > [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
> > > > > [    0.857184]  mipi_dsi_attach+0x30/0x44
> > > > > [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
> > > > > [    0.857896]  ams495qa01_probe+0x2d4/0x33c
> > > > > [    0.858257]  spi_probe+0x8c/0xb8
> > > > > [    0.858550]  really_probe+0x1e0/0x3b8
> > > > > [    0.858881]  __driver_probe_device+0x16c/0x184
> > > > > [    0.859278]  driver_probe_device+0x4c/0xfc
> > > > > [    0.859646]  __device_attach_driver+0xf0/0x170
> > > > > [    0.860043]  bus_for_each_drv+0xa4/0xcc
> > > > > [    0.860389]  __device_attach+0xfc/0x1a8
> > > > > [    0.860733]  device_initial_probe+0x1c/0x28
> > > > > [    0.861108]  bus_probe_device+0x38/0x9c
> > > > > [    0.861452]  deferred_probe_work_func+0xdc/0xf0
> > > > > [    0.861855]  process_one_work+0x1b0/0x260
> > > > > [    0.862217]  process_scheduled_works+0x4c/0x50
> > > > > [    0.862614]  worker_thread+0x1f0/0x26c
> > > > > [    0.862949]  kthread+0xc4/0xd4
> > > > > [    0.863227]  ret_from_fork+0x10/0x20
> > > > > [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
> > > > > [    0.864095] ---[ end trace 0000000000000000 ]---
> > > > > 
> > > > > A cursory reading of the datasheet suggests it's possible to have
> > > > > simultaneous output to 2 distinct outputs. On page 13 it states:
> > > > > 
> > > > > Support two simultaneous displays(same source) in the following interfaces:
> > > > > - MIPI_DSI_TX
> > > > > - LVDS
> > > > > - HDMI
> > > > > - eDP
> > > > > 
> > > > > In order to achieve this though, I need to output to VP0 and VP1 (or
> > > > > any 2 distinct VPs really). This is so I can have the ref clock set
> > > > > to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
> > > > > example above it's 33.5MHz).  Currently, only by removing this code
> > > > > block is such a thing possible, though I'm not sure if long-term
> > > > > there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
> > > > > along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
> > > > > 
> > > > > Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> > > > > 
> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
> > > > >  1 file changed, 14 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > index e4631f515ba4..f18d7f6f9f86 100644
> > > > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
> > > > >  		struct vop2_win *win = &vop2->win[i];
> > > > >  		u32 possible_crtcs;
> > > > >  
> > > > > -		if (vop2->data->soc_id == 3566) {
> > > > > -			/*
> > > > > -			 * On RK3566 these windows don't have an independent
> > > > > -			 * framebuffer. They share the framebuffer with smart0,
> > > > > -			 * esmart0 and cluster0 respectively.
> > > > > -			 */
> > > > > -			switch (win->data->phys_id) {
> > > > > -			case ROCKCHIP_VOP2_SMART1:
> > > > > -			case ROCKCHIP_VOP2_ESMART1:
> > > > > -			case ROCKCHIP_VOP2_CLUSTER1:
> > > > > -				continue;
> > > > > -			}
> > > > > -		}
> > > 
> > > Let me say that a "window" in the Rockchip terminology is what a plane
> > > is in the DRM terminology, and a video port (vp) corresponds to a crtc.
> > > 
> > > On the RK3566 some windows do not have their own framebuffer, for
> > > example the smart1 window always shows what the smart0 window shows.
> > > This "feature" makes these windows unusable as planes, so the idea is to
> > > simply not use them.
> > > 
> > > If skipping these windows from initialization results in a NULL pointer
> > > deref then there's something wrong in the driver logic, but it's not the
> > > lines you are removing here that are wrong. Nothing should prevent you
> > > from using multiple VPs when the unusable windows on RK3566 are not
> > > registered.
> > 
> > I'll tell you what I "think" is causing the null pointer deref, but like
> > always I reserve the right to be wrong.
> > 
> > The driver checks for the primary planes and assigns them to active
> > video ports. For the rk3566 it's skipping the 3 planes mentioned
> > above for the RK3566. As a result if there is more than 1 active video
> > port for the rk3566 (or more than 2 for the rk3568 I'm assuming) it
> > doesn't set vp->primary_plane = win for that port. Slightly below that
> > it iterates through the active video ports again and runs
> > drm_crtc_init_with_planes on them. Only in this case one of the ports
> > doesn't have a plane, which is where it does the null pointer deref,
> > because the plane is null.
> 
> Yes, you're right, that is likely the problem.
> 
> On RK3568 we have four windows that could serve as primary plane, so
> there's enough for each of the three VPs. On RK3566 we only have two
> windows, so once we use more than two active VPs we are running out of
> primary planes.

The datasheet states that it supports up to 2 simultaneous displays, so
I think a hard limit of 2 VPs is fine for the rk3566.

> 
> I am writing these numbers because I think Esmart0-win0 could be used as
> primary plane, but is marked as DRM_PLANE_TYPE_OVERLAY in
> rk3568_vop_win_data[]. See the attached patch, if that's the problem it
> should resolve your issue.

This patch did indeed resolve my issue, and also allowed me to get both
HDMI and DSI working simultaneously. It's not perfect (right now I'm
displaying a 640x480 image on a 1080p display since my DSI panel runs
at 640x480), but it works and that's great.

> 
> That is not enough though once three VPs are active on RK3566. The
> Cluster windows could likely be used as primary planes as well, they are
> probably just not marked as such because they only support AFBC modes.
> 
> Sascha
> 
> -------------------------8<-------------------------
> 
> From f98f53565ce868811581afbb18451dfea2646b07 Mon Sep 17 00:00:00 2001
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Date: Wed, 14 Sep 2022 15:27:51 +0200
> Subject: [PATCH] drm/rockchip: vop2: Register Esmart0-win0 as primary plane
> 
> Esmart0-win0 could serve as primary plane, so mark it as such. On
> RK3568 this window will never be used as primary plane, because the
> three windows at the beginning of the rk3568_vop_win_data[] array
> will be used. On RK3566 however, two of the windows at the beginning
> of the rk3568_vop_win_data[] array cannot not be used, so we end
> up without primary planes when multiple VPs are active.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 9bf0637bf8e26..9d30aa73b5422 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -188,7 +188,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  		.base = 0x1800,
>  		.layer_sel_id = 2,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
> -		.type = DRM_PLANE_TYPE_OVERLAY,
> +		.type = DRM_PLANE_TYPE_PRIMARY,
>  		.max_upscale_factor = 8,
>  		.max_downscale_factor = 8,
>  		.dly = { 20, 47, 41 },
> -- 
> 2.30.2
> 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.pengutronix.de%2F&amp;data=05%7C01%7C%7Cc218aa7fea7b48286e2508da965601a4%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637987593394560183%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=b5aS8NGLknpQIax9gC474MTU9CHKJOgnUq28AXFH6MM%3D&amp;reserved=0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
