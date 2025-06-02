Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A063BACB044
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B3B10E29D;
	Mon,  2 Jun 2025 14:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDvYfMZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3810E273
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748872982; x=1780408982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FLY8rXV/wMLxhZlXAViF34cDRZWKhFotP2CxFgwxkmk=;
 b=hDvYfMZ73RVsVrdVGGJ2f9bHYeSalJ4m9EYcuaC0K7jWIVtY0E8xurkx
 goQiZsXtpReds5cZ7KwXW+fPEHWmjOhx5lBfOVCgcMycmN2FB2CrIsx5O
 eMspGYKXUbRrM+JZpcJoiisEyr/GCiXCYIJMHjG7rmI1El59Xjl6KurOK
 Af3lvxfCqHno0SienmucwXrM56iTp66/XIJ3fsWRcfJOR1WFn5Ul6UgAT
 YOjzv6dtYnFHUuNdFZlrgf+3I4Rm1OO5dn2Jv51RhkwgW9Ypav9jTDUfr
 tq4xe4fmSscuh2gVzElWkbr7UMDyW77maWcqlSh8wWoAnTFoh51OyW4Hd g==;
X-CSE-ConnectionGUID: j6DuJ+ZSTUS3Hi+uKYA5Zw==
X-CSE-MsgGUID: x15PufO2SKSjiCvPxZr1Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50937102"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50937102"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 07:03:01 -0700
X-CSE-ConnectionGUID: 4aYjc9MNSNmAc1o1IuJCGw==
X-CSE-MsgGUID: VUHNjsVZRI+VLiCrPqDFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="181716728"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa001.jf.intel.com with ESMTP; 02 Jun 2025 07:02:55 -0700
Date: Mon, 2 Jun 2025 21:56:25 +0800
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
Message-ID: <aD2ticKyMxxMXzZ+@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-21-yilun.xu@linux.intel.com>
 <yq5a34cilnxw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a34cilnxw.fsf@kernel.org>
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

On Mon, Jun 02, 2025 at 10:50:11AM +0530, Aneesh Kumar K.V wrote:
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
> Don't we need to re-bind the vdev with tsm_bind for the continued use of TDI?

I choose not to re-bind because host basically cannot recover
everything. The guest does 'bind', 'attest', 'accept' to make a trusted
device, but for this series VFIO is only aware of 'bind' and can only
recover 'bind', which doesn't make much sense.  So I think just make
guest fully aware of TDISP rules, guest should expect writing MSE breaks
private state, and should do 'bind', 'attest', 'accept' again for
recovery if it wants to.

> 
> >  		} else {
> > @@ -712,6 +713,7 @@ static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
> >  					  pci_power_t state)
> >  {
> >  	if (state >= PCI_D3hot) {
> > +		vfio_pci_tsm_unbind(vdev);
> >  		vfio_pci_zap_and_down_write_memory_lock(vdev);
> >  		vfio_pci_dma_buf_move(vdev, true);
> >  	} else {
> > @@ -907,6 +909,7 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
> >  						 &cap);
> >  
> >  		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
> > +			vfio_pci_tsm_unbind(vdev);
> >  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> >  			vfio_pci_dma_buf_move(vdev, true);
> >  			pci_try_reset_function(vdev->pdev);
> > @@ -992,6 +995,7 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
> >  						&cap);
> >  
> >  		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
> > +			vfio_pci_tsm_unbind(vdev);
> >  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> >  			vfio_pci_dma_buf_move(vdev, true);
> >  			pci_try_reset_function(vdev->pdev);
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 92544e54c9c3..a8437fcecca1 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -286,6 +286,7 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
> >  	 * The vdev power related flags are protected with 'memory_lock'
> >  	 * semaphore.
> >  	 */
> > +	vfio_pci_tsm_unbind(vdev);
> >  	vfio_pci_zap_and_down_write_memory_lock(vdev);
> >  	vfio_pci_dma_buf_move(vdev, true);
> >  
> > @@ -693,11 +694,7 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
> >  	eeh_dev_release(vdev->pdev);
> >  #endif
> >  
> > -	if (vdev->is_tsm_bound) {
> > -		vfio_iommufd_tsm_unbind(&vdev->vdev);
> > -		pci_release_regions(vdev->pdev);
> > -		vdev->is_tsm_bound = false;
> > -	}
> > +	__vfio_pci_tsm_unbind(vdev);
> >  
> >  	vfio_pci_core_disable(vdev);
> >  
> > @@ -1222,6 +1219,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
> >  	if (!vdev->reset_works)
> >  		return -EINVAL;
> >  
> > +	vfio_pci_tsm_unbind(vdev);
> >  	vfio_pci_zap_and_down_write_memory_lock(vdev);
> >  
> >  	/*
> > @@ -1491,12 +1489,32 @@ static int vfio_pci_ioctl_tsm_bind(struct vfio_pci_core_device *vdev,
> >  	return ret;
> >  }
> >  
> > +void __vfio_pci_tsm_unbind(struct vfio_pci_core_device *vdev)
> > +{
> > +	struct pci_dev *pdev = vdev->pdev;
> > +
> > +	lockdep_assert_held(&vdev->vdev.dev_set->lock);
> > +
> > +	if (!vdev->is_tsm_bound)
> > +		return;
> > +
> > +	vfio_iommufd_tsm_unbind(&vdev->vdev);
> > +	pci_release_regions(pdev);
> > +	vdev->is_tsm_bound = false;
> >
> 
> Do we really need to check vdev->is_tsm_bound? The tsm_ops lock already
> ensures that concurrent TSM operations can't happen, and repeated calls
> to bind()/unbind() seem to be handled safely by pci_tsm_bind and pci_tsm_unbind.

It is mainly for pci_release_regions(). I remember there is a concern
about whether pci_request/release_region() should be in VFIO driver,
maybe lets solve that concern first in that thread.

> 
> > +}
> > +
> > +void vfio_pci_tsm_unbind(struct vfio_pci_core_device *vdev)
> > +{
> > +	mutex_lock(&vdev->vdev.dev_set->lock);
> > +	__vfio_pci_tsm_unbind(vdev);
> > +	mutex_unlock(&vdev->vdev.dev_set->lock);
> > +}
> >
> 
> If is_tsm_bound is no longer needed, and pci_release_regions /
> request_region_exclusive are now handled within pci_tsm_unbind / bind,
> do we still need mutex_lock() to guard this path?

We may still need the dev_set->lock. The vfio_pci/iommufd_device_tsm_bind()
not only does pci_tsm_bind(), but also secure IOMMU setup which affects
all devices in the dev_set.

Maybe I worried too much, I doesn't know there exists a real secure device
set.

Thanks,
Yilun
