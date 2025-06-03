Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9646CACC031
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 08:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E241710E0FA;
	Tue,  3 Jun 2025 06:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0B6ORZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0A910E0FA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748932050; x=1780468050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IWFtaiDn/XO87fJC+ux27MBKi9oToFneDr8KRC5wsd4=;
 b=N0B6ORZk+bxX3u4CffTeZf+QCag0rWLrzeeEdYMiWoAtn5eiNwrX/zbT
 yzNEDQ2dK92gG8bLlHsubAcfkPsRMnwAKmxFpmKyma7OR3VDguCP/pWiX
 nf+bT99LYxm8KQEaFVKhGVU5ynV/sGjnbxW50ZAEMoW3BgcCPTiOcnjRl
 AzK/Nemly+nvR1o/YPFFi2CW278GWXvqn8SgVTmLDvZQ+cutA0AjNIj29
 epN0YyDR9mo+NdYk4TkZ5HUDJEnb84qX4JRWsArWfr2U687Y3z1lnm/L5
 WjNVmCptKjjerbNIBGKQtP5s0hxaEGCW62ep7b+o4YyoOde/gXGKQ7QGx A==;
X-CSE-ConnectionGUID: BYohe7vrQrKtK2gIu1kR7A==
X-CSE-MsgGUID: PEFCOp+MTq2lZPNeEAln7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62314601"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62314601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:27:30 -0700
X-CSE-ConnectionGUID: BBpJLW0fTIe4Bl5L9UVquA==
X-CSE-MsgGUID: NtyakwF0TsCvZXIGBKTDHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="149539306"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa003.jf.intel.com with ESMTP; 02 Jun 2025 23:27:23 -0700
Date: Tue, 3 Jun 2025 14:20:51 +0800
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
Subject: Re: [RFC PATCH 17/30] iommufd/device: Add TSM Bind/Unbind for TIO
 support
Message-ID: <aD6UQy4KwKcdSvVE@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-18-yilun.xu@linux.intel.com>
 <yq5awm9ujouz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5awm9ujouz.fsf@kernel.org>
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

On Mon, Jun 02, 2025 at 06:13:16PM +0530, Aneesh Kumar K.V wrote:
> Xu Yilun <yilun.xu@linux.intel.com> writes:
> 
> ....
> 
> > +/**
> > + * iommufd_device_tsm_bind - Move a device to TSM Bind state
> > + * @idev: device to attach
> > + * @vdev_id: Input a IOMMUFD_OBJ_VDEVICE
> > + *
> > + * This configures for device Confidential Computing(CC), and moves the device
> > + * to the TSM Bind state. Once this completes the device is locked down (TDISP
> > + * CONFIG_LOCKED or RUN), waiting for guest's attestation.
> > + *
> > + * This function is undone by calling iommufd_device_tsm_unbind().
> > + */
> > +int iommufd_device_tsm_bind(struct iommufd_device *idev, u32 vdevice_id)
> > +{
> > +	struct iommufd_vdevice *vdev;
> > +	int rc;
> > +
> > +	if (!dev_is_pci(idev->dev))
> > +		return -ENODEV;
> > +
> > +	vdev = container_of(iommufd_get_object(idev->ictx, vdevice_id, IOMMUFD_OBJ_VDEVICE),
> > +			    struct iommufd_vdevice, obj);
> > +	if (IS_ERR(vdev))
> > +		return PTR_ERR(vdev);
> > +
> > +	if (vdev->dev != idev->dev) {
> > +		rc = -EINVAL;
> > +		goto out_put_vdev;
> > +	}
> > +
> > +	mutex_lock(&idev->igroup->lock);
> > +	if (idev->vdev) {
> > +		rc = -EEXIST;
> > +		goto out_unlock;
> > +	}
> > +
> > +	rc = iommufd_vdevice_tsm_bind(vdev);
> > +	if (rc)
> > +		goto out_unlock;
> > +
> > +	idev->vdev = vdev;
> > +	refcount_inc(&vdev->obj.users);
> > +	mutex_unlock(&idev->igroup->lock);
> > +
> > +	/*
> > +	 * Pairs with iommufd_device_tsm_unbind() - catches caller bugs attempting
> > +	 * to destroy a bound device.
> > +	 */
> > +	refcount_inc(&idev->obj.users);
> >
> 
> Do we really need this refcount_inc? As I understand it, the objects

The idev refcount is not necessary, it is just to "catch caller bug".

> aren't being pinned directly. Instead, the reference count seems to be
> used more as a way to establish an object hierarchy, ensuring that
> objects are freed in the correct order.
> 
> In vfio_pci_core_close_device(), you’re decrementing the reference, and
> on the iommufd side, we’re covered because the VFIO bind operation takes
> a file reference (fget)—so iommufd_fops_release() won’t be called
> prematurely.

Correct.

> 
> Wouldn’t it be simpler to skip the reference count increment altogether
> and just call tsm_unbind in the virtual device’s destroy callback?
> (iommufd_vdevice_destroy())

The vdevice refcount is the main concern, there is also an IOMMU_DESTROY
ioctl. User could just free the vdevice instance if no refcount, while VFIO
is still in bound state. That seems not the correct free order.

Thanks,
Yilun

> 
> > +	goto out_put_vdev;
> > +
> > +out_unlock:
> > +	mutex_unlock(&idev->igroup->lock);
> > +out_put_vdev:
> > +	iommufd_put_object(idev->ictx, &vdev->obj);
> > +	return rc;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(iommufd_device_tsm_bind, "IOMMUFD");
> 
> -aneesh
