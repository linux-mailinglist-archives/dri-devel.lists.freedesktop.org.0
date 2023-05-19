Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15370929F
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 11:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121E610E5E3;
	Fri, 19 May 2023 09:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61910E101;
 Fri, 19 May 2023 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684487278; x=1716023278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zcu0+QMQHqZNWxuVBTDOzGqmxlJI7DffRumeu3avsrw=;
 b=CymjCVahQwAQ9VLLec/vDSAo3yi4fywGkbxmF4ObH9neb2zN0t+ZoFQp
 iXfqj7+rf5ytDQd86o9XRqYnC81Pe2PtGLSEskFDU3q/4LpTHkIjklVW9
 pxjV25feClMe9zrsJcI+bxzZcpuTqBeB0dMisqpbiGjgF9wAhKMTzpNBw
 8NotPTOhw3PG/ZDHGPjeXFUEOzB/fA0o95JNW547PkKhVSSGym1ejiAmE
 P656dZaHXO89bJUEJeD3x3llprfKSoo3ITTLk0d9iO/NpfsKpKhV9qiEg
 NY8g0Q1GRpYS+YtDMKds0hg2v3ywimt30McTqFmAzk6gqrP0kFRTGGDgy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="352342991"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="352342991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="792301332"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="792301332"
Received: from mohanste-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.103])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:07:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm: fix drmm_mutex_init()
Date: Fri, 19 May 2023 10:07:33 +0100
Message-Id: <20230519090733.489019-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/drm_managed.c | 22 ++--------------------
 include/drm/drm_managed.h     | 18 +++++++++++++++++-
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 4cf214de50c4..c21c3f623033 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -264,28 +264,10 @@ void drmm_kfree(struct drm_device *dev, void *data)
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
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 359883942612..ad08f834af40 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -105,6 +105,22 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
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
-- 
2.40.1

