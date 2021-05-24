Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DA38E775
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B25F6E58A;
	Mon, 24 May 2021 13:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5FC6E584;
 Mon, 24 May 2021 13:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0j3KvgVEzCfGh2z9ocjYI2SioA0KzetFQsmfDFdiJtk/JpSXi5aCWl8Za4u25zr/9MIMNqEoHLhyNafeXYMn9ukIPGXMTo6rjgteA+kUJ9jeFCz94KmmXduCqHTt9px15eni9DUYeJVrVEN+iO4vUndrhSAu6gqiyDax/PzLnlQ4zTnwLSzzrMSVFLNO2FUYcIU4wjNjm32m25zNJMYgBkoxaGfj4A/YBfwYBjBGHwROsF6E+aM94wT74D5Jqj4lvgKlh+fqhINtLAo/mzFH0wE0Tqt+KjoGVNwr5Z0QKgw528TbtoX92+ncdcZe0lb/QlKhRRvmf9Ls0wlZU5RyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ1s7DOEHyhrKdOT8bYRw08g4hT349yn714Op/2GAMY=;
 b=ZqDLYO8CIoTMqN4lYei7EQhjEZOqRgWnVWZXwnhT/7Uh3gsIenJT39IRwCbWZRs/w+VX3yvvGySnwTQfOdqmEykmXE+H0WR+oDKzGDsy4Xz6eB4qGNpY72mLxs1BtmVSzy5d0f5zTARK+pWzUqguJoAXHBC7Ppz2xIxjxBzWJE8Cra7uz8JTmJlHHQguT0ThFNbCmOkAbxZcVxOcgTRrTYl61zj4cMqnIyoEX+Fy8Z8/khV3ANsoqyIT/uB3KxonjWZavrjOuvwVnRCgJT5cQdItGFeYiRYGyYUGq7ZhxN1twbB9oe+JM0tJnnFPlKDR/e0S65FM4X+j0zIIenfLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ1s7DOEHyhrKdOT8bYRw08g4hT349yn714Op/2GAMY=;
 b=ZmhwJDjw4Fh8a8rBI6RdqWGze6KiHdGMkxooE/ZwTX40BnNiELRC6LzWELniNKphHUOz0//SEffu8oxRAyH2hmI9qu/Ti0rWrRD+Zet9lv1LZjDika3hiNIHXNYw3zMnITc7kEoLrJvEKJ9X+cpdHRPaG71uT5VwUVWaBXO9viqULhIx3xuI6w/oEDrg2k5WBzlzVLCbhpwqYxXER9NkGvnhrmZO4oUfd6vOJFq+33hHi3v9LAy7AqgJYb0cyh6xV0gvv/J3WNJqYUmIgawxdWQodvO7J48z0EUjokdSo6iGUxYzMtODe2ysU0WkfFQm9Kmb8cbD15LOBa1VtI+GPg==
Received: from CO2PR04CA0144.namprd04.prod.outlook.com (2603:10b6:104::22) by
 DM5PR12MB1321.namprd12.prod.outlook.com (2603:10b6:3:78::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Mon, 24 May 2021 13:28:37 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::e6) by CO2PR04CA0144.outlook.office365.com
 (2603:10b6:104::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend
 Transport; Mon, 24 May 2021 13:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 13:28:37 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 13:28:36 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v9 00/10] Add support for SVM atomics in Nouveau
Date: Mon, 24 May 2021 23:27:15 +1000
Message-ID: <20210524132725.12697-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f59759-02f4-43cb-5892-08d91eb7d648
X-MS-TrafficTypeDiagnostic: DM5PR12MB1321:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1321615BE66B7614EC600D09DF269@DM5PR12MB1321.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xalR/QSE2G/GtXAfb04V/p4LLiFiXA04WYmEiWwqKYN7wrm61aLgL489Rr3ZXjai3efMhWNgMh97KIOkmorisb7ATZs02lzbytvhz8MODrENVQYewrsJDfb04PlCJfQHZffLS2S3oY/ZYKr1DkXk6+Ic/etHX9L53SnHvMnWXwTFd26tX5yO8ptD+4dZfhk8J85ek0bsm/s0Lg2KRhlfPaZpkfJ6k41ezCKelBHvJN5LKMP74JWALySTcCvI0MNuYa5v7motd7vEXRtVVLgc+TZ3j6yuKBY38L7UEBw/pgTx7kF74to6RjmueCPx2LJcXYTHjaNnQBUHaEC2hzd6IbUUODFO3D6naUG6V/wiJCh63nCq7DR5NxI2VdywywqNf8dO5hMxo6bZS3r2ng2xcvot8Mizseshswk+TtIt7obdX3z96oIofE0IO6Pdv3DKoxegFJGqIP/pJaAV7Hk+SJhP2K6BE7NH1ZSgu+HgZJzlQCz8PnvJOolAkwqy75uWGYNX9h3vPkx0uaEXBSRL8N6XKXZ4hXcJl0fJ9PHOQrKoeoa4c/L8by7BCX7KGqxYhGTwxoON7Hz2GXjwN4oe9FAHsxIdDWf6GRYBsNlwEFxmukOU2x+APE1zuO1/OACOdH0Cv/VbCRGnC1SF6DLzX4OVrP8Hlj+dmvI0Ucwtdb+pDcfBhVVljK1OuWtcZuupLy05NzVREGIi8AzWTpTFQsc3FfH9qSeSzJVLAGmmYhZwd2e27RJm0jjh3FjkQ6hm/N7BnF9HLII44DPIdqD9og==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(2906002)(5660300002)(2616005)(36906005)(186003)(83380400001)(478600001)(70206006)(82310400003)(36756003)(7416002)(4326008)(86362001)(426003)(70586007)(966005)(336012)(26005)(16526019)(1076003)(110136005)(36860700001)(54906003)(47076005)(356005)(7636003)(6666004)(8676002)(8936002)(82740400003)(316002)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 13:28:37.1410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f59759-02f4-43cb-5892-08d91eb7d648
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1321
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 jhubbard@nvidia.com, peterx@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a repost of the previous series to rebase on v5.13-rc2 and to
address comments.

Outside of some code comment updates the primary change was to split the
renaming of migrate_pgmap_owner into a separate patch and to further
simplify the handling of device exclusive entries in copy_pte_range(). This
may result in temporary fork() failures if the process is using a device
whilst forking, but such usage is unlikely to be practical.

This resulted in a new clean-up patch for the series (patch 6) so that
device exclusive entries can be handled inside copy_nonpresent_pte(),
although more extensive clean-ups of copy_pte_range() are planned as
further development work in future.

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
 include/linux/swap.h                          |  11 +-
 include/linux/swapops.h                       | 123 ++--
 lib/test_hmm.c                                | 126 +++-
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  45 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 160 ++++-
 mm/migrate.c                                  |  51 +-
 mm/mlock.c                                    |  10 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 601 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 158 +++++
 26 files changed, 1317 insertions(+), 317 deletions(-)

-- 
2.20.1

