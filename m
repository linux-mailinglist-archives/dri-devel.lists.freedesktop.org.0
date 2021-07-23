Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB643D4070
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 20:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235F86FCC9;
	Fri, 23 Jul 2021 18:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CA46FCC9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 18:56:08 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 23 Jul 2021 11:56:02 -0700
Received: from vertex.localdomain (unknown [10.84.231.59])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 323E82021A;
 Fri, 23 Jul 2021 11:56:07 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: Remove the deprecated lower mem limit
Date: Fri, 23 Jul 2021 14:56:06 -0400
Message-ID: <20210723185606.117810-1-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM during the transition to the new page allocator lost the ability
to constrain the allocations via the lower_mem_limit. The code has
been unused since the change:
256dd44bd897 ("drm/ttm: nuke old page allocator")
and there's no reason to keep it.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/ttm_memory.c | 99 +----------------------------
 drivers/gpu/drm/vmwgfx/ttm_memory.h |  6 +-
 2 files changed, 2 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_memory.c b/drivers/gpu/drm/vmwgfx/ttm_memory.c
index edd17c30d5a5..2ced4c06ca45 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_memory.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_memory.c
@@ -34,7 +34,6 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/swap.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -173,69 +172,7 @@ static struct kobj_type ttm_mem_zone_kobj_type = {
 	.sysfs_ops = &ttm_mem_zone_ops,
 	.default_attrs = ttm_mem_zone_attrs,
 };
-
-static struct attribute ttm_mem_global_lower_mem_limit = {
-	.name = "lower_mem_limit",
-	.mode = S_IRUGO | S_IWUSR
-};
-
-static ssize_t ttm_mem_global_show(struct kobject *kobj,
-				 struct attribute *attr,
-				 char *buffer)
-{
-	struct ttm_mem_global *glob =
-		container_of(kobj, struct ttm_mem_global, kobj);
-	uint64_t val = 0;
-
-	spin_lock(&glob->lock);
-	val = glob->lower_mem_limit;
-	spin_unlock(&glob->lock);
-	/* convert from number of pages to KB */
-	val <<= (PAGE_SHIFT - 10);
-	return snprintf(buffer, PAGE_SIZE, "%llu\n",
-			(unsigned long long) val);
-}
-
-static ssize_t ttm_mem_global_store(struct kobject *kobj,
-				  struct attribute *attr,
-				  const char *buffer,
-				  size_t size)
-{
-	int chars;
-	uint64_t val64;
-	unsigned long val;
-	struct ttm_mem_global *glob =
-		container_of(kobj, struct ttm_mem_global, kobj);
-
-	chars = sscanf(buffer, "%lu", &val);
-	if (chars == 0)
-		return size;
-
-	val64 = val;
-	/* convert from KB to number of pages */
-	val64 >>= (PAGE_SHIFT - 10);
-
-	spin_lock(&glob->lock);
-	glob->lower_mem_limit = val64;
-	spin_unlock(&glob->lock);
-
-	return size;
-}
-
-static struct attribute *ttm_mem_global_attrs[] = {
-	&ttm_mem_global_lower_mem_limit,
-	NULL
-};
-
-static const struct sysfs_ops ttm_mem_global_ops = {
-	.show = &ttm_mem_global_show,
-	.store = &ttm_mem_global_store,
-};
-
-static struct kobj_type ttm_mem_glob_kobj_type = {
-	.sysfs_ops = &ttm_mem_global_ops,
-	.default_attrs = ttm_mem_global_attrs,
-};
+static struct kobj_type ttm_mem_glob_kobj_type = {0};
 
 static bool ttm_zones_above_swap_target(struct ttm_mem_global *glob,
 					bool from_wq, uint64_t extra)
@@ -435,11 +372,6 @@ int ttm_mem_global_init(struct ttm_mem_global *glob, struct device *dev)
 
 	si_meminfo(&si);
 
-	spin_lock(&glob->lock);
-	/* set it as 0 by default to keep original behavior of OOM */
-	glob->lower_mem_limit = 0;
-	spin_unlock(&glob->lock);
-
 	ret = ttm_mem_init_kernel_zone(glob, &si);
 	if (unlikely(ret != 0))
 		goto out_no_zone;
@@ -527,35 +459,6 @@ void ttm_mem_global_free(struct ttm_mem_global *glob,
 }
 EXPORT_SYMBOL(ttm_mem_global_free);
 
-/*
- * check if the available mem is under lower memory limit
- *
- * a. if no swap disk at all or free swap space is under swap_mem_limit
- * but available system mem is bigger than sys_mem_limit, allow TTM
- * allocation;
- *
- * b. if the available system mem is less than sys_mem_limit but free
- * swap disk is bigger than swap_mem_limit, allow TTM allocation.
- */
-bool
-ttm_check_under_lowerlimit(struct ttm_mem_global *glob,
-			uint64_t num_pages,
-			struct ttm_operation_ctx *ctx)
-{
-	int64_t available;
-
-	/* We allow over commit during suspend */
-	if (ctx->force_alloc)
-		return false;
-
-	available = get_nr_swap_pages() + si_mem_available();
-	available -= num_pages;
-	if (available < glob->lower_mem_limit)
-		return true;
-
-	return false;
-}
-
 static int ttm_mem_global_reserve(struct ttm_mem_global *glob,
 				  struct ttm_mem_zone *single_zone,
 				  uint64_t amount, bool reserve)
diff --git a/drivers/gpu/drm/vmwgfx/ttm_memory.h b/drivers/gpu/drm/vmwgfx/ttm_memory.h
index c50dba774485..7b0d617ebcb1 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_memory.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_memory.h
@@ -50,8 +50,6 @@
  * @work: The workqueue callback for the shrink queue.
  * @lock: Lock to protect the @shrink - and the memory accounting members,
  * that is, essentially the whole structure with some exceptions.
- * @lower_mem_limit: include lower limit of swap space and lower limit of
- * system memory.
  * @zones: Array of pointers to accounting zones.
  * @num_zones: Number of populated entries in the @zones array.
  * @zone_kernel: Pointer to the kernel zone.
@@ -69,7 +67,6 @@ extern struct ttm_mem_global {
 	struct workqueue_struct *swap_queue;
 	struct work_struct work;
 	spinlock_t lock;
-	uint64_t lower_mem_limit;
 	struct ttm_mem_zone *zones[TTM_MEM_MAX_ZONES];
 	unsigned int num_zones;
 	struct ttm_mem_zone *zone_kernel;
@@ -91,6 +88,5 @@ int ttm_mem_global_alloc_page(struct ttm_mem_global *glob,
 void ttm_mem_global_free_page(struct ttm_mem_global *glob,
 			      struct page *page, uint64_t size);
 size_t ttm_round_pot(size_t size);
-bool ttm_check_under_lowerlimit(struct ttm_mem_global *glob, uint64_t num_pages,
-				struct ttm_operation_ctx *ctx);
+
 #endif
-- 
2.30.2

