Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2416AC7FDD
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 16:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21CC10E1FB;
	Thu, 29 May 2025 14:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTvrCZmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA8A10E1FB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748530059; x=1780066059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kEjzFkO+XU4YWTcwrv0cEo/Sjcef1XQplfcw8JrSKxU=;
 b=YTvrCZmIeUVyNpXAdF+/xwXrswsmucrxAPyezmhRWv52KfuJBbWkQO0h
 fKFPJ94fzWC/lIQAa4XReElyBXwQqIow5yKYgnGeca67BCcucU4hLK9wj
 Z0/P0mgrKmGmFSe1fIAWl6A66VqoCBUeEja0dUsOgTvmweu1HwAwSRZ0j
 KLPq68X+aBdr7IUtfe/6yYJ+eOewvsCsJ0sIlZe7OywMMs7UvxJmFfQr0
 YflXnQNFOv+mU9uR8u8/mJhzmfg1ohmY+DWmFPRSTVeNGml3nF0GUEKrQ
 iNA7x70ph95/TIhI3EAONeTsHgL7al2/WC4dLmoamKbqY9XSRfNSwNhRV g==;
X-CSE-ConnectionGUID: ApXrG0CaTEWAFdO8NidS+w==
X-CSE-MsgGUID: k9+4BkmgRnipfepmHlCJRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49840883"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="49840883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:47:39 -0700
X-CSE-ConnectionGUID: 8v9maovfSSmE7dB+aC69nQ==
X-CSE-MsgGUID: WkireV+rTKS43Kq0z8SZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148621109"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa004.jf.intel.com with ESMTP; 29 May 2025 07:47:34 -0700
Date: Thu, 29 May 2025 22:41:15 +0800
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
Message-ID: <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
References: <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
 <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
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

> > > > 
> > > > FLR to a bound device is absolutely fine, just break the CC state.
> > > > Sometimes it is exactly what host need to stop CC immediately.
> > > > The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
> > > > PCI core.
> > > 
> > > What is a problem here exactly?
> > > FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.
> > 
> > It is about TDX Connect.
> > 
> > According to the dmabuf patchset, the dmabuf needs to be revoked before
> > FLR. That means KVM unmaps MMIOs when the device is in LOCKED/RUN state.
> > That is forbidden by TDX Module and will crash KVM.
> 
> 
> FLR is something you tell the device to do, how/why would TDX know about it?

I'm talking about FLR in VFIO driver. The VFIO driver would zap bar
before FLR. The zapping would trigger KVM unmap MMIOs. See
vfio_pci_zap_bars() for legacy case, and see [1] for dmabuf case.

[1] https://lore.kernel.org/kvm/20250307052248.405803-4-vivek.kasireddy@intel.com/

A pure FLR without zapping bar is absolutely OK.

> Or it check the TDI state on every map/unmap (unlikely)?

Yeah, TDX Module would check TDI state on every unmapping.

> 
> 
> > So the safer way is
> > to unbind the TDI first, then revoke MMIOs, then do FLR.
> > 
> > I'm not sure when p2p dma is involved AMD will have the same issue.
> 
> On AMD, the host can "revoke" at any time, at worst it'll see RMP events from IOMMU. Thanks,

Is the RMP event firstly detected by host or guest? If by host,
host could fool guest by just suppress the event. Guest thought the
DMA writting is successful but it is not and may cause security issue.

Thanks,
Yilun
