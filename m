Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126AAACBF68
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 06:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B6510E18E;
	Tue,  3 Jun 2025 04:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4uLpHRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6298310E18E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 04:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748926609; x=1780462609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p6Uliwjeb9aiPXavhCVIq0Xv1uYAO1wNjq9ELL7jF9s=;
 b=Q4uLpHRZu/t0o7QfJOdhDhV6k/mFl3qIOzhhkyWbZxaZ34sx1pVIXwB9
 j0wyzqnhM1W5Ry+uYaPGz8bxBKEzLUy3Gy/1eB8Ol1ou2aRat3itAMMLN
 rAj87AJfHTFylEuLUsIV+CqdPNKUnVUPXCKu1iWc1TeYyqg4wtPIl0iz4
 AxDRKdtdoNfSXxHn08T2L8Ahfn4HBixK/ODtOh4UyVAtG5zjQ0jR9iPp7
 7YPC07LgXHPhu3qAWXQn0QF7tGwjGXFRrbbWl/gY/be8fYRiO7SLAowS4
 vZGqhfW5OG7Dp+S1/jjY7LO1NvUlFRO5JY0kKem2BYUkQdNgVPi1nBEL9 g==;
X-CSE-ConnectionGUID: GOHT5e/FReS0yFG/41JnHg==
X-CSE-MsgGUID: dJ89tf6nQau0f0wMKZVUnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62004253"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62004253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 21:56:48 -0700
X-CSE-ConnectionGUID: +R3KxD5fSay5O/7fDmdhSg==
X-CSE-MsgGUID: JbKyM8ULSPaqs7NuuQafDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="175593681"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa001.fm.intel.com with ESMTP; 02 Jun 2025 21:56:43 -0700
Date: Tue, 3 Jun 2025 12:50:10 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 vivek.kasireddy@intel.com, yilun.xu@intel.com,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com,
 linux-pci@vger.kernel.org, zhiw@nvidia.com, simona.vetter@ffwll.ch,
 shameerali.kolothum.thodi@huawei.com, iommu@lists.linux.dev,
 kevin.tian@intel.com
Subject: Re: [RFC PATCH 20/30] vfio/pci: Do TSM Unbind before zapping bars
Message-ID: <aD5/AjaQQOKydUWz@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-21-yilun.xu@linux.intel.com>
 <yq5ar002jlao.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ar002jlao.fsf@kernel.org>
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

On Mon, Jun 02, 2025 at 07:30:15PM +0530, Aneesh Kumar K.V wrote:
> Xu Yilun <yilun.xu@linux.intel.com> writes:
> 
> > When device is TSM Bound, some of its MMIO regions are controlled by
> > secure firmware. E.g. TDX Connect would require these MMIO regions
> > mappeed in S-EPT and never unmapped until device Unbound. Zapping bars
> > irrespective of TSM Bound state may cause unexpected secure firmware
> > errors. It is always safe to do TSM Unbind first, transiting the device
> > to shared, then do whatever needed as before.
> >
> > Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_config.c |  4 +++
> >  drivers/vfio/pci/vfio_pci_core.c   | 41 +++++++++++++++++++-----------
> >  drivers/vfio/pci/vfio_pci_priv.h   |  3 +++
> >  3 files changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> > index 7ac062bd5044..4ffe661c9e59 100644
> > --- a/drivers/vfio/pci/vfio_pci_config.c
> > +++ b/drivers/vfio/pci/vfio_pci_config.c
> > @@ -590,6 +590,7 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
> >  		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
> >  
> >  		if (!new_mem) {
> > +			vfio_pci_tsm_unbind(vdev);
> >  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> >  			vfio_pci_dma_buf_move(vdev, true);
> >
> 
> For a secure device mmio range instead of vfio_pci_zap_and_down_write_memory_lock()
> -> unmap_mapping_range() we want the vfio_pci_dma_buf_move right?

Yes.

> Also is that expected to get called twice as below?

Yes for TDX Connect. First time zap the private MMIOs during unbind.
Second time block all mmio mapping.

Other platforms don't need these tsm handlers. They don't have this
awkwardness.

Thanks,
Yilun

> 
> vfio_pci_tsm_unbind-> pci_tsm_unbind -> tdx_tsm_unbind ->
> tsm_handler->disable_mmio() -> vfio_pci_core_tsm_disable_mmio -> vfio_pci_dma_buf_move(vdev, true);
> 
> -aneesh
