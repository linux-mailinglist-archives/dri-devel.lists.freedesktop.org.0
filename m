Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CC4098A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B0D6E1CD;
	Mon, 13 Sep 2021 16:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0606E192;
 Mon, 13 Sep 2021 16:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmZmtJAW4qSGfB9sBwryBMZWicNA2jShdFw3w4/sdCFC3aj6diM3nWZSjBHUR+WBdkuExhRhkldeu3CzA7r6gdRqdIQUPUi/AYwI2l25589W3jMMZjev4W3X3h/Kc/s2SThOMYTFqcZnSyQMNz+WMSdjOc2sbNwLtMrEWhCltSMvtoGGGfW/QBLjkx7Qrvs8U6JL6INwPtRaUajHAEHSa80KvuGbvFbbPOIg4NwflBRU8PP6WNoGpKiycSuUSXK+deEkoFUFXJyiOiZtq3jwooda7UbXrS4jqx68uegp6cIepscbaL/kYgFyl2zJSx/enCJv+M4BAoJR/UMjTGTV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=05Bp9OSAr7Mw/AFXatBjOIV9Wa/BYkUxXuE4s+WM7YQ=;
 b=Dq4aLgLfDRG1jic89K8bDOKDZHRqGkHQhfvk3i5BBZBTpFfVe4JohPorlSB9m0SMOq8xET5D9TQLCDq1xVvyHWHyt3csu/yIEQpndYu0VocU0QJ55v7DH5b2wY4nn3uKQAwV2UwhM8rKBFMTuf3A5okT3Dv7VsRpp0Yf6W3KS5Ljr8TEeXZfzGaHrDzxyrC26b9UpHhIYBIuD3GMLjc0xOajxaOTX2elyPkT/MxNfCkwoBVNGI/9CvBWYBSeGCdUhJ9YDzdK89LCNJGjX1vayIlm0TSJsTgsS4XHswoSZAmJSRm2CKC05iPAFaQm34PvFwU0GzAz4/gnLDqUIP1vMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05Bp9OSAr7Mw/AFXatBjOIV9Wa/BYkUxXuE4s+WM7YQ=;
 b=sWEcuB6X0YVESIFRE8L7zf06BFVAzPY1RmjvBBPfAAGeIweHsa7IRSVl5ageSKauwogLQyUsL0BEA06I2He3QNN4q0wlT15GtkTwf6OuqmYr8movG3l6l5JSZ/Flx9Xu4Rmk6Yk3H4XBqHzh5VoN5QD0LkMQSrCqRFd+mMP9nu4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:16:15 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:15 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 00/12] MEMORY_DEVICE_PUBLIC for CPU-accessible coherent
 device memory
Date: Mon, 13 Sep 2021 11:15:52 -0500
Message-Id: <20210913161604.31981-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b19024a-a994-470e-3d4c-08d976d1cf8d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27671874B9299C6B399706B0FDD99@SN6PR12MB2767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgbvxjE2nkEUTy8bU2VmdbOaT3Yq4r59xuVT7hAaDKqHtCXp1PM5PgkAuUFFNugVeuNNiCf53DxJ5c4FHfZaIjleHGH5TztN7PKmQXEqh4Sc+iMzwVgbuVqlkyFhf+wD5Uo202xeSwTpHKBfhZ8r8AbbJ55/V2i5aKxUo1lgvq2grzO3Ah5LkA74E3gyHPYYhJNf6fI4bV00IYWVU+/ph7Vm8pnTj+3uruwQeyV4xZ0SiO67kDBaU+4ZMPpRMuISknitiSD/1w0nZ45DkbvSVeMnSRwytdYiRPtmusbcHN9LzxLcRzFtgK7CKGKGNhBknbBQGl+ocUQaX59oFH7F55JP8KcDp/TPIL8/7KeAJS7GuHiSJ9Et+PL4CG639nZRpe9NluPmMi2qp8NVGaVndj+yplcRTz/LJK+plHJFf06yuMseax6IetjzjSKixu+i5qquQEdz8nt1W9gsuKH4hpleTBDsohmF7lkXvpqXy74i2+6OQPxrqyuDHr4DM9y0ilJTC3JnvsT1Igs15RpCMqPmr4WlPWMjgW5PowmQ4b6AOzbuQhP0pbInPReHTwjAxpWinG6hksE1hml8gCVZyYXsuXUwKSRfzPHutQmo1P7Q/v3yVR4tPA8fvXhAxQJ2GUaVHGWL9rTJYNEoyoNQwfkuJr0hwoc2Wq3+0MSbxDXhRe4mOsSyfcninLz9RgWHZ1qvN/LfI2gnQup2TJ4/PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(1076003)(7416002)(966005)(86362001)(66946007)(44832011)(478600001)(2616005)(6666004)(6486002)(52116002)(7696005)(956004)(5660300002)(316002)(83380400001)(4326008)(38350700002)(38100700002)(8676002)(66556008)(66476007)(2906002)(186003)(26005)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+eJb54NG5Bh4VFDstm4mySQSejzvYFDcjRqUvEsBwyUJ+x4To2d7NC3VWSD?=
 =?us-ascii?Q?JiUrM47vfaYBDVTvsgemb2OB8mEvwP6eNgzYCkr470NjyQWBg9tt4LhyAyw4?=
 =?us-ascii?Q?y84qjXrQZHZSUQDh7umeq9xLe75GUHkvNDjl6gn97hMztNd/jeGXI34VOFQT?=
 =?us-ascii?Q?up3ZgU2U2vxq3xrwsMtAVJ5cK1Gj11Q1By0ZGF4TcckA//2XY0h5kPJDIZIe?=
 =?us-ascii?Q?qpdKY2XQPAEa74T3uvswg0ZoeBt9ezqqNNxVjYOIpHWGsw5XMMtRk6cPIpxB?=
 =?us-ascii?Q?+ZfNL7qxaP2V0B0Nlw/GdC1DeqKsXnfK/GPLAckfxlnWSGoELc/SEdrOcJEs?=
 =?us-ascii?Q?bbeWmfITXXY+d0Im+L3BmX3Ng2UFg3jUhD130chorc+qifYYinrbi67Ohs+b?=
 =?us-ascii?Q?CsA9U/gRHoplS/oPWqH0Y1Nv+Bo+Km/7rCs3KUnO3YIpL7GNW2tO81gJ+vZP?=
 =?us-ascii?Q?gwCi5hSZv1BmEvm5KyZRCAwayUsb+Cj2jQS3MUyY5p75qnDS+Jtxy+S+P7UZ?=
 =?us-ascii?Q?M4bYayZdykOAbT477vF8hgkyQI8osqQF6ksBk/hNZXFiaMEv6utBIIZFTx5J?=
 =?us-ascii?Q?2k8eFbigb27rZnTLuhoheu0VPVnkcsko3tnK1/YT8PWAHx9bR60oDkK3pcA6?=
 =?us-ascii?Q?f7chZ9ZZrfMjouotOH/IcBTBlAYp4rH8jiIzrCeUEXJkTY6jgxmVwA0nY9u0?=
 =?us-ascii?Q?/fNkpoZ9fSowx2X+SPk1dCoH1Q8E4VKndSEEskwvsUQordyNPXl58aoZ15Mw?=
 =?us-ascii?Q?ulUCd9OQk7BQDgSZbPxA6sER314sssJzZgYO2mTfp0lUsg6YkpJxm0Z7Oeto?=
 =?us-ascii?Q?UaaDE00BS7OlLaKQLcafM7oXidpGdi0HJ8u4onBdK6C5magbZ4haP69633RG?=
 =?us-ascii?Q?TL36WZtiMfjGn48I2HWxTAwFypNN2/Ks+qiCSYLvuj6pQ2h8hVimX36QOpuU?=
 =?us-ascii?Q?C5wgMUKrKVcfWBeDJKIqdmVF9wpqqkv0OUUaLz5mK2AjIIn3KXikEfjrh47s?=
 =?us-ascii?Q?7Tem5+5TLNGeHEd7v74iuuKZV26dZMVfJ0ZK5VktoMoDQ0ILyGMr/VSqruJr?=
 =?us-ascii?Q?vsH7K+fgQhBVrFCNJM0sL8gUoUlw/mxDUelbj/IqY/yATyHLnH5ktbdVrJFQ?=
 =?us-ascii?Q?DGIMY2XhgdRUf9ndbU8NHvyYNF/Bwlpr7vDNmG92L1PlalGtjRqTHe31zGRN?=
 =?us-ascii?Q?yD/0jLSimzTThYylrxLfNQbMeXgbl6RtOM44KAW9ai8EvNmh9AK7sgmeyhfx?=
 =?us-ascii?Q?KTq70qNg2E06f16EkKNtUhtmnLC8qCIXPWMToYsV+YtQgzQjH4fbdnv4z7HZ?=
 =?us-ascii?Q?aAmnhNsF/AqXjR0iP6W87gLZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b19024a-a994-470e-3d4c-08d976d1cf8d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:15.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlB6CdFxitlr0yCZCU2+MFezIn2ZPmNtphte5yoG2kug37UISFvhDNhl33oZ/kMcZLbQTTYMz2FeSu9YXOLoyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
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
AMD is building a system architecture for the Frontier supercomputer
with a coherent interconnect between CPUs and GPUs. This hardware
architecture allows the CPUs to coherently access GPU device memory.
We have hardware in our labs and we are working with our partner HPE on
the BIOS, firmware and software for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu
driver registers the memory with devmap as MEMORY_DEVICE_PUBLIC using
devm_memremap_pages.

This patch series adds MEMORY_DEVICE_PUBLIC, which is similar to
MEMORY_DEVICE_GENERIC in that it can be mapped for CPU access, but adds
support for migrating this memory similar to MEMORY_DEVICE_PRIVATE. We
also included and updated two patches from Ralph Campbell (Nvidia),
which change ZONE_DEVICE reference counting as requested in previous
reviews of this patch series (see https://patchwork.freedesktop.org/series/90706/).
Finally, we extended hmm_test to cover migration of MEMORY_DEVICE_PUBLIC.

This work is based on HMM and our SVM memory manager, which has landed
in Linux 5.14 recently.

v2:
Major changes on this version:
Fold patches: 'mm: call pgmap->ops->page_free for DEVICE_PUBLIC' and
'mm: add public type support to migrate_vma helpers' into 'mm: add
zone device public type memory support'

Condition added at migrate_vma_collect_pmd, for migrations from
device public pages. Making sure pages are from device zone and with
the proper MIGRATE_VMA_SELECT_DEVICE_PUBLIC flag.
Patch: 'mm: add device public vma selection for memory migration'

Fix logic in 'drm/amdkfd: add SPM support for SVM' to detect error in
both DEVICE_PRIVATE and DEVICE_PUBLIC.

Minor changes: 
Swap patch order 03 and 04.

Addings
Add VM_BUG_ON_PAGE(page_ref_count(page), page) to patch 'drm/amdkfd:
ref count init for device pages', to make sure page hasn't been used

Alex Sierra (10):
  mm: add zone device public type memory support
  mm: add device public vma selection for memory migration
  drm/amdkfd: ref count init for device pages
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: public type as sys mem on migration to ram
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device public type in test_hmm
  tools: update hmm-test to support device public type
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
 lib/test_hmm.c                           | 247 +++++++++++++++--------
 lib/test_hmm_uapi.h                      |  16 ++
 mm/internal.h                            |   8 +
 mm/memcontrol.c                          |   6 +-
 mm/memory-failure.c                      |   6 +-
 mm/memremap.c                            |  71 ++-----
 mm/migrate.c                             |  33 +--
 mm/page_alloc.c                          |   3 +
 mm/swap.c                                |  45 +----
 tools/testing/selftests/vm/hmm-tests.c   | 142 +++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 22 files changed, 451 insertions(+), 256 deletions(-)

-- 
2.32.0

