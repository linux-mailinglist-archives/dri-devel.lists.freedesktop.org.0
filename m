Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8CA3A24F1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 09:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0546E859;
	Thu, 10 Jun 2021 07:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C6C6E823;
 Thu, 10 Jun 2021 07:02:26 +0000 (UTC)
IronPort-SDR: CacKFRbbmx4+wajIzthGPn8h0W5XwJBcaXzWeYTa5llllxefVt+l9KdmoYPX4eDmNMkKGeNpzi
 JRSDhHGuoxSA==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="192351631"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="192351631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 00:02:25 -0700
IronPort-SDR: qjkG6aY4Qtmic/qiUUnnRcEot0+jlvxoYiXod5EttH6QQ9hVIXNJIpFVxbCyUyq2p2EhxT+BI6
 sxnD7RcpTu8g==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="482717928"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 00:02:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 3/4] drm/vma: Add a driver_private member to vma_node.
Date: Thu, 10 Jun 2021 09:01:51 +0200
Message-Id: <20210610070152.572423-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610070152.572423-1-thomas.hellstrom@linux.intel.com>
References: <20210610070152.572423-1-thomas.hellstrom@linux.intel.com>
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
index d62fb1a3c916..ba2e64ed8b47 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1148,15 +1148,6 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
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

