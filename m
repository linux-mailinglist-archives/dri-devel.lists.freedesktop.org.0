Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AE7A0B437
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF4910E633;
	Mon, 13 Jan 2025 10:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0zPJRTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D2710E632
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736763113; x=1768299113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1V0smjfm6liFtFPXdzXRpp1hcMphdhXOdaciBJTxc3k=;
 b=O0zPJRTNxraCEZrGaAHXbs+64PRrD6dgH35gVUTROm5w3OlOQSkXoNvA
 xo0dRmNrSSCihGPo/SXgplyImFJABvVMnJWQ0NIg7Amyy5yg+6nP+N2w2
 rOiDqRvH2bche1j9iJ6oKaxwyvtP+WpIDZe2yiWVrXd40+CEnYPKwlO8t
 3kFBxc3iS/meX3Ln64DQMAsutd5o7NUSbszUPyR9PONZZnoIvc2T3DVG3
 wvxvIewtz327/WpgHaC/TN+Z5vsvCZQAjCa3MA66c92W0ebnPdbK9m0Yi
 Ob2zACnMqD1lr3wmai8uGQB5kQxD1Ap3dvIVGjMMDnFQyQ80LJK+50ria g==;
X-CSE-ConnectionGUID: rJxKR6eSS+u/tF5Ez3Aftw==
X-CSE-MsgGUID: wekp484nSrSAqPMhpBlxEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="47680439"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="47680439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 02:11:52 -0800
X-CSE-ConnectionGUID: e1W5JBnaQKeKiTmx3Y+QPg==
X-CSE-MsgGUID: iL1mS6fgQq2TTbSbHA6WqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104509323"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa006.jf.intel.com with ESMTP; 13 Jan 2025 02:11:47 -0800
Date: Mon, 13 Jan 2025 06:10:40 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4Q94E6JvWrhvCyq@yilunxu-OptiPlex-7050>
References: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110203838.GL5556@nvidia.com>
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

On Fri, Jan 10, 2025 at 04:38:38PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 10, 2025 at 08:34:55PM +0100, Simona Vetter wrote:
> 
> > So if I'm getting this right, what you need from a functional pov is a
> > dma_buf_tdx_mmap? Because due to tdx restrictions, the normal dma_buf_mmap

I'm not sure if the word 'mmap' is proper here.

It is kind of like the mapping from (FD+offset) to backend memory,
which is directly provided by memory provider, rather than via VMA
and cpu page table.  Basically VMA & cpu page table are for host to
access the memory, but VMM/host doesn't access most of the guest
memory, so why must build them.

> > is not going to work I guess?
> 
> Don't want something TDX specific!
> 
> There is a general desire, and CC is one, but there are other
> motivations like performance, to stop using VMAs and mmaps as a way to
> exchanage memory between two entities. Instead we want to use FDs.

Exactly.

> 
> We now have memfd and guestmemfd that are usable with
> memfd_pin_folios() - this covers pinnable CPU memory.
> 
> And for a long time we had DMABUF which is for all the other wild
> stuff, and it supports movable memory too.
> 
> So, the normal DMABUF semantics with reservation locking and move
> notifiers seem workable to me here. They are broadly similar enough to
> the mmu notifier locking that they can serve the same job of updating
> page tables.

Yes. With this new sharing model, the lifecycle of the shared memory/pfn/Page
is directly controlled by dma-buf exporter, not by CPU mapping. So I also
think reservation lock & move_notify works well for lifecycle control,
no conflict (nothing to do) with follow_pfn() & mmu_notifier.

> 
> > Also another thing that's a bit tricky is that kvm kinda has a 3rd dma-buf
> > memory model:
> > - permanently pinned dma-buf, they never move
> > - dynamic dma-buf, they move through ->move_notify and importers can remap
> > - revocable dma-buf, which thus far only exist for pci mmio resources
> 
> I would like to see the importers be able to discover which one is
> going to be used, because we have RDMA cases where we can support 1
> and 3 but not 2.
> 
> revocable doesn't require page faulting as it is a terminal condition.
> 
> > Since we're leaning even more on that 3rd model I'm wondering whether we
> > should make it something official. Because the existing dynamic importers
> > do very much assume that re-acquiring the memory after move_notify will
> > work. But for the revocable use-case the entire point is that it will
> > never work.
> 
> > I feel like that's a concept we need to make explicit, so that dynamic
> > importers can reject such memory if necessary.
> 
> It strikes me as strange that HW can do page faulting, so it can
> support #2, but it can't handle a non-present fault?
> 
> > So yeah there's a bunch of tricky lifetime questions that need to be
> > sorted out with proper design I think, and the current "let's just use pfn
> > directly" proposal hides them all under the rug. 
> 
> I don't think these two things are connected. The lifetime model that
> KVM needs to work with the EPT, and that VFIO needs for it's MMIO,
> definately should be reviewed and evaluated.
> 
> But it is completely orthogonal to allowing iommufd and kvm to access
> the CPU PFN to use in their mapping flows, instead of the
> dma_addr_t.
> 
> What I want to get to is a replacement for scatter list in DMABUF that
> is an array of arrays, roughly like:
> 
>   struct memory_chunks {
>       struct memory_p2p_provider *provider;
>       struct bio_vec addrs[];
>   };
>   int (*dmabuf_get_memory)(struct memory_chunks **chunks, size_t *num_chunks);

Maybe we need to specify which object the API is operating on,
struct dma_buf, or struct dma_buf_attachment, or a new attachment.

I think:

  int (*dmabuf_get_memory)(struct dma_buf_attachment *attach, struct memory_chunks **chunks, size_t *num_chunks);

works, but maybe a new attachment is conceptually more clear to
importers and harder to abuse?

Thanks,
Yilun

> 
> This can represent all forms of memory: P2P, private, CPU, etc and
> would be efficient with the new DMA API.
> 
> This is similar to the structure BIO has, and it composes nicely with
> a future pin_user_pages() and memfd_pin_folios().
> 
> Jason
