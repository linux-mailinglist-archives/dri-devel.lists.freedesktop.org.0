Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F0D6963E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 13:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D067710E1FB;
	Tue, 14 Feb 2023 12:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5337510E117;
 Tue, 14 Feb 2023 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676379095; x=1707915095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hJu7TZpVPtec73hfeBA/avwcYvPTNTBMYqIl7PC5FV0=;
 b=WGWgN8d2LF+B7wGAlYZwUTfmHtXQb4JY9vsbTspzAVRxGGnLaBPHWBpT
 BRYQyyd+7iiu5yg0m+MvnLBGo04TUK7GRVo6k/90FPaHZ1rliv9dZiHNQ
 uIkT60mv8GLcW/cXOxQ9zy8QO6GXA77qQwdvzFBDR4qWlNm1kYvZDDzGb
 JsYh4caw/6L8QTyL565iVDilh152pH1eiRHGLqi0Y7nTNIUKuSyLjgwKT
 lYQXvgQbKGjDFjAYxpC/ufMuz4o7u0tTHDP3Z9MX01JYWuAdTFe6MenVm
 dPFNGp/ojX3eiRfKaAn3yc9Zypha2zG2IruQx2+G1BcxDJde9DtSZVL/M w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331149529"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="331149529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 04:51:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669152938"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="669152938"
Received: from ahmedm3x-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.226.130])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 04:51:10 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gem: Expose the buffer object handle to userspace last
Date: Tue, 14 Feb 2023 12:50:50 +0000
Message-Id: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Clark <robdclark@chromium.org>, lima@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Herrmann <dh.herrmann@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Currently drm_gem_handle_create_tail exposes the handle to userspace
before the buffer object constructions is complete. This allowing
of working against a partially constructed object, which may also be in
the process of having its creation fail, can have a range of negative
outcomes.

A lot of those will depend on what the individual drivers are doing in
their obj->funcs->open() callbacks, and also with a common failure mode
being -ENOMEM from drm_vma_node_allow.

We can make sure none of this can happen by allocating a handle last,
although with a downside that more of the function now runs under the
dev->object_name_lock.

Looking into the individual drivers open() hooks, we have
amdgpu_gem_object_open which seems like it could have a potential security
issue without this change.

A couple drivers like qxl_gem_object_open and vmw_gem_object_open
implement no-op hooks so no impact for them.

A bunch of other require a deeper look by individual owners to asses for
impact. Those are lima_gem_object_open, nouveau_gem_object_open,
panfrost_gem_open, radeon_gem_object_open and virtio_gpu_gem_object_open.

Putting aside the risk assesment of the above, some common scenarios to
think about are along these lines:

1)
Userspace closes a handle by speculatively "guessing" it from a second
thread.

This results in an unreachable buffer object so, a memory leak.

2)
Same as 1), but object is in the process of getting closed (failed
creation).

The second thread is then able to re-cycle the handle and idr_remove would
in the first thread would then remove the handle it does not own from the
idr.

3)
Going back to the earlier per driver problem space - individual impact
assesment of allowing a second thread to access and operate on a partially
constructed handle / object. (Can something crash? Leak information?)

In terms of identifying when the problem started I will tag some patches
as references, but not all, if even any, of them actually point to a
broken state. I am just identifying points at which more opportunity for
issues to arise was added.

References: 304eda32920b ("drm/gem: add hooks to notify driver when object handle is created/destroyed")
References: ca481c9b2a3a ("drm/gem: implement vma access management")
References: b39b5394fabc ("drm/gem: Add drm_gem_object_funcs")
Cc: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Herrmann <dh.herrmann@gmail.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: Steven Price <steven.price@arm.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Cc: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/drm_gem.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index aa15c52ae182..e3d897bca0f2 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -356,52 +356,52 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 			   u32 *handlep)
 {
 	struct drm_device *dev = obj->dev;
-	u32 handle;
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
 	if (obj->handle_count++ == 0)
 		drm_gem_object_get(obj);
 
+	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
+	if (ret)
+		goto err_put;
+
+	if (obj->funcs->open) {
+		ret = obj->funcs->open(obj, file_priv);
+		if (ret)
+			goto err_revoke;
+	}
+
 	/*
-	 * Get the user-visible handle using idr.  Preload and perform
-	 * allocation under our spinlock.
+	 * Get the user-visible handle using idr as the _last_ step.
+	 * Preload and perform allocation under our spinlock.
 	 */
 	idr_preload(GFP_KERNEL);
 	spin_lock(&file_priv->table_lock);
-
 	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
-
 	spin_unlock(&file_priv->table_lock);
 	idr_preload_end();
 
-	mutex_unlock(&dev->object_name_lock);
 	if (ret < 0)
-		goto err_unref;
-
-	handle = ret;
+		goto err_close;
 
-	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
-	if (ret)
-		goto err_remove;
+	mutex_unlock(&dev->object_name_lock);
 
-	if (obj->funcs->open) {
-		ret = obj->funcs->open(obj, file_priv);
-		if (ret)
-			goto err_revoke;
-	}
+	*handlep = ret;
 
-	*handlep = handle;
 	return 0;
 
+err_close:
+	if (obj->funcs->close)
+		obj->funcs->close(obj, file_priv);
 err_revoke:
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
-err_remove:
-	spin_lock(&file_priv->table_lock);
-	idr_remove(&file_priv->object_idr, handle);
-	spin_unlock(&file_priv->table_lock);
-err_unref:
-	drm_gem_object_handle_put_unlocked(obj);
+err_put:
+	if (--obj->handle_count == 0)
+		drm_gem_object_put(obj);
+
+	mutex_unlock(&dev->object_name_lock);
+
 	return ret;
 }
 
-- 
2.34.1

