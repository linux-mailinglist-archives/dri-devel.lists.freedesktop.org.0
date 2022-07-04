Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2B565B96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25D810F0B5;
	Mon,  4 Jul 2022 16:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D5210E14A;
 Mon,  4 Jul 2022 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656942806; x=1688478806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Js1Vns6LXoJe4GOCxHyTP8R3HC+/JHvhojp773kbGA=;
 b=lJdRPyuzZlBUCqyzZzUz5A6cClwGFbsdZXEeVYRVRHWtYbiSUuss4QRk
 S3gkx74F0gdpYyzPqCnIyuKZaDrskR6Q39SmBRmsoM4wIDKOzXas1iNaQ
 78ON7ERT1Z1w8wFRXhlH9XYfdcLR/21SwNi+HHZj9B1cWn3dsRmBqziVF
 p1jNNMHDJ6tjXHAPGMnHbJDtazGThSxJKkkvCyUVQ4SshQITqQmsRpGiY
 tobSqOdtJmLE+gjybwjn1bLyv9owgHI4TQjNtxZneLaoIT7XJ2kJPbPjz
 pVzCHIK3U4ocqIsNeIcOOPhF4FxfyqCUMci+GKcjkhYexVj/xuuPjznUy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="347112578"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="347112578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 06:53:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="542595781"
Received: from acagidia-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.34])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 06:53:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gem: Rework i915_gem_object_unbind to rely on
 the object lock
Date: Mon,  4 Jul 2022 15:52:49 +0200
Message-Id: <20220704135249.8241-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704135249.8241-1-thomas.hellstrom@linux.intel.com>
References: <20220704135249.8241-1-thomas.hellstrom@linux.intel.com>
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

Since vma destruction from the vm destruction path now takes the
object lock, we no longer need to take a vm reference from
i915_gem_object_unbind to make sure vmas are kept alive, the
required object lock taken across i915_gem_object_unbind is
sufficient.

Also skip retrying on I915_GEM_OBJECT_UNBIND_BARRIER, since we
can't race with vm destruction anymore.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c |  4 +---
 drivers/gpu/drm/i915/i915_drv.h            |  7 +++----
 drivers/gpu/drm/i915/i915_gem.c            | 18 ------------------
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 1674b0c5802b..cf1f39f80603 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -279,9 +279,7 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
 	}
 
 	/* The cache-level will be applied when each vma is rebound. */
-	return i915_gem_object_unbind(obj,
-				      I915_GEM_OBJECT_UNBIND_ACTIVE |
-				      I915_GEM_OBJECT_UNBIND_BARRIER);
+	return i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
 }
 
 int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c22f29c3faa0..6034e6319b6c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1415,10 +1415,9 @@ i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
 int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			   unsigned long flags);
 #define I915_GEM_OBJECT_UNBIND_ACTIVE BIT(0)
-#define I915_GEM_OBJECT_UNBIND_BARRIER BIT(1)
-#define I915_GEM_OBJECT_UNBIND_TEST BIT(2)
-#define I915_GEM_OBJECT_UNBIND_VM_TRYLOCK BIT(3)
-#define I915_GEM_OBJECT_UNBIND_ASYNC BIT(4)
+#define I915_GEM_OBJECT_UNBIND_TEST BIT(1)
+#define I915_GEM_OBJECT_UNBIND_VM_TRYLOCK BIT(2)
+#define I915_GEM_OBJECT_UNBIND_ASYNC BIT(3)
 
 void i915_gem_runtime_suspend(struct drm_i915_private *dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 702e5b89be22..df16a5e8f5c7 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -137,7 +137,6 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 	 */
 	wakeref = intel_runtime_pm_get(rpm);
 
-try_again:
 	ret = 0;
 	spin_lock(&obj->vma.lock);
 	while (!ret && (vma = list_first_entry_or_null(&obj->vma.list,
@@ -152,17 +151,6 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			break;
 		}
 
-		/*
-		 * Requiring the vm destructor to take the object lock
-		 * before destroying a vma would help us eliminate the
-		 * i915_vm_tryget() here, AND thus also the barrier stuff
-		 * at the end. That's an easy fix, but sleeping locks in
-		 * a kthread should generally be avoided.
-		 */
-		ret = -EAGAIN;
-		if (!i915_vm_tryget(vma->vm))
-			break;
-
 		spin_unlock(&obj->vma.lock);
 
 		/*
@@ -189,17 +177,11 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			}
 		}
 
-		i915_vm_put(vma->vm);
 		spin_lock(&obj->vma.lock);
 	}
 	list_splice_init(&still_in_list, &obj->vma.list);
 	spin_unlock(&obj->vma.lock);
 
-	if (ret == -EAGAIN && flags & I915_GEM_OBJECT_UNBIND_BARRIER) {
-		rcu_barrier(); /* flush the i915_vm_release() */
-		goto try_again;
-	}
-
 	intel_runtime_pm_put(rpm, wakeref);
 
 	return ret;
-- 
2.36.1

