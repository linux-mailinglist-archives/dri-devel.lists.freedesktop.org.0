Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C633966F1
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229B6E980;
	Mon, 31 May 2021 17:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC506E97C;
 Mon, 31 May 2021 17:23:03 +0000 (UTC)
IronPort-SDR: lKF6wdgT/xN0gbwdXoT+du0UDzTiZSZblfzWvMgPhadZi5XlrcswvS1PYRb0lNMs5H2lyMV5O2
 RhmPPxT6WLqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="201520252"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="201520252"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 10:23:02 -0700
IronPort-SDR: dvzeGf259CzZt/Uxch4zcJMsURzKbN5b6ZM1mO4+IOpTMwuj/uf66PpgCeyF31gylSQMnmAwZ6
 g2qkpp0Ge8tA==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="416211053"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.142])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 10:23:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 14/15] drm/vma: Add a driver_private member to vma_node.
Date: Mon, 31 May 2021 19:22:27 +0200
Message-Id: <20210531172228.70846-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
References: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This allows drivers to distinguish between different types of vma_node's.
The readonly flag was unused and is thus removed.

This is a temporary solution, until i915 is converted completely to
use ttm for bo's.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch> #irc
---
 drivers/gpu/drm/drm_gem.c     | 9 ---------
 include/drm/drm_vma_manager.h | 2 +-
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 9989425e9875..e710e79069f6 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1149,15 +1149,6 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 		return -EACCES;
 	}
 
-	if (node->readonly) {
-		if (vma->vm_flags & VM_WRITE) {
-			drm_gem_object_put(obj);
-			return -EINVAL;
-		}
-
-		vma->vm_flags &= ~VM_MAYWRITE;
-	}
-
 	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
 			       vma);
 
diff --git a/include/drm/drm_vma_manager.h b/include/drm/drm_vma_manager.h
index 76ac5e97a559..4f8c35206f7c 100644
--- a/include/drm/drm_vma_manager.h
+++ b/include/drm/drm_vma_manager.h
@@ -53,7 +53,7 @@ struct drm_vma_offset_node {
 	rwlock_t vm_lock;
 	struct drm_mm_node vm_node;
 	struct rb_root vm_files;
-	bool readonly:1;
+	void *driver_private;
 };
 
 struct drm_vma_offset_manager {
-- 
2.31.1

