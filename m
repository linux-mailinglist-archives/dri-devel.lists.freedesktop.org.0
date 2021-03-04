Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9B32CC85
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 07:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEF66E9E4;
	Thu,  4 Mar 2021 06:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875036E9E4;
 Thu,  4 Mar 2021 06:16:54 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60407b540001>; Wed, 03 Mar 2021 22:16:52 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar
 2021 06:16:52 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 4 Mar 2021 06:16:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v4 0/8] Add support for SVM atomics in Nouveau
Date: Thu, 4 Mar 2021 17:16:37 +1100
Message-ID: <20210304061645.29747-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614838612; bh=t6B4f5Ppu8px5H2dMFmKgDK7WICY1z6dJISEU4+x4ag=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=NRpT7fRUvBWRAf1lii9D1D4XF8JjwwINz24VXywclaGQn01Je15TB68IrAlqTRLFb
 hTKlNISpPfdI+crudrC1GlLg+hdVp5jnPJ5h8reX2h/EhcIx5TBKBmWUn1isy7quXc
 syg3lgGq3JVJbOXIXjK1RW4v52wYa+luQE3zo2v8lvd1yEYPsEgdODAK5Y0y6CdQ7O
 hgoCmwaI5F7EU93uKDqNv07F5PLZKh1vgyYv7Ag5HuLz96pDGTBuKTfrgZMVfQKR5P
 35QK/rsCLWpS0UWUjAgnI+POWVmoPsosDXVq8u45ROFSxrFeSe5FBkzeK6bKmZ8pKQ
 L/Xk8fN8+NJzA==
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the forth version of a series to add support to Nouveau for atomic
memory operations on OpenCL shared virtual memory (SVM) regions. This is
achieved using the atomic PTE bits on the GPU to only permit atomic
operations to system memory when a page is not mapped in userspace on the
CPU. The previous version of this series used an unmap and pin page
migration, however this resulted in problems with ZONE_MOVABLE and other
issues so this series uses a different approach.

Instead exclusive device access is implemented by adding a new swap entry
type (SWAP_DEVICE_EXCLUSIVE) which is similar to a migration entry. The
main difference is that on fault the original entry is immediately restored
by the fault handler instead of waiting.

Restoring the entry triggers calls to MMU notifers which allows a device
driver to revoke the atomic access permission from the GPU prior to the CPU
finalising the entry.

Patches 1 & 2 refactor existing migration and device private entry
functions.

Patches 3 & 4 rework try_to_unmap_one() by splitting out unrelated
functionality into separate functions - try_to_migrate_one() and
try_to_munlock_one(). These should not change any functionality, but any
help testing would be much appreciated as I have not been able to test
every usage of try_to_unmap_one().

Patch 5 contains the bulk of the implementation for device exclusive
memory.

Patch 6 contains some additions to the HMM selftests to ensure everything
works as expected and has not changed significantly since v3.

Patch 7 was posted previously and has not changed.

Patch 8 was posted for v3 and has been updated to safely program the GPU
page tables.

This has been tested using the latest upstream Mesa userspace with a simple
OpenCL test program which checks the results of atomic GPU operations on a
SVM buffer whilst also writing to the same buffer from the CPU.

v4:
* Added pfn_swap_entry_to_page() and reinstated the migration entry page
  lock check.
* Added check_device_exclusive_range() for use during mmu range notifier
  read side critical section when programming device page tables.

v3:
* Refactored some existing functionality.
* Switched to using get_user_pages_remote() instead of open-coding it.
* Moved code out of hmm.

v2:
* Changed implementation to use special swap entries instead of device
  private pages.

Alistair Popple (8):
  mm: Remove special swap entry functions
  mm/swapops: Rework swap entry manipulation code
  mm/rmap: Split try_to_munlock from try_to_unmap
  mm/rmap: Split migration into its own function
  mm: Device exclusive memory access
  mm: Selftests for exclusive device memory
  nouveau/svm: Refactor nouveau_range_fault
  nouveau/svm: Implement atomic SVM access

 Documentation/vm/hmm.rst                      |  15 +
 arch/s390/mm/pgtable.c                        |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 135 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 fs/proc/task_mmu.c                            |  23 +-
 include/linux/rmap.h                          |  10 +-
 include/linux/swap.h                          |   8 +-
 include/linux/swapops.h                       | 123 ++--
 lib/test_hmm.c                                | 124 ++++
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  40 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 127 +++-
 mm/migrate.c                                  |  41 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 618 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 219 +++++++
 23 files changed, 1310 insertions(+), 254 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
