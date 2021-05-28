Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6F394177
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BEB6F46E;
	Fri, 28 May 2021 10:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0B76F468;
 Fri, 28 May 2021 10:58:03 +0000 (UTC)
IronPort-SDR: dBeqD7iGl2/G4uQ1TYA5KcTZPkoPb0q0X4lPkW3VwbxgJpcEy/PhDyath9FBHSstXhkGFbmX2C
 I9rIWtYtgnUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266821819"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="266821819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:58:03 -0700
IronPort-SDR: u3YoDNxODPAuWHOR8R956aJPvR8ugoe46jTBs5xOFVZsrPEM+2rsQbeu+ULn8KT93GjPVSi56B
 nW5TXiKTbriQ==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="477885205"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.92])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:58:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 05/15] drm/i915/ttm: Embed a ttm buffer object in the i915
 gem object
Date: Fri, 28 May 2021 12:57:34 +0200
Message-Id: <20210528105744.58271-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
References: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
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

Embed a struct ttm_buffer_object into the i915 gem object, making sure
we alias the gem object part. It's a bit unfortunate that the
struct ttm_buffer_ojbect embeds a gem object since we otherwise could
make the TTM part private to the TTM backend, and use the usual
i915 gem object for the other backends.
To make this a bit more storage efficient for the other backends,
we'd have to use a pointer for the gem object which would require
a lot of changes in the driver. We postpone that for later.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c       |  7 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 12 +++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 2be6109d0093..5706d471692d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -62,6 +62,13 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 			  const struct drm_i915_gem_object_ops *ops,
 			  struct lock_class_key *key, unsigned flags)
 {
+	/*
+	 * A gem object is embedded both in a struct ttm_buffer_object :/ and
+	 * in a drm_i915_gem_object. Make sure they are aliased.
+	 */
+	BUILD_BUG_ON(offsetof(typeof(*obj), base) !=
+		     offsetof(typeof(*obj), __do_not_access.base));
+
 	spin_lock_init(&obj->vma.lock);
 	INIT_LIST_HEAD(&obj->vma.list);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index f5b46d11e6e6..d047ea126029 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -10,6 +10,7 @@
 #include <linux/mmu_notifier.h>
 
 #include <drm/drm_gem.h>
+#include <drm/ttm/ttm_bo_api.h>
 #include <uapi/drm/i915_drm.h>
 
 #include "i915_active.h"
@@ -99,7 +100,16 @@ struct i915_gem_object_page_iter {
 };
 
 struct drm_i915_gem_object {
-	struct drm_gem_object base;
+	/*
+	 * We might have reason to revisit the below since it wastes
+	 * a lot of space for non-ttm gem objects.
+	 * In any case, always use the accessors for the ttm_buffer_object
+	 * when accessing it.
+	 */
+	union {
+		struct drm_gem_object base;
+		struct ttm_buffer_object __do_not_access;
+	};
 
 	const struct drm_i915_gem_object_ops *ops;
 
-- 
2.31.1

