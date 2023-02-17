Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADED69ACF1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C73210EFF0;
	Fri, 17 Feb 2023 13:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D55110EFED
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eEmQDOQyU6gF5gMBW9RNpV/N/n3J9qaRJsJk6Xv6fHM=;
 b=GUrqjOgfwAgu3k3oX4nMZP/eFV/MK3U3EBvDmHLD2sRDl7hN12kDtQ3Eh+LZymrQRnjQE+
 Bm13oyToTimNx7K5fSPfiAc47x2Tu0GwtLe1uY88GwIHWUZn4B2rxRTgdi/r07FgfcKvfL
 m4jNIDfKhzf3ddBDzf57zBk/G1GZ5i8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-2EY-SR3gNTKZ110S5PIoeA-1; Fri, 17 Feb 2023 08:48:29 -0500
X-MC-Unique: 2EY-SR3gNTKZ110S5PIoeA-1
Received: by mail-ed1-f70.google.com with SMTP id
 cn9-20020a0564020ca900b004a25d8d7593so1228545edb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEmQDOQyU6gF5gMBW9RNpV/N/n3J9qaRJsJk6Xv6fHM=;
 b=63jJQ/bGMEy336Gu/DzzMTBTWF+c3CVWPWIl7mq8JHMvEzRZyXl/Jr2BINHlhz0J/W
 /yj+htRcIqbpsIkXNDw0wMeYJZ5pryNHrbpB3cjy6pVtk//G5gZy0hit2c5vilFMFVaX
 e4qKV89dK3JuLLtbik28aCEghqBtbIKI49kD7EImM6FftCUzqS4Adiol3EmJa/bIoXGG
 fXvbsCI90nVqTmyE7+MXiWbVd5ckjTDjQs55qei/tSISy9ciamcrFyjLRt74kwHefpNm
 ryBo/51CvPT8FPweAZ7dqj7UEN3ce3QQyecAJOUhskyBl5mSIX6yS2SFWiEM3vbcxcx4
 zIqQ==
X-Gm-Message-State: AO0yUKXD/1e47xlHhTVx7NlLXQbYxqzwUrlMpn0ttfVCF3RYAAKjdZw/
 yLWmbb01+dZJ+moCWckqkAUnRDL0IvKo+oRWr90T1VPHy0dkYaFVBD26yY68ElPKfTG0DRDJxcm
 xZOEoOawodNVO3RN4zxfaS3AoRYtY
X-Received: by 2002:a17:906:5e45:b0:861:7a02:1046 with SMTP id
 b5-20020a1709065e4500b008617a021046mr9000407eju.37.1676641708465; 
 Fri, 17 Feb 2023 05:48:28 -0800 (PST)
X-Google-Smtp-Source: AK7set8cnsFQ2/2nbfdSQlY0qUbNsdNsHcvEXcTDgO7kDDv/fQR13lIJp0sfctJpGRYxNRgg25e5MA==
X-Received: by 2002:a17:906:5e45:b0:861:7a02:1046 with SMTP id
 b5-20020a1709065e4500b008617a021046mr9000388eju.37.1676641708174; 
 Fri, 17 Feb 2023 05:48:28 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bt21-20020a170906b15500b008b13259093csm2165027ejb.107.2023.02.17.05.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:27 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 07/16] drm/nouveau: new VM_BIND uapi interfaces
Date: Fri, 17 Feb 2023 14:48:11 +0100
Message-Id: <20230217134820.14672-2-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit provides the interfaces for the new UAPI motivated by the
Vulkan API. It allows user mode drivers (UMDs) to:

1) Initialize a GPU virtual address (VA) space via the new
   DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
   VA area.

2) Bind and unbind GPU VA space mappings via the new
   DRM_IOCTL_NOUVEAU_VM_BIND ioctl.

3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
asynchronous processing with DRM syncobjs as synchronization mechanism.

The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.

Co-authored-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/driver-uapi.rst |   8 ++
 include/uapi/drm/nouveau_drm.h    | 220 ++++++++++++++++++++++++++++++
 2 files changed, 228 insertions(+)

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 4411e6919a3d..9c7ca6e33a68 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -6,3 +6,11 @@ drm/i915 uAPI
 =============
 
 .. kernel-doc:: include/uapi/drm/i915_drm.h
+
+drm/nouveau uAPI
+================
+
+VM_BIND / EXEC uAPI
+-------------------
+
+.. kernel-doc:: include/uapi/drm/nouveau_drm.h
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 853a327433d3..dbe0afbd858a 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -126,6 +126,220 @@ struct drm_nouveau_gem_cpu_fini {
 	__u32 handle;
 };
 
+/**
+ * struct drm_nouveau_sync - sync object
+ *
+ * This structure serves as synchronization mechanism for (potentially)
+ * asynchronous operations such as EXEC or VM_BIND.
+ */
+struct drm_nouveau_sync {
+	/**
+	 * @flags: the flags for a sync object
+	 *
+	 * The first 8 bits are used to determine the type of the sync object.
+	 */
+	__u32 flags;
+#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
+#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
+#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
+	/**
+	 * @handle: the handle of the sync object
+	 */
+	__u32 handle;
+	/**
+	 * @timeline_value:
+	 *
+	 * The timeline point of the sync object in case the syncobj is of
+	 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
+	 */
+	__u64 timeline_value;
+};
+
+/**
+ * struct drm_nouveau_vm_init - GPU VA space init structure
+ *
+ * Used to initialize the GPU's VA space for a user client, telling the kernel
+ * which portion of the VA space is managed by the UMD and kernel respectively.
+ */
+struct drm_nouveau_vm_init {
+	/**
+	 * @unmanaged_addr: start address of the kernel managed VA space region
+	 */
+	__u64 unmanaged_addr;
+	/**
+	 * @unmanaged_size: size of the kernel managed VA space region in bytes
+	 */
+	__u64 unmanaged_size;
+};
+
+/**
+ * struct drm_nouveau_vm_bind_op - VM_BIND operation
+ *
+ * This structure represents a single VM_BIND operation. UMDs should pass
+ * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr field.
+ */
+struct drm_nouveau_vm_bind_op {
+	/**
+	 * @op: the operation type
+	 */
+	__u32 op;
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
+ *
+ * The alloc operation is used to reserve a VA space region within the GPU's VA
+ * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to
+ * instruct the kernel to create sparse mappings for the given region.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_MAP:
+ *
+ * Map a GEM object to the GPU's VA space. The mapping must be fully enclosed by
+ * a previously allocated VA space region. If the region is sparse, existing
+ * sparse mappings are overwritten.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
+ *
+ * Unmap an existing mapping in the GPU's VA space. If the region the mapping
+ * is located in is a sparse region, new sparse mappings are created where the
+ * unmapped (memory backed) mapping was mapped previously.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
+	/**
+	 * @flags: the flags for a &drm_nouveau_vm_bind_op
+	 */
+	__u32 flags;
+/**
+ * @DRM_NOUVEAU_VM_BIND_SPARSE:
+ *
+ * Indicates that an allocated VA space region should be sparse.
+ */
+#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
+	/**
+	 * @handle: the handle of the DRM GEM object to map
+	 */
+	__u32 handle;
+	/**
+	 * @pad: 32 bit padding, should be 0
+	 */
+	__u32 pad;
+	/**
+	 * @addr:
+	 *
+	 * the address the VA space region or (memory backed) mapping should be mapped to
+	 */
+	__u64 addr;
+	/**
+	 * @bo_offset: the offset within the BO backing the mapping
+	 */
+	__u64 bo_offset;
+	/**
+	 * @range: the size of the requested mapping in bytes
+	 */
+	__u64 range;
+};
+
+/**
+ * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
+ */
+struct drm_nouveau_vm_bind {
+	/**
+	 * @op_count: the number of &drm_nouveau_vm_bind_op
+	 */
+	__u32 op_count;
+	/**
+	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
+	 */
+	__u32 flags;
+/**
+ * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
+ *
+ * Indicates that the given VM_BIND operation should be executed asynchronously
+ * by the kernel.
+ *
+ * If this flag is not supplied the kernel executes the associated operations
+ * synchronously and doesn't accept any &drm_nouveau_sync objects.
+ */
+#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
+	/**
+	 * @wait_count: the number of wait &drm_nouveau_syncs
+	 */
+	__u32 wait_count;
+	/**
+	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
+	 */
+	__u32 sig_count;
+	/**
+	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
+	 */
+	__u64 wait_ptr;
+	/**
+	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
+	 */
+	__u64 sig_ptr;
+	/**
+	 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
+	 */
+	__u64 op_ptr;
+};
+
+/**
+ * struct drm_nouveau_exec_push - EXEC push operation
+ *
+ * This structure represents a single EXEC push operation. UMDs should pass an
+ * array of this structure via struct drm_nouveau_exec's &push_ptr field.
+ */
+struct drm_nouveau_exec_push {
+	/**
+	 * @va: the virtual address of the push buffer mapping
+	 */
+	__u64 va;
+	/**
+	 * @va_len: the length of the push buffer mapping
+	 */
+	__u64 va_len;
+};
+
+/**
+ * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
+ */
+struct drm_nouveau_exec {
+	/**
+	 * @channel: the channel to execute the push buffer in
+	 */
+	__u32 channel;
+	/**
+	 * @push_count: the number of &drm_nouveau_exec_push ops
+	 */
+	__u32 push_count;
+	/**
+	 * @wait_count: the number of wait &drm_nouveau_syncs
+	 */
+	__u32 wait_count;
+	/**
+	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
+	 */
+	__u32 sig_count;
+	/**
+	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
+	 */
+	__u64 wait_ptr;
+	/**
+	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
+	 */
+	__u64 sig_ptr;
+	/**
+	 * @push_ptr: pointer to &drm_nouveau_exec_push ops
+	 */
+	__u64 push_ptr;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
@@ -136,6 +350,9 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_NVIF               0x07
 #define DRM_NOUVEAU_SVM_INIT           0x08
 #define DRM_NOUVEAU_SVM_BIND           0x09
+#define DRM_NOUVEAU_VM_INIT            0x10
+#define DRM_NOUVEAU_VM_BIND            0x11
+#define DRM_NOUVEAU_EXEC               0x12
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -197,6 +414,9 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
 
+#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
+#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
+#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
 #if defined(__cplusplus)
 }
 #endif
-- 
2.39.1

