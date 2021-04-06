Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0A354F8A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 11:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C586E811;
	Tue,  6 Apr 2021 09:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF16E6E7DD;
 Tue,  6 Apr 2021 09:09:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F67DB132;
 Tue,  6 Apr 2021 09:09:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH 7/8] drm/vmwgfx: Inline vmw_verify_access()
Date: Tue,  6 Apr 2021 11:09:02 +0200
Message-Id: <20210406090903.7019-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406090903.7019-1-tzimmermann@suse.de>
References: <20210406090903.7019-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vmwgfx is the only user of the TTM's verify_access callback. Inline
the call and avoid the indirection through the function pointer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 ---------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   | 7 ++-----
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2dc031fe4a90..a079734f9d68 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -658,14 +658,6 @@ static void vmw_evict_flags(struct ttm_buffer_object *bo,
 	*placement = vmw_sys_placement;
 }
 
-static int vmw_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct ttm_object_file *tfile =
-		vmw_fpriv((struct drm_file *)filp->private_data)->tfile;
-
-	return vmw_user_bo_verify_access(bo, tfile);
-}
-
 static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
 {
 	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
@@ -768,7 +760,6 @@ struct ttm_device_funcs vmw_bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
 	.move = vmw_move,
-	.verify_access = vmw_verify_access,
 	.swap_notify = vmw_swap_notify,
 	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index 3eaad00668f2..2574d4707407 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -65,6 +65,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
+	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	struct ttm_device *bdev = &dev_priv->bdev;
 	struct ttm_buffer_object *bo;
 	int ret;
@@ -76,11 +77,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (unlikely(!bo))
 		return -EINVAL;
 
-	if (unlikely(!bo->bdev->funcs->verify_access)) {
-		ret = -EPERM;
-		goto out_unref;
-	}
-	ret = bo->bdev->funcs->verify_access(bo, filp);
+	ret = vmw_user_bo_verify_access(bo, tfile);
 	if (unlikely(ret != 0))
 		goto out_unref;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
