Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02B3E9E74
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F5C6E270;
	Thu, 12 Aug 2021 06:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753586E255;
 Thu, 12 Aug 2021 06:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9ozVGFNQ9tWe0eqqCoOZsXWAqYB/j2TRNVSrXi9UXk9CXzz6006H1qWvbRg3fQEQw2HwAx9yxvrfshXQSTEHTgWzvtN15b+kXsvr1s8Z0OzsvpO0ixpkCdY0KETyKPJIdi2PtYfONpuXj/FxFosKd6pe1N2+FyxPyaIWylCGyUHYf6CrQTEYqFu1TU78NvL+aoHXD2cfJlBuBNFvhq0kXJq/sQvvRjxP946y89KbVxkkyQjfnBwA0x9Zja9eh6PhB7gGgq4pqIV2toduo1CXsMHU7jM540uAMnjNKie4Fv5Cn9JRDGNixG+98WE3MMBZF5LabtlyKqmF7s/lTpmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQB7xnncUqS3niqFYvWgHATVMbnD7a42rBhrzZerWYY=;
 b=FqTLh9Ot2ijWp/TsDzvGKSogL97yClgyBki9tptR7pWxtjT5GyNVprQNJyV/RXD5XQHco14ca5BdavVx5ZkOqNUImrEz+kI/wgN0sdc0AOwbgjb+hzp5Nl6WiZQK/91Vm6hfknO6rkzb10ItH6LG/SlJ5BY4H5Ovs0t8RrRrtYusgq3WsFMjScxCQDkHK5vg/PYjb07W4voVnf81PlB3BGJNnN2U+55EXN6b4S3Na/j2or6YD6XyhoM3/FVfxyRJk/4R7Ol2GkxLP4WIKTeAAeQLWH2YNLcXCyl1XsprqfyG5XGrGAUX7mM7Bt0hXlhJUrdKn7JGJ6uix6I5j4q7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQB7xnncUqS3niqFYvWgHATVMbnD7a42rBhrzZerWYY=;
 b=P8/DMh8iKqlUE0PAJ4a8+jym0avVKSWNU1wa0y05k44dplMKEOzbqZ7WwY8FHy8Lv9+KqYutUCukd4Nuta9FGvmVPPAxwTz88mPwXbXos1MupfoDhYaEx6gvICt1oRo3OWjBunOWKhwEG5iDu7wVHnV4i0meUOt5gdfXQbvRYkE=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Thu, 12 Aug
 2021 06:31:19 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:19 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 00/13] Support DEVICE_GENERIC memory in migrate_vma_*
Date: Thu, 12 Aug 2021 01:30:47 -0500
Message-Id: <20210812063100.31997-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67d11d20-07cd-493f-a24e-08d95d5acb65
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB457478B0503B50F08E30C0BDFDF99@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfjOxq478xeh7Q42UKF0dV1zfeEsu10vwo1VJwL0QLIR5LkcgD79eAj0zu0q/CNfueyrbclXx1l4ZFv7ayGrKCMhpc0KUfmZH/f8HA3Bj9IZdUuJp6EtsKBI/QDX6ulJX3FwS1qyBqxtykSY6E1lpdpvrjN20eCLHmkTTBC25v/pvPoVn+mZvKvp86YMTf3qckj7WpCPutAioymdoI7fsUAaDwM7g5ELW+pzQ6aJWUZvhhDogRFpjqbCCewzWIpeYu8dD6USHRM6uWKsTVEjbDBanaRDWEV6MtFZPBAoU2G3QYo3R4UU0vHBlLVGsOeov/06ASU23jzejhe9icOFkRndpaYoUNpJskdDFVFJ5KUHp56ScGuh9ppDjuYt0TjmV7jZ/ERaKy0G3gzxQFviUvvBbt9vESR8ralChkp5e+by+K9FmkpR+5l1QYjfLRiBJXzflR6j78oqn8aannlbr5AfrrvfNtfIgERQ4F3MohSW9bDwS+lhlZOiXvGhnJdvpRWjDu9N+pHluJmGrYCIVVLtL/ja85DjtW2IbOfpkY/NcTdnYrN7s9jK+4bUFW5yMJspxM4DGaRPqAGzbgLzCNpvjdato1Npp5F/fa6fIzCV3h802U9BvBLFNhPTCi62N//aFdkihb7fimeQCzE0Y986nQaTfBGEcgu4/tvGLoxYi3sdYbiTZi/mWC5HHT285nv98Rj8BKL+JhZSowhk16Wh/gzkCJZKolP0ATPAVXmZv4RPf3NjZNgQtwgWPZuzODy5oLQfkMgLcGYydsqVZIDe7Fe9kw+IEuex41ZQWJdeuM/mA/CA6gaymI3VEoNV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(956004)(2616005)(6486002)(44832011)(8676002)(4326008)(52116002)(7416002)(966005)(38100700002)(316002)(38350700002)(26005)(1076003)(7696005)(36756003)(6666004)(8936002)(478600001)(66476007)(186003)(5660300002)(83380400001)(86362001)(2906002)(66556008)(66946007)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rJoSk9uhJ+9HNtWLPdstyqFwgPFuakwGhPpwrXi1bSN52F5Q83GOM0YLbu+8?=
 =?us-ascii?Q?om6dXP62+CWGUV/HwA7qEVOkKswA7EQr/cmtWQ4JpTFdRpyDEyxNBw/vxybt?=
 =?us-ascii?Q?1ZY9owOIsBRqk72q40sQlxaxbZhhogLr/882BomXIneCh75zWSwgnrwDOmfA?=
 =?us-ascii?Q?qnLkgRZHF2rpO/7hxzXaPmLG6yTXPZaFnZ1nOFBPIj8U4O/6Rn1JoE8wgZnr?=
 =?us-ascii?Q?Xf+HP+Plr9CN+gj2OQ7fE7Dcur+Pjn/oXTlQUw7HwI6Fr7sxaL0SvKzBHkkM?=
 =?us-ascii?Q?RMLr/yStG6lJzCU8//SAbr1DrLpbnCvMxzaCuBhYtKhnK4csbcqy+NLRruyj?=
 =?us-ascii?Q?K1sW+nD1APiRjvQ1zBafbUpCBPZw+0l9rhpb8W9GI/pDfh50btbTGbrrwRAR?=
 =?us-ascii?Q?EX7cXPQ+t+PPqmB66RWyRJz9jXSAGAX2NM/acZlM1dDYqo1JJzTzZ71UiR7U?=
 =?us-ascii?Q?latnGfnl9ZefvW8yc31srF+kebfrKnxf1gKWxmX3lOVctniOipFcLPNRRyvL?=
 =?us-ascii?Q?EXGaHb7cwu0Q5QMof+4Xet+UZnz/7neD3j3/F0fPa+6efhlhRA15iuI46r3y?=
 =?us-ascii?Q?i1c9ZL7k+IjucLPiKSYS/Y/T+zQXsN43qOGEtoaq1R43yWidmQod3I46l98T?=
 =?us-ascii?Q?54GG4thrWYXdgx0+N4IEzk63jAl3zpXrngqq+nocluO4QTZItrQghCA9HR6z?=
 =?us-ascii?Q?MTkAFTH+4TFOiO8c4w7rxtttpu2/XdQW+udBx51QK/y8JfZF2DQVJEOrxrIj?=
 =?us-ascii?Q?V6yMoSn8GHAX3mqbH7TlNhdgk7LsTXa+7hV2+SuFK3MblAGtcodp0pnrMrmC?=
 =?us-ascii?Q?R0CEGOdvhv4EhVqiL5SBJa94wfoCrvApJVCXDMcxWNLSxK+a6YL3CueCX54C?=
 =?us-ascii?Q?NHJmflvl579V8Mrf1j3LQN2Le5h2+B0EOdzyQhh5xeze4yaiIDMk+yuBq3Ry?=
 =?us-ascii?Q?DDAaTgb9bPBAVw5P7KE202+jqDTvYnIwz+N7qkvDn1aAxSaigRWyNaKbkglD?=
 =?us-ascii?Q?n9IUsHxLvDsH+MWhX3Vh8UUHY1XPSOJkgwXxGDbaGdqsJVZFpJTDPRiHGNCX?=
 =?us-ascii?Q?V5b4aUAYVk8odVsOjNngV3t5pVSj710g5FhpcoKxJ09BQX2jKJDBoAE8mCDr?=
 =?us-ascii?Q?DJ/v4LhmUPYjE5GhUiX730zjGABlHZ+gqXrTqUiWTJovVC7AFwrfc1mvu7je?=
 =?us-ascii?Q?0GRNVhwt/k451Xh8BDlN2g37Wr67i0PHCt81csMaCjWciLPCaQvx/8fAyFTg?=
 =?us-ascii?Q?Jrh/nTjNtBMHy5tmISNMPhv+w7SGQ2NxzN+pQR7r+rCrzimCiymk93YXL2HZ?=
 =?us-ascii?Q?JvkSA2ZqO9zZ5/034MDag/73?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d11d20-07cd-493f-a24e-08d95d5acb65
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:19.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qga3sM2fUKZGV/P/sPblfF3JsAdrmYPFKCW9kY91gzF+hbz00d2V1mkhB4vSAB5iCdQTZT8m0uieq66qFnEX/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
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

v5:
- Cosmetic changes on patches 3, 5 and 13
- Bug founded at test_hmm, remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE
at dmirror_allocate_chunk that was forcing to configure pagemap.type to
MEMORY_DEVICE_PRIVATE.
- A bug was found while running one of the xfstest (generic/413) used to
validate fs_dax device type. This was first introduced by patch: "mm: remove
extra ZONE_DEVICE struct page refcount" whic is part of these patch series.
The bug was showed as WARNING message at try_grab_page function call, due to
a page refcounter equal to zero. Part of "mm: remove extra ZONE_DEVICE struct
page refcount" changes, was to initialize page refcounter to zero. Therefore,
a special condition was added to try_grab_page on this v5, were it checks for
device zone pages too. It is included in the same patch.

This is how mm changes from these patch series have been validated:
- hmm-tests were run using device private and device generic types. This last,
just added in these patch series. efi_fake_mem was used to mimic SPM memory
for device generic.
- xfstests tool was used to validate fs-dax device type and page refcounter
changes. DAX configuration was used along with emulated Persisten Memory set as
memmap=4G!4G memmap=4G!9G. xfstests were run from ext4 and generic lists. Some
of them, did not run due to limitations in configuration. Ex. test not
supporting specific file system or DAX mode.
Only three tests failed, generic/356/357 and ext4/049. However, these failures
were consistent before and after applying these patch series.
xfstest configuration:
TEST_DEV=/dev/pmem0
TEST_DIR=/mnt/ram0
SCRATCH_DEV=/dev/pmem1
SCRATCH_MNT=/mnt/ram1
TEST_FS_MOUNT_OPTS="-o dax"
EXT_MOUNT_OPTIONS="-o dax"
MKFS_OPTIONS="-b4096"
xfstest passed list:
Ext4:
001,003,005,021,022,023,025,026,030,031,032,036,037,038,042,043,044,271,306
Generic:
1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,20,21,22,23,24,25,28,29,30,31,32,33,35,37,
50,52,53,58,60,61,62,63,64,67,69,70,71,75,76,78,79,80,82,84,86,87,88,91,92,94,
96,97,98,99,103,105,112,113,114,117,120,124,126,129,130,131,135,141,169,184,
198,207,210,211,212,213,214,215,221,223,225,228,236,237,240,244,245,246,247,
248,249,255,257,258,263,277,286,294,306,307,308,309,313,315,316,318,319,337,
346,360,361,371,375,377,379,380,383,384,385,386,389,391,392,393,394,400,401,
403,404,406,409,410,411,412,413,417,420,422,423,424,425,426,427,428

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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  22 ++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
 fs/dax.c                                 |   8 +-
 fs/ext4/inode.c                          |   5 +-
 fs/fuse/dax.c                            |   4 +-
 fs/xfs/xfs_file.c                        |   4 +-
 include/linux/dax.h                      |  10 +
 include/linux/memremap.h                 |   7 +-
 include/linux/mm.h                       |  54 +-----
 kernel/resource.c                        |   1 +
 lib/test_hmm.c                           | 231 +++++++++++++++--------
 lib/test_hmm_uapi.h                      |  16 ++
 mm/internal.h                            |   8 +
 mm/memremap.c                            |  69 ++-----
 mm/migrate.c                             |  25 +--
 mm/page_alloc.c                          |   3 +
 mm/swap.c                                |  45 +----
 tools/testing/selftests/vm/hmm-tests.c   | 142 ++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 20 files changed, 405 insertions(+), 273 deletions(-)

-- 
2.32.0

