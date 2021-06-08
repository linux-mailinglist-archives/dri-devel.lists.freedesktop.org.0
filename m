Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F302B39F257
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3066EB69;
	Tue,  8 Jun 2021 09:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27CA6EB5F;
 Tue,  8 Jun 2021 09:29:07 +0000 (UTC)
IronPort-SDR: KXwN9s07F6CXvMsaNQ2fE+Blb066GCvOXJSSMtQfIx+7lmje8i3vpY+Ew9eHdyznZ0kPiAD6jp
 Iq3XfNrNUbNg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226150954"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226150954"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:07 -0700
IronPort-SDR: yF4Xv33vq6UinavSYKYTP+vzE9SeG/xd+XLxS/A5a+qJ7BDzDt2wVSKQuWuLdjV/mxwXu5q13E
 wtd1OhVQeQ9g==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="551544388"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.115])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915: Introduce a ww transaction helper
Date: Tue,  8 Jun 2021 11:28:40 +0200
Message-Id: <20210608092846.64198-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
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

Introduce a for_i915_gem_ww(){} utility to help make the code
around a ww transaction more readable.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem_ww.h | 31 +++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i915_gem_ww.h
index f2d8769e4118..f6b1a796667b 100644
--- a/drivers/gpu/drm/i915/i915_gem_ww.h
+++ b/drivers/gpu/drm/i915/i915_gem_ww.h
@@ -11,11 +11,40 @@ struct i915_gem_ww_ctx {
 	struct ww_acquire_ctx ctx;
 	struct list_head obj_list;
 	struct drm_i915_gem_object *contended;
-	bool intr;
+	unsigned short intr;
+	unsigned short loop;
 };
 
 void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
 void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
 int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
 void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
+
+/* Internal functions used by the inlines! Don't use. */
+static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err)
+{
+	ww->loop = 0;
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(ww);
+		if (!err)
+			ww->loop = 1;
+	}
+
+	if (!ww->loop)
+		i915_gem_ww_ctx_fini(ww);
+
+	return err;
+}
+
+static inline void
+__i915_gem_ww_init(struct i915_gem_ww_ctx *ww, bool intr)
+{
+	i915_gem_ww_ctx_init(ww, intr);
+	ww->loop = 1;
+}
+
+#define for_i915_gem_ww(_ww, _err, _intr)			\
+	for (__i915_gem_ww_init(_ww, _intr); (_ww)->loop;	\
+	     _err = __i915_gem_ww_fini(_ww, _err))
+
 #endif
-- 
2.31.1

