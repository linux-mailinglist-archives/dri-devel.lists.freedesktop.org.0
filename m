Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F1A149D8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 07:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9BF10EA6A;
	Fri, 17 Jan 2025 06:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8iEbRIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263F10EA6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 06:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737096938; x=1768632938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a0dUK/jQpDvIM8/nBDBU73ylJDOTGNarHp7F4VWxh2Y=;
 b=L8iEbRIvlAM476FPiCdv7FlB5AZrgkqpo85az6ILO6euxssHyQFwVAhS
 CSTjipdyBB6qH+Jo3TWmsLcRUjT7v0ggdJdgeWKUrd1KR6fJz3hg/wk/0
 23/DmmjN5Kdv0WFOr42oHApYQGanMNWoWhrnElLcPwU+z5OW0QP2QRwsY
 7KIBxkrcB2mXl1iveENy96P+iw3OJ7S8nhjviqLpo7L8ALd2rCPYjcc6S
 bf6DfEtnWhtiF/rNOJqafoWVU2a7xF2kgAHWX/yqDH0fehB87i8F2cmYK
 prdicXggXAC1y00EDJ0H7vQ83wEWKO++1qzsgeV0BGhmh3ih+Cmyoc04Z g==;
X-CSE-ConnectionGUID: tA9h5/UXQFuD2FSQkSZ8DA==
X-CSE-MsgGUID: zVhMn2FIRIyAmflX9J6xJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41284403"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="41284403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 22:55:38 -0800
X-CSE-ConnectionGUID: RxiCzTo0ROmjq7QbZX/TYg==
X-CSE-MsgGUID: jaCx/4CdQQ2PY/ze4H41mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="106312339"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 22:55:32 -0800
Date: Fri, 21 Jun 2024 06:02:17 +0800
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
Message-ID: <ZnSm6ULbJbxOU27J@yilunxu-OptiPlex-7050>
References: <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
 <20250115170942.GT5556@nvidia.com>
 <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
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

On Thu, Jan 16, 2025 at 04:13:13PM +0100, Christian König wrote:
>    Am 15.01.25 um 18:09 schrieb Jason Gunthorpe:
> 
>  On Wed, Jan 15, 2025 at 05:34:23PM +0100, Christian König wrote:
> 
>     Granted, let me try to improve this.
>     Here is a real world example of one of the issues we ran into and why
>     CPU mappings of importers are redirected to the exporter.
>     We have a good bunch of different exporters who track the CPU mappings
>     of their backing store using address_space objects in one way or
>     another and then uses unmap_mapping_range() to invalidate those CPU
>     mappings.
>     But when importers get the PFNs of the backing store they can look
>     behind the curtain and directly insert this PFN into the CPU page
>     tables.
>     We had literally tons of cases like this where drivers developers cause
>     access after free issues because the importer created a CPU mappings on
>     their own without the exporter knowing about it.
>     This is just one example of what we ran into. Additional to that
>     basically the whole synchronization between drivers was overhauled as
>     well because we found that we can't trust importers to always do the
>     right thing.
> 
>  But this, fundamentally, is importers creating attachments and then
>  *ignoring the lifetime rules of DMABUF*. If you created an attachment,
>  got a move and *ignored the move* because you put the PFN in your own
>  VMA, then you are not following the attachment lifetime rules!
> 
>    Move notify is solely for informing the importer that they need to
>    re-fresh their DMA mappings and eventually block for ongoing DMA to end.
> 
>    This semantics doesn't work well for CPU mappings because you need to hold
>    the reservation lock to make sure that the information stay valid and you
>    can't hold a lock while returning from a page fault.

Dealing with CPU mapping and resource invalidation is a little hard, but is
resolvable, by using other types of locks. And I guess for now dma-buf
exporters should always handle this CPU mapping VS. invalidation contention if
they support mmap().

It is resolvable so with some invalidation notify, a decent importers could
also handle the contention well.

IIUC now the only concern is importer device drivers are easier to do
something wrong, so move CPU mapping things to exporter. But most of the
exporters are also device drivers, why they are smarter?

And there are increasing mapping needs, today exporters help handle CPU primary
mapping, tomorrow should they also help on all other mappings? Clearly it is
not feasible. So maybe conditionally give trust to some importers.

Thanks,
Yilun
