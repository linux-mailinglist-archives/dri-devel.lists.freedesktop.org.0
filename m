Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274E35670C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326406E07B;
	Wed,  7 Apr 2021 08:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF84D6E05D;
 Wed,  7 Apr 2021 08:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5zYDpJD/MybtUsNLiNYNLSIZDBQRE6hgY9K0VjKPlmvIvGXnmTPHQ2XgrSnVrd5+gt2igdMI1/VZ9sKBAWCasNukEGxtpcdzuS6NQwMqYR1YzKgITfzPBPbhSyoIUUPebf20cS5je2LC/hgc8bSgi5kIG2neeEdw0B/D0Fzb1tfruiTrj+tyMVJV20OSD4XqYhFyuyCGedAIexE/L8ePkPSgoNW6j+TzVDyaC9pirs+R0lPE+zeh+61+GW0+4lILuAsxV6PL6tvGKuDiA8nwCYSx+rgUxbBacfQI7hL+2OW76uKmVIQ8J1OyZ/TApnjOB9p/5oIuRBe7/01a6CLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8atsAucQ0pf6s4/I6SzoG1tIrheC/G0Dy6H8UzwNmm0=;
 b=DEdOZlVQt64EnXve4NnDQkOLjV3ODCCqAU8Ar55DKilZEPneknucZgcufpVc8OuatJUO5zeH0weH4f3HQ32eM1HMY61NCZWc894dpmyReWYxViXx+NqUbKuy45NDLX92irTUkX847SpgR+QVUWLlIUy1sFhelpnu4Fnfc7+r6QSwkLdHiZiWxzWrvEoxAhLrlrbtRrg8lAm9m8TToygEkQMaHi4PS7zApzI8KSZ1n5POlYuYR1daDAOT91wNWNe+ynRR14vfFoheikcZDDAOMebBtuDgvkrVJXEF64eNIlW/v7H/X+wrr1vIbky/7grzWZHGNAIjo6FGyenclj+3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8atsAucQ0pf6s4/I6SzoG1tIrheC/G0Dy6H8UzwNmm0=;
 b=npwX4mkxoM5h7nHmbEBpSDT5nXCsxVRM6M/XD4yqy898e472oRW/t7WEiICRgaol5upfLECCssZpb0Cu4VkJG4bnRboRwjeZB9vJtGtUS1yHZ0yKIPmHJGCKig1rG4UbEw15Kw84HIGNGIxAsjuvQGC2gvFMrYTTiktG5swMhIe1WaSw0W3pQXtsZbl4deaU5Gmyxio9yv6O3HagCnXMEK9ZTOS7hrw8YD2S7/d05QUzkjhWnXnwi842IO3ZuC4wL+Gp8yaCN0Yi4/rzX0gnvXXbPSb2WkoHzAIzF7Ddvr5HjSl2hCZ890c1hELnOYolCkFGZXlfbGZayRsdFh7Q4Q==
Received: from BN9PR03CA0451.namprd03.prod.outlook.com (2603:10b6:408:139::6)
 by SN6PR12MB2685.namprd12.prod.outlook.com (2603:10b6:805:67::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 08:42:57 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::2f) by BN9PR03CA0451.outlook.office365.com
 (2603:10b6:408:139::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Wed, 7 Apr 2021 08:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 08:42:56 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:42:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v8 0/8] Add support for SVM atomics in Nouveau
Date: Wed, 7 Apr 2021 18:42:30 +1000
Message-ID: <20210407084238.20443-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9956c420-90f4-48b0-4ffc-08d8f9a12463
X-MS-TrafficTypeDiagnostic: SN6PR12MB2685:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26854AE7B874CC2D32AFEF80DF759@SN6PR12MB2685.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WI5/BxbTvGeIKaA8XpijPEomx00Vnt6PnzGcRN2DVYFxiy4e5bWiupikUzXLsLc1Ci9gjxQclyq3+7t0TtDsARXf78pk3T4Nv6NWm3hPY5OUZJv+ZVVs7D/ZDMGzwvuQDqd4xyV1/xkexVbBZpLeWIao9kauKKfZ+dvo55l1u1ru8U+uVRfWd2mNKgeXefKY0pcRPTqRr4FG77l7UorBNpAChvtrNcN+RCeuoxgzMEL/E6MuPZKct6yLBpyVZeDhOtcn4Z99ohqBcVT6+vjkMPVluvn0mvm8o3QjdCL2Kw9jHgvdmpN/z5YjzufriCrGktqMI5xqD5dqwUrrrTfjyTg2gBpZJ+t0R4D/Sc2F9MEtHLvWKdxMxpN/OA9regYIZbtcIXfbUPu92pleuYEdywYUD4e5OH0AuyRe0DMragD6nQ4TrmY6fcYbSvp+vr2/rGZC5N5lsRYilKxlOedzo26oE5sfIxcHGMpWa1J2eOWnONRWF4HV+UCYEecGznVLBf0zpJt8g+r2oDCmQZsJdF17+UI/GGV9z5SgOuXksfGr6mbgooYmdExKplBbz58cJIM6O055w7fPIlW45pL9n9WSLL2hYIR89ANkuUtma/Rb48h4scgzHhqyQjtUeRgziupoSfr9MUHXLkaXHqTLkjFJ6HPg/Crm1UX8wXTU320=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(1076003)(356005)(4326008)(36756003)(7636003)(7416002)(6666004)(5660300002)(426003)(186003)(70206006)(16526019)(82310400003)(47076005)(86362001)(36860700001)(54906003)(316002)(82740400003)(70586007)(83380400001)(478600001)(8936002)(2616005)(26005)(8676002)(336012)(2906002)(110136005)(36906005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:42:56.6785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9956c420-90f4-48b0-4ffc-08d8f9a12463
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2685
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 bsingharora@gmail.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the eighth version of a series to add support to Nouveau for atomic
memory operations on OpenCL shared virtual memory (SVM) regions.

The main change for this version is a simplification of device exclusive
entry handling. Instead of copying entries for copy-on-write mappings
during fork they are removed instead. This is safer because there could be
unique corner cases when copying, particularly for pinned pages which
should follow the same logic as copy_present_page(). Removing entries
avoids this possiblity by treating them as normal ptes.

Exclusive device access is implemented by adding a new swap entry type
(SWAP_DEVICE_EXCLUSIVE) which is similar to a migration entry. The main
difference is that on fault the original entry is immediately restored by
the fault handler instead of waiting.

Restoring the entry triggers calls to MMU notifers which allows a device
driver to revoke the atomic access permission from the GPU prior to the CPU
finalising the entry.

Patches 1 & 2 refactor existing migration and device private entry
functions.

Patches 3 & 4 rework try_to_unmap_one() by splitting out unrelated
functionality into separate functions - try_to_migrate_one() and
try_to_munlock_one(). These should not change any functionality, but any
help testing would be much appreciated as I have not been able to test
every usage of try_to_unmap_one().

Patch 5 contains the bulk of the implementation for device exclusive
memory.

Patch 6 contains some additions to the HMM selftests to ensure everything
works as expected.

Patch 7 is a cleanup for the Nouveau SVM implementation.

Patch 8 contains the implementation of atomic access for the Nouveau
driver.

This has been tested using the latest upstream Mesa userspace with a simple
OpenCL test program which checks the results of atomic GPU operations on a
SVM buffer whilst also writing to the same buffer from the CPU.

Alistair Popple (8):
  mm: Remove special swap entry functions
  mm/swapops: Rework swap entry manipulation code
  mm/rmap: Split try_to_munlock from try_to_unmap
  mm/rmap: Split migration into its own function
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
 include/linux/swap.h                          |   8 +-
 include/linux/swapops.h                       | 123 ++--
 lib/test_hmm.c                                | 126 +++-
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  45 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 196 +++++-
 mm/migrate.c                                  |  51 +-
 mm/mlock.c                                    |  10 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 612 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 158 +++++
 26 files changed, 1366 insertions(+), 312 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
