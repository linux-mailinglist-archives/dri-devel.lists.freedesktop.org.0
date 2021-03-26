Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12605349D44
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34686E0FF;
	Fri, 26 Mar 2021 00:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FDC6E0FF;
 Fri, 26 Mar 2021 00:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUbjwMnZBPqw6tSNRj/T60PgCbniElmolkVfkLpsaulZylkPZ/J+U4f+8hOcvv8xn2v44BncG0mqkH78A2EGl4n8B0dQqgB+qVMlkstsH/NVEumgPoFdBSH7lR0X1fb8rtvsq1rXIybPlGb1rxArjLdosR7W4CqwrWbby+XaIguUYFeAesxkNWyjlGDr7keWROjqdDmg+le6fKCqDbKOVc2iCfauy0E+/2oAfmOooCbYYcx88XtB+gmfC6DVu/o+eWLLuanmPp5WopBXSaqwqI2CgqTIDuxD7LQFTINbCwJuOBuFDYxxsjIU/zEoolO+f12+1o+7zRSj3PxI22F03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HcUM27MO/owEVgYTcHS/zla3mCdFZ6+2LZOtChNB0M=;
 b=J/iNPHXgIYstLaWEEldZxSx8Wq+yrPxQJ5Zb89W1PbQ1kpYsQCHTuSyKZbJqpVhVuvCNtIR+qEa9C0+N7zTUOC05ditfDGXBNsldMCE6qswo4mBPgspmlW5TDy0a4uaehVfG216Es8F0CNIFIQVpLYeGlYZJaAD3lpug2z27GzPYU4aTAIT7fKbXI8I2BiomC4E9wb6FJlT9gInmL73tZBNBT5X3Az8xuw8oMpIRrUYIrT4BHE6cMv2XJ472DPc4UwerWJGOaijwgcpnwXcxz+ZC6TL2Hl6WLIHzErzq20iVtK9r59DVjb6DG0h+yq5PHa2zDIdyfuqJOo+TRsk6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HcUM27MO/owEVgYTcHS/zla3mCdFZ6+2LZOtChNB0M=;
 b=dIyS6dAxmeeVSEB1u+ZBotqXhgKiphonVaV+Gj3BPb81X7K6RqEdcKAgS4QUxt3vZadBaJ1PIZK5PHz+5LtATUGGazvf2lMOWRbF0mEKgZplcntgpxj0IUgEuTNi+Qw5U0+paR3p0WVEpjj3kf3umnQYKP8LiO4UX/6PZlEpkk8tPzWuGT3S7uz2jRYWdskggh3O540724aifRsa/HWSfiI801agYOeO5pr2Px3xtgNc2m4Q1a60AvNN50aPlCYAxww8EphcnJM7d7S7SdUrurm6FTifMo9HiSAA07qPBKB7n89tcYPxGujP4Ee04BBdeejFMrnTBQuTF3T8srnrUw==
Received: from MWHPR10CA0020.namprd10.prod.outlook.com (2603:10b6:301::30) by
 BYAPR12MB3272.namprd12.prod.outlook.com (2603:10b6:a03:131::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 00:08:21 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:0:cafe::ed) by MWHPR10CA0020.outlook.office365.com
 (2603:10b6:301::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Fri, 26 Mar 2021 00:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 00:08:20 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 00:08:20 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v7 0/8] Add support for SVM atomics in Nouveau
Date: Fri, 26 Mar 2021 11:07:57 +1100
Message-ID: <20210326000805.2518-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2ac8f7-a39d-4995-8952-08d8efeb4400
X-MS-TrafficTypeDiagnostic: BYAPR12MB3272:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3272D086A6940DDDBBC96B5FDF619@BYAPR12MB3272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3lhGOPOQtaEIY7TyxlUyEJR/2B4zpc4ZkbMpZCxnv30ZCCNBxuDvFTU4ZmQDCyQYU3agjgwghFusOvLtT6+YUGpcwdKM62sPQqLOwDShbPB+/qwNI49SWlIlBE/gWGc3yaUDuJ8Ezda0D6JZp3VY2WPm3L4wJ4js1JWz4U//OvaROMG0DoTHLEYR3lAcQinixZpi3fG8hkwktB69UONGCAJOL/b3hf7b0zjwHPFC/sIV3DOvlsqkdBaH9qxEWkUfePJGpGrSvgOORhL3Un4C2LKUwHF8kXZn47W+cwmGEWbPBbiGlX9p6fBM4xzjczdvH6kFln/RQtptpPgNBDZwymFtJIyvyS9tk3Quyyv/SfANd6lbas8zhR+Xue+h1shqF52fDeuOKXwRB5jvFnSqN8iLoZuCILMErqsPHfbmJwtSaha5Lkkw1TVV7CSADLmUqEocUppfyM2wN0FCTIH9wpQIL5xFe4FUuW+ciJQjbHa0fv7/hI8+5QtYwXYB3kqwC9lu35ZR10wgepRa2qF8uLSrkh3Yi0Sf3WmK7cBGegHEFNHi46S1Pc2/ruyVpVP2xE1/BH22yj9XNz2Tc2sLmaS/fctBru1WUADuPgKi/9uL5VuitTClg52o0xbgQVjddCGGXHvd1A7oB8l4yZoRRHcSux7lpyL0BMqkQjpCcw=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(82310400003)(82740400003)(16526019)(7636003)(36756003)(86362001)(356005)(70206006)(83380400001)(47076005)(36860700001)(70586007)(336012)(5660300002)(110136005)(54906003)(478600001)(8936002)(1076003)(6666004)(186003)(26005)(8676002)(2906002)(36906005)(7416002)(2616005)(316002)(426003)(4326008)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 00:08:20.8654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2ac8f7-a39d-4995-8952-08d8efeb4400
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3272
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the seventh version of a series to add support to Nouveau for
atomic memory operations on OpenCL shared virtual memory (SVM) regions.

This version primarily improves readability of the Nouveau fault priority
calculation code along with other minor functional and cosmetic
improvements listed in the changelogs.

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
 arch/s390/mm/pgtable.c                        |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 156 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 fs/proc/task_mmu.c                            |  23 +-
 include/linux/mmu_notifier.h                  |  26 +-
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
 mm/memory.c                                   | 128 +++-
 mm/migrate.c                                  |  51 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 604 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 158 +++++
 24 files changed, 1282 insertions(+), 275 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
