Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774DACED15
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 11:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5947210E10A;
	Thu,  5 Jun 2025 09:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaTyqTXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776910E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749116882; x=1780652882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/VL9o7ChNpJtoUsc5ibEOwDBnVANVkT3Ha++wcl3fYE=;
 b=aaTyqTXTyAJOqU1M1DaDkQN2jng8MG5y7WV8IkJyUtraxF4jZ469KTvd
 N1DNqS+LgAOG9cZt7ecmZ44/2ivmaH5uLEG8o1iaQqd6FNdGb1IXpE+e0
 BQq7juFCImzvxN5Uu8fURVglitdaPYo/Nnuq5BwT3GJCFvJDNqbv2gHK4
 Bl/SV6HfSvJUmjkLcxIf24+r/e2vhiwZjgCw2DdpwgHcEnA5kMnLvYM1d
 Ww8569bGryfTP4JvLvYPHjRovORGj6KPPtcLh60N+Zl23ETe6Na5BYo8U
 L5quvJfqI6Y2xOF61cNmXML83+IBBlRHobXCm16CjoFnu+gKQdh1RbSmK w==;
X-CSE-ConnectionGUID: 08D1eIBPSUGf9WATF+Cceg==
X-CSE-MsgGUID: n1g8upYKR8ySD+g2H7sl0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61894010"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="61894010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 02:48:02 -0700
X-CSE-ConnectionGUID: bZl8PvLtTTmumH8CpnrPsQ==
X-CSE-MsgGUID: NroY4ThARXa4bErMmRN2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145358422"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa006.jf.intel.com with ESMTP; 05 Jun 2025 02:47:55 -0700
Date: Thu, 5 Jun 2025 17:41:17 +0800
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
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5aplfn210z.fsf@kernel.org>
 <aD24r44v0g1NgeZs@yilunxu-OptiPlex-7050>
 <yq5ajz5r8w6p.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajz5r8w6p.fsf@kernel.org>
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

On Wed, Jun 04, 2025 at 07:07:18PM +0530, Aneesh Kumar K.V wrote:
> Xu Yilun <yilun.xu@linux.intel.com> writes:
> 
> > On Sun, Jun 01, 2025 at 04:15:32PM +0530, Aneesh Kumar K.V wrote:
> >> Xu Yilun <yilun.xu@linux.intel.com> writes:
> >> 
> >> > Add new IOCTLs to do TSM based TDI bind/unbind. These IOCTLs are
> >> > expected to be called by userspace when CoCo VM issues TDI bind/unbind
> >> > command to VMM. Specifically for TDX Connect, these commands are some
> >> > secure Hypervisor call named GHCI (Guest-Hypervisor Communication
> >> > Interface).
> >> >
> >> > The TSM TDI bind/unbind operations are expected to be initiated by a
> >> > running CoCo VM, which already have the legacy assigned device in place.
> >> > The TSM bind operation is to request VMM make all secure configurations
> >> > to support device work as a TDI, and then issue TDISP messages to move
> >> > the TDI to CONFIG_LOCKED or RUN state, waiting for guest's attestation.
> >> >
> >> > Do TSM Unbind before vfio_pci_core_disable(), otherwise will lead
> >> > device to TDISP ERROR state.
> >> >
> >> 
> >> Any reason these need to be a vfio ioctl instead of iommufd ioctl?
> >> For ex: https://lore.kernel.org/all/20250529133757.462088-3-aneesh.kumar@kernel.org/
> >
> > A general reason is, the device driver - VFIO should be aware of the
> > bound state, and some operations break the bound state. VFIO should also
> > know some operations on bound may crash kernel because of platform TSM
> > firmware's enforcement. E.g. zapping MMIO, because private MMIO mapping
> > in secure page tables cannot be unmapped before TDI STOP [1].
> >
> > Specifically, for TDX Connect, the firmware enforces MMIO unmapping in
> > S-EPT would fail if TDI is bound. For AMD there seems also some
> > requirement about this but I need Alexey's confirmation.
> >
> > [1] https://lore.kernel.org/all/aDnXxk46kwrOcl0i@yilunxu-OptiPlex-7050/
> >
> 
> According to the TDISP specification (Section 11.2.6), clearing either
> the Bus Master Enable (BME) or Memory Space Enable (MSE) bits will cause
> the TDI to transition to an error state. To handle this gracefully, it
> seems necessary to unbind the TDI before modifying the BME or MSE bits.

Yes. But now the suggestion is never let VFIO do unbind, instead VFIO
should block these operations when device is bound.

> 
> If I understand correctly, we also need to unmap the Stage-2 mapping due
> to the issue described in commit
> abafbc551fddede3e0a08dee1dcde08fc0eb8476. Are there any additional
> reasons we would want to unmap the Stage-2 mapping for the BAR (as done
> in vfio_pci_zap_and_down_write_memory_lock)?

I think no more reason. 

> 
> Additionally, with TDX, it appears that before unmapping the Stage-2
> mapping for the BAR, we should first unbind the TDI (ie, move it to the
> "unlock" state?) Is this step related Section 11.2.6 of the TDISP spec,
> or is it driven by a different requirement?

No, this is not device side TDISP requirement. It is host side
requirement to fix DMA silent drop issue. TDX enforces CPU S2 PT share
with IOMMU S2 PT (does ARM do the same?), so unmap CPU S2 PT in KVM equals
unmap IOMMU S2 PT.

If we allow IOMMU S2 PT unmapped when TDI is running, host could fool
guest by just unmap some PT entry and suppress the fault event. Guest
thought a DMA writting is successful but it is not and may cause
data integrity issue.

This is not a TDX specific problem, but different vendors has different
mechanisms for this. For TDX, firmware fails the MMIO unmap for S2. For
AMD, will trigger some HW protection called "ASID fence" [1]. Not sure
how ARM handles this?

https://lore.kernel.org/all/aDnXxk46kwrOcl0i@yilunxu-OptiPlex-7050/

Thanks,
Yilun

> 
> -aneesh
