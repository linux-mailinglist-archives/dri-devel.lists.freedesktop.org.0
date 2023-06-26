Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC073DE67
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BBD10E1F1;
	Mon, 26 Jun 2023 12:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F03010E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:02:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B286660714F;
 Mon, 26 Jun 2023 13:02:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687780974;
 bh=Yo+pz+Tp+bqdyprITgKnXcZA+Qz/RRRbu5C4yTdFidk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MJji4tPomBasuVSibAAYimTd9IVMmHanBvi6k/mb4hOdwivggvnaoBo4ziQ4Vcf70
 zikD7mt9vcWsy7EB1zzMrjKJO6CpuujYm1yvUBXSFXNPqbGA/WUuiwPgcWYOW7LM8V
 BqBjDQpGLnG2uCEIjZVXBU12bnvpDM/6soEwepPA1rV+1v0PADzLmAByFeSQ2e0B6F
 yAeiWiufD5tvwi3B01+uyb51DZDPtm6sNS1XvJXgDAgYXk2GSPhBRsWxIpRkgHfiaO
 n8y2MHt92iB+BbWPU/fUCqFGSQm4srHBQXCRW1TXYu4oysF1OagC/Ff/JSkvBnwFwl
 CS0YUcZB5n4lA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/panfrost: Stop using drm_gem_shmem_put_pages()
Date: Mon, 26 Jun 2023 14:02:43 +0200
Message-ID: <20230626120247.1337962-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626120247.1337962-1-boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to get rid of this helper function, so let's use
drm_gem_shmem_unpin() and move this call out of the
dma_resv-locked section.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index c0123d09f699..0b12f03ef0be 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -447,6 +447,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	pgoff_t page_offset;
 	struct sg_table *sgt;
 	struct page **pages;
+	bool pinned = false;
 
 	bomapping = addr_to_mapping(pfdev, as, addr);
 	if (!bomapping)
@@ -488,12 +489,14 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		}
 		bo->base.pages = pages;
 		bo->base.pages_use_count = 1;
+		pinned = true;
 	} else {
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
 			/* Pages are already mapped, bail out. */
 			goto out;
 		}
+		pinned = true;
 	}
 
 	mapping = bo->base.base.filp->f_mapping;
@@ -504,7 +507,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		if (IS_ERR(pages[i])) {
 			ret = PTR_ERR(pages[i]);
 			pages[i] = NULL;
-			goto err_pages;
+			goto err_unlock;
 		}
 	}
 
@@ -512,7 +515,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
 					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
 	if (ret)
-		goto err_pages;
+		goto err_unlock;
 
 	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
@@ -534,10 +537,12 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 
 err_map:
 	sg_free_table(sgt);
-err_pages:
-	drm_gem_shmem_put_pages(&bo->base);
 err_unlock:
 	dma_resv_unlock(obj->resv);
+
+	if (ret && pinned)
+		drm_gem_shmem_unpin(&bo->base);
+
 err_bo:
 	panfrost_gem_mapping_put(bomapping);
 	return ret;
-- 
2.41.0

