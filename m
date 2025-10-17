Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30574BE661E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E771510EAF9;
	Fri, 17 Oct 2025 05:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F+X20mEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013059.outbound.protection.outlook.com
 [40.107.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AAA10EAF5;
 Fri, 17 Oct 2025 05:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMX+FT04nBQrpiotNFXDskVcesV88kshvdrvxnrPOcXuKM0osgnIBWQyFR4RodrRKyYhmhTyN8642fK3qLvjw7mdb2nRQIr4HNH6I0wDq10DzlfdZROjuyKrtupfQtLTtrXrB17JM/jtSJ3E7GeaAo6cOwRLjw2sWS1L6dXvbZNlPwQWPJfMZunz8YA3Nx/83PBr3C31WwFbIwRvqeoK+OLuaJYaHhRU7OAaCZcZlBTHixY32nh91Lq21qPbrr5FpueHc2tAGvat/+l+4yQCJDOhTmFZF5mDt3pufvu4CxwJNEQ4Beav2u2Esfo3oZqiaXRnju/CANt3H7MuocEesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l+XVsiqJTGZjDRsKUsDeIGkDfy37C07KulrD7UaIBM=;
 b=RoQ44C1jeBI+6uLdtH1Y2FsZRQa/crf+mY6oL9PS+1vdEXlJoNIs2CCG1KH4XRw2Kf+Sla2Y+334dc1Bmdy6PzO+gxNo+OwVk2XWd2i0KJvhBReKJ0kY4U4bCNa+m2BkJy5qAmB5UJnz2z+uvsAep+KmRxoCqt8APoaOjrQyaQ7AF9emymhyYy8irc5yxoWDpzWpTnGgqMZgPchAjnrDIaZAhS3bRcXbU8KwbTx/grd0Yy2EqYUuedk9y+0xu1gayGgW3DRjWyPFX319gW/HA+LTJ5OJVYDEjX0yQZoLC+LdR+SmBLSxl53eMwdq4TU9EUa2EL4ss70CZg0gruhjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l+XVsiqJTGZjDRsKUsDeIGkDfy37C07KulrD7UaIBM=;
 b=F+X20mEAXmXueGY+gS4k/GAg3KdH7kEKk6s0QU91Mp2vjtHqXX/GHs7JOf/aNrA0nufytqrRzbSSlZHQv2FANt713Vu9I42zKR3tox9l+cXGIUq4CB+zFw5v9wq575U6k+WSE9BpSYFN4+q3ehPTYONE50Hnz6XyJMB0gA0GFbxptGdTKMGFL9aG6MAgJpiG5jsKqzJ6+1Flbpc4lj467edYZxGMFKKOPV04ednd4me5/kohUYEVFWbaPo4FjXNJjHRAnQU6SX45jgqFAth4uxWrXZljcN7LzQv1IEmTR4YJrdRi1GkrXUvN9I8Rt7u4hNoA0CtBZMS84xmxhAI/IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:14:30 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:14:30 +0000
Date: Fri, 17 Oct 2025 16:14:24 +1100
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
Subject: Re: [PATCH v5 02/14] gpu: nova-core: Create initial Gsp
Message-ID: <34tzn6rvlrfqabupcxztynpochmv5zzwwt3nke2562nx6j5xww@r4kzynbueo4s>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-3-apopple@nvidia.com>
 <DDJJ42I63ERZ.PMLCJQMMK9ZV@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDJJ42I63ERZ.PMLCJQMMK9ZV@nvidia.com>
X-ClientProxiedBy: SY5P282CA0093.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 47310c5b-763b-49a9-f546-08de0d3c0cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R+m0FI8lHVSJ7X3r7ptwwI5gfgUgfTkROdLwbGoh7sfOaCgDUM07WbCUUcYU?=
 =?us-ascii?Q?UJkdK+Zhud1VEeM3IrNPT3dIqFqvEkXJCigA6TNKqxy2XcaTaufCy6cYUnHM?=
 =?us-ascii?Q?UFa3f4GpRJGiiCF4bhficaLMZh39E6jUyNH13qH73RVk0Tymtwms83RROChz?=
 =?us-ascii?Q?/Sr82RldrZ08qrEyTsorvBG/406Id4b8o6x6zMviwJNBYwvb3f97HM+kkIDZ?=
 =?us-ascii?Q?HOGVthOrLCnW2eCRGaEL9f9KBt+zYvUgL+1hf7Rd9ITaA6ug7ap6BKqKwFo6?=
 =?us-ascii?Q?tY24GEYOUFhVOAX9+dd2Ait4s3hbKIT0WNw7/EjmfrWFdydDnW7oPmUJsjN5?=
 =?us-ascii?Q?Cx4a1AyNdu+fqltUdbJCgPEuCxa376B3xIC4Fwr/YZgs8gmrinPaBBNwCDc6?=
 =?us-ascii?Q?w29rLLgSt5QBQK3GyWRWLSN///OQpPgF3iKlmdLFb3k19ZnVGobb25Ew2goN?=
 =?us-ascii?Q?od4xM0R8UCLd9zcTQDls3T3EzQC0Iqi28R2LkNGBqnsrux2jPEXFJEhBBELk?=
 =?us-ascii?Q?l9qvnLPQ/Izm7Cou9ED8XWQGXp6fmXjYP8Kz5F/V0j7FW5+OH1duHk5qulH0?=
 =?us-ascii?Q?heiJkOzqdxowYl9KKQT4DnbiMY2RHhBF8wxTcBb30YaplovpPMhzrk7WBUlq?=
 =?us-ascii?Q?ZNpeA+ILSmi+u4DgU6EU3yUNXiqg2EqlxF1fetyFE3k+aVxhnznsvbpxNTLl?=
 =?us-ascii?Q?GYIHLmBdJzb5eEbu+DGS6gHfEbTtiEqshg83xKs5UwmAFoFgNfEal5U3rle8?=
 =?us-ascii?Q?rOA9kGVnIEtCpPpUKHxurriN+gFs4CDdXu1IUM0nSsebckZ+KCavQcFqs92E?=
 =?us-ascii?Q?oLItid/Rp+YD0JmmLWqRAlApB6n0D986bmwhBPLQdaIArHoa0xgMWLlxQNph?=
 =?us-ascii?Q?O3P37ioxZ4b9BGwreH18A7Vf9rOuQU1c3Stey2i9/U/qJIOOvw9VhEv4Kmrs?=
 =?us-ascii?Q?7a1opDBo/bwRr1onEIfLUup6je5187hhUW/L5DnU20l2AXLf1HYdKaUPphb6?=
 =?us-ascii?Q?4kEp5AbIFlifLprYYK5h1ap7SmR49zJct8m9rESuYUDXrYF+4KPvd1dMLqfG?=
 =?us-ascii?Q?hfErq2zGGpGqxjXDgkbadRi5Hmpd+lVBCoM6zcQ4HQ1apsOySnZzJzrG/+Hn?=
 =?us-ascii?Q?5kqF1/h10BAJ8yLMIVu3d23YSvP0smBp7Sm9iXySxr1lvWt7n0i2aDBUFtiv?=
 =?us-ascii?Q?f6hkJOF6D4d7R7L7ShKi4ZRS0/8um8/Nw0UCI3NagTtok88HXN0MPzIXqKV2?=
 =?us-ascii?Q?r00rXnKr/TUf60tA61OArVtypJRxWAcTlWM6AXxWGTFBKmZ6LPZms8Euwrsw?=
 =?us-ascii?Q?65R+m7FFSlPyNqtnzNAbu5wzBjg1QJ0Y+MhaiQouXO6W5njUGSzybew0mCxX?=
 =?us-ascii?Q?1aK75DUrbqAFib4FOML/ScTN4Phb7XqLFt4/l5z7SJB4f3LPwkro0i2K02NE?=
 =?us-ascii?Q?gTpo8eB8UYrI+VH4JVLB061JCUKLFsfR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7i/e+YM+wsEETbU9xWg+T8YCPsFJTjdY6FhS7ynwth6cYT02WHynt5ESwRxk?=
 =?us-ascii?Q?D3vwficlxtoC5SHJPSEpzZYWRR7pFHdOtcgH4B091wjRx8ZexzZPJh378fRw?=
 =?us-ascii?Q?C4AKzErEGE0PtMJO8CPBVEiXSUxTmvxOR8YJqBGtI6JaeamzWkPQ+xCzJIYd?=
 =?us-ascii?Q?0THQOBS+XK+rBJB2JC2oN7w0delVAGAlF7/Ll7aSz/o6Qu8kZYmaRCDu3TOM?=
 =?us-ascii?Q?chfUFUxjvutcn6escDeRJH8hLruo1MlX1BHqS77naA1oGpq8DL0W452lTtC0?=
 =?us-ascii?Q?cnrtOiodlxy8UFoZvuktsO44ATO2pfyIJiRKrWHECR1BykJ+v7fYVL4Saki4?=
 =?us-ascii?Q?vp05pUEnKxswbcUxbo+tmN+cQ5bhuDkYw4+w4L4qhGKzhqr9Acs8X5tKdmIQ?=
 =?us-ascii?Q?e/pTii6taziRdXY/Nkk2CM+PBICG1gSSb1sHkUA1B2cyNaajrxgImD//mZXm?=
 =?us-ascii?Q?F49wbezQjNfgPliqPMIGPChCYQwG3bqbhDcXJGLL0TtGQ4g0khS71fVE2LXu?=
 =?us-ascii?Q?reafY6eObr2Idjzq4+teC9+dL9A8lRvbSr2DwbNS8ogJmE1Jqf5kXNi6WHWl?=
 =?us-ascii?Q?zLCwaAUSZRuziveeDNyzy9Ll0WaePwa3nfMyG7fzNTu015OwAYkbkObFPwSu?=
 =?us-ascii?Q?mqGvggx7M4LPiQ9gweBqPgyY2JNOX811jwFu0yFBOmQq0C4E4KZmBNfhmLX/?=
 =?us-ascii?Q?Ik6xCYJazpbaFjAC2AYatPhdHow3oVUuUpQ7/cYXoS2WmyJegztfWmXX3mIE?=
 =?us-ascii?Q?XpoKK/fj3sQblrdXVafNGALMvftwk4jvcseb0KT7oDhT++VUcNg8XDfzPzTD?=
 =?us-ascii?Q?0SJP6esC2JggjH6aysYip+bzxug2FhWqWL/0qE8gFosOgxVULPIeK8BP8r8t?=
 =?us-ascii?Q?QjGoQYXvnyZNjKrsjKZghoG7BR+3IlxUvk5QW9gx9Z1rXwFtCN/xRiTQ55Jd?=
 =?us-ascii?Q?4L5N+FplIUx5yG7v7LcXy0NJti9th3h38bALloZ6SLULxRr0cQQn92ZzTcX9?=
 =?us-ascii?Q?EySOq93++5FvrkfF/N9m0Sl+nRkcAdAE9VA/JFAVZ5QctYkrIBQXJ6SlpW9n?=
 =?us-ascii?Q?PN5s84zMjC8pRXuRRydtF/PxIjEC2Yh/rCWKACkUXWWW+ySnuLnmj1luprW8?=
 =?us-ascii?Q?uNjbnFmOBnfYFNVjHaKU6kHwwwvcz4ooPKYuq3PA7MOrIg6Zt6orqBWJzY9W?=
 =?us-ascii?Q?3bOSkY4W2wqU/777LtltNYSJr86UbbJ1/oKAjxDuIZcOndRCJG+INu5x0C6E?=
 =?us-ascii?Q?rheeWdWwj0b29KFC8D3c+XHUYY9yX7sTE3w94DKQtbb8laiKPH7v+SLf0JVi?=
 =?us-ascii?Q?DgB2Su6YGYZp2yF0TkeAX5e9FXUSFrb7kuBz7++RtgckuzPmDcViGLZ6bA1C?=
 =?us-ascii?Q?AHqrpJlh+pPaZHkb6BxbpyczsnOi49E2IK2KbhVGWHoKyIm09fU9/R63+ulN?=
 =?us-ascii?Q?6eJv55oI51GND3G5V0+Z5y5d3Tc7cVc5U8XmfEgTajO5tA+ZfuFGWXRqD/dK?=
 =?us-ascii?Q?LWNetYqfi6REjIu8RU3mE+KtrZLex5+vz/Qn7qfvzIxtY5g7bzTaaPwnEnpo?=
 =?us-ascii?Q?pGOTD7SQRzBdV+neLW4WzptKMzEcBW9dZB8D7Ir8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47310c5b-763b-49a9-f546-08de0d3c0cc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:14:30.0233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOZMF8jYZpdzo/r7+KUT93ciAj7+RfNrOkMcjWY9iU+bJYnXzSfbT1r4NbKNIS7dbdcpPBwLlrAjnbh5lapadw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160
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

On 2025-10-16 at 17:22 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> > The GSP requires several areas of memory to operate. Each of these have
> > their own simple embedded page tables. Set these up and map them for DMA
> > to/from GSP using CoherentAllocation's. Return the DMA handle describing
> > where each of these regions are for future use when booting GSP.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > Changes for v5:
> >  - Move GSP_HEAP_ALIGNMENT to gsp/fw.rs and add a comment.
> >  - Create a LogBuffer type.
> >  - Use checked_add to ensure PTE values don't overflow.
> >  - Added some type documentation (shamelessly stolen from Nouveau)
> >
> > Change for v3:
> >  - Clean up the PTE array creation, with much thanks to Alex for doing
> >    most it (please let me know if I should put you as co-developer!)
> >
> > Changes for v2:
> >  - Renamed GspMemOjbects to Gsp as that is what they are
> >  - Rebased on Alex's latest series
> > ---
> >  drivers/gpu/nova-core/gpu.rs                  |   2 +-
> >  drivers/gpu/nova-core/gsp.rs                  | 106 ++++++++++++++++--
> >  drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++++-
> >  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
> >  4 files changed, 179 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> > index ea124d1912e7..c1396775e9b6 100644
> > --- a/drivers/gpu/nova-core/gpu.rs
> > +++ b/drivers/gpu/nova-core/gpu.rs
> > @@ -197,7 +197,7 @@ pub(crate) fn new<'a>(
> >  
> >              sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
> >  
> > -            gsp <- Gsp::new(),
> > +            gsp <- Gsp::new(pdev)?,
> >  
> >              _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
> >  
> > diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> > index 221281da1a45..f1727173bd42 100644
> > --- a/drivers/gpu/nova-core/gsp.rs
> > +++ b/drivers/gpu/nova-core/gsp.rs
> > @@ -2,25 +2,117 @@
> >  
> >  mod boot;
> >  
> > +use kernel::device;
> > +use kernel::dma::CoherentAllocation;
> > +use kernel::dma::DmaAddress;
> > +use kernel::dma_write;
> > +use kernel::pci;
> >  use kernel::prelude::*;
> > -use kernel::ptr::Alignment;
> > +use kernel::transmute::AsBytes;
> >  
> >  pub(crate) use fw::{GspFwWprMeta, LibosParams};
> >  
> >  mod fw;
> >  
> > +use fw::LibosMemoryRegionInitArgument;
> > +
> >  pub(crate) const GSP_PAGE_SHIFT: usize = 12;
> >  pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
> > -pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
> > +
> > +/// Number of GSP pages to use in a RM log buffer.
> > +const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
> >  
> >  /// GSP runtime data.
> > -///
> > -/// This is an empty pinned placeholder for now.
> >  #[pin_data]
> > -pub(crate) struct Gsp {}
> > +pub(crate) struct Gsp {
> > +    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> > +    loginit: LogBuffer,
> > +    logintr: LogBuffer,
> > +    logrm: LogBuffer,
> > +}
> > +
> > +#[repr(C)]
> > +struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
> 
> I'd just document this structure a bit as it is not obvious what it does
> from the name alone.

Ok. As discussed I'm going to put your Co-developed-by on v6 and leave this one
to you given I think you're more familiar with it :-)

> > +
> > +/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around it.
> > +unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
> > +
> > +impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
> > +    fn new(handle: DmaAddress) -> Result<Self> {
> > +        let mut ptes = [0u64; NUM_PAGES];
> > +        for (i, pte) in ptes.iter_mut().enumerate() {
> > +            *pte = handle
> > +                .checked_add((i as u64) << GSP_PAGE_SHIFT)
> > +                .ok_or(EOVERFLOW)?;
> > +        }
> > +
> > +        Ok(Self(ptes))
> > +    }
> > +}
> > +
> > +/// The logging buffers are byte queues that contain encoded printf-like
> > +/// messages from GSP-RM.  They need to be decoded by a special application
> > +/// that can parse the buffers.
> > +///
> > +/// The 'loginit' buffer contains logs from early GSP-RM init and
> > +/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
> > +/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
> > +///
> > +/// The physical address map for the log buffer is stored in the buffer
> > +/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
> > +/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
> > +/// then pp points to index into the buffer where the next logging entry will
> > +/// be written. Therefore, the logging data is valid if:
> > +///   1 <= pp < sizeof(buffer)/sizeof(u64)
> 
> Maybe we should mention what happens to the address map, namely that it
> gets overwritten by the buffer data and is only used for the initial
> setup.

Ditto.

> > +struct LogBuffer(CoherentAllocation<u8>);
> > +
> > +impl LogBuffer {
> > +    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> > +        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
> > +
> > +        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
> > +            dev,
> > +            NUM_PAGES * GSP_PAGE_SIZE,
> > +            GFP_KERNEL | __GFP_ZERO,
> > +        )?);
> > +        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
> > +
> > +        // SAFETY: `obj` has just been created and we are its sole user.
> > +        unsafe {
> > +            // Copy the self-mapping PTE at the expected location.
> > +            obj.0
> > +                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
> > +                .copy_from_slice(ptes.as_bytes())
> > +        };
> > +
> > +        Ok(obj)
> > +    }
> > +}
> >  
> >  impl Gsp {
> > -    pub(crate) fn new() -> impl PinInit<Self> {
> > -        pin_init!(Self {})
> > +    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
> > +        let dev = pdev.as_ref();
> > +        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
> > +            dev,
> > +            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
> > +            GFP_KERNEL | __GFP_ZERO,
> > +        )?;
> > +
> > +        // Initialise the logging structures. The OpenRM equivalents are in:
> > +        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
> > +        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
> > +        let loginit = LogBuffer::new(dev)?;
> > +        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)?)?;
> > +        let logintr = LogBuffer::new(dev)?;
> > +        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)?)?;
> > +        let logrm = LogBuffer::new(dev)?;
> > +        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0)?)?;
> 
> Let's maybe add a space before each "let" statement.

Ok.

> > +
> > +        Ok(try_pin_init!(Self {
> > +            libos,
> > +            loginit,
> > +            logintr,
> > +            logrm,
> > +        }))
> >      }
> >  }
> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> > index 181baa401770..c3bececc29cd 100644
> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> > @@ -7,15 +7,20 @@
> >  
> >  use core::ops::Range;
> >  
> > -use kernel::ptr::Alignable;
> > +use kernel::dma::CoherentAllocation;
> > +use kernel::prelude::*;
> > +use kernel::ptr::{Alignable, Alignment};
> >  use kernel::sizes::SZ_1M;
> > +use kernel::transmute::{AsBytes, FromBytes};
> >  
> >  use crate::gpu::Chipset;
> > -use crate::gsp;
> >  
> >  /// Dummy type to group methods related to heap parameters for running the GSP firmware.
> >  pub(crate) struct GspFwHeapParams(());
> >  
> > +/// Minimum required alignment for the GSP heap.
> > +const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
> > +
> >  impl GspFwHeapParams {
> >      /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
> >      /// and including the first client subdevice allocation).
> > @@ -29,7 +34,7 @@ fn base_rm_size(_chipset: Chipset) -> u64 {
> >      /// Returns the amount of heap memory required to support a single channel allocation.
> >      fn client_alloc_size() -> u64 {
> >          u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
> > -            .align_up(gsp::GSP_HEAP_ALIGNMENT)
> > +            .align_up(GSP_HEAP_ALIGNMENT)
> >              .unwrap_or(u64::MAX)
> >      }
> >  
> > @@ -40,7 +45,7 @@ fn management_overhead(fb_size: u64) -> u64 {
> >  
> >          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
> >              .saturating_mul(fb_size_gb)
> > -            .align_up(gsp::GSP_HEAP_ALIGNMENT)
> > +            .align_up(GSP_HEAP_ALIGNMENT)
> >              .unwrap_or(u64::MAX)
> >      }
> >  }
> > @@ -99,3 +104,54 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
> >  /// addresses of the GSP bootloader and firmware.
> >  #[repr(transparent)]
> >  pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
> > +
> > +/// Struct containing the arguments required to pass a memory buffer to the GSP
> > +/// for use during initialisation.
> > +///
> > +/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
> > +/// configured for a larger page size (e.g. 64K pages), we need to give
> > +/// the GSP an array of 4K pages. Since we only create physically contiguous
> > +/// buffers the math to calculate the addresses is simple.
> > +///
> > +/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
> > +/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
> > +/// buffers to be physically contiguous anyway.
> > +///
> > +/// The memory allocated for the arguments must remain until the GSP sends the
> > +/// init_done RPC.
> > +#[repr(transparent)]
> > +pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
> > +
> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> > +unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
> > +
> > +// SAFETY: This struct only contains integer types for which all bit patterns
> > +// are valid.
> > +unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
> > +
> > +impl LibosMemoryRegionInitArgument {
> > +    pub(crate) fn new<A: AsBytes + FromBytes>(
> > +        name: &'static str,
> > +        obj: &CoherentAllocation<A>,
> > +    ) -> Result<Self> {
> > +        /// Generates the `ID8` identifier required for some GSP objects.
> > +        fn id8(name: &str) -> u64 {
> > +            let mut bytes = [0u8; core::mem::size_of::<u64>()];
> > +
> > +            for (c, b) in name.bytes().rev().zip(&mut bytes) {
> > +                *b = c;
> > +            }
> > +
> > +            u64::from_ne_bytes(bytes)
> > +        }
> > +
> > +        Ok(Self(bindings::LibosMemoryRegionInitArgument {
> > +            id8: id8(name),
> > +            pa: obj.dma_handle(),
> > +            size: obj.size() as u64,
> > +            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS.try_into()?,
> > +            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM.try_into()?,
> 
> The unneeded runtime check is a bit unfortunate, and its removal would
> allow us to make this method non-fallible, but I cannot find a good
> alternative that also doesn't clutter the code. Can't wait for const
> traits methods! :)
