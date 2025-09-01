Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F07DB3F160
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 01:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6A10E541;
	Mon,  1 Sep 2025 23:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HI608HjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804BA10E180;
 Mon,  1 Sep 2025 23:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YG2/MvgReZxJfmRUEZKbl+RMP1KOrdHTgUxyL3M+TdzxpoP4KEA1XqnCrTVcR84VG0FSK0M6Fz9aGrUXDOa4ByX6lzDzULRxdzttQIPcWjLOoD/NM2qgRSU14FujRwLURUarZv8KH4ccgdH9RKb5Bjke3Usn1T/ldbhvQCrfbGOhL+vQ9k5FxnYVxMKTdsUxr+4L3XmVdV1YQFEEukKTxSbGXNSm5Xh8p+QUzUNz6XZLwFZpkPvKQVhda8CWgLTcm+qXLvKWOyQy9LPX0X/4ChMrmgCMPAAOLtI0nEodkjI0ilDIckUKiiuK/FiZLFGPOl0O05LtxhNGNqSWdnEjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqUdnr7FFb9kRbE9Ebj/CvlLAwdlcR9o3/4AyQQMoJ4=;
 b=ernIlRHdMAbiY9pDcUA7EXaQSm3CPx2rlTHi687GvLP0fvzzac73Q4A8u4PH29GC4L9+82YyTrRzSOywCSac6uwRv78ZJqVcRI2RgQ9tQXJggYKRUMxV12iwOgVJuf74zYz3n0U6c0QRqa/NB+KG2O4/DocUeX2B5P9IblFebOd0zKr10EcjhIglwfm3zK868vKIdxpwiJu1KVaU9yipP2/mwyjThtPZZ/3SlAwdZkIAUfO3uGHIpzMWYQL0G6Te5JuazNrYeCmO3Xv1EkZVViylE4XMVisuNAH6XoWpUiMFYTfsRGcjNQjLYWhrLmJOw2tQJ3CcclCv3qbQBZK+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqUdnr7FFb9kRbE9Ebj/CvlLAwdlcR9o3/4AyQQMoJ4=;
 b=HI608HjDPY0/T/YM4uMTQenT1xL1YutAqsHDOWf6aPvZcqhkHQLxSy2eVdrp5klrawwJV0TWKmELfyxjUBDCOXOaTnyvLctajggOXSfjx0FgbveyFWo9olrycaSuFEPYHdWxV3FQXetcHH5h3Rmh5X10/RPgnNfVStoMeIv2RaT2RVFa0NPO/g4TYZ+S6rkJcfFVJijmRxFUCa1jJKOP/rVjivw3whmaveSraLoBkpKVHZHqNtZfF4aNtCPIT6NdFt9i6zBGJExY9PIr2IEgRq+1YDwj7vf3pf854msqqF8MZqzLTmNnqm+pL5wO2Y6b9NpirG+50FanJP56KnXAcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS1SPRMB0005.namprd12.prod.outlook.com (2603:10b6:8:1e3::12) by
 LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 23:55:41 +0000
Received: from DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f]) by DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f%5]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 23:55:40 +0000
Date: Tue, 2 Sep 2025 09:55:34 +1000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <jbkvgmj2lc7petnt5wen4hvkpyu46t6rn7e7r2sekpqdvojgj3@qste4uzb2w2l>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-2-apopple@nvidia.com>
 <b5f42338-e5b3-4823-8aa9-9374c22f1209@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5f42338-e5b3-4823-8aa9-9374c22f1209@nvidia.com>
X-ClientProxiedBy: SYBPR01CA0177.ausprd01.prod.outlook.com
 (2603:10c6:10:52::21) To DS1SPRMB0005.namprd12.prod.outlook.com
 (2603:10b6:8:1e3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1SPRMB0005:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: 52280785-8104-4a9b-47b4-08dde9b30dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vn8mEaLHaa5Sb1UyMtn7ajjU2UfcScfQ8ryjEIfaOETqg5ktnVNZO8qkFDFx?=
 =?us-ascii?Q?jqaiDARSRnadB5D/dicdOhcnLoEVwEOkNLkSrwPYa6dZ/lEVWDpb4BAd0G7n?=
 =?us-ascii?Q?PmpwY97X+IRufu4aZXeT5/VQ7Y7o5ahxKaihFX96ME3oD8jpbjHrFe6ct2vN?=
 =?us-ascii?Q?Dxae2FG0XjPeiyuAeIQIyobEUcBWNZSl9s0OEW83s6pfntjHmQLnQhXi24Pe?=
 =?us-ascii?Q?XisLK47VaBfZngC+6uMunkdN7fw+VX3gFX/CVscJLbFdB4amVMBcxgNzpPrE?=
 =?us-ascii?Q?Xg9xNNCaoPoJWRms29YYtGh5JP1OFGmfCd0byXTfASsd9D93bGG4gFTrMyK3?=
 =?us-ascii?Q?6QN2KbzmJq+GpecXfbxQhHpM+SL0/gjXg//KbVdNlg8TG93KpHeQQ/szljS5?=
 =?us-ascii?Q?FHDyK/XQYvx97FyTgyH53Iaon5NjyH8R1qXT/KlRLDvilF+7E6YoTTdcDMCM?=
 =?us-ascii?Q?Mkl/lYJ4LiI+MG9DmLyezgf3h2MEuTUD2Mp3ZH5hGv0c47AY78D9eo506vhL?=
 =?us-ascii?Q?y/CvPT1PtBW09kmfWnGXVe3LQRfniLILD32y8PL6deQOb8zHv3e6wiyw3ebz?=
 =?us-ascii?Q?Em9LYUJkiOslkm8JMHZUhd6igANaS3M/wZygjH8pCi8YJO/Ae2lrwaZ4VUw3?=
 =?us-ascii?Q?2CCe1+lRFwn54XRfz/wjvtv6dJjeMawlmcf3kw2drvRiJRJLNhcNvdfTe4Uq?=
 =?us-ascii?Q?ePc3ELRbfOZNJ/XYVc8m3bwKNqOQEBKe2UC92XTI9xeyBcBgG4L4ZrGOAwTd?=
 =?us-ascii?Q?oAu5EkCFuKOeg8e1Y9e1aVlO4Q631a4Qs7u3SvgJuqDepK4ByVzGy6LGYTeG?=
 =?us-ascii?Q?sLW8c0aOKd66rgmi9bNrvGpowJ1h+aA/LdineQVmFDsVXhOAoKZQU9gPmWGe?=
 =?us-ascii?Q?1KrBUe9wxDyxW3gayCHDwL1yONc47W/a7gXQDd7bWeki3J7A2sqKeoRSapyJ?=
 =?us-ascii?Q?4RDUhRSazWe6qOlqACzuOHy6ym9O7SqAJcrLLlY92R6/J3GhTyuU5bqVWeRf?=
 =?us-ascii?Q?saEOIHXfWmnGbcAu5QO+/ZA4mPgmQ72P0olwaMPPoqkx0hyPyiWJ8bTPcgNY?=
 =?us-ascii?Q?lgM2n40DqtlU2SB/26dlrr8f7z5enaIKwNOBcCq1Vy9hcqhG1NQhQpY1dXdO?=
 =?us-ascii?Q?PyEQ0sLdpbb6Vv+89XyrqPfUgqIvbS7r+J9V9BTJH5s5Qw+P6n6N9JcG+IVh?=
 =?us-ascii?Q?fXziVP5dy5jbZVlvIXxyL/NMRmSk4cfOKLPfrVG7COnbuvE0GGG/LyAhVkaI?=
 =?us-ascii?Q?ep2T1hln5jmvNCLLsnLdBXcroA+pissPYZUXD8OtuIu7xQIqXEzWfkwVoNdy?=
 =?us-ascii?Q?HwiDxt8J5tFtnaIeYEXYl9J/EhKpsx0uuHPVAzwPT3dnGxsdSQuCF7AoZ1dB?=
 =?us-ascii?Q?Wd16dEbjsm2CzDo26+8abOcot96rjd57cBHT+8s3k9792YV4bE8EXlP7UCsG?=
 =?us-ascii?Q?foe5CvPaHGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS1SPRMB0005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQTzWZKNn5F/9KZjntDZexD8LmnwV+PNqfK99PDdwc4VqQNS0GV4FjJHukJH?=
 =?us-ascii?Q?kegqmq5xE3AjbtdnfKbs5xMDvueNn2afeA3LA4CjExNjspTeXYOiT8LnsMwN?=
 =?us-ascii?Q?r+OKK/shSBD+xvqGGvZB1JmrnkVoNqfkv+KFL9rd20XBOzTI9O/DZ2D0noIE?=
 =?us-ascii?Q?kLqY5l9G2XdRS53zLN2VL9VhMgCnloDBjgp3oeaARFftyd8mptbxBOdS+xhS?=
 =?us-ascii?Q?6UwsUT9gS/hYQ7Yo1YThuzulv7UuiVsqrUh7AteR7DKiSDn5NoxpM0gcdmGT?=
 =?us-ascii?Q?sTdBUU7rcWlSwN6izMDsV732lNATrp+E1H11ixahiuyBZYTBpQaMTB0M5U27?=
 =?us-ascii?Q?fs1lpvELw1cIzJ5oAa6e2SiP1hTGSJn0wYv8rI3ikt1WcVPn8GqO9eNUD0z/?=
 =?us-ascii?Q?A/Ovl8yTrdz3gxus/ufbecfiwAVhxyZ1c91iZBTid1bcmkBaulUIsebxzIHE?=
 =?us-ascii?Q?6ZSpchYmXzTiFOeuuMahpgD+K2T5FmD6+gAqnQuHeJWbzems2Cw2PxKKqso0?=
 =?us-ascii?Q?jlqCZQLapcLcossnnYRqE3kGnpcgydlyWoXgHf1Su9GmtXmLAQ2y4TpgpLbn?=
 =?us-ascii?Q?ju88MpP70JSfbF+vqOf26LYDj1+D3fO6lfclYXJe/o5s1/i19PVkAgIkZyzF?=
 =?us-ascii?Q?/gJ8dcL2OyNeXM5RVLoT2k8YMxY1iaBpm1ilM7cUkWK31plu5A+SbaoZ31ad?=
 =?us-ascii?Q?1077wntIuj3iir/Av+FKqCSosb6XBqgue7PIwsBMGkFwhdD7u/3w51D+GDuh?=
 =?us-ascii?Q?8y/X9WIXsaObx4eni/MOBL8nRgglACCp/R67Cf4Pp5U03gr11bCZKxwV6q9N?=
 =?us-ascii?Q?PNna6saYpzBc/zbQIelMA0AlWGoX3xDMVNMflo4J7Ka3t+jx6X6CAq8woO4U?=
 =?us-ascii?Q?k294tlAk3/zVfTJxP2AwLIKUzRgzlo6FD+82xnvOfCVYAchqR8OL9ble0egS?=
 =?us-ascii?Q?yEy3NKdD4MCaZha3PDb63BLlAjFOYsd3Z87oQSVy6X+TTXiQ0sFJwoqew486?=
 =?us-ascii?Q?MlDNZzTuY5jHOfZWjjSNwGLAyUiUlgw+vyP5nWHp8WlDe9tqO7Sxw7FHD4Vo?=
 =?us-ascii?Q?sogKtZKTcu2ARy5jNgQZQCqrmFiEpUWj8al+FihPaiI8V1vSVFHjYrAzFt4d?=
 =?us-ascii?Q?lJQxut1viyqUnYINORL7vGldVBTH6CW1tH+J/dkNdx54zEuGOhI3wZobVa4f?=
 =?us-ascii?Q?vraCmmkQmtguOcMRQfd5mRbqVsO1EojZnCkbmH6XeHVTnnpJ/+U6jvntWmGM?=
 =?us-ascii?Q?r8ONB4bQUDzfZEU3UeYUQ8l0SSyDjZR+9HoNo0UNkmdnNMChqWozucFeZBaZ?=
 =?us-ascii?Q?iCr0l8Qb8ZkS2m3KoKsK4kbsT7eSZg5GQZil4r3E/HNwyvkOgjFUgJGR1FKO?=
 =?us-ascii?Q?0gf7JWDd57GH6UKCzBCTPNRGd2FDWLgGeTqjRqt/Lp3g0zIgEElr/srXZ2ul?=
 =?us-ascii?Q?sv7sPJUymukaTP0lFi6fBq3tjWTQeMBh6mHHKqAuxsXSNYXnRGBGX/zmvz+D?=
 =?us-ascii?Q?S+eBHBQHHd+Y1FCPPfcOz0mMcaHMTDMJ/M8CjiY4P2Mp4oo2fksCVhljkC19?=
 =?us-ascii?Q?32HImM+lYmdx/EMWuky9P+Tksf2rqS1LkYhm37f4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52280785-8104-4a9b-47b4-08dde9b30dfa
X-MS-Exchange-CrossTenant-AuthSource: DS1SPRMB0005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 23:55:40.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIAMsV2AkHC8ptXuYiGrMhzgp5IUxI0Lw0CRvjtdHwtmCK2SeZHPvquOKPqOtlkOFpht/D72BXMNVs7X0ZTNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
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

On 2025-08-30 at 09:55 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> On 8/27/25 1:19 AM, Alistair Popple wrote:
> > Set the correct DMA mask. Without this DMA will fail on some setups.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > ---
> >  drivers/gpu/nova-core/driver.rs | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> > index 274989ea1fb4a..3e154ffb6be4b 100644
> > --- a/drivers/gpu/nova-core/driver.rs
> > +++ b/drivers/gpu/nova-core/driver.rs
> > @@ -1,6 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  
> > -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
> > +use kernel::{
> > +    auxiliary, bindings, c_str, device::Core, dma::Device, dma::DmaMask, pci, prelude::*,
> > +    sizes::SZ_16M, sync::Arc,
> > +};
> >  
> >  use crate::gpu::Gpu;
> >  
> > @@ -34,6 +37,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
> >          pdev.enable_device_mem()?;
> >          pdev.set_master();
> >  
> > +        // SAFETY: No DMA allocations have been made yet
> > +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<48>())? };
> 
> Eventually, should be 52 bits wide, rather than 48. Or so I believe from
> looking at various drivers, including Nouveau (which uses 52-bit for 
> Blackwell) and mlx* (which use a 64-bit mask).
> 
> However, it works for the current series, because this series only supports
> Ampere GPUs, and 48 bits suffices for those.

Actually based on both Nouveau and our internal docs this should be 47-bits. I
suspect I just chose 48 during initial bring-up because that's what most CPUs
support but neglected to add the TODO to actually go and check this. So will fix
for v2.

> So, you could leave this patch as-is, and I'll change 48 --> 52 in the
> upcoming Hopper/Blackwell series. Or you can change it now.

We can't of course just change this to 52 bits because this needs to reflect
what the GPU HW supports. So ideally this needs to come from the HAL. I left
this hard-coded because in the short-term leaving it as 47 bits even for
Blackwell won't cause any issues. It may force usage of an IOMMU to address
physical addresses greater than 47-bits when it otherwise wouldn't for
Hopper/Blackwell (it would always have to for Ampere/Turing), but short-term I
doubt many systems actually have physical memory above 47-bits anyway.

In other words you could leave this as 47 bits in the upcoming Hopper/Blackwell
series or use the HAL we have come up with (if that is available) to obtain the
optimal value.

> Either way is fine, so:
> 
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks.

> thanks,
> -- 
> John Hubbard
> 
> > +
> >          let bar = Arc::pin_init(
> >              pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
> >              GFP_KERNEL,
> 
> 
