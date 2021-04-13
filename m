Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62735DE04
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 13:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4F589D57;
	Tue, 13 Apr 2021 11:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096A89D57;
 Tue, 13 Apr 2021 11:47:24 +0000 (UTC)
IronPort-SDR: LAIO4lURCTHy39Z4NWg+Jd/i7ni3mOIsbhGAXpYB2AezS+haTHhPyQfufuz17MN3qf1cSfbhMU
 g8KvcPCoB9Fw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="192266629"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="192266629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 04:47:20 -0700
IronPort-SDR: vUUNYcr4CjDCRJdtMvG/qXuKAvNBe68TGRsBUAtzCUOi/JjHqr/kKSMKlltaXBz5aCJtXZCFg6
 KZ+lUCJ1wa7g==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="460553290"
Received: from vggreene-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.28.193])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 04:47:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH v2] drm/doc/rfc: i915 DG1 uAPI
Date: Tue, 13 Apr 2021 12:47:06 +0100
Message-Id: <20210413114706.163279-1-matthew.auld@intel.com>
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

v2(Daniel):
  - include the overall upstreaming plan
  - add a note for mmap, there are differences here for TTM vs i915
  - bunch of other suggestions from Daniel

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
---
 Documentation/gpu/rfc/i915_gem_lmem.h   | 151 ++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_gem_lmem.rst | 119 +++++++++++++++++++
 Documentation/gpu/rfc/index.rst         |   4 +
 3 files changed, 274 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.h
 create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst

diff --git a/Documentation/gpu/rfc/i915_gem_lmem.h b/Documentation/gpu/rfc/i915_gem_lmem.h
new file mode 100644
index 000000000000..6ae13209d7ef
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_gem_lmem.h
@@ -0,0 +1,151 @@
+/* The new query_id for struct drm_i915_query_item */
+#define DRM_I915_QUERY_MEMORY_REGIONS   0xdeadbeaf
+
+/**
+ * enum drm_i915_gem_memory_class
+ */
+enum drm_i915_gem_memory_class {
+	/** @I915_MEMORY_CLASS_SYSTEM: system memory */
+	I915_MEMORY_CLASS_SYSTEM = 0,
+	/** @I915_MEMORY_CLASS_DEVICE: device local-memory */
+	I915_MEMORY_CLASS_DEVICE,
+};
+
+/**
+ * struct drm_i915_gem_memory_class_instance
+ */
+struct drm_i915_gem_memory_class_instance {
+	/** @memory_class: see enum drm_i915_gem_memory_class */
+	__u16 memory_class;
+
+	/** @memory_instance: which instance */
+	__u16 memory_instance;
+};
+
+/**
+ * struct drm_i915_memory_region_info
+ *
+ * Describes one region as known to the driver.
+ */
+struct drm_i915_memory_region_info {
+	/** @region: class:instance pair encoding */
+	struct drm_i915_gem_memory_class_instance region;
+
+	/** @rsvd0: MBZ */
+	__u32 rsvd0;
+
+	/** @caps: MBZ */
+	__u64 caps;
+
+	/** @flags: MBZ */
+	__u64 flags;
+
+	/** @probed_size: Memory probed by the driver (-1 = unknown) */
+	__u64 probed_size;
+
+	/** @unallocated_size: Estimate of memory remaining (-1 = unknown) */
+	__u64 unallocated_size;
+
+	/** @rsvd1: MBZ */
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
+	/** @num_regions: Number of supported regions */
+	__u32 num_regions;
+
+	/** @rsvd: MBZ */
+	__u32 rsvd[3];
+
+	/** @regions: Info about each supported region */
+	struct drm_i915_memory_region_info regions[];
+};
+
+#define DRM_I915_GEM_CREATE_EXT		0xdeadbeaf
+#define DRM_IOCTL_I915_GEM_CREATE_EXT	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE_EXT, struct drm_i915_gem_create_ext)
+
+/**
+ * struct drm_i915_gem_create_ext
+ */
+struct drm_i915_gem_create_ext {
+	/**
+	 * @size: Requested size for the object.
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 */
+	__u64 size;
+	/**
+	 * @handle: Returned handle for the object.
+	 *
+	 * Object handles are nonzero.
+	 */
+	__u32 handle;
+	/** @flags: MBZ */
+	__u32 flags;
+	/**
+	 * @extensions:
+	 * For I915_GEM_CREATE_EXT_SETPARAM extension usage see both:
+	 *	struct drm_i915_gem_create_ext_setparam.
+	 *	struct drm_i915_gem_object_param for the possible parameters.
+	 */
+#define I915_GEM_CREATE_EXT_SETPARAM 0
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_object_param
+ */
+struct drm_i915_gem_object_param {
+	/** @handle: Object handle (0 for I915_GEM_CREATE_EXT_SETPARAM) */
+	__u32 handle;
+
+	/** @size: Data pointer size */
+	__u32 size;
+
+/*
+ * I915_OBJECT_PARAM:
+ *
+ * Select object namespace for the param.
+ */
+#define I915_OBJECT_PARAM  (1ull<<32)
+
+/**
+ * @param: select the desired param.
+ *
+ * I915_OBJECT_PARAM_MEMORY_REGIONS:
+ *
+ * Set the data pointer with the desired set of placements in priority
+ * order(each entry must be unique and supported by the device), as an array of
+ * drm_i915_gem_memory_class_instance, or an equivalent layout of class:instance
+ * pair encodings. See DRM_I915_QUERY_MEMORY_REGIONS for how to query the
+ * supported regions.
+ *
+ * In this case the data pointer size should be the number of
+ * drm_i915_gem_memory_class_instance elements in the placements array.
+ */
+#define I915_PARAM_MEMORY_REGIONS 0
+#define I915_OBJECT_PARAM_MEMORY_REGIONS (I915_OBJECT_PARAM | \
+					  I915_PARAM_MEMORY_REGIONS)
+	__u64 param;
+
+	/** @data: Data value or pointer */
+	__u64 data;
+};
+
+/**
+ * struct drm_i915_gem_create_ext_setparam
+ */
+struct drm_i915_gem_create_ext_setparam {
+	/** @base: extension link */
+	struct i915_user_extension base;
+	/** @param: param to apply for this extension */
+	struct drm_i915_gem_object_param param;
+};
+
+
diff --git a/Documentation/gpu/rfc/i915_gem_lmem.rst b/Documentation/gpu/rfc/i915_gem_lmem.rst
new file mode 100644
index 000000000000..41bc06240ccc
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_gem_lmem.rst
@@ -0,0 +1,119 @@
+=========================
+I915 DG1/LMEM RFC Section
+=========================
+
+Upstream plan
+=============
+For upstream the overall plan for landing all the DG1 stuff and turning it for
+real, with all the uAPI bits is:
+
+* Merge basic HW enabling of DG1(still without pciid)
+* Merge the uAPI bits behind special CONFIG_BROKEN(or so) flag
+        * At this point we can still make changes, but importantly this lets us
+          start running IGTs which can utilize local-memory in CI
+* Convert over to TTM, make sure it all keeps working
+* Add pciid for DG1
+* Turn on uAPI for real
+
+New object placement and region query uAPI
+==========================================
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
+.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
+        :functions: drm_i915_gem_memory_class drm_i915_gem_memory_class_instance drm_i915_memory_region_info drm_i915_query_memory_regions
+
+GEM_CREATE_EXT
+--------------
+New ioctl which is basically just gem_create but now allows userspace to
+provide a chain of possible extensions. Note that if we don't provide any
+extensions then we get the exact same behaviour as gem_create.
+
+Side note: We also need to support PXP[1] in the near future, which is also
+applicable to integrated platforms, and adds its own gem_create_ext extension,
+which basically lets userspace mark a buffer as "protected".
+
+.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
+        :functions: drm_i915_gem_create_ext
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
+.. kernel-doc:: Documentation/gpu/rfc/i915_gem_lmem.h
+        :functions: drm_i915_gem_object_param drm_i915_gem_create_ext_setparam
+
+Example placement usage
+-----------------------
+As an example, on DG1 if we wish to set the placement as local-memory we can do
+something like:
+
+.. code-block:: C
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
+I915 MMAP
+=========
+In i915 there are multiple ways to MMAP GEM object, including mapping the same
+object using different mapping types(WC vs WB), i.e multiple active mmaps per
+object. TTM expects one MMAP at most for the lifetime of the object. If it
+turns out that we have to backpedal here, there might be some potential
+userspace fallout.
+
+Links
+=====
+[1] https://patchwork.freedesktop.org/series/86798/
+
+[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5599#note_553791
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index a8621f7dab8b..05670442ca1b 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -15,3 +15,7 @@ host such documentation:
 
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
+
+.. toctree::
+
+    i915_gem_lmem.rst
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
