Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB639844C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B480E6EB86;
	Wed,  2 Jun 2021 08:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D256EB87;
 Wed,  2 Jun 2021 08:38:35 +0000 (UTC)
IronPort-SDR: UXiM9t+ksoJl2wtiS+Q0SaE/i9HRgH2PUQx0gAaUFFW5y8twtc+uEGzsOsCLrEjo5LfcW8FQJp
 4fvCDDprWCfA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="225026224"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="225026224"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 01:38:35 -0700
IronPort-SDR: ZRsmWL+87jSkylQALeDvH32yOJB9o2agtSPKjNzkKBZ//rQPZ9VD/9fdb+AW/yE+kdjcsUZZ9h
 +eMfSh7jFmZA==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="467376300"
Received: from lmarkel-mobl1.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.49])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 01:38:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 02/11] drm/i915/ttm: Embed a ttm buffer object in the i915
 gem object
Date: Wed,  2 Jun 2021 10:38:09 +0200
Message-Id: <20210602083818.241793-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602083818.241793-1-thomas.hellstrom@linux.intel.com>
References: <20210602083818.241793-1-thomas.hellstrom@linux.intel.com>
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

