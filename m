Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C483F35C608
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9D189BB0;
	Mon, 12 Apr 2021 12:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F0989BB0;
 Mon, 12 Apr 2021 12:18:31 +0000 (UTC)
IronPort-SDR: nt9OEbwgDyTs3vqBFWgaIeDtCx8lw2v/UoQPvXyCdmaSXr46X3HMxqa4bN728vBCRjqr+xtCIf
 C9QZoT1cy17g==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="194204898"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="194204898"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 05:18:30 -0700
IronPort-SDR: Nlwu90ZxgPxnXLudkLb8t2BgniqYnoYtzYYKswGYPM35Hm401kuvbBUcmqf7VFPCodhblG1AZj
 lsZI1E4Yr1fw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="451433459"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 05:18:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH] drm/doc/rfc: i915 DG1 uAPI
Date: Mon, 12 Apr 2021 13:18:02 +0100
Message-Id: <20210412121802.57131-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an entry for the new uAPI needed for DG1.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
---
 Documentation/gpu/rfc/i915_create_ext.c       | 48 ++++++++++
 .../gpu/rfc/i915_create_ext_placements.c      | 19 ++++
 Documentation/gpu/rfc/i915_region_query.c     | 54 +++++++++++
 Documentation/gpu/rfc/index.rst               | 91 +++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_create_ext.c
 create mode 100644 Documentation/gpu/rfc/i915_create_ext_placements.c
 create mode 100644 Documentation/gpu/rfc/i915_region_query.c

diff --git a/Documentation/gpu/rfc/i915_create_ext.c b/Documentation/gpu/rfc/i915_create_ext.c
new file mode 100644
index 000000000000..57c98717d14c
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_create_ext.c
@@ -0,0 +1,48 @@
+struct drm_i915_gem_create_ext {
+	/*
+	 * Requested size for the object.
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 */
+	__u64 size;
+	/*
+	 * Returned handle for the object.
+	 *
+	 * Object handles are nonzero.
+	 */
+	__u32 handle;
+	/* MBZ */
+	__u32 flags;
+	/*
+	 * For I915_GEM_CREATE_EXT_SETPARAM extension usage see both:
+	 *	struct drm_i915_gem_create_ext_setparam.
+	 *	struct drm_i915_gem_object_param for the possible parameters.
+	 */
+#define I915_GEM_CREATE_EXT_SETPARAM 0
+	__u64 extensions;
+};
+
+struct drm_i915_gem_object_param {
+	/* Object handle (0 for I915_GEM_CREATE_EXT_SETPARAM) */
+	__u32 handle;
+
+	/* Data pointer size */
+	__u32 size;
+
+/*
+ * I915_OBJECT_PARAM:
+ *
+ * Select object namespace for the param.
+ */
+#define I915_OBJECT_PARAM  (1ull<<32)
+
+	__u64 param;
+
+	/* Data value or pointer */
+	__u64 data;
+};
+
+struct drm_i915_gem_create_ext_setparam {
+	struct i915_user_extension base;
+	struct drm_i915_gem_object_param param;
+};
diff --git a/Documentation/gpu/rfc/i915_create_ext_placements.c b/Documentation/gpu/rfc/i915_create_ext_placements.c
new file mode 100644
index 000000000000..e2d14484d50a
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_create_ext_placements.c
@@ -0,0 +1,19 @@
+#define I915_OBJECT_PARAM  (1ull<<32)
+
+/*
+ * I915_OBJECT_PARAM_MEMORY_REGIONS
+ *
+ * Set the data pointer with the desired set of placements in priority
+ * order(each entry must be unique and supported by the device), as an array of
+ * drm_i915_gem_memory_class_instance, or an equivalent layout of class:instance
+ * pair encodings. See DRM_I915_QUERY_MEMORY_REGIONS for how to query the
+ * supported regions.
+ *
+ * In this case the data pointer size should be the number of
+ * drm_i915_gem_memory_class_instance elements in the placements array.
+ *
+ */
+#define I915_PARAM_MEMORY_REGIONS 0
+#define I915_OBJECT_PARAM_MEMORY_REGIONS (I915_OBJECT_PARAM | \
+					  I915_PARAM_MEMORY_REGIONS)
+	__u64 param;
diff --git a/Documentation/gpu/rfc/i915_region_query.c b/Documentation/gpu/rfc/i915_region_query.c
new file mode 100644
index 000000000000..45e688726375
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_region_query.c
@@ -0,0 +1,54 @@
+enum drm_i915_gem_memory_class {
+	I915_MEMORY_CLASS_SYSTEM = 0,
+	I915_MEMORY_CLASS_DEVICE,
+};
+
+struct drm_i915_gem_memory_class_instance {
+	__u16 memory_class; /* see enum drm_i915_gem_memory_class */
+	__u16 memory_instance;
+};
+
+/**
+ * struct drm_i915_memory_region_info
+ *
+ * Describes one region as known to the driver.
+ */
+struct drm_i915_memory_region_info {
+	/** class:instance pair encoding */
+	struct drm_i915_gem_memory_class_instance region;
+
+	/** MBZ */
+	__u32 rsvd0;
+
+	/** MBZ */
+	__u64 caps;
+
+	/** MBZ */
+	__u64 flags;
+
+	/** Memory probed by the driver (-1 = unknown) */
+	__u64 probed_size;
+
+	/** Estimate of memory remaining (-1 = unknown) */
+	__u64 unallocated_size;
+
+	/** MBZ */
+	__u64 rsvd1[8];
+};
+
+/**
+ * struct drm_i915_query_memory_regions
+ *
+ * Region info query enumerates all regions known to the driver by filling in
+ * an array of struct drm_i915_memory_region_info structures.
+ */
+struct drm_i915_query_memory_regions {
+	/** Number of supported regions */
+	__u32 num_regions;
+
+	/** MBZ */
+	__u32 rsvd[3];
+
+	/* Info about each supported region */
+	struct drm_i915_memory_region_info regions[];
+};
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index a8621f7dab8b..40572f514371 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -15,3 +15,94 @@ host such documentation:
 
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
+
+I915 DG1/LMEM RFC Section
+=========================
+
+Object placement and region query
+=================================
+Starting from DG1 we need to give userspace the ability to allocate buffers from
+device local-memory. Currently the driver supports gem_create, which can place
+buffers in system memory via shmem, and the usual assortment of other
+interfaces, like dumb buffers and userptr.
+
+To support this new capability, while also providing a uAPI which will work
+beyond just DG1, we propose to offer three new bits of uAPI:
+
+DRM_I915_QUERY_MEMORY_REGIONS
+-----------------------------
+Query mechanism which allows userspace to discover the list of supported memory
+regions(like system-memory and local-memory) for a given device. We identify
+each region with a class and instance pair, which should be unique. The class
+here would be DEVICE or SYSTEM, and the instance would be zero, on platforms
+like DG1.
+
+Side note: The class/instance design is borrowed from our existing engine uAPI,
+where we describe every physical engine in terms of its class, and the
+particular instance, since we can have more than one per class.
+
+In the future we also want to expose more information which can further
+describe the capabilities of a region.
+
+.. literalinclude:: i915_region_query.c
+
+GEM_CREATE_EXT
+--------------
+New ioctl which is basically just gem_create but now allows userspace to
+provide a chain of possible extensions. Note that if we don't provide any
+extensions then we get the exact same behaviour as gem_create.
+
+.. literalinclude:: i915_create_ext.c
+
+Side note: We also need to support PXP[1] in the near future, which is also
+applicable to integrated platforms, and adds its own gem_create_ext extension,
+which basically lets userspace mark a buffer as "protected".
+
+I915_OBJECT_PARAM_MEMORY_REGIONS
+--------------------------------
+Implemented as an extension for gem_create_ext, we would now allow userspace to
+optionally provide an immutable list of preferred placements at creation time,
+in priority order, for a given buffer object.  For the placements we expect
+them each to use the class/instance encoding, as per the output of the regions
+query. Having the list in priority order will be useful in the future when
+placing an object, say during eviction.
+
+.. literalinclude:: i915_create_ext_placements.c
+
+As an example, on DG1 if we wish to set the placement as local-memory we can do
+something like:
+
+.. code-block::
+
+        struct drm_i915_gem_memory_class_instance region_param = {
+                .memory_class = I915_MEMORY_CLASS_DEVICE,
+                .memory_instance = 0,
+        };
+        struct drm_i915_gem_create_ext_setparam setparam_region = {
+                .base = { .name = I915_GEM_CREATE_EXT_SETPARAM },
+                .param = {
+                        .param = I915_OBJECT_PARAM_MEMORY_REGIONS,
+                        .data = (uintptr_t)&region_param,
+                        .size = 1,
+                },
+        };
+
+        struct drm_i915_gem_create_ext create_ext = {
+                .size = 16 * PAGE_SIZE,
+                .extensions = (uintptr_t)&setparam_region,
+        };
+        int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+        if (err) ...
+
+One fair criticism here is that this seems a little over-engineered[2]. If we
+just consider DG1 then yes, a simple gem_create.flags or something is totally
+all that's needed to tell the kernel to allocate the buffer in local-memory or
+whatever. However looking to the future we need uAPI which can also support
+upcoming Xe HP multi-tile architecture in a sane way, where there can be
+multiple local-memory instances for a given device, and so using both class and
+instance in our uAPI to describe regions is desirable, although specifically
+for DG1 it's uninteresting, since we only have a single local-memory instance.
+
+[1] https://patchwork.freedesktop.org/series/86798/
+
+[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
