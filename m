Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E0BACB445
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30710E546;
	Mon,  2 Jun 2025 14:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4Mb7AoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD22F10E546
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748875836; x=1780411836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gvltXEjxatA7cwXbM1ySU6qvzw0guFizH5e5rJ906Jg=;
 b=G4Mb7AoYnBCT8lR4JmxQHthTJxoZVsDZM8IXYhwaVze02cQCirR4TWFt
 xkInUiCXx5IZu/DEvreUQumOpwFEM0pGzYIOyd/AsEsn4vFH8Eq4ACaNY
 /opXOk1bJGFualyPZ2V5w7D2G1knjdbEVuyux4eQGlI8oKUekI2Ip4n4O
 4HBs1KTiDVLMArd/WxL1v6snw9aifUDsjaK0R0ny8kqCsKHekVXUN9cEF
 vNxCNdrwaL41pgMIQMJNL3ZSY32A0XO2QabKMPchFN7rvX2dbnGHaR/38
 tmVkGjYIVYpLI0Ue9yujRtmgD8qwa4vsYKRvnXAmeSFKBEewZWpkageWJ w==;
X-CSE-ConnectionGUID: x8aOPgi9S/mvjLNnWC7vTA==
X-CSE-MsgGUID: N5gL3jCnTCCssVUk3hCO/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68435601"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="68435601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 07:50:36 -0700
X-CSE-ConnectionGUID: bSyumsRCQFaHieW5WnNEIw==
X-CSE-MsgGUID: ORB/JHGpRB2A/q6o48Pqug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144592177"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa009.jf.intel.com with ESMTP; 02 Jun 2025 07:50:30 -0700
Date: Mon, 2 Jun 2025 22:43:59 +0800
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
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <aD24r44v0g1NgeZs@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5aplfn210z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aplfn210z.fsf@kernel.org>
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

On Sun, Jun 01, 2025 at 04:15:32PM +0530, Aneesh Kumar K.V wrote:
> Xu Yilun <yilun.xu@linux.intel.com> writes:
> 
> > Add new IOCTLs to do TSM based TDI bind/unbind. These IOCTLs are
> > expected to be called by userspace when CoCo VM issues TDI bind/unbind
> > command to VMM. Specifically for TDX Connect, these commands are some
> > secure Hypervisor call named GHCI (Guest-Hypervisor Communication
> > Interface).
> >
> > The TSM TDI bind/unbind operations are expected to be initiated by a
> > running CoCo VM, which already have the legacy assigned device in place.
> > The TSM bind operation is to request VMM make all secure configurations
> > to support device work as a TDI, and then issue TDISP messages to move
> > the TDI to CONFIG_LOCKED or RUN state, waiting for guest's attestation.
> >
> > Do TSM Unbind before vfio_pci_core_disable(), otherwise will lead
> > device to TDISP ERROR state.
> >
> 
> Any reason these need to be a vfio ioctl instead of iommufd ioctl?
> For ex: https://lore.kernel.org/all/20250529133757.462088-3-aneesh.kumar@kernel.org/

A general reason is, the device driver - VFIO should be aware of the
bound state, and some operations break the bound state. VFIO should also
know some operations on bound may crash kernel because of platform TSM
firmware's enforcement. E.g. zapping MMIO, because private MMIO mapping
in secure page tables cannot be unmapped before TDI STOP [1].

Specifically, for TDX Connect, the firmware enforces MMIO unmapping in
S-EPT would fail if TDI is bound. For AMD there seems also some
requirement about this but I need Alexey's confirmation.

[1] https://lore.kernel.org/all/aDnXxk46kwrOcl0i@yilunxu-OptiPlex-7050/

> 
> >
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Wu Hao <hao.wu@intel.com>
> > Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> > ---
> >  drivers/vfio/iommufd.c           | 22 ++++++++++
> >  drivers/vfio/pci/vfio_pci_core.c | 74 ++++++++++++++++++++++++++++++++
> >  include/linux/vfio.h             |  7 +++
> >  include/linux/vfio_pci_core.h    |  1 +
> >  include/uapi/linux/vfio.h        | 42 ++++++++++++++++++
> >  5 files changed, 146 insertions(+)
> >
> > diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> > index 3441d24538a8..33fd20ffaeee 100644
> > --- a/drivers/vfio/iommufd.c
> > +++ b/drivers/vfio/iommufd.c
> > @@ -297,3 +297,25 @@ void vfio_iommufd_emulated_detach_ioas(struct vfio_device *vdev)
> >  	vdev->iommufd_attached = false;
> >  }
> >  EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_detach_ioas);
> > +
> > +int vfio_iommufd_tsm_bind(struct vfio_device *vdev, u32 vdevice_id)
> > +{
> > +	lockdep_assert_held(&vdev->dev_set->lock);
> > +
> > +	if (WARN_ON(!vdev->iommufd_device))
> > +		return -EINVAL;
> > +
> > +	return iommufd_device_tsm_bind(vdev->iommufd_device, vdevice_id);
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_iommufd_tsm_bind);
> > +
> > +void vfio_iommufd_tsm_unbind(struct vfio_device *vdev)
> > +{
> > +	lockdep_assert_held(&vdev->dev_set->lock);
> > +
> > +	if (WARN_ON(!vdev->iommufd_device))
> > +		return;
> > +
> > +	iommufd_device_tsm_unbind(vdev->iommufd_device);
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_iommufd_tsm_unbind);
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 116964057b0b..92544e54c9c3 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -692,6 +692,13 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
> >  #if IS_ENABLED(CONFIG_EEH)
> >  	eeh_dev_release(vdev->pdev);
> >  #endif
> > +
> > +	if (vdev->is_tsm_bound) {
> > +		vfio_iommufd_tsm_unbind(&vdev->vdev);
> > +		pci_release_regions(vdev->pdev);
> > +		vdev->is_tsm_bound = false;
> > +	}
> > +
> >  	vfio_pci_core_disable(vdev);
> >  
> >  	vfio_pci_dma_buf_cleanup(vdev);
> > @@ -1447,6 +1454,69 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
> >  				  ioeventfd.fd);
> >  }
> >  
> > +static int vfio_pci_ioctl_tsm_bind(struct vfio_pci_core_device *vdev,
> > +				   void __user *arg)
> > +{
> > +	unsigned long minsz = offsetofend(struct vfio_pci_tsm_bind, vdevice_id);
> > +	struct vfio_pci_tsm_bind tsm_bind;
> > +	struct pci_dev *pdev = vdev->pdev;
> > +	int ret;
> > +
> > +	if (copy_from_user(&tsm_bind, arg, minsz))
> > +		return -EFAULT;
> > +
> > +	if (tsm_bind.argsz < minsz || tsm_bind.flags)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&vdev->vdev.dev_set->lock);
> > +
> > +	/* To ensure no host side MMIO access is possible */
> > +	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
> > +	if (ret)
> > +		goto out_unlock;
> >
> 
> This should be part of pci_tsm_bind() ? 

I'm not quite sure. My feelig is this method is specific for VFIO
driver. Many other drivers just request regions on probe(), they can
never bind successfully if pci tsm hide this implementation internally.

Thanks,
Yilun
