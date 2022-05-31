Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B4A539778
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50D810E29E;
	Tue, 31 May 2022 20:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8CA10E29E;
 Tue, 31 May 2022 20:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu25RKwMRF6p32HXKFj8UQWnRo9/PP0oLDn2CseqW2jmUgo2DMoNZa8HCQm8+DeE+xatqOnODqHpYmZ6ukj8wgVNqOpRL6ADg55+w4+fhirSLiI4QGMXbY3+IkOm2vmFMxn0Wvly9AiQeaBoo8TTi3kBqnYdpPHHVgoLELBfeeV6bnEYuznnnpvd2wQjRyQw5FZPXBAobxGLhImDXLXEoR5Zu8SND7Y5WmKl9mI9Cjb35Y9k4wwh5vGJQ1MHXzeIOmQAp3pdJ0EvbYI5LGcn+QzOlgKM9zEJqBCsZlHOKJU8ZbNmUx52eCauacLOOgxFdo5r7KCYTm3SzUlgiTPYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTRGmnwT9XSdUOnUGTxxiwJtke8Vo/U3d2583fZvfLs=;
 b=l4jBMpv5eDtLIb/S/r91zhdPQv4FVXpQvQ5GZLPxHFmXbPishGm5A6M1zT2o874lWTxCm28xLFFI4tl5CYC+lHcEmo+3N33vOTFpj8XwSflBleYLzrymF+LMmVd5DbwS9/14EWng8kJ6LhlGZwQBvTa4L2xiEB99fWeuFM75nhfwYDmS8qX9JQJq+BjCWJfvkhHWNcE8EwMPbGTEuZaSSARQWMrAtOgfin9F6xlanZ4btp+hGtMFCz4R9dTsg8VYYFhDz7VZP3R9FGvi/gXS9VJgEsh/kIT3OiFdpEZIRxQ/kq2OVv4E2isl9sKdjIUL/s2dkKpyyrFJpPM+sN+PIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTRGmnwT9XSdUOnUGTxxiwJtke8Vo/U3d2583fZvfLs=;
 b=N+uRnaRv8EDoif/1oU3HhejQaGyBkw7nOIADJ+r+6jazjynPl1g7ZJa91AZMTqnc0Ut4wtQRns63pXuvZY4VPaEClPbsIezvGzHevIBjmiImDSNw4sgRkKwYj1MkIL0P33/XH7dlDaOrArAMvEEStxFDgr+7j04g9R6nwKDCg9I=
Received: from BN9PR03CA0397.namprd03.prod.outlook.com (2603:10b6:408:111::12)
 by CO6PR12MB5409.namprd12.prod.outlook.com (2603:10b6:5:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 20:00:55 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::67) by BN9PR03CA0397.outlook.office365.com
 (2603:10b6:408:111::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:00:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:00:55 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:53 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 00/13] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Tue, 31 May 2022 15:00:28 -0500
Message-ID: <20220531200041.24904-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea91c78b-e66c-41e4-d05e-08da434045a8
X-MS-TrafficTypeDiagnostic: CO6PR12MB5409:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB540995A7006BC32B32908E56FDDC9@CO6PR12MB5409.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m12nDxpHtvrknk68qJRzEUFQcfyaczXmxAplThT8sWsPieuchHtjWL6cT3HTuooIJqYz2S2q6Kw0vsVH88QgC1Zj8Y32F0meV59UsG/ye/GQCQVTlIMFSeB3HcCCTfXKWGaPzKvHIqAnGhiFGDjoV3qlbxEKJmD68HOdbgaX8UX8UxFma6tSirgsKX9LFAvX8bZ8bkrYbFcet5RBZhMqzRGVeHeNMJuLmeFUNjIqwRku46vaNdO6gM1Ru4LRNutr284//7zqUw5Ibd8T9JA/gAhDRJYcNRW0gD7v/ZL1BRHHMqMzUlQtedWYmUg6IRIa/oWEDaRN91CRicYM6q4xrcoysN70CxRqeSQ+9yDIva+00Kb0rBXr9R20y7opi6TZy0GeaeNw2uM9PQbG93z/V/iG2RxChKV9866KmtbNa2dkopF4FDRLf8rEhT1hMHscL2rmyIh+kz9qRGRXxyXdZCne1dIGAbdSxiYR/XCpf50WSXoka80NbV+gih35IuYkACBeVGG2jl92zFCDLGhcWsWVPperPN/kkinN39GGLyl+Nxil1WA6lGXJ+3wd2IjjBkkld8PSqs9dUnQYZF2XrMyD2i5T60HvTqVh5DCW3gILbxc5mcuDWQMrDX5FMP6sKLM0Igj6YpKiHrMUiZaJjAyXUwqsQX1wb5111YzkbNkW8jul/SRMwbG/ZRNbylMum08UAxXtKaqwcMxMCq7NSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(7696005)(47076005)(7416002)(40460700003)(2906002)(44832011)(336012)(426003)(6666004)(8936002)(508600001)(2616005)(4326008)(8676002)(26005)(83380400001)(6916009)(36860700001)(82310400005)(81166007)(54906003)(356005)(70206006)(70586007)(16526019)(86362001)(36756003)(5660300002)(186003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:00:55.1224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea91c78b-e66c-41e4-d05e-08da434045a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5409
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
for current 5.18.0

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

Alex Sierra (11):
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
 fs/proc/task_mmu.c                       |   2 +-
 include/linux/memremap.h                 |  19 ++
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |   3 +-
 lib/test_hmm.c                           | 337 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  19 +-
 mm/gup.c                                 |  53 +++-
 mm/huge_memory.c                         |   2 +-
 mm/internal.h                            |   1 +
 mm/khugepaged.c                          |   9 +-
 mm/ksm.c                                 |   6 +-
 mm/madvise.c                             |   4 +-
 mm/memcontrol.c                          |   7 +-
 mm/memory-failure.c                      |   8 +-
 mm/memory.c                              |   9 +-
 mm/mempolicy.c                           |   2 +-
 mm/memremap.c                            |  10 +
 mm/migrate.c                             |   4 +-
 mm/migrate_device.c                      | 115 ++++++--
 mm/mlock.c                               |   2 +-
 mm/mprotect.c                            |   2 +-
 mm/rmap.c                                |   5 +-
 tools/testing/selftests/vm/hmm-tests.c   | 306 ++++++++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 25 files changed, 800 insertions(+), 184 deletions(-)

-- 
2.32.0

