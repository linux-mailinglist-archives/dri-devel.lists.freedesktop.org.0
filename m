Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8678BF3B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 02:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CED11214A;
	Wed,  8 May 2024 00:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="azMe9IoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0711274D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 00:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ls1fiy4eAqjRuZz4uoH2HWIzZhZpL3p+hFKpK3nFWd254nGzw/01+h3aNVyX/Ftd0Mfn0NcFudCZDjbuGHfmv3XCum1kZcU4RTzyrGoJN5xI0eAdVy7Qs9WDXc0YwzjlmAvzewJ8auGCfNANg6b9YhzEIyAzq7yRrJwN2nz5abSgf0M9XbEknAtPQ0UKTY4sthQFWNXAiF8brzoP3LbySHtb6rFYw08b33eJQ42pYXXs0mgPSV44mLnVumMXmTiXu2KSKxUZ41S9FbTz0ovOKDdFlHSFarfctUrNrpUws+IjLUq3bUqRAv1m7FzFdCkSxvMaLq/PO/c7s7wX0qL0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHi5GOuwaOsan8doJX76CFShJQRqMQuKL5RsNiq7BmQ=;
 b=AoqIpjWJvXMyMKPfh4Esl9zYL8twnvTOklnLGxLtiezdLmeRaZNwmt8nxyhjYTUq/2XSNTdyMfT0Kl5KsZx6sLmH8DOkuV4vI/q39J6QhFyc1VOUBd+nABnIptaxpHKjb7aKOPAQg1XkJF05vFjQelAO34wUW97/lV6KCY92hG3jXGeTTqxIJOipDnTFdsa5ukPeBTCN+hRURLxEKKFCcTQor4VlY8G4d1y7SJxEx4tz1s1KTOnMWeypIIsflUJSb4hMYXK0OHjj9FEURCAeTexfZdX4vpX3QvFqyU/tO49hrL9SPmR5OlThDNyjJ2H0WW6WQxmGG5dPEuGdeWKQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHi5GOuwaOsan8doJX76CFShJQRqMQuKL5RsNiq7BmQ=;
 b=azMe9IoT+tMMjzHeAriDQvJYIFQUJqqGmCJurJIZFym0Pnma52HcZuL+MDf0P45vatbOjlso5sY/Oi/H5fxZL7O2LmTmQGeJEYonzJ1o4gVcfEdgMV5KK2bx2G7EE4H34gCEzDhkiQLr+90l9+UqKhzmpAohDUCwRTnICwVLkX9/QeLQq4nVosktx2hy7rTwjDTn+ao3ZEfPGCcYTbCc0F0aQ7k17gyl04mJDYtEsoepmP51vJ47azwUi83WeFkc6zCTUD5GYAOXKsuQUpHVX20VdyIRuZ6jyFvlX6HMXLja5JHqQb9GxHS3xSfQht0/ayQnlKlYkbZPcQXKw5KkRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 00:31:55 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 00:31:55 +0000
Date: Tue, 7 May 2024 21:31:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20240508003153.GC4650@nvidia.com>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
 <20240430162450.711f4616.alex.williamson@redhat.com>
 <20240501125309.GB941030@nvidia.com>
 <IA0PR11MB718509BB8B56455710DB2033F8182@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB718509BB8B56455710DB2033F8182@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:208:120::15) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 4174cf60-baa3-4e7a-66da-08dc6ef64330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E1f9aggElgd1ObG3mahJap+KCi/RE2c4u3D9sAyOKJGKQhlTQeGceW1iKk0E?=
 =?us-ascii?Q?nOWEUD1F9RvlNRiq6TvuwymJyD2IWgfTehFu+QmJRuDzDhKjdPC5t8SO2dnm?=
 =?us-ascii?Q?gAFyKJ4VWF9jACuAYtTi6nntbDrcl89Yis9mLrEDgiQ18nxYgaYG9wclOLRJ?=
 =?us-ascii?Q?/5cSLQnBh26bj3bUH/0aPrJYcSrzp7xolPofXwn4P1vGQMlANOQrypw1gBZ9?=
 =?us-ascii?Q?EvsUg3FTMnMMBAJtqKuoWa6bM7J0ljAiy7+TUepegabuWYIIuowZLQAFj123?=
 =?us-ascii?Q?nhzbi5rq4U2AwxSAeU+SoVm3jeCiaEtuLr7eILH2gJYhU7w4/LBdh8berzHM?=
 =?us-ascii?Q?s4kxFxMpipcKcmF3UhfsfILCsQzwP+KbdMj7DSSPXuc8vy+VvWZLRnwxL4sn?=
 =?us-ascii?Q?W2rMcjPIDKNfA/kIVW0XS6jMFlO+KPd+M5XwAGnac6E2nR0Vqwp+pRQFT7H+?=
 =?us-ascii?Q?QLicgWL9AAdn1D7YOoRj4fGkfOjfAYpij16ksk4lYxMzI9tcTXOe/toRdhE+?=
 =?us-ascii?Q?0X2BPnA/ATmcnFZwq1axWe+TMdXySNNJ8+iXnK27QSdoTu4NCx1PdKzJm9IY?=
 =?us-ascii?Q?hzwZjMzHrTY4ifv8HmhfpVcW6MZHjlgAUOaDzT5neb1e9xMX10oeXk4R51qu?=
 =?us-ascii?Q?deaUmg7bRqHjAUMO1O51svjIlHAJfmAhMrLBZrCF4j8Vu6jE7foSe1J30of2?=
 =?us-ascii?Q?xZkAKe6wJZaqKygRu0P/5QtGhLaxTI4njxaOluwpHIOjwktBc5o2RvDXlCxI?=
 =?us-ascii?Q?EoXEDMuivYUiO+b0wbaVph1lPOmpVmDif4DX7FKlaQorFoNJkvmk4zLl7qJR?=
 =?us-ascii?Q?bQ/CMyYLb1GAUtS6vfSzD42q5nGp9VoaGMFPxVuUNLs+2qIf2LyVwrZy//3u?=
 =?us-ascii?Q?U7/xXMxypwk5dpYakQlqoexcWketTxDiVWa+uiwzfmrolznvoqjBhZhzXKwj?=
 =?us-ascii?Q?yqdAxIblyEJE64rioALJJQ06PsGXNTldaDIxV/JaNZ1J+cMOPkWIwrIo5K0B?=
 =?us-ascii?Q?uBYFMuzwvraExHfUaS5+DsKaqgOgJfCWjps1lhRMtaZKxngccg9KW3NZGUDA?=
 =?us-ascii?Q?S+N3eqW706f6xnjn3aCjqK32WD2ba8HNgMLjJtcMSQ3YDzAwHUWaqLBoQV84?=
 =?us-ascii?Q?t6Dc/uHVUidBoS35ks2SwxhTAgT4lHuDQ5sWALsXYaIqcATIIfrrrn8KZCx5?=
 =?us-ascii?Q?tXRAg5MdqOC0fX5kAF/KllPLffOHgRaoi5IwC7ht2VPRYd2pWQRvAy4m9nlF?=
 =?us-ascii?Q?bBlMC6uoz3G1RZIhMmaW4Ku0V92c8ypqR4+kdXLp1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nhhBNXMBpxNHbfic2w2LnypaAdqCy1yZwmaUeUwjBjW6hdcggcnioNC88FIo?=
 =?us-ascii?Q?03lm2HlkxQ/jpZ1fWe7el+5NqW42k3tSmnoLlbxloI4z5B7E3CkgGF07bm1a?=
 =?us-ascii?Q?wwCz4hQxXBsRZRa3X2+UrXfnXuPDkWnXyYjthPD53U5zV5lmYoQ6BuvTwhjV?=
 =?us-ascii?Q?cS84Ri2hD6Z3MqNWlUtc7Yy6P9ByXedavcgm5b0hDjd+waD2bBw5BjLN6bY4?=
 =?us-ascii?Q?EO2eeQgzubehzdtD8/kQ9oWPnvKbNdJgTikhejZyjyM2BPAA7YlF/ZDPEuMw?=
 =?us-ascii?Q?KLZsE34ZqaHWmJUGcOCMDNR4emeYHKKmGCJUbIADlM9IZn6qg8HFJuVWY0Ip?=
 =?us-ascii?Q?u7oPiz2dw15nbZKKgUMyy70tYhyWkTq4xSJUhUsLFvXIEEVhOgayZGGO6Lb+?=
 =?us-ascii?Q?mZFDjqdcukKfQdHCgcuxtfOmUazlu9jttheaWwqHlD9iscEuQnqOPYSSnRKO?=
 =?us-ascii?Q?O5Md+QHOiPJikLRENisFipf1KmP84Rsv6HOiSvoVLFpwDEOlKf3XYM+eLSg+?=
 =?us-ascii?Q?wPmsRZElmbodJsOzaGwHdR7fHMSi66HqkJa2rSMo7LFSu4DonB2OA4u9DyLr?=
 =?us-ascii?Q?aZMvOoom0R6X4U2ewLg79y3XomFn1fXjfKOSR34o0iOOMcD/vTn/abTtnMT/?=
 =?us-ascii?Q?7l5cmeB2Q6oweTSr0bRcbgaoB2rX7Fqk7liRl7L6tuJlx+o0L0YPtPP+iedK?=
 =?us-ascii?Q?ka/NDdaWTcgnEfnFoXNs4JMMgrtNCZYW2mnF16v6xR/YpReBsunMoOL5ZNiE?=
 =?us-ascii?Q?MNg+ijeoSVFVZv5Goxq2TUaQxFKiiiMXI1dn0yJTiQP4csOP06DhPsSluEWh?=
 =?us-ascii?Q?iOJXRj/Kt1/Ex5NLrH6r85f6nl8aTgjTXZQtkexNfDhWX+ZFbEVfBCrfGmvY?=
 =?us-ascii?Q?f5Qnni3EBT/KnyWOy2hJFDV9KwCoCb8Sq88vKbTG7Nsq5vrccp2spxOfkOmE?=
 =?us-ascii?Q?f8KORuDzY1km14uf09LH2LOFunjh9G73bOfbfWiVHzz2tk71dQezwq/BUqjz?=
 =?us-ascii?Q?GwmM41NOX2QWzyLs21LHzf0cTX0C1CLgvg05fcHwPz+BooAvwrOcasWmKVel?=
 =?us-ascii?Q?NwFQXmcClwr7XW9koIsPZivWeyvoPfiu1DcjIjZn1XJkMdNKfnfTfDC2fcwA?=
 =?us-ascii?Q?5gugNvYlkTibRPJjyooNt/lpYpGYFBsM71Kkgf99m09+iufFjMDTANRpLRxA?=
 =?us-ascii?Q?IOltF/+VB6n7V0W0MfzwqbI31oinOKlxpfmmjKMN2JFmVXqW48J9sdyzusF0?=
 =?us-ascii?Q?P2Ai2YdFPwJzsM40S2+ifv6k7Yj6TJgOc4DWUYyrqofcik1bbOKLvw77GRFh?=
 =?us-ascii?Q?CpIrSaYzt0G0vf+r8tmO8XC6pRgkR3rIjQTVHpB5D6gPjIKpA3YrEJwqwMtO?=
 =?us-ascii?Q?f5qU5WNWrs1TgBgj10AofQkLwMj//rTIyIXw9nya2ajlThOvhhoCGEWEu6U3?=
 =?us-ascii?Q?Ambl9anarpyjYYfFVtOVD7MNaM2dlYz8PAvxDTBAPN1a8+R+cs5QKvbodTz8?=
 =?us-ascii?Q?h8PHbT9OzK5SO29plP+sPAsgsj6AtJABzoUKi3RsZCZPLsB6ultma3a6jIg7?=
 =?us-ascii?Q?g9Xz/zrnPM+aRrsMTapsSpegfK2bKBbjQu87abYY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4174cf60-baa3-4e7a-66da-08dc6ef64330
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 00:31:54.9629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aULDc2x2mRR1JKWx8Ob+ZxjmrrlBFxfYU9zXx+9VTuQds7Im+r/prspdwHZEvWoV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
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

On Thu, May 02, 2024 at 07:50:36AM +0000, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > 
> > On Tue, Apr 30, 2024 at 04:24:50PM -0600, Alex Williamson wrote:
> > > > +static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
> > > > +{
> > > > +	struct vm_area_struct *vma = vmf->vma;
> > > > +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
> > > > +	pgoff_t pgoff = vmf->pgoff;
> > > > +
> > > > +	if (pgoff >= priv->nr_pages)
> > > > +		return VM_FAULT_SIGBUS;
> > > > +
> > > > +	return vmf_insert_pfn(vma, vmf->address,
> > > > +			      page_to_pfn(priv->pages[pgoff]));
> > > > +}
> > >
> > > How does this prevent the MMIO space from being mmap'd when disabled
> > at
> > > the device?  How is the mmap revoked when the MMIO becomes disabled?
> > > Is it part of the move protocol?
> In this case, I think the importers that mmap'd the dmabuf need to be tracked
> separately and their VMA PTEs need to be zapped when MMIO access is revoked.

Which, as we know, is quite hard.

> > Yes, we should not have a mmap handler for dmabuf. vfio memory must be
> > mmapped in the normal way.
> Although optional, I think most dmabuf exporters (drm ones) provide a mmap
> handler. Otherwise, there is no easy way to provide CPU access (backup slow path)
> to the dmabuf for the importer.

Here we should not, there is no reason since VFIO already provides a
mmap mechanism itself. Anything using this API should just call the
native VFIO function instead of trying to mmap the DMABUF. Yes, it
will be inconvient for the scatterlist case you have, but the kernel
side implementation is much easier ..


> > > > +/**
> > > > + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> > > > + * region selected.
> > > > + *
> > > > + * open_flags are the typical flags passed to open(2), eg O_RDWR,
> > O_CLOEXEC,
> > > > + * etc. offset/length specify a slice of the region to create the dmabuf
> > from.
> > > > + * If both are 0 then the whole region is used.
> > > > + *
> > > > + * Return: The fd number on success, -1 and errno is set on failure.
> > > > + */
> > > > +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> > > > +
> > > > +struct vfio_region_p2p_area {
> > > > +	__u32	region_index;
> > > > +	__u32	__pad;
> > > > +	__u64	offset;
> > > > +	__u64	length;
> > > > +};
> > > > +
> > > > +struct vfio_device_feature_dma_buf {
> > > > +	__u32	open_flags;
> > > > +	__u32	nr_areas;
> > > > +	struct vfio_region_p2p_area p2p_areas[];
> > > > +};
> > 
> > Still have no clue what this p2p areas is. You want to create a dmabuf
> > out of a scatterlist? Why??

> Because the data associated with a buffer that needs to be shared can
> come from multiple ranges. I probably should have used the terms ranges
> or slices or chunks to make it more clear instead of p2p areas.

Yes, please pick a better name.

> > I'm also not sure of the use of the pci_p2pdma family of functions, it
> > is a bold step to make struct pages, that isn't going to work in quite

> I guess things may have changed since the last discussion on this topic or
> maybe I misunderstood but I thought Christoph's suggestion was to use
> struct pages to populate the scatterlist instead of using DMA addresses
> and, I figured pci_p2pdma APIs can easily help with that.

It was, but it doesn't really work for VFIO. You can only create
struct pages for large MMIO spaces, and only on some architectures.

Requiring them will make VFIO unusable in alot of places. Requiring
them just for DMABUF will make that feature unusable.

Creating them on first use, and then ignoring how broken it is 
perhaps reasonable for now, but I'm unhappy to see it so poorly
usable.
> 
> > alot of cases. It is really hacky/wrong to immediately call
> > pci_alloc_p2pmem() to defeat the internal genalloc.

> In my use-case, I need to use all the pages from the pool and I don't see any
> better way to do it.

You have to fix the P2P API to work properly for this kind of use
case.

There should be no genalloc at all.

> > I'd rather we stick with the original design. Leon is working on DMA
> > API changes that should address half the issue.
>
> Ok, I'll keep an eye out for Leon's work.

It saves from messing with the P2P stuff, but you get the other issues
back.

Jason
