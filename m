Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E814A17732
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988EC10E4CC;
	Tue, 21 Jan 2025 06:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maE41V/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6246A10E4CB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737439543; x=1768975543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EICKAbt6ehTM275az3a+HO8w7Dd752OxSdIpuT+vXjw=;
 b=maE41V/6MpMNflpZFmV/YLZ8ot89NC7a0Qjg5+EIBTBnifADi6B+LeWA
 LfckI7g2NoGItO6B/5BpT8NiFrrKRQwwziOvIXeUl4acRSh13rVCaGdtR
 RTLlcH96v1stM1r3mrJXhnoYKedupRZdPo9ZIvJLThRDE3EV/hIgaDCV2
 I15uxnlcRO1kvua+nShMWI4Yy5dllQyQTsBcGZ8LOCYA8nWauT2bh9MKf
 FGjM2QOhuM+Z5y3OA+ur21DA/pebf1zzetRJQeGfT8wKmsVuk5KWZmmTg
 i3DzSTDUNmhXmU3wNY2kbdn+MuDdIrXIGpf0R4hAd6vXDho+jVhFS9E9O A==;
X-CSE-ConnectionGUID: ndESF8aRRNup8jNNutt71g==
X-CSE-MsgGUID: Da+w37F3QdeHw6qcf52npg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37947875"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37947875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:05:42 -0800
X-CSE-ConnectionGUID: tHJjq00eSoirj4Z7Z0C1/g==
X-CSE-MsgGUID: KEwSyQz7S/mHimzNYrB6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106509090"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa009.jf.intel.com with ESMTP; 20 Jan 2025 22:05:36 -0800
Date: Tue, 25 Jun 2024 05:12:10 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Alexey Kardashevskiy <aik@amd.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <ZnnhKtA2n4s1CLyf@yilunxu-OptiPlex-7050>
References: <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <Znh+uTMe/wX2RIJm@yilunxu-OptiPlex-7050>
 <20250120132525.GH5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120132525.GH5556@nvidia.com>
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

On Mon, Jan 20, 2025 at 09:25:25AM -0400, Jason Gunthorpe wrote:
> On Mon, Jun 24, 2024 at 03:59:53AM +0800, Xu Yilun wrote:
> > > But it also seems to me that VFIO should be able to support putting
> > > the device into the RUN state
> > 
> > Firstly I think VFIO should support putting device into *LOCKED* state.
> > From LOCKED to RUN, there are many evidence fetching and attestation
> > things that only guest cares. I don't think VFIO needs to opt-in.
> 
> VFIO is not just about running VMs. If someone wants to run DPDK on
> VFIO they should be able to get the device into a RUN state and work
> with secure memory without requiring a KVM. Yes there are many steps
> to this, but we should imagine how it can work.

Interesting Question. I've never thought about native TIO before.

And you are also thinking about VFIO usage in CoCo-VM. So I believe
VFIO could be able to support putting the device into the RUN state,
but no need a uAPI for that, this happens when VFIO works as a TEE
attester.

In different cases, VFIO plays different roles:

1. TEE helper, but itself is out of TEE.
2. TEE attester, it is within the TEE.
3. TEE user, it is within the TEE.

As a TEE helper, it works on a untrusted device and help put the device
in LOCKED state, waiting for attestation. For VM use case, VM acts as the
attester to do attestation and move device into trusted/RUN state (lets
say 'accept'). The attestation and accept could be direct talks between
attester and device (maybe via TSM sysfs node), because from
LOCKED -> RUN VFIO doesn't change its way of handling device so seems
no need to introduce extra uAPIs and complexity just for passing the
talks. That's my expectation of VFIO's responsibility as a TEE
helper - serve until LOCKED, no care about the rest, UNLOCK rollbacks
everything.

I imagine in bare metal, if DPDK works as an attester (within TEE) and
VFIO still as a TEE helper (out of TEE), this model seems still work.



When VFIO works as a TEE user in VM, it means an attester (e.g. PCI
subsystem) has already moved the device to RUN state. So VFIO & DPDK
are all TEE users, no need to manipulate TDISP state between them.
AFAICS, this is the most preferred TIO usage in CoCo-VM.

When VFIO works as a TEE attester in VM, it means the VM's PCI
subsystem leaves the attestation work to device drivers. VFIO should do
the attestation and accept before pass through to DPDK, again no need to
manipulate TDISP state between them.

I image the possibility TIO happens on bare metal, that a device is
configured as waiting for attestation by whatever kernel module, then
PCI subsystem or VFIO try to attest, accept and use it, just the same as
in CoCo VM.

> 
> > > without involving KVM or cVMs.
> > 
> > It may not be feasible for all vendors. 
> 
> It must be. A CC guest with an in kernel driver can definately get the
> PCI device into RUN, so VFIO running in the guest should be able as
> well.

You are talking about VFIO in CoCo-VM as an attester, then definiately
yes.

> 
> > I believe AMD would have one firmware call that requires cVM handle
> > *AND* move device into LOCKED state. It really depends on firmware
> > implementation.
> 
> IMHO, you would not use the secure firmware if you are not using VMs.
> 
> > Yes, the secure EPT is in the secure world and managed by TDX firmware.
> > Now a SW Mirror Secure EPT is introduced in KVM and managed by KVM
> > directly, and KVM will finally use firmware calls to propagate Mirror
> > Secure EPT changes to secure EPT.
> 
> If the secure world managed it then the secure world can have rules
> that work with the IOMMU as well..

Yes.

Thanks,
Yilun

> 
> Jason
