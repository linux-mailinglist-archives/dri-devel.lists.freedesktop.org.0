Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAC446121
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 10:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13356E49A;
	Fri,  5 Nov 2021 09:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 529 seconds by postgrey-1.36 at gabe;
 Fri, 05 Nov 2021 08:42:04 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541276E54C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 08:42:04 +0000 (UTC)
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id AF940D1250;
 Fri,  5 Nov 2021 16:33:11 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31296T140158673274624S1636101189603309_; 
 Fri, 05 Nov 2021 16:33:11 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: maarten.lankhorst@linux.intel.com
X-RCPT-COUNT: 14
X-LOCAL-RCPT-COUNT: 2
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <b0618e41130f8db6484a6eaac288d033>
X-System-Flag: 0
From: Jianqun Xu <jay.xu@rock-chips.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH] drm/prime/gem: drm_gem_object_release_handle by handle
Date: Fri,  5 Nov 2021 16:33:08 +0800
Message-Id: <20211105083308.392156-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 09:06:23 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com, jay.xu@rock-chips.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_handle_delete is called by DRM_IOCTL_GEM_CLOSE from
userspace.

drm_gem_handle_delete(handle)
  drm_gem_object_release_handle(handle)
    drm_gem_remove_prime_handles()
	drm_prime_remove_buf_handle_locked()
	  if (member->dma_buf == dma_buf)
	    free member
	    return

The api description of drm_gem_handle_delete says to delete the given
file-private handle.

But the drm_gem_remove_prime_handles seems to remove *handles* from
rbtree of drm file-private structure.

And then the drm_gem_remove_prime_handles only remove the first handle
lookuped from rbtree, as following codes:

	rb = prime_fpriv->dmabufs.rb_node;
	while (rb) {
		struct drm_prime_member *member;

		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
		if (member->dma_buf == dma_buf) {
			rb_erase(&member->handle_rb, &prime_fpriv->handles);
			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);

			dma_buf_put(dma_buf);
			kfree(member);
			return;
		}

This patch fixes to remove the rbtree member by given handle.

Test

handle_1 = drm_alloc(1MB)
fd_1     = drm_handle_to_fd(handle_1)
name_1   = drm get flink name from handle(handle_1)        // DRM_IOCTL_GEM_FLINK

handle_2 = drm get handle,size_2 from flink name(name_1)   // DRM_IOCTL_GEM_OPEN
fd_2     = drm_handle_to_fd(handle_2)

handle_3 = drm get handle,size_3 from flink name(name_1)   // DRM_IOCTL_GEM_OPEN
fd_3     = drm_handle_to_fd(handle_3)

drm close handle(handle_3) // DRM_IOCTL_GEM_CLOSE

handle_4 = drm_alloc(4MB)
fd_4     = drm_handle_to_fd(handle_4)

We find that the fd_4 dmabuf size is 1MB. Tested by following:

handle_5 = drm_fd_to_handle(fd_4)
name_5   = drm get flink name from handle(handle_5)        // DRM_IOCTL_GEM_FLINK
handle_3 = drm get handle,size_5 from flink name(name_5)   // DRM_IOCTL_GEM_OPEN

Without this patch, the size_5 = 1MB
With this patch, the size_5 = 4MB

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpu/drm/drm_gem.c      | 7 ++++---
 drivers/gpu/drm/drm_internal.h | 2 +-
 drivers/gpu/drm/drm_prime.c    | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..bfa5637f54d2 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -168,7 +168,8 @@ void drm_gem_private_object_init(struct drm_device *dev,
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
 static void
-drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
+drm_gem_remove_prime_handle(struct drm_gem_object *obj, struct drm_file *filp,
+			    int handle)
 {
 	/*
 	 * Note: obj->dma_buf can't disappear as long as we still hold a
@@ -177,7 +178,7 @@ drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
 	mutex_lock(&filp->prime.lock);
 	if (obj->dma_buf) {
 		drm_prime_remove_buf_handle_locked(&filp->prime,
-						   obj->dma_buf);
+						   obj->dma_buf, handle);
 	}
 	mutex_unlock(&filp->prime.lock);
 }
@@ -252,7 +253,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
-	drm_gem_remove_prime_handles(obj, file_priv);
+	drm_gem_remove_prime_handle(obj, file_priv, id);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
 	drm_gem_object_handle_put_unlocked(obj);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..17c4f6cac21c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -75,7 +75,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf);
+					struct dma_buf *dma_bufi, int handle);
 
 /* drm_drv.c */
 struct drm_minor *drm_minor_acquire(unsigned int minor_id);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index deb23dbec8b5..080476296715 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -188,7 +188,7 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
 }
 
 void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf)
+					struct dma_buf *dma_buf, int handle)
 {
 	struct rb_node *rb;
 
@@ -197,7 +197,7 @@ void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpr
 		struct drm_prime_member *member;
 
 		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
-		if (member->dma_buf == dma_buf) {
+		if ((member->dma_buf == dma_buf) && (member->handle == handle)) {
 			rb_erase(&member->handle_rb, &prime_fpriv->handles);
 			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
-- 
2.25.1



