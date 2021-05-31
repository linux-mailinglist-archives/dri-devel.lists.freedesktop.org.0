Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45BF395A6A
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693BE6E910;
	Mon, 31 May 2021 12:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C4E6E91A;
 Mon, 31 May 2021 12:20:30 +0000 (UTC)
IronPort-SDR: sh9pYtOP7P+iNVoOtBUV74CesTrOHlexNgMZ4F/HZQR+soW2HColW2OuOQRoJ1MKke43z3J7+Y
 yj0cWsKyyzhA==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="183027527"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="183027527"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:29 -0700
IronPort-SDR: gtVKqgM6+1vdeOa9F8P0o15Q2HV5s3MNM9fQM0QTuNU2tRruZODgkuNKqdfPfPrDo8gnvEXT9u
 2HD/CaxUdxlg==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="473904021"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 05:20:21 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 14/15] drm/vma: Add a driver_private member to vma_node.
Date: Mon, 31 May 2021 14:19:39 +0200
Message-Id: <20210531121940.267032-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
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

