Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115AAA06EFF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 08:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F212210ECFB;
	Thu,  9 Jan 2025 07:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbJ391R6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5D10ECFB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 07:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736407405; x=1767943405;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=5RtwYatc7XhYn22UVzvrAmXoefZVhRa51czG3ToYe9M=;
 b=VbJ391R6EGtk+igehPwDG1/AkRzOlVGThIFC4uJRim+CTFX8s2WEH9J0
 mk14TedrJdUiZgw247WGneOg370pjMnajKVHFP7cBLjYFNBkHLEJ+BGtt
 lrqmgMg+E+gbU9mO9kVjjvD81sg0b4WxJk+RiOtjYHlwaPYhv/xfk9K7g
 2qrrZrIQOKvhf74l2IOkpi+xgErTjUiqoXdpzMVuFVMXgL+1YVu0iqkUR
 NKI0FO3hfRnuJPhMh75O3tDU3YxcuLIBKXnEr/tSY50xBiwrNNF7djrzR
 5hAEcwL2G9W6diW86zvacpXVPAjIDfR5Q2FBuGNkgll4TFuhf/pzBXL1/ A==;
X-CSE-ConnectionGUID: T0+y4qz5T6OuCF1qX77QmQ==
X-CSE-MsgGUID: XzW7+KbqR/abX+hiTIvqEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36881444"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36881444"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 23:23:24 -0800
X-CSE-ConnectionGUID: 61UpxkwVSgaeTrD6q7mOEA==
X-CSE-MsgGUID: h27PgmbLToehe3kcn8ABVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108431421"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 23:23:19 -0800
Date: Thu, 9 Jan 2025 03:22:16 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Message-ID: <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
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

On Wed, Jan 08, 2025 at 07:44:54PM +0100, Simona Vetter wrote:
> On Wed, Jan 08, 2025 at 12:22:27PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian König wrote:
> > > Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
> > > > I have imagined a staged approach were DMABUF gets a new API that
> > > > works with the new DMA API to do importer mapping with "P2P source
> > > > information" and a gradual conversion.
> > > 
> > > To make it clear as maintainer of that subsystem I would reject such a step
> > > with all I have.
> > 
> > This is unexpected, so you want to just leave dmabuf broken? Do you
> > have any plan to fix it, to fix the misuse of the DMA API, and all
> > the problems I listed below? This is a big deal, it is causing real
> > problems today.
> > 
> > If it going to be like this I think we will stop trying to use dmabuf
> > and do something simpler for vfio/kvm/iommufd :(
> 
> As the gal who help edit the og dma-buf spec 13 years ago, I think adding
> pfn isn't a terrible idea. By design, dma-buf is the "everything is
> optional" interface. And in the beginning, even consistent locking was
> optional, but we've managed to fix that by now :-/
> 
> Where I do agree with Christian is that stuffing pfn support into the
> dma_buf_attachment interfaces feels a bit much wrong.

So it could a dmabuf interface like mmap/vmap()? I was also wondering
about that. But finally I start to use dma_buf_attachment interface
because of leveraging existing buffer pin and move_notify.

> 
> > > We have already gone down that road and it didn't worked at all and
> > > was a really big pain to pull people back from it.
> > 
> > Nobody has really seriously tried to improve the DMA API before, so I
> > don't think this is true at all.
> 
> Aside, I really hope this finally happens!
> 
> > > > 3) Importing devices need to know if they are working with PCI P2P
> > > > addresses during mapping because they need to do things like turn on
> > > > ATS on their DMA. As for multi-path we have the same hacks inside mlx5
> > > > today that assume DMABUFs are always P2P because we cannot determine
> > > > if things are P2P or not after being DMA mapped.
> > > 
> > > Why would you need ATS on PCI P2P and not for system memory accesses?
> > 
> > ATS has a significant performance cost. It is mandatory for PCI P2P,
> > but ideally should be avoided for CPU memory.
> 
> Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
> stuff a bit I guess ...
> 
> > > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > > exporter mapping is possible
> > > 
> > > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > > confirm that this isn't true.
> > 
> > Today they are mmaping the dma-buf into a VMA and then using KVM's
> > follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> > dma-buf must have a CPU PFN.
> > 
> > Here Xu implements basically the same path, except without the VMA
> > indirection, and it suddenly not OK? Illogical.
> 
> So the big difference is that for follow_pfn() you need mmu_notifier since
> the mmap might move around, whereas with pfn smashed into
> dma_buf_attachment you need dma_resv_lock rules, and the move_notify
> callback if you go dynamic.
> 
> So I guess my first question is, which locking rules do you want here for
> pfn importers?

follow_pfn() is unwanted for private MMIO, so dma_resv_lock.

> 
> If mmu notifiers is fine, then I think the current approach of follow_pfn
> should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
> somehow is an issue itself), then I think the clean design is create a new

cpu mmap() is an issue, this series is aimed to eliminate userspace
mapping for private MMIO resources.

> separate access mechanism just for that. It would be the 5th or so (kernel
> vmap, userspace mmap, dma_buf_attach and driver private stuff like
> virtio_dma_buf.c where you access your buffer with a uuid), so really not
> a big deal.

OK, will think more about that.

Thanks,
Yilun

> 
> And for non-contrived exporters we might be able to implement the other
> access methods in terms of the pfn method generically, so this wouldn't
> even be a terrible maintenance burden going forward. And meanwhile all the
> contrived exporters just keep working as-is.
> 
> The other part is that cpu mmap is optional, and there's plenty of strange
> exporters who don't implement. But you can dma map the attachment into
> plenty devices. This tends to mostly be a thing on SoC devices with some
> very funky memory. But I guess you don't care about these use-case, so
> should be ok.
> 
> I couldn't come up with a good name for these pfn users, maybe
> dma_buf_pfn_attachment? This does _not_ have a struct device, but maybe
> some of these new p2p source specifiers (or a list of those which are
> allowed, no idea how this would need to fit into the new dma api).
> 
> Cheers, Sima
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
