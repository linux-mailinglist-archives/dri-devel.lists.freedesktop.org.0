Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1787BAB612D
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 05:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713EF10E037;
	Wed, 14 May 2025 03:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfFYx7jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F99810E037
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 03:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747193173; x=1778729173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vl2JsS0XoEFiPBo2fr8NpOs+oJP1wxKRrrfjW+0W2cw=;
 b=HfFYx7jvfxAqNX9PJo6lPC9g5UEhnqDRNQWKSI1y8GWgVphjTlI47opO
 uIGGVR0FwqtguTr6BkcIynBUyRXs8tukJ4GZWmZt24BMcERWasEj4sYdn
 aFMl3dJVayjDmcLIhdnkemvOlyHdTXlo9Mvxnegmm51a2jt2PLfoI3VyD
 7Wh7LLHZGvRTvaRNrHRISa3mjy3eh5L0z3/OzGYKLVLssFfnVjDOqdYsU
 bcuLhurPyN6ChjD1MVictI8pCZxNxktjhgJDv8Z6KlZ79p7A9QOJfahcw
 XU4AB6xc6OCEEIuY0Be/03QBtncD6tg+JCd5NE0U2AIJPvo7Ti5WVNNHP A==;
X-CSE-ConnectionGUID: 51ptEUF1RwG16DYCOxtBFA==
X-CSE-MsgGUID: jWPi6JrfQeeRg1McDY1+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60471340"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="60471340"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 20:26:07 -0700
X-CSE-ConnectionGUID: fvdv4vi/TEOML9s+DB98Cg==
X-CSE-MsgGUID: IVD+dxO3Q+uiMjPNb8pcYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137948936"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa007.fm.intel.com with ESMTP; 13 May 2025 20:26:01 -0700
Date: Wed, 14 May 2025 11:20:27 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
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
Message-ID: <aCQL+/HDYcxfWM4F@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
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

On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 10/5/25 13:47, Xu Yilun wrote:
> > On Fri, May 09, 2025 at 03:43:18PM -0300, Jason Gunthorpe wrote:
> > > On Sat, May 10, 2025 at 12:28:48AM +0800, Xu Yilun wrote:
> > > > On Fri, May 09, 2025 at 07:12:46PM +0800, Xu Yilun wrote:
> > > > > On Fri, May 09, 2025 at 01:04:58PM +1000, Alexey Kardashevskiy wrote:
> > > > > > Ping?
> > > > > 
> > > > > Sorry for late reply from vacation.
> > > > > 
> > > > > > Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,
> > > > > 
> > > > > As disscussed in the thread, this kAPI is not well considered but IIUC
> > > > > the concept of "importer mapping" is still valid. We need more
> > > > > investigation about all the needs - P2P, CC memory, private bus
> > > > > channel, and work out a formal API.
> > > > > 
> > > > > However in last few months I'm focusing on high level TIO flow - TSM
> > > > > framework, IOMMUFD based bind/unbind, so no much progress here and is
> > > > > still using this temporary kAPI. But as long as "importer mapping" is
> > > > > alive, the dmabuf fd for KVM is still valid and we could enable TIO
> > > > > based on that.
> > > > 
> > > > Oh I forgot to mention I moved the dmabuf creation from VFIO to IOMMUFD
> > > > recently, the IOCTL is against iommufd_device.
> > > 
> > > I'm surprised by this.. iommufd shouldn't be doing PCI stuff, it is
> > > just about managing the translation control of the device.
> > 
> > I have a little difficulty to understand. Is TSM bind PCI stuff? To me
> > it is. Host sends PCI TDISP messages via PCI DOE to put the device in
> > TDISP LOCKED state, so that device behaves differently from before. Then
> > why put it in IOMMUFD?
> 
> 
> "TSM bind" sets up the CPU side of it, it binds a VM to a piece of IOMMU on the host CPU.

I didn't fully get your idea, are you defending for "TSM bind is NOT PCI
stuff"? To me it is not true.

TSM bind also sets up the device side. From your patch, it calls
tsm_tdi_bind(), which in turn calls spdm_forward(), I assume it is doing
TDISP LOCK. And TDISP LOCK changes device a lot.

> The device does not know about the VM, it just enables/disables encryption by a request from the CPU (those start/stop interface commands).
> And IOMMUFD won't be doing DOE, the platform driver (such as AMD CCP) will. Nothing to do for VFIO here.

IOMMUFD calls tsm_tdi_bind(), which is an interface doing PCI stuff.

Thanks,
Yilun

> 
> We probably should notify VFIO about the state transition but I do not know VFIO would want to do in response.
> 
> 
