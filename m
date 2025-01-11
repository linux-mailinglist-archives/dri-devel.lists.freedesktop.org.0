Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F7A0A47B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 16:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886E010E1F9;
	Sat, 11 Jan 2025 15:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kP5aa05/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142A10E1F9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736610556; x=1768146556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I13GjTQ/bEvxNSkVaRmA8TbxVYEsI+KUb/3rMftBa1w=;
 b=kP5aa05/+oOC70dpBPxjExgVw2Z0WfsXpg4iXw9/THOv4c0fy8Wqttms
 FpoqNprn8prk0vsQiC7OvDsagBA1583YHvYjMrsuSeN5fZN97i+0HcWJF
 163FUZP7AQCHxfO6SLbcV+aWIuhcJKAZp1wvlujimZDcxxEeZdkHJUXIg
 XwKOoaD+wVs/2sP5zVS7Ltm9phOPk0FYfEYIm+nt52yJ6sFq0Uw8LzcBY
 TnVtBucYkxsgvpSPo8Q3U55X7iYG/dQpl2Bs6gxRSjg9YaDfMUToi8uSz
 aAowotGrj5eCslD8w3fu2KHNjQ/O+7+ULBwKdEd/jz04nFvOFddQAEzHe w==;
X-CSE-ConnectionGUID: fCJOlUwfQl6mL+jx1dJ+wg==
X-CSE-MsgGUID: bwLXP4PGQNWNryd/GmZAkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36174430"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; d="scan'208";a="36174430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 07:49:15 -0800
X-CSE-ConnectionGUID: qX0nMsRYREGTB/bib2eOkw==
X-CSE-MsgGUID: FcNHmfEXSp6HC708tUJ8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134900487"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa001.fm.intel.com with ESMTP; 11 Jan 2025 07:49:10 -0800
Date: Sat, 11 Jan 2025 11:48:06 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com>
 <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
 <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
 <20250110133116.GF5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110133116.GF5556@nvidia.com>
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

On Fri, Jan 10, 2025 at 09:31:16AM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 10, 2025 at 12:40:28AM +0800, Xu Yilun wrote:
> 
> > So then we face with the shared <-> private device conversion in CoCo VM,
> > and in turn shared <-> private MMIO conversion. MMIO region has only one
> > physical backend so it is a bit like in-place conversion which is
> > complicated. I wanna simply the MMIO conversion routine based on the fact
> > that VMM never needs to access assigned MMIO for feature emulation, so
> > always disallow userspace MMIO mapping during the whole lifecycle. That's
> > why the flag is introduced.
> 
> The VMM can simply not map it if for these cases. As part of the TDI
> flow the kernel can validate it is not mapped.

That's a good point. I can try on that.

>  
> > > can be sure what is the correct UAPI. In other words, make the
> > > VFIO device into a CC device should also prevent mmaping it and so on.
> > 
> > My idea is prevent mmaping first, then allow VFIO device into CC dev (TDI).
> 
> I think you need to start the TDI process much earlier. Some arches
> are going to need work to prepare the TDI before the VM is started.

Could you elaborate more on that? AFAICS Intel & AMD are all good on
"late bind", but not sure for other architectures. This relates to the
definition of TSM verbs and is the right time we collect the needs for
Dan's series.

> 
> The other issue here is that Intel is somewhat different from others
> and when we build uapi for TDI it has to accommodate everyone.

Sure, this is the aim for PCI TSM core, and VFIO as a PCI TSM user
should not be TDX awared.

> 
> > Yes. It carries out the idea of "KVM maps MMIO resources without firstly
> > mapping into the host" even for normal VM. That's why I think it could
> > be an independent patchset.
> 
> Yes, just remove this patch and other TDI focused stuff. Just
> infrastructure to move to FD based mapping instead of VMA.

Yes.

Thanks,
Yilun

> 
> Jason
