Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DA39E89D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD096EA07;
	Mon,  7 Jun 2021 20:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9A46E0BC;
 Mon,  7 Jun 2021 20:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldy0JvZCuE/s/6414X1xfGz3vN5vv+VPajF4p0T5gDWHVTOa3cFxvng+eCBVuvlUXcIKi2KvV44LEy1x51Dm2e/f7hRNY0H3Tw/RnZ2ZBjaBUPA10GahIlUqUdIkPswKf9sU3rqE4AX6lOXwZT22M1ftxsmehFxb8k8GrchmLzlFUnCFZWRwg9auFK/3PqPr4YesPEcwotpYVUXv2CkQp/sy+2XCuHHBxaD3R3T/DhykOKfOchJKF3i5ze/DFnKHrSNxjj+8W7QTQjQGpp/UF0MFo96C0clA202fhH2QfhN5UiIPJABHutvdi4pmlc0+N31oPQy2uP6to2stXpPwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en2AyBsY+Ajbf48Yhi9hKxrCO9uRhkFUYILgkBPy1bk=;
 b=YAEFEVb7kfoBW/U+jJTeWBLnEmX4wN5kjeeXfPNXn6zlHSgJtQ5bCLbhJ0/KdqXR/vVZCOrBZzzg4Q4xFeJE0SP4I0T8byIhoC6BmYbkADQPwsv1BQN+Ez2BIbQOO6IDgm1ziL0iiMosQzqQypgNf2ZmugbsgIjvrxoeU6QCDZjzNumhQM7/GOzp7HJKoLXQ1cOv0+YF+LOfhhKzglGiNDdYm2IuY/bTn4OLLOzjGPYvsf/0vxFSmjrieNgv2LxWOTWGOtjq41Pop8KFBY0lRwDMam+el20AtiaSMSspll9T5ajskTWpiXCnuRTNNxhdJ0cPclLSKSK4KOGyWP1/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en2AyBsY+Ajbf48Yhi9hKxrCO9uRhkFUYILgkBPy1bk=;
 b=XfdKIHjtzaGAYKnw4habKgtU7jm3qW75O2qWxJgsLbkf4tTFnpIG/0BC2jZwvimOHrH5ZhkOEVQEwJp2MT2h618vQtsPr17m9bb+1NuKDZ/caSMDnLBrEsYm2Shh2SFWTnoql1B6d7EDGxvRub70S6QIh+0pnscstPVjiF6Cbj8=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:39 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:39 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
Date: Mon,  7 Jun 2021 15:42:18 -0500
Message-Id: <20210607204226.7743-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 818c779c-f13f-449e-f42c-08d929f4ca10
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44955C28679FBBBDE1E4A4BAFD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlgYuoBeni+X2b+GldIC++OotaBKKmDdcNxjbiYjxsw9coh1ZNIDNL8juKgTMNZIsep/8n+p1odP1d1VDnyzOctF+zUabLZfAR5l85YGy+EfbmhYO5MMlPPs3WS2vx5eNbBhvTBycc3U7XhkCkUzUe59foeMuPLNq0gfENmyUKTD2WVeCWfcehM6cI3zZ7kb+g3eqH6obI9lP3HaeT6OuwBvk64PSRrt2K8p/rS/KftVmRcs0w+t7XjhlOrla50exE0nhO8sHA0RgS9lYvb//py7J5pmTsJEqmhFJf4oNBOzCxGmWXB6+mGXh0dEMMiPoA8kvEZ9vyuZZST93MPpK7Rlde5PVqJpztf9PRKiEQcO7VvF01sp/U44jpM2moYvTVY2sgjEKeHixajOqRWyefw379SL8UQCRYV0T33l0wL3TMxYZASYPfxItwuo6Q1tx29i0u1wwKJsYYfwj25zXd0pss0cDpFbwCoUIxU8Sz7zverpQQncemfXH24vO5DNa7znAJ6XHxH12KWu1y2/tCZlDAVN2qslUvpTCrNfxyHQleFE3g02zG98YPRCjOu/7vczR6yX4N+118uQgZ4bMhKT/gUyTAGm2LrW+vwSO/viEgXw1wXye/P68nreh8KGLEtQEamEJlfWkyvph+5IDMBewDwwHU9Ad3mQLilx9OC9bcH0x2X9Gi1SxcUnSqGm7bud+TvFK4yy1bPa7Dttlu5GJgTLWtmUMoWWjGqwxhYsnpdQXGoBPWCrqkSdbApS3mtT1rJc5JH9GV7+mB87P/7bT95qBsXd3bbzXQ1YZw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(966005)(36756003)(8676002)(38350700002)(86362001)(8936002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2DCkYDlaPu0BlBY0xG1iKa7gZxzv6SuyPl/r0WCid/OYgO4GGw/ZTaSYJrrG?=
 =?us-ascii?Q?GNA+P1fd05Xz+4lj06cb0nBzHGUK7ZrpNIpRm9a/y7Jy2E6XBLkz6npK8uqG?=
 =?us-ascii?Q?+Z7+ddHwLCAvDz3vHYRShIJFaEsip7AE7dmM0LyttkKgnSour+psb59atB0c?=
 =?us-ascii?Q?OnrzMXe4diqXcGruSxYtNp2el6Hdm5OIe4FvX68/5H6ie+ek7nyIuFxyOxxZ?=
 =?us-ascii?Q?gCP7wOtf16A+W87gR7RiLdntjO0QJOn3BhchwWeCo1SBETAL/gpLNRJ0BesT?=
 =?us-ascii?Q?Uf9+K1LLWGwHsJNU50Epb6lzTvuvQpOC+BKQh605B7eysLcaNHwNsMRHBw68?=
 =?us-ascii?Q?zn/Qxb+XYJqhZWnE6Q8zkoaykauMSl/yeYeu34WCFy/TG9jLRYZS/9Gt5PuP?=
 =?us-ascii?Q?+/ZbC85v2AkRd/a7hS6H9oB31j1e68AiPTtx5GdSiLIiYQUNdCvbbMgOVExT?=
 =?us-ascii?Q?y5wGf3aL9KsNBowMRauvrNU3QaniN60qm43puwFXwdu5xnSOGLjRPpg9kMhU?=
 =?us-ascii?Q?byfrNavpliX2uvGHB1JlxbP+jDB+W285y5tHkbGUUiWNxeNR3CkjA7nev/3/?=
 =?us-ascii?Q?gJJOblBbU0+UWTdvtkJk7geVsm6VTuaNuyvA7qodCM4j8r8O2pI/ZYQE4XQk?=
 =?us-ascii?Q?P18G0yBHOu/zfJK6Rif4mJvz3tGxxAMVKFj/mHa0kv48z/n/K+tl5ovnsB8N?=
 =?us-ascii?Q?xPjHnaUAQvcAzESqsCUhxpsVTFUkwdXn6A6vt0NRZd5sKE4958kAEUFClwf5?=
 =?us-ascii?Q?YXQRf8M/tRpMwGWo5TGWozYmQarwyjP1HxVMgQyEHG+9Bed+fQnP0TGZH9Bs?=
 =?us-ascii?Q?2V8J6d+EKguDRnIx1KWl2WjNIyVKfci8NTt22pAqjQBTGYS+Vt4gpDp39vSa?=
 =?us-ascii?Q?TvjjNuegjJ1NuKzn0azLHJS++4adwGljvwQ4RbdtM4KUv0J8l/Iye1lnPzDy?=
 =?us-ascii?Q?9vW6VPGD4S6uy54IPly5wy2l0HrD0+vL8mdjdCpF2kiVxBD4m1oroQrk16u+?=
 =?us-ascii?Q?bNZrXIXVk+u3TvZjlY9VCDB2D9wy5h2DlgKAwKi6MDsjlH37rsbyRZ/n4NF6?=
 =?us-ascii?Q?xQ+EhO6Wcv0fuEojJPODqFg4NVraR2XzIFG9L6w/CTdMfhMcf2dY3n+yqBE/?=
 =?us-ascii?Q?hv/T+6rEIipoRU1vuZcv7UqC4WsF0o5o9W4crB1RAzs8PI7HPsBF1We9Zyt4?=
 =?us-ascii?Q?A7J5MmOhTZFu6NIkd90MrdMCCBxj5YF/8Bcmh2KMFVulqSpxlfGXTOmtPdmj?=
 =?us-ascii?Q?pUmxw/SzMYW07d086SavtsOxviFdByMQE3Fsy+M1EIDpGsRfy2UIoKc2hITc?=
 =?us-ascii?Q?KV+B6kXeqf/rPFVFF9jZSJ99?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818c779c-f13f-449e-f42c-08d929f4ca10
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:38.9827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV0NEbS7Ha3mvxDzoaJc7p9B/dCFF1AfxCYUOfmQgxk4YdrPjeQ7s+VmlepIixWdX2s0cTQmwzar63ozOZOCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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
https://lore.kernel.org/linux-mm/20210529064022.GB15834@lst.de/T/

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

I like to provide an overview of what each of the patches does in a series:

Patches 1-2: Rebased Ralph Campbell's ZONE_DEVICE page refcounting patches
Patch 3: Export lookup_resource
Patches 4-5: AMDGPU driver changes to register and use DEVICE_GENERIC memory
Patches 6-8: Handle DEVICE_GENERIC memory in migration helpers

Alex Sierra (6):
  kernel: resource: lookup_resource as exported symbol
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: generic type as sys mem on migration to ram
  include/linux/mm.h: helpers to check zone device generic type
  mm: add generic type support to migrate_vma helpers
  mm: call pgmap->ops->page_free for DEVICE_GENERIC pages

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 ++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 fs/dax.c                                 |  8 +--
 fs/ext4/inode.c                          |  5 +-
 fs/xfs/xfs_file.c                        |  4 +-
 include/linux/dax.h                      | 10 ++++
 include/linux/memremap.h                 |  7 +--
 include/linux/mm.h                       | 52 +++---------------
 kernel/resource.c                        |  2 +-
 lib/test_hmm.c                           |  2 +-
 mm/internal.h                            |  8 +++
 mm/memremap.c                            | 69 +++++++-----------------
 mm/migrate.c                             | 13 ++---
 mm/page_alloc.c                          |  3 ++
 mm/swap.c                                | 45 ++--------------
 16 files changed, 83 insertions(+), 164 deletions(-)

-- 
2.17.1

