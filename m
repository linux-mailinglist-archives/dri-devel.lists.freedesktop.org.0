Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4EAAB63CB
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC62F10E211;
	Wed, 14 May 2025 07:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVUzuxV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3175910E211
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 07:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747206534; x=1778742534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I5ZeDzwTsw5smVFSGfLPW9Kqqd0AVZLFXaBqDiREk1U=;
 b=NVUzuxV8Tr/tSV78zM6zgYQ2vVVrCn87JMS7IX0Dbh5MaWCtksxeZ7jW
 r9uVB2cigq14tizNJwruB7bpPeNhx2T3m1gQnVbu+EsJBkhiI0oI0hPO/
 DVhbGW20xkhE/9IACpHffJ4rScUn5p/2+IINuVnKXQ58yh+2NRtbLMRGU
 I8FLJ4trwmD1t6hCrR9Wi85mh7DiQPwJ6YQGEMna9tzs680CJlDZwIiaC
 IYx9AhXnCqQoGGWvS9mhjPPQDTj3mqdmR0RsFKC0MqEZwoTkZKbaet40U
 qYovhSQ60aCXUbtnxAqThrl4GaZOFZGb9N6mmUwqSrXyP947mvQW09sC4 A==;
X-CSE-ConnectionGUID: EIwU5BS2RE6h5aFeKJMbUA==
X-CSE-MsgGUID: 8u9hdiH8QouwW7tJ5cXhLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66635948"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="66635948"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 00:08:33 -0700
X-CSE-ConnectionGUID: PlY5bNZKQKau2P5xsihc5w==
X-CSE-MsgGUID: rrPdk0y0QkOk1bT2XRucfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142894346"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa004.jf.intel.com with ESMTP; 14 May 2025 00:08:27 -0700
Date: Wed, 14 May 2025 15:02:53 +0800
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
Message-ID: <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512140617.GA285583@nvidia.com>
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

On Mon, May 12, 2025 at 11:06:17AM -0300, Jason Gunthorpe wrote:
> On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy wrote:
> 
> > > > I'm surprised by this.. iommufd shouldn't be doing PCI stuff, it is
> > > > just about managing the translation control of the device.
> > > 
> > > I have a little difficulty to understand. Is TSM bind PCI stuff? To me
> > > it is. Host sends PCI TDISP messages via PCI DOE to put the device in
> > > TDISP LOCKED state, so that device behaves differently from before. Then
> > > why put it in IOMMUFD?
> > 
> > 
> > "TSM bind" sets up the CPU side of it, it binds a VM to a piece of
> > IOMMU on the host CPU. The device does not know about the VM, it
> > just enables/disables encryption by a request from the CPU (those
> > start/stop interface commands). And IOMMUFD won't be doing DOE, the
> > platform driver (such as AMD CCP) will. Nothing to do for VFIO here.
> > 
> > We probably should notify VFIO about the state transition but I do
> > not know VFIO would want to do in response.
> 
> We have an awkward fit for what CCA people are doing to the various
> Linux APIs. Looking somewhat maximally across all the arches a "bind"
> for a CC vPCI device creation operation does:
> 
>  - Setup the CPU page tables for the VM to have access to the MMIO

This is guest side thing, is it? Anything host need to opt-in?

>  - Revoke hypervisor access to the MMIO

VFIO could choose never to mmap MMIO, so in this case nothing to do?

>  - Setup the vIOMMU to understand the vPCI device
>  - Take over control of some of the IOVA translation, at least for T=1,
>    and route to the the vIOMMU
>  - Register the vPCI with any attestation functions the VM might use
>  - Do some DOE stuff to manage/validate TDSIP/etc

Intel TDX Connect has a extra requirement for "unbind":

- Revoke KVM page table (S-EPT) for the MMIO only after TDISP
  CONFIG_UNLOCK

Another thing is, seems your term "bind" includes all steps for
shared -> private conversion. But in my mind, "bind" only includes
putting device in TDISP LOCK state & corresponding host setups required
by firmware. I.e "bind" means host lockes down the CC setup, waiting for
guest attestation.

While "unbind" means breaking CC setup, no matter the vPCI device is
already accepted as CC device, or only locked and waiting for attestation.

> 
> So we have interactions of things controlled by PCI, KVM, VFIO, and
> iommufd all mushed together.
> 
> iommufd is the only area that already has a handle to all the required
> objects:
>  - The physical PCI function
>  - The CC vIOMMU object
>  - The KVM FD
>  - The CC vPCI object
> 
> Which is why I have been thinking it is the right place to manage
> this.

Yeah, I see the merit.

> 
> It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
> stays in VFIO.

I'm not sure if Alexey's patch [1] illustates your idea. It calls
tsm_tdi_bind() which directly does device stuff, and impacts MMIO.
VFIO doesn't know about this.

I have to interpret this as VFIO firstly hand over device CC features
and MMIO resources to IOMMUFD, so VFIO never cares about them.

[1] https://lore.kernel.org/all/20250218111017.491719-15-aik@amd.com/

> 
> > > > So your issue is you need to shoot down the dmabuf during vPCI device
> > > > destruction?
> > > 
> > > I assume "vPCI device" refers to assigned device in both shared mode &
> > > prvate mode. So no, I need to shoot down the dmabuf during TSM unbind,
> > > a.k.a. when assigned device is converting from private to shared.
> > > Then recover the dmabuf after TSM unbind. The device could still work
> > > in VM in shared mode.
> 
> What are you trying to protect with this? Is there some intelism where
> you can't have references to encrypted MMIO pages?
> 
> > > What I really want is, one SW component to manage MMIO dmabuf, secure
> > > iommu & TSM bind/unbind. So easier coordinate these 3 operations cause
> > > these ops are interconnected according to secure firmware's requirement.
> >
> > This SW component is QEMU. It knows about FLRs and other config
> > space things, it can destroy all these IOMMUFD objects and talk to
> > VFIO too, I've tried, so far it is looking easier to manage. Thanks,
> 
> Yes, qemu should be sequencing this. The kernel only needs to enforce
> any rules required to keep the system from crashing.

To keep from crashing, The kernel still needs to enforce some firmware
specific rules. That doesn't reduce the interactions between kernel
components. E.g. for TDX, if VFIO doesn't control "bind" but controls
MMIO, it should refuse FLR or MSE when device is bound. That means VFIO
should at least know from IOMMUFD whether device is bound.

Further more, these rules are platform firmware specific, "QEMU executes
kernel checks" means more SW components should be aware of these rules.
That multiples the effort.

And QEMU can be killed, means if kernel wants to reclaim all the
resources, it still have to deal with the sequencing. And I don't think
it is a good idea that kernel just stales large amount of resources.

Thanks,
Yilun
> 
> Jason
