Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5B36E8E2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 12:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48B76EDF6;
	Thu, 29 Apr 2021 10:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8976EDFF;
 Thu, 29 Apr 2021 10:35:08 +0000 (UTC)
IronPort-SDR: wXTlNB0aW7sHw4olqYoYkPJ1jOqfHXgoGG0U7MypzupSb0en3msI/TMzEOGYXFXil2JWE0dEa2
 llbizlkcYbGg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="184449701"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="184449701"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 03:35:08 -0700
IronPort-SDR: DaCELTartwWv2+TsdEqrHf7eemYypLNvdBSKlmya4XgJLlzhKrfnVgh7jBqxz8PAYCxay354I4
 dRLjA2ZaSVaA==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="458694197"
Received: from sbfennel-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.78])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 03:35:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/i915/uapi: introduce drm_i915_gem_create_ext
Date: Thu, 29 Apr 2021 11:30:52 +0100
Message-Id: <20210429103056.407067-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210429103056.407067-1-matthew.auld@intel.com>
References: <20210429103056.407067-1-matthew.auld@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Same old gem_create but with now with extensions support. This is needed
to support various upcoming usecases.

v2:(Chris)
    - Use separate ioctl number for gem_create_ext, instead of hijacking
      the existing gem_create ioctl, otherwise we run into the issue
      with being unable to detect if the kernel supports the new extension
      behaviour.
    - We now have gem_create_ext.flags, which should be zeroed.
    - I915_GEM_CREATE_EXT_SETPARAM value is now zero, since this is the
      index into our array of extensions.
    - Setup a "vanilla" object which we can directly apply our extensions
      to.
v3:(Daniel & Jason)
    - drop I915_GEM_CREATE_EXT_SETPARAM. Instead just have each extension
      do one thing only, instead of generic setparam which can cover
      various use cases.
    - add some kernel-doc.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 56 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h |  2 +
 drivers/gpu/drm/i915/i915_drv.c            |  1 +
 include/uapi/drm/i915_drm.h                | 42 ++++++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 409226df0dd2..1e82633a3898 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -8,6 +8,7 @@
 
 #include "i915_drv.h"
 #include "i915_trace.h"
+#include "i915_user_extensions.h"
 
 static int i915_gem_publish(struct drm_i915_gem_object *obj,
 			    struct drm_file *file,
@@ -149,3 +150,58 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
 	i915_gem_object_free(obj);
 	return ret;
 }
+
+struct create_ext {
+	struct drm_i915_private *i915;
+	struct drm_i915_gem_object *vanilla_object;
+};
+
+static const i915_user_extension_fn create_extensions[] = {
+};
+
+/**
+ * Creates a new mm object and returns a handle to it.
+ * @dev: drm device pointer
+ * @data: ioctl data blob
+ * @file: drm file pointer
+ */
+int
+i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file)
+{
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct drm_i915_gem_create_ext *args = data;
+	struct create_ext ext_data = { .i915 = i915 };
+	struct drm_i915_gem_object *obj;
+	int ret;
+
+	if (args->flags)
+		return -EINVAL;
+
+	i915_gem_flush_free_objects(i915);
+
+	obj = i915_gem_object_alloc();
+	if (!obj)
+		return -ENOMEM;
+
+	ext_data.vanilla_object = obj;
+	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
+				   create_extensions,
+				   ARRAY_SIZE(create_extensions),
+				   &ext_data);
+	if (ret)
+		goto object_free;
+
+	ret = i915_gem_setup(obj,
+			     intel_memory_region_by_type(i915,
+							 INTEL_MEMORY_SYSTEM),
+			     args->size);
+	if (ret)
+		goto object_free;
+
+	return i915_gem_publish(obj, file, &args->size, &args->handle);
+
+object_free:
+	i915_gem_object_free(obj);
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
index 7fd22f3efbef..28d6526e32ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
@@ -14,6 +14,8 @@ int i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int i915_gem_create_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file);
+int i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file);
 int i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
 int i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 785dcf20c77b..b5878c089830 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1728,6 +1728,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_ENTERVT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_LEAVEVT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_CREATE, i915_gem_create_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_CREATE_EXT, i915_gem_create_ext_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_PREAD, i915_gem_pread_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_PWRITE, i915_gem_pwrite_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_MMAP, i915_gem_mmap_ioctl, DRM_RENDER_ALLOW),
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 57c376680a60..1a654a144889 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -406,6 +406,7 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_QUERY			0x39
 #define DRM_I915_GEM_VM_CREATE		0x3a
 #define DRM_I915_GEM_VM_DESTROY		0x3b
+#define DRM_I915_GEM_CREATE_EXT		0x3c
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
@@ -438,6 +439,7 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_GEM_ENTERVT	DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_ENTERVT)
 #define DRM_IOCTL_I915_GEM_LEAVEVT	DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_LEAVEVT)
 #define DRM_IOCTL_I915_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create)
+#define DRM_IOCTL_I915_GEM_CREATE_EXT	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE_EXT, struct drm_i915_gem_create_ext)
 #define DRM_IOCTL_I915_GEM_PREAD	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PREAD, struct drm_i915_gem_pread)
 #define DRM_IOCTL_I915_GEM_PWRITE	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PWRITE, struct drm_i915_gem_pwrite)
 #define DRM_IOCTL_I915_GEM_MMAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct drm_i915_gem_mmap)
@@ -2598,6 +2600,46 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+ * struct drm_i915_gem_create_ext - Existing gem_create behaviour, with added
+ * extension support using struct i915_user_extension.
+ *
+ * Note that in the future we want to have our buffer flags here, at least for
+ * the stuff that is immutable. Previously we would have two ioctls, one to
+ * create the object with gem_create, and another to apply various parameters,
+ * however this creates some ambiguity for the params which are considered
+ * immutable. Also in general we're phasing out the various SET/GET ioctls.
+ */
+struct drm_i915_gem_create_ext {
+	/**
+	 * @size: Requested size for the object.
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 *
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
+	 * @extensions: The chain of extensions to apply to this object.
+	 *
+	 * This will be useful in the future when we need to support several
+	 * different extensions, and we need to apply more than one when
+	 * creating the object. See struct i915_user_extension.
+	 *
+	 * If we don't supply any extensions then we get the same old gem_create
+	 * behaviour.
+	 *
+	 */
+	__u64 extensions;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
