Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242BACFBFA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 06:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F64C10E33A;
	Fri,  6 Jun 2025 04:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="no3Tv67G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F72610E33A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 04:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749184376; x=1780720376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yLDNyNn/xDL5lmtA4zeU4VCRJdc6yerfu8f1Dqe1TBs=;
 b=no3Tv67G4C4xG8zvOBub2OTbgx9JcKM/pjKZlZHoOdwqOyNfXJSggHpP
 fu8w7aSqiyG4avgvqNgEobn6AZLoWSSVFhTo0kIGwlnrsyHhuCuAI+2/h
 OX+C+baGsp1rRfOabHubU9Zm8w0e9hg2C0NHfYHd9cIgMQrDvKtnHjoU5
 jH86xFAPSRXsCfaIvRRwruwbLoijucHG2Wa0LlKnfFTlB7CYVdN98h7Z5
 +Bgz6Xcn9myPS0KWtv1/MNask/WPSCJObsWN+1mAOKg09wObdussryQ2P
 mDW552H8CuxK5bUDbJxjUemSwY/1KkWZyk60Qgt3rZ/VRWcm2wDuxV2WW Q==;
X-CSE-ConnectionGUID: KLcUtwnLSOGkAuK4iAun8Q==
X-CSE-MsgGUID: czdjh9uLSKmQf5H8GE3VzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51468943"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="51468943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 21:32:54 -0700
X-CSE-ConnectionGUID: a2NVxN3HTFG+xIUIK89PUA==
X-CSE-MsgGUID: 8D/PmArNSKGGUGligSxiFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="182904220"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa001.jf.intel.com with ESMTP; 05 Jun 2025 21:32:47 -0700
Date: Fri, 6 Jun 2025 12:26:07 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <aEJt39oExEUDg/Dh@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5ah60u8kev.fsf@kernel.org> <20250605151029.GC19710@nvidia.com>
 <yq5a7c1q88oy.fsf@kernel.org> <20250605163339.GE19710@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250605163339.GE19710@nvidia.com>
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

On Thu, Jun 05, 2025 at 01:33:39PM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 05, 2025 at 09:47:01PM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@nvidia.com> writes:
> > 
> > > On Thu, Jun 05, 2025 at 05:33:52PM +0530, Aneesh Kumar K.V wrote:
> > >
> > >> > +
> > >> > +	/* To ensure no host side MMIO access is possible */
> > >> > +	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
> > >> > +	if (ret)
> > >> > +		goto out_unlock;
> > >> > +
> > >> >
> > >> 
> > >> I am hitting failures here with similar changes. Can you share the Qemu
> > >> changes needed to make this pci_request_regions_exclusive successful.

Jason has described the suggested static lockdown flow and we could
try on that.  I just wanna help position your immediate failure.

Maybe you still have QEMU mmapped the MMIO region.

int vfio_pci_core_mmap()
{
...

	if (!vdev->barmap[index]) {
		ret = pci_request_selected_regions(pdev,
						   1 << index, "vfio-pci");
...
}

Even for static lockdown, userspace should not mmap the MMIOs anymore.

Thanks,
Yilun

> > >> Also after the TDI is unbound, we want the region ownership backto
> > >> "vfio-pci" so that things continue to work as non-secure device. I don't
> > >> see we doing that. I could add a pci_bar_deactivate/pci_bar_activate in
> > >> userspace which will result in vfio_unmap()/vfio_map(). But that doesn't
> > >> release the region ownership.
> > >
> > > Again, IMHO, we should not be doing this dynamically. VFIO should do
> > > pci_request_regions_exclusive() once at the very start and it should
> > > stay that way.
> > >
> > > There is no reason to change it dynamically.
> > >
> > > The only decision to make is if all vfio should switch to exclusive
> > > mode or if we need to make it optional for userspace.
> > 
> > We only need the exclusive mode when the device is operating in secure
> > mode, correct? That suggests we’ll need to dynamically toggle this
> > setting based on the device’s security state.
> 
> No, if the decision is that VFIO should allow this to be controlled by
> userspace then userspace will tell iommufd to run in regions_exclusive
> mode prior to opening the vfio cdev and VFIO will still do it once at
> open time and never change it.
> 
> The only thing request_regions does is block other drivers outside
> vfio from using this memory space. There is no reason at all to change
> this dynamically. A CC VMM using VFIO will never use a driver outside
> VFIO to touch the VFIO controlled memory.
> 
> Jason
