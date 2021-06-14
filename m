Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98D3A6BA5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200A789E65;
	Mon, 14 Jun 2021 16:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F30C89E35;
 Mon, 14 Jun 2021 16:26:34 +0000 (UTC)
IronPort-SDR: SxJrFfqcP2FJ03eIf2nLJajKa58qNJTo4v5CPf0s7erIk3r9aDhiy1RubY9wEom18tUdHMP85e
 GZuzU7UZbGbw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="204008269"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="204008269"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 09:26:26 -0700
IronPort-SDR: /6fK8LK+VhT4+zvpsAI6TXGi01PmtOavHtOQuJ8F1VZtqiKLyUe/Aj2uc+zpqJcfYU6FzBMBJI
 RhBhjcyQiw9Q==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="449946648"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.50])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 09:26:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/12] drm/i915: Reference objects on the ww object list
Date: Mon, 14 Jun 2021 18:26:01 +0200
Message-Id: <20210614162612.294869-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the ww transaction endpoint easily end up far out-of-scope of
the objects on the ww object list, particularly for contending lock
objects, make sure we reference objects on the list so they don't
disappear under us.

This comes with a performance penalty so it's been debated whether this
is really needed. But I think this is motivated by the fact that locking
is typically difficult to get right, and whatever we can do to make it
simpler for developers moving forward should be done, unless the
performance impact is far too high.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 8 ++++++--
 drivers/gpu/drm/i915/i915_gem.c            | 4 ++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d66aa00d023a..241666931945 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -169,13 +169,17 @@ static inline int __i915_gem_object_lock(struct drm_i915_gem_object *obj,
 	else
 		ret = dma_resv_lock(obj->base.resv, ww ? &ww->ctx : NULL);
 
-	if (!ret && ww)
+	if (!ret && ww) {
+		i915_gem_object_get(obj);
 		list_add_tail(&obj->obj_link, &ww->obj_list);
+	}
 	if (ret == -EALREADY)
 		ret = 0;
 
-	if (ret == -EDEADLK)
+	if (ret == -EDEADLK) {
+		i915_gem_object_get(obj);
 		ww->contended = obj;
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 6a0a3f0e36e1..c62dcd0e341a 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1222,6 +1222,7 @@ static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
 	while ((obj = list_first_entry_or_null(&ww->obj_list, struct drm_i915_gem_object, obj_link))) {
 		list_del(&obj->obj_link);
 		i915_gem_object_unlock(obj);
+		i915_gem_object_put(obj);
 	}
 }
 
@@ -1229,6 +1230,7 @@ void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj)
 {
 	list_del(&obj->obj_link);
 	i915_gem_object_unlock(obj);
+	i915_gem_object_put(obj);
 }
 
 void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ww)
@@ -1253,6 +1255,8 @@ int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
 
 	if (!ret)
 		list_add_tail(&ww->contended->obj_link, &ww->obj_list);
+	else
+		i915_gem_object_put(ww->contended);
 
 	ww->contended = NULL;
 
-- 
2.31.1

