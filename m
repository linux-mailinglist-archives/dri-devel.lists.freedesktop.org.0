Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E5BA8248
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79ED10E323;
	Mon, 29 Sep 2025 06:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uO7xSDRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010057.outbound.protection.outlook.com
 [52.101.193.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B358310E31F;
 Mon, 29 Sep 2025 06:37:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vx/rTCSLoxthJkU1a91gQwx17enOdFplqmLkfZ9QC+f4tzobQw8o129kz2Sba5c4uYUDaLZAn951l19B6CIJzDTBjz5UyXqbUNMDkotw/DDRvTyvmNIPKJBbX1goGbgQDkvsrly7sQeZfJgY42E4IGQbBsW5gLp78vtksuzGnUqwuVYRP47yGKE3HHa9EC6sMLM57NSQ8FAgUMPwEpQhOBC8af/eV4H1M4+1dOnctXS9eyWsswte1W59y2C8IACwCfUPcaFWM/eT+0Bbgwyfys05mo+jIG4JC2TZkjFt8EfRalxEZ42xv9ulooLePC1lXHNyLwaxAlIR7t4tqvJj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ7BRr0YNrElHeBl3/pTb0dBuqkWwzTeRQxA+LpkpLY=;
 b=HbramSBiwTNAh7d6d2zZje6drm3VLRbO9Ub+R6vBROMa+BucXCyaRxY7DrP3u6Z2bwkfYyVWy5RvMr/irl9vM47Ps5riav6soK77Er5xpEjzO62vGt4rQdm0YdeKOwG2wFYhB1T20Ny4tm/DEpP2xZErTZN05lxhV76z/6nuimjaiT8R2I5Ep2Q3LH0lk9IIMq/PoSiw3taXKJiSNURsdIz8FKXuC1wmE4dM5b3uhUW1YKMMHegJoGiz1kRgsh33ZG7re3o/0mGA0933qDil1UDehJT1NT+vmfXa2TunRmJNV3riWjPm0o5/iCs/bwzqtUjWlywVxA9iR2UD8Ts5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ7BRr0YNrElHeBl3/pTb0dBuqkWwzTeRQxA+LpkpLY=;
 b=uO7xSDRBlF9mivurVtejvSjXRra/TNzjLIGfGi8TBcQpJ9Evkhz1QPJoYtSEquZOElYvm/YZtNt/7nMDqZBNvd9Ja/gy9BjUD0M5qDFv5KM5dTEV2EYJ7+akdGe6yptJhTe58TK3PIDwqL9drX6Y3Rp2QpuSaKfGowwqaHvE+VxGcEQODEC11h4Po6Qk28X0L1zZF4jCtx8XRjTGRcBpgvCoEHxD4OmvIjGj0BYynquozW4e8TySPNzjc0mANNEibdBz0K6yti4W+lsT++5/AhagkyXCc6U8rIPlH5YJP6uep6YuTLoOmK3qAeCrtMYOki+WoEx8feTeHSk4bgzXFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS7PR12MB5837.namprd12.prod.outlook.com (2603:10b6:8:78::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.16; Mon, 29 Sep 2025 06:37:01 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:37:00 +0000
Date: Mon, 29 Sep 2025 16:36:55 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 06/10] gpu: nova-core: gsp: Create rmargs
Message-ID: <q2ehvle73bvop6muga44cebwzgpm2g5tghf2txq2orvgsaryh2@hfmxjcymhsrl>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-7-apopple@nvidia.com>
 <DD2JYDPBOKA8.2QCK0P7CR1T3V@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2JYDPBOKA8.2QCK0P7CR1T3V@nvidia.com>
X-ClientProxiedBy: SY2PR01CA0041.ausprd01.prod.outlook.com
 (2603:10c6:1:15::29) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS7PR12MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a9b83d-71b5-45ee-5e08-08ddff229834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z10ZcuhrRYS9TO5Tc4gsaOE3dNStYcvdHBXFiFca351V14dKN2owmG11/DwC?=
 =?us-ascii?Q?zNDW52N3kOmFKRjrezsf9j3IlV2Z+7euzV0KrRj7XYv+lFeIZCsBgaHhGyEz?=
 =?us-ascii?Q?6YNM4MCXV0zRVvTLJIxHlvB543bkIEGoxFO4D9vmAjhQgB2zfm/pyLYODn9t?=
 =?us-ascii?Q?E/prexd+EefpVNeI3larxz+210kvzffJ3NfeXzZfn7XvCVm8zbaJgNg+En7i?=
 =?us-ascii?Q?V4JfIQP0Seo9FeHFzrQ2t42PqL46cJA4vb4g9uuBuf3PqX8rLRoor4HPbQe8?=
 =?us-ascii?Q?Wvnb7rWV/zp1YCzqSHMslyU5dBB5WZnVpxgXrTlY5HNsGM9qAleNbt4pEkny?=
 =?us-ascii?Q?wv4xcd2Z27vnj20n0BsiYNMrZB6mgmNmYoxtIAWkVnf1liN4x/8zw7kHHvsH?=
 =?us-ascii?Q?5ALGt8t0jqXX6Wy0CsTTCGO+A8vZXCtFtejSev3nLsOVShL4Hh0urJtDZTX9?=
 =?us-ascii?Q?cK9sk3YEq94RIhnB9zEdpmyBLB0AQF8O7WkJryeHP+ZRxP6DDgJ1V7kyJpg/?=
 =?us-ascii?Q?lDLH/1P3K4wU5c4s3FngrULS8nSiInf/rDn5y4lKWqHUeF07zsQ05fBC5kc7?=
 =?us-ascii?Q?m/cefuDqmplMPV8gduszzVMVt3m/43edAE2sfjoGeCZcmZqpZfrfhkTaco7o?=
 =?us-ascii?Q?NUkWcSOpGF+KRU3i4an/3C8d7n+Rj1iWxdn4HY+PRk06v0cg9DwvZA0qgvwc?=
 =?us-ascii?Q?6HvRRZMAmYjp3mZEmnmPTzKcRjrVJ2guSmTHBLqeycUQxxeP5G41uQDkv5bU?=
 =?us-ascii?Q?t2nofdmqCbTIZUcGWq3Zs7DmZRVY8mNMDcQmN6CNC/4gF3g0B57mAhMnLoRl?=
 =?us-ascii?Q?Zbsgt7XNb56DaTukMYyaIa+objsOkxQywMlbW2wko7jlNTagwefAK2xrgSsu?=
 =?us-ascii?Q?ZP59kUXACDBxPaDAqn/b5GEteEhgP6ASrgJvgqie4BMOohWE+ti3Q5WKlWzG?=
 =?us-ascii?Q?qkMvnIGjcGhWrWwcfUE3B7z1NNz59pQFXvQCCW65KspmYaGHtEccn77pst2P?=
 =?us-ascii?Q?2y/h0tgyA9pRcq+5jCpUw4EqQIqv+q0+wQZPnFMInIAm8lXCZ3prjIdYcuvh?=
 =?us-ascii?Q?4mCXKrYGyMUzfS0u+9HuaY+2gX8XSFGdGPOzP3Y6eP06R/59Md/JWKr1Nld2?=
 =?us-ascii?Q?DudQwHzJjPq8k0T4rbFA5QtNGg0E3nN4q88CUAObwvqmRj1D4bx5wzxNQ6IB?=
 =?us-ascii?Q?NWZJH2hiEGIRqv9HMMyG9pBHNkav+cBpJ1J/lK7j3pvpr9e+T7qYY7AJquhe?=
 =?us-ascii?Q?YgfsaGfJw5wDMkVCj34QgJlY+mcVJQe9hG2vxER8B4TnNfD0idT/JDt0tnos?=
 =?us-ascii?Q?lQbAvZ04RjQIQbLoOtpV74TDNLjGtjKQ3lFobZhGS8HLOGgN4lYoB1r+qS84?=
 =?us-ascii?Q?tE4qQk1e9tz0po5NrQM7Kuoo9re5Q9pfox47XgThkH0UyHrry/0ol2YwHXf1?=
 =?us-ascii?Q?BEcelRn//j5tlFdx7C8yIJo2RNx2INIPxJ2hFu5VxCL3nxsQSE86ej8kqkOz?=
 =?us-ascii?Q?szeJ4QqUcrdB/2VtVU73XTDf5J3xvQfSkMo1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aeNVnFK/JAfBxFLxVkwAozb/NKy6cjZqynep45mx5me4p+fjifGl7lCjaiBz?=
 =?us-ascii?Q?krDznPJi3PrwmxTi6Jydp0OaPKywemySbv1nfEGBCm3KjVSQM/B2JTHapy19?=
 =?us-ascii?Q?c2ZpQzc8uuSkGjY3DbR0Cw7iZjRTg92mBLf3wkrFB0TyhOzLA4Bt0/kAVTSF?=
 =?us-ascii?Q?IhBmZGs8CwzHptjfYTfoiY9Y/gzzHrGo5UAYJQAg+PUNwxTsFnGm7A5sx7/o?=
 =?us-ascii?Q?29aOnrrhL/aRM3yGJ50IghlS90OLYIymIHyWCubk18bLqzfy5ySafoHL5t2Q?=
 =?us-ascii?Q?r1coqnvSKykOY4FJuKrnIr7c6vLwnHYAkUb3XodXguiK8sMWqeT3SIeMzu+U?=
 =?us-ascii?Q?F4OdqdqVXY4tdcGYZRI650gniAQZvUeJFO3SC+XbamKAEV/f9RAX3TMIyTey?=
 =?us-ascii?Q?lknteqKOW9HdN6jvrmLv+cDTEF61P5wINbpugwyIXQxQ8OfmyoVB27PRG3pE?=
 =?us-ascii?Q?BZpn2Pf7sof2TLV1mttvVECP9qRX9SOjpxBZXj30+Vs5nFeknaxP6g5X8pnX?=
 =?us-ascii?Q?YOSjw7979PIYiXia1+hb8ylWAaJslLC/uEGgx5LJk9w82TLkF9QdDRzsPDTi?=
 =?us-ascii?Q?1DEChm1Cc7cgMt8k8AxyjA1Oru+yIgUTXy92kH3drf8INwALxpm5ZuHgmYzu?=
 =?us-ascii?Q?htOPXqv2XnGrbcNeNjVkLW1adv29E6L6DaFGjZURGSy8p86CybOqNJBz80dw?=
 =?us-ascii?Q?2AM7eebPlW4idFn77gESFDItlM1VD33bHOTR7sSh3PCPhIsB3ITaCpTbcRBV?=
 =?us-ascii?Q?ym9NfJHr51VlqkC3WL2LRN2+6t6WBJn9eLOEO4i0IQqfjvETg7KqpXudaSzU?=
 =?us-ascii?Q?jtuaqfx5jhBEx8usTI3vROAGKi90OUEIooVP8nSM/2YkdUU/FNcLDUAHgLiO?=
 =?us-ascii?Q?nJG3/2tmve5+zRnIh2aDpxyGgusqd3vV5kjLUi+EZ+GPCPajuNqeFJurcrYk?=
 =?us-ascii?Q?Vrx7eae129M8StiYAI15lz1jEIqtHvn6pdp7yozPDGNT4N3TpJycDqpEhYJp?=
 =?us-ascii?Q?wUVtDp3gmuFzKmT43psOYYvOFQtIA9g12a1SPlG2/k0xw9bul2MhoNYr2ZP9?=
 =?us-ascii?Q?sPyg5eifRQClcQXnoPy0h5cqq6l1kDwkbItIaZY9nAkhY651pJI2wxiq92bb?=
 =?us-ascii?Q?AomoglR3JWHvaSvZR355tOJus5tJOYqNPk2AWhddlMT2HKrcMQeuMxew7OG/?=
 =?us-ascii?Q?EB4/3aSoyJa7QKqLfnvBYcwBwd3qfQ3Ppq2/I5W69OAFaOP1b0pPw6L0ACCX?=
 =?us-ascii?Q?VY46k6AqMIlTFeF14hVsNh8avXgZPTBSKSGrt4KKvIKtjMkxCL46uxT/y73G?=
 =?us-ascii?Q?XTKUIsU7UaUIS22o0Wh+ELZ6+updsTcK3RLAXDFfSCOv40vw6A9RbYnbTkKo?=
 =?us-ascii?Q?lVA+DUl4Fc/nTZb5vjqUFnQrirhksevpGqnAqp/dMqHXsZ7V3sC1Yp3RpY51?=
 =?us-ascii?Q?M6q8WIWItA2sGsMtGXQ2rLzhauXv0orBr+8z4t3GHZVxDbWNqQMf8MpPyyNf?=
 =?us-ascii?Q?S0NIoY5piEPB5aIJPHIdtAJP1gJ6qqdhMPhJFwc8XHtT5cm6MgUsNkWIPzHM?=
 =?us-ascii?Q?gDlEDz+DcFNn9hA7xOdv8Nog4q1KGSHwJSSLI4Nz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a9b83d-71b5-45ee-5e08-08ddff229834
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:37:00.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp+t9atQaNSIRneox2bQtqCdVkqygghcsWgOh/OoM8doB7NzsFs5dHzZ4x+Zws3FjK3Mpei6KPF73PCjF8JT1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5837
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

On 2025-09-26 at 17:27 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
> > Initialise the GSP resource manager arguments (rmargs) which provide
> > initialisation parameters to the GSP firmware during boot. The rmargs
> > structure contains arguments to configure the GSP message/command queue
> > location.
> >
> > These are mapped for coherent DMA and added to the libos data structure
> > for access when booting GSP.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > Changes for v2:
> >  - Rebased on Alex's latest series
> > ---
> >  drivers/gpu/nova-core/gsp.rs                  | 29 +++++++++++++++-
> >  drivers/gpu/nova-core/gsp/cmdq.rs             | 14 ++++++--
> >  drivers/gpu/nova-core/gsp/fw.rs               | 19 +++++++++++
> >  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 33 +++++++++++++++++++
> >  4 files changed, 91 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> > index 3d4028d67d2e..bb08bd537ec4 100644
> > --- a/drivers/gpu/nova-core/gsp.rs
> > +++ b/drivers/gpu/nova-core/gsp.rs
> > @@ -17,7 +17,10 @@
> >  use crate::fb::FbLayout;
> >  use crate::gsp::cmdq::GspCmdq;
> >  
> > -use fw::LibosMemoryRegionInitArgument;
> > +use fw::{
> > +    LibosMemoryRegionInitArgument, GSP_ARGUMENTS_CACHED, GSP_SR_INIT_ARGUMENTS,
> > +    MESSAGE_QUEUE_INIT_ARGUMENTS,
> > +};
> >  
> >  pub(crate) mod cmdq;
> >  
> > @@ -33,6 +36,7 @@ pub(crate) struct Gsp {
> >      pub logintr: CoherentAllocation<u8>,
> >      pub logrm: CoherentAllocation<u8>,
> >      pub cmdq: GspCmdq,
> > +    rmargs: CoherentAllocation<GSP_ARGUMENTS_CACHED>,
> >  }
> >  
> >  /// Creates a self-mapping page table for `obj` at its beginning.
> > @@ -90,12 +94,35 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
> >  
> >          // Creates its own PTE array
> >          let cmdq = GspCmdq::new(dev)?;
> > +        let rmargs =
> > +            create_coherent_dma_object::<GSP_ARGUMENTS_CACHED>(dev, "RMARGS", 1, &mut libos, 3)?;
> > +        let (shared_mem_phys_addr, cmd_queue_offset, stat_queue_offset) = cmdq.get_cmdq_offsets();
> > +
> > +        dma_write!(
> > +            rmargs[0].messageQueueInitArguments = MESSAGE_QUEUE_INIT_ARGUMENTS {
> > +                sharedMemPhysAddr: shared_mem_phys_addr,
> > +                pageTableEntryCount: cmdq.nr_ptes,
> > +                cmdQueueOffset: cmd_queue_offset,
> > +                statQueueOffset: stat_queue_offset,
> > +                ..Default::default()
> > +            }
> > +        )?;
> > +        dma_write!(
> > +            rmargs[0].srInitArguments = GSP_SR_INIT_ARGUMENTS {
> > +                oldLevel: 0,
> > +                flags: 0,
> > +                bInPMTransition: 0,
> > +                ..Default::default()
> > +            }
> > +        )?;
> > +        dma_write!(rmargs[0].bDmemStack = 1)?;
> 
> Wrapping our bindings is going to help clean up this code as well.
> 
> First, types named in CAPITALS_SNAKE_CASE are not idiomatic Rust and
> look like constants. And it's not even like the bindings types are
> consistently named that way, since we also have e.g. `GspFwWprMeta` - so
> let's give them a proper public name and bring some consistency at the
> same time.

I think there are two aspects to the bindings - one which was addressed in
the comments for patch 5 is how to abstract them. The other is that the way we
currently generate them results in some  ugly name.

Given we want to generate these from our internal IDL eventually I would favour
fixing this naming ugliness by touching up the currently generated bindings. So
maybe I will do that for the next revision.

> This will make all the fields from `GSP_ARGUMENTS_CACHED` invisible to
> this module as they should be, so the wrapping `GspArgumentsCached` type
> should then have a constructor that receives a referene to the command
> queue and takes the information is needs from it, similarly to
> `GspFwWprMeta`. This will reduce the 3 `dma_write!` into a single one.
> 
> Then we should remove `get_cmdq_offsets`, which is super confusing. I am
> also not fond of `cmdq.nr_ptes`. More on them below.

I will admit that was a bit of a hack.

> >  
> >          Ok(try_pin_init!(Self {
> >              libos,
> >              loginit,
> >              logintr,
> >              logrm,
> > +            rmargs,
> >              cmdq,
> >          }))
> >      }
> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> > index a9ba1a4c73d8..9170ccf4a064 100644
> > --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> > @@ -99,7 +99,6 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> >          Ok(Self(gsp_mem))
> >      }
> >  
> > -    #[expect(unused)]
> >      fn dma_handle(&self) -> DmaAddress {
> >          self.0.dma_handle()
> >      }
> > @@ -218,7 +217,7 @@ pub(crate) struct GspCmdq {
> >      dev: ARef<device::Device>,
> >      seq: u32,
> >      gsp_mem: DmaGspMem,
> > -    pub _nr_ptes: u32,
> > +    pub nr_ptes: u32,
> >  }
> >  
> >  impl GspCmdq {
> > @@ -231,7 +230,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
> >              dev: dev.into(),
> >              seq: 0,
> >              gsp_mem,
> > -            _nr_ptes: nr_ptes as u32,
> > +            nr_ptes: nr_ptes as u32,
> >          })
> >      }
> >  
> > @@ -382,6 +381,15 @@ pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
> >              .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAGE_SIZE as u32));
> >          result
> >      }
> > +
> > +    pub(crate) fn get_cmdq_offsets(&self) -> (u64, u64, u64) {
> > +        (
> > +            self.gsp_mem.dma_handle(),
> > +            core::mem::offset_of!(Msgq, msgq) as u64,
> > +            (core::mem::offset_of!(GspMem, gspq) - core::mem::offset_of!(GspMem, cpuq)
> > +                + core::mem::offset_of!(Msgq, msgq)) as u64,
> > +        )
> > +    }
> 
> So this thing returns 3 u64s, one of which is actually a DMA handle,
> while the two others are technically constants. The only thing that
> needs to be inferred at runtime is the DMA handle - all the rest is
> static.

Thanks! That is a useful observation for cleaning these up.

> So we can make the two last returned values associated constants of
> `GspCmdq`:
> 
>   impl GspCmdq {
>       /// Offset of the data after the PTEs.
>       const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
> 
>       /// Offset of command queue ring buffer.
>       pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
>           + core::mem::offset_of!(Msgq, msgq)
>           - Self::POST_PTE_OFFSET;
> 
>       /// Offset of message queue ring buffer.
>       pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
>           + core::mem::offset_of!(Msgq, msgq)
>           - Self::POST_PTE_OFFSET;
> 
> `GspArgumentsCached::new` can then import `GspCmdq` and use these to
> initialize its corresponding members.
> 
> Remains `nr_ptes`. It was introduced in the previous patch as follows:
> 
>     let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> 
> Which turns out to also be a constant! So let's add it next to the others:
> 
> impl GspCmdq {
>     ...
>     /// Number of page table entries for the GSP shared region.
>     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> 
> And you can remove `GspCmdq::nr_ptes` altogether.
> 
> With this, `GspArgumentsCached::new` can take a reference to the
> `GspCmdq` to initialize from, grab its DMA handle, and initialize
> everything else using the constants we defined above. We remove a bunch
> of inconsistently-named imports from `gsp.rs`, and replace
> firmware-dependent incantations to initialize our GSP arguments with a
> single constructor call that tells exactly what it does in a single
> line.

So this would also live in `fw.rs`? What I'm really concerned about is that if
we're not allowed access the C bindings outside of `fw.rs` then everything ends
up in `fw.rs`, and worse still `fw.rs` basically ends up importing everything as
well, tightly coupling everything into one big blob.

So ugly naming aside, I really can't see the advantage of this. It would seem
much cleaner to have to have gsp.rs import the C bindings it needs and tie that
togeather with the other higher level Gsp abstractions.

Although I agree with the overall sentiment - the code could be better here -
we could still create GspArgumentsCached::new() as you suggest just there's no
reason for it to be in `fw.rs`. The type aliases I had were just to hide the
ugly names really.
