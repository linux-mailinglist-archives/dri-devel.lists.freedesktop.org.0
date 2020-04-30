Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78B1C0E9A
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855166EA7D;
	Fri,  1 May 2020 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0806E1CD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 09:58:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x18so6113443wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zI7eO/+C5t+TlQMUL1aDaJ2PIIMDe9Tv8qhZ0bcTZ50=;
 b=ijUKXoPrazWZJJz35JpYHP60gIEX9d0VRprVIMdxQl5+Q2XYRvhtePj3RQ4ZWBi6Do
 TYkE92mptxCkGBFtN6Fd+myN93QZyccQUQm6U1Ow1zkOj3uRLf2+z/QyM5SDwQPV+aSk
 Tu3aJNDRKTKHfE9Y+dJv6LOu+h1MnUaSuik9qEqw2VCzocWg6vRGd4nF/nCiPIZK/OPk
 Yy0wiO1Ttl3DzhB9ascMMA0nq/aK9VcbRq1IfTrER5cbkiKFoudLMsZJNfShSc99PVbe
 0lh8O11uoCWdp+qU0XZH53kC7g+C7AiPYXWv5yi7wr5qYcr7HzLyAGQk3js5S0W44nxt
 dPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zI7eO/+C5t+TlQMUL1aDaJ2PIIMDe9Tv8qhZ0bcTZ50=;
 b=qi7kHed17YhjZloZ7tD8qXGsGRRemWDU0uEg/WycRPyly18pzOyWH/suVJwc/tVHzN
 IItQFMyWcZOjohNqo7Et8mnve1xrxGkSAnegCYCNNUb0nokYCnpCZDn072TZLJbAm638
 3o5Yl6v0C4xMdtp/0fHx7eTr0mMIf1TDn1SqMjdRQkERlya0OHpB8cBKvwFQa9qayOLR
 LtAsFlsGxINLn62bpggr2t7s3UD/fIElvP6L4ruXfw4VWZ6/tdqU5ZAHjeUscWD4Xc+J
 lbpka02R7TnuxnvpdyLSvmYrtkhAPPTZrqNjJlhAT3JNYe/bCr+i14ZlfTIYdky43LAg
 EuoA==
X-Gm-Message-State: AGi0PuZ9Y10VaN3kzFWbHNrl/CEl5Qdq8Tv+6vB1wCmS5q5xPmqgKqwc
 KxL4dqULn/EOvMEStV9FzpGa8VKlcz8=
X-Google-Smtp-Source: APiQypIMBp0I83SfsYByMNKT3FMh1aFNQGLzvYF1vmn0DIw49Nvryl4vBPn6409/cw4QoPyDz++oyQ==
X-Received: by 2002:adf:fe45:: with SMTP id m5mr3379343wrs.124.1588240726115; 
 Thu, 30 Apr 2020 02:58:46 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F2145005588D4746D32BFDA.dip0.t-ipconnect.de.
 [2003:c5:8f21:4500:5588:d474:6d32:bfda])
 by smtp.gmail.com with ESMTPSA id v10sm3255735wrq.45.2020.04.30.02.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 02:58:45 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/mm: optimize rb_hole_addr rbtree search
Date: Thu, 30 Apr 2020 11:58:39 +0200
Message-Id: <20200430095839.6474-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
alignment while allocating buffers. Fragmented rb_hole_addr rbtree
would result in large delays while allocating buffer object for a
userspace application. It takes long time to find suitable hole
because if we fail to find a suitable hole in the first attempt
then we look for neighbouring nodes using rb_prev()/rb_next().
Traversing rbtree using rb_prev()/rb_next() can take really long
time if the tree is fragmented.

This patch improves searches in fragmented rb_hole_addr rbtree by
modifying it to an augmented rbtree which will store an extra field
in drm_mm_node, subtree_max_hole. Each drm_mm_node now stores maximum
hole size for its subtree in drm_mm_node->subtree_max_hole. Using
drm_mm_node->subtree_max_hole, it is possible to eliminate complete subtree
if that subtree is unable to serve a request hence reducing number of
rb_prev()/rb_next() used.

With this patch applied, 1 million bo allocations on amdgpu took ~8 sec and
without the patch the test code took 28 sec for only 50k bo allocs.

partial test code:
int test_fragmentation(void)
{

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
        amdgpu_device_initialize(fd, &major_version,  &minor_version,
				 &device_handle);

        for (i = 0; i < MAX_ALLOC; i++) {
                amdgpu_bo_alloc(device_handle, &request, &vram_handle[i]);
        }

        for (i = 0; i < MAX_ALLOC; i++)
                amdgpu_bo_free(vram_handle[i]);

        return 0;
}

v2:
Use RB_DECLARE_CALLBACKS_MAX to maintain subtree_max_hole

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_mm.c | 133 +++++++++++++++++++++++++++++++++------
 include/drm/drm_mm.h     |   1 +
 2 files changed, 115 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8981abe8b7c9..effc6e5cac45 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -212,20 +212,6 @@ static void drm_mm_interval_tree_add_node(struct drm_mm_node *hole_node,
 				   &drm_mm_interval_tree_augment);
 }

-#define RB_INSERT(root, member, expr) do { \
-	struct rb_node **link = &root.rb_node, *rb = NULL; \
-	u64 x = expr(node); \
-	while (*link) { \
-		rb = *link; \
-		if (x < expr(rb_entry(rb, struct drm_mm_node, member))) \
-			link = &rb->rb_left; \
-		else \
-			link = &rb->rb_right; \
-	} \
-	rb_link_node(&node->member, rb, link); \
-	rb_insert_color(&node->member, &root); \
-} while (0)
-
 #define HOLE_SIZE(NODE) ((NODE)->hole_size)
 #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))

@@ -255,16 +241,42 @@ static void insert_hole_size(struct rb_root_cached *root,
 	rb_insert_color_cached(&node->rb_hole_size, root, first);
 }

+RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
+			 struct drm_mm_node, rb_hole_addr,
+			 u64, subtree_max_hole, HOLE_SIZE)
+
+void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
+{
+	struct rb_node **link = &root->rb_node, *rb_parent = NULL;
+	u64 start = HOLE_ADDR(node), subtree_max_hole = node->subtree_max_hole;
+	struct drm_mm_node *parent;
+
+	while (*link) {
+		rb_parent = *link;
+		parent = rb_entry(rb_parent, struct drm_mm_node, rb_hole_addr);
+		if (parent->subtree_max_hole < subtree_max_hole)
+			parent->subtree_max_hole = subtree_max_hole;
+		if (start < HOLE_ADDR(parent))
+			link = &parent->rb_hole_addr.rb_left;
+		else
+			link = &parent->rb_hole_addr.rb_right;
+	}
+
+	rb_link_node(&node->rb_hole_addr, rb_parent, link);
+	rb_insert_augmented(&node->rb_hole_addr, root, &augment_callbacks);
+}
+
 static void add_hole(struct drm_mm_node *node)
 {
 	struct drm_mm *mm = node->mm;

 	node->hole_size =
 		__drm_mm_hole_node_end(node) - __drm_mm_hole_node_start(node);
+	node->subtree_max_hole = node->hole_size;
 	DRM_MM_BUG_ON(!drm_mm_hole_follows(node));

 	insert_hole_size(&mm->holes_size, node);
-	RB_INSERT(mm->holes_addr, rb_hole_addr, HOLE_ADDR);
+	insert_hole_addr(&mm->holes_addr, node);

 	list_add(&node->hole_stack, &mm->hole_stack);
 }
@@ -275,8 +287,10 @@ static void rm_hole(struct drm_mm_node *node)

 	list_del(&node->hole_stack);
 	rb_erase_cached(&node->rb_hole_size, &node->mm->holes_size);
-	rb_erase(&node->rb_hole_addr, &node->mm->holes_addr);
+	rb_erase_augmented(&node->rb_hole_addr, &node->mm->holes_addr,
+			   &augment_callbacks);
 	node->hole_size = 0;
+	node->subtree_max_hole = 0;

 	DRM_MM_BUG_ON(drm_mm_hole_follows(node));
 }
@@ -361,9 +375,90 @@ first_hole(struct drm_mm *mm,
 	}
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
+ * It will also skip the complete left subtree if subtree_max_hole of that
+ * subtree is same as the subtree_max_hole of the @entry.
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
+		if ((left_node->subtree_max_hole < size ||
+		     entry->size == entry->subtree_max_hole) &&
+		    parent_rb_node && parent_rb_node->rb_left != rb_node)
+			return rb_hole_addr_to_node(parent_rb_node);
+	}
+
+	return rb_hole_addr_to_node(rb_prev(rb_node));
+}
+
+/**
+ * next_hole_low_addr - returns next hole for a DRM_MM_INSERT_LOW mode request
+ * @entry: previously selected drm_mm_node
+ * @size: size of the a hole needed for the request
+ *
+ * This function will verify whether right subtree of @entry has hole big enough
+ * to fit the requtested size. If so, it will return next node of @entry or
+ * else it will return parent node of @entry
+ *
+ * It will also skip the complete right subtree if subtree_max_hole of that
+ * subtree is same as the subtree_max_hole of the @entry.
+ *
+ * Returns:
+ * next node of @entry if right subtree of @entry can serve the request or
+ * else return parent of @entry
+ */
+static struct drm_mm_node *
+next_hole_low_addr(struct drm_mm_node *entry, u64 size)
+{
+	struct rb_node *rb_node, *right_rb_node, *parent_rb_node;
+	struct drm_mm_node *right_node;
+
+	if (!entry)
+		return false;
+
+	rb_node = &entry->rb_hole_addr;
+	if (rb_node->rb_right) {
+		right_rb_node = rb_node->rb_right;
+		parent_rb_node = rb_parent(rb_node);
+		right_node = rb_entry(right_rb_node,
+				      struct drm_mm_node, rb_hole_addr);
+		if ((right_node->subtree_max_hole < size ||
+		     entry->size == entry->subtree_max_hole) &&
+		    parent_rb_node && parent_rb_node->rb_right != rb_node)
+			return rb_hole_addr_to_node(parent_rb_node);
+	}
+
+	return rb_hole_addr_to_node(rb_next(rb_node));
+}
+
 static struct drm_mm_node *
 next_hole(struct drm_mm *mm,
 	  struct drm_mm_node *node,
+	  u64 size,
 	  enum drm_mm_insert_mode mode)
 {
 	switch (mode) {
@@ -372,10 +467,10 @@ next_hole(struct drm_mm *mm,
 		return rb_hole_size_to_node(rb_prev(&node->rb_hole_size));

 	case DRM_MM_INSERT_LOW:
-		return rb_hole_addr_to_node(rb_next(&node->rb_hole_addr));
+		return next_hole_low_addr(node, size);

 	case DRM_MM_INSERT_HIGH:
-		return rb_hole_addr_to_node(rb_prev(&node->rb_hole_addr));
+		return next_hole_high_addr(node, size);

 	case DRM_MM_INSERT_EVICT:
 		node = list_next_entry(node, hole_stack);
@@ -489,7 +584,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
 	for (hole = first_hole(mm, range_start, range_end, size, mode);
 	     hole;
-	     hole = once ? NULL : next_hole(mm, hole, mode)) {
+	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
 		u64 hole_start = __drm_mm_hole_node_start(hole);
 		u64 hole_end = hole_start + hole->hole_size;
 		u64 adj_start, adj_end;
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index ee8b0e80ca90..a01bc6fac83c 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -168,6 +168,7 @@ struct drm_mm_node {
 	struct rb_node rb_hole_addr;
 	u64 __subtree_last;
 	u64 hole_size;
+	u64 subtree_max_hole;
 	unsigned long flags;
 #define DRM_MM_NODE_ALLOCATED_BIT	0
 #define DRM_MM_NODE_SCANNED_BIT		1
--
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
