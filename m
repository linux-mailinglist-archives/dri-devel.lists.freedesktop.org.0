Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA851CB0A
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36AF10F8DC;
	Thu,  5 May 2022 21:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFC410F8DC;
 Thu,  5 May 2022 21:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqKG854F6ghDhB1FY+S4QZ+p9uq6vL74xBZOBrqJ/SKkt5BWYVuDTPVc8M7oo94pVDMncaASIWSeOhtCsLtV49UBDAZTL7plDNqujytqWtnYu19tIrschGn89mri2//laqzKpQ4/6OnaZm8CJmXejJPoKtpoTB3bFAgz3UlIZN+NyBQ2PSrGOyX4QH8FYgzpdABTh0LR3qznbyeBW9DI7IjxxQAsNY89CoazbOycVwLREIPZDN0UTpwqXuEX4vaTybZtjVvVBPJnm6Zh7ErHfZC3hOBid/uGTxSqEDrnK81r/bDucR1gblkkFF9+X366qCPlhiIh3RLQ1eSqfY1hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gApRz2oxzbitGCXGYRc+g1FAkZ6BgWFZMTEy2pQdK1M=;
 b=d9ZaIxpbTIgq/wRQl0F301ZnxaFNJFVjTLJAHDnlmLRb4nNr0yrJax7WnEbKReJW33RwTSTTlbo3aIzQpxaHRFePXyoL5HQbbRcqesSgVVEeNGDxLy4GDaF2qpWuFi+01i5htTHIEg0mAT0zWq1m0eKUwNu7DHXTon2P1dxYPWbFKuCgj0+PmRjP80pYR+7SYGc29nyl/vqSJL8R75KPWxfm8CNe2X38TtXehdGIWsz+NB0Iza1gY5F7R3fNRVeO44wMTjpebRQp7S17thrfIkCPHi2yFewL69Qp9B0yv7OyzDvT0pI+ahh/Eg8+tX44IIIJPHXvrVhyNTpjLOeAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gApRz2oxzbitGCXGYRc+g1FAkZ6BgWFZMTEy2pQdK1M=;
 b=OKHOr7zjChTeMRwZtTyvgILWy3rWatROR8AQkI2IS8MI8KjuRakrNHSDFS1JtGp5OMv3lofoZmJIKz1leCb29kU3Wsaam9MSKj0BSoH7Z+Vr/lJeLqPgD3jknkMliYbTgEoD3Wmf/Y1AwmtC3+dm/76ADq9+WP2l745kh2Qm4RU=
Received: from MW4P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::25)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 5 May
 2022 21:34:55 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::b9) by MW4P220CA0020.outlook.office365.com
 (2603:10b6:303:115::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Thu, 5 May 2022 21:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:34:54 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:53 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 00/15] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Thu, 5 May 2022 16:34:23 -0500
Message-ID: <20220505213438.25064-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce3958fc-194c-419b-4e7f-08da2edf187e
X-MS-TrafficTypeDiagnostic: CY5PR12MB6083:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6083F2EB90B7A02D75D8E3F8FDC29@CY5PR12MB6083.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfkBQRsHi9o18bzVrDOKxi9/ACxodAaAatyDB+LWc/gMAQXNPJoSLNJyEHGOw8lQIDPfQCG2OtoQxdIQBvXR/yXnLUR5lTyH2M0oPzKiKbf5ThYpn0sFZdb83chZ8mZwERzPMTEP4xagDNhfGoCsZW6Yf+NLyUH0QP1Dw+6hJ0sz+uEElwbifwscGnL0LVEdjBQF7IT351cCrFSdnT07MPGj/xSsQBV7PszYNBc8U6ESzysdxyHdKFdh420xxH3NtvX29LVcZS938zaY3BIgxSJX4IIpxW1/WMUehdalbld3tXB1a4oJScwDFLWmadTtJbUeO76X6uLFVN5HS+oc3x9vQkWyOWHlG+V1VZGlXtEkGQvD9gy9MiT1S0Q2FkoYfczj+Un4wXHC95V93RkDeXnNpdcYD3QJUxtmhUG6h8/kgOuCcqfKybqk8Dp6aCSzBX+ni+q3iJjWmFPbJivON+HiTsv6LpCe+wTy7YhzjyksglUxd1j2AkhufX0VJnM2e05Fx45cy9fQuKwiNJSBmuSFrI4LfU9lnU3CYBsF0Igu341g/qu12cyO+hwVZ3X0ve61dA5OZeJ3kpwEizN21uR7cQ2+F9wxdGtqNYwDZFF2t1bUNNTiaSkntKsmpjPB+s1YPhaj+xikjfVazvep7QLPSVqViUgVBrX88Y0m+fsg91X6oAmZjfI9+FIpdcpxHO4Fg7CqWUzp2lPqAZbNgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(1076003)(40460700003)(26005)(47076005)(7416002)(4326008)(44832011)(83380400001)(6916009)(426003)(316002)(336012)(6666004)(54906003)(36756003)(2906002)(7696005)(86362001)(2616005)(356005)(8936002)(16526019)(186003)(82310400005)(36860700001)(70586007)(70206006)(8676002)(81166007)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:34:54.7987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3958fc-194c-419b-4e7f-08da2edf187e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
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
for current 5.18-rc5.

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

Alex Sierra (13):
  mm: add zone device coherent type memory support
  mm: add device coherent vma selection for memory migration
  mm: add device coherent checker to remove migration pte
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: coherent type as sys mem on migration to ram
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device coherent type in test_hmm
  tools: update hmm-test to support device coherent type
  tools: update test_hmm script to support SP config
  mm: handling Non-LRU pages returned by vm_normal_pages
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
 mm/migrate.c                             |   7 +-
 mm/migrate_device.c                      | 115 ++++++--
 mm/mlock.c                               |   2 +-
 mm/mprotect.c                            |   2 +-
 mm/rmap.c                                |   3 +-
 tools/testing/selftests/vm/hmm-tests.c   | 307 ++++++++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 25 files changed, 814 insertions(+), 182 deletions(-)

-- 
2.32.0

