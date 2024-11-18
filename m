Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3D9D1BF4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0015410E5A8;
	Mon, 18 Nov 2024 23:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkza6VuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105C110E579;
 Mon, 18 Nov 2024 23:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973048; x=1763509048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdI4PLJjh43e/IG8RS2pfdO39jrbnYw1BScUbD5C7zQ=;
 b=dkza6VuPE8i8sVI4ZAu8q5k5NcceIPzOr1nFCpzuqnxUjOBtyFxta4W6
 h8jAalbIJBCc3DiAGAMlUVDdNEGtYcNYYDSsMolS4FVSN3xpQBdXJsfbS
 C1LsUFthWmQAFHrq+fzYbClOMeK4nGDDjQVbDMwGcG8akRiwz6Glzv8xf
 fSNfthdnGOm0xdFzjO6BIDOnUXGpYD2lx0LRMY3bRGJnYHJzTeidYi9G0
 SMWochathY2/dAoSj+49ljsZzs4qzi5KKC7Q4hhpfNbkDA5DdhbgfKXDc
 CU/qkmaosOSyaJcY0M+Szf9bN8cSRXV0vyqNUD4AdIAbQXWdMQaNGoXnZ A==;
X-CSE-ConnectionGUID: dTaREb26Sk+VQlhdJoWE5Q==
X-CSE-MsgGUID: ESOwHV/oSwuhn2lMS9HBLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878949"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878949"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:27 -0800
X-CSE-ConnectionGUID: MsQ484wxTmO0UM5j1lkOOw==
X-CSE-MsgGUID: xzLkV2jxT5yGjYaAeQ6J7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521727"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 16/29] drm/xe/uapi: Define UMD exec queue mapping uAPI
Date: Mon, 18 Nov 2024 15:37:44 -0800
Message-Id: <20241118233757.2374041-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define UMD exec queue mapping uAPI. The submit ring, indirect LRC state
(ring head, tail, etc...), and doorbell are securly mapped to user
space. The ring is a VM PPGTT addres, while indirect LRC state and
doorbell mapping is provided via a fake offset like BOs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6490b16b1217..9356a714a2e0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1111,6 +1111,61 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_ext_usermap
+ */
+struct drm_xe_exec_queue_ext_usermap {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @flags: MBZ */
+	__u32 flags;
+
+	/** @version: Version of usermap */
+#define DRM_XE_EXEC_QUEUE_USERMAP_VERSION_XE2_REV0	0
+	__u32 version;
+
+	/**
+	 * @ring_size: The ring size. 4k-2M valid, must be 4k aligned. User
+	 * space has to pad allocation / mapping to avoid prefetch faults.
+	 * Prefetch size is platform dependent.
+	 */
+	__u32 ring_size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/**
+	 * @ring_addr: Ring address mapped within the VM, should be mapped as
+	 * UC.
+	 */
+	__u64 ring_addr;
+
+	/**
+	 * @indirect_ring_state_offset: The fake indirect ring state offset to
+	 * use for subsequent mmap call. Always 4k in size.
+	 */
+	__u64 indirect_ring_state_offset;
+
+	/**
+	 * @doorbell_offset: The fake doorbell offset to use for subsequent mmap
+	 * call. Always 4k in size.
+	 */
+	__u64 doorbell_offset;
+
+	/** @doorbell_page_offset: The doorbell offset within the mmapped page */
+	__u32 doorbell_page_offset;
+
+	/**
+	  * @indirect_ring_state_handle: Indirect ring state buffer object
+	  * handle. Allocated by KMD and must be closed by user.
+	 */
+	__u32 indirect_ring_state_handle;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
@@ -1138,6 +1193,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 
+#define DRM_XE_EXEC_QUEUE_EXTENSION_USERMAP			1
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

