Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5ABA79E5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 02:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527B910E18B;
	Mon, 29 Sep 2025 00:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BknjnLAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD18910E034;
 Mon, 29 Sep 2025 00:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn2sCwyLGrUU+022e+03znh7ZOFFv9qSYDDBxfK0GVxnl0TvWjqDxhd/ec2VcGqdSrAaA7dtVt9bp4KQxQDCJ8tyCfcJRCk1Dbxkc5fBksQzZZrExZKtFTm/oKhIb7jLn88U6BUpv+ZkTOQuez8HEXXmU596USju1JeZb/xrpM8k1+gr4qrU+2OUzd5u+IglSlqIo9WwpeYj71UDk5oeWeouUFZMbq+tNa1/b+Gw+9VUx+YwGhWp+O8pZoGZLBSOGvEGdsH9KksELCeuWtPjGR4iIL7xrJTcgEzDKxlgcVbYhE/wgCUpPnF6n1UWz9JAkwnnheZhAOlJHNPFqok8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5c4cT6c/513bedKNYekr+BwTLH4RzTO9fusq0l4yYc=;
 b=ECcZ3K8pnxNXu2iMIDKT0A8ijwFGWhzfOvbA0jCnYkfk6Ryy+g2DTU1COiGjvskx1CRSE3ikLsABYaOTvs9zM2PLEWSfnAbNcI/m46o/uQqRVSA31Bu21g3rx20pDZ45pQuJTehCIiKCmVDb/t6ftaxLek1Qen75g+i8vzDbPvL/6OOWFLThV8/ExK9ldK7la4k6vd3LcU9VSbuiX0DxaVAbbUFkMXS8FQ5HAJ3k6lBksrM9fPZI4namievVo4TYsQsfGYtiKxCHh5noaMihMmDnxCVSuPUqPO6N4DzZpkjRi9AbOnBsKceekOJWD61JKzkVD5mdUo1B+rpNFnYK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5c4cT6c/513bedKNYekr+BwTLH4RzTO9fusq0l4yYc=;
 b=BknjnLADMoprJKU3wmcvygpk7uSVdfEWsV/G0XC7sJczvr56TDQ1neL7ObwuVrKKNxxMKYYN4d5Ig+QfaFSfuKNcWw2WGBJ+yAJO7Y3Y3OiAM/WQV8fuGUiWyvO9ijLiggCiUqHwv2GSjiTDJ3Jz+1rKWBYpCUx0OrOfSrGSHw2SNe5RYvkVboievkf9K0Y+Wg12coDdmuT+uFI7wG7DTs6QJMbQ1E8EgHbmCbCckfkTQJoG8aDv/uJc597Y2Z+M2vLbB7K/3064GdNEw/H5KSwl7Eo9x0NSKalP2EqhA7drOG1pNP4VzRLdquJIoQEYeM4q0SHNZIZKHRmQzNEsCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 00:19:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 00:19:37 +0000
Date: Mon, 29 Sep 2025 10:19:32 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <um3463eyjtecebxdgjpegankwxgezqgeiqff6xy5wducnv7ayf@pnjhxbro2sh5>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
 <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
 <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
X-ClientProxiedBy: SYBPR01CA0172.ausprd01.prod.outlook.com
 (2603:10c6:10:52::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a6917b-d54f-4c12-c011-08ddfeeddfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8WRgUTszzOJWO7s9qi4WyX6a0/hgZrH94/veqZ3M/iwt546JDhmnvrE8N+3/?=
 =?us-ascii?Q?ZDxXRPoeGts8ySD/SUf6m1+IkaEMwVi/ZprvlgUPQyh9suF/tfFPT89EvJ6M?=
 =?us-ascii?Q?8yTpeixc7pE4BfrtbXT23+LbFZ4pCorkod5U/1NlLCELPlVO3R8k407GKedK?=
 =?us-ascii?Q?mY5hzyJWLo/UE3/I+0NDREuXsVi3bN/blLz5sZO/3T/rkDeQSctJMzgQUtrw?=
 =?us-ascii?Q?PlQSpjRsRZPkqQk8ZGd49eC5qWUsciq46S7Ib+jMH1DpWJmdSaeDKM6oDGTE?=
 =?us-ascii?Q?ky93ATbJG+aHZzXhKz3PDqKog9ixMwgyZIx/jNwCXZm9SVGpO8p0anv12Dij?=
 =?us-ascii?Q?jg1jnCcNDZtu0UuNHZzyNwGbx3yC1aeZX2zywzc1EwKU77lIPJsncGrfHDmf?=
 =?us-ascii?Q?p8DrpKUzjelCGeTGh1DRjKzfpmLldJPGqi+ahAgMGVLZvYzY9ymiaDtXBxuB?=
 =?us-ascii?Q?u2DBUotjKyWk2WBJcRhlWsEFqfKa5Q0Z07Z081IEyebvoHObgkXLq6lQ68AO?=
 =?us-ascii?Q?ki1nT9/9xhx3QMHxwriNLKEl2bbWXmGGHcoNg8Lr1iRSwh9TKlspdheGdjhA?=
 =?us-ascii?Q?LndyRHA3tGUtYxn93Iz6IgJN+eq9oifXc0/7st/+HrdRfkxYMpIkCjksPyhy?=
 =?us-ascii?Q?istpWg8F8MCXwwOpa+fFa2niwXY/CfrTaxmeK2t0JlhSrH6WoPIHYWR4HPlR?=
 =?us-ascii?Q?uEW0+FD3NqubUmnHVM5weIshG92SMTz6GikOHwUb33ZVFMAzeQPEU3RSHntN?=
 =?us-ascii?Q?TGBW6SCy3NDRBk7V4lGWNNsU88tL9o89/ch/P35SpGC1fX83n/l2scXwLaJt?=
 =?us-ascii?Q?YADrWqjXt6UgsdVP8eamh9jug4ixkpMlWxdf2civgFF3q28Dp38VALdrlgHo?=
 =?us-ascii?Q?wrmkVgCduWA4G8U1SAKArBYrwPUumMqWdwHM24ivZnJ489EhQO6AfarF82yS?=
 =?us-ascii?Q?U829w+GYLGBZg2bFU0CShidgBpeX3NoxxNH6JmC1EdwPzFYokOFPNvGvXm7k?=
 =?us-ascii?Q?cHvS5vOwlqqkqJTEL0jgUdzFxyusYpHzyDJ/LsBhEXGS8uv+LW1VBpXBnCsx?=
 =?us-ascii?Q?WXWcPmm/Cb5i0iX+bf18bDm6NxXLjpsaivozExiqkmlzdjO3cb3KWLPr+wib?=
 =?us-ascii?Q?kQ+ckpXZX4JJXTeMCDwQQpSFcl3uzvc2kaPM094CyncMIMklHd6oPQppE5Vl?=
 =?us-ascii?Q?G/rALK788TU94bL/HCY7wIjNY6hKzVlIkklEDvLoqiocKQaxT+HJqrBOfGEH?=
 =?us-ascii?Q?o0ySaneHamNnQ8buqTcWMLguL9Vof9e6WiHLp2S04aX1FwFBgl9GpObMKEsw?=
 =?us-ascii?Q?51o1Wuzx8rxHpnL/2cYvAqtUy2hLsNFqJLI62yAYD+3/DfIpq5ohXuR8oo++?=
 =?us-ascii?Q?yYCyIgN1s++l3HXws6AwTRW+airdsm9hY2b9Nfp9Ik2613MHm8J4zcgFNo18?=
 =?us-ascii?Q?1fyZT5uxdUNg8bJ5K+NRw4xAwlYov98e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mC7Lr9gDWCmoeMN/Kw2knvHiS3KE9V2pt8dK0FDlDF9GQ6wsn7Hxj3KzCmsu?=
 =?us-ascii?Q?5hMs6u+mS15zT/pLGU1VudGZE0BBwLEpQ7/85h8qLDLkQW9rjj1KyJFilVD9?=
 =?us-ascii?Q?Sp5vlJXdb5EoxdAicByag94V+sG3VaNAr+yAuwNAqcvbTFzIQ2W8wmUlyN5x?=
 =?us-ascii?Q?3TrY8GgLsp6ZkVOC6hoFxzwW4hyr1eD6B9saalt+su6js1vzUCykIlJKCnXI?=
 =?us-ascii?Q?KbPTjcsOahTJJCsR+IANnGHW2M2BUUx2NjTT0Y4mhFJdfndGfHY0V6bOWvaU?=
 =?us-ascii?Q?Iu155nqbDxQb3ejvUc2QNmeb54q0LP+nUqAnvdWGU097lD8FjZhcYiSmUjy+?=
 =?us-ascii?Q?FF1zneSSdmUtaQYDthgC7sjn5zdZZS/8kP83s4Ay09/tmRoBdjzjUuV34YRL?=
 =?us-ascii?Q?ivuNOB95DR6yPx1Ol4e7EQRhedP7ie1zDUF61KB5pNsJD6/Ld4LAc94mocSa?=
 =?us-ascii?Q?qZITjfpvgEafsbwe1XSSfsHsg9aTM/HKs0QezXdfEflHU9y78ayhAq6/xzYB?=
 =?us-ascii?Q?GgQu4yGNUiYrU1xBeMsOGspAnBhw+lIIJ81j0XDXimRZ/oS00lbmI3gsDr2V?=
 =?us-ascii?Q?RoIz33F9tDW3Qsp+1CK6V7TzRJ1dscrTtbgsi42PkOSROGQF2EYpkzQvixxf?=
 =?us-ascii?Q?8ABE7W2e/qmimv2Zh8VwJRDNOvxOcO+5+EZm5mNMn4z2/XKCNe1pyGld8a0I?=
 =?us-ascii?Q?eO02QaNWAWkRqBTrR8YAdX5DDQ77uWway7Uz8dRO99wq+fhufWy8WLD8eQVp?=
 =?us-ascii?Q?4pGL+pe2JGLnXmCQQ50bUt5QoHe/OGTiSQGWw5TqPiu3bg8hWvFEboU+Rqm7?=
 =?us-ascii?Q?0PX3xYPNtq5K2yzkOcAJADjXszP+pGXhca3c3TaAwaLgyvJi0P0KBk4okBDE?=
 =?us-ascii?Q?FsVeGj2thk23d1MVkcx+pa7rtXnV1FjrMfXQYZOK0KZwGdzegWXqhgkBHSC1?=
 =?us-ascii?Q?vlXNkEdZilGIx7CEUtMn+yd8wY6v0PECuFCnn9NlX3vrW0fHiCGCi168HAuI?=
 =?us-ascii?Q?8SEnIc1rHJUNJPQjnTM7oy8RgJGLNrmafwoqjIzP2z+PNsaWgpsWexY2N13v?=
 =?us-ascii?Q?TtkwFdM7ODS26IL4zJ6XxeEhHiQoJn61jkval+boCd1zxBZMlB5UaaNzYeT3?=
 =?us-ascii?Q?ZdVXXGsG9cdNlxcPQxTLEECK4X099JnSlcerizHLqmSh9fi0WPPFBHlPelfp?=
 =?us-ascii?Q?2N/eObf+bSWCcUgWV4QEuUkdmPxiv6ECA/sKWG7xGRkL2mYTLxu/qk5udEWU?=
 =?us-ascii?Q?K/jTtcSLoPS9NjMw+S1/EorD+nzNWLrrhoOyhCVd+ODL/sh6/h2oJPvkZCUo?=
 =?us-ascii?Q?GGF51zRismYPi7GLQ/IojP28g9c81zxZNP5QdyxZsfFCJL4mPH9cuxMTgFYT?=
 =?us-ascii?Q?7+nh/5OMGfawEx00b+0ZdkBRf/JkwDgUqV4/kgj9t31pCX8grzYNzv1RXm0y?=
 =?us-ascii?Q?mynjj/2FZ8nJtxhxM93i5yl8IDg2jKraIXQk8mPNqr/UTxTnE/gaw36SgmfC?=
 =?us-ascii?Q?e6OobGVqTQWePkTMQZxEByJWxrkyie5VJfE20tQRe/plXQOZh8Xb1gW0Qjw3?=
 =?us-ascii?Q?gcdPYPdU1oin+PUjFDx8FzJ4WcVNe+erHNdVpiB/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a6917b-d54f-4c12-c011-08ddfeeddfac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 00:19:37.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P209+NheXy2dNYCiMB3938zCXtE4gjiYCbUaUP6fbjpBPOVsgzNgY+dKcZzOfR2CypwVXxu/Wc7YrGrCHAvOVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492
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

On 2025-09-26 at 22:00 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> On Tue Sep 23, 2025 at 6:29 AM CEST, Alistair Popple wrote:
> > On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> >> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
> >> > On 9/22/25 1:30 PM, Alistair Popple wrote:
> >> >> +        // SAFETY: No DMA allocations have been made yet
> >> > 
> >> > It's not really about DMA allocations that have been made previously, there is
> >> > no unsafe behavior in that.
> >> > 
> >> > It's about the method must not be called concurrently with any DMA allocation or
> >> > mapping primitives.
> >> > 
> >> > Can you please adjust the comment correspondingly?
> >
> > Sure.
> >
> >> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
> >> > 
> >> > As Boqun mentioned, we shouldn't have a magic number for this. I don't know if
> >> > it will change for future chips, but maybe we should move this to gpu::Spec to
> >> 
> >> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post those
> >> patches, I'll use a HAL to select the value.
> >> 
> >> > be safe.
> >> > 
> >> > At least, create a constant for it (also in gpu::Spec?); in Nouveau I named this
> >> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a better idea,
> >> > please go for it. :)
> >
> > Well it's certainly not the VA_SPACE width ... that's a different address space :-)
> 
> I mean, sure. But isn't the limitation of 47 bits coming from the MMU and hence
> defines the VA space width and the DMA bit width we can support?

Not at all. The 47 bit limitation comes from what the DMA engines can physically
address, whilst the MMU converts virtual addresses to physical DMA addresses.
So the two address spaces are different and can have different widths. Indeed
most of our current GPUs have a virtual address space of 49 bits whilst only
supporting 47 bits of DMA address space.

> > I thought from the context that the magic number was pretty obviously the
> > supported DMA address width in bits, especially given the extra decoration
> > of the DmaMask type. Certainly that's been the accepted practice for the rest
> > of the kernel where pretty much all drivers just use something of the form
> > dma_set_mask(drm_dev->dev, DMA_BIT_MASK(44)) or whatever DMA address widths
> > they support.
> >
> >> GPU_DMA_BIT_WIDTH, for now?
> >
> > Works for me.
> >
> >> thanks,
> >> -- 
> >> John Hubbard
> >> 
> 
