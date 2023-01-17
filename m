Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC0866E54B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDB310E30D;
	Tue, 17 Jan 2023 17:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FE010E309;
 Tue, 17 Jan 2023 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673977979; x=1705513979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oFBHfLrKrHvwzrK+UKhwOQtpb7Nc7QFMEcDfxogA1AY=;
 b=cjQUVbTKNo9T1oiU+UmOIGxLVl7eA4JIsaKS+8T/9md3IK19aAv+cjHS
 b3lQDsuK5HDeWEntgybmhGjcLM12VeXK+Q69JdhKYDOUA8N/0+wYsrW4X
 kBjAo3WT5gZIJTJmyGNwruQneO6EdsZfJJLBJvOerVOMaMHwsu8I/lflK
 rxbqhs3BIPtT6cUB69Sp7rIsLVbEsuKSOJNVw5Um1amxZ3t0YpXbmgvL2
 uHcCLO4GRlv2eXqjR/BsgCYjkfDkBA0Ts/XFOtwyBJRQV13Cm6ddi1vSp
 cWNbQ/8MOkKVgpHHa8rcAarcGGiAfZWs7VN33Hv2HdGxYwmoN1QpYb649 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="389263486"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="389263486"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:52:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783326924"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="783326924"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:52:48 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/drm_vma_manager: Add drm_vma_node_allow_once()
Date: Tue, 17 Jan 2023 18:52:35 +0100
Message-Id: <20230117175236.22317-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently there is no easy way for a drm driver to safely check and allow
drm_vma_offset_node for a drm file just once. Allow drm drivers to call
non-refcounted version of drm_vma_node_allow() so that a driver doesn't
need to keep track of each drm_vma_node_allow() to call subsequent
drm_vma_node_revoke() to prevent memory leak.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>

Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/drm_vma_manager.c | 76 ++++++++++++++++++++++---------
 include/drm/drm_vma_manager.h     |  1 +
 2 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
index 7de37f8c68fd..83229a031af0 100644
--- a/drivers/gpu/drm/drm_vma_manager.c
+++ b/drivers/gpu/drm/drm_vma_manager.c
@@ -240,27 +240,8 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
 }
 EXPORT_SYMBOL(drm_vma_offset_remove);
 
-/**
- * drm_vma_node_allow - Add open-file to list of allowed users
- * @node: Node to modify
- * @tag: Tag of file to remove
- *
- * Add @tag to the list of allowed open-files for this node. If @tag is
- * already on this list, the ref-count is incremented.
- *
- * The list of allowed-users is preserved across drm_vma_offset_add() and
- * drm_vma_offset_remove() calls. You may even call it if the node is currently
- * not added to any offset-manager.
- *
- * You must remove all open-files the same number of times as you added them
- * before destroying the node. Otherwise, you will leak memory.
- *
- * This is locked against concurrent access internally.
- *
- * RETURNS:
- * 0 on success, negative error code on internal failure (out-of-mem)
- */
-int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
+static int vma_node_allow(struct drm_vma_offset_node *node,
+			  struct drm_file *tag, bool ref_counted)
 {
 	struct rb_node **iter;
 	struct rb_node *parent = NULL;
@@ -282,7 +263,8 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
 		entry = rb_entry(*iter, struct drm_vma_offset_file, vm_rb);
 
 		if (tag == entry->vm_tag) {
-			entry->vm_count++;
+			if (ref_counted)
+				entry->vm_count++;
 			goto unlock;
 		} else if (tag > entry->vm_tag) {
 			iter = &(*iter)->rb_right;
@@ -307,8 +289,58 @@ int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
 	kfree(new);
 	return ret;
 }
+
+/**
+ * drm_vma_node_allow - Add open-file to list of allowed users
+ * @node: Node to modify
+ * @tag: Tag of file to remove
+ *
+ * Add @tag to the list of allowed open-files for this node. If @tag is
+ * already on this list, the ref-count is incremented.
+ *
+ * The list of allowed-users is preserved across drm_vma_offset_add() and
+ * drm_vma_offset_remove() calls. You may even call it if the node is currently
+ * not added to any offset-manager.
+ *
+ * You must remove all open-files the same number of times as you added them
+ * before destroying the node. Otherwise, you will leak memory.
+ *
+ * This is locked against concurrent access internally.
+ *
+ * RETURNS:
+ * 0 on success, negative error code on internal failure (out-of-mem)
+ */
+int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag)
+{
+	return vma_node_allow(node, tag, true);
+}
 EXPORT_SYMBOL(drm_vma_node_allow);
 
+/**
+ * drm_vma_node_allow_once - Add open-file to list of allowed users
+ * @node: Node to modify
+ * @tag: Tag of file to remove
+ *
+ * Add @tag to the list of allowed open-files for this node.
+ *
+ * The list of allowed-users is preserved across drm_vma_offset_add() and
+ * drm_vma_offset_remove() calls. You may even call it if the node is currently
+ * not added to any offset-manager.
+ *
+ * This is not ref-counted unlike drm_vma_node_allow() hence drm_vma_node_revoke()
+ * should only be called once after this.
+ *
+ * This is locked against concurrent access internally.
+ *
+ * RETURNS:
+ * 0 on success, negative error code on internal failure (out-of-mem)
+ */
+int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag)
+{
+	return vma_node_allow(node, tag, false);
+}
+EXPORT_SYMBOL(drm_vma_node_allow_once);
+
 /**
  * drm_vma_node_revoke - Remove open-file from list of allowed users
  * @node: Node to modify
diff --git a/include/drm/drm_vma_manager.h b/include/drm/drm_vma_manager.h
index 4f8c35206f7c..6c2a2f21dbf0 100644
--- a/include/drm/drm_vma_manager.h
+++ b/include/drm/drm_vma_manager.h
@@ -74,6 +74,7 @@ void drm_vma_offset_remove(struct drm_vma_offset_manager *mgr,
 			   struct drm_vma_offset_node *node);
 
 int drm_vma_node_allow(struct drm_vma_offset_node *node, struct drm_file *tag);
+int drm_vma_node_allow_once(struct drm_vma_offset_node *node, struct drm_file *tag);
 void drm_vma_node_revoke(struct drm_vma_offset_node *node,
 			 struct drm_file *tag);
 bool drm_vma_node_is_allowed(struct drm_vma_offset_node *node,
-- 
2.39.0

