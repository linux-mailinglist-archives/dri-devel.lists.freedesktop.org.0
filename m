Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FE1DAC49
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508436E584;
	Wed, 20 May 2020 07:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3EF6E2E5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:44:40 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id l3so6092911qvo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8Wy5iTQTfpPIJwaZ6RM6+deZkQ97iFi6kdqB6gSy3c=;
 b=LK7Anxw+eb6p3YNCfr0LjUe4pqmjWmTh+LXU3Hj8KX0FvFaImWpaB+6dtEM03d0hod
 d1G8jxZqfF003EEgahpQldeKKJyZ8DLhI+1KwAOqDR6D9eIs1F/m5MKO5hapUFBptiIE
 gtc/hBnzp3QBKIkNxbsEax39ttWkWvDGFHyijTiL+0lOfk7NInuoHCwIFlr4oalYwowc
 PPAnSzc3BbuEaDh3zeNTHy3JjmkQN3+4JwAxSyqCN42mCnPjtDv3cS7on8tbylLNiHyy
 +HY0wsTLXu/fFAAQsqpsuQF6MOXHkY5NmfgQX4z8/6YxHJmDdaO63XTEvTns1hE4u2MW
 s2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8Wy5iTQTfpPIJwaZ6RM6+deZkQ97iFi6kdqB6gSy3c=;
 b=qB73GLa6HqUd3gjJGg2tZRcItP7mmhFod9ozxaMzxqkdl7lBh6L3kVHJrKSsAhHhcl
 6QTTTf2ZB6vBmxe3E/tW8pQ4IqzTNDlMVakOxeXy3ssxWGFWZMOnaEyN7zvT3RJ+nOIB
 NawPlOhMXnfDRnYY9pFiJMlGht/zAsaAoNcWRdWn1HGpWzs+LlVtmFQErxev21+uveli
 8QPdtLbtpEqR+8yS42wTojkbRVse3LbISagzVi5kqDJFaITla+xa8G0rhzPOFEKWSqGn
 gVny54PZkS5kNfV2mSqi7qlplkpehowNXdDCB9RR5qT/nWn2r4rEkxFqTQxU8N8CG6w5
 ZUYA==
X-Gm-Message-State: AOAM5305ngRTHxpMs3OKhM5/884hAyIAwJEnp+S66UENQuDMptUbhe4f
 pFqv5OhIumPXu97GbjfOVWc2XeBsKR4=
X-Google-Smtp-Source: ABdhPJxuJ+jBSXMa9EZ8oWgO+xvpQzmxAnzKmZ4TbRVA/5q0qhrPvFtZA2PC3z4BFIUG305FDSf3kA==
X-Received: by 2002:a05:6214:40e:: with SMTP id
 z14mr19222255qvx.150.1589877879580; 
 Tue, 19 May 2020 01:44:39 -0700 (PDT)
Received: from localhost.localdomain.amd.com
 (p200300c58f25850023856023606ce396.dip0.t-ipconnect.de.
 [2003:c5:8f25:8500:2385:6023:606c:e396])
 by smtp.gmail.com with ESMTPSA id l64sm5126494qkd.15.2020.05.19.01.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 01:44:39 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/mm: improve rb_hole_addr rbtree search
Date: Tue, 19 May 2020 10:44:36 +0200
Message-Id: <20200519084436.91718-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519084436.91718-1-nirmoy.das@amd.com>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: nirmoy.aiemd@gmail.com, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can still abuse alignment while allocating buffer object
to slow down rb_hole_addr rbtree search. This patch improves search
in fragmented rb_hole_addr rbtree by storing maximum subtree hole
alignment and use that to skip a complete subtree if that subtree
can not fit a (size + alignment) request.

With this patch applied, 50k bo allocs of size 4k and alignment 9k
took ~0.24 sec on amdgpu, compared to  27 sec without it.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_mm.c | 66 ++++++++++++++++++++++++++++++++++------
 include/drm/drm_mm.h     |  1 +
 2 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 91e90c635e05..1af0a211b660 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -212,8 +212,11 @@ static void drm_mm_interval_tree_add_node(struct drm_mm_node *hole_node,
 				   &drm_mm_interval_tree_augment);
 }
 
+#define DRM_MM_ALIGN_SHIFT 6
 #define HOLE_SIZE(NODE) ((NODE)->hole_size)
 #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
+#define HOLE_SIZE_ALIGN(NODE) ((NODE->hole_size << DRM_MM_ALIGN_SHIFT) | \
+			       ffs(HOLE_ADDR(NODE)))
 
 static u64 rb_to_hole_size(struct rb_node *rb)
 {
@@ -241,6 +244,33 @@ static void insert_hole_size(struct rb_root_cached *root,
 	rb_insert_color_cached(&node->rb_hole_size, root, first);
 }
 
+static inline bool
+augment_callbacks_compute_max_hole_align(struct drm_mm_node *node, bool exit)
+{
+	struct drm_mm_node *child;
+	u64 max = HOLE_SIZE_ALIGN(node);
+
+	if (node->rb_hole_addr.rb_left) {
+		child = rb_entry(node->rb_hole_addr.rb_left, struct drm_mm_node,
+				 rb_hole_addr);
+		if (child->subtree_max_hole_align > max)
+			max = child->subtree_max_hole_align;
+	}
+
+	if (node->rb_hole_addr.rb_right) {
+		child = rb_entry(node->rb_hole_addr.rb_right,
+				 struct drm_mm_node, rb_hole_addr);
+		if (child->subtree_max_hole_align > max)
+			max = child->subtree_max_hole_align;
+	}
+
+	if (exit && node->subtree_max_hole_align == max)
+		return true;
+
+	node->subtree_max_hole_align = max;
+	return false;
+}
+
 static inline bool
 augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
 {
@@ -271,10 +301,14 @@ augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
 static inline void
 augment_callbacks_propagate(struct rb_node *rb, struct rb_node *stop)
 {
+	bool compute_max_hole, compute_max_hole_align;
+
 	while (rb != stop) {
 		struct drm_mm_node *node = rb_entry(rb,  struct drm_mm_node,
 						    rb_hole_addr);
-		if (augment_callbacks_compute_max_hole(node, true))
+		compute_max_hole = augment_callbacks_compute_max_hole(node, true);
+		compute_max_hole_align = augment_callbacks_compute_max_hole_align(node, true);
+		if (compute_max_hole && compute_max_hole_align)
 			break;
 
 		rb = rb_parent(&node->rb_hole_addr);
@@ -290,6 +324,7 @@ augment_callbacks_copy(struct rb_node *rb_old, struct rb_node *rb_new)
 					   rb_hole_addr);
 
 	new->subtree_max_hole = old->subtree_max_hole;
+	new->subtree_max_hole_align = old->subtree_max_hole_align;
 }
 
 static void
@@ -301,7 +336,9 @@ augment_callbacks_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
 					   rb_hole_addr);
 
 	new->subtree_max_hole = old->subtree_max_hole;
+	new->subtree_max_hole_align = old->subtree_max_hole_align;
 	augment_callbacks_compute_max_hole(old, false);
+	augment_callbacks_compute_max_hole_align(old, false);
 }
 
 static const struct rb_augment_callbacks augment_callbacks = {
@@ -313,7 +350,9 @@ static const struct rb_augment_callbacks augment_callbacks = {
 static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
 {
 	struct rb_node **link = &root->rb_node, *rb_parent = NULL;
-	u64 start = HOLE_ADDR(node), subtree_max_hole = node->subtree_max_hole;
+	u64 start = HOLE_ADDR(node);
+	u64 subtree_max_hole = node->subtree_max_hole;
+	u64 subtree_max_hole_align = node->subtree_max_hole_align;
 	struct drm_mm_node *parent;
 
 	while (*link) {
@@ -322,6 +361,9 @@ static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
 		if (parent->subtree_max_hole < subtree_max_hole)
 			parent->subtree_max_hole = subtree_max_hole;
 
+		if (parent->subtree_max_hole_align < subtree_max_hole_align)
+			parent->subtree_max_hole_align = subtree_max_hole_align;
+
 		if (start < HOLE_ADDR(parent))
 			link = &parent->rb_hole_addr.rb_left;
 		else
@@ -339,6 +381,7 @@ static void add_hole(struct drm_mm_node *node)
 	node->hole_size =
 		__drm_mm_hole_node_end(node) - __drm_mm_hole_node_start(node);
 	node->subtree_max_hole = node->hole_size;
+	node->subtree_max_hole_align = HOLE_SIZE_ALIGN(node);
 	DRM_MM_BUG_ON(!drm_mm_hole_follows(node));
 
 	insert_hole_size(&mm->holes_size, node);
@@ -355,8 +398,10 @@ static void rm_hole(struct drm_mm_node *node)
 	rb_erase_cached(&node->rb_hole_size, &node->mm->holes_size);
 	rb_erase_augmented(&node->rb_hole_addr, &node->mm->holes_addr,
 			   &augment_callbacks);
+
 	node->hole_size = 0;
 	node->subtree_max_hole = 0;
+	node->subtree_max_hole_align = 0;
 
 	DRM_MM_BUG_ON(drm_mm_hole_follows(node));
 }
@@ -458,10 +503,11 @@ first_hole(struct drm_mm *mm,
  * else return parent of @entry
  */
 static struct drm_mm_node *
-next_hole_high_addr(struct drm_mm_node *entry, u64 size)
+next_hole_high_addr(struct drm_mm_node *entry, u64 size, u64 alignment)
 {
 	struct rb_node *rb_node, *left_rb_node, *parent_rb_node;
 	struct drm_mm_node *left_node;
+	u64 req_align = (size + alignment) << DRM_MM_ALIGN_SHIFT;
 
 	if (!entry)
 		return NULL;
@@ -473,6 +519,7 @@ next_hole_high_addr(struct drm_mm_node *entry, u64 size)
 		left_node = rb_entry(left_rb_node,
 				     struct drm_mm_node, rb_hole_addr);
 		if ((left_node->subtree_max_hole < size ||
+		     left_node->subtree_max_hole_align < req_align ||
 		     entry->size == entry->subtree_max_hole) &&
 		    parent_rb_node && parent_rb_node->rb_left != rb_node)
 			return rb_hole_addr_to_node(parent_rb_node);
@@ -498,10 +545,11 @@ next_hole_high_addr(struct drm_mm_node *entry, u64 size)
  * else return parent of @entry
  */
 static struct drm_mm_node *
-next_hole_low_addr(struct drm_mm_node *entry, u64 size)
+next_hole_low_addr(struct drm_mm_node *entry, u64 size, u64 alignment)
 {
 	struct rb_node *rb_node, *right_rb_node, *parent_rb_node;
 	struct drm_mm_node *right_node;
+	u64 req_align = (size + alignment) << DRM_MM_ALIGN_SHIFT;
 
 	if (!entry)
 		return NULL;
@@ -513,6 +561,7 @@ next_hole_low_addr(struct drm_mm_node *entry, u64 size)
 		right_node = rb_entry(right_rb_node,
 				      struct drm_mm_node, rb_hole_addr);
 		if ((right_node->subtree_max_hole < size ||
+		     right_node->subtree_max_hole_align < req_align ||
 		     entry->size == entry->subtree_max_hole) &&
 		    parent_rb_node && parent_rb_node->rb_right != rb_node)
 			return rb_hole_addr_to_node(parent_rb_node);
@@ -524,7 +573,7 @@ next_hole_low_addr(struct drm_mm_node *entry, u64 size)
 static struct drm_mm_node *
 next_hole(struct drm_mm *mm,
 	  struct drm_mm_node *node,
-	  u64 size,
+	  u64 size, u64 alignment,
 	  enum drm_mm_insert_mode mode)
 {
 	switch (mode) {
@@ -533,10 +582,10 @@ next_hole(struct drm_mm *mm,
 		return rb_hole_size_to_node(rb_prev(&node->rb_hole_size));
 
 	case DRM_MM_INSERT_LOW:
-		return next_hole_low_addr(node, size);
+		return next_hole_low_addr(node, size, alignment);
 
 	case DRM_MM_INSERT_HIGH:
-		return next_hole_high_addr(node, size);
+		return next_hole_high_addr(node, size, alignment);
 
 	case DRM_MM_INSERT_EVICT:
 		node = list_next_entry(node, hole_stack);
@@ -650,7 +699,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
 	for (hole = first_hole(mm, range_start, range_end, size, mode);
 	     hole;
-	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
+	     hole = once ? NULL : next_hole(mm, hole, size, alignment, mode)) {
 		u64 hole_start = __drm_mm_hole_node_start(hole);
 		u64 hole_end = hole_start + hole->hole_size;
 		u64 adj_start, adj_end;
@@ -713,7 +762,6 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 			add_hole(hole);
 		if (adj_start + size < hole_end)
 			add_hole(node);
-
 		save_stack(node);
 		return 0;
 	}
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index a01bc6fac83c..c280b535d9a9 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -169,6 +169,7 @@ struct drm_mm_node {
 	u64 __subtree_last;
 	u64 hole_size;
 	u64 subtree_max_hole;
+	u64 subtree_max_hole_align;
 	unsigned long flags;
 #define DRM_MM_NODE_ALLOCATED_BIT	0
 #define DRM_MM_NODE_SCANNED_BIT		1
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
