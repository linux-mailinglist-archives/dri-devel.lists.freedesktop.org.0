Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3102713E27
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 21:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D53210E106;
	Sun, 28 May 2023 19:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C945E10E106
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 19:32:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E09A61DAF;
 Sun, 28 May 2023 19:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369BDC433EF;
 Sun, 28 May 2023 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1685302340;
 bh=QQnnE4i3eL6R307oEqra6ayyV8n51uDN9f9ilv2MX+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LWcyoIh6ACNOmy9GAr0sTP0PxeOgG+lob4kPRPbaYvM/VopfhLpAP0RFnO2cpbROx
 d+yQq/DDJZZ5PA0jWQIG6NhtZs2NLpmaZfcDiofpCLuQnNar1Xrvlu7FRnDU2lc7L7
 aY+PC98WeZyqjIwVMSZba6DwR1jhV6lhJN2jOy/8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.3 069/127] drm: fix drmm_mutex_init()
Date: Sun, 28 May 2023 20:10:45 +0100
Message-Id: <20230528190838.638080983@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528190836.161231414@linuxfoundation.org>
References: <20230528190836.161231414@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

commit c21f11d182c2180d8b90eaff84f574cfa845b250 upstream.

In mutex_init() lockdep identifies a lock by defining a special static
key for each lock class. However if we wrap the macro in a function,
like in drmm_mutex_init(), we end up generating:

int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
{
      static struct lock_class_key __key;

      __mutex_init((lock), "lock", &__key);
      ....
}

The static __key here is what lockdep uses to identify the lock class,
however since this is just a normal function the key here will be
created once, where all callers then use the same key. In effect the
mutex->depmap.key will be the same pointer for different
drmm_mutex_init() callers. This then results in impossible lockdep
splats since lockdep thinks completely unrelated locks are the same lock
class.

To fix this turn drmm_mutex_init() into a macro such that it generates a
different "static struct lock_class_key __key" for each invocation,
which looks to be inline with what mutex_init() wants.

v2:
  - Revamp the commit message with clearer explanation of the issue.
  - Rather export __drmm_mutex_release() than static inline.

Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reported-by: Sarah Walker <sarah.walker@imgtec.com>
Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20230519090733.489019-1-matthew.auld@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_managed.c |   22 ++--------------------
 include/drm/drm_managed.h     |   18 +++++++++++++++++-
 2 files changed, 19 insertions(+), 21 deletions(-)

--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -264,28 +264,10 @@ void drmm_kfree(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_kfree);
 
-static void drmm_mutex_release(struct drm_device *dev, void *res)
+void __drmm_mutex_release(struct drm_device *dev, void *res)
 {
 	struct mutex *lock = res;
 
 	mutex_destroy(lock);
 }
-
-/**
- * drmm_mutex_init - &drm_device-managed mutex_init()
- * @dev: DRM device
- * @lock: lock to be initialized
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise.
- *
- * This is a &drm_device-managed version of mutex_init(). The initialized
- * lock is automatically destroyed on the final drm_dev_put().
- */
-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
-{
-	mutex_init(lock);
-
-	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
-}
-EXPORT_SYMBOL(drmm_mutex_init);
+EXPORT_SYMBOL(__drmm_mutex_release);
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -105,6 +105,22 @@ char *drmm_kstrdup(struct drm_device *de
 
 void drmm_kfree(struct drm_device *dev, void *data);
 
-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
+void __drmm_mutex_release(struct drm_device *dev, void *res);
+
+/**
+ * drmm_mutex_init - &drm_device-managed mutex_init()
+ * @dev: DRM device
+ * @lock: lock to be initialized
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ *
+ * This is a &drm_device-managed version of mutex_init(). The initialized
+ * lock is automatically destroyed on the final drm_dev_put().
+ */
+#define drmm_mutex_init(dev, lock) ({					     \
+	mutex_init(lock);						     \
+	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
+})									     \
 
 #endif


