Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3C2F7565
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 10:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94C89DC7;
	Fri, 15 Jan 2021 09:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13F389DA7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 09:30:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45462B905;
 Fri, 15 Jan 2021 09:30:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH v2] drm: Set vm_ops to GEM object's values during mmap
Date: Fri, 15 Jan 2021 10:30:38 +0100
Message-Id: <20210115093038.10345-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GEM mmap code relies on the GEM object's mmap callback to set the
VMA's vm_ops field. This is easily forgotten and already led to a memory
leak in the CMA helpers. Instead set the vm_ops field in the DRM core
code to the GEM object's value. Drivers with different needs can override
this in their mmap callback.

v2:
	* support (vm_ops == NULL) if mmap is given; required by VRAM
	  helpers

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: f5ca8eb6f9bd ("drm/cma-helper: Implement mmap as GEM CMA object functions")
Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_gem.c   | 19 ++++++++++---------
 drivers/gpu/drm/drm_prime.c |  2 ++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 34b2f111c01c..c2ce78c4edc3 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1068,20 +1068,17 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 	drm_gem_object_get(obj);
 
 	vma->vm_private_data = obj;
+	vma->vm_ops = obj->funcs->vm_ops;
 
 	if (obj->funcs->mmap) {
 		ret = obj->funcs->mmap(obj, vma);
-		if (ret) {
-			drm_gem_object_put(obj);
-			return ret;
-		}
+		if (ret)
+			goto err_drm_gem_object_put;
 		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
 	} else {
-		if (obj->funcs->vm_ops)
-			vma->vm_ops = obj->funcs->vm_ops;
-		else {
-			drm_gem_object_put(obj);
-			return -EINVAL;
+		if (!vma->vm_ops) {
+			ret = -EINVAL;
+			goto err_drm_gem_object_put;
 		}
 
 		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
@@ -1090,6 +1087,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 	}
 
 	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_mmap_obj);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 683aa29ecd3b..2a54f86856af 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -717,6 +717,8 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	vma->vm_pgoff += drm_vma_node_start(&obj->vma_node);
 
 	if (obj->funcs && obj->funcs->mmap) {
+		vma->vm_ops = obj->funcs->vm_ops;
+
 		ret = obj->funcs->mmap(obj, vma);
 		if (ret)
 			return ret;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
