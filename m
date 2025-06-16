Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D49ADAA7E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 10:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927B410E2CF;
	Mon, 16 Jun 2025 08:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lf96xJkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FA110E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:17:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 33DAB43784;
 Mon, 16 Jun 2025 08:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7A2C4CEEF;
 Mon, 16 Jun 2025 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750061816;
 bh=ly1IWPhnZ1mdLMMMt0ZwbtlmSqYG5wNvS1Mp/mjCGh8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lf96xJkgz6KBIDKXutGdJKHWBKiiYSI3P6IV8Rt4Ezx881d0N/1Wijd5CsuRIrmEH
 iO0ucq0zXsVTGRDCftXbROmy1p+s47E4JpV7ohXYepO9R7fK74pYfzjnB9FPr2Dlx+
 D9NmY1kqgsg4kqDo/WT/NtXgtFSN2gwawJtsZ8RQTdBYPsqQTV/Q6+/FKiJNkmFfpH
 38ON4HibYUOxRIYYPLb0P68B7/oMeIWR9jxB6ugZJYqrpWHcs86OBbGakdHQuLjjdL
 QV9OSCvZIdRlCd+8xO5J6YwfLV78gsg+hBMUxv6kqHIlfm5xqRf9CiuRuve6uXlEVF
 3uekUV373Yc3w==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>
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
In-Reply-To: <aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5aplfn210z.fsf@kernel.org> <aD24r44v0g1NgeZs@yilunxu-OptiPlex-7050>
 <yq5ajz5r8w6p.fsf@kernel.org> <aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050>
Date: Mon, 16 Jun 2025 13:46:42 +0530
Message-ID: <yq5a5xgwt82d.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Xu Yilun <yilun.xu@linux.intel.com> writes:

> On Wed, Jun 04, 2025 at 07:07:18PM +0530, Aneesh Kumar K.V wrote:
>> Xu Yilun <yilun.xu@linux.intel.com> writes:
>> 
>> > On Sun, Jun 01, 2025 at 04:15:32PM +0530, Aneesh Kumar K.V wrote:
>> >> Xu Yilun <yilun.xu@linux.intel.com> writes:
>> >> 
>> >> > Add new IOCTLs to do TSM based TDI bind/unbind. These IOCTLs are
>> >> > expected to be called by userspace when CoCo VM issues TDI bind/unbind
>> >> > command to VMM. Specifically for TDX Connect, these commands are some
>> >> > secure Hypervisor call named GHCI (Guest-Hypervisor Communication
>> >> > Interface).
>> >> >
>> >> > The TSM TDI bind/unbind operations are expected to be initiated by a
>> >> > running CoCo VM, which already have the legacy assigned device in place.
>> >> > The TSM bind operation is to request VMM make all secure configurations
>> >> > to support device work as a TDI, and then issue TDISP messages to move
>> >> > the TDI to CONFIG_LOCKED or RUN state, waiting for guest's attestation.
>> >> >
>> >> > Do TSM Unbind before vfio_pci_core_disable(), otherwise will lead
>> >> > device to TDISP ERROR state.
>> >> >
>> >> 
>> >> Any reason these need to be a vfio ioctl instead of iommufd ioctl?
>> >> For ex: https://lore.kernel.org/all/20250529133757.462088-3-aneesh.kumar@kernel.org/
>> >
>> > A general reason is, the device driver - VFIO should be aware of the
>> > bound state, and some operations break the bound state. VFIO should also
>> > know some operations on bound may crash kernel because of platform TSM
>> > firmware's enforcement. E.g. zapping MMIO, because private MMIO mapping
>> > in secure page tables cannot be unmapped before TDI STOP [1].
>> >
>> > Specifically, for TDX Connect, the firmware enforces MMIO unmapping in
>> > S-EPT would fail if TDI is bound. For AMD there seems also some
>> > requirement about this but I need Alexey's confirmation.
>> >
>> > [1] https://lore.kernel.org/all/aDnXxk46kwrOcl0i@yilunxu-OptiPlex-7050/
>> >
>> 
>> According to the TDISP specification (Section 11.2.6), clearing either
>> the Bus Master Enable (BME) or Memory Space Enable (MSE) bits will cause
>> the TDI to transition to an error state. To handle this gracefully, it
>> seems necessary to unbind the TDI before modifying the BME or MSE bits.
>
> Yes. But now the suggestion is never let VFIO do unbind, instead VFIO
> should block these operations when device is bound.
>
>> 
>> If I understand correctly, we also need to unmap the Stage-2 mapping due
>> to the issue described in commit
>> abafbc551fddede3e0a08dee1dcde08fc0eb8476. Are there any additional
>> reasons we would want to unmap the Stage-2 mapping for the BAR (as done
>> in vfio_pci_zap_and_down_write_memory_lock)?
>
> I think no more reason. 
>
>> 
>> Additionally, with TDX, it appears that before unmapping the Stage-2
>> mapping for the BAR, we should first unbind the TDI (ie, move it to the
>> "unlock" state?) Is this step related Section 11.2.6 of the TDISP spec,
>> or is it driven by a different requirement?
>
> No, this is not device side TDISP requirement. It is host side
> requirement to fix DMA silent drop issue. TDX enforces CPU S2 PT share
> with IOMMU S2 PT (does ARM do the same?), so unmap CPU S2 PT in KVM equals
> unmap IOMMU S2 PT.
>
> If we allow IOMMU S2 PT unmapped when TDI is running, host could fool
> guest by just unmap some PT entry and suppress the fault event. Guest
> thought a DMA writting is successful but it is not and may cause
> data integrity issue.
>

I am still trying to find more details here. How did the guest conclude
DMA writing is successful? Guest would timeout waiting for DMA to complete
if the host hides the interrupt delivery of failed DMA transfer?

>
> This is not a TDX specific problem, but different vendors has different
> mechanisms for this. For TDX, firmware fails the MMIO unmap for S2. For
> AMD, will trigger some HW protection called "ASID fence" [1]. Not sure
> how ARM handles this?
>
> https://lore.kernel.org/all/aDnXxk46kwrOcl0i@yilunxu-OptiPlex-7050/
>
> Thanks,
> Yilun
>

-aneesh
