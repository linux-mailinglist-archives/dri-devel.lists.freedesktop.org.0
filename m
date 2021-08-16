Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0533EDC2E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 19:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2055189C1F;
	Mon, 16 Aug 2021 17:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15EB89C1F;
 Mon, 16 Aug 2021 17:15:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="212783391"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="212783391"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 10:14:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="448686654"
Received: from yifeiren-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.101])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 10:14:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2] drm/i915: Ditch the i915_gem_ww_ctx loop member
Date: Mon, 16 Aug 2021 19:14:44 +0200
Message-Id: <20210816171444.105469-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

It's only used by the for_i915_gem_ww() macro and we can use
the (typically) on-stack _err variable in its place.

v2:
- Don't clear the _err variable when entering the loop
  (Matthew Auld, Maarten Lankhorst).
- Use parentheses around the _err macro argument.
- Fix up comment.

Cc: Matthew Auld <matthew.william.auld@gmail.com>
Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem_ww.h | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i915_gem_ww.h
index f6b1a796667b..86f0fe343de6 100644
--- a/drivers/gpu/drm/i915/i915_gem_ww.h
+++ b/drivers/gpu/drm/i915/i915_gem_ww.h
@@ -11,8 +11,7 @@ struct i915_gem_ww_ctx {
 	struct ww_acquire_ctx ctx;
 	struct list_head obj_list;
 	struct drm_i915_gem_object *contended;
-	unsigned short intr;
-	unsigned short loop;
+	bool intr;
 };
 
 void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
@@ -20,31 +19,23 @@ void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
 int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
 void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
 
-/* Internal functions used by the inlines! Don't use. */
+/* Internal function used by the inlines! Don't use. */
 static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err)
 {
-	ww->loop = 0;
 	if (err == -EDEADLK) {
 		err = i915_gem_ww_ctx_backoff(ww);
 		if (!err)
-			ww->loop = 1;
+			err = -EDEADLK;
 	}
 
-	if (!ww->loop)
+	if (err != -EDEADLK)
 		i915_gem_ww_ctx_fini(ww);
 
 	return err;
 }
 
-static inline void
-__i915_gem_ww_init(struct i915_gem_ww_ctx *ww, bool intr)
-{
-	i915_gem_ww_ctx_init(ww, intr);
-	ww->loop = 1;
-}
-
-#define for_i915_gem_ww(_ww, _err, _intr)			\
-	for (__i915_gem_ww_init(_ww, _intr); (_ww)->loop;	\
-	     _err = __i915_gem_ww_fini(_ww, _err))
-
+#define for_i915_gem_ww(_ww, _err, _intr)			  \
+	for (i915_gem_ww_ctx_init(_ww, _intr), (_err) = -EDEADLK; \
+	     (_err) == -EDEADLK;				  \
+	     (_err) = __i915_gem_ww_fini(_ww, _err))
 #endif
-- 
2.31.1

