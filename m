Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE831F3CD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 03:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AA36E0FC;
	Fri, 19 Feb 2021 02:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C336E0FC;
 Fri, 19 Feb 2021 02:08:02 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602f1d810001>; Thu, 18 Feb 2021 18:08:01 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Feb
 2021 02:08:00 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v2 0/4] Add support for SVM atomics in Nouveau
Date: Fri, 19 Feb 2021 13:07:46 +1100
Message-ID: <20210219020750.16444-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613700481; bh=5OrVHikvQYHHvCBqjLvpLd1/wujsuMHrn59MGSbB4U8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=QZzxAptqC9yZxIAmGC2CizywepnAeNH/FXMAYREg1kl+419LRnhO3RfNIiaasjLzo
 MO+T4y29Md6+e0pm4fwbXJK56zd8AMa2CyyTRErWST1mEqte8lG5RaO1z3SYnJFCD2
 NiTwdbUCKd/kgxKQCjVw2/feRuvtspwv/3FP8HanEccPirZrj1ZywaKo9YQ8BpETqx
 7dRc+hE5QM9my9gMF8BF9U4nzS1xSVOzQbZxk3LClRf7rgTUrFBPGn2nLe/P0dvDt/
 AQMp4reYdQg+ijQ0rSvtLGabW/vzVVprXlxQ55azJ+3knwPbhz9J4rMJVDMBZyy20t
 wjVSt58ckMImg==
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
 dri-devel@lists.freedesktop.org, hch@infradead.org, jglisse@redhat.com,
 kvm-ppc@vger.kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the second version of a series to add support to Nouveau for atomic
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

Patch 1 contains the bulk of the memory management changes required to
implement the new entry type.

Patch 2 contains some additions to the HMM selftests to ensure everything
works as expected.

Patch 3 was posted previously and has not changed.

Patch 4 is similar to what was posted previously but updated to use the new
swap entries instread of migration.

This has been tested using the latest upstream Mesa userspace with a simple
OpenCL test program which checks the results of atomic GPU operations on a
SVM buffer whilst also writing to the same buffer from the CPU.

Alistair Popple (4):
  hmm: Device exclusive memory access
  hmm: Selftests for exclusive device memory
  nouveau/svm: Refactor nouveau_range_fault
  nouveau/svm: Implement atomic SVM access

 Documentation/vm/hmm.rst                      |  15 ++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 118 +++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 fs/proc/task_mmu.c                            |   7 +
 include/linux/hmm.h                           |   4 +
 include/linux/rmap.h                          |   1 +
 include/linux/swap.h                          |  10 +-
 include/linux/swapops.h                       |  32 +++
 lib/test_hmm.c                                | 124 ++++++++++
 lib/test_hmm_uapi.h                           |   2 +
 mm/hmm.c                                      | 206 ++++++++++++++++
 mm/memory.c                                   |  34 ++-
 mm/mprotect.c                                 |   7 +
 mm/page_vma_mapped.c                          |  14 +-
 mm/rmap.c                                     |  29 ++-
 tools/testing/selftests/vm/hmm-tests.c        | 219 ++++++++++++++++++
 18 files changed, 792 insertions(+), 38 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
