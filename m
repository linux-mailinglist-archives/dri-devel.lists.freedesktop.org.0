Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0842C995B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79FF6E53E;
	Tue,  1 Dec 2020 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A0489AB9;
 Tue,  1 Dec 2020 01:29:41 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fc59c830000>; Mon, 30 Nov 2020 17:29:39 -0800
Received: from localhost (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Dec
 2020 01:29:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau/svm: Only map migrating pages
Date: Tue, 1 Dec 2020 12:29:36 +1100
Message-ID: <20201201012936.9046-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606786179; bh=U2FLmjEm94rPLnGodJhcYwZBdpdbhTX9UL1a65sI3bI=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=FhgNlKphVf9oOOynU0gD9eLLDsorI+EotpUqSf8jOBf+GNKe/PnzOUBfizzEXTZ6I
 Nk2lDdBcBE7zxrOZjniP9rtuTSUCFME1er5nTEM75pUcTtcTQ3QLnqhLm2q+nsdqXN
 kF3WgO2Lohicz68fGDinflQYxSGiXwk56VWviw1uhu0Xhkmb3WKpFyyLBD/aJqBeKz
 ABVnrPp+jkKOOTGRzo36dPdcqFVHkGM5kOCbANft6wiXJiurj5C6YQ0VBGC5S5t4M1
 VHKDQEHYji1fG2224bbE6e5isZWjW4gxqO97RAZ9rGUmjL7AsUVv3P5l6Whqtf02V+
 OyIp/3rhTN6Uw==
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: rcampbell@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only pages which were actually migrated should be mapped on the GPU.
migrate_vma_pages() clears MIGRATE_PFN_MIGRATE in the src_pfn array, so
test this prior to mapping the pages on the GPU. If any pages failed to
migrate don't install any mappings - the GPU will demand fault any as
required.

Fixes: e3d8b0890469 ("drm/nouveau/svm: map pages after migration")
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..a2169644f114 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -618,8 +618,9 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		dma_addr_t *dma_addrs, u64 *pfns)
 {
 	struct nouveau_fence *fence;
-	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long addr = args->start, nr_dma = 0, i, npages;
 
+	npages = (args->end - args->start) >> PAGE_SHIFT;
 	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
 				args->src[i], dma_addrs + nr_dma, pfns + i);
@@ -631,7 +632,16 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+
+	for (i = 0; i < npages; i++)
+		if (!(args->src[i] & MIGRATE_PFN_MIGRATE))
+			break;
+
+	/* If all pages were migrated successfully map them on the GPU. If any
+	 * failed just let the GPU fault to create the mapping.
+	 */
+	if (i == npages)
+		nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, npages);
 
 	while (nr_dma--) {
 		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
