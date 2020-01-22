Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82484145719
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265DC6E503;
	Wed, 22 Jan 2020 13:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1DE6F4F9;
 Wed, 22 Jan 2020 12:58:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so7102355wma.1;
 Wed, 22 Jan 2020 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=eV/GSup/J+DPyjODj/IKt5fwIjXuxUSgJpb75W8LC6U=;
 b=VHFXPAe4iU834A+nM/yebS6BcrV6A+JdNS2XMgAfq1IjA7eSoZcuX5Owoc2fy4soVJ
 W7iqONNpfEOrg3PGPSFLYrEpYxEVLVYfqgPkVof6oeOig3QJgHjKnDGA2RNGiVYGVCvl
 65q4B3ZV954fCPQPmRXX04jTi7QpHMBZ+CgewH9i6xAiiIHxfLQUTjSmlfostp3y6+rA
 /e2qi7prHVNlzYDxZ7861lc/sBfbbu4iS8CW4W5lLocX0Gq4ilpwmV9xgmih52tWbNQr
 yRCtncVRaEcZkfVO7CvgyOFs0xkt/dKpsz42HZgQG6TcYiCMQIaqVh0IX6ZQKJ5sY+yS
 KPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=eV/GSup/J+DPyjODj/IKt5fwIjXuxUSgJpb75W8LC6U=;
 b=S1CmSK2E3ZnQY2Z5lMkCvzcl6NWkXzSx4JPOdeR7pWHBZzf8xygg7ReJxDkNg/2qku
 W0C7qil9ifFoeGtWWrONrI14nuA+2h2XWKL/NpEur7hOn+luLNbnrgww+sWvB/ZieDI1
 VRRAN+U2AjcmxepT9rFNu2VzVtEf6PpOl3pyaR8Nkw+9dOfCrFOTa6z/TmzHABOCWCuS
 9Gwx94A2ostL0xNl1TAgffPAnsBjYe6joTHqRr5g/Aik62544UBOd9+O4QeQ2DGIWkzp
 AQ7tXQ1mukrroMaUJ61+Odw9XWbWXOzdUCKKHCy4PCzsD8gVjJqTzkweene297ltULN6
 DBnA==
X-Gm-Message-State: APjAAAUXtbngAp7wc8IhCPxveFzR553TRYtMt/wgKzeAMzmQAQAv1038
 UuW4gKEDJN2hZMjxamP4ISvWtnWntIY=
X-Google-Smtp-Source: APXvYqwg1UmK/8t4IPer6lnKvVxW0UlqpaxYbwEOYeb1DCJgWunFozUH5IDawHx9YeRgeC99ZNE+oA==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
 r4mr2889122wmg.140.1579697884756; 
 Wed, 22 Jan 2020 04:58:04 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id p26sm3736109wmc.24.2020.01.22.04.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 04:58:04 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/gem: manual conversion to struct drm_device
 logging macros.
Date: Wed, 22 Jan 2020 15:57:50 +0300
Message-Id: <20200122125750.9737-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122125750.9737-1-wambui.karugax@gmail.com>
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 13:52:23 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert most of the remaining uses of the printk based logging macros to
the new struct drm_device based logging macros in drm/i915/gem.
This also involves extracting the struct drm_i915_private device
from various types, and using it in the various macros.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 41 +++++++++++--------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 23 ++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  4 +-
 3 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5432da2abda0..28b8794695be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1444,6 +1444,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 	struct i915_context_engines_load_balance __user *ext =
 		container_of_user(base, typeof(*ext), base);
 	const struct set_engines *set = data;
+	struct drm_i915_private *i915 = set->ctx->i915;
 	struct intel_engine_cs *stack[16];
 	struct intel_engine_cs **siblings;
 	struct intel_context *ce;
@@ -1451,24 +1452,25 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 	unsigned int n;
 	int err;
 
-	if (!HAS_EXECLISTS(set->ctx->i915))
+	if (!HAS_EXECLISTS(i915))
 		return -ENODEV;
 
-	if (USES_GUC_SUBMISSION(set->ctx->i915))
+	if (USES_GUC_SUBMISSION(i915))
 		return -ENODEV; /* not implement yet */
 
 	if (get_user(idx, &ext->engine_index))
 		return -EFAULT;
 
 	if (idx >= set->engines->num_engines) {
-		DRM_DEBUG("Invalid placement value, %d >= %d\n",
-			  idx, set->engines->num_engines);
+		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
+			idx, set->engines->num_engines);
 		return -EINVAL;
 	}
 
 	idx = array_index_nospec(idx, set->engines->num_engines);
 	if (set->engines->engines[idx]) {
-		DRM_DEBUG("Invalid placement[%d], already occupied\n", idx);
+		drm_dbg(&i915->drm,
+			"Invalid placement[%d], already occupied\n", idx);
 		return -EEXIST;
 	}
 
@@ -1500,12 +1502,13 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 			goto out_siblings;
 		}
 
-		siblings[n] = intel_engine_lookup_user(set->ctx->i915,
+		siblings[n] = intel_engine_lookup_user(i915,
 						       ci.engine_class,
 						       ci.engine_instance);
 		if (!siblings[n]) {
-			DRM_DEBUG("Invalid sibling[%d]: { class:%d, inst:%d }\n",
-				  n, ci.engine_class, ci.engine_instance);
+			drm_dbg(&i915->drm,
+				"Invalid sibling[%d]: { class:%d, inst:%d }\n",
+				n, ci.engine_class, ci.engine_instance);
 			err = -EINVAL;
 			goto out_siblings;
 		}
@@ -1538,6 +1541,7 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 	struct i915_context_engines_bond __user *ext =
 		container_of_user(base, typeof(*ext), base);
 	const struct set_engines *set = data;
+	struct drm_i915_private *i915 = set->ctx->i915;
 	struct i915_engine_class_instance ci;
 	struct intel_engine_cs *virtual;
 	struct intel_engine_cs *master;
@@ -1548,14 +1552,15 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 		return -EFAULT;
 
 	if (idx >= set->engines->num_engines) {
-		DRM_DEBUG("Invalid index for virtual engine: %d >= %d\n",
-			  idx, set->engines->num_engines);
+		drm_dbg(&i915->drm,
+			"Invalid index for virtual engine: %d >= %d\n",
+			idx, set->engines->num_engines);
 		return -EINVAL;
 	}
 
 	idx = array_index_nospec(idx, set->engines->num_engines);
 	if (!set->engines->engines[idx]) {
-		DRM_DEBUG("Invalid engine at %d\n", idx);
+		drm_dbg(&i915->drm, "Invalid engine at %d\n", idx);
 		return -EINVAL;
 	}
 	virtual = set->engines->engines[idx]->engine;
@@ -1573,11 +1578,12 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 	if (copy_from_user(&ci, &ext->master, sizeof(ci)))
 		return -EFAULT;
 
-	master = intel_engine_lookup_user(set->ctx->i915,
+	master = intel_engine_lookup_user(i915,
 					  ci.engine_class, ci.engine_instance);
 	if (!master) {
-		DRM_DEBUG("Unrecognised master engine: { class:%u, instance:%u }\n",
-			  ci.engine_class, ci.engine_instance);
+		drm_dbg(&i915->drm,
+			"Unrecognised master engine: { class:%u, instance:%u }\n",
+			ci.engine_class, ci.engine_instance);
 		return -EINVAL;
 	}
 
@@ -1590,12 +1596,13 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci)))
 			return -EFAULT;
 
-		bond = intel_engine_lookup_user(set->ctx->i915,
+		bond = intel_engine_lookup_user(i915,
 						ci.engine_class,
 						ci.engine_instance);
 		if (!bond) {
-			DRM_DEBUG("Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
-				  n, ci.engine_class, ci.engine_instance);
+			drm_dbg(&i915->drm,
+				"Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
+				n, ci.engine_class, ci.engine_instance);
 			return -EINVAL;
 		}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 61c0a837f163..cae0581d7e47 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1924,7 +1924,7 @@ static int i915_reset_gen7_sol_offsets(struct i915_request *rq)
 	int i;
 
 	if (!IS_GEN(rq->i915, 7) || rq->engine->id != RCS0) {
-		DRM_DEBUG("sol reset is gen7/rcs only\n");
+		drm_dbg(&rq->i915->drm, "sol reset is gen7/rcs only\n");
 		return -EINVAL;
 	}
 
@@ -2847,6 +2847,7 @@ int
 i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_execbuffer *args = data;
 	struct drm_i915_gem_execbuffer2 exec2;
 	struct drm_i915_gem_exec_object *exec_list = NULL;
@@ -2856,7 +2857,7 @@ i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
 	int err;
 
 	if (!check_buffer_count(count)) {
-		DRM_DEBUG("execbuf2 with %zd buffers\n", count);
+		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
 		return -EINVAL;
 	}
 
@@ -2881,8 +2882,9 @@ i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
 	exec2_list = kvmalloc_array(count + 1, eb_element_size(),
 				    __GFP_NOWARN | GFP_KERNEL);
 	if (exec_list == NULL || exec2_list == NULL) {
-		DRM_DEBUG("Failed to allocate exec list for %d buffers\n",
-			  args->buffer_count);
+		drm_dbg(&i915->drm,
+			"Failed to allocate exec list for %d buffers\n",
+			args->buffer_count);
 		kvfree(exec_list);
 		kvfree(exec2_list);
 		return -ENOMEM;
@@ -2891,8 +2893,8 @@ i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
 			     u64_to_user_ptr(args->buffers_ptr),
 			     sizeof(*exec_list) * count);
 	if (err) {
-		DRM_DEBUG("copy %d exec entries failed %d\n",
-			  args->buffer_count, err);
+		drm_dbg(&i915->drm, "copy %d exec entries failed %d\n",
+			args->buffer_count, err);
 		kvfree(exec_list);
 		kvfree(exec2_list);
 		return -EFAULT;
@@ -2939,6 +2941,7 @@ int
 i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_execbuffer2 *args = data;
 	struct drm_i915_gem_exec_object2 *exec2_list;
 	struct drm_syncobj **fences = NULL;
@@ -2946,7 +2949,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	int err;
 
 	if (!check_buffer_count(count)) {
-		DRM_DEBUG("execbuf2 with %zd buffers\n", count);
+		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
 		return -EINVAL;
 	}
 
@@ -2958,14 +2961,14 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	exec2_list = kvmalloc_array(count + 1, eb_element_size(),
 				    __GFP_NOWARN | GFP_KERNEL);
 	if (exec2_list == NULL) {
-		DRM_DEBUG("Failed to allocate exec list for %zd buffers\n",
-			  count);
+		drm_dbg(&i915->drm, "Failed to allocate exec list for %zd buffers\n",
+			count);
 		return -ENOMEM;
 	}
 	if (copy_from_user(exec2_list,
 			   u64_to_user_ptr(args->buffers_ptr),
 			   sizeof(*exec2_list) * count)) {
-		DRM_DEBUG("copy %zd exec entries failed\n", count);
+		drm_dbg(&i915->drm, "copy %zd exec entries failed\n", count);
 		kvfree(exec2_list);
 		return -EFAULT;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 54aca5c9101e..24f4cadea114 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -83,10 +83,12 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 
 int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int err;
 
 	if (unlikely(obj->mm.madv != I915_MADV_WILLNEED)) {
-		DRM_DEBUG("Attempting to obtain a purgeable object\n");
+		drm_dbg(&i915->drm,
+			"Attempting to obtain a purgeable object\n");
 		return -EFAULT;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
