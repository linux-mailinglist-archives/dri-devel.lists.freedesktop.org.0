Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C442AA5F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF2889F35;
	Tue, 12 Oct 2021 17:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7A89F24;
 Tue, 12 Oct 2021 17:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcQXf7/u7gsY7TwsHAWtK43QvhPGKhygTu5lPv1FfOqMZ+mkJb9O7U9kQrmFXTX57Vjr5ABamQHwIeiKtTOg7OJZUla9XwKVa6FTr4X6XhYQ8yKEZBTpFH4NlHdP3gqW8Vr/KgVnvjVhuWPJ6FhCu+0icRQEPvIpHMC+BJP/YUuXEEE46FBqAd6Zn8PvpqHTHe/rOcDCo+j9G7vpLYALmKFUv2ZWsomed9BNd4fib1eiT19uvnkp8HmCTcgYijXHsI58mjLrcERLzp67NAMmX5vN346lDHi+eissO7mE4MVD4cx0RbUTlfTpJmDEUWR0PGTTH78oTMd75Z4iMk1Mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ep7yohZ546+mBAuxYD4acb/u4qn1JKsye35hwYl5SM=;
 b=c62IyyXkHBnR+JjmzFIDPgIdD9yELwf/7z4vkmOFAA3YrQB8ugj6QSZDL6UF3UddzUsoaNA8i2Gd2KLAjkCIjj7QfCiyB/sZGHqRvC48ViAllcQnoDCfOGq0J0rBvf+lslG9kuxx3BRlCynGdrFoTDpfUUnG6Pc4bqIrxbs5rtU+v/3bhsBXSKF8BCrtLDB8gYD+6xp6W53zI1rWDPqhEw+v3Wp4LmKheEzOuuSwo5VjrDVHqs5TX2xuTgwEIdlFRpcgl/zwR73OrMAkKerkTlfRTFq3SSv1SHdGxrXi/BtLeyYNhTdG5Q2WkIOXM2EjlSo3bN7EEvoVIWeH/UtUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ep7yohZ546+mBAuxYD4acb/u4qn1JKsye35hwYl5SM=;
 b=oULE/GbI2Fmfo1A1SX5wktXadPWqhgCgDgqaf7Qs5a9BRFfm/ZsTxEP+LwaO2xlDzWxc3Qq+cWJGinUYL119V+KlPMbTtMimnzd+9AnG6vohY+ljdjJsAflX9VlQ6XVnW8iw5ECrnl6rGTakJzka28q+o5QvG1+pf/WEkIAfW7w=
Received: from MW4PR04CA0272.namprd04.prod.outlook.com (2603:10b6:303:89::7)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 17:12:59 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::57) by MW4PR04CA0272.outlook.office365.com
 (2603:10b6:303:89::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 17:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:12:58 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:12:57 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 00/12] MEMORY_DEVICE_COHERENT for CPU-accessible coherent
 device memory 
Date: Tue, 12 Oct 2021 12:12:35 -0500
Message-ID: <20211012171247.2861-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2efaf7c7-0dbd-4476-af09-08d98da38a53
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3998AF0013DD03F728D8754CFDB69@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qhRrkUjmw6i4U6uxtpXLmsRwKCb7YgSV7fs1zuT90IgrSA8AI6qbjZVHKsjdi0/kev3irhdyq9mqdXstiyBNO+dZmEFcJKm0WA549uzS/Ns1UF1h7SsF6Y1fDWcClnGDNmQBxY/9nvI6SfhEMtD1FRlrnai50gbDua3fQWZe5aAGiY+BtfVbbMRvynaORIzJ9LA8Xy1G/rhFSoJne4+MpN9FByPcqZrmNejPxhLKoaEv7eAY8CofYtQAdpe3hVLMJZ5CeCrVd+DabDzfzAZzRXS1gnN6pi9olST21R740nds6/Ze497N1c/48cFVNLssEWsHLsvT3rYVPxElkRpudwy71XGeeopPEnoNuQh5Z/e/i1ryuJcj4fVPYL6Ftiypc8zrGwVWbv2YPn20KDxnJQBJOWCa3/9swViZA8Hae4QXF2lxiqU7wepzWJVvaZ7daRQyUrhXbrwWHgFwafkLQFVNM1vjBr0vFUPgXg5vAGapTDeKXuHUnpx6jk/Wxyl4b8Kzp1B1KXeitihyEnkA0+zurfMstSgLOBIj2dd9ufhduByP4OaM30H+CgK0I0IjG86/5yzlZ9SbL5LUK/r0COwLIpuEGaQ20luPXfoWLdTDcwxNw3OcYDJ1lfG8I4zWGE3rH0dxjSP6h+F2VY4kb1K9kNtC9wfQv9lNvtmRWVYNY5y3rGGCJQ6EqR+BhakPau/rw4PpoSpwFCMwHIGA4dlZbb+TlQzzoFFlKdSW9w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(81166007)(186003)(86362001)(8676002)(16526019)(36756003)(47076005)(82310400003)(26005)(110136005)(1076003)(54906003)(83380400001)(356005)(8936002)(7416002)(426003)(4326008)(316002)(70206006)(70586007)(2906002)(508600001)(2616005)(6666004)(966005)(4743002)(7696005)(36860700001)(336012)(44832011)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:12:58.7362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efaf7c7-0dbd-4476-af09-08d98da38a53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
owned by a device that can be mapped into CPU page tables like
MEMORY_DEVICE_GENERIC and can also be migrated like MEMORY_DEVICE_PRIVATE.
With MEMORY_DEVICE_COHERENT, we isolate the new memory type from other
subsystems as far as possible, though there are some small changes to
other subsystems such as filesystem DAX, to handle the new memory type
appropriately.

We use ZONE_DEVICE for this instead of NUMA so that the amdgpu
allocator can manage it without conflicting with core mm for non-unified
memory use cases.

How it works: The system BIOS advertises the GPU device memory (aka VRAM)
as SPM (special purpose memory) in the UEFI system address map.
The amdgpu driver registers the memory with devmap as
MEMORY_DEVICE_COHERENT using devm_memremap_pages.

The initial user for this hardware page migration capability will be
the Frontier supercomputer project. Our nodes in the lab have .5 TB of
system memory plus 256 GB of device memory split across 4 GPUs, all in
the same coherent address space. Page migration is expected to improve
application efficiency significantly. We will report empirical results
as they become available.

This includes patches originally by Ralph Campbell to change ZONE_DEVICE
reference counting as requested in previous reviews of this patch series
(see https://patchwork.freedesktop.org/series/90706/). We extended
hmm_test to cover migration of MEMORY_DEVICE_COHERENT. This patch set
builds on HMM and our SVM memory manager already merged in 5.14.
We would like to complete review and merge this migration patchset for
5.16.

Alex Sierra (10):
  mm: add zone device coherent type memory support
  mm: add device coherent vma selection for memory migration
  drm/amdkfd: ref count init for device pages
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: coherent type as sys mem on migration to ram
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device coherent type in test_hmm
  tools: update hmm-test to support device coherent type
  tools: update test_hmm script to support SP config

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  40 ++--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
 fs/dax.c                                 |   8 +-
 fs/ext4/inode.c                          |   5 +-
 fs/fuse/dax.c                            |   4 +-
 fs/xfs/xfs_file.c                        |   4 +-
 include/linux/dax.h                      |  10 +
 include/linux/memremap.h                 |  15 +-
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |  19 +-
 lib/test_hmm.c                           | 276 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  20 +-
 mm/internal.h                            |   8 +
 mm/memcontrol.c                          |  12 +-
 mm/memory-failure.c                      |   6 +-
 mm/memremap.c                            |  71 ++----
 mm/migrate.c                             |  33 +--
 mm/page_alloc.c                          |   3 +
 mm/swap.c                                |  45 +---
 tools/testing/selftests/vm/hmm-tests.c   | 137 +++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 22 files changed, 490 insertions(+), 251 deletions(-)

-- 
2.32.0

