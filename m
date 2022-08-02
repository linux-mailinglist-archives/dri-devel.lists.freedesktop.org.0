Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E463587BC0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 13:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0598A11A2B2;
	Tue,  2 Aug 2022 11:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Tue, 02 Aug 2022 11:45:29 UTC
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com
 [115.236.118.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7C10E030
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 11:45:29 +0000 (UTC)
Received: from localhost (unknown [58.22.7.114])
 by mail-m11885.qiye.163.com (Hmail) with ESMTPA id E61644C0362;
 Tue,  2 Aug 2022 19:39:47 +0800 (CST)
From: Jeffy Chen <jeffy.chen@rock-chips.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/gem: Fix GEM handle release errors
Date: Tue,  2 Aug 2022 19:33:16 +0800
Message-Id: <20220802113316.18340-1-jeffy.chen@rock-chips.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT00eVkJJQk4dTx8YHhhJQlUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzY6LAw5Ej08NzEZL0xJTB0Z
 HRQwChBVSlVKTU5CT09LSENDSEhKVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOQkpCNwY+
X-HM-Tid: 0a825e5ad7862eb9kusne61644c0362
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
Cc: David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we are assuming a one to one mapping between dmabuf and handle
when releasing GEM handles.

But that is not always true, since we would create extra handles for the
GEM obj in cases like gem_open() and getfb{,2}().

A similar issue was reported at:
https://lore.kernel.org/all/20211105083308.392156-1-jay.xu@rock-chips.com/

Another problem is that the drm_gem_remove_prime_handles() now only
remove handle to the exported dmabuf (gem_obj->dma_buf), so the imported
ones would leak:
WARNING: CPU: 2 PID: 236 at drivers/gpu/drm/drm_prime.c:228 drm_prime_destroy_file_private+0x18/0x24

Let's fix these by using handle to find the exact map to remove.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

 drivers/gpu/drm/drm_gem.c      | 17 +----------------
 drivers/gpu/drm/drm_internal.h |  4 ++--
 drivers/gpu/drm/drm_prime.c    | 16 ++++++++++------
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..ed39da383570 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
-static void
-drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
-{
-	/*
-	 * Note: obj->dma_buf can't disappear as long as we still hold a
-	 * handle reference in obj->handle_count.
-	 */
-	mutex_lock(&filp->prime.lock);
-	if (obj->dma_buf) {
-		drm_prime_remove_buf_handle_locked(&filp->prime,
-						   obj->dma_buf);
-	}
-	mutex_unlock(&filp->prime.lock);
-}
-
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
-	drm_gem_remove_prime_handles(obj, file_priv);
+	drm_prime_remove_buf_handle(&file_priv->prime, id);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
 	drm_gem_object_handle_put_unlocked(obj);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 1fbbc19f1ac0..7bb98e6a446d 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
-void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf);
+void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
+				 uint32_t handle);
 
 /* drm_drv.c */
 struct drm_minor *drm_minor_acquire(unsigned int minor_id);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..c28518ab62d0 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -190,29 +190,33 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
 	return -ENOENT;
 }
 
-void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf)
+void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
+				 uint32_t handle)
 {
 	struct rb_node *rb;
 
+	mutex_lock(&prime_fpriv->lock);
+
 	rb = prime_fpriv->dmabufs.rb_node;
 	while (rb) {
 		struct drm_prime_member *member;
 
 		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
-		if (member->dma_buf == dma_buf) {
+		if (member->handle == handle) {
 			rb_erase(&member->handle_rb, &prime_fpriv->handles);
 			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
-			dma_buf_put(dma_buf);
+			dma_buf_put(member->dma_buf);
 			kfree(member);
-			return;
-		} else if (member->dma_buf < dma_buf) {
+			break;
+		} else if (member->handle < handle) {
 			rb = rb->rb_right;
 		} else {
 			rb = rb->rb_left;
 		}
 	}
+
+	mutex_unlock(&prime_fpriv->lock);
 }
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
-- 
2.20.1

