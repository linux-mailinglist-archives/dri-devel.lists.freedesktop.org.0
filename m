Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CAA3A9867
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8306E578;
	Wed, 16 Jun 2021 11:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333086E56A;
 Wed, 16 Jun 2021 11:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzB+PgbRVkAhcCjOqRcZnc67YKG/BYiS3iaHx6QWBOQjs7oaS9i3gerqYv7kTvz0onYE1GPWXy7dumP6mKQ1UCtkb+/j3/LlXx5XjUmHWi5ITX5h3X1iOn7TsvN5oPT6GltS1HvnrPdJHwoZ0XGxL0R1JSJLEfSaDW+niZYjPQZB6ZoZAn2M8LRchS5TfKwA0uGAdizoliQhouwydtOrhviN44T/Rm0ddkAthAQcrEDu5QeUyr0/DXTakOAexkkGc+QMHdPoVsilgmq7jBeJ3n3VdSO0UTHR1l+0mKrxn7lrHkc6gpOKKZbz6wxISuB2aZvn6rEdNUucVOdqQrqTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV7OuWEo/GplBHvZyk7S65vBVvmRHJTYAuH7hBSqP+o=;
 b=begbV7z0P2vxW59t5vLa98N05KvpXRgJQGff1t1ZNV7OR29AqBKSjGeqJEjQou6LOFKf8hK0yW2BkwI/MDWLedDySWqQpTsTSHKu5IsR1F7479xoI6laoq2fbEhUngGz82K3hNTtKFI6p2nztaiCq/vaC+vSctndy7AZ7xRl9KvdwqFqkw3XKhjI6aTVf6F2m6HkRLp+8hIiCNpy4T0IDoN4zXeRJMMC/EhHZFv7QfXwFwNMe7t6dQ51Fjr8OmiqbLPyBbBYSRnFTjLIxy3mWvMgVabCjFCgxozU+3jex7uwEokAiJrdMNu24BWhle9hjFVV4JICzdarkW9yuShV0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV7OuWEo/GplBHvZyk7S65vBVvmRHJTYAuH7hBSqP+o=;
 b=NulbOSOLywTD6vfd75EdSCkU9yFHVxantlXsL7K/3qeG+6KryNt5o3dfuVN4Jr9K1FedzYAK3yfwLxxGQdrgFoQtFWUxkXZHafEKjXulM3tNJQZeJt2A/9YpCf0WswZYVoICKwZnZbhWo/vcB2SMq/NTlHF+EuPm0K76nkm+FrwmJUQJUTGRtjW4O1ncs2ZCg/TS7ah20IA9Fjj1gcqZcie9wQQ9AYRLGNRGGWx8eaXMD+fqGHUPLnm8WG243kLwa6ub9M4NRjiMy27Ersgh8uzazW4bbj4ez4OhpWojt8pSFkRBnI61Kalb77Mm4g1fSO88ULt7mGeYwmrkdIfGng==
Received: from BN6PR14CA0014.namprd14.prod.outlook.com (2603:10b6:404:79::24)
 by DM6PR12MB4894.namprd12.prod.outlook.com (2603:10b6:5:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 11:00:41 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::f3) by BN6PR14CA0014.outlook.office365.com
 (2603:10b6:404:79::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Wed, 16 Jun 2021 11:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:00:40 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:00:39 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 00/10] Add support for SVM atomics in Nouveau
Date: Wed, 16 Jun 2021 20:59:27 +1000
Message-ID: <20210616105937.23201-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d6661c7-019b-489a-8411-08d930b5fb39
X-MS-TrafficTypeDiagnostic: DM6PR12MB4894:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4894FFA270F2D1F9953F48F5DF0F9@DM6PR12MB4894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdYplu0m6TUm11yAAObz3+dhW2NapQYJZJN9dtKTf4vZ34yySKDDdQEVF5RzmtC28xE22RtMR/ETp+GOchaME7/I+I7ozX45iMMjtQ0IZMOVcr+5tAZE+IvJOA7Od3Zb/7dkgIK5fULyr20v1j/Qa0EzkP3WQ7kaKJCs+Qd4wZl8g3wsCsCkzFMHSqHDPcW4WtMXrqNf/cU5CW0rcS5QLp3mHKcgkFH6jj9FmqtR4pOxs6RkRoHZmRc0gl2Dolf4HxhmEiVlBxPu9ftJxrkqGd0yPAmbkLgb6mK9y0lIVck1poa7+Mov3lXDfv9+/bb8WqpaYhSmZpzhVWvcSjAq9Hnd04UFPFY3qFmfH/kbrDh2jjPHchn4csVRLMCAW/Sj2RaQBRpBMdhhxGu2MfQPKX2AuHZuHgFP0jEBa9Wi5AcIMWs7pYxsZGufcKvqBfYp2GuvGj/Bq+GhzxHbQAalDcjRzGWk/pTGZAVE6ead0MW/aE1PEYBiAs0DQEx6N0FL3hWlCrYQmMY+akE5RhDs90zxP05KWYEEz8m7+aMuCXnzLl79V4vcRe1xquu0vNwIdzMndP5aMPkAaSf0PEUQwfA4DfOjzKPv7fABapdG5r0FVFuyrnM7zg77eGGBcwKf615mWejQYf5yaT3AzUdvZ6AdH7lMAsmOxTzO9on/PuRdxiAiltCRr1LNloML7HtwPuKI0g0OAPd1/I5zQgzUhBuxBcHfgZY4fVus3WM0z3O7/Af50mGcuwVjcELn/Nj6ps8rcyiS1QoSFsP9tr9ZkQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(46966006)(7636003)(7416002)(70586007)(16526019)(82740400003)(2906002)(186003)(478600001)(6666004)(966005)(356005)(5660300002)(8676002)(8936002)(336012)(6916009)(426003)(36756003)(36906005)(82310400003)(1076003)(47076005)(316002)(36860700001)(83380400001)(70206006)(86362001)(26005)(54906003)(2616005)(107886003)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:00:40.9931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6661c7-019b-489a-8411-08d930b5fb39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4894
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
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

This is my series to add support for SVM atomics in Nouveau rebased onto
v5.13-rc6-mmots-2021-06-15-20-28. Functionally there are no changes from
the previous v10, however some changes were made during the rebase. If
anyone would like to see a diff-of-diffs I can post it but my exhaustive
(assuming I didn't miss anything in the diff-of-diff) summary below is
probably easier to read.

Hugh - based on our previous disscussion I'm reasonably confident I haven't
missed anything from you in the rebase, but patch 4 ("Split migration into
its own function") might be worth looking at as that contained the largest
conflicts. Thanks.

[PATCH 01/10] mm: Remove special swap entry functions

- Fixed migration_entry_to_page() reference in __split_huge_pmd_locked()
  introduced by Hugh's "mm/thp: fix __split_huge_pmd_locked() on shmem
  migration entry".

- Fixed migration_entry_to_page() reference in page_vma_mapped_walk()
  changed by Hugh in "mm: page_vma_mapped_walk(): prettify PVMW_MIGRATION
  block"

[PATCH 02/10] mm/swapops: Rework swap entry manipulation code

- No changes required.

[PATCH 03/10] mm/rmap: Split try_to_munlock from try_to_unmap

- No changes required.

[PATCH 04/10] mm/rmap: Split migration into its own function

- Updated try_to_migrate_one() and try_to_migrate() to accept TTU_SYNC
  flag.

- Updated mmu notifier range calculation in try_to_migrate_one() to use
  vma_address_end() introduced by Hugh in "mm/thp: fix vma_address() if
  virtual address below file offset".

- Update to unmap_page() in mm/hugh_memory.c to pass TTU_SYNC and check
  page_mapped() now that try_to_{unmap|migrate} return void.

[PATCH 05/10] mm: Rename migrate_pgmap_owner

- Added Peter's Reviewed-by.

[PATCH 06/10] mm/memory.c: Allow different return codes for copy_non_present_pte()

- Updated call to copy_nonpresent_pte() for extra arguments added by Peter
  in "mm/userfaultfd: fix uffd-wp special cases for fork()".

- Added Peter's Reviewed-by.

[PATCH 07/10] mm: Device exclusive memory access

- s/vma/src_vma/ in copy_nonpresent_pte() due to "mm/userfaultfd: fix
  uffd-wp special cases for fork()".

- Skip calling rmap_walk on tail pages.

[PATCH 08/10] mm: Selftests for exclusive device memory

- Squashed in a fix from Colin King (see
  https://lore.kernel.org/kernel-janitors/20210526170530.3766167-1-colin.king@canonical.com/).
  Not sure what the best way of attributing that is though given it was
  against next.

[PATCH 09/10] nouveau/svm: Refactor nouveau_range_fault

- No changes.

[PATCH 10/10] nouveau/svm: Implement atomic SVM access

- No changes.

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

-- 
2.20.1

