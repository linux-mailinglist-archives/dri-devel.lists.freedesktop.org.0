Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC3A57FE4
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 00:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DD710E155;
	Sat,  8 Mar 2025 23:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="oZ/g9b/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5D10E155
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=LFSdD4kJ7yJc6B+RnrYL9iqh3L8Tq6imwJSAk9Z8eLU=; b=oZ/g9b/JQEXaZehe
 GpFGXO0MdL/YPTAiXJ1zTBONKDn6qIv/2PUcvoASEGQetPPS4Vlt2r/fuBCPpEVOt4p4kyrdlP9dj
 FcNIhiC8m/0ZrFxNj+idcnhToTOHhf8npyDIrgLyhTJe+07is+b3GC3JytqgTN3ABeMUU5FdmW/qb
 mbFmk64b/oCE5zj9odHezNnG77Sw7/W/EO7tP0RgptJohO+as1/eM/rsp8mifwgQsaZImTAXlg8Lh
 LMqQjl2iJUdDyuLo0WuR/Ca+CCGX0ECLk2FQHY8uXYP91PZnBZsQRqK8yzQUp+ngy+Pq2fzsnL1Ad
 aH+ZuSOlT4X4FrYKZQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tr3qH-003f1I-0L;
 Sat, 08 Mar 2025 23:44:29 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/gma500: Remove unused psb_mmu_virtual_to_pfn
Date: Sat,  8 Mar 2025 23:44:28 +0000
Message-ID: <20250308234428.255164-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

psb_mmu_virtual_to_pfn() was added in 2011 by
commit 8c8f1c958ab5 ("gma500: introduce the GTT and MMU handling logic")
but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/gma500/mmu.c | 41 ------------------------------------
 drivers/gpu/drm/gma500/mmu.h |  2 --
 2 files changed, 43 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index 4d78b33eaa82..e6753282e70e 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -730,44 +730,3 @@ int psb_mmu_insert_pages(struct psb_mmu_pd *pd, struct page **pages,
 
 	return ret;
 }
-
-int psb_mmu_virtual_to_pfn(struct psb_mmu_pd *pd, uint32_t virtual,
-			   unsigned long *pfn)
-{
-	int ret;
-	struct psb_mmu_pt *pt;
-	uint32_t tmp;
-	spinlock_t *lock = &pd->driver->lock;
-
-	down_read(&pd->driver->sem);
-	pt = psb_mmu_pt_map_lock(pd, virtual);
-	if (!pt) {
-		uint32_t *v;
-
-		spin_lock(lock);
-		v = kmap_atomic(pd->p);
-		tmp = v[psb_mmu_pd_index(virtual)];
-		kunmap_atomic(v);
-		spin_unlock(lock);
-
-		if (tmp != pd->invalid_pde || !(tmp & PSB_PTE_VALID) ||
-		    !(pd->invalid_pte & PSB_PTE_VALID)) {
-			ret = -EINVAL;
-			goto out;
-		}
-		ret = 0;
-		*pfn = pd->invalid_pte >> PAGE_SHIFT;
-		goto out;
-	}
-	tmp = pt->v[psb_mmu_pt_index(virtual)];
-	if (!(tmp & PSB_PTE_VALID)) {
-		ret = -EINVAL;
-	} else {
-		ret = 0;
-		*pfn = tmp >> PAGE_SHIFT;
-	}
-	psb_mmu_pt_unmap_unlock(pt);
-out:
-	up_read(&pd->driver->sem);
-	return ret;
-}
diff --git a/drivers/gpu/drm/gma500/mmu.h b/drivers/gpu/drm/gma500/mmu.h
index d4b5720ef08e..e6d39703718c 100644
--- a/drivers/gpu/drm/gma500/mmu.h
+++ b/drivers/gpu/drm/gma500/mmu.h
@@ -71,8 +71,6 @@ extern int psb_mmu_insert_pfn_sequence(struct psb_mmu_pd *pd,
 				       uint32_t start_pfn,
 				       unsigned long address,
 				       uint32_t num_pages, int type);
-extern int psb_mmu_virtual_to_pfn(struct psb_mmu_pd *pd, uint32_t virtual,
-				  unsigned long *pfn);
 extern void psb_mmu_set_pd_context(struct psb_mmu_pd *pd, int hw_context);
 extern int psb_mmu_insert_pages(struct psb_mmu_pd *pd, struct page **pages,
 				unsigned long address, uint32_t num_pages,
-- 
2.48.1

