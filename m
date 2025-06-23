Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B6AE4953
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE3810E3EF;
	Mon, 23 Jun 2025 15:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsJ1ftUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A0A10E3ED;
 Mon, 23 Jun 2025 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750694017; x=1782230017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ikYvFDNC6CJgSac7sO5DCdNt3gIvzjrvk7qBI4wFuN0=;
 b=RsJ1ftUxjyHyw2tzW2oF+OkU0LqqIZTpwI2O17I2IVHE7RntWqZePIYb
 jVp55BzQay/DZRAujL9H5gro/E81pqd1ibYrne/g+34/l0LvzyVw81bUl
 laX/Q51G7pYuaqzGz3tBfvtJ0VD70s/2LLI2y4kdM8TEtDQySizQtsbSw
 QzW6/K9duIrcjsaCsFraXGJRoEKgMlV5qE/5Ewc/hMqbljEWYuAAPGJZY
 qwvH43e5Y3coEtgB4xx8LZXRuZGk7IYOhQOMZm5mdEpUDaRJIQh9yNOm2
 RhtoCo0NSyf4Er1oIkZ3+Ue+F2eI4u3TqCqfWOpmgGoyGr6hq6a/neEXB w==;
X-CSE-ConnectionGUID: jqQheTMbRwasB3xIGLqNwg==
X-CSE-MsgGUID: fviqp1pRSOimHAVQQS4jMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52625716"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52625716"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:37 -0700
X-CSE-ConnectionGUID: w8uhAWXOSiytMXm4BBKP7w==
X-CSE-MsgGUID: JuWJZh9ZRiuuY/4W1jVMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="156198873"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/3] drm/ttm,
 drm/xe: Modify the struct ttm_bo_lru_walk_cursor initialization
Date: Mon, 23 Jun 2025 17:53:12 +0200
Message-ID: <20250623155313.4901-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
References: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
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

Instead of the struct ttm_operation_ctx, Pass a struct ttm_lru_walk_arg
to enable us to easily extend the walk functionality, and to
implement ttm_lru_walk_for_evict() using the guarded LRU iteration.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_shrinker.c  |  3 ++-
 include/drm/ttm/ttm_bo.h          | 16 ++++++++--------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 5433eb87593d..6de1f0c432c2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -958,11 +958,11 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
  * ttm_bo_lru_cursor_init() - Initialize a struct ttm_bo_lru_cursor
  * @curs: The ttm_bo_lru_cursor to initialize.
  * @man: The ttm resource_manager whose LRU lists to iterate over.
- * @ctx: The ttm_operation_ctx to govern the locking.
+ * @arg: The ttm_lru_walk_arg to govern the walk.
  *
  * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
  * or prelocked buffer objects are available as detailed by
- * @ctx::resv and @ctx::allow_res_evict. Ticketlocking is not
+ * @arg->ctx.resv and @arg->ctx.allow_res_evict. Ticketlocking is not
  * supported.
  *
  * Return: Pointer to @curs. The function does not fail.
@@ -970,11 +970,11 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
 struct ttm_bo_lru_cursor *
 ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
 		       struct ttm_resource_manager *man,
-		       struct ttm_operation_ctx *ctx)
+		       struct ttm_lru_walk_arg *arg)
 {
 	memset(curs, 0, sizeof(*curs));
 	ttm_resource_cursor_init(&curs->res_curs, man);
-	curs->arg.ctx = ctx;
+	curs->arg = arg;
 
 	return curs;
 }
@@ -985,7 +985,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
 {
 	struct ttm_buffer_object *bo = res->bo;
 
-	if (!ttm_lru_walk_trylock(&curs->arg, bo, &curs->needs_unlock))
+	if (!ttm_lru_walk_trylock(curs->arg, bo, &curs->needs_unlock))
 		return NULL;
 
 	if (!ttm_bo_get_unless_zero(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 125c836e0ee4..f8a1129da2c3 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -66,11 +66,12 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
 		struct ttm_bo_lru_cursor curs;
 		struct ttm_buffer_object *ttm_bo;
+		struct ttm_lru_walk_arg arg = {.ctx = ctx};
 
 		if (!man || !man->use_tt)
 			continue;
 
-		ttm_bo_lru_for_each_reserved_guarded(&curs, man, ctx, ttm_bo) {
+		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
 			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
 				continue;
 
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index c19ac92c33a9..ab9a6b343a53 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -484,8 +484,8 @@ struct ttm_bo_lru_cursor {
 	 * unlock before the next iteration or after loop exit.
 	 */
 	bool needs_unlock;
-	/** @arg: Common BO LRU walk arguments. */
-	struct ttm_lru_walk_arg arg;
+	/** @arg: Pointer to common BO LRU walk arguments. */
+	struct ttm_lru_walk_arg *arg;
 };
 
 void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
@@ -493,7 +493,7 @@ void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
 struct ttm_bo_lru_cursor *
 ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
 		       struct ttm_resource_manager *man,
-		       struct ttm_operation_ctx *ctx);
+		       struct ttm_lru_walk_arg *arg);
 
 struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
 
@@ -504,9 +504,9 @@ struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
  */
 DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
 	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
-	     ttm_bo_lru_cursor_init(curs, man, ctx),
+	     ttm_bo_lru_cursor_init(curs, man, arg),
 	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
-	     struct ttm_operation_ctx *ctx);
+	     struct ttm_lru_walk_arg *arg);
 static inline void *
 class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
 { return *_T; }
@@ -517,7 +517,7 @@ class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
  * resources on LRU lists.
  * @_cursor: struct ttm_bo_lru_cursor to use for the iteration.
  * @_man: The resource manager whose LRU lists to iterate over.
- * @_ctx: The struct ttm_operation_context to govern the @_bo locking.
+ * @_arg: The struct ttm_lru_walk_arg to govern the LRU walk.
  * @_bo: The struct ttm_buffer_object pointer pointing to the buffer object
  * for the current iteration.
  *
@@ -530,8 +530,8 @@ class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
  * example a return or break statement. Exiting the loop will also unlock
  * (if needed) and unreference @_bo.
  */
-#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
-	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
 		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
 		     (_bo) = ttm_bo_lru_cursor_next(_cursor))
 
-- 
2.49.0

