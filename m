Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1E43A0C7D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5016E10A;
	Wed,  9 Jun 2021 06:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533BE6E12D;
 Wed,  9 Jun 2021 06:34:53 +0000 (UTC)
IronPort-SDR: 8RzCKhbXRcIbxMP2v9OScw+k3X7NuoyZP556I80sEcDeDv1XIayOgtnmX6EiHO1I/Msw1D/d0T
 vR1Vq4kb7vkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="268868886"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="268868886"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:34:53 -0700
IronPort-SDR: GFc06J6TZPQXNiNvRBGYm2CLfo+gpWQb9g5A5fhSf2FZzNZIh/qXjpHShHbVOlnPXt0KmcLvey
 LSdn0U80SNOw==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="482265795"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.109])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:34:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/i915: Introduce a ww transaction helper
Date: Wed,  9 Jun 2021 08:34:30 +0200
Message-Id: <20210609063436.284332-4-thomas.hellstrom@linux.intel.com>
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

Introduce a for_i915_gem_ww(){} utility to help make the code
around a ww transaction more readable.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

