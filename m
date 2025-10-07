Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4348BC1D75
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B6F10E6AF;
	Tue,  7 Oct 2025 15:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ikwGah4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909F110E6B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:03:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759849376; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S/Fezolv+PXE93x+RcJ5X7QOmH2gP2Gx4sJgs/PvlCUmu/E4ftbAJMSFbz7YpISQ1JufHBuWXydFsZtUlgzw5IHYRgaiC/uHty33hVOfFHyrynKzdvZ3G16+Dwk5H61QvW3Olrlx1YwLhP4Nh9lA8i3olbL3PpsueBcmbNtyKtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759849376;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1RWyHXqz63Fh1czRFGMUMY4EX3/Y7d1ckzNs3+kR1PU=; 
 b=UH53g2HJ0Qax/765mvzGUBhbSKwGV1uFVYTf5KdD60wek2enLwnBXEIKXuTF6AmpaGHOBoIgro6nyd13P94erQJXGpi8n8dSxq4JCYvQOGvWj8TlboFfr+PJQyrF6eP31lKIa0UF2RmQzPvfRBb/Syp+0r1pgcN9VajRRWCcdaU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759849376; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=1RWyHXqz63Fh1czRFGMUMY4EX3/Y7d1ckzNs3+kR1PU=;
 b=ikwGah4JS+yLRdbdJ/p8pMgGRDQ6eRHNvahQRJ2puxYKw+8e3IO0iWztnWTrOPtm
 GWQlLdTLD25ds53nUdLfXJ+pRfgrv5XhVGz5YqF5yPAUwMI4CIYX08RqkiA47jJmh8Q
 kA5gXnfavRaZZEsuJGGx+0LQp+VOq7JYxH2EEwyA=
Received: by mx.zohomail.com with SMTPS id 1759849374688828.4781470927335;
 Tue, 7 Oct 2025 08:02:54 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v5 05/12] drm/panfrost: Check sgt to know whether pages are
 already mapped
Date: Tue,  7 Oct 2025 16:01:47 +0100
Message-ID: <20251007150216.254250-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150216.254250-1-adrian.larumbe@collabora.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the MMU's page fault ISR for a heap object, determine whether the
faulting address belongs to a 2MiB block that was already mapped by
checking its corresponding sgt in the Panfrost BO.

Also avoid retrieving pages from the shmem file if last one in the block
was already present, as this means all of them had already been fetched.

This is done in preparation for a future commit in which the MMU mapping
helper might fail, but the page array is left populated, so this cannot
be used as a check for an early bail-out.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 41 +++++++++++++++----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index cf272b167feb..72864d0d478e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -600,32 +600,39 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		refcount_set(&bo->base.pages_use_count, 1);
 	} else {
 		pages = bo->base.pages;
-		if (pages[page_offset]) {
-			/* Pages are already mapped, bail out. */
-			goto out;
-		}
+	}
+
+	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
+	if (sgt->sgl) {
+		/* Pages are already mapped, bail out. */
+		goto out;
 	}
 
 	mapping = bo->base.base.filp->f_mapping;
 	mapping_set_unevictable(mapping);
 
-	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
-		/* Can happen if the last fault only partially filled this
-		 * section of the pages array before failing. In that case
-		 * we skip already filled pages.
+	if (!pages[page_offset + NUM_FAULT_PAGES - 1]) {
+		/* Pages are retrieved sequentially, so if the very last
+		 * one in the subset we want to map is already assigned, then
+		 * there's no need to further iterate.
 		 */
-		if (pages[i])
-			continue;
-
-		pages[i] = shmem_read_mapping_page(mapping, i);
-		if (IS_ERR(pages[i])) {
-			ret = PTR_ERR(pages[i]);
-			pages[i] = NULL;
-			goto err_unlock;
+		for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
+			/* Can happen if the last fault only partially filled this
+			 * section of the pages array before failing. In that case
+			 * we skip already filled pages.
+			 */
+			if (pages[i])
+				continue;
+
+			pages[i] = shmem_read_mapping_page(mapping, i);
+			if (IS_ERR(pages[i])) {
+				ret = PTR_ERR(pages[i]);
+				pages[i] = NULL;
+				goto err_unlock;
+			}
 		}
 	}
 
-	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
 					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
 	if (ret)
-- 
2.51.0

