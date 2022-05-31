Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B1539476
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CABD10F45B;
	Tue, 31 May 2022 15:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBF810F481;
 Tue, 31 May 2022 15:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6jZVGecvQ9B5bj8MvxHPRAYXzRUmNAt8MXXVmTnFIKFcXbllNeQRGXYDgMt62ujJxXqleAbGGSkwxEfGpwyplWfWqC9N9kCNKKTb1Igw6Em98pMoUHTDV3MQDBrmXHDEcUBrVzA6cEVzZdgNe46o006ce6tib7FRDcLjDKgv86PIWFSp8HqrZSLbD1BY0Tcx0y1Cba+t5kTUNMhKrbmNwlW67/KA1McswG6c408fe5iyTkltwix0gP0aXfhT8iJXI/SrKv6xTw6ZdDU++mVbfgAdF1Wv2gL2Yn0zFYwgs7Wnp8/gjGG/CdHVdIuCOH3S6KUIWKNTX3mMKiKsjQwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnc8usG2hiLxhUCDunRzmLgxAs3b89EEbdNkFuFoVko=;
 b=FoyL5Fp8z/uJZDLKsCwkNt8WKqERtRdh9Vri1Tca1c1fIh8jzAyfubZhT+OLp9wjd7YkOJpPNyAuxvcBf16RhPfxaE1TSTbv1uyQnqqi5StNQyG0XE5FvlXhXXk5NwwzLo310wRtrbJtkAFzGfaE87NaRk+Zz+dcrujDkzg0xxAr7LZe7QCGmR11obpCwCgVSH4Nnffedkz24oK9oQUU8h593okok+N+t/pvpZbXZwiTel9/HpoHbY9v0NFO+AEV0BHL9uHX5G3GFDlk6k++nIkcT/ayel5NlkbSiT6WSKE2dVwQx/eUFVgH93qIenC8CwX6u1NlfDSjgQSkn2WW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnc8usG2hiLxhUCDunRzmLgxAs3b89EEbdNkFuFoVko=;
 b=vvYWeZrSomSK7AyYE1OfXCwkEEkGsgJSY5ZbzeWLSO6MD1EiRNCxSDXkpRdgLksOk1rxV9jvSfPFReQD0GY7ZijBW76IlqjEp2baSdSlf6ycIhfE3kzTlqBl/ZOgCmLmf0yrmlW4ERoGtN6jKpw6wcA9UgsATx8JgPaQujDQSys=
Received: from BN6PR13CA0065.namprd13.prod.outlook.com (2603:10b6:404:11::27)
 by DM6PR12MB3036.namprd12.prod.outlook.com (2603:10b6:5:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 15:56:40 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::9e) by BN6PR13CA0065.outlook.office365.com
 (2603:10b6:404:11::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 15:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:40 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:38 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 00/13] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Tue, 31 May 2022 10:56:16 -0500
Message-ID: <20220531155629.20057-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a426932-990c-4ee0-fb72-08da431e2696
X-MS-TrafficTypeDiagnostic: DM6PR12MB3036:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB30368E1873E50C2BA32E8445FDDC9@DM6PR12MB3036.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EbsWl+huwEFanW8GE5VRN/SY22qdWgW4aPJieo3a0keDzKGD52ZhdaIGK4BJyJArC+CjDAMLLv/Feqo8ctdV2RiVSLVEREdNMXqIeGM+iZIe2tGkxtauiKyZxjFggK3AwCDSyXSB0QHswt7H17hgR2Hb1pa5Pwh5/umpVC5nkpThCoQSrQav7HN5gsHdizQddT4cWTyWqrBABl0CoPMAK2XAaktS2SUsfmB38ap3oGs6tcIRcrQ5cpaF627bfxtvANwkr5NtOrB0DYiAc5tPsOncvFC/88Ltm/g3wI5xg1+b+k1IDqG2lPTQ6CAPZqtzSQG0Imcess3qRnj5K+VdwxF+MqXYCMXun0+rFjBCyPgFQRMEJP8ghXomlbfUY6UwhGpI8ss6JI7jgc+Idd7t+qG6j5z65/sS+0vqPXHqfrKkOJIO0u1uBI8dyIEZv+C0n3sDL8gQL8cV5EUCw39Qq2r2VDxfdihTWKW4vE23+aBeeI0MKXDpK/sTZ50S4UdDTJcJ3qI8tZ13iMVqTH/PVokGXbtPxAwdmWIR/8e2olbZ4d+l9fLSmwKvxO5WzDqr+/MJ+rQyCPG9sORykPc+2T8zQuxgHGi3o/fNEybQU85W2ENQWvG12PqkCmS9ky46yg44Bbo7i64Wu4ie400blMO4P3J+LP01DD+q0khPhSuB6cFpz+/VxPv+mQYbm/JZaw/8mpOeLvKZEpEtkGWTQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(16526019)(86362001)(316002)(508600001)(186003)(81166007)(2906002)(36860700001)(1076003)(336012)(26005)(54906003)(6916009)(47076005)(426003)(7416002)(356005)(5660300002)(7696005)(40460700003)(83380400001)(8676002)(44832011)(36756003)(82310400005)(4326008)(70586007)(70206006)(2616005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:40.1074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a426932-990c-4ee0-fb72-08da431e2696
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3036
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
 lib/test_hmm.c                           | 349 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  22 +-
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
 tools/testing/selftests/vm/hmm-tests.c   | 308 ++++++++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 25 files changed, 817 insertions(+), 184 deletions(-)

-- 
2.32.0

