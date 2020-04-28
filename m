Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632A1BD4E9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0246ECB2;
	Wed, 29 Apr 2020 06:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDD76E822
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:58:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 188so3390628wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWP9bJBcY+iFWrSHlx03nfQJe5J4SsGubkbBauz1q14=;
 b=k83IpmJ+4v2LcFJoFQL6eXYzs1ZYJVQoNZ0G/9kvLa944lZJuc1cQLycdJHEw/uEsi
 hQebGRwyjpiXiXfSTupBwkPAE5ADmcJJWsKnqnfz3adWVG/GRMyS5WHZz/VzafW07c4a
 xKjZLk/aS6Zj97MouqXAl3FXO6XQa5u1TIbXqC1A5vtC/czxO1uzaI+y9P0miUHqd0zc
 SvEaH9QB6pqfjWhRN2SLlghuQ2pugwmFpJeVXPzUuzp8dRCQTNCtoYq55kr0oORavOCR
 XSfgT0Hzdt2LXiCkI1uajNlZ8h2j8IN4sv8m3S+/6WQFZa8SzQLXRwRo6Vtjr6Q64zCm
 Bq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWP9bJBcY+iFWrSHlx03nfQJe5J4SsGubkbBauz1q14=;
 b=WhHRIX5p4XPi+id/NCmyhjXN3rhGYo8FGltbcDqQFI8Wd409LAdZn1VI5ZyEfAWbTb
 hBtvcQ5aRE0SpKHi/G1Kzehp8X7i0oe4U8nmlndAYzWKxsnSzOLtgCBYBIb2OoSg7CRr
 IICwE7R6kVyTP3jyiQQ3FB1hnv8vAb7WzYJqhSS526wz6Exfunm+gedLAJr8k5x6IDck
 r4BWm0aV7VLAI7FIwO/jyrF6AcDczHInk5R7IJ3MDyM265S0bH8xc2hw9W7VrNdEFezd
 WxASCpXI318KlsMg+pYAyYSrEFVDRUvql2ja6fOx6x2e8lDipYivwjLnEC3eFxVi4PBz
 oQmw==
X-Gm-Message-State: AGi0PuYN5OOisJMHzg1LE/TQVUbk5i9jJlc7e4K9FSq5zIMWm9RDgXle
 eKeRbpDfQ4Ilr0tqnlxOi2vZPJmNe+4=
X-Google-Smtp-Source: APiQypImVvlv0JU4K47oqe7SX68HOZrKfTtIW+AiKRWJRAQgXKKigIlldXRC0tKulKHpybhqA0jjtQ==
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr5261781wmf.60.1588089532682;
 Tue, 28 Apr 2020 08:58:52 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F21C30072B6E4F5E01F2334.dip0.t-ipconnect.de.
 [2003:c5:8f21:c300:72b6:e4f5:e01f:2334])
 by smtp.gmail.com with ESMTPSA id j11sm26138157wrr.62.2020.04.28.08.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:58:52 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/mm: optimize rb_hole_addr rbtree search in high addr
 mode
Date: Tue, 28 Apr 2020 18:04:23 +0200
Message-Id: <20200428160423.4402-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: nirmoy.das@amd.com, christian.koenig@amd.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can severely fragment rb_hole_addr rbtree by manipulating
alignment while allocating buffers. Fragmented rb_hole_addr rbtree would
result in large delays while allocating buffer object for a userspace
application. It takes long time to find suitable hole because if we fail
to find a suitable hole in the first attempt then we look for neighbouring
nodes using rb_prev(). Traversing rbtree using rb_prev() can take really
long time if the tree is fragmented.

This patch improves searches in fragmented rb_hole_addr rbtree by storing
an extra field in drm_mm_node, max_hole_size. Each drm_mm_node now stores
maximum hole size for its subtree in drm_mm_node->max_hole_size. Using
drm_mm_node->max_hole_size, it is possible to eliminate complete
subtree if that subtree is unable to serve a request hence reducing number
of rb_prev() used.

Note: Implementation details of rb_hole_addr rbtree updates after a node
removal and addition is borrowed from block/bfq-wf2q.c which is trying to
achieve a similar goal.

With this patch applied, 1 million bo allocations on amdgpu took ~8 sec and
without the patch the test code took 28 sec for only 50k bo allocations.

partial test code:
int test_fragmentation(void)
{
#define MAX_ALLOC 1000000

	int i = 0;
	uint32_t  minor_version;
	uint32_t  major_version;

	struct amdgpu_bo_alloc_request request = {};
	amdgpu_bo_handle vram_handle[MAX_ALLOC] = {};
	amdgpu_device_handle device_handle;

	request.alloc_size = 4096;
	request.phys_alignment = 8192;
	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;

	int fd = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
	amdgpu_device_initialize(fd, &major_version,  &minor_version, &device_handle);

	for (i = 0; i < MAX_ALLOC; i++) {
		amdgpu_bo_alloc(device_handle, &request, &vram_handle[i]);
	}

	for (i = 0; i < MAX_ALLOC; i++)
		amdgpu_bo_free(vram_handle[i]);

	return 0;
}

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_mm.c | 140 +++++++++++++++++++++++++++++++++++++--
 include/drm/drm_mm.h     |   1 +
 2 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8981abe8b7c9..5076d3761f51 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -212,6 +212,84 @@ static void drm_mm_interval_tree_add_node(struct drm_mm_node *hole_node,
 				   &drm_mm_interval_tree_augment);
 }

+static void update_addr_hole_node_max(struct drm_mm_node *entity,
+				      struct rb_node *node)
+{
+	struct drm_mm_node *child;
+
+	if (node) {
+		child = rb_entry(node, struct drm_mm_node, rb_hole_addr);
+		if (child->max_hole_size > entity->max_hole_size)
+			entity->max_hole_size = child->max_hole_size;
+	}
+}
+
+static void update_addr_hole_node(struct rb_node *node)
+{
+	struct drm_mm_node *entity = rb_entry(node, struct drm_mm_node,
+					      rb_hole_addr);
+
+	entity->max_hole_size = entity->hole_size;
+	update_addr_hole_node_max(entity, node->rb_right);
+	update_addr_hole_node_max(entity, node->rb_left);
+}
+
+/**
+ * update_addr_hole_rbtree - update max_hole_size field for the whole tree.
+ * @node: the starting node.
+ *
+ * This function updates max_hole_size field of the @node and all the nodes
+ * that are in the path to the root.
+ */
+static void update_addr_hole_rbtree(struct rb_node *node)
+{
+	struct rb_node *parent;
+
+	while (node) {
+		update_addr_hole_node(node);
+
+		parent = rb_parent(node);
+		if (!parent)
+			return;
+
+		if (node == parent->rb_left && parent->rb_right)
+			update_addr_hole_node(parent->rb_right);
+		else if (parent->rb_left)
+			update_addr_hole_node(parent->rb_left);
+		node = parent;
+	}
+}
+
+/**
+ * find_deepest - find the deepest node that an extraction can modify.
+ * @node: the node being removed.
+ *
+ * This finction returns the deepest node that can be moved by rbtree's
+ * rebalance operation after removal of @node. If @node is the last node
+ * in the tree then return NULL.
+ */
+static struct rb_node *find_deepest(struct rb_node *node)
+{
+	struct rb_node *deepest = NULL;
+
+	if (!node->rb_left && !node->rb_right)
+		deepest = rb_parent(node);
+	else if (!node->rb_right)
+		deepest = node->rb_left;
+	else if (!node->rb_left)
+		deepest = node->rb_right;
+	else {
+		deepest = rb_next(node);
+		if (deepest->rb_right)
+			deepest = deepest->rb_right;
+		else if (rb_parent(deepest) != node)
+			deepest = rb_parent(deepest);
+
+	}
+
+	return deepest;
+}
+
 #define RB_INSERT(root, member, expr) do { \
 	struct rb_node **link = &root.rb_node, *rb = NULL; \
 	u64 x = expr(node); \
@@ -258,26 +336,39 @@ static void insert_hole_size(struct rb_root_cached *root,
 static void add_hole(struct drm_mm_node *node)
 {
 	struct drm_mm *mm = node->mm;
+	struct rb_node *rb = &node->rb_hole_addr;

 	node->hole_size =
 		__drm_mm_hole_node_end(node) - __drm_mm_hole_node_start(node);
+	node->max_hole_size = node->hole_size;
 	DRM_MM_BUG_ON(!drm_mm_hole_follows(node));

 	insert_hole_size(&mm->holes_size, node);
 	RB_INSERT(mm->holes_addr, rb_hole_addr, HOLE_ADDR);
-
 	list_add(&node->hole_stack, &mm->hole_stack);
+
+	if (rb->rb_left)
+		rb = rb->rb_left;
+	else if (rb->rb_right)
+		rb = rb->rb_right;
+
+	update_addr_hole_rbtree(rb);
 }

 static void rm_hole(struct drm_mm_node *node)
 {
+	struct rb_node *rb_deepest;
 	DRM_MM_BUG_ON(!drm_mm_hole_follows(node));

 	list_del(&node->hole_stack);
 	rb_erase_cached(&node->rb_hole_size, &node->mm->holes_size);
+
+	rb_deepest = find_deepest(&node->rb_hole_addr);
 	rb_erase(&node->rb_hole_addr, &node->mm->holes_addr);
-	node->hole_size = 0;
+	update_addr_hole_rbtree(rb_deepest);

+	node->hole_size = 0;
+	node->max_hole_size = 0;
 	DRM_MM_BUG_ON(drm_mm_hole_follows(node));
 }

@@ -338,6 +429,46 @@ static struct drm_mm_node *find_hole(struct drm_mm *mm, u64 addr)
 	return node;
 }

+/**
+ * next_hole_high_addr - returns next hole for a DRM_MM_INSERT_HIGH mode request
+ * @entry: previously selected drm_mm_node
+ * @size: size of the a hole needed for the request
+ *
+ * This function will verify whether left subtree of @entry has hole big enough
+ * to fit the requtested size. If so, it will return previous node of @entry or
+ * else it will return parent node of @entry
+ *
+ * It will also skip the complete left subtree if max_hole_size of that subtree
+ * is same as the max_hole_size of the @entry.
+ *
+ * Returns:
+ * previous node of @entry if left subtree of @entry can serve the request or
+ * else return parent of @entry
+ */
+static struct drm_mm_node *
+next_hole_high_addr(struct drm_mm_node *entry, u64 size)
+{
+	struct rb_node *rb_node, *left_rb_node, *parent_rb_node;
+	struct drm_mm_node *left_node;
+
+	if (!entry)
+		return false;
+
+	rb_node = &entry->rb_hole_addr;
+	if (rb_node->rb_left) {
+		left_rb_node = rb_node->rb_left;
+		parent_rb_node = rb_parent(rb_node);
+		left_node = rb_entry(left_rb_node,
+				     struct drm_mm_node, rb_hole_addr);
+		if ((left_node->max_hole_size < size ||
+		     entry->size == entry->max_hole_size) &&
+		    parent_rb_node && parent_rb_node->rb_left != rb_node)
+			return rb_hole_addr_to_node(parent_rb_node);
+	}
+
+	return rb_hole_addr_to_node(rb_prev(rb_node));
+}
+
 static struct drm_mm_node *
 first_hole(struct drm_mm *mm,
 	   u64 start, u64 end, u64 size,
@@ -364,6 +495,7 @@ first_hole(struct drm_mm *mm,
 static struct drm_mm_node *
 next_hole(struct drm_mm *mm,
 	  struct drm_mm_node *node,
+	  u64 size,
 	  enum drm_mm_insert_mode mode)
 {
 	switch (mode) {
@@ -375,7 +507,7 @@ next_hole(struct drm_mm *mm,
 		return rb_hole_addr_to_node(rb_next(&node->rb_hole_addr));

 	case DRM_MM_INSERT_HIGH:
-		return rb_hole_addr_to_node(rb_prev(&node->rb_hole_addr));
+		return next_hole_high_addr(node, size);

 	case DRM_MM_INSERT_EVICT:
 		node = list_next_entry(node, hole_stack);
@@ -489,7 +621,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
 	for (hole = first_hole(mm, range_start, range_end, size, mode);
 	     hole;
-	     hole = once ? NULL : next_hole(mm, hole, mode)) {
+	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
 		u64 hole_start = __drm_mm_hole_node_start(hole);
 		u64 hole_end = hole_start + hole->hole_size;
 		u64 adj_start, adj_end;
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index ee8b0e80ca90..0ee555ff2d9e 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -168,6 +168,7 @@ struct drm_mm_node {
 	struct rb_node rb_hole_addr;
 	u64 __subtree_last;
 	u64 hole_size;
+	u64 max_hole_size;
 	unsigned long flags;
 #define DRM_MM_NODE_ALLOCATED_BIT	0
 #define DRM_MM_NODE_SCANNED_BIT		1
--
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
