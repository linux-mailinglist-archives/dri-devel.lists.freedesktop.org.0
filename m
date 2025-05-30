Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F46AC932C
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0310E15E;
	Fri, 30 May 2025 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJzXUc7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C0E10E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748621642; x=1780157642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7Ha8QhcH6vxCbEOvf4pxZOBX1RWBw+HLR5G0Cw6EZFc=;
 b=HJzXUc7qy/Vm5S3Jn/0ujG0ylBRF/BiCiQPRWMQGfhvy2w7pAjm7QdZN
 NbZYwx93OSNqmWSN259FlZunr1ZcABPIL6Wa592ftU2k/9rrCX6lIO/XH
 BZw10vkiwGBRco+1GeYQgP29RuK0OsuZKcwN5vktq8FEQdVhOqZ4CBUnp
 XRmjTOVgv1aN/P2T4KA5mud2/MNNbWVwhrV6re6P2sRYFHo2L8x4Dfheo
 wT+i/Oj0delvYcBIxMTqYKCsraKWEAr3s/Xtsw/vJfED7N9KkCOCn4BN1
 NgDbsgtlFbMxHoLZvOzQr3Te8NTvB6DNwECNI0/hgMePwcIwEWdcUM6Wk g==;
X-CSE-ConnectionGUID: QZKUzomkRWmB8iQhmsYZdw==
X-CSE-MsgGUID: QivsXd/uSkiyZ74Oq3gGgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38348587"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="38348587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:14:01 -0700
X-CSE-ConnectionGUID: cty8znblT/OT/sJyYpRcZQ==
X-CSE-MsgGUID: YgHR8Xp7Qp+rtp4YuuUnSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144379572"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 09:13:56 -0700
Date: Sat, 31 May 2025 00:07:34 +0800
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
Message-ID: <aDnXxk46kwrOcl0i@yilunxu-OptiPlex-7050>
References: <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
 <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
 <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
 <20250529162923.GH192531@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529162923.GH192531@nvidia.com>
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

On Thu, May 29, 2025 at 01:29:23PM -0300, Jason Gunthorpe wrote:
> On Thu, May 29, 2025 at 10:41:15PM +0800, Xu Yilun wrote:
> 
> > > On AMD, the host can "revoke" at any time, at worst it'll see RMP
> > > events from IOMMU. Thanks,
> > 
> > Is the RMP event firstly detected by host or guest? If by host,
> > host could fool guest by just suppress the event. Guest thought the
> > DMA writting is successful but it is not and may cause security issue.
> 
> Is that in scope of the threat model though? Host must not be able to
> change DMAs or target them to different memory, but the host can stop
> DMA and loose it, surely?

This is within the threat model, this is a data integrity issue, not a
DoS issue.  If secure firmware don't care, then no component within the
TCB could be aware of the data loss.

> 
> Host controls the PCI memory enable bit, doesn't it?

That's why DSM should fallback the device to CONFIG_UNLOCKED when memory
enable is toggled, that makes TD/TDI aware of the problem. But for IOMMU
PT blocking, DSM cannot be aware, TSM must do something.

Zhi helps find something in SEV-TIO Firmware Interface SPEC, Section 2.11
which seems to indicate SEV does do something for this.

"If a bound TDI sends a request to the root complex, and the IOMMU detects a fault caused by host
configuration, the root complex fences the ASID from all further I/O to or from that guest. A host
fault is either a host page table fault or an RMP check violation. ASID fencing means that the
IOMMU blocks all further I/O from the root complex to the guest that the TDI was bound, and the
root complex blocks all MMIO accesses by the guest. When a guest writes to MMIO, the write is
silently dropped. When a guest reads from MMIO, the guest reads 1s."

Blocking all TDIs should definitely be avoided. Now I'm more sure Unbind
before DMABUF revoke is necessary.

Thanks,
Yilun

> 
> Jason
