Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83305623DDC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FC110E68E;
	Thu, 10 Nov 2022 08:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C9910E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:31:45 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so3834216pjs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 21:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pfQcOXU4f4vE0mNbTEA+z4XPracyYazvwGo3pIVP5Vk=;
 b=jIaXp2PB14E5ECoh4YQq5EviMVNYnMps57LJ7IW5OrtRUwltooROc3T+hY2zZFOAaY
 j1trRv72fGHd+HF5tfzv0aVbdWRIJQYMZ1ksvp1Jju8wFvO3xDGJRW0RRf3ybtP4qzfb
 bVmc+Vm9ZxjfeMy8vaZtjoUYXKwrSlRhoYOJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pfQcOXU4f4vE0mNbTEA+z4XPracyYazvwGo3pIVP5Vk=;
 b=1M3ajPtDlmPtqiQSaNMIJE9rfcp8Y3EDqB1v50IDZzUGpzVl8yjqZAJFy6vpBHLMKL
 dgtykP+JD/uWloxzE2XtpTaBFS+P0GbdASL4Pek9EmlQJjpNtlSdWJPuBrrErU8k5qf2
 k0nKlZa9racuBRbKbJsLRdGxFdcIRcStyN0lLA0Kab/v82S5ncEO9IUrOCTaXqFlXvJM
 rsadbNYpXNHfQMBqseXSvfeZxCrEvSltE/z8exMZtJIQKKwN9XgMrEfS/ezgSZqdpN6L
 t8Vte8jPknY3NY4jAh3irxuC58Wvq863FaVtAflZZwm0DeK7iZlP9QTjA7olIVul87LY
 8KLw==
X-Gm-Message-State: ACrzQf0I2aGnzdnWU9tCH/bFsdnXSpuGK9zEvuFkP5w1QbSmlhwnVWtD
 taLhHyd8lHUw3D6svmBFYxG9xg==
X-Google-Smtp-Source: AMsMyM6zWKiaKsCFLhyjKJcOmm2M5Vsiz3KSnYxoTQexQzJ8F1cTbrYgNklBlqu/AOR24kEkM2wjcQ==
X-Received: by 2002:a17:903:2452:b0:187:99b:c8fe with SMTP id
 l18-20020a170903245200b00187099bc8femr62092709pls.113.1668058305450; 
 Wed, 09 Nov 2022 21:31:45 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:ad4e:fb19:81ac:fe89])
 by smtp.gmail.com with UTF8SMTPSA id
 u7-20020a17090a410700b002135e8074b1sm2131410pjf.55.2022.11.09.21.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:31:45 -0800 (PST)
From: Mani Milani <mani@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915: Fix unhandled deadlock in grab_vma()
Date: Thu, 10 Nov 2022 16:31:33 +1100
Message-Id: <20221110053133.2433412-1-mani@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:30 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Mani Milani <mani@chromium.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At present, the gpu thread crashes at times when grab_vma() attempts to
acquire a gem object lock when in a deadlock state.

Problems:
I identified the following 4 issues in the current code:
1. Since grab_vma() calls i915_gem_object_trylock(), which consequently
   calls ww_mutex_trylock(), to acquire lock, it does not perform any
   -EDEADLK handling; And -EALREADY handling is also unreliable,
   according to the description of ww_mutex_trylock().
2. Since the return value of grab_vma() is a boolean showing
   success/failure, it does not provide any extra information on the
   failure reason, and therefore does not provide any mechanism to its
   caller to take any action to fix a potential deadlock.
3. Current grab_vma() implementation produces inconsistent behaviour
   depending on the refcount value, without informing the caller. If
   refcount is already zero, grab_vma() neither acquires lock nor
   increments the refcount, but still returns 'true' for success! This
   means that grab_vma() returning true (for success) does not always
   mean that the gem obj is actually safely accessible.
4. Currently, calling "i915_gem_object_lock(obj,ww)" is meant to be
   followed by a consequent "i915_gem_object_unlock(obj)" ONLY if the
   original 'ww' object pointer was NULL, or otherwise not be called and
   leave the houskeeping to "i915_gem_ww_ctx_fini(ww)". There are a few
   issues with this:
   - This is not documented anywhere in the code (that I could find),
     but only explained in an older commit message.
   - This produces an inconsistent usage of the lock/unlock functions,
     increasing the chance of mistakes and issues.
   - This is not a clean design as it requires any new code that calls
     these lock/unlock functions to know their internals, as well as the
     internals of the functions calling the new code being added.

Fix:
To fix the issues above, this patch:
1. Changes grab_vma() to call i915_gem_object_lock() instead of
   i915_gem_object_trylock(), to handle -EDEADLK and -EALREADY cases.
   This should not cause any issue since the PIN_NONBLOCK flag is
   checked beforehand in the 2 cases grab_vma() is called.
2. Changes grab_vma() to return the actual error code, instead of bool.
3. Changes grab_vma() to behave consistently when returning success, by
   both incrementing the refcount and acquiring lock at all times.
4. Changes i915_gem_object_unlock() to pair with i915_gem_object_lock()
   nicely in all cases and do the housekeeping without the need for the
   caller to do anything other than simply calling lock and unlock.
5. Ensures the gem obj->obj_link is initialized and deleted from the ww
   list such that it can be tested for emptiness using list_empty().

Signed-off-by: Mani Milani <mani@chromium.org>
---

 drivers/gpu/drm/i915/gem/i915_gem_object.c |  2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 10 ++++-
 drivers/gpu/drm/i915/i915_gem_evict.c      | 48 ++++++++++++----------
 drivers/gpu/drm/i915/i915_gem_ww.c         |  8 ++--
 4 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 369006c5317f..69d013b393fb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -78,6 +78,8 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&obj->mm.link);
 
+	INIT_LIST_HEAD(&obj->obj_link);
+
 	INIT_LIST_HEAD(&obj->lut_list);
 	spin_lock_init(&obj->lut_lock);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 1723af9b0f6a..7e7a61bdf52c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -219,7 +219,7 @@ static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj,
 		return ww_mutex_trylock(&obj->base.resv->lock, &ww->ctx);
 }
 
-static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
+static inline void __i915_gem_object_unlock(struct drm_i915_gem_object *obj)
 {
 	if (obj->ops->adjust_lru)
 		obj->ops->adjust_lru(obj);
@@ -227,6 +227,14 @@ static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
 	dma_resv_unlock(obj->base.resv);
 }
 
+static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
+{
+	if (list_empty(&obj->obj_link))
+		__i915_gem_object_unlock(obj);
+	else
+		i915_gem_ww_unlock_single(obj);
+}
+
 static inline void
 i915_gem_object_set_readonly(struct drm_i915_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index f025ee4fa526..3eb514b4eddc 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -55,29 +55,33 @@ static int ggtt_flush(struct intel_gt *gt)
 	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 }
 
-static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
+static int grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
 {
+	int err;
+
+	/* Dead objects don't need pins */
+	if (dying_vma(vma))
+		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+
+	err = i915_gem_object_lock(vma->obj, ww);
+
 	/*
 	 * We add the extra refcount so the object doesn't drop to zero until
-	 * after ungrab_vma(), this way trylock is always paired with unlock.
+	 * after ungrab_vma(), this way lock is always paired with unlock.
 	 */
-	if (i915_gem_object_get_rcu(vma->obj)) {
-		if (!i915_gem_object_trylock(vma->obj, ww)) {
-			i915_gem_object_put(vma->obj);
-			return false;
-		}
-	} else {
-		/* Dead objects don't need pins */
-		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-	}
+	if (!err)
+		i915_gem_object_get(vma->obj);
 
-	return true;
+	return err;
 }
 
 static void ungrab_vma(struct i915_vma *vma)
 {
-	if (dying_vma(vma))
+	if (dying_vma(vma)) {
+		/* Dead objects don't need pins */
+		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
 		return;
+	}
 
 	i915_gem_object_unlock(vma->obj);
 	i915_gem_object_put(vma->obj);
@@ -93,10 +97,11 @@ mark_free(struct drm_mm_scan *scan,
 	if (i915_vma_is_pinned(vma))
 		return false;
 
-	if (!grab_vma(vma, ww))
+	if (grab_vma(vma, ww))
 		return false;
 
 	list_add(&vma->evict_link, unwind);
+
 	return drm_mm_scan_add_block(scan, &vma->node);
 }
 
@@ -284,10 +289,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
 		vma = container_of(node, struct i915_vma, node);
 
 		/* If we find any non-objects (!vma), we cannot evict them */
-		if (vma->node.color != I915_COLOR_UNEVICTABLE &&
-		    grab_vma(vma, ww)) {
-			ret = __i915_vma_unbind(vma);
-			ungrab_vma(vma);
+		if (vma->node.color != I915_COLOR_UNEVICTABLE) {
+			ret = grab_vma(vma, ww);
+			if (!ret) {
+				ret = __i915_vma_unbind(vma);
+				ungrab_vma(vma);
+			}
 		} else {
 			ret = -ENOSPC;
 		}
@@ -382,10 +389,9 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 			break;
 		}
 
-		if (!grab_vma(vma, ww)) {
-			ret = -ENOSPC;
+		ret = grab_vma(vma, ww);
+		if (ret)
 			break;
-		}
 
 		/*
 		 * Never show fear in the face of dragons!
diff --git a/drivers/gpu/drm/i915/i915_gem_ww.c b/drivers/gpu/drm/i915/i915_gem_ww.c
index 3f6ff139478e..937b279f50fc 100644
--- a/drivers/gpu/drm/i915/i915_gem_ww.c
+++ b/drivers/gpu/drm/i915/i915_gem_ww.c
@@ -19,16 +19,14 @@ static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
 	struct drm_i915_gem_object *obj;
 
 	while ((obj = list_first_entry_or_null(&ww->obj_list, struct drm_i915_gem_object, obj_link))) {
-		list_del(&obj->obj_link);
-		i915_gem_object_unlock(obj);
-		i915_gem_object_put(obj);
+		i915_gem_ww_unlock_single(obj);
 	}
 }
 
 void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj)
 {
-	list_del(&obj->obj_link);
-	i915_gem_object_unlock(obj);
+	list_del_init(&obj->obj_link);
+	__i915_gem_object_unlock(obj);
 	i915_gem_object_put(obj);
 }
 
-- 
2.38.1.431.g37b22c650d-goog

