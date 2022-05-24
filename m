Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B591533150
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6088110E5F9;
	Tue, 24 May 2022 19:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026910E5A2;
 Tue, 24 May 2022 19:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwvunpSdVUYsfdJ9HQmuKkp08neG2XufEUy5qLjugu7g807J0q9qPy4uUHc3CMfX6ADmK0D+BphR5+2ghuO+2BOI7dPcdAe3FuaWZ+rL9/M6p9mRphyP0agczCPiS781X8YZTnh/Pak7M8eMgiKIzoVb/JxuChnOFd4//t0O4M8a95U/5ZFSDE7UfomgXmlJqLczJvmDHw10sMgb7ZU58wmgzTGOssat5NmM4A9AwuBVmM0ebMh8kwAbNN5Dz4nDVhkKL4guJ9wM7+FGV9ilQKOKpwHriaaQ4dcapw0qvtvuxKy75jj2/B089/3Jh0j+yTHOOWAoMILukmbjTpAhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqx403lcDCZ7rTo+cR2k6lk04wk+W+uduTiqrZ9srsk=;
 b=eT+qwaFK53elV1sfcXDSLKsVDy/Ncrn0SlbhZ8mtSesAXiWRnDW8iv/dveUxl1eMzqhfSvlAVLR2gtYoivclCzUcJkxk55uOGnTlTAmddopnwImZLy+mI4jyNCrJpv7EADgHiWc7u7J7cBDfDz894aylsnSiDGSL4N18utGbJNwOIGQmyazYZv6xK0JAbp35yVCjzvjqFJ2XD5mOCIC/Il5xEkFEzyB0U9REANJPIol/0O/ccryHczH28k0VbTXNNwCP4V5sI7/EikwqXD5HXLZvZYZLP0XenjN9dNlPIiqWOsDs07nXgNY1PCq8FcuxALoU5sp+o5pmkB4zHsMp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqx403lcDCZ7rTo+cR2k6lk04wk+W+uduTiqrZ9srsk=;
 b=4YvjjVXOM53FZPBrY2wZW2t/WO8MuvXh7T/0E3xMlcmHKCwgihV9Tz5iItEdhiWxpf9LWqWsK0OIyQGRlS65R2kFja2OL+aTSzipou2XYzEQY6RJZ9yC+9x0LwfIl14rOukNjW/dftlzvYiesm+fQJUsutHSHkLZkvBs9Fejl9Q=
Received: from DM5PR17CA0063.namprd17.prod.outlook.com (2603:10b6:3:13f::25)
 by MW2PR12MB2553.namprd12.prod.outlook.com (2603:10b6:907:9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 19:07:21 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::28) by DM5PR17CA0063.outlook.office365.com
 (2603:10b6:3:13f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 19:07:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 19:07:21 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:16 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 00/13] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Tue, 24 May 2022 14:06:19 -0500
Message-ID: <20220524190632.3304-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f194055f-5dd9-4785-1124-08da3db8a14a
X-MS-TrafficTypeDiagnostic: MW2PR12MB2553:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB25538D1F2BDE467368A15655FDD79@MW2PR12MB2553.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwJqwyaGckPH+wPm+If3CI8gSttFEDNctO0b48drX8uSlOfbT5Lk98N7+h2y/0JObcIFDY6oVmOXpnHM0thkt0tLb4oqSIYPxpf0B9oKw+OyzglJaRoq8nNKFzRnP9QXXsEBLbxSESRCORs5FG8nHMoKTsH19xvrVDqhCuDOCr6xDmSgMVFLC92MSfkX2s7Rx/PDQpHkXnbsyNzZjJC4tgFBHPJ4cqCUB/nyRLS28hJqBF26a4ZcUl3naREE62uAVAB/6QntHFLmZI5nV3fItiMq/vJeHaxiNbC4UDCNm5MIUx9jwaHFjff0COei20wd4ccKbJO2uwzsHQoFQuBxTVXu+IY3gSG1NOrU8VA0Ogzrwp9zTpnlxbqopUkxL0SUn6KVX/cikICgsiTVfqyhZq5omw9fiETZq21dgqw+pw5dyOdUzLyqJmesvb3+67bcM3MCw87Mco5qykqqwmw6kvO5tT4l2Mbh8KoLE8D+ELbLDfV7OioZwfURjQtBIU49wApnd0Zeej8ojH52bX+WttneC53sD6P+vBSKIxzWa/KO1GP5KmitmxYhQB1B0o6vuB61N4KNy6JED+tiz8/XvOHgprLhni8c0/vDC3xK0vXHSPDKk1/ggXwRrXbtoNj7pIKJFvFv3/3zACV1YXEFPrgktNdtwQcQdS0oRUVeKN4VNWCloHTpvyAsN0/SOLocDF67WpZLd1Pci6mK+6MHHQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(1076003)(40460700003)(47076005)(426003)(16526019)(336012)(186003)(83380400001)(81166007)(82310400005)(356005)(7696005)(36860700001)(6916009)(508600001)(316002)(70206006)(70586007)(2906002)(54906003)(2616005)(44832011)(8676002)(8936002)(26005)(5660300002)(7416002)(36756003)(86362001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:21.4515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f194055f-5dd9-4785-1124-08da3db8a14a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2553
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

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  33 ++-
 fs/proc/task_mmu.c                       |   2 +-
 include/linux/memremap.h                 |  19 ++
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |   3 +-
 lib/test_hmm.c                           | 349 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  22 +-
 mm/gup.c                                 |  49 +++-
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
 25 files changed, 814 insertions(+), 182 deletions(-)

-- 
2.32.0

