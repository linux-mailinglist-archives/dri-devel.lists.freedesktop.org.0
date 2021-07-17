Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB913CC5B9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD726EAA2;
	Sat, 17 Jul 2021 19:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21B26EA52;
 Sat, 17 Jul 2021 19:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmiLPVfxutNE/72j/lgw3esL0FVduqfpDHcQIDqa0aTJfpMuL5pwL+XQY4QVI3tuI2lZSc9VfNLMxYrSgShSC/dNAbzwiCTtD44EiRmqb3Mn2Mj6RPkrCHJsJBasFhEX1TOrIlYzu7sazMdHhRVUbTHn7XTQZtsqq80ZiBE4yPUjwGWFoRtbBDm9JybWf3jPHYRhXKp4i/Df9Sdy9Vhysu3zxllBOd5O+hXKLOdEIbTWogoYje5WZi5SouLvbdcbj3G7RLa6gCRtse3D+FpCYHzj3G38W9ugO+tieHIcczhlY+xVCNnJumGkSPLz2aBu7aPiC9t/erqYNeVAiPi5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Cr0rlxMOYaJMeLYa7Izej2+HsR7L1GDOBDHFzfaik=;
 b=Q063FgWsEw4gPgxfYkTKZE5LRhkJDzFa1IGlzPp3TIVQ7SO2lCk/8J8dMPbudiyMS41yk0m6QuyvP7gnY/iXO7vJoWlSqNoncQN/yPqkASV/QG6NlAcVp41P1WFOwfRJnPl3ro9pvvWy0wyPjhmfLxYjzvsn+YP46dTvIW5TSn/rjoTnc7jjFuGRibF39TumwVGWQzF7tkmcUAjlDd4fiyeH+IBaI3LIGH6y6jVSuR4nsmgaQbB48r1CrschPRLnAjUggx0LmbfLvx2RlBfShrzybFUyNH+bAz50HgXioNgetvbzKqUHCStjOuPfjcNFK115yqgMPj8ygOlYS++6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Cr0rlxMOYaJMeLYa7Izej2+HsR7L1GDOBDHFzfaik=;
 b=LSAOFiADgngfm4ChC/PU/gyKzut64FA8QScM20SzAqkZ0HMFwbBOH9Wqv6Hqc9ACPn2sr2/bxWqlzU4uIvmqHUVDgcKhYrD4zobZxEhO/3nT0qUk9RHlebYYnKrL8puViG4Bbjths8MOwT+BQbXcj40OAOfbhM6/Yy9DQ8gjkbQ=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2830.namprd12.prod.outlook.com (2603:10b6:805:e0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Sat, 17 Jul
 2021 19:21:46 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:46 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 00/13] Support DEVICE_GENERIC memory in migrate_vma_*
Date: Sat, 17 Jul 2021 14:21:22 -0500
Message-Id: <20210717192135.9030-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 283b6500-c69b-44b5-c004-08d949581df6
X-MS-TrafficTypeDiagnostic: SN6PR12MB2830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2830FA0565353F834DFD0B8CFD109@SN6PR12MB2830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/hxFMIqlwmLYI0xY3U6RK3yN9l9QTjtnIiu5yUhzhuhMMBcn5eck7RqNvndjAUS+y4t2fx3HXrZEG9WrnojfSscdsjuUL4npX6Ze9lXglNjCRiYpJ93pA0az4p2GTAp7gWWPFfyN2VoPUK2ZKkj0PDxJ1Iz+V0U5jeIN16vnM6i+7em7AxD7HlAnC4hIIm8IdPEij81ZOVFlvsRpSnBzUQDr9UtV4dX+0oqZK2e1RxA+ng2Wy3hbeSAh9vv8zhJC4igewjSDyVWmWe211e53YgVRzFvte8HfVP+N/02jTrnG9D186qWV+EPanuhdbAacQOgDoSshmgDn5rXCkGHNXwgj+CFKlAbfHIs1AA/Jutai2DLy3Eq/cICizfLVKSRjJjjTt9zq6NwRWhKosnHufCVpOyofGs27Y0qvxYb8BWQuhMJ04U2H7quqD1bpqvYMPDvWtsD4PsIHeg+YfRG8zkh/lwuQBDiTJpXpCTf0V0DTjVDvIR+dag62qUQ5cxO1I9ML6Qd82OrT7SG8zfvyrz4yPsW+GVzBJMe1nkxg4/g04g55neibyVRi+TdlHaEI0LDkwlm8SyQenc40H0CodkzLjxuOq7YrqdFis6blNW9NKrCHP4I7DvMOH8kjeUqoKl/t2OHHa7jb6vtxmdM6pm89yjXWN7vA4VLvJcOYgl7JzWytWEd2yN0jr/RoMBFuFbHA+11hF+WOarzpnPVz5pqAboANAa6TnCmtMurgfiYqjXvfY0JTDr3+lZ90wGL6WlQyxQCGUrjrBNK0iKaGFqte+vlxakctBhRlKS9TcGcCQFhCK/FZkRQX50ioug/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(83380400001)(186003)(2906002)(5660300002)(2616005)(66476007)(7696005)(38350700002)(52116002)(26005)(36756003)(66946007)(66556008)(8676002)(38100700002)(44832011)(86362001)(478600001)(966005)(4326008)(956004)(7416002)(6486002)(8936002)(6666004)(316002)(1076003)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F6y2CJm0szjFpndtfjwTTv0zuO4PCiiAoXdCX0OH8QQ+bXSmHQPHs57PMcQ0?=
 =?us-ascii?Q?3lGBKcShD5GFd8CkVs6NBXRRYBvHTv6gXepEn86mHDGzdPrT8I2B4Szx3mbb?=
 =?us-ascii?Q?NLIgdeorCeMlXRw47BJJ08RXvnKQB80IBjV6yG/JM00MVpuo7nmFI5s3OvCs?=
 =?us-ascii?Q?sA6OTlqgZ8P/SST11yqFPMbFyvT5FeXHJQ0RiYk0pTobUQHsYP5iH0VL70Cf?=
 =?us-ascii?Q?45gCM1/GBOpPeM0Luv6Bfj7vOYRt2jXMGwgs+mv/nxbt71X2rCuL5NlSixTF?=
 =?us-ascii?Q?iAMUAbySqBmMOp+bbA8lDx8ivMDL2hIXpW/PGswzRTfrzsep2GD9FuZxOqia?=
 =?us-ascii?Q?KEYk2fuH3unCPT/NEtGZw7De/e8fYtEsSRGHscPlnETNSjhvkWujfdCEQd0/?=
 =?us-ascii?Q?RrEkq+Y/2BjMB2qx2VpC1k5CCrSk/9ZsC3ontteDBW6YwAHen/sWX82y/3Lh?=
 =?us-ascii?Q?I8lQmmnanO6OqzNwTzqUZPEBqigr5pj/CnYiyxrCD9l3q2x8PSWLxB8sIlJQ?=
 =?us-ascii?Q?euDDYKQMV5DA6gkMIlpAXgyqP1XKFWT+krn4gGeRAykVPNe4uWddL3XQIne9?=
 =?us-ascii?Q?8CIiujZRUQCmHO/Owj4iHVa9ZhWtSrbN+GqLv0l6CSsB92ajDTRkgJeXuHlo?=
 =?us-ascii?Q?rxn1Poh+jHl5KYkXEUiwpmRnzP3VUTKTxTXy/j9+WFu6ZadQPJKEZ4LA+MQS?=
 =?us-ascii?Q?OH9E90tS1NF2XbIOt7Zwc20Bx5J/a6uzwpT9lLgi2mtw9KCs7hMDflDrKq1Y?=
 =?us-ascii?Q?ek1elszPh+w5EVDqil2I748bQ0nK93ch5pl2YhZBF5tSWdSZkcUedxHj1aUX?=
 =?us-ascii?Q?lV8oar0hUSzDSrMAQuccGL+Ios1onsE8mGyXWOcY5hWyl4i+0FRm0o4xfN0d?=
 =?us-ascii?Q?kffb3VCy+OExs+UHkWH3Lbkr3VKcdJMero8goi8Ss25rEN4OkNMn2QX1C1e9?=
 =?us-ascii?Q?qRCudeOBhsHfRFrypKbHhqAbPi+kFp75GsnicTog9ypmcZaFp2ICtst9X8tu?=
 =?us-ascii?Q?yemk+j5UcaSg6PZTcIxaOcwvmVCHrhIy1H/qRzq9ceXQKsIY4NxjsWA1hRrF?=
 =?us-ascii?Q?qeLRw8In35BaAm/WS4wmCIWiA52f1qzEBM9Csdx9S7IBLS0qj9tMRN7aEYsD?=
 =?us-ascii?Q?Wycrkb2BAf5vF2R0y98MwKcRIwKUTuQZXVYLRxwoglLEcfqcMCWYcycQx3rH?=
 =?us-ascii?Q?DI5sPK+HOBtLgBuo73fhCZ04HRsak/w9wbVoyu4tpK1spameAVlrP+rg1dh9?=
 =?us-ascii?Q?uJG8ibaLgCDkV+HKp99rRLYROF248yfJdxvL+38b4jq9nhrnwrNIPdxwkj1e?=
 =?us-ascii?Q?2AXZaLjGz6DOXWNbJkiSXiuC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283b6500-c69b-44b5-c004-08d949581df6
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:45.9669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YO2NJtdCnAj33aId9MAE8jjrtX2xkpnD0lM5e92GhOZIV4uT7YKv4/Vi8rhOTWAW2mSaxVZBgRPrq0LtiIhaJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2830
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1:
AMD is building a system architecture for the Frontier supercomputer with a
coherent interconnect between CPUs and GPUs. This hardware architecture allows
the CPUs to coherently access GPU device memory. We have hardware in our labs
and we are working with our partner HPE on the BIOS, firmware and software
for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu driver looks
it up with lookup_resource and registers it with devmap as MEMORY_DEVICE_GENERIC
using devm_memremap_pages.

Now we're trying to migrate data to and from that memory using the migrate_vma_*
helpers so we can support page-based migration in our unified memory allocations,
while also supporting CPU access to those pages.

This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages behave
correctly in the migrate_vma_* helpers. We are looking for feedback about this
approach. If we're close, what's needed to make our patches acceptable upstream?
If we're not close, any suggestions how else to achieve what we are trying to do
(i.e. page migration and coherent CPU access to VRAM)?

This work is based on HMM and our SVM memory manager that was recently upstreamed
to Dave Airlie's drm-next branch
https://cgit.freedesktop.org/drm/drm/log/?h=drm-next
On top of that we did some rework of our VRAM management for migrations to remove
some incorrect assumptions, allow partially successful migrations and GPU memory
mappings that mix pages in VRAM and system memory.
https://lore.kernel.org/dri-devel/20210527205606.2660-6-Felix.Kuehling@amd.com/T/#r996356015e295780eb50453e7dbd5d0d68b47cbc

v2:
This patch series version has merged "[RFC PATCH v3 0/2]
mm: remove extra ZONE_DEVICE struct page refcount" patch series made by
Ralph Campbell. It also applies at the top of these series, our changes
to support device generic type in migration_vma helpers.
This has been tested in systems with device memory that has coherent
access by CPU.

Also addresses the following feedback made in v1:
- Isolate in one patch kernel/resource.c modification, based
on Christoph's feedback.
- Add helpers check for generic and private type to avoid
duplicated long lines.

v3:
- Include cover letter from v1.
- Rename dax_layout_is_idle_page func to dax_page_unused in patch
ext4/xfs: add page refcount helper.

v4:
- Add support for zone device generic type in lib/test_hmm and
tool/testing/selftest/vm/hmm-tests.
- Add missing page refcount helper to fuse/dax.c. This was included in
one of Ralph Campbell's patches.

Patches 1-2 Rebased Ralph Campbell's ZONE_DEVICE page refcounting patches.

Patches 4-5 are for context to show how we are looking up the SPM 
memory and registering it with devmap.

Patches 3,6-8 are the changes we are trying to upstream or rework to 
make them acceptable upstream.

Patches 9-13 add ZONE_DEVICE Generic type support into the hmm test.

Alex Sierra (11):
  kernel: resource: lookup_resource as exported symbol
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: generic type as sys mem on migration to ram
  include/linux/mm.h: helpers to check zone device generic type
  mm: add generic type support to migrate_vma helpers
  mm: call pgmap->ops->page_free for DEVICE_GENERIC pages
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device generic type in test_hmm
  tools: update hmm-test to support device generic type
  tools: update test_hmm script to support SP config

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  20 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
 fs/dax.c                                 |   8 +-
 fs/ext4/inode.c                          |   5 +-
 fs/fuse/dax.c                            |   4 +-
 fs/xfs/xfs_file.c                        |   4 +-
 include/linux/dax.h                      |  10 +
 include/linux/memremap.h                 |   7 +-
 include/linux/mm.h                       |  52 +----
 kernel/resource.c                        |   2 +-
 lib/test_hmm.c                           | 230 +++++++++++++++--------
 lib/test_hmm_uapi.h                      |  16 ++
 mm/internal.h                            |   8 +
 mm/memremap.c                            |  69 ++-----
 mm/migrate.c                             |  25 +--
 mm/page_alloc.c                          |   3 +
 mm/swap.c                                |  45 +----
 tools/testing/selftests/vm/hmm-tests.c   | 142 ++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 20 files changed, 402 insertions(+), 272 deletions(-)

-- 
2.32.0

