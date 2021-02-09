Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3B03149D9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620E76EB13;
	Tue,  9 Feb 2021 07:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E36EA71;
 Tue,  9 Feb 2021 01:14:46 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0da0002>; Mon, 08 Feb 2021 17:09:46 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:45 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:45 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 8/9] nouveau/dmem: Add support for multiple page types
Date: Tue, 9 Feb 2021 12:07:21 +1100
Message-ID: <20210209010722.13839-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832986; bh=7iHwtR9sau7241FKCrgteBkrT9cHXs6BLCPTLWgKcXQ=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=VKRG5N9NY9ae9S7GkfqgricGvo5ZGs2UBfcbmWhnNfa6uuRK5Oi4wNrQhOYQjkYs5
 CtYJHlMQmzVd2GcxxcWItL2jNHWW0zO+4uoMRB4r/Mg1zI+NQBo4KEUztggcr/nOaa
 NxPUZ84dy/ZQRoeSStEePDecVkKIGsgW3/eDkS6lakAMbXLykzTozQj8RgBXyst0It
 bv4Lx4xAnRZfRkKbGIwOihbwBewLn6XMpOhiTSFfOvbktrB5fv5cMMDJ0eFcECGyG7
 m+P9i28q28Ovin8mEgLRLtMysXyi/8arOL1T9Xf7Alt9GnBQWEodaOJ7g4rsh67f1x
 ZmdyxxPwBzagw==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device private pages are used to track a per-page migrate_to_ram()
callback which is called when the CPU attempts to access a GPU page from
the CPU. Currently the same callback is used for all GPU pages tracked
by Nouveau. However a future patch requires support for calling a
different callback when accessing some GPU pages.

This patch extends the existing Nouveau device private page allocator to
make it easier to allocate device private pages with different callbacks
but should not introduce any functional changes.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 27 ++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_dmem.h |  5 +++++
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 9579bd001f11..8fb4949f3778 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -67,6 +67,7 @@ struct nouveau_dmem_chunk {
 	struct nouveau_bo *bo;
 	struct nouveau_drm *drm;
 	unsigned long callocated;
+	enum nouveau_dmem_type type;
 	struct dev_pagemap pagemap;
 };
 
@@ -81,7 +82,7 @@ struct nouveau_dmem {
 	struct nouveau_dmem_migrate migrate;
 	struct list_head chunks;
 	struct mutex mutex;
-	struct page *free_pages;
+	struct page *free_pages[NOUVEAU_DMEM_NTYPES];
 	spinlock_t lock;
 };
 
@@ -112,8 +113,8 @@ static void nouveau_dmem_page_free(struct page *page)
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	page->zone_device_data = dmem->free_pages[chunk->type];
+	dmem->free_pages[chunk->type] = page;
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -224,7 +225,8 @@ static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+	enum nouveau_dmem_type type)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -248,6 +250,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	}
 
 	chunk->drm = drm;
+	chunk->type = type;
 	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	chunk->pagemap.range.start = res->start;
 	chunk->pagemap.range.end = res->end;
@@ -279,8 +282,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
 	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+		page->zone_device_data = drm->dmem->free_pages[type];
+		drm->dmem->free_pages[type] = page;
 	}
 	*ppage = page;
 	chunk->callocated++;
@@ -304,22 +307,22 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, enum nouveau_dmem_type type)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
 	int ret;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
-		page = drm->dmem->free_pages;
-		drm->dmem->free_pages = page->zone_device_data;
+	if (drm->dmem->free_pages[type]) {
+		page = drm->dmem->free_pages[type];
+		drm->dmem->free_pages[type] = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, type);
 		if (ret)
 			return NULL;
 	}
@@ -577,7 +580,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	dpage = nouveau_dmem_page_alloc_locked(drm, NOUVEAU_DMEM);
 	if (!dpage)
 		goto out;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
index 64da5d3635c8..02e261c4acf1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
@@ -28,6 +28,11 @@ struct nouveau_drm;
 struct nouveau_svmm;
 struct hmm_range;
 
+enum nouveau_dmem_type {
+	NOUVEAU_DMEM,
+	NOUVEAU_DMEM_NTYPES, /* Number of types, must be last */
+};
+
 #if IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM)
 void nouveau_dmem_init(struct nouveau_drm *);
 void nouveau_dmem_fini(struct nouveau_drm *);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
