Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4A46EF64
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297B10EB65;
	Thu,  9 Dec 2021 16:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF8F891D4;
 Thu,  9 Dec 2021 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064809; x=1670600809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86iS98JXZ4kPTyKVOxO/shhOj8RyLDAPgBVvLWijt8c=;
 b=Hyo3zvS60Zx03EfeozCKmOoEE8PHkAMh/HMGXgRgRNT5N2IFPWgQ5M0S
 LWHctqnngSQWiYieb5KDlGtkTYuEM0CNI+CYgAOaWb5QL5E5WfNpMfcfH
 mNfbIiyZ/D8XgcQ5Ho2gfR90v3QEsAnyvCNNHuk3q57rspC77l2NNDRva
 Vae4mblZcqp1ZLD91VWM3ByKTZfJnSxLkrWZ+RoTG/3faElg+gFTS0ztM
 +wdKSbUusFDUrbMVJ7gxc5fpc2IyeqjucyIrADkgnm/pXht0maXrO68uG
 IErjHEY5vr2vA5JyLRg1J/ob5nKQcBQm3TzSeF2s1mTHjEDJlSQttMtIo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917161"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917161"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535247"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:27 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 14/16] drm/i915/uapi: document behaviour for DG2 64K support
Date: Thu,  9 Dec 2021 21:15:31 +0530
Message-Id: <20211209154533.4084-15-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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
Cc: Tony Ye <tony.ye@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

On discrete platforms like DG2, we need to support a minimum page size
of 64K when dealing with device local-memory. This is quite tricky for
various reasons, so try to document the new implicit uapi for this.

v2: Fixed suggestions on formatting [Daniel]

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Simon Ser <contact@emersion.fr>
cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: mesa-dev@lists.freedesktop.org
Cc: Tony Ye <tony.ye@intel.com>
Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
---
 include/uapi/drm/i915_drm.h | 67 ++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 5e678917da70..b7441593434c 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
 	/**
 	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
 	 * the user with the GTT offset at which this object will be pinned.
+	 *
 	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
 	 * presumed_offset of the object.
+	 *
 	 * During execbuffer2 the kernel populates it with the value of the
 	 * current GTT offset of the object, for future presumed_offset writes.
+	 *
+	 * See struct drm_i915_gem_create_ext for the rules when dealing with
+	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
+	 * minimum page sizes, like DG2.
 	 */
 	__u64 offset;
 
@@ -3145,11 +3151,62 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * The (page-aligned) allocated size for the object will be returned.
 	 *
-	 * Note that for some devices we have might have further minimum
-	 * page-size restrictions(larger than 4K), like for device local-memory.
-	 * However in general the final size here should always reflect any
-	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
-	 * extension to place the object in device local-memory.
+	 *
+	 * **DG2 64K min page size implications:**
+	 *
+	 * On discrete platforms, starting from DG2, we have to contend with GTT
+	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
+	 * objects.  Specifically the hardware only supports 64K or larger GTT
+	 * page sizes for such memory. The kernel will already ensure that all
+	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
+	 * sizes underneath.
+	 *
+	 * Note that the returned size here will always reflect any required
+	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
+	 * such as DG2.
+	 *
+	 * **Special DG2 GTT address alignment requirement:**
+	 *
+	 * The GTT alignment will also need be at least 64K for  such objects.
+	 *
+	 * Note that due to how the hardware implements 64K GTT page support, we
+	 * have some further complications:
+	 *
+	 *   1) The entire PDE(which covers a 2M virtual address range), must
+	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
+	 *   PDE is forbidden by the hardware.
+	 *
+	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
+	 *   objects.
+	 *
+	 * To handle the above the kernel implements a memory coloring scheme to
+	 * prevent userspace from mixing I915_MEMORY_CLASS_DEVICE and
+	 * I915_MEMORY_CLASS_SYSTEM objects in the same PDE. If the kernel is
+	 * ever unable to evict the required pages for the given PDE(different
+	 * color) when inserting the object into the GTT then it will simply
+	 * fail the request.
+	 *
+	 * Since userspace needs to manage the GTT address space themselves,
+	 * special care is needed to ensure this doesn't happen. The simplest
+	 * scheme is to simply align and round up all I915_MEMORY_CLASS_DEVICE
+	 * objects to 2M, which avoids any issues here. At the very least this
+	 * is likely needed for objects that can be placed in both
+	 * I915_MEMORY_CLASS_DEVICE and I915_MEMORY_CLASS_SYSTEM, to avoid
+	 * potential issues when the kernel needs to migrate the object behind
+	 * the scenes, since that might also involve evicting other objects.
+	 *
+	 * **To summarise the GTT rules, on platforms like DG2:**
+	 *
+	 *   1) All objects that can be placed in I915_MEMORY_CLASS_DEVICE must
+	 *   have 64K alignment. The kernel will reject this otherwise.
+	 *
+	 *   2) All I915_MEMORY_CLASS_DEVICE objects must never be placed in
+	 *   the same PDE with other I915_MEMORY_CLASS_SYSTEM objects. The
+	 *   kernel will reject this otherwise.
+	 *
+	 *   3) Objects that can be placed in both I915_MEMORY_CLASS_DEVICE and
+	 *   I915_MEMORY_CLASS_SYSTEM should probably be aligned and padded out
+	 *   to 2M.
 	 */
 	__u64 size;
 	/**
-- 
2.20.1

