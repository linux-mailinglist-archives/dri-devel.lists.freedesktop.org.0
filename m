Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9D5EA6B4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FC410E3FD;
	Mon, 26 Sep 2022 12:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2051.outbound.protection.outlook.com [40.92.41.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AB610E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxAwYoxw/+FN9UTfKWbwZ4ARLp6g5je4nMYn7twg/rbRfUeuy7sBPkof9NkH7E57Kfz3oJs7mbMvn+mIRcLPakWDQJTCWF0UORQzw5ahwD4ki2WZC9OnbW+1lrw5QbToJM0JYjbAA2GtidmHOT+YQnQ70/aCrwmo0ghGy5t2iB3/HiVJUbockKnia8UFB8Mey2sHFL1qMPUxxvExomezQHssrIbZqFIg76fVSwLm63kpQJdoPLjOIgbnCuLtKqGewiEHrb81KwmIKRlxa1ABmDBkQa24iRekbr1zHb0QlhybYe4El6delSlUo6okwWmb/wI8onh0AbrD083tkXpAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBAk6hXfgEdZJ3kEOq700wMN0Jnhs2OIxdeYondJCUU=;
 b=oOfDPqERVIIQIQSrYN0UV85kY+3Pd1iYsKuz7Fid92J1XY2ZoQo0FRQj88vthrZnP4jxAO0jaqDBFlCqsG0hkHBl9HSsNnBweqxW6YkY67YOjMEnFOIzxZNmpeqQlIRxnrrjhYGxwQKmtTSOJauaiZf4elju6UBXMOrSfUymrB6TUfOBukvGTVP7Wj6bcVr5oOLJAK79Xz9VDlwRdCG32h9BP1Bx/9JUGLfsSaAXy11lTSNw2o7rhnMEyVnnPlFUzbgD+7Y3UNEmFs7kS1TRwflMtXuZJtJxfj61146VQ7LqFGKx87h1ydQxroNOS5izkndJ3xmGJoexySb15xszjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBAk6hXfgEdZJ3kEOq700wMN0Jnhs2OIxdeYondJCUU=;
 b=YHCPcacSeL2dM3sx5t0bOnX8oyiDN4Y7Uwbrx8WOgfuxB9YnPEnGAVCHRdZlI2XX6evyUSQpJzfUECtZr3rwETFV558H4JoCio6BK5NKGdS0WIJVuNHjQKu0+B42md0/+9PAJesgGjZFQP04dvHSwFakTN/yb+kfYJOrEMX/MgT4Frh0eLUQ4oLbCZoDPTGaK+z1+Un3OZS4ABtNr3argUOZqAFNapEfJGLfJX25eM2o3uDxtG50hybzoEAhC+G+r3etJDdHm+0GG1KogqC2PExQ5Qn0Xl545bzB2ts4vOdZNoBd4J1/fOb4hnYVJatGNYhF9J30+Fyq8k5L4kAsaQ==
Received: from DM6PR06MB5337.namprd06.prod.outlook.com (2603:10b6:5:102::19)
 by CY4PR0601MB3683.namprd06.prod.outlook.com (2603:10b6:910:8e::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 26 Sep
 2022 12:58:57 +0000
Received: from DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::34f3:b22d:b19e:17c3]) by DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::34f3:b22d:b19e:17c3%4]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:58:57 +0000
Date: Mon, 26 Sep 2022 07:58:53 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Message-ID: <DM6PR06MB5337D2A98E70B92D74FFD600A5529@DM6PR06MB5337.namprd06.prod.outlook.com>
References: <20220912180242.499-1-macroalpha82@gmail.com>
 <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
 <20220914064927.GS6477@pengutronix.de>
 <SN6PR06MB53426F3713C84EDB67F65133A5469@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20220914133530.GW6477@pengutronix.de>
 <SN6PR06MB5342F0D99F3AF0D7149AD100A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20220926081740.GR986@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926081740.GR986@pengutronix.de>
X-TMN: [y4Mi5Rbvn2IlqkV1Ijs4IHONDnR9J7D+]
X-ClientProxiedBy: SN7PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:806:125::15) To DM6PR06MB5337.namprd06.prod.outlook.com
 (2603:10b6:5:102::19)
X-Microsoft-Original-Message-ID: <20220926125853.GB17697@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR06MB5337:EE_|CY4PR0601MB3683:EE_
X-MS-Office365-Filtering-Correlation-Id: bea6fa14-57d3-4eef-af05-08da9fbedf2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/YRAzHEzTxOWhQ+8Gi07Su6IBVxu/9bIGTNHX/NR/eMXUFZtJeGuupnY8VFrHbTHO1nNgInXMvHLjkd0SSLIIPUhYS4tngxCFlPGmohoHD7zKSc87uIcqMRCbeUpJ6rNl7IyJ7iYv/Bi8N30K5Zm4cUBLlXcs127AIUDpCxrq7ZA3gKckr9Z4GG0r128JJHdJkimWvAz+scCdP7lWCOc+ZMjvwoKYqCRUqu2krZOHhF7Uo2o2ykEVc8W80QDMIi5TWb3RSOAUd1+Q369UIGuyYcbKnfBKdDxasEnca6B9VMq0XgkUAxAC7SJ5iZ/v38FBaCfII8ep/6cW/b3LYb4oxnGG3d7JdmDb9OS4MO1au2vv4+5zZ1MGloSKnjWMT01d+M/Mrw4DqNjM/tjpSG4HDKF59iE8pMNSow0Km5VGRgVX6Eh4y/5kK6ryKdQvFM0xe8q1TNwbroxuDh65btpAIh1pyjaLX8HxPi900EtpcTFUKF+/XDGMVyIYs5l3aMTwZ7WDJvWB4GOtcbkGshSxSVOYforAMWQUFitxzGRMcUSCy6P73IMge2WaJF2zo8S4EgSfBY/oWXi3b7m5H7lD/ln84e5tjOAW31a/5EAIroAnmXK0pIfI+sD3otUKdzFUtIW9o5IlzRJRctKHLe8BDMBvFVc7xSr2CmPempyds=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDjeuXIUrBu/eEyw041m6DbYK7ZKqa0uS80akaNjFRFfknbk8HzzolB3XNFK?=
 =?us-ascii?Q?5TMwfXBSxhhsjQWqL7Sp5qlKpjAJWrz8JuQ8fG5yzzpGQ+qYpcvhi4+RCpMY?=
 =?us-ascii?Q?wHG0XOvKsIzxW2BJEmlFXB8TsmzpEcaEiydXHVxdwkT2d6BNfmNNG2tXRw+R?=
 =?us-ascii?Q?bjmGxiJOnvfOeSYj3SA0Cj85mPFBx9DR6ug9js11mejT53jqtNNQRyA887z2?=
 =?us-ascii?Q?iUes6kaHSO1iTlrrl8z2NHYbv7av0HJY+7tHpskHgTmGyhWyaGNYqT9YwUqu?=
 =?us-ascii?Q?3WedfK0eziOMU1h0/OHbmFdL5545vk7x3FwBXzb8NNYshRsb0x+oWXIHnihP?=
 =?us-ascii?Q?+JKS7XcwBtVynZRr7P40SPmkoi/vQUniKUqitwpfk1TALh1Sa/b8t7RDPZ81?=
 =?us-ascii?Q?EnjvFcolLmSeZYxnlypNX/CfMhoxofP5MikEv/zfysYXeTmkCjVAQCbB0kLT?=
 =?us-ascii?Q?41HruPVS60mKtO/MYNITfJ68ir7sOoohv3Y/LfxP8+CVUnAngoOLHMd4h/1x?=
 =?us-ascii?Q?dc1Xn3LoqaXxu2xeTyy3efjDzq1a8VF4MLJhc5b2yxREPJT297xK7oJThxS3?=
 =?us-ascii?Q?hGn4+5Q/2Z2ocfCCz7S7PGFSarTkgkT6BZ+5zoxccFOETky15q7GIHeEEvbs?=
 =?us-ascii?Q?kM55e2rV/qsX3nNprgR/w0xEPwGMO5nEHAPtyU14emYmxpTDgEbWFdY8CXPL?=
 =?us-ascii?Q?xe24+0lDJ28ypmO7hZId72yCkMUdStKEKQ3mEHO/oROlHBm6/hsZVoY+OgLK?=
 =?us-ascii?Q?5biv2v6Wy4VnfP4BGG+rA9hGbSYFHIC+rDYR4nzeUJsZP40ttjb/rifESERk?=
 =?us-ascii?Q?GA3kKCEVwKMiAN+MInxT/99WTn1egfLkSgCuGQGoEJj206CCraWjtvLgRB9x?=
 =?us-ascii?Q?L39LloJD8oX1eaA9IXaHYL0T39kkQQZjEuevuAmK+2VmYV6glP7OKlRDOyZQ?=
 =?us-ascii?Q?ceodeLGvfuu9RgWAvIxKGqIcX5acnDhwPTiXbwOCN5NDgpZJL6Q/z7UWNo2a?=
 =?us-ascii?Q?h+5yE0G6X/4BPoUXTmAEBi5rL6noqX1d3EAT6dEzM2K4u3V2br4IictdFu+b?=
 =?us-ascii?Q?M+lkBFhTj8zK6UTkgYv2daZ+zEceXsNSkT/xwuTeEkfUNQOfI/QCIg2RwOW5?=
 =?us-ascii?Q?xkn8gWEqNBAAE7U1hp6dSEnICrEWSp8m2hNozquF4yiimetpapNB9Nu459Mp?=
 =?us-ascii?Q?YOlVFuRgnOU3HIjJG+hYOOS1miL1E101vVKdIgUN9qlB6RJHKKYzhHAAk3RL?=
 =?us-ascii?Q?z520C7KdwyN03oos2cbsbd0mELAtK9Lct/+TA/0Gqg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6fa14-57d3-4eef-af05-08da9fbedf2b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5337.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:58:57.0318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0601MB3683
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

On Mon, Sep 26, 2022 at 10:17:40AM +0200, Sascha Hauer wrote:
> On Thu, Sep 15, 2022 at 10:13:44AM -0500, Chris Morgan wrote:
> > On Wed, Sep 14, 2022 at 03:35:30PM +0200, Sascha Hauer wrote:
> > > On Wed, Sep 14, 2022 at 08:04:18AM -0500, Chris Morgan wrote:
> > > > On Wed, Sep 14, 2022 at 08:49:27AM +0200, Sascha Hauer wrote:
> > > > > On Tue, Sep 13, 2022 at 08:55:22AM +0200, Michael Riesch wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On 9/12/22 20:02, Chris Morgan wrote:
> > > > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > > 
> > > > > > Cc: Sascha -> any thoughts on this one?
> > > > > > 
> > > > > > Best regards,
> > > > > > Michael
> > > > > > 
> > > > > > > If I use more than one VP to output on an RK3566 based device I
> > > > > > > receive the following error (and then everything freezes):
> > > > > > > 
> > > > > > > [    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
> > > > > > > [    0.839191] Mem abort info:
> > > > > > > [    0.839442]   ESR = 0x0000000096000005
> > > > > > > [    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > > > > > [    0.840256]   SET = 0, FnV = 0
> > > > > > > [    0.840530]   EA = 0, S1PTW = 0
> > > > > > > [    0.840821]   FSC = 0x05: level 1 translation fault
> > > > > > > [    0.841254] Data abort info:
> > > > > > > [    0.841512]   ISV = 0, ISS = 0x00000005
> > > > > > > [    0.841864]   CM = 0, WnR = 0
> > > > > > > [    0.842130] [0000000000000250] user address but active_mm is swapper
> > > > > > > [    0.842704] Internal error: Oops: 96000005 [#1] SMP
> > > > > > > [    0.843139] Modules linked in:
> > > > > > > [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
> > > > > > > [    0.844013] Hardware name: RG503 (DT)
> > > > > > > [    0.844343] Workqueue: events_unbound deferred_probe_work_func
> > > > > > > [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > > > > > [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
> > > > > > > [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
> > > > > > > [    0.846399] sp : ffffffc00a7a3710
> > > > > > > [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
> > > > > > > [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
> > > > > > > [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
> > > > > > > [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
> > > > > > > [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
> > > > > > > [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
> > > > > > > [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
> > > > > > > [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
> > > > > > > [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
> > > > > > > [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
> > > > > > > [    0.853048] Call trace:
> > > > > > > [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
> > > > > > > [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
> > > > > > > [    0.854118]  vop2_bind+0x89c/0x920
> > > > > > > [    0.854429]  component_bind_all+0x18c/0x290
> > > > > > > [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
> > > > > > > [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
> > > > > > > [    0.855639]  __component_add+0x110/0x168
> > > > > > > [    0.855991]  component_add+0x1c/0x28
> > > > > > > [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
> > > > > > > [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
> > > > > > > [    0.857184]  mipi_dsi_attach+0x30/0x44
> > > > > > > [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
> > > > > > > [    0.857896]  ams495qa01_probe+0x2d4/0x33c
> > > > > > > [    0.858257]  spi_probe+0x8c/0xb8
> > > > > > > [    0.858550]  really_probe+0x1e0/0x3b8
> > > > > > > [    0.858881]  __driver_probe_device+0x16c/0x184
> > > > > > > [    0.859278]  driver_probe_device+0x4c/0xfc
> > > > > > > [    0.859646]  __device_attach_driver+0xf0/0x170
> > > > > > > [    0.860043]  bus_for_each_drv+0xa4/0xcc
> > > > > > > [    0.860389]  __device_attach+0xfc/0x1a8
> > > > > > > [    0.860733]  device_initial_probe+0x1c/0x28
> > > > > > > [    0.861108]  bus_probe_device+0x38/0x9c
> > > > > > > [    0.861452]  deferred_probe_work_func+0xdc/0xf0
> > > > > > > [    0.861855]  process_one_work+0x1b0/0x260
> > > > > > > [    0.862217]  process_scheduled_works+0x4c/0x50
> > > > > > > [    0.862614]  worker_thread+0x1f0/0x26c
> > > > > > > [    0.862949]  kthread+0xc4/0xd4
> > > > > > > [    0.863227]  ret_from_fork+0x10/0x20
> > > > > > > [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
> > > > > > > [    0.864095] ---[ end trace 0000000000000000 ]---
> > > > > > > 
> > > > > > > A cursory reading of the datasheet suggests it's possible to have
> > > > > > > simultaneous output to 2 distinct outputs. On page 13 it states:
> > > > > > > 
> > > > > > > Support two simultaneous displays(same source) in the following interfaces:
> > > > > > > - MIPI_DSI_TX
> > > > > > > - LVDS
> > > > > > > - HDMI
> > > > > > > - eDP
> > > > > > > 
> > > > > > > In order to achieve this though, I need to output to VP0 and VP1 (or
> > > > > > > any 2 distinct VPs really). This is so I can have the ref clock set
> > > > > > > to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
> > > > > > > example above it's 33.5MHz).  Currently, only by removing this code
> > > > > > > block is such a thing possible, though I'm not sure if long-term
> > > > > > > there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
> > > > > > > along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
> > > > > > > 
> > > > > > > Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> > > > > > > 
> > > > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
> > > > > > >  1 file changed, 14 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > > > index e4631f515ba4..f18d7f6f9f86 100644
> > > > > > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > > > @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
> > > > > > >  		struct vop2_win *win = &vop2->win[i];
> > > > > > >  		u32 possible_crtcs;
> > > > > > >  
> > > > > > > -		if (vop2->data->soc_id == 3566) {
> > > > > > > -			/*
> > > > > > > -			 * On RK3566 these windows don't have an independent
> > > > > > > -			 * framebuffer. They share the framebuffer with smart0,
> > > > > > > -			 * esmart0 and cluster0 respectively.
> > > > > > > -			 */
> > > > > > > -			switch (win->data->phys_id) {
> > > > > > > -			case ROCKCHIP_VOP2_SMART1:
> > > > > > > -			case ROCKCHIP_VOP2_ESMART1:
> > > > > > > -			case ROCKCHIP_VOP2_CLUSTER1:
> > > > > > > -				continue;
> > > > > > > -			}
> > > > > > > -		}
> > > > > 
> > > > > Let me say that a "window" in the Rockchip terminology is what a plane
> > > > > is in the DRM terminology, and a video port (vp) corresponds to a crtc.
> > > > > 
> > > > > On the RK3566 some windows do not have their own framebuffer, for
> > > > > example the smart1 window always shows what the smart0 window shows.
> > > > > This "feature" makes these windows unusable as planes, so the idea is to
> > > > > simply not use them.
> > > > > 
> > > > > If skipping these windows from initialization results in a NULL pointer
> > > > > deref then there's something wrong in the driver logic, but it's not the
> > > > > lines you are removing here that are wrong. Nothing should prevent you
> > > > > from using multiple VPs when the unusable windows on RK3566 are not
> > > > > registered.
> > > > 
> > > > I'll tell you what I "think" is causing the null pointer deref, but like
> > > > always I reserve the right to be wrong.
> > > > 
> > > > The driver checks for the primary planes and assigns them to active
> > > > video ports. For the rk3566 it's skipping the 3 planes mentioned
> > > > above for the RK3566. As a result if there is more than 1 active video
> > > > port for the rk3566 (or more than 2 for the rk3568 I'm assuming) it
> > > > doesn't set vp->primary_plane = win for that port. Slightly below that
> > > > it iterates through the active video ports again and runs
> > > > drm_crtc_init_with_planes on them. Only in this case one of the ports
> > > > doesn't have a plane, which is where it does the null pointer deref,
> > > > because the plane is null.
> > > 
> > > Yes, you're right, that is likely the problem.
> > > 
> > > On RK3568 we have four windows that could serve as primary plane, so
> > > there's enough for each of the three VPs. On RK3566 we only have two
> > > windows, so once we use more than two active VPs we are running out of
> > > primary planes.
> > 
> > The datasheet states that it supports up to 2 simultaneous displays, so
> > I think a hard limit of 2 VPs is fine for the rk3566.
> > 
> > > 
> > > I am writing these numbers because I think Esmart0-win0 could be used as
> > > primary plane, but is marked as DRM_PLANE_TYPE_OVERLAY in
> > > rk3568_vop_win_data[]. See the attached patch, if that's the problem it
> > > should resolve your issue.
> > 
> > This patch did indeed resolve my issue, and also allowed me to get both
> > HDMI and DSI working simultaneously. It's not perfect (right now I'm
> > displaying a 640x480 image on a 1080p display since my DSI panel runs
> > at 640x480), but it works and that's great.
> 
> I just sent this patch for inclusion. Could you provide your formal
> tested-by: tag?
> 
> Sascha

Done. Thank you once again for all your help.

> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.pengutronix.de%2F&amp;data=05%7C01%7C%7C0a2e9af8accf4b7e720708da9f979700%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637997770679554061%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=k56y1R3snN7uokq64C0Yx0K%2F0CbYktI%2BCeGyX5XHM%2Fk%3D&amp;reserved=0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
