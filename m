Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C759825100
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DAC10E591;
	Fri,  5 Jan 2024 09:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4199410E591
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704447723; x=1735983723;
 h=from:to:cc:subject:date:message-id;
 bh=hfs+RsszOiy+Zn2bJH81rSeaYMQb4GgLRyTWh5I+W1Y=;
 b=DGwU+xAnZkgP99B8okCEJwsK8al0YZDGNoeWRfHD9FO3kj7QBltLt24T
 EhhxCfrb7m5dzkAjYU4JpEkzDi0mfwZFNCmdJMgaRp7FbR6pNYQ9cLxfI
 mgzK3AH/vJULiRuXzaEBRUI7bbzE4+5Rn6vWSlSsTyo+wMfiMGQxMLV4Q
 +RSHLOWuW770ImxlKMMRJqrlqIdtPkYlU63zwLw5cT9FLcfE/FDQsXmvf
 MG0RYuC1RW6JaoNsfdarIiSGyjpB2toBk85CmK4V81Hz+890uvt/553bd
 R36HxN5ofLs3U1qBzjQb+mfaytszwyVkieQw7q7usQtG78bNPePgvlAuJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4285877"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4285877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="15196531"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:41:57 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Date: Fri,  5 Jan 2024 17:12:37 +0800
Message-Id: <20240105091237.24577-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: wanpengli@tencent.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 maz@kernel.org, joro@8bytes.org, zzyiwei@google.com, jgg@nvidia.com,
 yuzenghui@huawei.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 suzuki.poulose@arm.com, alex.williamson@redhat.com, yongwei.ma@intel.com,
 zhiyuan.lv@intel.com, jmattson@google.com, zhenyu.z.wang@intel.com,
 seanjc@google.com, ankita@nvidia.com, oliver.upton@linux.dev,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series allow user space to notify KVM of noncoherent DMA status so as
to let KVM honor guest memory types in specified memory slot ranges.

Motivation
===
A virtio GPU device may want to configure GPU hardware to work in
noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
This is generally for performance consideration.
In certain platform, GFX performance can improve 20+% with DMAs going to
noncoherent path.

This noncoherent DMA mode works in below sequence:
1. Host backend driver programs hardware not to snoop memory of target
   DMA buffer.
2. Host backend driver indicates guest frontend driver to program guest PAT
   to WC for target DMA buffer.
3. Guest frontend driver writes to the DMA buffer without clflush stuffs.
4. Hardware does noncoherent DMA to the target buffer.

In this noncoherent DMA mode, both guest and hardware regard a DMA buffer
as not cached. So, if KVM forces the effective memory type of this DMA
buffer to be WB, hardware DMA may read incorrect data and cause misc
failures.

Therefore we introduced a new memslot flag KVM_MEM_NON_COHERENT_DMA to
allow user space convey noncoherent DMA status in memslot granularity.
Platforms that do not always honor guest memory type can choose to honor
it in ranges of memslots with KVM_MEM_NON_COHERENT_DMA set.

Security
===
The biggest concern for KVM to honor guest's memory type is page aliasing
issue.
In Intel's platform,
- For host MMIO, KVM VMX always programs EPT memory type to UC (which will
  overwrite all guest PAT types except WC), which is of no change after
  this series.

- For host non-MMIO pages,
  * virtio guest frontend and host backend driver should be synced to use
    the same memory type to map a buffer. Otherwise, there will be
    potential problem for incorrect memory data. But this will only impact
    the buggy guest alone.
  * for live migration, user space can skip reading/writing memory
    corresponding to the memslot with flag KVM_MEM_NON_COHERENT_DMA or
    do some special handling during memory read/write.

Implementation
===
Unlike previous RFC series [1] that uses a new KVM VIRTIO device to convey
noncoherent DMA status, this version chooses to introduce a new memslot
flag, similar to what's done in series from google at [2].
The difference is that [2] increases noncoherent DMA count to ask KVM VMX
to honor guest memory type for all guest memory as a whole, while this
series will only ask KVM to honor guest memory type in the specified
memslots.

The reason of not introducing a KVM cap or a memslot flag to allow users to
toggle noncoherent DMA state as a whole is mainly for the page aliasing
issue as mentioned above.
If guest memory type is only honored in limited memslots, user space can
do special handling before/after accessing to guest memory belonging to the
limited memslots.

For virtio GPUs, it usually will create memslots that are mapped into guest
device BARs.
- guest device driver will sync with host side to use the same memory type
  to access that memslots.
- no other guest components will have access to the memory in the memslots
  since it's mapped as device BARs.
So, by adding flag KVM_MEM_NON_COHERENT_DMA to memslots specific to virtio
GPUs and asking KVM to only honor guest memory in those memslots, page
aliasing issue can be avoided easily.

This series doesn't limit which memslots are legible to set flag
KVM_MEM_NON_COHERENT_DMA, so if the user sets this flag to memslots for
guest system RAM, page aliasing issue may be met during live migration
or other use cases when host wants to access guest memory with different
memory types due to lacking of coordination between non-enlightened guest
components and host. Just as when noncoherent DMA devices are assigned
through VFIO.
But as it will not impact other VMs, we choose to trust the user and let
the user to do mitigations when it has to set this flag to memslots for
guest system RAM.

Note:
We also noticed that there's a series [3] trying to fix a similar problem
in ARM for VFIO device passthrough.
The difference is that [3] is trying to fix the problem that guest memory
types for pass-through device MMIOs are not honored in ARM (which is not a
problem for x86 VMX), while this series is for the problem that guest
memory types are not honored in non-host-MMIO ranges for virtio GPUs in x86
VMX.

Changelog:
RFC --> v1:
- Switch to use memslot flag way to convey non-coherent DMA info
  (Sean, Kevin)
- Do not honor guest MTRRs in memslot of flag KVM_MEM_NON_COHERENT_DMA
  (Sean)

[1]: https://lore.kernel.org/all/20231214103520.7198-1-yan.y.zhao@intel.com/
[2]: https://patchwork.kernel.org/project/dri-devel/cover/20200213213036.207625-1-olvaffe@gmail.com/
[3]: https://lore.kernel.org/all/20231221154002.32622-1-ankita@nvidia.com/


Yan Zhao (4):
  KVM: Introduce a new memslot flag KVM_MEM_NON_COHERENT_DMA
  KVM: x86: Add a new param "slot" to op get_mt_mask in kvm_x86_ops
  KVM: VMX: Honor guest PATs for memslots of flag
    KVM_MEM_NON_COHERENT_DMA
  KVM: selftests: Set KVM_MEM_NON_COHERENT_DMA as a supported memslot
    flag

 arch/x86/include/asm/kvm_host.h                      | 3 ++-
 arch/x86/kvm/mmu/spte.c                              | 3 ++-
 arch/x86/kvm/vmx/vmx.c                               | 6 +++++-
 include/uapi/linux/kvm.h                             | 2 ++
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 virt/kvm/kvm_main.c                                  | 8 ++++++--
 6 files changed, 20 insertions(+), 5 deletions(-)


base-commit: 8ed26ab8d59111c2f7b86d200d1eb97d2a458fd1
-- 
2.17.1

