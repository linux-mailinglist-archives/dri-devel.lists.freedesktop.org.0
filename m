Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P1DBSRalGkXDAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:08:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059414BC94
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13EB10E4C3;
	Tue, 17 Feb 2026 12:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkTvF5p0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8350110E4C1;
 Tue, 17 Feb 2026 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771330080; x=1802866080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwxEXvDEC1pyxVNIUoP/h4TexZO7NaJyK71yndpiZZM=;
 b=RkTvF5p0EAgvCPFWu/TcD5N9puzS46POFtk/QkYnhLUHlS4XHca7NrUD
 bwVTooc+TbWT3xLCnkticg9xiej7JRhiyONtilyL+cWKwpaWX4CzIITNU
 lMO4a3icVmW8hpyNM1RSQyBB+oBiByUMf20IGIaV0arEaY3wZ3UcDNWKn
 hkZbxPJGkdoK2vsKRMZleHdodYZg89umS7DFWKt2CsVdFCA96fBifbE0W
 WXzM4k8Spe7ejOw73L7ar92uzsEH5gJ1gZtncpM6vmCkVzHOF7mIjn35e
 cVjbXdI6DnwqjZdY8ilTO50/816LxG01jaRyFlS2bRdE+eJAHXZqhutcd g==;
X-CSE-ConnectionGUID: dcO5kz3ESQ+6m2wwO7qtXA==
X-CSE-MsgGUID: vQiiMj5cQqiD2PCV+LdgKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89980945"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89980945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:07:59 -0800
X-CSE-ConnectionGUID: sWv8Wc4OQPKmxzaSAEeRXA==
X-CSE-MsgGUID: FybM/rXjTXy3L0CJBH/Wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="244460072"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 04:07:57 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
Date: Tue, 17 Feb 2026 12:07:47 +0000
Message-ID: <20260217120745.1074232-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
References: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[satyanarayana.k.v.p@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 7059414BC94
X-Rspamd-Action: no action

drm_suballoc_new() currently both allocates the SA object using kmalloc()
and searches for a suitable hole in the sub-allocator for the requested
size. If SA allocation is done by holding sub-allocator mutex, this design
can lead to reclaim safety issues.

By splitting the kmalloc() step outside of the critical section, we allow
the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
the initialization step that holds reclaim-tainted locks (sub-allocator
mutex) operates in a reclaim-unsafe context with pre-allocated memory.

This separation prevents potential deadlocks where memory reclaim could
attempt to acquire locks that are already held during the sub-allocator
operations.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>

---
V4 -> V5:
- None.

V3 -> V4:
- None.

V2 -> V3:
- Updated commit message (Matt, Thomas & Christian).
- Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).

V1 -> V2:
- Splitted drm_suballoc_new() into drm_suballoc_alloc() and
drm_suballoc_init() (Thomas).
---
 drivers/gpu/drm/drm_suballoc.c | 110 ++++++++++++++++++++++++++-------
 include/drm/drm_suballoc.h     |   8 +++
 2 files changed, 97 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
index 879ea33dbbc4..b97ffcd98d45 100644
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
 	list_del_init(&sa->olist);
 	list_del_init(&sa->flist);
 	dma_fence_put(sa->fence);
-	kfree(sa);
+	drm_suballoc_release(sa);
 }
 
 static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
@@ -293,45 +293,74 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
 }
 
 /**
- * drm_suballoc_new() - Make a suballocation.
+ * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
+ * @gfp: gfp flags used for memory allocation.
+ *
+ * Allocate memory for an uninitialized suballoc object. Intended usage is
+ * allocate memory for suballoc object outside of a reclaim tainted context
+ * and then be initialized at a later time in a reclaim tainted context.
+ *
+ * @drm_suballoc_release should be used to release the memory if returned
+ * suballoc object is in uninitialized state.
+ *
+ * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+ */
+struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
+{
+	struct drm_suballoc *sa;
+
+	sa = kmalloc(sizeof(*sa), gfp);
+	if (!sa)
+		return ERR_PTR(-ENOMEM);
+
+	return sa;
+}
+EXPORT_SYMBOL(drm_suballoc_alloc);
+
+/**
+ * drm_suballoc_release() - Release memory for suballocation.
+ * @sa: The struct drm_suballoc.
+ */
+void drm_suballoc_release(struct drm_suballoc *sa)
+{
+	kfree(sa);
+}
+EXPORT_SYMBOL(drm_suballoc_release);
+
+/**
+ * drm_suballoc_init() - Initialize a suballocation.
  * @sa_manager: pointer to the sa_manager
+ * @sa: The struct drm_suballoc.
  * @size: number of bytes we want to suballocate.
- * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
- *       the argument is provided for suballocations from reclaim context or
- *       where the caller wants to avoid pipelining rather than wait for
- *       reclaim.
  * @intr: Whether to perform waits interruptible. This should typically
  *        always be true, unless the caller needs to propagate a
  *        non-interruptible context from above layers.
  * @align: Alignment. Must not exceed the default manager alignment.
  *         If @align is zero, then the manager alignment is used.
  *
- * Try to make a suballocation of size @size, which will be rounded
- * up to the alignment specified in specified in drm_suballoc_manager_init().
+ * Try to make a suballocation on a pre-allocated suballoc object of size @size,
+ * which will be rounded up to the alignment specified in specified in
+ * drm_suballoc_manager_init().
  *
- * Return: a new suballocated bo, or an ERR_PTR.
+ * Return: zero on success, errno on failure.
  */
-struct drm_suballoc *
-drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
-		 gfp_t gfp, bool intr, size_t align)
+int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
+		      struct drm_suballoc *sa, size_t size,
+		      bool intr, size_t align)
 {
 	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
 	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
 	unsigned int count;
 	int i, r;
-	struct drm_suballoc *sa;
 
 	if (WARN_ON_ONCE(align > sa_manager->align))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	if (WARN_ON_ONCE(size > sa_manager->size || !size))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	if (!align)
 		align = sa_manager->align;
 
-	sa = kmalloc(sizeof(*sa), gfp);
-	if (!sa)
-		return ERR_PTR(-ENOMEM);
 	sa->manager = sa_manager;
 	sa->fence = NULL;
 	INIT_LIST_HEAD(&sa->olist);
@@ -348,7 +377,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 			if (drm_suballoc_try_alloc(sa_manager, sa,
 						   size, align)) {
 				spin_unlock(&sa_manager->wq.lock);
-				return sa;
+				return 0;
 			}
 
 			/* see if we can skip over some allocations */
@@ -385,8 +414,47 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 	} while (!r);
 
 	spin_unlock(&sa_manager->wq.lock);
-	kfree(sa);
-	return ERR_PTR(r);
+	return r;
+}
+EXPORT_SYMBOL(drm_suballoc_init);
+
+/**
+ * drm_suballoc_new() - Make a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate.
+ * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
+ *       the argument is provided for suballocations from reclaim context or
+ *       where the caller wants to avoid pipelining rather than wait for
+ *       reclaim.
+ * @intr: Whether to perform waits interruptible. This should typically
+ *        always be true, unless the caller needs to propagate a
+ *        non-interruptible context from above layers.
+ * @align: Alignment. Must not exceed the default manager alignment.
+ *         If @align is zero, then the manager alignment is used.
+ *
+ * Try to make a suballocation of size @size, which will be rounded
+ * up to the alignment specified in specified in drm_suballoc_manager_init().
+ *
+ * Return: a new suballocated bo, or an ERR_PTR.
+ */
+struct drm_suballoc *
+drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
+		 gfp_t gfp, bool intr, size_t align)
+{
+	struct drm_suballoc *sa;
+	int err;
+
+	sa = drm_suballoc_alloc(gfp);
+	if (IS_ERR(sa))
+		return sa;
+
+	err = drm_suballoc_init(sa_manager, sa, size, intr, align);
+	if (err) {
+		drm_suballoc_release(sa);
+		return ERR_PTR(err);
+	}
+
+	return sa;
 }
 EXPORT_SYMBOL(drm_suballoc_new);
 
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
index 7ba72a81a808..b8d1d5449fd8 100644
--- a/include/drm/drm_suballoc.h
+++ b/include/drm/drm_suballoc.h
@@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
 
 void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
 
+struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
+
+void drm_suballoc_release(struct drm_suballoc *sa);
+
+int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
+		      struct drm_suballoc *sa, size_t size, bool intr,
+		      size_t align);
+
 struct drm_suballoc *
 drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 		 gfp_t gfp, bool intr, size_t align);
-- 
2.43.0

