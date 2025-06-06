Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19458ACFBA5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 05:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727F710E284;
	Fri,  6 Jun 2025 03:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBtLj6+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710FF10E284
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 03:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749180745; x=1780716745;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qcz12GY2obmAahfa+Hf4viUpaHRcvM1vkETwyIXnzVQ=;
 b=bBtLj6+G+KM9WWIWbB4mblwVOVF2RI7eOOLMcid7FfbjRRZ/c+3ZSC/j
 5ihXRnJmcECztOCISIH6FbBJoYYZ5U00f7fx3qLnEeefDQCpi6r3xdQeq
 HS5hFQlkWYzPCIKM5+O3h/i5zvnC1MzvPQ61zskCV/QIgbPGBOW5r4tJI
 9D3ZIYgXQr25NyEvQT6ZqG7ek9KBH48WM/Hsm0TjgdV9IZdfIvjZBFY5/
 7KipzjZuYun3aYkWz45NsgLmkIBYjqbnwr6FnZLgtZlxymDEo7nt00hah
 V0z5boK4nvvhhy7c8itbcTlY3O4kd4OWpJAA0MpBzHwBJI3TTd782lC66 A==;
X-CSE-ConnectionGUID: thBcPh09TSSw+LAhYyOkHQ==
X-CSE-MsgGUID: 2qSGyfjQTfi8t6HqY0GQtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51204995"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="51204995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 20:32:24 -0700
X-CSE-ConnectionGUID: +lkkTJKXTyuykVQI6XdC0g==
X-CSE-MsgGUID: Fs5aCXcMTN+tx2jIxltA5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="149541684"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 20:32:17 -0700
Date: Fri, 6 Jun 2025 11:25:36 +0800
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
Message-ID: <aEJfsFxVxXTDIucc@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5aplfn210z.fsf@kernel.org>
 <aD24r44v0g1NgeZs@yilunxu-OptiPlex-7050>
 <yq5ajz5r8w6p.fsf@kernel.org>
 <aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050>
 <20250605150916.GB19710@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605150916.GB19710@nvidia.com>
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

On Thu, Jun 05, 2025 at 12:09:16PM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 05, 2025 at 05:41:17PM +0800, Xu Yilun wrote:
> 
> > No, this is not device side TDISP requirement. It is host side
> > requirement to fix DMA silent drop issue. TDX enforces CPU S2 PT share
> > with IOMMU S2 PT (does ARM do the same?), so unmap CPU S2 PT in KVM equals
> > unmap IOMMU S2 PT.
> > 
> > If we allow IOMMU S2 PT unmapped when TDI is running, host could fool
> > guest by just unmap some PT entry and suppress the fault event. Guest
> > thought a DMA writting is successful but it is not and may cause
> > data integrity issue.
> 
> So, TDX prevents *any* unmap, even of normal memory, from the S2 while
> a guest is running?  Seems extreme?

Prevents any unmap *not intended* by guest, even for normal memory.

Guest could show its unmapping intention by issuing an "page release"
firmware call then host is OK to unmap. This for normal memory.

For MMIO, Guest implicitly hwo the intention by unbind the TDI first.

> 
> MMIO isn't special, if you have a rule like that for such a security
> reason it should cover all of the S2.

It does.

Thanks,
Yilun

> 
> > This is not a TDX specific problem, but different vendors has different
> > mechanisms for this. For TDX, firmware fails the MMIO unmap for S2. For
> > AMD, will trigger some HW protection called "ASID fence" [1]. Not sure
> > how ARM handles this?
> 
> This seems even more extreme, if the guest gets a bad DMA address into
> the device then the entire device gets killed? No chance to debug it?
> 
> Jason
> 
