Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AAEB2B375
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0AD10E4FE;
	Mon, 18 Aug 2025 21:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bl5tyxRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4E310E4FA;
 Mon, 18 Aug 2025 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552685; x=1787088685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=56Lsg2pKN03663XES83IGedyCaAOWY/Us3gj8d7P5jU=;
 b=bl5tyxRkl6pDLGMRzeV6m0Ag0etTbA/55/xqEPEV9CGdzi4AN2KUKgG3
 Oe4rNAerldKPOrCCiWe7Fx/wDobCXKXX+sSGvWcNQX7/8JhEqSxiQgcEO
 K6yWYIHxMWaFgGoMrySnV8WXhtv962XfGTy3aLaECOuZaEP54JywDXUxS
 4ZBkSZwJwDXrvP25kOi+XMtZMJYLCnGsOvFMNsyXg2k+zleBu8h42u69I
 Z7DgvvI/KWyhd3DtPLsy9nYhe6z430kuu4hBeAVL2OEl2HIeR35x30qU/
 Q6akzAJayAUiyre1WrrPNLXFAKUUdrXf1x5u4ZLtxg71s/oBhNcwiR8m/ g==;
X-CSE-ConnectionGUID: j4SRfnc/SfeDHAOWf1PLow==
X-CSE-MsgGUID: z83hxjn+Rwi49310xLmQBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815305"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815305"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:25 -0700
X-CSE-ConnectionGUID: 5vxASDVgQmGq+gAb72Aq0g==
X-CSE-MsgGUID: SCo48DkfR0uMmYpt6TC0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186445"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v8 24/24] drm/xe/uapi: Add UAPI for querying VMA count and
 memory attributes
Date: Tue, 19 Aug 2025 03:27:53 +0530
Message-Id: <20250818215753.2762426-25-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

Introduce the DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS ioctl to allow
userspace to query memory attributes of VMAs within a user specified
virtual address range.

Userspace first calls the ioctl with num_mem_ranges = 0,
sizeof_mem_ranges_attr = 0 and vector_of_vma_mem_attr = NULL to retrieve
the number of memory ranges (vmas) and size of each memory range attribute.
Then, it allocates a buffer of that size and calls the ioctl again to fill
the buffer with memory range attributes.

This two-step interface allows userspace to first query the required
buffer size, then retrieve detailed attributes efficiently.

v2 (Matthew Brost)
- Use same ioctl to overload functionality

v3
- Add kernel-doc

v4
- Make uapi future proof by passing struct size (Matthew Brost)
- make lock interruptible (Matthew Brost)
- set reserved bits to zero (Matthew Brost)
- s/__copy_to_user/copy_to_user (Matthew Brost)
- Avod using VMA term in uapi (Thomas)
- xe_vm_put(vm) is missing (Shuicheng)

v5
- Nits
- Fix kernel-doc

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   2 +
 drivers/gpu/drm/xe/xe_vm.c     | 102 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   2 +-
 include/uapi/drm/xe_drm.h      | 139 +++++++++++++++++++++++++++++++++
 4 files changed, 244 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 98a368a979eb..a9455c05f706 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -203,6 +203,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f2cf8e046eef..39cfb3789bd9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2192,6 +2192,108 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static int xe_vm_query_vmas(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpuva *gpuva;
+	u32 num_vmas = 0;
+
+	lockdep_assert_held(&vm->lock);
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
+		num_vmas++;
+
+	return num_vmas;
+}
+
+static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
+			 u64 end, struct drm_xe_mem_range_attr *attrs)
+{
+	struct drm_gpuva *gpuva;
+	int i = 0;
+
+	lockdep_assert_held(&vm->lock);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (i == *num_vmas)
+			return -ENOSPC;
+
+		attrs[i].start = xe_vma_start(vma);
+		attrs[i].end = xe_vma_end(vma);
+		attrs[i].atomic.val = vma->attr.atomic_access;
+		attrs[i].pat_index.val = vma->attr.pat_index;
+		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
+		attrs[i].preferred_mem_loc.migration_policy =
+		vma->attr.preferred_loc.migration_policy;
+
+		i++;
+	}
+
+	*num_vmas = i;
+	return 0;
+}
+
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_mem_range_attr *mem_attrs;
+	struct drm_xe_vm_query_mem_range_attr *args = data;
+	u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
+	struct xe_vm *vm;
+	int err = 0;
+
+	if (XE_IOCTL_DBG(xe,
+			 ((args->num_mem_ranges == 0 &&
+			  (attrs_user || args->sizeof_mem_range_attr != 0)) ||
+			 (args->num_mem_ranges > 0 &&
+			  (!attrs_user ||
+			   args->sizeof_mem_range_attr !=
+			   sizeof(struct drm_xe_mem_range_attr))))))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	err = down_read_interruptible(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
+
+	if (args->num_mem_ranges == 0 && !attrs_user) {
+		args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
+		args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
+		goto unlock_vm;
+	}
+
+	mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
+				   GFP_KERNEL | __GFP_ACCOUNT |
+				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!mem_attrs) {
+		err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
+		goto unlock_vm;
+	}
+
+	memset(mem_attrs, 0, args->num_mem_ranges * args->sizeof_mem_range_attr);
+	err = get_mem_attrs(vm, &args->num_mem_ranges, args->start,
+			    args->start + args->range, mem_attrs);
+	if (err)
+		goto free_mem_attrs;
+
+	err = copy_to_user(attrs_user, mem_attrs,
+			   args->sizeof_mem_range_attr * args->num_mem_ranges);
+
+free_mem_attrs:
+	kvfree(mem_attrs);
+unlock_vm:
+	up_read(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+	return err;
+}
+
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
 	if (page_addr > xe_vma_end(vma) - 1 ||
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c8b8318fe61a..57f77c8430d6 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -199,7 +199,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
-
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 115b9bca2a25..eaf713706387 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -82,6 +82,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
  */
 
 /*
@@ -104,6 +105,7 @@ extern "C" {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 
 /* Must be kept compact -- no holes */
 
@@ -120,6 +122,7 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2113,6 +2116,142 @@ struct drm_xe_madvise {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
+ *
+ * This structure is provided by userspace and filled by KMD in response to the
+ * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
+ * a memory ranges within a user specified address range in a VM.
+ *
+ * The structure includes information such as atomic access policy,
+ * page attribute table (PAT) index, and preferred memory location.
+ * Userspace allocates an array of these structures and passes a pointer to the
+ * ioctl to retrieve attributes for each memory ranges
+ *
+ * @extensions: Pointer to the first extension struct, if any
+ * @start: Start address of the memory range
+ * @end: End address of the virtual memory range
+ *
+ */
+struct drm_xe_mem_range_attr {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the memory range */
+	__u64 start;
+
+	/** @end: end of the memory range */
+	__u64 end;
+
+	/** @preferred_mem_loc: preferred memory location */
+	struct {
+		/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+		__u32 devmem_fd;
+
+		/** @preferred_mem_loc.migration_policy: Page migration policy */
+		__u32 migration_policy;
+	} preferred_mem_loc;
+
+	/** @atomic: Atomic access policy */
+	struct {
+		/** @atomic.val: atomic attribute */
+		__u32 val;
+
+		/** @atomic.reserved: Reserved */
+		__u32 reserved;
+	} atomic;
+
+	 /** @pat_index: Page attribute table index */
+	struct {
+		/** @pat_index.val: PAT index */
+		__u32 val;
+
+		/** @pat_index.reserved: Reserved */
+		__u32 reserved;
+	} pat_index;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
+ *
+ * This structure is used to query memory attributes of memory regions
+ * within a user specified address range in a VM. It provides detailed
+ * information about each memory range, including atomic access policy,
+ * page attribute table (PAT) index, and preferred memory location.
+ *
+ * Userspace first calls the ioctl with @num_mem_ranges = 0,
+ * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
+ * the number of memory regions and size of each memory range attribute.
+ * Then, it allocates a buffer of that size and calls the ioctl again to fill
+ * the buffer with memory range attributes.
+ *
+ * If second call fails with -ENOSPC, it means memory ranges changed between
+ * first call and now, retry IOCTL again with @num_mem_ranges = 0,
+ * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
+ * Second ioctl call.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *    struct drm_xe_vm_query_mem_range_attr query = {
+ *         .vm_id = vm_id,
+ *         .start = 0x100000,
+ *         .range = 0x2000,
+ *     };
+ *
+ *    // First ioctl call to get num of mem regions and sizeof each attribute
+ *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
+ *
+ *    // Allocate buffer for the memory region attributes
+ *    void *ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
+ *
+ *    query.vector_of_mem_attr = (uintptr_t)ptr;
+ *
+ *    // Second ioctl call to actually fill the memory attributes
+ *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
+ *
+ *    // Iterate over the returned memory region attributes
+ *    for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
+ *       struct drm_xe_mem_range_attr *attr = (struct drm_xe_mem_range_attr *)ptr;
+ *
+ *       // Do something with attr
+ *
+ *       // Move pointer by one entry
+ *       ptr += query.sizeof_mem_range_attr;
+ *     }
+ *
+ *    free(ptr);
+ */
+struct drm_xe_vm_query_mem_range_attr {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_mem_ranges: number of mem_ranges in range */
+	__u32 num_mem_ranges;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @range: size of the virtual address range */
+	__u64 range;
+
+	/** @sizeof_mem_range_attr: size of struct drm_xe_mem_range_attr */
+	__u64 sizeof_mem_range_attr;
+
+	/** @vector_of_mem_attr: userptr to array of struct drm_xe_mem_range_attr */
+	__u64 vector_of_mem_attr;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

