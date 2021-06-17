Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683803AAC53
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF176E88C;
	Thu, 17 Jun 2021 06:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493C26E86F;
 Thu, 17 Jun 2021 06:30:34 +0000 (UTC)
IronPort-SDR: K+0krZm/2fnXbebVwC8z8mTJPKKZSf6n+lMUzFwTpZiNTBgZgxgjwFHKihWYk3+3sLWz8U4jRj
 PEyrqpzVs/AQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="203287812"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="203287812"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:33 -0700
IronPort-SDR: qbnlL9Z9WwH6iRhPqLU6hbMgwTtYjpRKMqPVbYtIkoCSKgMNp1pcy7Re1cHLuGzCjRPLYLlm3o
 tR7sImVUe6iQ==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="554302636"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/12] drm/i915: Reference objects on the ww object list
Date: Thu, 17 Jun 2021 08:30:07 +0200
Message-Id: <20210617063018.92802-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
References: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
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

