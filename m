Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0356AB48
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067CC1133F3;
	Thu,  7 Jul 2022 19:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24901133CE;
 Thu,  7 Jul 2022 19:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+hyZ0MCUZmWQe8TVaK8ATqHfChQ1X25UyB/iK9wfNQ1tZP2FPr2kPcHopipwy9tKM1i+l8NOOMCGdcWOy0EVgpakEdbwaxBRcJND3j106Yxvt6NKrMVFlyE/iJvXlZyy6TObS1BVtZcAP54wzu+Cj9yIti4VpXtqr2SygQRs0AeujXZU1FCWAxsBv9QC9zDp412xBCucb8MNhynn93uy0SpuapWP0tIZLSTzwZ9LHB9wvW+xY6AsmnHiTjavTJY2b9zUotIoTjGu2bnD90yxwjohWY8WafIdeziD8l3ujbhJ0o/uE+4MyLbJHrE2UTCc5e+0w0bWGTFupJltGirPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghk7E9DiDFsrW2I5mzvdkliAMGs6tcHHCgwi4WtyC7Y=;
 b=UjBR4/bWtGsyKbdZ+jE50IGWuH3KF6KvXlkbbkQLWVYEAQs9MVmU7EimWuuCcFbegGcS0t81FScpT64x6lbi4fqIUhs9W22Eu0gVFyfNJr0j17fqjDhBCrneqfMe7L2lSQjRhd+iCDHu6NjkWlCxhmX2+ONnq1rWuZ02S0ElsYNDkFTS+9gOvcdqUkV0sM+5qLkXjziuHzAfXa8ser/OQZvUvjMZSkgpmFBHu3YJzLJsWQoGcR5odZKrKCuIUWGv6rF1TPXUDqiK2vWm1V5WLv7C12ppEZ5uDAVFTl7dq2um+kYe3RcAUhtCIcQRKKZ9dOBztv8SEHd9ah1OToVduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghk7E9DiDFsrW2I5mzvdkliAMGs6tcHHCgwi4WtyC7Y=;
 b=sCf9uY/2TJqVsyBeYF/rhByijbI8+xx3rb8Rua0yULDsqpOF68dPLA/u7vYo5GasZLDCJHdc1N9qrH1+2gZ9QE27QKQY6yo51pCfEG181hL+53CBQc4PoEKVxDzCFY0Dla5IEk+QOJjJxySxkn8KyDTAnZgLjV8u/Y0eOOH0gzA=
Received: from BN9P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::15)
 by DM5PR12MB1497.namprd12.prod.outlook.com (2603:10b6:4:d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 7 Jul 2022 19:04:06 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::3c) by BN9P222CA0010.outlook.office365.com
 (2603:10b6:408:10c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:04 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:02 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 00/15] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Thu, 7 Jul 2022 14:03:34 -0500
Message-ID: <20220707190349.9778-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8170b5a7-3738-4304-bcc1-08da604b75f4
X-MS-TrafficTypeDiagnostic: DM5PR12MB1497:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEMebna/hRfTW+q/TUjyXF69vTuI/joBVsPzAzvsiNJRnPOp42Z4JKb6LFfAG3aLpTksTvRW3Psc5pAfMMRdqzkdEguUq4ymEAAZBAwQhXmWOO4mvFH7RX4db/z5qX2zlmVKv17HFvkQJeL63TwkK1ADwNuj1iINTqbap7L84cTKajb0QZ0Db51EDBzmurcIn3a+CNVXXarBVVeiSzZHRR/7o9DDwjYqPXzMCLp1+pp9zBEOo3/9Hfc3z3qw5GoqtzGOiVpURiTsIlC3jnkUz2ghdXXP323510GIjL6WVxSILmloAs5782VwSP6cdJqDy7VG14OMzfK0KcQAeV0nG6fqmadQx8SX271RuledJtYJn/+Ox6R7gRJUuLnvfNk/eHziU9aI4QVRKsaZmWJF58ORp0S7b2O1e33GtDQd0/TcnvRyZRorEhPgCCHc0XRm0D/NvocNXbPJO5tcc4yvUdTjICVMUKLy5qzWF0YDcxbh++IbDBuhSmeXUex+5sCAJuSYAbvuX2nRgY7z32z+G0eF9SRfc+rrz/KPh8fknLCQwx0onvrp5gXbSTDh96oRIFB1RLsPs3o8E2QiRyvnS/YVvVPYKGh2qO3vq3NCgu21wkCXmpMBFRvzXjEWyARyINAk4PjQ3Rkk5dl59BD+M3k/HaNw0Pyf3jlKqkuVzebBucQUcUh8qkx/0eODQ0uabksYZHDIKmH8iwurj8S8lbgeUjk0p4s32VwEkEh9kPkEYrDB7wDAKBwW7BIMrLw158+Prq0T9UhSD1N+w2FR+IdwzvJ0gvoDGPCTKhqgBLj4EToSLrNGz6F21499P/jtutHauuByedZkBPbOR4xI4VXroZJz4rj1rctlYeJdiGVCdXvcVgNy0uCl4/0bz0hw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(40470700004)(426003)(82740400003)(356005)(82310400005)(47076005)(336012)(316002)(81166007)(6916009)(7416002)(54906003)(8936002)(5660300002)(70206006)(36860700001)(83380400001)(4326008)(40460700003)(86362001)(26005)(44832011)(70586007)(8676002)(16526019)(40480700001)(34020700004)(1076003)(478600001)(186003)(2906002)(6666004)(41300700001)(36756003)(7696005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:04.3508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8170b5a7-3738-4304-bcc1-08da604b75f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1497
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is our MEMORY_DEVICE_COHERENT patch series rebased and updated
for current 5.19.0-rc5

Changes since the last version:
- Fixed problems with migration during long-term pinning in
get_user_pages
- Open coded vm_normal_lru_pages as suggested in previous code review
- Update hmm_gup_test with more get_user_pages calls, include
hmm_cow_in_device in hmm-test.

This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
owned by a device that can be mapped into CPU page tables like
MEMORY_DEVICE_GENERIC and can also be migrated like
MEMORY_DEVICE_PRIVATE.

This patch series is mostly self-contained except for a few places where
it needs to update other subsystems to handle the new memory type.

System stability and performance are not affected according to our
ongoing testing, including xfstests.

How it works: The system BIOS advertises the GPU device memory
(aka VRAM) as SPM (special purpose memory) in the UEFI system address
map.

The amdgpu driver registers the memory with devmap as
MEMORY_DEVICE_COHERENT using devm_memremap_pages. The initial user for
this hardware page migration capability is the Frontier supercomputer
project. This functionality is not AMD-specific. We expect other GPU
vendors to find this functionality useful, and possibly other hardware
types in the future.

Our test nodes in the lab are similar to the Frontier configuration,
with .5 TB of system memory plus 256 GB of device memory split across
4 GPUs, all in a single coherent address space. Page migration is
expected to improve application efficiency significantly. We will
report empirical results as they become available.

Coherent device type pages at gup are now migrated back to system
memory if they are being pinned long-term (FOLL_LONGTERM). The reason
is, that long-term pinning would interfere with the device memory
manager owning the device-coherent pages (e.g. evictions in TTM).
These series incorporate Alistair Popple patches to do this
migration from pin_user_pages() calls. hmm_gup_test has been added to
hmm-test to test different get user pages calls.

This series includes handling of device-managed anonymous pages
returned by vm_normal_pages. Although they behave like normal pages
for purposes of mapping in CPU page tables and for COW, they do not
support LRU lists, NUMA migration or THP.

We also introduced a FOLL_LRU flag that adds the same behaviour to
follow_page and related APIs, to allow callers to specify that they
expect to put pages on an LRU list.

v2:
- Rebase to latest 5.18-rc7.
- Drop patch "mm: add device coherent checker to remove migration pte"
and modify try_to_migrate_one, to let DEVICE_COHERENT pages fall
through to normal page path. Based on Alistair Popple's comment.
- Fix comment formatting.
- Reword comment in vm_normal_page about pte_devmap().
- Merge "drm/amdkfd: coherent type as sys mem on migration to ram" to
"drm/amdkfd: add SPM support for SVM".

v3:
- Rebase to latest 5.18.0.
- Patch "mm: handling Non-LRU pages returned by vm_normal_pages"
reordered.
- Add WARN_ON_ONCE for thp device coherent case.

v4:
- Rebase to latest 5.18.0
- Fix consitency between pages with FOLL_LRU flag set and pte_devmap
at follow_page_pte.

v5:
- Remove unused zone_device_type from lib/test_hmm and
selftest/vm/hmm-test.c.

v6:
- Rebase to 5.19.0-rc4
- Rename is_pinnable_page to is_longterm_pinnable_page and add a
coherent device checker.
- Add a new gup test to hmm-test to cover fast pinnable case with
FOLL_LONGTERM.

v7:
- Reorder patch series.
- Remove FOLL_LRU and check on each caller for LRU pages handling
instead.

v8:
- Add "mm: move page zone helpers into new header-specific file"
patch. The intention is to centralize all page zone helpers and keep
them independent from mm.h and memremap.h.

Alex Sierra (13):
  mm: rename is_pinnable_pages to is_longterm_pinnable_pages
  mm: move page zone helpers into new header-specific file
  mm: add zone device coherent type memory support
  mm: handling Non-LRU pages returned by vm_normal_pages
  mm: add device coherent vma selection for memory migration
  drm/amdkfd: add SPM support for SVM
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device coherent type in test_hmm
  tools: update hmm-test to support device coherent type
  tools: update test_hmm script to support SP config
  tools: add hmm gup tests for device coherent type
  tools: add selftests to hmm for COW in device memory

Alistair Popple (2):
  mm: remove the vma check in migrate_vma_setup()
  mm/gup: migrate device coherent pages when pinning instead of failing

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  34 ++-
 drivers/infiniband/core/rw.c             |   1 -
 drivers/nvme/target/io-cmd-bdev.c        |   1 -
 fs/proc/task_mmu.c                       |   2 +-
 include/linux/memremap.h                 | 113 +-------
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |  91 +-----
 include/linux/page_zone.h                | 213 ++++++++++++++
 lib/test_hmm.c                           | 337 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  19 +-
 mm/gup.c                                 |  49 +++-
 mm/gup_test.c                            |   2 +-
 mm/huge_memory.c                         |   2 +-
 mm/hugetlb.c                             |   2 +-
 mm/internal.h                            |   1 +
 mm/khugepaged.c                          |   9 +-
 mm/ksm.c                                 |   6 +-
 mm/madvise.c                             |   4 +-
 mm/memcontrol.c                          |   8 +-
 mm/memory-failure.c                      |   8 +-
 mm/memory.c                              |  10 +-
 mm/mempolicy.c                           |   2 +-
 mm/memremap.c                            |  10 +
 mm/migrate.c                             |   4 +-
 mm/migrate_device.c                      | 115 ++++++--
 mm/mlock.c                               |   2 +-
 mm/mprotect.c                            |   2 +-
 mm/rmap.c                                |   5 +-
 tools/testing/selftests/vm/hmm-tests.c   | 311 +++++++++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 30 files changed, 1005 insertions(+), 383 deletions(-)
 create mode 100644 include/linux/page_zone.h

-- 
2.32.0

