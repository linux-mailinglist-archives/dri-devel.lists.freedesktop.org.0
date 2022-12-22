Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FB654872
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F3E10E5B2;
	Thu, 22 Dec 2022 22:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A7910E598;
 Thu, 22 Dec 2022 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748120; x=1703284120;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8fxMf+iFzsgQPjxzKAFs6IknZTmP9FolMXVoWON+Gdk=;
 b=nfNEYjv2RfTHM1Tl7omJK1let3zMnzaU3+UR2SC4uLbB5U0rF2tkVtI9
 qb4ljDXhu9WE7n11WLaPgD/JVM5gZNps1MaVWP3Wr025xc4ti9+/4xupg
 w83CP9V9Kbf2JC15RmWZKO5wM7bxvlw8cm+hOZ4xJyQUR23E0FGKt7WcX
 GlPtO8ft4D2wfO26mNv1GiLu/0hqqZ3uWD6bLeRqiRnax78KcWNy6aSYH
 TjIjzVY29HFuvGPZjtpzxwXfDAIi9MqSvhykgWhWtAfDvbkPENL5JbLbV
 cCYZ9C4q6rCflP3Y9Fg+5Niv2ZL7Y8FhoZ3GeYSUIOW9IMHmL6OxxLRaP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472855"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412317"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412317"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 09/20] drm: Add a gpu page-table walker helper
Date: Thu, 22 Dec 2022 14:21:16 -0800
Message-Id: <20221222222127.34560-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Add a gpu page table walker similar in functionality to the cpu page-table
walker in mm/pagewalk.c. This is made a drm helper in the hope that it
might prove useful to other drivers, but we could of course make it
single-driver only and rename the functions initially.

Also if remaining a DRM helper, we should consider making it a helper
kernel module of its own.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Makefile      |   1 +
 drivers/gpu/drm/drm_pt_walk.c | 159 +++++++++++++++++++++++++++++++++
 include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_pt_walk.c
 create mode 100644 include/drm/drm_pt_walk.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 23ad760884b2..d030c2885dd8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -39,6 +39,7 @@ drm-y := \
 	drm_prime.o \
 	drm_print.o \
 	drm_property.o \
+	drm_pt_walk.o \
 	drm_syncobj.o \
 	drm_sysfs.o \
 	drm_trace_points.o \
diff --git a/drivers/gpu/drm/drm_pt_walk.c b/drivers/gpu/drm/drm_pt_walk.c
new file mode 100644
index 000000000000..1a0b147a3acc
--- /dev/null
+++ b/drivers/gpu/drm/drm_pt_walk.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#include <drm/drm_pt_walk.h>
+
+/**
+ * DOC: GPU page-table tree walking.
+ * The utilities in this file are similar to the CPU page-table walk
+ * utilities in mm/pagewalk.c. The main difference is that we distinguish
+ * the various levels of a page-table tree with an unsigned integer rather
+ * than by name. 0 is the lowest level, and page-tables with level 0 can
+ * not be directories pointing to lower levels, whereas all other levels
+ * can. The user of the utilities determines the highest level.
+ *
+ * Nomenclature:
+ * Each struct drm_pt, regardless of level is referred to as a page table, and
+ * multiple page tables typically form a page table tree with page tables at
+ * intermediate levels being page directories pointing at page tables at lower
+ * levels. A shared page table for a given address range is a page-table which
+ * is neither fully within nor fully outside the address range and that can
+ * thus be shared by two or more address ranges.
+ */
+static u64 drm_pt_addr_end(u64 addr, u64 end, unsigned int level,
+			   const struct drm_pt_walk *walk)
+{
+	u64 size = 1ull << walk->shifts[level];
+	u64 tmp = round_up(addr + 1, size);
+
+	return min_t(u64, tmp, end);
+}
+
+static bool drm_pt_next(pgoff_t *offset, u64 *addr, u64 next, u64 end,
+			unsigned int level, const struct drm_pt_walk *walk)
+{
+	pgoff_t step = 1;
+
+	/* Shared pt walk skips to the last pagetable */
+	if (unlikely(walk->shared_pt_mode)) {
+		unsigned int shift = walk->shifts[level];
+		u64 skip_to = round_down(end, 1ull << shift);
+
+		if (skip_to > next) {
+			step += (skip_to - next) >> shift;
+			next = skip_to;
+		}
+	}
+
+	*addr = next;
+	*offset += step;
+
+	return next != end;
+}
+
+/**
+ * drm_pt_walk_range() - Walk a range of a gpu page table tree with callbacks
+ * for each page-table entry in all levels.
+ * @parent: The root page table for walk start.
+ * @level: The root page table level.
+ * @addr: Virtual address start.
+ * @end: Virtual address end + 1.
+ * @walk: Walk info.
+ *
+ * Similar to the CPU page-table walker, this is a helper to walk
+ * a gpu page table and call a provided callback function for each entry.
+ *
+ * Return: 0 on success, negative error code on error. The error is
+ * propagated from the callback and on error the walk is terminated.
+ */
+int drm_pt_walk_range(struct drm_pt *parent, unsigned int level,
+		      u64 addr, u64 end, struct drm_pt_walk *walk)
+{
+	pgoff_t offset = drm_pt_offset(addr, level, walk);
+	struct drm_pt **entries = parent->dir ? parent->dir->entries : NULL;
+	const struct drm_pt_walk_ops *ops = walk->ops;
+	enum page_walk_action action;
+	struct drm_pt *child;
+	int err = 0;
+	u64 next;
+
+	do {
+		next = drm_pt_addr_end(addr, end, level, walk);
+		if (walk->shared_pt_mode && drm_pt_covers(addr, next, level,
+							  walk))
+			continue;
+again:
+		action = ACTION_SUBTREE;
+		child = entries ? entries[offset] : NULL;
+		err = ops->pt_entry(parent, offset, level, addr, next,
+				    &child, &action, walk);
+		if (err)
+			break;
+
+		/* Probably not needed yet for gpu pagetable walk. */
+		if (unlikely(action == ACTION_AGAIN))
+			goto again;
+
+		if (likely(!level || !child || action == ACTION_CONTINUE))
+			continue;
+
+		err = drm_pt_walk_range(child, level - 1, addr, next, walk);
+
+		if (!err && ops->pt_post_descend)
+			err = ops->pt_post_descend(parent, offset, level, addr,
+						   next, &child, &action, walk);
+		if (err)
+			break;
+
+	} while (drm_pt_next(&offset, &addr, next, end, level, walk));
+
+	return err;
+}
+EXPORT_SYMBOL(drm_pt_walk_range);
+
+/**
+ * drm_pt_walk_shared() - Walk shared page tables of a page-table tree.
+ * @parent: Root page table directory.
+ * @level: Level of the root.
+ * @addr: Start address.
+ * @end: Last address + 1.
+ * @walk: Walk info.
+ *
+ * This function is similar to drm_pt_walk_range() but it skips page tables
+ * that are private to the range. Since the root (or @parent) page table is
+ * typically also a shared page table this function is different in that it
+ * calls the pt_entry callback and the post_descend callback also for the
+ * root. The root can be detected in the callbacks by checking whether
+ * parent == *child.
+ * Walking only the shared page tables is common for unbind-type operations
+ * where the page-table entries for an address range are cleared or detached
+ * from the main page-table tree.
+ *
+ * Return: 0 on success, negative error code on error: If a callback
+ * returns an error, the walk will be terminated and the error returned by
+ * this function.
+ */
+int drm_pt_walk_shared(struct drm_pt *parent, unsigned int level,
+		       u64 addr, u64 end, struct drm_pt_walk *walk)
+{
+	const struct drm_pt_walk_ops *ops = walk->ops;
+	enum page_walk_action action = ACTION_SUBTREE;
+	struct drm_pt *child = parent;
+	int err;
+
+	walk->shared_pt_mode = true;
+	err = walk->ops->pt_entry(parent, 0, level + 1, addr, end,
+				  &child, &action, walk);
+
+	if (err || action != ACTION_SUBTREE)
+		return err;
+
+	err = drm_pt_walk_range(parent, level, addr, end, walk);
+	if (!err && ops->pt_post_descend) {
+		err = ops->pt_post_descend(parent, 0, level + 1, addr, end,
+					   &child, &action, walk);
+	}
+	return err;
+}
+EXPORT_SYMBOL(drm_pt_walk_shared);
diff --git a/include/drm/drm_pt_walk.h b/include/drm/drm_pt_walk.h
new file mode 100644
index 000000000000..64e7a418217c
--- /dev/null
+++ b/include/drm/drm_pt_walk.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef __DRM_PT_WALK__
+#define __DRM_PT_WALK__
+
+#include <linux/pagewalk.h>
+#include <linux/types.h>
+
+struct drm_pt_dir;
+
+/**
+ * struct drm_pt - base class for driver pagetable subclassing.
+ * @dir: Pointer to an array of children if any.
+ *
+ * Drivers could subclass this, and if it's a page-directory, typically
+ * embed the drm_pt_dir::entries array in the same allocation.
+ */
+struct drm_pt {
+	struct drm_pt_dir *dir;
+};
+
+/**
+ * struct drm_pt_dir - page directory structure
+ * @entries: Array holding page directory children.
+ *
+ * It is the responsibility of the user to ensure @entries is
+ * correctly sized.
+ */
+struct drm_pt_dir {
+	struct drm_pt *entries[0];
+};
+
+/**
+ * struct drm_pt_walk - Embeddable struct for walk parameters
+ */
+struct drm_pt_walk {
+	/** @ops: The walk ops used for the pagewalk */
+	const struct drm_pt_walk_ops *ops;
+	/**
+	 * @shifts: Array of page-table entry shifts used for the
+	 * different levels, starting out with the leaf level 0
+	 * page-shift as the first entry. It's legal for this pointer to be
+	 * changed during the walk.
+	 */
+	const u64 *shifts;
+	/** @max_level: Highest populated level in @sizes */
+	unsigned int max_level;
+	/**
+	 * @shared_pt_mode: Whether to skip all entries that are private
+	 * to the address range and called only for entries that are
+	 * shared with other address ranges. Such entries are referred to
+	 * as shared pagetables.
+	 */
+	bool shared_pt_mode;
+};
+
+/**
+ * typedef drm_pt_entry_fn - gpu page-table-walk callback-function
+ * @parent: The parent page.table.
+ * @offset: The offset (number of entries) into the page table.
+ * @level: The level of @parent.
+ * @addr: The virtual address.
+ * @next: The virtual address for the next call, or end address.
+ * @child: Pointer to pointer to child page-table at this @offset. The
+ * function may modify the value pointed to if, for example, allocating a
+ * child page table.
+ * @action: The walk action to take upon return. See <linux/pagewalk.h>.
+ * @walk: The walk parameters.
+ */
+typedef int (*drm_pt_entry_fn)(struct drm_pt *parent, pgoff_t offset,
+			       unsigned int level, u64 addr, u64 next,
+			       struct drm_pt **child,
+			       enum page_walk_action *action,
+			       struct drm_pt_walk *walk);
+
+/**
+ * struct drm_pt_walk_ops - Walk callbacks.
+ */
+struct drm_pt_walk_ops {
+	/**
+	 * @pt_entry: Callback to be called for each page table entry prior
+	 * to descending to the next level. The returned value of the action
+	 * function parameter is honored.
+	 */
+	drm_pt_entry_fn pt_entry;
+	/**
+	 * @pt_post_descend: Callback to be called for each page table entry
+	 * after return from descending to the next level. The returned value
+	 * of the action function parameter is ignored.
+	 */
+	drm_pt_entry_fn pt_post_descend;
+};
+
+int drm_pt_walk_range(struct drm_pt *parent, unsigned int level,
+		      u64 addr, u64 end, struct drm_pt_walk *walk);
+
+int drm_pt_walk_shared(struct drm_pt *parent, unsigned int level,
+		       u64 addr, u64 end, struct drm_pt_walk *walk);
+
+/**
+ * drm_pt_covers - Whether the address range covers an entire entry in @level
+ * @addr: Start of the range.
+ * @end: End of range + 1.
+ * @level: Page table level.
+ * @walk: Page table walk info.
+ *
+ * This function is a helper to aid in determining whether a leaf page table
+ * entry can be inserted at this @level.
+ *
+ * Return: Whether the range provided covers exactly an entry at this level.
+ */
+static inline bool drm_pt_covers(u64 addr, u64 end, unsigned int level,
+				 const struct drm_pt_walk *walk)
+{
+	u64 pt_size = 1ull << walk->shifts[level];
+
+	return end - addr == pt_size && IS_ALIGNED(addr, pt_size);
+}
+
+/**
+ * drm_pt_num_entries: Number of page-table entries of a given range at this
+ * level
+ * @addr: Start address.
+ * @end: End address.
+ * @level: Page table level.
+ * @walk: Walk info.
+ *
+ * Return: The number of page table entries at this level between @start and
+ * @end.
+ */
+static inline pgoff_t
+drm_pt_num_entries(u64 addr, u64 end, unsigned int level,
+		   const struct drm_pt_walk *walk)
+{
+	u64 pt_size = 1ull << walk->shifts[level];
+
+	return (round_up(end, pt_size) - round_down(addr, pt_size)) >>
+		walk->shifts[level];
+}
+
+/**
+ * drm_pt_offset: Offset of the page-table entry for a given address.
+ * @addr: The address.
+ * @level: Page table level.
+ * @walk: Walk info.
+ *
+ * Return: The page table entry offset for the given address in a
+ * page table with size indicated by @level.
+ */
+static inline pgoff_t
+drm_pt_offset(u64 addr, unsigned int level, const struct drm_pt_walk *walk)
+{
+	if (level < walk->max_level)
+		addr &= ((1ull << walk->shifts[level + 1]) - 1);
+
+	return addr >> walk->shifts[level];
+}
+
+#endif
-- 
2.37.3

