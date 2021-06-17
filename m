Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBC3AA89D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 03:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3918941D;
	Thu, 17 Jun 2021 01:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121428941D;
 Thu, 17 Jun 2021 01:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPIB11Y6tYQleLsvAPLANmh19f6D0tXRpjdHHueM10f2L32v4pdcb8Zx29YrlktcJX1qxqJyVF9tpmav6L3CUGTm7dx7+LyKmT9bNlKO9qhjjYZy3kMnLB97aT2Wsu+H7g3n+lV8y+Tt7/r7prmYVRZQD+QRw3Eewo08JeYcsX/2l9pmS8EO6n3fpojTSI493HsRP+jWIBpeBG7A55/NrIZZGsxYdbGqKgG+opz2frtAmOlZ0DwkFAQzWVbqMtg2XBpuAuj4x3XEaCNQAEoDWx/N8AtqJqv81uIgrzuH2tZZel9pH472IMP5SoAqWv30+NXsMHZiWlsDW4ZxIAoH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKIS8LNcLUCHh4FV4YHBW+UHUWkq+o49at7Os5gmXao=;
 b=lbV8zrRBJzIVFa3MVzGIw6X395u1UEwIy3JEfY9B8ZW1AHpHLvEGxgENbpJdkYq8h5sZwMrOj1sxov2OmeOaHA8OqvyqM1xybSw9q1qhdpDmVXqwXwzKjh20GPv0wghdhmALew7k6J/VFkTeR3K4a2zBf4f6Py8RFLYgKigT1mkWrrMDh8pSZ9dVeSv60oH1/yqwALjUA9bZn43oimV5OLXis2BkYHCimDJ4YT2dvvO1QjWNLhDcC0guAKDxjnbYeWZY+D92/6JLI1gJ7UvAokCVuT++hTy8THe08K0cPyVYD5vPM6mUm5AJ3luHQkMBmefOHbBTmfLAvR+KYVuluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKIS8LNcLUCHh4FV4YHBW+UHUWkq+o49at7Os5gmXao=;
 b=roQKO0h8PpMyF5cHfOa69LRIU1/E7Aq0ffEu91yYhcpAYUt3Izs5JXCLHB9p7bteraQfhiy1KQXh1a7QeUOnl9PlrWZjXjGl2YwPri6Ud4Lp+0Yan9PLVx+x3pDoM7MDamf5CMmM3AjPM/+R4upZ64dPbwsHec3FLSmvbpy5/tlAX2AvvaV+r6hI4dx3HIVoErxpBZOMNJiBsQuuRxiqOItJtak3wZmM/5+eqamrt6Ks+wR5/JBplVFw9id7wGvc6mZfDIXNV1/ZdbaDu0/6FJD8giBcaCw8Sf10y6fq5culc5FLZFuJJMhkHjYeQbeH7kRTUKaBQzmCRzylPv3AEQ==
Received: from DM3PR12CA0068.namprd12.prod.outlook.com (2603:10b6:0:57::12) by
 DM6PR12MB3083.namprd12.prod.outlook.com (2603:10b6:5:11d::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Thu, 17 Jun 2021 01:29:07 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::d4) by DM3PR12CA0068.outlook.office365.com
 (2603:10b6:0:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Thu, 17 Jun 2021 01:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 01:29:06 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 01:29:02 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: Update: [PATCH v11 00/10] Add support for SVM atomics in Nouveau
Date: Thu, 17 Jun 2021 11:29:00 +1000
Message-ID: <2871211.TbFnF4rXpu@nvdebian>
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5f7a960-9748-405a-26ba-08d9312f4c67
X-MS-TrafficTypeDiagnostic: DM6PR12MB3083:
X-Microsoft-Antispam-PRVS: <DM6PR12MB308323F59249219DD5DAF9AADF0E9@DM6PR12MB3083.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/bxBpZEGC+4P4N8sTyn9SEqwwli7nbGUCBe8zmmFseA63CmUbZfCtRCII9M/yt43V1PcGB6YLLUYcn2T+Vmoq5/FI6HR8Lb0IUiNLgEQV1m7/2eP08CZXda32f5rY6MO+By9kLE8ThpVqpWbowZTONFVBB9sPWzhoOezOJf6gfjJq0rVfcccddKFx8hWebRpQbb3kCAdmwSc/yKRWm0ygot9S+V1WU/0xBQVc+RCZaQbYpag181BUoM6uL7D2FM16IrYlOdEQ0ZhrA8Cx9Qz7acjTytdyCcwpB7sXMNk6MBfYaIXQZXfsMAYPVHrg9pIG4+0lOIfLcF2RXodXTeVBI2luGAzOKmTPnSygakzlYg21JHhbdWXaEknfr0KqDpQ64FEm+4rgho9IEMQlVdQMgTGCPM9UWUG9nBqdCw32R5Z1ToQ6am4mOwNw1JrjXOKYc01goznMPIM2P3EUujoDtETMpIhDa31UdqGuFT1ytEQaIpaRRvrYHyPl1uToDVyAAJujPpMtMfdN5HCdCzgaDwIR1vbimxXLx84TxjTYRZ+838iGFh0o9/n7piUl/L7DmLPPliBLiIBMiIeFQGW+4Mk2PgTtEtcCvXzGttZlf30qQJ8oWO4vKPpHhdAQ+9rwXx1v5a4cwfW6il2dloSrzXl0LAwQBKpnMycjoeVvnHfwtI9xCgtn+neFAJ9Q6YnuE/zwEU7BK2KQ/PmBsQtEwRK/gLTJ/bwcTe4kaM5t71y0OTMjQ/1MaWaCVA2f7Jdl+9y3XbmfCosH30N4KGGxc8+Pctr/+tRXWxaFcoula/1LHJLmfWCxFIS74yqlS822kG24qEeGE2XWhUhhL8Ew==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(316002)(478600001)(70586007)(966005)(2906002)(36906005)(33716001)(336012)(70206006)(54906003)(9686003)(8676002)(36860700001)(8936002)(426003)(82740400003)(7416002)(82310400003)(356005)(9576002)(6916009)(7636003)(107886003)(47076005)(5660300002)(86362001)(26005)(16526019)(186003)(4326008)(83380400001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 01:29:06.3628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f7a960-9748-405a-26ba-08d9312f4c67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3083
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com,
 shakeelb@google.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 jhubbard@nvidia.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
On Wednesday, 16 June 2021 8:59:27 PM AEST Alistair Popple wrote:

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
 lib/test_hmm.c                                | 127 +++-
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  48 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 175 ++++-
 mm/migrate.c                                  |  51 +-
 mm/mlock.c                                    |  12 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 612 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 158 +++++
 26 files changed, 1341 insertions(+), 327 deletions(-)



