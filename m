Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF59D1BEF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544D810E590;
	Mon, 18 Nov 2024 23:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAfTxZfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EFC10E584;
 Mon, 18 Nov 2024 23:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973050; x=1763509050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CB/UAMQz/584WOERxoPhXPZsBITEWPivbuUiVFlOkiU=;
 b=OAfTxZfw18Ur2cMNSW4GhLcgIy5RG8qJCits1dVVfzEVa4bDjkywSsra
 4lkqqPDKqQRpOIc0/A/YPvWzjb+VqevZys5Y5S1nJVSBCWWNhVbB2+s2h
 ylV/xv5A6Lh0nRJywl0IMMoaRIaq/TYZYoaa68uhrEm7H3vMJGMKh1tCe
 eq4+r9si6DL8OYEzRcYbOynPUfHl69WKNGc2eaO6QQWnCBwhj6SJWl9qi
 YZZP5YmlMO7dSU9VoFqFhKFPXL29Q5pyemGetnP+IZHaO3hkU+EBQwr5W
 ywuS1Ltd5z1TDyS1gpdXBvUpZkohCi6Ml9fEJmXhYf03UmXX1o88AdYKL A==;
X-CSE-ConnectionGUID: eSNS9VhWQWa41KooKh2bgw==
X-CSE-MsgGUID: FZh0D1W4QQ6hdgItCPzBkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878991"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
X-CSE-ConnectionGUID: cMFx8zK2RLiqrX+ZzLwxnA==
X-CSE-MsgGUID: 7FQIaW/JQbuZ2vyyvfKt3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521754"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 22/29] drm/xe/uapi: Add uAPI to convert user semaphore to
 / from drm syncobj
Date: Mon, 18 Nov 2024 15:37:50 -0800
Message-Id: <20241118233757.2374041-23-matthew.brost@intel.com>
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

Simple interface to allow user space to share user syncs with kernel
syncs (dma-fences). The idea also is when user syncs are converted to
kernel syncs, preemption is guarded against until the kernel sync
signals. This is required to adhere to dma-fencing rules (no memory
allocates done in path of dma-fence, resume after preemption requires
memory allocations).

FIXME: uAPI likely to change, perhaps in drm generic way. Currently
enough for a PoC and enable initial Mesa development.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9356a714a2e0..0cd473d2d91b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -102,6 +102,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_CONVERT_FENCE		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +118,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_CONVERT_FENCE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_CONVERT_FENCE, struct drm_xe_vm_convert_fence)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1796,6 +1798,66 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_semaphore - Semaphore
+ */
+struct drm_xe_semaphore {
+	/**
+	 * @handle: Handle for the semaphore. Must be bound to the VM when
+	 * passed into drm_xe_vm_convert_fence.
+	 */
+	__u32 handle;
+
+	/** @offset: Offset in BO for semaphore, must QW aligned */
+	__u32 offset;
+
+	/** @seqno: Sequence number of semaphore */
+	__u64 seqno;
+
+	/** @token: Semaphore token - MBZ as not supported yet */
+	__u64 token;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_convert_fence - Convert semaphore to / from syncobj
+ *
+ * DRM_XE_SYNC_FLAG_SIGNAL set indicates semaphore -> syncobj
+ * DRM_XE_SYNC_FLAG_SIGNAL clear indicates syncobj -> semaphore
+ */
+struct drm_xe_vm_convert_fence {
+	/**
+	 * @extensions: Pointer to the first extension struct, if any
+	 */
+	__u64 extensions;
+
+	/** @vm_id: VM ID */
+	__u32 vm_id;
+
+	/** @flags: Flags - MBZ */
+	__u32 flags;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/**
+	 * @num_syncs: Number of struct drm_xe_sync and struct drm_xe_semaphore
+	 * in arrays.
+	 */
+	__u32 num_syncs;
+
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/** @semaphores: Pointer to struct drm_xe_semaphore array. */
+	__u64 semaphores;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

