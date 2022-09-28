Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA25EDC39
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D1E10E4B8;
	Wed, 28 Sep 2022 12:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8507610E491;
 Wed, 28 Sep 2022 12:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC9HfUdT3u3QbIM99d6XoVuFBwmuqapJn52JYjPmeENuCxpf7RbOghSVMGsZE7hce+7I6prhiPB09GZy1GASFjvBLR9Bdz8H1T6sX3BV+olLwGaPwUs5ATx2co/rHegfY6Vp28kdb0T9oq8LpMgDpa9kFM4DqkKQ87KCXiuqugZ2ZDDniBEIxmBqDBfWqBVVzSkrwg8p7UJ/wDiN9pPNOvzEaN+GvGu9ACneirpKpGMrwXDef3RhSpCWrcnFVlwejTvLBfZglt0Vb6m7yFIMTtgsgkIPsFyUvux7AKu6IR0lmUdOclG/TFK4FOxf6PYqWbtkKbVEUjzv7SG/GMpE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Irdbf86/Asnwx5UiI7R2Cz+qn/wZDHTv90XwJO+4KbM=;
 b=O1cQ7mAscP1I0Ar/1L9NYzUc16m+Utadm7i3uO/U1fSjpgNBBmEn6ojofyFaXy+uB76PYwmmT8TBS+9rIgWy+/0lugxCArzf6kwHvv7GLU0RPp0k7FL+cc8fFKfVidgjp7YdemAqFXRWeoRI7v1Zcl3OqVFU8KZNNnUJaWjKjQ0UJMlkrXlJ1+8wkct+nCHZ5OMNZ70pFYDlqLBBwMQxQn6ifNnq1uuCrNhLT7R0ILpFT0PBGnTc9q0bxJbM6VYqpzteIg5OJHgwyDfZJ2w0bhJ+NHNHQuz5q7WviMqR6a2o1tlpGC/VivN/BuL0agBnQvy9GmlycGnhnSl1rjL16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Irdbf86/Asnwx5UiI7R2Cz+qn/wZDHTv90XwJO+4KbM=;
 b=lQgqL2DGgCyl3laF4Vsv6Mg66yNZgWvB/YpUZ1f81qboeY/lBMO8hT2lvGEqeLwnCIdIGqt4IcRaZf4PQxStiv+Cbx4EfK8Giv0XqJ1n4uf1qDW/A20ykGey5ze95jvScAnTxTlU1jPlmfyZlM/Jyn59+aMGgvQVq9m5Bk+ij1jiZYDWkyFX+tq2PUOIX3zHnEnZe8ashMcXX38lAXWbnBevLTupM53O1St+NUmLGyA0I+hioUmnKvLZQ5bhghpafmYMT/Fn5M9hm1kYrvY29PZd7ALYs5W76P+jhen83pXgsiCh+1srultW1txJOVXIDIAccK/wI2cnoGsEAOHZdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:02:18 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:02:18 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 6/8] nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
Date: Wed, 28 Sep 2022 22:01:20 +1000
Message-Id: <20573d7b4e641a78fde9935f948e64e71c9e709e.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0055.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 2446eecf-8cf9-4b7c-50eb-08daa1494a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 43CWhP5Q60Lwvq/mb5pjx0glX6mbD8hfSM4kB7zsAuIe9Ii4jR7vzD+tfF2hjQ0DlBQuK0uh2tUwV4WzVaCNv/6kEmVWKYnoclAKWf846hi3A3Wi+cdyLkf0HhfIJxj5e11q03GlzHPG8Htr2NUaOVyPYNZWG1sbNyDlARbS4KByK4zjn2tj9OTRiVJ/SJvkO26u23BXUZJOBsBP2JWTx2hY6efopGR1dd95+UwPSheZK7SX4TaMFyoesnPDaUq/AD7L11tmTFJSlPB0h/xq/O8RCmjcsQCLtkDbYc/+QPvstW6b94dG519fzspzeAkVxP0iwD9rBrrc80q2fgDXiFmcsa/67uB3sUG+5CpPJLe2GIW407eSMwg+YdpBJSYf/AkoiPlGpoxNrxhcB122/4RVanyOHQ2ub1mwryJdtFFBBHq2pcOwNKOXSLFtADMeo59qGdbxD5d8ev0lMQyXNlLd2Mt+9oaFApH7PCIHCinodWWYsGTMnhjNJWixpA35cjNoAY+EtMEyOK4aJ7Mxqjuf4hxZZ6f13MAfYzTmhxmK9z/valMvyR5Vi+czr43zdrRsTt4vKi9RUZByOJUG0mbGa6hCy5hfK/GwbacM3hqNd91RQGcJkZUB39IWzIhFoMQ7JzOK8Ar2m0Fdx8E+85T7AYPidB7wHL21XIchQbI2cIAQmdIRwoq/icxVZ67xE1dNVCEV3b+ArYoMde58iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(8936002)(478600001)(316002)(5660300002)(83380400001)(36756003)(6506007)(107886003)(6666004)(41300700001)(54906003)(6486002)(2906002)(66946007)(186003)(66556008)(2616005)(66476007)(4326008)(8676002)(26005)(86362001)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ta2S8itL0Vnv7S5z+fDZiGHVH4FSdQrkSb2UffuLLHHVtekrRPS6pvPcUcpu?=
 =?us-ascii?Q?Z3cDJj5Gx26pRvyFewYABvU/ua/Iz0t6IlHQmQo5XOTr/G4XqSizZHBmSGLC?=
 =?us-ascii?Q?xGf8sA4vRDMTluJUPi0IwjEBdhPWknp4ONspOcuzvmyd0g64gLHzdbLHusmY?=
 =?us-ascii?Q?XATr924h3qhD6wu/imZv3+RoBZm4iZdjYAtWUxazQ4mU8j/CmC+Zu3lMlCKt?=
 =?us-ascii?Q?01oXlTty0PUzYKuP7utbwpp2qf4h8v9nbYWODeQg5MuocXtgzpD2CFaXJRFf?=
 =?us-ascii?Q?A0HDWTzGWkw9mJNETbIsc/I9B36NyV7G+TGH4wWzVFyKzcQwrGJ9yBD0FD6A?=
 =?us-ascii?Q?R0W9Zidic59Hocu75uDJGbqHZnU7Mx/JZ9jxkLSxkMz8Bfm88g8a7XhSEEYD?=
 =?us-ascii?Q?PTYadaRuY2/3g0C38tvN4Gfz5ABf94u+yLe64c/4gMcKeTM9uwbUTmvYd8xP?=
 =?us-ascii?Q?XkTOk/DZXzinGvJbus37o04J5Da8p4UCDSYVSilgXmW1YGmhsm/EHfIqNUgZ?=
 =?us-ascii?Q?PJ6SkuSSra0ka9kTm8RtvjCApZUfm05+VTwL2io0FqdRtdJHqwfAZZRqtIHz?=
 =?us-ascii?Q?742ofY0aBhcg9H6S/Z0qaRt50B/OmUZI/T+AkqeEfmKy5qwnihvq4Ve5h/FV?=
 =?us-ascii?Q?Qzlr4EXjVCQfsiINdqNWKZTBJPSl7GFNOIyywVdkNN/nfC6baZqKYzYeyffy?=
 =?us-ascii?Q?a9Ana6VAoBXP2XMqu9wnAGPpUolY3ZGY8dz7vD3EMZcaeFoU/snCvHCa47RT?=
 =?us-ascii?Q?c5q34xpBriidRYaNRn+mgOIRI05pDjElbYzwCfhse3I6FJMRxAJ+zPs2CHM/?=
 =?us-ascii?Q?PKeD3DFGEOtDnKsGS4YrEjXfuyQVsmONBobANwp4TG8kPgOCrC2Q2Kl2ZKB6?=
 =?us-ascii?Q?V8OOo5o5ylcnMSPwRGT66ovjyd2J+K7ky7V0UIXRTGHybvUU3G91FczL7z07?=
 =?us-ascii?Q?L2R+YeqFxiJuzJtWYpHDABqzAuKsykrIMZrgfnFOEsYi+JJrOxoMZ7DWSKY6?=
 =?us-ascii?Q?XUbkRCP6nntXmHVMvCmiqDA0Gp0srr8kqbJbFoqye8l4EI8OcyRG1gMkOlRY?=
 =?us-ascii?Q?bNScNLlXO4i5qshxTAZ4+HRZIJoh/dIimHa/9yPQ448LodpzPDPcM0uNBpLg?=
 =?us-ascii?Q?oGUjz7gGDv/5QPXo9lLzwjFDZHTWpjdvDULjqLQ/Nub9dGFudYuaLqP7UqlU?=
 =?us-ascii?Q?3r8Ue2nMzwys4kIPbMWZj7cejHSbh1Eik6A8ML798XakKbDcFfH+IELVQ/0W?=
 =?us-ascii?Q?MDX2vHztrQnJEWTfpH7LfkoaT7deKzHmJrWTjeHkmemgVWPYrEFWtZxphjFb?=
 =?us-ascii?Q?dZOCMWz2wSdN8GKZjafppqP1tFn2Xub4Y0GmzhL5KpRyf7VsMVuSw9XTloAX?=
 =?us-ascii?Q?jIhA5dQzJSXHRidwLR+YLBOziESQyhPJR7QFc05rGuQfpO7AAGC74yHxLeoS?=
 =?us-ascii?Q?rub5jreBvg1tEWsvnUWVHpChLnLuH6RjYtmD0z72913kgkI8t/BgYJO0Dfth?=
 =?us-ascii?Q?0hIPQzjrAWS38iytwf/IpPJ6I74LfyuwdI1VuSsNKEdND4pg/MqXYT0L1ZI1?=
 =?us-ascii?Q?D9ycS7uMy676Fqsa5JKGqeTRPeAqnZjYhL2HDTyZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2446eecf-8cf9-4b7c-50eb-08daa1494a35
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:02:18.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwDhX8jr2X3hxge2ZwOXynFsTA56G2ZgYPHBRIzQ6V2Xo9v5dtmsZ+MJe97bNvnZG3ZVuD46EnrR/XS3oXDuAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_dmem_fault_copy_one() is used during handling of CPU faults via
the migrate_to_ram() callback and is used to copy data from GPU to CPU
memory. It is currently specific to fault handling, however a future
patch implementing eviction of data during teardown needs similar
functionality.

Refactor out the core functionality so that it is not specific to fault
handling.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 58 +++++++++++++--------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index b092988..65f51fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -139,44 +139,24 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
-		struct vm_fault *vmf, struct migrate_vma *args,
-		dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
+				struct page *dpage, dma_addr_t *dma_addr)
 {
 	struct device *dev = drm->dev->dev;
-	struct page *dpage, *spage;
-	struct nouveau_svmm *svmm;
-
-	spage = migrate_pfn_to_page(args->src[0]);
-	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
-		return 0;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
-	if (!dpage)
-		return VM_FAULT_SIGBUS;
 	lock_page(dpage);
 
 	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, *dma_addr))
-		goto error_free_page;
+		return -EIO;
 
-	svmm = spage->zone_device_data;
-	mutex_lock(&svmm->mutex);
-	nouveau_svmm_invalidate(svmm, args->start, args->end);
 	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
-		goto error_dma_unmap;
-	mutex_unlock(&svmm->mutex);
+					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+		return -EIO;
+	}
 
-	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
 	return 0;
-
-error_dma_unmap:
-	mutex_unlock(&svmm->mutex);
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
-error_free_page:
-	__free_page(dpage);
-	return VM_FAULT_SIGBUS;
 }
 
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
@@ -184,9 +164,11 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
+	struct nouveau_svmm *svmm;
+	struct page *spage, *dpage;
 	unsigned long src = 0, dst = 0;
 	dma_addr_t dma_addr = 0;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
 		.start		= vmf->address,
@@ -207,9 +189,25 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr);
-	if (ret || dst == 0)
+	spage = migrate_pfn_to_page(src);
+	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
+		goto done;
+
+	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	if (!dpage)
+		goto done;
+
+	dst = migrate_pfn(page_to_pfn(dpage));
+
+	svmm = spage->zone_device_data;
+	mutex_lock(&svmm->mutex);
+	nouveau_svmm_invalidate(svmm, args.start, args.end);
+	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	mutex_unlock(&svmm->mutex);
+	if (ret) {
+		ret = VM_FAULT_SIGBUS;
 		goto done;
+	}
 
 	nouveau_fence_new(dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(&args);
-- 
git-series 0.9.1
