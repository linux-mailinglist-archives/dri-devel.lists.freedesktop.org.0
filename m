Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138ACAB95D1
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 08:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB0E10E118;
	Fri, 16 May 2025 06:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHm7/WvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D810E118
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 06:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747375782; x=1778911782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qyhT7n431vXM4anrRMDRMlFCdybdA0lFKBwmzpN5FDQ=;
 b=AHm7/WvQFoyeCTp2cgCUk33F3QBTLMC00uFKF3Pl4//t3TQ6PjK8Hwkc
 1QUPgZZ8iGz5wz8NUN1IJvAacuJR/rw4kwbRltXyzb5EtkzrGjv1u80lg
 Q24/NKPIEGk+SPm6oBrgerrSot+pUCkOGQV3GkbSIyfHZ6aZtle3NB6vj
 2q6MmmlV81zZ3wYQBVwLRDLaCou9qD+kVDWn3SIPkEpOiM+4cw/qpmrDb
 eGsWhythcs87tYYepNL0zyKKV6mmuAqbrvkPaHrm4xdL2b3eHmPSY8SeG
 gFwWGKAaUjbvpwwv7gQA8FNTBpfv+0dQoisR3Fc7TmJcrobU4lFsfRATj Q==;
X-CSE-ConnectionGUID: NczXj2hgSyyvYGkqOiXMcQ==
X-CSE-MsgGUID: ZrB3QftFQ+GalXDsSZ6jwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36955279"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="36955279"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 23:09:40 -0700
X-CSE-ConnectionGUID: 3mdypJMGTIagJOxBJAReOw==
X-CSE-MsgGUID: wT2fZ/BCRcqrCSFZ3R6eGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139087544"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa010.fm.intel.com with ESMTP; 15 May 2025 23:09:34 -0700
Date: Fri, 16 May 2025 14:03:55 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <aCbVSxg0wS3wJXWB@yilunxu-OptiPlex-7050>
References: <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <20250515175658.GR382960@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515175658.GR382960@nvidia.com>
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

On Thu, May 15, 2025 at 02:56:58PM -0300, Jason Gunthorpe wrote:
> On Fri, May 16, 2025 at 12:04:04AM +0800, Xu Yilun wrote:
> > > arches this was mostly invisible to the hypervisor?
> > 
> > Attest & Accept can be invisible to hypervisor, or host just help pass
> > data blobs between guest, firmware & device.
> > 
> > Bind cannot be host agnostic, host should be aware not to touch device
> > after Bind.
> 
> I'm not sure this is fully true, this could be a Intel thing. When the
> vPCI is created the host can already know it shouldn't touch the PCI
> device anymore and the secure world would enforce that when it gets a
> bind command.
> 
> The fact it hasn't been locked out immediately at vPCI creation time
> is sort of a detail that doesn't matter, IMHO.

I see, SW can define the lock out in a wider range. I suddenly understand
you are considering finish all host side CC setup on viommu_alloc &
vdevice_alloc before KVM run, then "Bind" could host agnostic, and TDISP
LOCK/STOP could also be a guest_request.

Now the problem is for TDX, host cannot be agnostic to LOCK/STOP because
of the KVM MMIO mapping ...

I still have to make VFIO uAPIs for "Bind"/"Unbind"

> 
> > > It might be reasonable to have VFIO reach into iommufd to do that on
> > > an already existing iommufd VDEVICE object. A little weird, but we
> > > could probably make that work.
> > 
> > Mm, Are you proposing an uAPI in VFIO, and a kAPI from VFIO -> IOMMUFD like:
> >
> >  ioctl(vfio_fd, VFIO_DEVICE_ATTACH_VDEV, vdev_id)
> >  -> iommufd_device_attach_vdev()
> >     -> tsm_tdi_bind()
> 
> Not ATTACH, you wanted BIND. You could have a VFIO_DEVICE_BIND(iommufd
> vdevice id)

Yes.

> 
> > > sees VFIO remove the S-EPT and release the KVM, then have iommufd
> > > destroy the VDEVICE object.
> > 
> > Regarding VM destroy, TDX Connect has more enforcement, VM could only be
> > destroyed after all assigned CC vPCI devices are destroyed.
> 
> And KVM destroys the VM?

Yes.

>  
> > Nowadays, VFIO already holds KVM reference, so we need
> > 
> > close(vfio_fd)
> > -> iommufd_device_detach_vdev()
> 
> This doesn't happen though, it destroys the normal device (idev) which
> the vdevice is stacked on top of. You'd have to make normal device
> destruction trigger vdevice destruction
> 
> >    -> tsm_tdi_unbind()
> >       -> tdi stop
> >       -> callback to VFIO, dmabuf_move_notify(revoke)
> >          -> KVM unmap MMIO
> >       -> tdi metadata remove
> 
> This omits the viommu. It won't get destroyed until the iommufd
> closes, so iommufd will be holding the kvm and it will do the final
> put.

I see.

https://lore.kernel.org/all/20250319233111.GE126678@ziepe.ca/

Thanks,
Yilun

> 
> Jason
