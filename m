Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16B8CA8BC
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31910E40F;
	Tue, 21 May 2024 07:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wh9K8fg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C9910E3C9;
 Tue, 21 May 2024 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275853; x=1747811853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCo+bXcbAgNy5o6Dz2ru7oCaq24A3+YxX21YepnLrJw=;
 b=Wh9K8fg9bq8zLwiH3sctTCUThWXbHe0GLuigjBHrNhby5Z3ZG1mNtRTN
 V5wFT3ru5Snbh9dHKXvUwm6sRnQXPiXwbedYdloYiA+lyVLbvd0siRO8w
 9MDO3ysJJXwn2nooum2bOF4pSNgYambebR4JpEq4wKMmKVkkzGGkS3i6S
 AXxO2nWb/zYN5iO0enkU7T9wbg1E95S4rlpbcvfJFOCfvhDKUuwHkxbzN
 rRByeRdB9IlsuFJPHP+P84Fxgy9eYrQ3Pf/2k2M/AlVOrYT4OFmBEaN7a
 KaTRqQtaqOVMy6QLVi+xRAPlqL+bPnX3JlrNarx8xEvqFV4+t5FDZjqzk w==;
X-CSE-ConnectionGUID: zSs48kshTImcIoaVLWO1aA==
X-CSE-MsgGUID: 1sbnqWYRQYCUX+QsDNmqQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393492"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393492"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:32 -0700
X-CSE-ConnectionGUID: 67OUm/8OTaq0uDRxy06TbQ==
X-CSE-MsgGUID: XRwcA+ynSYaFoZxuHDWNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336778"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 14/21] drm/exec: Introduce a drm_exec_trylock_obj()
 function
Date: Tue, 21 May 2024 09:16:32 +0200
Message-ID: <20240521071639.77614-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
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

TTM needs to trylock dma_resv objects in a couple of places. However
this functionality is missing in drm_exec. Introduce it.

Note that in addition to the -EBUSY error returned on failure to
take the lock, the operation may return -ENOMEM if there was a
failure to allocate memory for the drm_exec held lock array.

This failure mode could be avoided if the drm_exec structure instead
maintained a linked list of locked objects, similar to i915.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 50 +++++++++++++++++++++++++++++++++++---
 include/drm/drm_exec.h     |  1 +
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 3770a5d30213..1383680ffa4a 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -139,14 +139,17 @@ EXPORT_SYMBOL(drm_exec_cleanup);
 
 /* Track the locked object in the array */
 static int drm_exec_obj_locked(struct drm_exec *exec,
-			       struct drm_gem_object *obj)
+			       struct drm_gem_object *obj,
+			       gfp_t gfp)
 {
+	might_alloc(gfp);
+
 	if (unlikely(exec->num_objects == exec->max_objects)) {
 		size_t size = exec->max_objects * sizeof(void *);
 		void *tmp;
 
 		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
-				GFP_KERNEL);
+				gfp);
 		if (!tmp)
 			return -ENOMEM;
 
@@ -179,7 +182,7 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
-	ret = drm_exec_obj_locked(exec, obj);
+	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
 	if (unlikely(ret))
 		goto error_unlock;
 
@@ -215,6 +218,45 @@ int drm_exec_handle_contended(struct drm_exec *exec)
 }
 EXPORT_SYMBOL(drm_exec_handle_contended);
 
+/**
+ * drm_exec_trylock_obj - trylock a GEM object for use
+ * @exec: the drm_exec object with the state.
+ * @obj: the GEM object to lock.
+ *
+ * Trylock a GEM object for use and grab a reference to it.
+ *
+ * Returns: -EALREADY when object is already locked (can be suppressed by
+ * setting the DRM_EXEC_IGNORE_DUPLICATES flag), -ENOMEM when memory
+ * allocation failed, and zero for success. If the object was already
+ * locked, -EBUSY will be returned.
+ */
+int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	int ret;
+
+	might_alloc(GFP_ATOMIC);
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+		return 0;
+	}
+
+	if (!dma_resv_trylock_ctx(obj->resv, &exec->ticket)) {
+		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket)
+			return (exec->flags & DRM_EXEC_IGNORE_DUPLICATES) ? 0 : -EALREADY;
+		else
+			return -EBUSY;
+	}
+
+	ret = drm_exec_obj_locked(exec, obj, GFP_ATOMIC | __GFP_NOWARN);
+	if (ret)
+		dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_trylock_obj);
+
 /**
  * drm_exec_lock_obj - lock a GEM object for use
  * @exec: the drm_exec object with the state
@@ -254,7 +296,7 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 	if (unlikely(ret))
 		return ret;
 
-	ret = drm_exec_obj_locked(exec, obj);
+	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
 	if (ret)
 		goto error_unlock;
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index fafb40d96e38..ea0f2117ee0c 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -152,6 +152,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			 unsigned int num_fences);
-- 
2.44.0

