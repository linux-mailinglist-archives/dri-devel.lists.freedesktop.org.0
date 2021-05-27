Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E892E393165
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8242E6F3E9;
	Thu, 27 May 2021 14:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908236F3F0;
 Thu, 27 May 2021 14:47:47 +0000 (UTC)
IronPort-SDR: otye4W+EgRVVb9K1unVV+2F/i6mdDIPeS3sWsJHOBLs6L/97kFnyn+BgHObRRz5UbRr20gyNoB
 yoAOFw3FKj0g==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202515662"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202515662"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:47:47 -0700
IronPort-SDR: +L/UQilpDR6M/ClXCltedsHvLB1058CQ0UkDp25sLklJ8zx4jq+UjPt0JdPrBoylgkVi+LVv56
 Hn2CNfHVN/Uw==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="443598040"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:47:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 14/15] drm/vma: Add a driver_private member to vma_node.
Date: Thu, 27 May 2021 16:47:09 +0200
Message-Id: <20210527144710.1975553-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
References: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
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

