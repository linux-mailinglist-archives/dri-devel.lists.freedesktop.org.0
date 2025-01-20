Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BDA16623
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 05:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866E910E28F;
	Mon, 20 Jan 2025 04:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CP+huDC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1745510E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 04:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737348210; x=1768884210;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k9VTW4s3d7qGGrZ5gSy0LHsgcR6UYlQ4IwsEUwEVNfU=;
 b=CP+huDC76rzlr5EQU4OoiJqmiZMKj+/t1LHb2ArJsZUtc4XIgkGjHurm
 GZ1UeAaRec+LXRoeHPbE/kzzAXN4x07VjabIgE1nT61TfSN0wZj+Y0ysQ
 ctKncwzascGY6L8FNU//W5rCoRLsoevWIP8fZgF7wBkutB5W/wn1W97x2
 9LNdyqhHiLfim+y0J/pH1GbkarFPEoaIqxu3MnAYAyloKQBAwhn6NdOTH
 wRJaMnD0TlCxTFLB0WfdbizT9Dn62R/KBGOwNiQ6vaSk5goTzG0UOcLiz
 Zog7Lg3bTbdRoheZdhSlTW/6Tm4SqHjDKB2upvW4Uim4lXJzIVyS9iaQd Q==;
X-CSE-ConnectionGUID: GJiSGwJoQgSJxfDPVb3/vQ==
X-CSE-MsgGUID: Td9YuY5MQMqaGjtpC7FYRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41467915"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="41467915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 20:43:30 -0800
X-CSE-ConnectionGUID: 7xzZrTKBSAigrIZdE0pXfA==
X-CSE-MsgGUID: Qwq3bW2hQM27SILBbyoG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106818894"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 20:43:24 -0800
Message-ID: <c5aead07-2511-43a1-8f22-1346be34af28@linux.intel.com>
Date: Mon, 20 Jan 2025 12:41:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050> <20250110133116.GF5556@nvidia.com>
 <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050> <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050> <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250117132523.GA5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 1/17/25 21:25, Jason Gunthorpe wrote:
>> If my recollection is correct, the arm
>> smmu-v3 needs it to obtain the vmid to setup the userspace event queue:
> Right now it will use a VMID unrelated to KVM. BTM support on ARM will
> require syncing the VMID with KVM.
> 
> AMD and Intel may require the KVM for some reason as well.
> 
> For CC I'm expecting the KVM fd to be the handle for the cVM, so any
> RPCs that want to call into the secure world need the KVM FD to get
> the cVM's identifier. Ie a "bind to cVM" RPC will need the PCI
> information and the cVM's handle.
> 
>  From that perspective it does make sense that any cVM related APIs,
> like "bind to cVM" would be against the VDEVICE where we have a link
> to the VIOMMU which has the KVM. On the iommufd side the VIOMMU is
> part of the object hierarchy, but does not necessarily have to force a
> vIOMMU to appear in the cVM.

Yea, from that perspective, treating the vDEVICE object as the primary
focus for the uAPIs of cVMs is more reasonable. This simplifies the
iommu drivers by eliminating the need to verify hardware capabilities
and compatibilities within each callback. Everything could be done in
one shot when allocating the vDEVICE object.

> 
> But it also seems to me that VFIO should be able to support putting
> the device into the RUN state without involving KVM or cVMs.

Then, it appears that BIND ioctl should be part of VFIO uAPI.

>> Intel TDX connect implementation also needs a reference to the kvm
>> pointer to obtain the secure EPT information. This is crucial because
>> the CPU's page table must be shared with the iommu.
> I thought kvm folks were NAKing this sharing entirely? Or is the

Yes, previous idea of *generic* EPT sharing was objected by the kvm
folks. The primary concern, as I understand it, is that KVM has many
"page non-present" tricks in EPT, which are not applicable to IOPT.
Consequently, KVM must now consider IOPT requirements when sharing the
EPT with the IOMMU, which presents a significant maintenance burden for
the KVM folks.

> secure EPT in the secure world and not directly managed by Linux?
But Secure EPT is managed by the TDX module within the secure world.
Crucially, KVM does not involve any such mechanisms. The firmware
guarantees that any Secure EPT configuration will be applicable to
Secure IOPT. This approach may alleviate concerns raised by the KVM
community.

> AFAIK AMD is going to mirror the iommu page table like today.
> 
> ARM, I suspect, will not have an "EPT" under Linux control, so
> whatever happens will be hidden in their secure world.

Intel also does not have an EPT under Linux control. The KVM has a
mirrored page table and syncs it with the secure EPT managed by firmware
every time it is updated through the ABIs defined by the firmware.

Thanks,
baolu
