Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749993A0C7F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C226E154;
	Wed,  9 Jun 2021 06:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFD66E0F0;
 Wed,  9 Jun 2021 06:34:49 +0000 (UTC)
IronPort-SDR: KRHKNDur1eqLllg6PV6dKZNslBSRuSyTORkC4QJXzwq781r0hfxrZ3a8v4wdMV0gL3crOld7Dl
 Iac/azKB5kiA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="268868878"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="268868878"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:34:49 -0700
IronPort-SDR: 3XNMiaRNqGnqwhCFvWHSODuOYSBdd0UcYUT9aLj54Vnt2daGV7h6WFfkDv9kDqH+/vl4srAHqe
 pWh9RRLfYmHA==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="482265769"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.109])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:34:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/i915: Reference objects on the ww object list
Date: Wed,  9 Jun 2021 08:34:28 +0200
Message-Id: <20210609063436.284332-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
index 7c0eb425cb3b..1fafcc89ecee 100644
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
index 589388dec48a..3f060ab58c5d 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1219,6 +1219,7 @@ static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
 	while ((obj = list_first_entry_or_null(&ww->obj_list, struct drm_i915_gem_object, obj_link))) {
 		list_del(&obj->obj_link);
 		i915_gem_object_unlock(obj);
+		i915_gem_object_put(obj);
 	}
 }
 
@@ -1226,6 +1227,7 @@ void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj)
 {
 	list_del(&obj->obj_link);
 	i915_gem_object_unlock(obj);
+	i915_gem_object_put(obj);
 }
 
 void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ww)
@@ -1250,6 +1252,8 @@ int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
 
 	if (!ret)
 		list_add_tail(&ww->contended->obj_link, &ww->obj_list);
+	else
+		i915_gem_object_put(ww->contended);
 
 	ww->contended = NULL;
 
-- 
2.31.1

