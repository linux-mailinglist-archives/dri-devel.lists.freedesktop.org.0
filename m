Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588B9332510
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 13:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893EA6E8D4;
	Tue,  9 Mar 2021 12:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED1A6E8D4;
 Tue,  9 Mar 2021 12:15:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhMYBey5/ky4izxzXtHtPBhTONzcCKwO2eC4k/Ro8v6l6hgQ0nqfN3yvwxyD2a79myGErfSwjwjWa/6gaYqX/3c8S3ZRPcQbwXvgbns0esOD4E76Ht//XkU82/DlRdm5YMsI5+hSPaaCZVvu7QVdgJIGrWVMea2Xd1anx95CINMeL6L1kZopxTIHfjNGCJD9WVnTRUfEmNTboD1NMe/1aFNsD3ZH1uv7ob9pX12pHAS8LsPFF+Q9x/OM3TdxiVGWDuK/BCz4pczxpd+A50+MnqFiIoll124VRoLKZCckFEQ1n+E4e7u3EGnJY+xt7kWPQ2EkWgnwT/soWWz9nbSZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2TfRBq15SxonfNXBc3PUajKy0744eFcA8UhliCbisI=;
 b=dABZMBlvtEL6dtHezfyCTycmbscTUyhtmLN6j6rM+bdeq3SJ1uxxlO3K0/L2ieT0KIvL+fBMQxr2N0UZC7C0I4fmPK03PSUO1rO57qy8UR/Zv01XfN3yFbuAql250Kw315uRafXsAmp9ZMXLde8ISy5WiE6M9wtULb3/EtclRb/jF1nmqBDFE+2ArtXWUIDhdlz7XQPYVFcwXVETKht38ucH+d44QRO2wbX2J3p0+2txLvg64xmM99o3JnRedwXW3ayROJic9Pdm2Y6YqLYvkOwXO2sy84IX2S3Ch5eWN/rFLkQhkMnnhGO37iyC9gWcszqCaZlqkWzdiVB8PTtI/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2TfRBq15SxonfNXBc3PUajKy0744eFcA8UhliCbisI=;
 b=EE7fi8sUzlcMbwWcsiy2L4lF1AYtpgUGoz514B7a/QOee4P2BENDS8x77s7VeaUXSplG611Gi28rCuwopazguMdv0pr0ohUC49Ly6N4agvz4ZfsoMB1bIGoSfktEe9ma+ujaUAmOWS+q+GsjeqdXxzTo39aNQDSPxJ2ID1jajhLxUv+QtKy/Kl/QzicYy9UjPmYcUnIoH2N7pLp178zHnudufXaSfviS/rwtkm+3WDtw5Owd9SpiaWSDtVccbBcpBj25JIuezaiX7eIWf6lgaK6jXOrXeMHBzTM9VJI23R58ytB7Qhutpod2zUAP3kyzys3aIah7XZKyRjjdvPGxqg==
Received: from BN9PR03CA0542.namprd03.prod.outlook.com (2603:10b6:408:138::7)
 by DM6PR12MB3131.namprd12.prod.outlook.com (2603:10b6:5:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 9 Mar
 2021 12:15:21 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::bd) by BN9PR03CA0542.outlook.office365.com
 (2603:10b6:408:138::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 12:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 12:15:20 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 12:15:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v5 0/8] Add support for SVM atomics in Nouveau
Date: Tue, 9 Mar 2021 23:14:57 +1100
Message-ID: <20210309121505.23608-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 211a8a28-ba0c-410f-4ec0-08d8e2f50285
X-MS-TrafficTypeDiagnostic: DM6PR12MB3131:
X-Microsoft-Antispam-PRVS: <DM6PR12MB31317B953ACD1C0F00E58C35DF929@DM6PR12MB3131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9p8dqTltU9Q+/SDZ6qVBm0L6ta6too9UR1Rdd0aMR7xFrF060n3ZjUl1pECuXJq7DNBYNKF0ylJyj8lzBlX/h4dH1+qWIAjqjbz7oVEmwhBIfBkj+DLXDZpglI1d8lpJc4+Zxi3VHNrTUkNsO335gD0ogfDMzzrorzUhCV435bzSx/GiCfS09OLmP056JgklC8SrvVwFqxErLrgXUyy9nERJ8APLo1QX3KIgjvty3e3py5w2WcUzbOPjzcVvYsEbxgyCQNfPaWfabjpprDC/zQeQrN6lf9jn/czoeLPjo5m6zVPnPuk/LVtJYan0u/LnncPM4n5FBOzTkBViBwVg6bqIyRqjzDh+0MOJYhackkwSsBPCfZOpOMpjAGm/68yoIxPptDireouJJozO2WcgtuQiod7GMsaAuTFmCdLwt4bGjXuStmHulwP5uxLwuT9vGm5NbSu1Hu0rLDkR7glmCg9khY9EG8SOAJR7yBOOrz4CUiXSalMP7R9uvEc1i74OPv+AXjYjFzVQymrzQtAnDSqmTpGxeHk7QD+6nynZwt4qSQdqHKaemImw5xgosDupClrQsCmIOS0iC7mmB8ybYyr/a6xTDQunrLuoz0lrExaYlHC9KljCHFCuDqinJvz7ZNJmCgjfxnQmFH1EwhCZgQayfM3ZZEytuRXqnCESviYPAM2z0LzJWjz3XyEeRL2
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(316002)(82740400003)(426003)(8936002)(54906003)(110136005)(36906005)(8676002)(478600001)(70586007)(86362001)(36756003)(6666004)(26005)(1076003)(36860700001)(7636003)(70206006)(2616005)(34020700004)(2906002)(82310400003)(83380400001)(16526019)(186003)(4326008)(336012)(47076005)(5660300002)(356005)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 12:15:20.8451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 211a8a28-ba0c-410f-4ec0-08d8e2f50285
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3131
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
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the fifth version of a series to add support to Nouveau for atomic
memory operations on OpenCL shared virtual memory (SVM) regions.

The main changes since v4 are a rebase onto v5.12-rc2, the removal of
check_device_exclusive_range() and the addition of MMU_NOTIFY_EXCLUSIVE
which makes the extra check unnecessary. The driver can instead filter
notifier updates called as part of make_device_exclusive_range().

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

v5:
* Rebased on v5.12-rc2.
* Renamed range->migrate_pgmap_owner to range->owner.
* Added MMU_NOTIFY_EXCLUSIVE to allow passing of a driver cookie which
  allows notifiers called as a result of make_device_exclusive_range() to
  be ignored.
* Added a check to try_to_protect_one() to detect if the pages originally
  returned from get_user_pages() have been unmapped or not.
* Removed check_device_exclusive_range() as it is no longer required with
  the other changes.
* Documentation and comments.

v4:
* Added pfn_swap_entry_to_page() and reinstated the migration entry page
  lock check.
* Added check_device_exclusive_range() for use during mmu range notifier
  read side critical section when programming device page tables.

v3:
* Refactored some existing functionality.
* Switched to using get_user_pages_remote() instead of open-coding it.
* Moved code out of hmm.

v2:
* Changed implementation to use special swap entries instead of device
  private pages.

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
 arch/s390/mm/pgtable.c                        |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 130 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 fs/proc/task_mmu.c                            |  23 +-
 include/linux/mmu_notifier.h                  |  25 +-
 include/linux/rmap.h                          |   9 +-
 include/linux/swap.h                          |   8 +-
 include/linux/swapops.h                       | 123 ++--
 lib/test_hmm.c                                | 126 +++-
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  45 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 127 +++-
 mm/migrate.c                                  |  41 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 597 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 219 +++++++
 24 files changed, 1313 insertions(+), 260 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
