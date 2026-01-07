Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB14CFCCC3
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9817110E57B;
	Wed,  7 Jan 2026 09:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oayfklxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D433210E57A;
 Wed,  7 Jan 2026 09:18:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQG1AIIOXQoFdWwNyRPyKyFzOJZ4qQFx+WET8mmupYTMUBCPvLBixjfsVdlixSH/Yiq1VzTWHtixCoc/iSWL6yvcct3IyrnIsPbnAhmLTgkG6lWsd836QXgxWp0f8Yronicc5A3a9cOhi1FF4kUdxAX1hX7+/pG2oQ5URD9l3/N1mNhkb4a26u+jCILfnphoGf/u1xtFBgP1JY/X0tsqklTB1jbGzAcq0/eJ5Nl2cleUm0/c74SPKPrvkE1HRIKR45vER1/oMxaCNFSngB7p3xgaFwn/6nCZVnOzPFQruYDh/oQTdANJRW+0nN6JzWd+EFn4n3F7bafhm/Y7uwFHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhknLqz+dspdMBKvGag/XA1l5jaLYWio94HP1a8ZjVo=;
 b=qkH843nwvBriypMywhDMbrtYg1NpIjH7zyygl+T6aWH9qxJEo4hdUZ6/JVYxAh7mCYTNTVf9BzpK3ool4yvSWSEjnuR73x/1IPI7XbAAuujs4NbTUAvs3MziTrJ82sss4Bw1q7MGtYR1c9YyiKdMeAKDeW/SjMjXuuEKRbpo6VKjiVCmPraDrGUZnziAzAhlKm4JUSKv8GKZ73H4YdFw6+8GN8ifsVhlsUAbJ4HUDOR7o5VAMUytoPWSfCU/ZLzGAIo4fi/5rlh9vllNAHiHh8YGqcAOWJRfTl3rT6jlJx36KSGrHDmVtSup5tbycOPaep4QZOjU12eZmwAZ7V50wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhknLqz+dspdMBKvGag/XA1l5jaLYWio94HP1a8ZjVo=;
 b=OayfklxcYfsnJEMtU1rnZpp4o6RvnE3e3G5QKX7ecs0Xb8HUhmsFeabU7AkQHQQiD+FcCCMVXJM+6YvhY72HgxdxpxvRczGYptdcQ8Od3u9rR868NbyofD5L9OvbaYsRKdZUS6a/a5bqlqjEv4NhclCCGSyrw5RBZ5ykLcX3+Ggf9DYG2g/qcd+iMX0u8fID9llcmvRSiBXpLQSbjmzKVvpZhHCB/58uMjwrdVJLnV8bV0ftKNhR1TERN7bnXVQe6u3bE2FiFXwO7gSOzcqW8CMSYtWjB3AGRR0DHjNgS0tzybsIrv0LbM6WA+WDtbzp0OAzt69ZTomOdXD4uyYYiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:47 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:47 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: [PATCH v2 04/11] mm/migrate_device: Add migrate PFN flag to track
 device private pages
Date: Wed,  7 Jan 2026 20:18:16 +1100
Message-Id: <20260107091823.68974-5-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: c757fa64-3c9f-4762-dffb-08de4dcdc307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SZg+8t0edlSpKuAZCRxnTDz2uycNYT99ojCRPVEkmsnZgHPGys8VczRah7WR?=
 =?us-ascii?Q?zPZqK76fFjgCBcxYJct0MChAeDPpqdiHX5YkdtVvHJQkgmY2OUIopXuEFXNS?=
 =?us-ascii?Q?QioaQs1TTTj1Mi0GGZcTe0DxRKHeGXJpvXWS0IXpBwCQJ0pmXcPi4NLkpz2e?=
 =?us-ascii?Q?saLjqCq2oAkVbpHkhN43VZ0ARuDrG8ojec02iTBGbycqlSupTckQP9U1aljV?=
 =?us-ascii?Q?Bsd5z0B2JOMEV8sm9vXDCxuWEXninQGSakRJ+Xtq3RICfmOUGVZbZVTXRSgk?=
 =?us-ascii?Q?QV31vbdw/+ZjF3Dqn5NrH4bdivuk6K29GUwDdJT/WepZ0PpWeftwQpqDRxLO?=
 =?us-ascii?Q?PisbJyHwB69Ep4VibWGiyhgBa5HAEt22BcKZ6j9F/xt44wVSFAI2ZCH7WqDG?=
 =?us-ascii?Q?YvdtFfFP40bjSnXtYTv/o2ZJ64HMWmGRRor+jQuv2EQUHB4MErHX+qh0jzMb?=
 =?us-ascii?Q?zdQaQOtVrPF90HUfl98J/XAXN7cQ/gVmuoKNTSFncCona66PbDcHlGi4DYUj?=
 =?us-ascii?Q?L5LhE3T9SRtQbCgXuw/RA3gRQv6dGoRXQ+SAUflQ6Yxdfv+bE5mxsMK93qmv?=
 =?us-ascii?Q?LytdaOsZ2NOM7hoB8Dd9EXUjZ6SjKHKr02iyf0p0/256ZSCqBnS17KRFLEDf?=
 =?us-ascii?Q?GdhFrZGaexwq+Lgqxtgn9gIjDe85VSofEhEFBHyDnMS+75yEYV63r7knRvOY?=
 =?us-ascii?Q?O9f7TPtG8FHmwgxjETMi1vW/yW8Bz3Ikk/Tqx2bMSO6yRwrWLyziFwdNEWPr?=
 =?us-ascii?Q?d/gHnwC0hm81eq8ezSW329Gb9N7oMlLgaaral65qemRXRjqX9KBGsVPBXSnW?=
 =?us-ascii?Q?SH7qG2PnJNYgTH0WaBkq/JTEeDmAyk0pYT50DqrpZ+mNVqLrm5CVcw6m2uNl?=
 =?us-ascii?Q?EKY256/RmZVg3brR1cm3Qd9cJJFWEcoJfb6GhHsxY3vvPjUk5FuaJSuE4v04?=
 =?us-ascii?Q?Inq0lWshLVy3kHbt9IMZSsLAfPr2OWZM5RnBrTZG41WuT2/9zBOppymGCIYN?=
 =?us-ascii?Q?03v4O9PuKDHQV10xftVG7fdcS/RuHsFvhuLFxyMh5YjsrLtkyiyDTNAMo2br?=
 =?us-ascii?Q?pUWv+sZ2qJtBqNb/8df9zkrmRBO6jQmoey/iLOGHv+GOsH4emC4DwaKxDPc3?=
 =?us-ascii?Q?xymfCr2ItE3ddDFNt50y7YdkqbGBkD8QFPQVgtXd2z/Y7lvBddlUUprUp26B?=
 =?us-ascii?Q?c2enXrf7GO4VpJRTrHenhpevz/gTG7IXYAjS08RzXco4RrX0+LYLA8POUyk3?=
 =?us-ascii?Q?WDbaOHr1OvZsGkNbNFAlOi7iBbw6jaLh2cp+sqyJn8EDV9v0APYA/RuWolNc?=
 =?us-ascii?Q?89iV5y46S00+Qf6gzP56tozZSqepfRlZOenR4j3AEsLp7kue3I9LeDfyID6u?=
 =?us-ascii?Q?9WpryNeaJ5uqEXB1KRxck9ThqdO8zeJ0z7mA4EPJuHth3D6lGGuvJBqxdOGz?=
 =?us-ascii?Q?mycrRx947xzCyGST2/JBIUW2lPbnEL2C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xmvIcnr/+4dpknwDiViapRscU5UeybjZFqVlYG8bdWz93u9AHadtHA6yM58j?=
 =?us-ascii?Q?rT3dj9C89ixkBkiYWcv9KM3pCx4032XYVbOHNRtlhWsgJRoeyHaDP0XZo1Jj?=
 =?us-ascii?Q?mxMPUN9rGif/qMYQ6KxF3LAKg3fChN+ztmCvtpfht2x/ZpsmAFPURPAMyjqG?=
 =?us-ascii?Q?PVYCtax3y/RtfCV3U7pr5V7OUmiF41bURkpuMRle3BKzle3hi/9YAzrLslb9?=
 =?us-ascii?Q?afhrVhcjceby6c3M1O6m91IO0W6uBZ62qvmacfUt5K/BbHfG9qksYFbrDzGL?=
 =?us-ascii?Q?ilXOu/wyIzLrYuv+xK6qLiXsNRViSXPwrjnNRHERQyqU6YlNrgAzcakkhPS4?=
 =?us-ascii?Q?jNmIqTcoTdj4l9D5wa3RGdgQP4DI4BXCzMbJppFV85eNSYb6qqRFjGrmXsey?=
 =?us-ascii?Q?PbDXqCkyCi2yrkeTF1f+rN3zWr98MCt4Cu9LZAfnj4Rd67v7eyjqo8Pjfb7w?=
 =?us-ascii?Q?JA3gh5RV5tDgE2ScCnADzo4d2sMrVpX99G+ev6laBv1uFaAfJd+b0KDeozIm?=
 =?us-ascii?Q?+HgdG57Ctd6iU+Ggrk09LUzgvZR6/TEJL9QLFuZzChvu8tLwUw3kUEDoTjDS?=
 =?us-ascii?Q?7bzWbZpDXQUOoSa8BDw/I2nDS+s3fAcWBLaQl98aqoPfXcIKf+r3tlFUxbmb?=
 =?us-ascii?Q?mM1zvFZTmPvTIMex28j+RlsVo/Fz8+QnQP6cavWBOAua1+Ym1sjLPGOp9vqm?=
 =?us-ascii?Q?0x8bALQxg60YMdAJTlogQiv6b9vZ4oB5COU14CjndE0xY41rblwqc9E6dmV7?=
 =?us-ascii?Q?QDg/vasw5i9DfmjzCRDjs6dFwz0sAb63C+1oKnKqkZ3bLcvP0BNxCa1Ig6pR?=
 =?us-ascii?Q?OmfOmSHgs6sPqNlREydueshs859RTrDFMDDHzvEfySLRqtdoAm2Xek/pD/5L?=
 =?us-ascii?Q?0IepBROUk0BC+CmSk94wwkeQbZ+QFgkpaUFxrkE5o9K+HmFphi1eDxg7HmEg?=
 =?us-ascii?Q?jsbgUWpe14uWw7/f3gS9XOXWfKFg7zaBuUScTJjn3fG34Y3AC1J3Zx06vp/F?=
 =?us-ascii?Q?HBy20juj0HsxNimEs4wXF1FLpP6cEfaqIBpVCgeujI3nt1rbEKv6sbfh7kiR?=
 =?us-ascii?Q?/i3F7YcTmUKigdZfHcojEZSRS7gZ1xcQgy4gAyJHttKe+A3HWPwIgElJjx5T?=
 =?us-ascii?Q?84/78aL2OTf0VquAngcpugcjdp7jjeVt4J+N0MlyezVEbWIpCKMnH69ujgVh?=
 =?us-ascii?Q?PXGRRPFiA+pK1R1R5nnOjpaUuxvanomge0cSUsKcMxK+3HoRTs2QRp35DZ1g?=
 =?us-ascii?Q?vhtkKzBzbCir1+qbrXOGqQQ4lLuXmWYDy6Wlrd1xUO7hUeV6AQanTQaPEY5Z?=
 =?us-ascii?Q?bc4we25ymSqyNs26ZE+V6DepHuCDGVvlDg2Knx5fEstSdxXF0l9YDYiPRMvT?=
 =?us-ascii?Q?xrZ6mSGnNW49d4qWsBKYxez5X60IVq6X5AOxj9mKfNHQOVR+prRtYUVV89u+?=
 =?us-ascii?Q?KCoVYUjfvjtjxp6B1SvO9ZwoaYDhAptrfQjajOEHGNDzoTSLyTVhvKJrKWIy?=
 =?us-ascii?Q?kc/5JxWAWvD/WQ9s5FYBgopxApkPkRSDRkfwE0rdiqjrboMS36ngIMPkMS0M?=
 =?us-ascii?Q?/QukWjMR5G211//6Ge3RwcBHqks++BW2vSAKXspFVJugFrSLxMk1p0me1fHf?=
 =?us-ascii?Q?1r3CqhrhSqiXk6UkEwHds5nonHqeTAr6jdog+664+n+3DgrWVZ6NFQ/4GAJg?=
 =?us-ascii?Q?Cph+mYy4UWC+C+0DvdcvnHcx4RrMCc6QCPlVryEF00vJxG5xIvTigdFuOke9?=
 =?us-ascii?Q?3iMr0p95ng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c757fa64-3c9f-4762-dffb-08de4dcdc307
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:47.0677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUqtF9fw0xFj/VuUXjZDLAj4C4JJQJcsrZJPc0p2qNM4LatORyIPDc+B+F53b303/SDHyVA6owwWUeCyH/bzVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
- Update for HMM huge page support
- Update existing drivers to use MIGRATE_PFN_DEVICE
v2:
- Include changes to migrate_pfn_from_page()
- Rename to MIGRATE_PFN_DEVICE_PRIVATE
- drm/amd: Check adev->gmc.xgmi.connected_to_cpu
- lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  3 ++-
 drivers/gpu/drm/xe/xe_svm.c              |  2 +-
 include/linux/migrate.h                  | 14 +++++++++-----
 lib/test_hmm.c                           |  6 +++++-
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c493b19268cc..1a07a8b92e8f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -206,7 +206,12 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 unsigned long
 svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
+	unsigned long flags = 0;
+
+	if (!adev->gmc.xgmi.connected_to_cpu)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT) |
+	       flags;
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index bd3f7102c3f9..adfa3df5cbc5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -484,7 +484,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns,
-			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT) |
+			     MIGRATE_PFN_DEVICE_PRIVATE,
 			     npages);
 
 	for (i = 0; i < npages; i++) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 260676b0d246..f82790d7e7e6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -698,7 +698,7 @@ static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocat
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = migrate_pfn(block_pfn + i);
+			pfn[j++] = migrate_pfn(block_pfn + i) | MIGRATE_PFN_DEVICE_PRIVATE;
 	}
 
 	return 0;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index d269ec1400be..5fd2ee080bc0 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -122,11 +122,12 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
  * have enough bits to store all physical address and flags. So far we have
  * enough room for all our flags.
  */
-#define MIGRATE_PFN_VALID	(1UL << 0)
-#define MIGRATE_PFN_MIGRATE	(1UL << 1)
-#define MIGRATE_PFN_WRITE	(1UL << 3)
-#define MIGRATE_PFN_COMPOUND	(1UL << 4)
-#define MIGRATE_PFN_SHIFT	6
+#define MIGRATE_PFN_VALID		(1UL << 0)
+#define MIGRATE_PFN_MIGRATE		(1UL << 1)
+#define MIGRATE_PFN_WRITE		(1UL << 3)
+#define MIGRATE_PFN_COMPOUND		(1UL << 4)
+#define MIGRATE_PFN_DEVICE_PRIVATE	(1UL << 5)
+#define MIGRATE_PFN_SHIFT		6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
@@ -142,6 +143,9 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return migrate_pfn(page_to_pfn(page)) |
+		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index a6ff292596f3..872d3846af7b 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1385,11 +1385,15 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
 	unsigned int order = 0;
+	unsigned long flags = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
+	if (chunk->pagemap.type == MEMORY_DEVICE_PRIVATE)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn) | flags, npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
-- 
2.34.1

