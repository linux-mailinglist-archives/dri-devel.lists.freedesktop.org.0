Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA335ACBF74
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 07:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751CF10E64D;
	Tue,  3 Jun 2025 05:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0DVpDML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D91510E64D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 05:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748927483; x=1780463483;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A4LDdea+SqFvSsp7QIZfn63yvE0Iup0Y5Vmq4FjSSs8=;
 b=B0DVpDML3CsbkjOxin5C14uBZ9FjcgAwm0TLV+th9ztjTdIB/2/fLbNI
 APYjhu8DyXIA4/Md42z8kzkghMn2MDi6QIO1LZl06Srk0VQ9BG9auDV6t
 MqKAH3BpJnE6rdfIGlinS1j+pVY1MHGk2GSgnOsNAzHfiM9yDpFzyNIqm
 PKAsllqwHetvwWU8+kO+XsoJ97IfssM8rNqXH9aXFpPiHYPVUI5eiLTtU
 Q0pPGQ0kt4RL4p29pkZ4Eppt73PRv4Q/dBFBOM/WeVNB6utoOyJJoiLNc
 NxAPr4PihMQ7iu1BY/ZgKRMGmvff1FT4iClaVBMcpNfFgCdsNYtU6iM9+ Q==;
X-CSE-ConnectionGUID: JaotJRudRO2qeyIXVKuOHg==
X-CSE-MsgGUID: vFl2Pl7HRrOG5erJ60+SMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62007044"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62007044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 22:07:47 -0700
X-CSE-ConnectionGUID: vMpLU8zvR5e2O0JVHMgjXg==
X-CSE-MsgGUID: glbqWyGzSAW042M4b3+m5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="175700501"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2025 22:07:41 -0700
Date: Tue, 3 Jun 2025 13:01:09 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info
 for importers
Message-ID: <aD6BlXfuCGCOw4PM@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com>
 <20250602133009.GC233377@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602133009.GC233377@nvidia.com>
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

On Mon, Jun 02, 2025 at 10:30:09AM -0300, Jason Gunthorpe wrote:
> On Thu, May 29, 2025 at 01:34:53PM +0800, Xu Yilun wrote:
> > Export vfio dma-buf specific info by attaching vfio_dma_buf_data in
> > struct dma_buf::priv. Provide a helper vfio_dma_buf_get_data() for
> > importers to fetch these data. Exporters identify VFIO dma-buf by
> > successfully getting these data.
> > 
> > VFIO dma-buf supports disabling host access to these exported MMIO
> > regions when the device is converted to private. Exporters like KVM
> > need to identify this type of dma-buf to decide if it is good to use.
> > KVM only allows host unaccessible MMIO regions been mapped in private
> > roots.
> > 
> > Export struct kvm * handler attached to the vfio device. This
> > allows KVM to do another sanity check. MMIO should only be assigned to
> > a CoCo VM if its owner device is already assigned to the same VM.
> 
> This doesn't seem right, it should be encapsulated into the standard
> DMABUF API in some way.

OK.

> 
> Jason
