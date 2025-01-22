Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4AA18AFC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 05:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9410E194;
	Wed, 22 Jan 2025 04:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Avb8igKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BA310E194
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 04:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737519410; x=1769055410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7N+WkV4xK2RjWSHcvKvxuLDFZUiR1saedshugIKoqxk=;
 b=Avb8igKAmsM9DbGnpiLnK5ucYFzzXFn5l+PJVp7PwJPUlyFvKPrV4JQF
 tQiL14W1ys/vw+/LHIMCMXI/Wg7ZwwmWzZxa+ffUhy3Gxb413SLt5z+ld
 qHU+VSugLF3oVUhbbuEskfXionywE6ygyQ3TSVhLn2pHvq2e4FEGutQAc
 ryXackXZxByR4N6nABg5MG2SaZdcb8eYRIK5/Obzjc4cVMVyVlFmWeUFP
 zJ9ifR4bGkatjiEOyn3T4DErZCgxpWXDmZzz1vq61LrSgldui3XH1w+Mh
 uexQ01eSiyvCW4VSI8uUbDWfHT36kd7D5lwwJChehtq2AF0ME7mvyC0OR Q==;
X-CSE-ConnectionGUID: vWo/KH8JQg6t26iajRzAPQ==
X-CSE-MsgGUID: 2IV3JdPnRU6QdIHpRbLmAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38113821"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="38113821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:16:49 -0800
X-CSE-ConnectionGUID: GBhLq0WwTheYgMhSQk1s5Q==
X-CSE-MsgGUID: 92navAJ9QACcQcn6tNGTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111994366"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa003.jf.intel.com with ESMTP; 21 Jan 2025 20:16:45 -0800
Date: Wed, 22 Jan 2025 12:16:35 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z5BxI3efmCPSpOSK@yilunxu-OptiPlex-7050>
References: <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
 <20250115170942.GT5556@nvidia.com>
 <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
 <ZnSm6ULbJbxOU27J@yilunxu-OptiPlex-7050>
 <0d77dc64-df9c-457b-af3b-ecfa49dac7b4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d77dc64-df9c-457b-af3b-ecfa49dac7b4@amd.com>
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

On Mon, Jan 20, 2025 at 02:44:13PM +0100, Christian König wrote:
> Am 21.06.24 um 00:02 schrieb Xu Yilun:
> > On Thu, Jan 16, 2025 at 04:13:13PM +0100, Christian König wrote:
> > >     Am 15.01.25 um 18:09 schrieb Jason Gunthorpe:
> > > 
> > >   On Wed, Jan 15, 2025 at 05:34:23PM +0100, Christian König wrote:
> > > 
> > >      Granted, let me try to improve this.
> > >      Here is a real world example of one of the issues we ran into and why
> > >      CPU mappings of importers are redirected to the exporter.
> > >      We have a good bunch of different exporters who track the CPU mappings
> > >      of their backing store using address_space objects in one way or
> > >      another and then uses unmap_mapping_range() to invalidate those CPU
> > >      mappings.
> > >      But when importers get the PFNs of the backing store they can look
> > >      behind the curtain and directly insert this PFN into the CPU page
> > >      tables.
> > >      We had literally tons of cases like this where drivers developers cause
> > >      access after free issues because the importer created a CPU mappings on
> > >      their own without the exporter knowing about it.
> > >      This is just one example of what we ran into. Additional to that
> > >      basically the whole synchronization between drivers was overhauled as
> > >      well because we found that we can't trust importers to always do the
> > >      right thing.
> > > 
> > >   But this, fundamentally, is importers creating attachments and then
> > >   *ignoring the lifetime rules of DMABUF*. If you created an attachment,
> > >   got a move and *ignored the move* because you put the PFN in your own
> > >   VMA, then you are not following the attachment lifetime rules!
> > > 
> > >     Move notify is solely for informing the importer that they need to
> > >     re-fresh their DMA mappings and eventually block for ongoing DMA to end.
> > > 
> > >     This semantics doesn't work well for CPU mappings because you need to hold
> > >     the reservation lock to make sure that the information stay valid and you
> > >     can't hold a lock while returning from a page fault.
> > Dealing with CPU mapping and resource invalidation is a little hard, but is
> > resolvable, by using other types of locks. And I guess for now dma-buf
> > exporters should always handle this CPU mapping VS. invalidation contention if
> > they support mmap().
> > 
> > It is resolvable so with some invalidation notify, a decent importers could
> > also handle the contention well.
> 
> That doesn't work like this.
> 
> See page tables updates under DMA-buf works by using the same locking
> approach for both the validation and invalidation side. In other words we
> hold the same lock while inserting and removing entries into/from the page
> tables.

Not sure what's the issue it causes, maybe I don't get why "you can't
hold a lock while returning from a page fault".

> 
> That this here should be an unlocked API means that can only use it with
> pre-allocated and hard pinned memory without any chance to invalidate it
> while running. Otherwise you can never be sure of the validity of the

Then importers can use a locked version to get pfn, and manually use
dma_resv lock only to ensure the PFN validity during page table setup.
Importers could detect the PFN will be invalid via move notify and
remove page table entries. Then find the new PFN next time page fault
happens.

IIUC, Simona mentions drm/ttm is already doing it this way.

I'm not trying to change the CPU mmap things for existing drivers, just
to ensure importer mapping is possible with faultable MMU. I wanna KVM
MMU (also faultable) to work in this importer mapping way.

Thanks,
Yilun
