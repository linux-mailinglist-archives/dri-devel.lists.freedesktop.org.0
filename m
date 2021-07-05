Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE63BBDDF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 15:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74CC89CF9;
	Mon,  5 Jul 2021 13:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3397489CF1;
 Mon,  5 Jul 2021 13:53:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="207154267"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="207154267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 06:53:28 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="562596206"
Received: from ricrossl-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.185])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 06:53:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/i915/uapi: convert drm_i915_gem_caching to kernel
 doc
Date: Mon,  5 Jul 2021 14:53:07 +0100
Message-Id: <20210705135310.1502437-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210705135310.1502437-1-matthew.auld@intel.com>
References: <20210705135310.1502437-1-matthew.auld@intel.com>
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
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert all the drm_i915_gem_caching bits to proper kernel doc.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 include/uapi/drm/i915_drm.h | 70 +++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 2f70c48567c0..d13c6c5fad04 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1363,43 +1363,59 @@ struct drm_i915_gem_busy {
 };
 
 /**
- * I915_CACHING_NONE
+ * struct drm_i915_gem_caching - Set or get the caching for given object
+ * handle.
  *
- * GPU access is not coherent with cpu caches. Default for machines without an
- * LLC.
- */
-#define I915_CACHING_NONE		0
-/**
- * I915_CACHING_CACHED
+ * Allow userspace to control the GTT caching bits for a given object when the
+ * object is later mapped through the ppGTT(or GGTT on older platforms lacking
+ * ppGTT support, or if the object is used for scanout). Note that this might
+ * require unbinding the object from the GTT first, if its current caching value
+ * doesn't match.
  *
- * GPU access is coherent with cpu caches and furthermore the data is cached in
- * last-level caches shared between cpu cores and the gpu GT. Default on
- * machines with HAS_LLC.
- */
-#define I915_CACHING_CACHED		1
-/**
- * I915_CACHING_DISPLAY
  *
- * Special GPU caching mode which is coherent with the scanout engines.
- * Transparently falls back to I915_CACHING_NONE on platforms where no special
- * cache mode (like write-through or gfdt flushing) is available. The kernel
- * automatically sets this mode when using a buffer as a scanout target.
- * Userspace can manually set this mode to avoid a costly stall and clflush in
- * the hotpath of drawing the first frame.
  */
-#define I915_CACHING_DISPLAY		2
-
 struct drm_i915_gem_caching {
 	/**
-	 * Handle of the buffer to set/get the caching level of. */
+	 * @handle: Handle of the buffer to set/get the caching level.
+	 */
 	__u32 handle;
 
 	/**
-	 * Cacheing level to apply or return value
+	 * @caching: The GTT caching level to apply or possible return value.
+	 *
+	 * The supported @caching values:
 	 *
-	 * bits0-15 are for generic caching control (i.e. the above defined
-	 * values). bits16-31 are reserved for platform-specific variations
-	 * (e.g. l3$ caching on gen7). */
+	 * I915_CACHING_NONE:
+	 *
+	 * GPU access is not coherent with CPU caches.  Default for machines
+	 * without an LLC. This means we need to manually clflush, if we want
+	 * GPU access to be coherent.
+	 *
+	 * I915_CACHING_CACHED:
+	 *
+	 * GPU access is coherent with CPU caches and furthermore the data is
+	 * cached in last-level caches shared between CPU cores and the GPU GT.
+	 * Default on machines with HAS_LLC. In general the fast shared
+	 * last-level cache(HAS_LLC) is considered much faster then platforms
+	 * which only support snooping(HAS_SNOOP), hence by default
+	 *
+	 * I915_CACHING_DISPLAY:
+	 *
+	 * Special GPU caching mode which is coherent with the scanout engines.
+	 * Transparently falls back to I915_CACHING_NONE on platforms where no
+	 * special cache mode (like write-through or gfdt flushing) is
+	 * available. The kernel automatically sets this mode when using a
+	 * buffer as a scanout target.  Userspace can manually set this mode to
+	 * avoid a costly stall and clflush in the hotpath of drawing the first
+	 * frame.
+	 *
+	 * Side note: On gen8+ this no longer does much since we lost the GGTT
+	 * caching bits. Although setting this is harmless, since it still
+	 * effectively falls back to I915_CACHING_NONE.
+	 */
+#define I915_CACHING_NONE		0
+#define I915_CACHING_CACHED		1
+#define I915_CACHING_DISPLAY		2
 	__u32 caching;
 };
 
-- 
2.26.3

