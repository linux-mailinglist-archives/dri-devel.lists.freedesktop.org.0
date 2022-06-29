Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E555F45A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A54811BF54;
	Wed, 29 Jun 2022 03:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B410E11A7FC;
 Wed, 29 Jun 2022 03:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLh5WhLitYfmfOjVpgvj/vvNgB7PxtvURZ6seWv27878lvFkiOUC636U+a7nUNn4WeSy083uQ9aPQ1iCh3JXvXrb4vR5k7KMVIcdkchYHgG/qcOhotL9d7i9OOeo83mIwA5CdnZgtPCdhXMc7qFYF4YSMw99ozxn2vBryUjmVxGhGLlSR6MN6o2fm/7j9N/wJb9XecPpgpuIdSpWoQYzvJWoQAEYPc38yzB7Pl/cKUtDMx15QIeAgxV/XualuyZ+8LemvsMTqI4KoPHld1k15N0Q7EsMYB7W11I+HSspggrch+pkDM63W/BlwZco+U8bduwX3F4MUEi313LYxRA2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwpftOLiyslg0Llkg6CcPm+ghOsEXC8X/iHVHa82E4c=;
 b=gMa92afaTc9/fy6hcnVkvRcm2/48tas6gPwNeHQ31fJHKn0z+JpxJNAVnifn/DCH6Len7FthzaXKdy9v+QubllIt6pTTLM+Naw8WIf2Fy84O1jpCn3P7SyArWhmF/PZVDgVFsxb1SyyI915WnHCcBbDAQoLaQAoqCshjfCu/G58db5xpdJP/E833B+b41geRt/mc6OKclrAimU5qdNSoYM+O89kt2FU8DMlhFB9X1kie+X5g4EmnwGm4VvBFxlTqCMJ1yy+3Nd5Sz3ZgBNEPoy0z6Cfj7OEM1MiPcyAlLaGzGaaqqUQjYnEDmMtVAdtDg9z1ovspuHD2EgYr9P4mlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwpftOLiyslg0Llkg6CcPm+ghOsEXC8X/iHVHa82E4c=;
 b=kcMewXCPWzQONCmYBCQHaeOIxx6RC1cRpcAgpzo6DZrN072YFVK1W+hNxMqZARteTGOPc1rtGAZcHRdY66m3Jt2X+Nc7vaJW4XLxvNj23zE5jnhpSE/SyJDXFExWxF9nPbsKEkWVero8DQxkBfDL9sldWqWVzas95keS222ly4A=
Received: from DM6PR07CA0122.namprd07.prod.outlook.com (2603:10b6:5:330::18)
 by DM5PR12MB2390.namprd12.prod.outlook.com (2603:10b6:4:b5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 03:55:05 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::a8) by DM6PR07CA0122.outlook.office365.com
 (2603:10b6:5:330::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:04 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:03 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 00/14] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Tue, 28 Jun 2022 22:54:12 -0500
Message-ID: <20220629035426.20013-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e3c5ff-93af-4b84-1165-08da598326ad
X-MS-TrafficTypeDiagnostic: DM5PR12MB2390:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2bEfWUKudCsTVAC4pIaa7qtemRz475fsFFc/nFGS0SVDGJHNb39tgk7xb02mvDTHZNh0Lt3CxgGx2cKltgBgUJrKJt/lyoG58mUpItSp6HfVsAuCEmuhhKyxI0b/c9MQjzzXYq6sZsFY/+fdeZWbv+6opT7OzBzYrfNuGnRBBNi34zSW6kQaK/drViZT0RIebqyaiGi9+QGzn07W3ABX803qRkQE7Bj0L1fvSUZ6ZU1F7Dvseb0mZUo8CEeIaOI6CSkoTBEQpoj5lED6M/T+cUAzD6YWVnQSnTAfnY4qW6yI4xOTYneExxv7JyYvfN7JfCLTueF49bBq/rpLVBNFTlYeuS7fmVv3tf59L6avdcxwtR6zknlun/C38mfFG0hkC+0g1fWPe/lIhfJZ2rjqLPiKp0d4Q+qe4K5uhjH5yaLwvrpB3S+cnPDbfLUouKHKLA+Y2ju3rithCnNkydV0FwVjRXxYb4nH4vkKWxrWCx9W18+aAC4xeZngb9bewmAKIzP3r8h+RQavgfrjr8orWHuLi2tOBr5eU9q7yR58qBRrk7yHed/O5VMdkRvRn2CTITciYECQdmdY6gTiW+bFm9XqAmtrqqxME2cfRstb+Iyqlb9+ZZVWSzl+60wSRqVtLBEGf1zkOgFxm4GSP4/HnfGeyoUmq9NMRw4zORDiAmI37sR2CXPIEujHuYMr20GwBK3eGfuc+dt+HYgBGqED/vTL653HC/beuB72fLEtJQUfebbIJ72FSPK482ZXoWM3E0mLv8c6DTSRUYx+S30OVyqFChC92rkNngkmcGYAWiYfR2g7Kqfz22wiAH7icWcfWSxAVC6o9shioWfhcssng==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(46966006)(40470700004)(186003)(44832011)(7416002)(16526019)(40480700001)(36860700001)(81166007)(7696005)(6916009)(54906003)(316002)(82740400003)(36756003)(4326008)(1076003)(356005)(2616005)(5660300002)(8936002)(40460700003)(47076005)(83380400001)(426003)(336012)(8676002)(70206006)(70586007)(86362001)(41300700001)(478600001)(26005)(82310400005)(6666004)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:04.9873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e3c5ff-93af-4b84-1165-08da598326ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2390
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
for current 5.19.0-rc4

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

Alex Sierra (12):
  mm: rename is_pinnable_pages to is_pinnable_longterm_pages
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
 include/linux/memremap.h                 |  44 +++
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |  24 --
 lib/test_hmm.c                           | 337 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  19 +-
 mm/gup.c                                 |  49 +++-
 mm/gup_test.c                            |   4 +-
 mm/huge_memory.c                         |   2 +-
 mm/hugetlb.c                             |   2 +-
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
 tools/testing/selftests/vm/hmm-tests.c   | 311 +++++++++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 27 files changed, 827 insertions(+), 210 deletions(-)

-- 
2.32.0

