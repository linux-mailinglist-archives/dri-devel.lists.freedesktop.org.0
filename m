Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ECDA06DC4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 06:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFAD10ECEA;
	Thu,  9 Jan 2025 05:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmj2UIgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FF210ECE9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736402230; x=1767938230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FqI/VlxAMR/gPma1s74j4/VQzGXLaUyWkAAHdpWMFek=;
 b=gmj2UIgFBgXDdZX0zmIcw7GqPb+K7k1GuUiwxxbkUpn6Mamr8ED9Z2mS
 783gC6KVClGG0RncB5tWn+5Ku2AsCSEbrLNlxj8I+Ga8vILYqB3JWvoll
 jp8dhGnYXOgAVfvAW3g8357mBHUQua50pFqHdVMtiqMazMZRQ1HkEa77B
 8D2iBuLgEtignZiF7gg+WrcKUwmoSbW7byB83XwXgfTfea5bvCkP2hyRh
 e/4s/4fRnX7diHY9VtBmfvdUQzO2cwdxhFXOMefCsFqA2rrxu6b7xxu6l
 bnBK3or4+UQjdiDVea7IrdL1A/qAgmEnlHPWh9LLI27CkG5F7ttMpPvBZ w==;
X-CSE-ConnectionGUID: NvJtEzjyQ0el51o7YHYQIg==
X-CSE-MsgGUID: KlqWI3VhQ/Wv3imSjLUhWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36807941"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36807941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 21:57:10 -0800
X-CSE-ConnectionGUID: SOoiHxivRYyitr+jKiwhJw==
X-CSE-MsgGUID: eOFZZnw/SNquEG3O9injsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="134145387"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa002.jf.intel.com with ESMTP; 08 Jan 2025 21:57:04 -0800
Date: Thu, 9 Jan 2025 01:56:02 +0800
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
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108162227.GT5556@nvidia.com>
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

> > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > exporter mapping is possible
> > 
> > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > confirm that this isn't true.
> 
> Today they are mmaping the dma-buf into a VMA and then using KVM's
> follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> dma-buf must have a CPU PFN.

Yes, the final target for KVM is still the CPU PFN, just with the help
of CPU mapping table.

I also found the xen gntdev-dmabuf is calculating pfn from mapped
sgt.

From Christion's point, I assume only sgl->dma_address should be
used by importers but in fact not. More importers are 'abusing' sg dma
helpers.

That said there are existing needs for importers to know more about the
real buffer resource, for mapping, or even more than mapping,
e.g. dmabuf_imp_grant_foreign_access()

Thanks,
Yilun

