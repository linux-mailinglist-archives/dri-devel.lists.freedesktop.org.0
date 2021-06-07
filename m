Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36D39D66D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1876E584;
	Mon,  7 Jun 2021 07:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BC76E584;
 Mon,  7 Jun 2021 07:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPl05t3awl5m9SOSdVL/8hfluDafvD7jPH99cZ1t7A4g1YHmPWXkP0r9eZX7rLb6GAxVWOmjfiXMCCna/ofSfYL/LZPjPQllaaPqFGfzeuO+O73yPoIXQrSCFPlr5K1ap/2tAFOkkdrspvMwodoUHANvXTHLmfDkeduSyV/lMo6JiB6ih6nEAfDaUlQlcky0aZegLxQ0k/vcDNKqnnWMzC1L7WxhCQgcYGNMfOnvOae9Ak8M53KqQVrWn+vdhQQu/Zz4upknGGW01XNLrtUlqqitpnShzfmk3haR3L5lsuh7hhap5puJJNWt6HlxbjxA1qmljtgvqeCmOWJRJjMQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTdPujpSig7hrjH9JkvJrkg7F+aiz0ZUkI3BC14mMSU=;
 b=QUy/vCue7ddPNx8ST+LGLyOIonpBGasbiOT8Rz+tRMsl6hIcwVaUewHal9jTWzIj/p4IjwMP8Qvno3nPI19OAFkMwwHOnXw4eV7h6d6n0mVlhfizeO3bNHteTCK23drVY5Fq7bBLVPaAfS+AyiDxOWMfLT5nbM3CkQE6kk2K5+yKOhk0dwUA8yG6I40DPEkhtAkV21FPCboPyav1GNN9BzJgA98qno1ohH6jk8LagucQyaf5l/pWom2U72ssTk9fLaCOGjfm+Cm353YDuI7fYXF4jG2qgay2aqmbkFzL7l6bZyqooS6OrQcikhnpaSDYK5i2CKSRTHgS/Mb49ZfcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTdPujpSig7hrjH9JkvJrkg7F+aiz0ZUkI3BC14mMSU=;
 b=iCgwJ7WhSlTDOhTchv7vpfvdriC45zytiPv8+SWptRoM9Wi+kWcAQ3LKOlNzB+1MrgbLle0/X38vmc69IUY9gzerqTLcpE6Fu0D9KDqg9oSQTVMgYMVDJ4pwVTv8CfNoLwgzm2ZslSdEYgnoPVTh9xpmLo+by8Q6g/OPkEbM645XyYSbJVocWeJNLqeLDF3Pi+YLGEprF6Grx7TM5DvP7AKXzd1Xg+ncISzpi4l/Ph/bGqv3nhTm54UK2bLBcyg1jwNmzh75nHvJmflHOQFkZo+zmxlrbjoG+qyFsoj06YFQa78qx1huEWB1wF0syr438GOu8ZgZqkG1iNF9Zek6rg==
Received: from DM5PR1101CA0002.namprd11.prod.outlook.com (2603:10b6:4:4c::12)
 by DM5PR12MB1660.namprd12.prod.outlook.com (2603:10b6:4:9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22; Mon, 7 Jun 2021 07:59:14 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4c:cafe::cd) by DM5PR1101CA0002.outlook.office365.com
 (2603:10b6:4:4c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 07:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 07:59:14 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 07:59:13 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v10 00/10] Add support for SVM atomics in Nouveau
Date: Mon, 7 Jun 2021 17:58:45 +1000
Message-ID: <20210607075855.5084-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8acf322c-44b8-4385-b1b0-08d9298a249b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1660:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1660EC633D9ABE3EFA5CA7D4DF389@DM5PR12MB1660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXMrdIjNSiInk/zmpGN3j5xA0GbRVnXwbZk1lf8JxCAIYAOFiLWHByxsHezCfDVqGU7b/c+B1BofLIdJEolAlFWQRUAHzs5fjNS0vmG9vySImwzG28bO0SOqL/4up3J/XJFIDvk7LduFJNgNBvDs9wrZCMAAf7Xe1MM2ffI88C+Ru0CdAQQctLprfGnKBs9qmmvzaSozcLbgj4qSvIqDX2UdjleaOmhQ+VZQggE8ol5m3ISvsXPkU2l71K6ZwUeeA2f1FZMIXoOuRBV0Kai5NlRWY2Vc0wbS+mtjzm77yjjCXydxrYnmXu62JTSig4NMtL3b1/302bk7ICzYdENyq+yqPuJEPAgD5Kgnwwn6IRLj4LLY4PoDQGLK0U0dP9YGUiXKYW7j6NaAVTltZJCDzyMc5/bvoSR5p1pucolYLmQaVeia+t3TFS5ZmJspahYR/BSjYLYopbV+XOy8L/lR3Pl/bvt3/hQE2oUUvO4uDx1EBUqXyqq1f15+aypzRO5K1B7obW2cUCsG8W1Fy+dlXpIDUTBcNZJZl8wrUrNzSdRSx4YgDtcqk/LfeIH+eI5e15sPa6ifeLjGEL0qK3KUwhOADzPnFAfOH4wkhxo8cnMV4WbFh0ZZ1/6zCgTFnju1MXFSKT7gssQLlYTmumm+IqF6QttkWHfo30UbybzE3wtLm4mdOnYBsR6658ODUe+rVMUMBAaotMR8cCgJyDTO6UcesIHjd3lRwCva5m+Rn16MYNAAh46xi5q6ShqfeIxEOaCST53TrrF5Q9uN41cpsIXchd5vjwe7UiJecWNohccwYoib+jt7On3YKibaUpcs
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(110136005)(6666004)(5660300002)(54906003)(426003)(186003)(16526019)(83380400001)(356005)(4326008)(7416002)(82740400003)(47076005)(336012)(1076003)(478600001)(107886003)(8676002)(70586007)(966005)(2616005)(2906002)(36756003)(36860700001)(316002)(7636003)(26005)(36906005)(86362001)(8936002)(70206006)(82310400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 07:59:14.4925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acf322c-44b8-4385-b1b0-08d9298a249b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1660
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, peterx@redhat.com,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

This is an update to address some comments on the previous version of
this series. Most are code comment updates, although there were a couple
of code changes as well. The most significant are:

 - Re-introduce the check of VM_LOCKED under the PTL in
   page_mlock_one(). This was present in an earlier version of the series
   but removed because we thought it was redundant. However Shakeel
   provided some background making it clear it is needed.

 - Reworked the return codes in copy_pte_range() based on suggestions
   from Peter Xu to hopefully make the code clearer and less error-prone.

 - Integrated a fix to the Nouveau code reported by Colin King.

As discussed to minimise impact I have also made this dependent on
CONFIG_DEVICE_PRIVATE. Hopefully these changes don't break any other series that
may have been based on the previous version. I see there has been some
discussion from Hugh and others around patch order, so if you need me to rebase
these to a different branch let me know.

Introduction
============

Some devices have features such as atomic PTE bits that can be used to
implement atomic access to system memory. To support atomic operations to a
shared virtual memory page such a device needs access to that page which is
exclusive of the CPU. This series introduces a mechanism to temporarily
unmap pages granting exclusive access to a device.

These changes are required to support OpenCL atomic operations in Nouveau
to shared virtual memory (SVM) regions allocated with the
CL_MEM_SVM_ATOMICS clSVMAlloc flag. A more complete description of the
OpenCL SVM feature is available at
https://www.khronos.org/registry/OpenCL/specs/3.0-unified/html/
OpenCL_API.html#_shared_virtual_memory .

Implementation
==============

Exclusive device access is implemented by adding a new swap entry type
(SWAP_DEVICE_EXCLUSIVE) which is similar to a migration entry. The main
difference is that on fault the original entry is immediately restored by
the fault handler instead of waiting.

Restoring the entry triggers calls to MMU notifers which allows a device
driver to revoke the atomic access permission from the GPU prior to the CPU
finalising the entry.

Patches
=======

Patches 1 & 2 refactor existing migration and device private entry
functions.

Patches 3 & 4 rework try_to_unmap_one() by splitting out unrelated
functionality into separate functions - try_to_migrate_one() and
try_to_munlock_one().

Patch 5 renames some existing code but does not introduce functionality.

Patch 6 is a small clean-up to swap entry handling in copy_pte_range().

Patch 7 contains the bulk of the implementation for device exclusive
memory.

Patch 8 contains some additions to the HMM selftests to ensure everything
works as expected.

Patch 9 is a cleanup for the Nouveau SVM implementation.

Patch 10 contains the implementation of atomic access for the Nouveau
driver.

Testing
=======

This has been tested with upstream Mesa 21.1.0 and a simple OpenCL program
which checks that GPU atomic accesses to system memory are atomic. Without
this series the test fails as there is no way of write-protecting the page
mapping which results in the device clobbering CPU writes. For reference
the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/

Further testing has been performed by adding support for testing exclusive
access to the hmm-tests kselftests.


Alistair Popple (10):
  mm: Remove special swap entry functions
  mm/swapops: Rework swap entry manipulation code
  mm/rmap: Split try_to_munlock from try_to_unmap
  mm/rmap: Split migration into its own function
  mm: Rename migrate_pgmap_owner
  mm/memory.c: Allow different return codes for copy_nonpresent_pte()
  mm: Device exclusive memory access
  mm: Selftests for exclusive device memory
  nouveau/svm: Refactor nouveau_range_fault
  nouveau/svm: Implement atomic SVM access

 Documentation/vm/hmm.rst                      |  19 +-
 Documentation/vm/unevictable-lru.rst          |  33 +-
 arch/s390/mm/pgtable.c                        |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 156 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 fs/proc/task_mmu.c                            |  23 +-
 include/linux/mmu_notifier.h                  |  26 +-
 include/linux/rmap.h                          |  11 +-
 include/linux/swap.h                          |  13 +-
 include/linux/swapops.h                       | 123 ++--
 lib/test_hmm.c                                | 126 +++-
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  45 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 173 ++++-
 mm/migrate.c                                  |  51 +-
 mm/mlock.c                                    |  12 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 602 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 158 +++++
 26 files changed, 1328 insertions(+), 324 deletions(-)

-- 
2.20.1

