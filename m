Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4FB4195F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2155D10E5B3;
	Wed,  3 Sep 2025 08:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PYMBzK3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16B110E65A;
 Wed,  3 Sep 2025 08:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfACbiSImBUK6oBxavToFpFSKQvQmlmnWu8BRggbS1Sq8RdUdTwxajMpWVffy6W7O/QV2owqUMPMhaG5qd+QtT+XlNbHfLiJ3Db3zhNyqBv0fgAW1wTPvLcaUPScBzqHv/MXfKiyneMS4MIw9PBz8Ujv14IwwhrkiiEKwbxoy4OHwNwXWm5p8IPIntZHq5KH25ebHtDkxqU1Ev8FC8dziMTZFZgcH7Xlu7HEkkVWu0IsLTAZ4cfy0DqzEx5Es50scQ0XTXPNI2GBwSoP8AMj5yLAUgkHWsbcZLyOj/b6ccYW7/1DMRN8NmtERBmWpKtM0VU5KZ5cmWDZ3wOhncugGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4NPfkvmasnaa5Z8cFoJvXnbfmWUy7Yxmdv2kDRIs10=;
 b=i7UgALHxZwVuuCz9iQv41RJ211DgZXheB0qkY6uPRBxnN7QwS+11PitievhsxGcvZHKadmUd6mv9HMZQHflJcrQy+vrjsCWLYvVe88Gp5GTT/Y+6ylGa3JEqpBhNImjIFxHIvhboUv7crjjQApkBkNWtCjlEVcGud6qONFz4wf6fggGy0BhcrXvig4Q8BHB3IEidjSNCYET2GWJiMT1TjXGWi2bpvJf9PHjvhempW8kTFnK5NmcvYGRVWkNYB7gP1fYm/WnMsEIa6rTfWB609NtdjwbvHqidzJTDxt7rLjrKbxydVeWJJHDc7GXKncF9MSZ9yO5Si8HeYfN+51yhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4NPfkvmasnaa5Z8cFoJvXnbfmWUy7Yxmdv2kDRIs10=;
 b=PYMBzK3AOfQM6g0VY177UVZTL6OJnB6kvrmQpvEa6QSNZITXTEEvKvXBYiqArM94hG1EAni5La0IfL3UWcW9CHPuWwtDB/qgnk9Uz5mTVzgtX2bTq/pOiD3y0sSLbA1Y0HiEwOS9rl07iycqs/OIx5qP7RsFP7vnXW94XH7B9qmGgfe7cvljOcdoRH8FO7DuckAsxNu9QA/5EVvk8QaGVXaChCJ0LaCjmznuv1vgvJtJnFhx4vkS4lxxjuKw/hr2b3e8aITkwWftUYVKkA1GumJvnOiijDkDH2gF8/WoS2z+bFs7KU/sGuP6aK8NDVXRsq5lmdNQ6tt2F1O/lXYdRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS1SPRMB0005.namprd12.prod.outlook.com (2603:10b6:8:1e3::12) by
 IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:57:35 +0000
Received: from DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f]) by DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:57:34 +0000
Date: Wed, 3 Sep 2025 18:57:28 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/10] gpu: nova-core: gsp: Create wpr metadata
Message-ID: <iyjecyybwyilem2ituw6esmufid72cximthc5qo2fgdpzz4fko@cb6n2vcrptb5>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-4-apopple@nvidia.com>
 <DCHAPJRPKSSA.37QLQGAVCERCZ@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCHAPJRPKSSA.37QLQGAVCERCZ@nvidia.com>
X-ClientProxiedBy: ME4P282CA0017.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:90::27) To DS1SPRMB0005.namprd12.prod.outlook.com
 (2603:10b6:8:1e3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1SPRMB0005:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: f677dec8-1efb-48fb-8ad9-08ddeac7ec78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LYfDzePeG90GmFlftTBoaWdYx8wzIVq+FATbxDpC/tZAa59KjUSQ1GIXRwL4?=
 =?us-ascii?Q?8MEKKcpa8nZ4bJi3SWD2VccUtCvBGRt8dx6PNAJ2Wa9H3q+r6pkSDdTKgjHL?=
 =?us-ascii?Q?5EJMCFIb+gktc8U8HpbM+2bGbAkbQ9ComgiiJcdHSmMg2QVOP7mmrX0I5EgY?=
 =?us-ascii?Q?WB1fm4S/c8EXRAsMkHc4cYQE4zEcOFvFvaJlpsDOtQA1Q+d0b6C/Sx6d1hNh?=
 =?us-ascii?Q?2cMqrvQG00+2RjhDVqPHcaj8EfTHZaBKqrkdvYgEXPVcgkTG9+m0skdf3/e5?=
 =?us-ascii?Q?AmTXl+N4jdsseyuDYBVMxdxIweknfJzw3fIHeBAikQ5DnvYu9qrC7m8ELRC7?=
 =?us-ascii?Q?9HYC4sACyrJDkZmepNfKBYepnlSdQgP0cU7twn+RaY5k7T+qrqCwzZtkxKIA?=
 =?us-ascii?Q?e0QMllrCI8sqlnCDzaxgj9XcQMKexfngYkldmbcN6i8y8q32XYCe50D8rP1h?=
 =?us-ascii?Q?zWr/lEQfY11D2gnFIxb9MqINfka8hs8bknGAs8HqL5qCb2SOtRAhzVEUQfmI?=
 =?us-ascii?Q?H+Xj37beYqyzX21++rUX/VQgN8NcBZo8ajBTMUEpquPqUE9pKI3QrxH90Qf5?=
 =?us-ascii?Q?7/Fo0/7/16iDB+UwkNM5H8RBMh0ocb047KQLQ0p0S/pS94xDl7la/SbagB/L?=
 =?us-ascii?Q?omc5wnmjBw+qrAgbLu2mPCc5qYtJ9wEuHQrrozi2IYKanSG82WXTRh6ejT53?=
 =?us-ascii?Q?bpNs/Qbg7bIbNRw6VUCovbboYcSVBpQNXpOGol0pTFGPDhyUMgn7ybWH4LI0?=
 =?us-ascii?Q?Rahi6r60qvV5aOgKkvMp0mgLbQu0kaGPUS8DA8Vc5V7Sr5t/qQb6q6bcCKNS?=
 =?us-ascii?Q?46uX4j51keIg1M+GuqZrSkHuuXwCw00rsCZ5cqO/a8zeTDkmkFiAlVlmWZRy?=
 =?us-ascii?Q?Fopj++8+ApC3tDs4IFQjPPTtExgfEIyZlU42/EF6R0fbkzELZB8hkPUaG4Ca?=
 =?us-ascii?Q?R+i6DG3dWBehtblZrhSprNde3KjduhMO+ReXyXcjxM2gXCO+AeXAhN4hOzT7?=
 =?us-ascii?Q?zkKsSl3Ka5bnv3Ox7UAnpIhfukuh6JSMkxUjRIuG5XQZUMwcfspW6cKNLb6c?=
 =?us-ascii?Q?P0dzoODZF5ohnxGPn8UTcqBCjjiAH4JpgDjxGQNl95nF4MJDXG9v/SQ1mVrG?=
 =?us-ascii?Q?iTmRQpnzv/x/owLvoVf3KsiHK62mgwcB+s9seqaox+CBZyaZrlzADRMsBCc1?=
 =?us-ascii?Q?0DI0fuzuvH1upIlR+zTCKqyvnPwREDorWGWEwKjPqTiCNkfar3pnfvf5+xp5?=
 =?us-ascii?Q?SIWm973FP4zkHMNQCzlXTNYi/gHcwt8GnglpJX2LOWCSkPLoRYiheqJ7m0Ji?=
 =?us-ascii?Q?wblziyyCCwQCXjOxLufgi2pSvzS3tIeKWTuL7iTOyKjoAQHVEjpHVw8dmpzI?=
 =?us-ascii?Q?9xtYOZWIP9Ddmq+kR9cUvxa5l3NVFRNfpxlD1r4EcOoy37i5d3r1liLsJc5R?=
 =?us-ascii?Q?7CuecwHDW5I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS1SPRMB0005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cL6C0FcaraMrjNECtzm6fad1hXapEcH8XId+OPoLiI+Z2fQtaFiFGVRJWYTh?=
 =?us-ascii?Q?MEMxRM8gZMGiPDNX5QGinCePlPaAcCMaZb/6Wrg+O1kt92EVbOGAZIfIYxBG?=
 =?us-ascii?Q?3BXHs7YKgaYYnCIA+NwDxYvDlbEn6w2YXvT5qpuoRJduDKjAz8Z4jO71sahu?=
 =?us-ascii?Q?b5AKMyS1r5bvOxEiTqN8AGX/+2H3JjbTFC0DUzk6AEzshNUEAr1bJK/5YYcM?=
 =?us-ascii?Q?lupjwm4Z/4BAn3G0Ow3NWtHJ/o9qsSRDHRlrFqy1BeHjH0ZtYKXlxYrianfr?=
 =?us-ascii?Q?2x2f5VQ9yQZKQRASHb7x4NMOFZWEdNqRSEEb5FoTAVtEUd/2ei2d2w625Z8S?=
 =?us-ascii?Q?VbKDwBJZaStqLJX/r3ZJ6yAIIyyWNFodhpDQuEEyQy+6qkcTKykt0aSzzh+L?=
 =?us-ascii?Q?rn7GU3+02SJKShZS+64K+CIlqKPSD2ma20zAqqpJYc9ApkCd46k9yiL0jmKK?=
 =?us-ascii?Q?ysqPoi6zJLC8GpgLXZUcLwLGqP6D+F6LkoJ7nBSinUk3i+zXI46XbgvldpQ0?=
 =?us-ascii?Q?z+dtzGyrPwLgiYLGlJ7OOS6OWMcojfj6enmPxpc0Or+l96CDUGSDncjv8HcX?=
 =?us-ascii?Q?6c/HUZVgxbawxsjotk+Oi7HVI2ryH+wypongba6bbP4Y8ttDrue1md0iHbSk?=
 =?us-ascii?Q?l2iv2T2Z1o9qhPgaMBZOH5jJ4TbVLWKLdjTGfU+xbhtauZAIldqeE/8ggYOn?=
 =?us-ascii?Q?5KjJ0r93CCcHBxjh1TrYJI1F3rFPYTPUtzn9Pd4I6cviM3kwBypToKs7jcSY?=
 =?us-ascii?Q?uwKO0lTAhvNAkTAHDw3A1y4ZZRoo8MuE8mbqt6VnbFWKWwrojgbF/4flK1fP?=
 =?us-ascii?Q?esVf52ZlE/rKO9bYB53+scsa0pM5G8TI7zh/Hnd8yYgvflKp/LkuMLnwBLAS?=
 =?us-ascii?Q?Vd8NQAHP0seW9ZL0k9vzk7iIhHNWvkxaB/kLrxCv/mLQikgfDF7GoZ8XOblN?=
 =?us-ascii?Q?+tj+AeuiTxMGD543ONZyhrlZgS8AHo+HoGk6ZwIOis1io/GB/7ExS9uQJegv?=
 =?us-ascii?Q?hH5G/IppmC34f8hGGt/7GhQaFb951fqfEHfGavjty8Uropm+vAWPlzh9jFCx?=
 =?us-ascii?Q?PEQ7IgYPKZJ9pGohsPGsHEVXt3cMD6NojnI/YUXw6PjN3VKYzPLmh4F0K2zb?=
 =?us-ascii?Q?yc178pi6wB7HdgWUT+mr9SQEicmlnxVq1vvr6fA3E2bo+YfVxG7Nb/WSP5nH?=
 =?us-ascii?Q?+WHk9m4oXDysOFMbeBYWEy9/m8vOVfztkypgjzBsAdu3QcPLac5cXKAON3TD?=
 =?us-ascii?Q?lSIKWPF0vcCxuazMiRm8ULVm0N9F1zS1QnIxDFnHgNAYZ/yu+XiEtAACoSQe?=
 =?us-ascii?Q?y/3iBbVUx3uyy98sMJvzqU1iRB4r2E6sCMFp6Cv2YbND16q3ds06+hhTbmHu?=
 =?us-ascii?Q?YwwlqcSavQ6QYiR/NjIOl9Zc8LZ9WOCeVutlLtxdHDcx163+/3Kj3TqTTk6m?=
 =?us-ascii?Q?jLl0klH02dWNK2dnthdWHyNJ7IlBr45Ut4/mWI6WHLoni7YYP3wM6y4TJho2?=
 =?us-ascii?Q?VWgqAtiZvHVvmjt2KmaYN8srNsl7SCeYYoBZW/02z5eu16kRSqQoo/7WQUmC?=
 =?us-ascii?Q?MH3JxcmxHuy4VqZj9JUmS7g6Z5O6KFnAGAADPsFl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f677dec8-1efb-48fb-8ad9-08ddeac7ec78
X-MS-Exchange-CrossTenant-AuthSource: DS1SPRMB0005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:57:34.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKAnmT8Z2z9gS2O1VdMmr4wN+3jchShLByGczEoXZDgVncDlB3KCkZrUWbUh7Vz3y5Y2TeIFVPHp15sELrJEpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
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

On 2025-09-01 at 17:46 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> Hi Alistair,
> 
> On Wed Aug 27, 2025 at 5:20 PM JST, Alistair Popple wrote:
> <snip>
> > index 161c057350622..1f51e354b9569 100644
> > --- a/drivers/gpu/nova-core/gsp.rs
> > +++ b/drivers/gpu/nova-core/gsp.rs
> > @@ -6,12 +6,17 @@
> >  use kernel::dma_write;
> >  use kernel::pci;
> >  use kernel::prelude::*;
> > -use kernel::ptr::Alignment;
> > +use kernel::ptr::{Alignable, Alignment};
> > +use kernel::sizes::SZ_128K;
> >  use kernel::transmute::{AsBytes, FromBytes};
> >  
> > +use crate::fb::FbLayout;
> > +use crate::firmware::Firmware;
> >  use crate::nvfw::{
> > -    LibosMemoryRegionInitArgument, LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> > -    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
> > +    GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
> > +    LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> > +    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM, GSP_FW_WPR_META_MAGIC,
> > +    GSP_FW_WPR_META_REVISION,
> >  };
> >  
> >  pub(crate) const GSP_PAGE_SHIFT: usize = 12;
> > @@ -25,12 +30,69 @@ unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
> >  // are valid.
> >  unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
> >  
> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> > +unsafe impl AsBytes for GspFwWprMeta {}
> > +
> > +// SAFETY: This struct only contains integer types for which all bit patterns
> > +// are valid.
> > +unsafe impl FromBytes for GspFwWprMeta {}
> > +
> >  #[allow(unused)]
> >  pub(crate) struct GspMemObjects {
> >      libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> >      pub loginit: CoherentAllocation<u8>,
> >      pub logintr: CoherentAllocation<u8>,
> >      pub logrm: CoherentAllocation<u8>,
> > +    pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
> > +}
> 
> I think `wpr_meta` is a bit out-of-place in this structure. There are
> several reason for this:
> 
> - All the other members of this structure (including `cmdq` which is
>   added later) are referenced by `libos` and constitute the GSP runtime:
>   they are used as long as the GSP is active. `wpr_meta`, OTOH, does not
>   reference any of the other objects, nor is it referenced by them.
> - `wpr_meta` is never used by the GSP, but needed as a parameter of
>   Booter on SEC2 to load the GSP firmware. It can actually be discarded
>   once this step is completed. This is very different from the rest of
>   this structure, which is used by the GSP.

Yes, I had noticed that too and had tried to remove it previously. But as you
mention below that was a little bit tricky but if you fix it for v3 I think this
all makes perfect sense.

> So I think it doesn't really belong here, and would probably fit better
> in `Firmware`. Now the fault lies in my own series, which doesn't let
> you build `wpr_meta` easily from there. I'll try to fix that in the v3.
>
> And with the removal of `wpr_meta`, this structure ends up strictly
> containing the GSP runtime, including the command queue... Maybe it can
> simply be named `Gsp` then? It is even already in the right module! :)

Agreed - I noticed this right after I renamed this struct last time so wanted
to let things settle down a bit before doing another rename. But I think `Gsp`
makes a whole lot more sense, especially if we remove the wpr_meta data.

> Loosely related, but looking at this series made me realize there is a
> very logical split of our firmware into two "bundles":
> 
> - The GSP bundle includes the GSP runtime data, which is this
>   `GspMemObjects` structure minus `wpr_meta`. We pass it as an input
>   parameter to the GSP firmware using the GSP's falcon mbox registers.
>   It must live as long as the GSP is running.
> - The SEC2 bundle includes Booter, `wpr_meta`, the GSP firmware binary,
>   bootloader and its signatures (which are all referenced by
>   `wpr_meta`). All this data is consumed by SEC2, and crucially can be
>   dropped once the GSP is booted.
> 
> This separation is important as currently we are stuffing anything
> firmware-related into the `Firmware` struct and keep it there forever,
> consuming dozens of megabytes of host memory that we could free. Booting
> the GSP is typically a one-time operation in the life of the GPU device,
> and even if we ever need to do it again, we can very well build the SEC2
> bundle from scratch again.
> 
> I will try to reflect the separation better in the v3 of my patchset -
> then we can just build `wpr_meta` as a local variable of the method that
> runs `Booter`, and drop it (alongside the rest of the SEC2 bundle) upon
> return.
> 
> > +
> > +pub(crate) fn build_wpr_meta(
> > +    dev: &device::Device<device::Bound>,
> > +    fw: &Firmware,
> > +    fb_layout: &FbLayout,
> > +) -> Result<CoherentAllocation<GspFwWprMeta>> {
> > +    let wpr_meta =
> > +        CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
> > +    dma_write!(
> > +        wpr_meta[0] = GspFwWprMeta {
> > +            magic: GSP_FW_WPR_META_MAGIC as u64,
> > +            revision: u64::from(GSP_FW_WPR_META_REVISION),
> > +            sysmemAddrOfRadix3Elf: fw.gsp.lvl0_dma_handle(),
> > +            sizeOfRadix3Elf: fw.gsp.size as u64,
> > +            sysmemAddrOfBootloader: fw.gsp_bootloader.ucode.dma_handle(),
> > +            sizeOfBootloader: fw.gsp_bootloader.ucode.size() as u64,
> > +            bootloaderCodeOffset: u64::from(fw.gsp_bootloader.code_offset),
> > +            bootloaderDataOffset: u64::from(fw.gsp_bootloader.data_offset),
> > +            bootloaderManifestOffset: u64::from(fw.gsp_bootloader.manifest_offset),
> > +            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
> > +                __bindgen_anon_1: GspFwWprMetaBootInfo {
> > +                    sysmemAddrOfSignature: fw.gsp_sigs.dma_handle(),
> > +                    sizeOfSignature: fw.gsp_sigs.size() as u64,
> > +                }
> > +            },
> > +            gspFwRsvdStart: fb_layout.heap.start,
> > +            nonWprHeapOffset: fb_layout.heap.start,
> > +            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
> > +            gspFwWprStart: fb_layout.wpr2.start,
> > +            gspFwHeapOffset: fb_layout.wpr2_heap.start,
> > +            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
> > +            gspFwOffset: fb_layout.elf.start,
> > +            bootBinOffset: fb_layout.boot.start,
> > +            frtsOffset: fb_layout.frts.start,
> > +            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
> > +            gspFwWprEnd: fb_layout
> > +                .vga_workspace
> > +                .start
> > +                .align_down(Alignment::new(SZ_128K)),
> > +            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
> > +            fbSize: fb_layout.fb.end - fb_layout.fb.start,
> > +            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
> > +            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
> > +            ..Default::default()
> > +        }
> > +    )?;
> > +
> > +    Ok(wpr_meta)
> 
> I've discussed the bindings abstractions with Danilo last week. We
> agreed that no layout information should ever escape the `nvfw` module.
> I.e. the fields of `GspFwWprMeta` should not even be visible here.
> 
> Instead, `GspFwWprMeta` should be wrapped privately into another
> structure inside `nvfw`:
> 
>   /// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
>   /// addresses of the GSP bootloader and firmware.
>   #[repr(transparent)]
>   pub(crate) struct GspFwWprMeta(r570_144::GspFwWprMeta);

I'm a little bit unsure what the advantage of this is? Admittedly I'm not sure
I've seen the discussion from last week so I may have missed something but it's
not obvious how creating another layer of abstraction is better. How would it
help contain any layout changes to nvfw? Supporting any new struct fields for
example would almost certainly still require code changes outside nvfw.

My thinking here was that the bindings (at least for GSP) probably want to live
in the Gsp crate/module, and the rest of the driver would be isolated from Gsp
changes by the public API provided by the Gsp crate/module rather than trying to
do that at the binding level. For example the get_gsp_info() command implemented
in [1] provides a separate public struct representing what the rest of the
driver needs, thus ensuring the implementation specific details of Gsp (such as
struct layout) do not leak into the wider nova-core driver.

> All its implementations should also be there:
> 
>   // SAFETY: Padding is explicit and will not contain uninitialized data.
>   unsafe impl AsBytes for GspFwWprMeta {}
> 
>   // SAFETY: This struct only contains integer types for which all bit patterns
>   // are valid.
>   unsafe impl FromBytes for GspFwWprMeta {}

Makes sense.

> And lastly, this `new` method can also be moved into `nvfw`, as an impl
> block for the wrapping `GspFwWprMeta` type. That way no layout detail
> escapes that module, and it will be easier to adapt the code to
> potential layout chances with new firmware versions.
> 
> (note that my series is the one carelessly re-exporting `GspFwWprMeta`
> as-is - I'll fix that too in v3)
> 
> The same applies to `LibosMemoryRegionInitArgument` of the previous
> patch, and other types introduced in subsequent patches. Usually there
> is little more work to do than moving the implentations into `nvfw` as
> everything is already abstracted correctly - just not where we
> eventually want it.

This is where I get a little bit uncomfortable - this doesn't feel right to me.
It seems to me moving all these implementations to the bindings would just end
up with a significant amount of Gsp code in nvfw.rs rather than in the places
that actually use it, making nvfw.rs large and unwieldy and the code more
distributed and harder to follow.

And it's all tightly coupled anyway - for example the Gsp boot arguments require some
command queue offsets which are all pretty specific to the Gsp implementation.
Ie. we can't define some nice public API in the Gsp crate for "getting arguments
required for booting Gsp" without that just being "here is a struct containing
all the fields that must be packed into the Gsp arguments for this version",
which at that point may as well just be the actual struct itself right?

 - Alistair

[1] - https://lore.kernel.org/rust-for-linux/20250829173254.2068763-18-joelagnelf@nvidia.com/
