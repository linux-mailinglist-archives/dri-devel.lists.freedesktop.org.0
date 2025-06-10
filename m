Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0FAD2E33
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C4710E2BE;
	Tue, 10 Jun 2025 07:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qwxix06q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A5E10E265
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749538799; x=1781074799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nQXu7/qHIbG/mZfLTshtxBAdZxbuaewWvV6VL9QWdqY=;
 b=Qwxix06qi7JDQXJhqM5VdaHhKFjaX2ohU7JXMVZdX3guWF6bIe181S5Z
 wlm9Vek4HjySTzAwyZr52gflVLG7ef2dPTnxazJ9OQHhLfC0tXi4KL96w
 oYW/DWRQuBECrW63j8ESxQm92mcvMirLlM7BF8XHxirptcziM5+OGKTHb
 7l0/reVH7fy9JgJGwotdiT/lCHXg8edvLcR615Dw+DwIn5VQhB/bQ1fzr
 tL+UsOZ1gp3UIxqSllERwGlobG4vf2wGEtbNGA3OVUHuw872MxnzIXy6d
 l5Rg5d8LB+wSO3rjlU3Fcf/8d9VvUHunm1eIKz9FzhfDOwqb+eb+xfqa5 Q==;
X-CSE-ConnectionGUID: C/4Kq/C0RDWgfzkU5rM8/w==
X-CSE-MsgGUID: no4GcorGRVmLPQP7LMdiJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51778993"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51778993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 23:59:57 -0700
X-CSE-ConnectionGUID: ZiXdYjsHRTe5w9XKMyrQaA==
X-CSE-MsgGUID: pq2m0M7pTrWZ7k3/HXV1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="169919096"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2025 23:59:52 -0700
Date: Tue, 10 Jun 2025 14:53:00 +0800
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
Message-ID: <aEfWTEaQv2HhldWX@yilunxu-OptiPlex-7050>
References: <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
 <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
 <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
 <79872224-4e81-446b-a451-28260f449ea9@amd.com>
 <aDnbgBbxF8IkH/cq@yilunxu-OptiPlex-7050>
 <bd0d8d69-78dd-44d8-9f32-d945bc6078c2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd0d8d69-78dd-44d8-9f32-d945bc6078c2@amd.com>
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

On Tue, Jun 10, 2025 at 02:20:03PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 31/5/25 02:23, Xu Yilun wrote:
> > On Fri, May 30, 2025 at 12:29:30PM +1000, Alexey Kardashevskiy wrote:
> > > 
> > > 
> > > On 30/5/25 00:41, Xu Yilun wrote:
> > > > > > > > 
> > > > > > > > FLR to a bound device is absolutely fine, just break the CC state.
> > > > > > > > Sometimes it is exactly what host need to stop CC immediately.
> > > > > > > > The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
> > > > > > > > PCI core.
> > > > > > > 
> > > > > > > What is a problem here exactly?
> > > > > > > FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.
> > > > > > 
> > > > > > It is about TDX Connect.
> > > > > > 
> > > > > > According to the dmabuf patchset, the dmabuf needs to be revoked before
> > > > > > FLR. That means KVM unmaps MMIOs when the device is in LOCKED/RUN state.
> > > > > > That is forbidden by TDX Module and will crash KVM.
> > > > > 
> > > > > 
> > > > > FLR is something you tell the device to do, how/why would TDX know about it?
> > > > 
> > > > I'm talking about FLR in VFIO driver. The VFIO driver would zap bar
> > > > before FLR. The zapping would trigger KVM unmap MMIOs. See
> > > > vfio_pci_zap_bars() for legacy case, and see [1] for dmabuf case.
> > > 
> > > oh I did not know that we do this zapping, thanks for the pointer.
> > > > [1] https://lore.kernel.org/kvm/20250307052248.405803-4-vivek.kasireddy@intel.com/
> > > > 
> > > > A pure FLR without zapping bar is absolutely OK.
> > > > 
> > > > > Or it check the TDI state on every map/unmap (unlikely)?
> > > > 
> > > > Yeah, TDX Module would check TDI state on every unmapping.
> > > 
> > > _every_? Reading the state from DOE mailbox is not cheap enough (imho) to do on every unmap.
> > 
> > Sorry for confusing. TDX firmware just checks if STOP TDI firmware call
> > is executed, will not check the real device state via DOE. That means
> > even if device has physically exited to UNLOCKED, TDX host should still
> > call STOP TDI fwcall first, then MMIO unmap.
> > 
> > > 
> > > > > 
> > > > > > So the safer way is
> > > > > > to unbind the TDI first, then revoke MMIOs, then do FLR.
> > > > > > 
> > > > > > I'm not sure when p2p dma is involved AMD will have the same issue.
> > > > > 
> > > > > On AMD, the host can "revoke" at any time, at worst it'll see RMP events from IOMMU. Thanks,
> > > > 
> > > > Is the RMP event firstly detected by host or guest? If by host,
> > > 
> > > Host.
> > > 
> > > > host could fool guest by just suppress the event. Guest thought the
> > > > DMA writting is successful but it is not and may cause security issue.
> > > 
> > > An RMP event on the host is an indication that RMP check has failed and DMA to the guest did not complete so the guest won't see new data. Same as other PCI errors really. RMP acts like a firewall, things behind it do not need to know if something was dropped. Thanks,
> > 
> > Not really, guest thought the data is changed but it actually doesn't.
> > I.e. data integrity is broken.
> 
> I am not following, sorry. Integrity is broken when something untrusted (== other than the SNP guest and the trusted device) manages to write to the guest encrypted memory successfully.

Integrity is also broken when guest thought the content in some addr was
written to A but it actually stays B.

> If nothing is written - the guest can easily see this and do... nothing?

The guest may not see this only by RMP event, or IOMMU fault, malicious
host could surpress these events.  Yes, guest may later read the addr
and see the trick, but this cannot be ensured. There is no general
contract saying SW must read the addr to ensure DMA write successful.

And DMA to MMIO is the worse case than DMA to memory. SW even cannot
read back the content since MMIO registers may be Write Only.

So you need ASID fence to make guest easily see the DMA Silent Drop.
Intel & ARM also have there own way.

The purpose here is to have a consensus that benigh VMM should avoid
triggering these DMA Silent Drop protections, by "unbind TDI first,
then invalidate MMIO".

Thanks,
Yilun

> Devices have bugs or spurious interrupts happen, the guest driver should be able to cope with that.
> > Also please help check if the following relates to this issue:
> > 
> > SEV-TIO Firmware Interface SPEC, Section 2.11
> > 
> > If a bound TDI sends a request to the root complex, and the IOMMU detects a fault caused by host
> > configuration, the root complex fences the ASID from all further I/O to or from that guest. A host
> > fault is either a host page table fault or an RMP check violation. ASID fencing means that the
> > IOMMU blocks all further I/O from the root complex to the guest that the TDI was bound, and the
> > root complex blocks all MMIO accesses by the guest. When a guest writes to MMIO, the write is
> > silently dropped. When a guest reads from MMIO, the guest reads 1s.
> 
> Right, this is about not letting bad data through, i.e. integrity. Thanks,
> 
> > 
> > Thanks,
> > Yilun
> > 
> > > 
> > > > 
> > > > Thanks,
> > > > Yilun
> > > 
> > > -- 
> > > Alexey
> > > 
> 
> -- 
> Alexey
> 
