Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D09AC2D2C
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 05:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B9010E1D7;
	Sat, 24 May 2025 03:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bh/mBdo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB2410E1D7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748056765; x=1779592765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aKGOyzbJrzN8WMah0QytCpBqybQjQU1lcfiEx/DwODY=;
 b=Bh/mBdo3ygYttwZcL8mxTEirvwjBWp2STpb5OB4ijefVTn6r9lo2hRx2
 TUPmmUXgLHGimhAnrdTJO5Yd63TXBlt5wuSLcUu3bsHLyr8paEqu6TK7A
 HRmubl0rVHYxC6RYuhnzXcMVuGvG9Ayox8j4jTCRbPbGKQZu312FBAzmm
 czn1npWZNtMZo/SeWWcTYPvb9W5nzKpJj9Klz/n9qY1WYLGbG6j8e1Nat
 38sXWO1EEjx5vTV2pBNLpIhIG2mGl/kP6by9dwIaCnG4tYIW9lAE7Mus+
 /+ZwZ7dxPQ7SJy1s8jP+seCqeBHdlYQyJU4AKU1lKxjidyxb2qZ3tNdtB g==;
X-CSE-ConnectionGUID: Yxi5INsASuqC258vOlpagg==
X-CSE-MsgGUID: FkqrCRnNR2eCHSe0FrrwBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75512002"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; d="scan'208";a="75512002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 20:19:20 -0700
X-CSE-ConnectionGUID: kK5FK+7WR+6EITRbyf2/Hg==
X-CSE-MsgGUID: BxDD6IdvRCSWXdfZWQtPOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; d="scan'208";a="141267086"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa009.jf.intel.com with ESMTP; 23 May 2025 20:19:14 -0700
Date: Sat, 24 May 2025 11:13:12 +0800
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
Message-ID: <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
References: <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
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

On Thu, May 22, 2025 at 01:45:57PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 16/5/25 02:04, Xu Yilun wrote:
> > On Wed, May 14, 2025 at 01:33:39PM -0300, Jason Gunthorpe wrote:
> > > On Wed, May 14, 2025 at 03:02:53PM +0800, Xu Yilun wrote:
> > > > > We have an awkward fit for what CCA people are doing to the various
> > > > > Linux APIs. Looking somewhat maximally across all the arches a "bind"
> > > > > for a CC vPCI device creation operation does:
> > > > > 
> > > > >   - Setup the CPU page tables for the VM to have access to the MMIO
> > > > 
> > > > This is guest side thing, is it? Anything host need to opt-in?
> > > 
> > > CPU hypervisor page tables.
> > > 
> > > > >   - Revoke hypervisor access to the MMIO
> > > > 
> > > > VFIO could choose never to mmap MMIO, so in this case nothing to do?
> > > 
> > > Yes, if you do it that way.
> > > > >   - Setup the vIOMMU to understand the vPCI device
> > > > >   - Take over control of some of the IOVA translation, at least for T=1,
> > > > >     and route to the the vIOMMU
> > > > >   - Register the vPCI with any attestation functions the VM might use
> > > > >   - Do some DOE stuff to manage/validate TDSIP/etc
> > > > 
> > > > Intel TDX Connect has a extra requirement for "unbind":
> > > > 
> > > > - Revoke KVM page table (S-EPT) for the MMIO only after TDISP
> > > >    CONFIG_UNLOCK
> > > 
> > > Maybe you could express this as the S-EPT always has the MMIO mapped
> > > into it as long as the vPCI function is installed to the VM?
> > 
> > Yeah.
> > 
> > > Is KVM responsible for the S-EPT?
> > 
> > Yes.
> > 
> > > 
> > > > Another thing is, seems your term "bind" includes all steps for
> > > > shared -> private conversion.
> > > 
> > > Well, I was talking about vPCI creation. I understand that during the
> > > vPCI lifecycle the VM will do "bind" "unbind" which are more or less
> > > switching the device into a T=1 mode. Though I understood on some
> > 
> > I want to introduce some terms about CC vPCI.
> > 
> > 1. "Bind", guest requests host do host side CC setup & put device in
> > CONFIG_LOCKED state, waiting for attestation. Any further change which
> > has secuity concern breaks "bind", e.g. reset, touch MMIO, physical MSE,
> > BAR addr...
> > 
> > 2. "Attest", after "bind", guest verifies device evidences (cert,
> > measurement...).
> > 
> > 3. "Accept", after successful attestation, guest do guest side CC setup &
> > switch the device into T=1 mode (TDISP RUN state)
> 
> (implementation note)
> AMD SEV moves TDI to RUN at "Attest" as a guest still can avoid encrypted MMIO access and the PSP keeps IOMMU blocked until the guest enables it.
> 

Good to know. That's why we have these SW defined verbs rather than
reusing TDISP terms.

> > 4. "Unbind", guest requests host put device in CONFIG_UNLOCK state +
> > remove all CC setup.
> > 
> > > arches this was mostly invisible to the hypervisor?
> > 
> > Attest & Accept can be invisible to hypervisor, or host just help pass
> > data blobs between guest, firmware & device.
> 
> No, they cannot.

MM.. TSM driver is the agent of trusted firmware in the OS, so I
excluded it from "hypervisor". TSM driver could parse data blobs and do
whatever requested by trusted firmware.

I want to justify the general guest_request interface, explain why
VIFO/IOMMUFD don't have to maintain the "attest", "accept" states.

> 
> > Bind cannot be host agnostic, host should be aware not to touch device
> > after Bind.
> 
> Bind actually connects a TDI to a guest, the guest could not possibly do that alone as it does not know/have access to the physical PCI function#0 to do the DOE/SecSPDM messaging, and neither does the PSP.
> 
> The non-touching clause (or, more precisely "selectively touching") is about "Attest" and "Accept" when the TDI is in the CONFIG_LOCKED or RUN state. Up to the point when we rather want to block the config space and MSIX BAR access after the TDI is CONFIG_LOCKED/RUN to prevent TDI from going to the ERROR state.
> 
> 
> > > 
> > > > But in my mind, "bind" only includes
> > > > putting device in TDISP LOCK state & corresponding host setups required
> > > > by firmware. I.e "bind" means host lockes down the CC setup, waiting for
> > > > guest attestation.
> > > 
> > > So we will need to have some other API for this that modifies the vPCI
> > > object.
> > 
> > IIUC, in Alexey's patch ioctl(iommufd, IOMMU_VDEVICE_TSM_BIND) does the
> > "Bind" thing in host.
> 
> 
> I am still not sure what "vPCI" means exactly, a passed through PCI device? Or a piece of vIOMMU handling such device?
> 

My understanding is both. When you "Bind" you modifies the physical
device, you may also need to setup a piece of vIOMMU for private
assignement to work.

> 
> > > It might be reasonable to have VFIO reach into iommufd to do that on
> > > an already existing iommufd VDEVICE object. A little weird, but we
> > > could probably make that work.
> > 
> > Mm, Are you proposing an uAPI in VFIO, and a kAPI from VFIO -> IOMMUFD like:
> > 
> >   ioctl(vfio_fd, VFIO_DEVICE_ATTACH_VDEV, vdev_id)
> >   -> iommufd_device_attach_vdev()
> >      -> tsm_tdi_bind()
> > 
> > > 
> > > But you have some weird ordering issues here if the S-EPT has to have
> > > the VFIO MMIO then you have to have a close() destruction order that
> > 
> > Yeah, by holding kvm reference.
> > 
> > > sees VFIO remove the S-EPT and release the KVM, then have iommufd
> > > destroy the VDEVICE object.
> > 
> > Regarding VM destroy, TDX Connect has more enforcement, VM could only be
> > destroyed after all assigned CC vPCI devices are destroyed.
> 
> Can be done by making IOMMUFD/vdevice holding the kvm pointer to ensure tsm_tdi_unbind() is not called before the guest disappeared from the firmware. I seem to be just lucky with the current order of things being destroyed, hmm.
> 

tsm_tdi_unbind() *should* be called before guest disappear. For TDX
Connect that is the enforcement. Holding KVM pointer is the effective
way.

> 
> > Nowadays, VFIO already holds KVM reference, so we need
> > 
> > close(vfio_fd)
> > -> iommufd_device_detach_vdev()
> >     -> tsm_tdi_unbind()
> >        -> tdi stop
> >        -> callback to VFIO, dmabuf_move_notify(revoke)
> >           -> KVM unmap MMIO
> >        -> tdi metadata remove
> > -> kvm_put_kvm()
> >     -> kvm_destroy_vm()
> > 
> > 
> > > 
> > > > > It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
> > > > > stays in VFIO.
> > > > 
> > > > I'm not sure if Alexey's patch [1] illustates your idea. It calls
> > > > tsm_tdi_bind() which directly does device stuff, and impacts MMIO.
> > > > VFIO doesn't know about this.
> 
> VFIO knows about this enough as we asked it to share MMIO via dmabuf's fd and not via mmap(), otherwise it is the same MMIO, exactly where it was, BARs do not change.
> 

Yes, if you define a SW "lock down" in boarder sense than TDISP LOCKED.
But seems TDX Connect failed to adapt to this solution because it still
needs to handle MMIO invalidation before FLR, see below.

> > > > 
> > > > I have to interpret this as VFIO firstly hand over device CC features
> > > > and MMIO resources to IOMMUFD, so VFIO never cares about them.
> > > > 
> > > > [1] https://lore.kernel.org/all/20250218111017.491719-15-aik@amd.com/
> > > 
> > > There is also the PCI layer involved here and maybe PCI should be
> > > participating in managing some of this. Like it makes a bit of sense
> > > that PCI would block the FLR on platforms that require this?
> > 
> > FLR to a bound device is absolutely fine, just break the CC state.
> > Sometimes it is exactly what host need to stop CC immediately.
> > The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
> > PCI core.
> 
> What is a problem here exactly?
> FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.

It is about TDX Connect.

According to the dmabuf patchset, the dmabuf needs to be revoked before
FLR. That means KVM unmaps MMIOs when the device is in LOCKED/RUN state.
That is forbidden by TDX Module and will crash KVM. So the safer way is
to unbind the TDI first, then revoke MMIOs, then do FLR.

I'm not sure when p2p dma is involved AMD will have the same issue.
Cause in that case, MMIOs would also be mapped in IOMMU PT and revoke
MMIOs means IOMMU mapping drop. The root cause of the concern is secure
firmware should monitor IOMMU mapping integrity for private assignement
or hypervisor could silently drop trusted DMA writting.

TDX Connect has the wider impact on this issue cause it uses the same
table for KVM S-EPT and Secure IOMMU PT.

Thanks,
Yilun

> Or FLR by the guest? Then it knows it needs to do the dance with attest/accept, again.
> 
> Thanks,
> 
> > 
> > Thanks,
> > Yilun
> > 
> > > 
> > > Jason
> 
> -- 
> Alexey
> 
