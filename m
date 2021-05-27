Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 607153937A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0056F4D1;
	Thu, 27 May 2021 20:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106336F4CE;
 Thu, 27 May 2021 20:56:16 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id z24so1962146ioi.3;
 Thu, 27 May 2021 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPLNHWojaW2z7tHHYVN0iHifaKQ7ufRqQo9gvltiW3c=;
 b=Bk5UbzlrXxdNsuHq8F16cO8p5FRrv8/IL0vwclE542mpXtKmv3YBMuAlLIn6zy2QGm
 g43T20oSxWrLgisP6r7541Su3rzutPYvM6Af3O2XdsjwvK/BZdY/ZC9mtU1DlMU/JzeV
 G/isU0y28NX0f3d367u7QTusCz3EYuCN8SblmgwHHkLiUjxFeTN8GrF3tkBRC+MZ2JH6
 +X+Mmi+NppE4nHfdoNZFEuixsh92GBubX9dOBaV/z3OKOCoTav5yU1JaK1bLFXFaHK3b
 5I+ZmFbuNhZT4nC65I6Bwm9yAAyqK4r3HP82sHSVRAv6/ZttXeKxoMFw/lHAxg40Rs5d
 mrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPLNHWojaW2z7tHHYVN0iHifaKQ7ufRqQo9gvltiW3c=;
 b=GMRfj+xhkmG7HEzazmhBNObw58oWwjx3eXe8KmklTGMyVrGB9VyxRSFsrT4CaFt8Dp
 YBLZqaYaJmSsnSqfwGE4fCTyzURpgtTh8UliNztnK07xBax9UWkbXNfFRhFmdn4MkFNW
 capthi4PMowVpVIP+OWXXXN0ISfvomUrE3KP+LInsRhlsSJwaxescNz6NzriwPh7E40R
 vDxlpKVIyL/rfgXpXDBcbPdJ2fqK6AZ2k9SZgmjArnha5ziJI0qo9T38SFo6yE6mSeXH
 /I6w5zDzwSpk1NOdYZGEAH3pL+R0MuTp76IWlEgYg6Tf2XZbfj6yb91zrZ579qEFbTHR
 CWKw==
X-Gm-Message-State: AOAM532l/bYRcO9KIn4xujWHJOfJSahLEd9buWoZiRUBwMGHu3yXsMCe
 2u0LahYov/xfNgqLGORxaUWvu7rCrqARog==
X-Google-Smtp-Source: ABdhPJzh6oOfELkaZzhVcv9tmyNGre4Cn0U3R/nlhSkOHYw1LymwnYNanGJ2wCmAbT0iwZ3wRuA5ew==
X-Received: by 2002:a02:a10f:: with SMTP id f15mr5218331jag.124.1622148975147; 
 Thu, 27 May 2021 13:56:15 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:14 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] drm/amdkfd: skip invalid pages during migrations
Date: Thu, 27 May 2021 16:56:02 -0400
Message-Id: <20210527205606.2660-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527205606.2660-1-Felix.Kuehling@amd.com>
References: <20210527205606.2660-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Invalid pages can be the result of pages that have been migrated
already due to copy-on-write procedure or pages that were never
migrated to VRAM in first place. This is not an issue anymore,
as pranges now support mixed memory domains (CPU/GPU).

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 38 +++++++++++-------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index b298aa8dea4d..6fd68528c425 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -419,7 +419,6 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	size_t size;
 	void *buf;
 	int r = -ENOMEM;
-	int retry = 0;
 
 	memset(&migrate, 0, sizeof(migrate));
 	migrate.vma = vma;
@@ -438,7 +437,6 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.dst = migrate.src + npages;
 	scratch = (dma_addr_t *)(migrate.dst + npages);
 
-retry:
 	r = migrate_vma_setup(&migrate);
 	if (r) {
 		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
@@ -446,17 +444,9 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 		goto out_free;
 	}
 	if (migrate.cpages != npages) {
-		pr_debug("collect 0x%lx/0x%llx pages, retry\n", migrate.cpages,
+		pr_debug("Partial migration. 0x%lx/0x%llx pages can be migrated\n",
+			 migrate.cpages,
 			 npages);
-		migrate_vma_finalize(&migrate);
-		if (retry++ >= 3) {
-			r = -ENOMEM;
-			pr_debug("failed %d migrate svms 0x%p [0x%lx 0x%lx]\n",
-				 r, prange->svms, prange->start, prange->last);
-			goto out_free;
-		}
-
-		goto retry;
 	}
 
 	if (migrate.cpages) {
@@ -547,9 +537,8 @@ static void svm_migrate_page_free(struct page *page)
 static int
 svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 			struct migrate_vma *migrate, struct dma_fence **mfence,
-			dma_addr_t *scratch)
+			dma_addr_t *scratch, uint64_t npages)
 {
-	uint64_t npages = migrate->cpages;
 	struct device *dev = adev->dev;
 	uint64_t *src;
 	dma_addr_t *dst;
@@ -566,15 +555,23 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	src = (uint64_t *)(scratch + npages);
 	dst = scratch;
 
-	for (i = 0, j = 0; i < npages; i++, j++, addr += PAGE_SIZE) {
+	for (i = 0, j = 0; i < npages; i++, addr += PAGE_SIZE) {
 		struct page *spage;
 
 		spage = migrate_pfn_to_page(migrate->src[i]);
-		if (!spage) {
-			pr_debug("failed get spage svms 0x%p [0x%lx 0x%lx]\n",
+		if (!spage || !is_zone_device_page(spage)) {
+			pr_debug("invalid page. Could be in CPU already svms 0x%p [0x%lx 0x%lx]\n",
 				 prange->svms, prange->start, prange->last);
-			r = -ENOMEM;
-			goto out_oom;
+			if (j) {
+				r = svm_migrate_copy_memory_gart(adev, dst + i - j,
+								 src + i - j, j,
+								 FROM_VRAM_TO_RAM,
+								 mfence);
+				if (r)
+					goto out_oom;
+				j = 0;
+			}
+			continue;
 		}
 		src[i] = svm_migrate_addr(adev, spage);
 		if (i > 0 && src[i] != src[i - 1] + PAGE_SIZE) {
@@ -607,6 +604,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 
 		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
 		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+		j++;
 	}
 
 	r = svm_migrate_copy_memory_gart(adev, dst + i - j, src + i - j, j,
@@ -664,7 +662,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	if (migrate.cpages) {
 		r = svm_migrate_copy_to_ram(adev, prange, &migrate, &mfence,
-					    scratch);
+					    scratch, npages);
 		migrate_vma_pages(&migrate);
 		svm_migrate_copy_done(adev, mfence);
 		migrate_vma_finalize(&migrate);
-- 
2.31.1

