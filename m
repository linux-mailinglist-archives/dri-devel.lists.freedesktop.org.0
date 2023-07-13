Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81675295A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 19:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176089B01;
	Thu, 13 Jul 2023 17:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A4F10E736
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VWaBu1eu4QKxPqQYpNlmdd7r9lpsohXFQqltqUgzzo=;
 b=BnMhViLF4lz27M8Y1jPCKYL9N359heyK+1anYRn+IaRlGl+qb/8si6mn3QnnpmL4YbaC5Y
 IgMy6+DTSMtYLJgKra7fzgUg86f61fgQkflyADMukDTsXye4jD9KcpihA4Q0xymEAtYOG1
 KUwh6qoOt7rsZmwgiOwousl75Ta3OOM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-LCVyo_xIMN2t2MBZ2ZlH7A-1; Thu, 13 Jul 2023 13:04:52 -0400
X-MC-Unique: LCVyo_xIMN2t2MBZ2ZlH7A-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b703a076ceso9602881fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267891; x=1691859891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VWaBu1eu4QKxPqQYpNlmdd7r9lpsohXFQqltqUgzzo=;
 b=ZC+/dgznl0h/e9cQiJlAjH81RT5KGngEJMO6v7jD3rP83gaE1wPxHob85fLLPEEF+H
 tJlinI/xau5JHCqNnCAtZPFJVrJ3uPjWVuFUu8DMcTL/apzteScF8GvxQ3E9yC2BNFmu
 jJ3xWA4t0NRp1HwHnoxANwV11OyQPxZoErtzd5dfGuEDUxIY+99+d7yhgmk1rHXYXlkR
 gUxixLxVanOT25ebEmHi6ye9GN9m+I7ua5Yp7PMfxNGHZTp2n6n5mIl6RH5UtAUgeRSi
 JkptQTdE2UeS9vJrzzlLKhAkyVsLSNw0qI3k8kNH7uN+ZU/YI24tsbqUqGzAsSRbLi6K
 1YEQ==
X-Gm-Message-State: ABy/qLYmQEwbJ5D86dBFm39ZMxRkgaQBX77Bgx4WdrMGx/pfPhgRDP+1
 mXcDbfdTkbKYp8xCbL2XyrDMp2/Dr+Z7DpqzSiPaf3iRGjP2rpvdHgqlcwU5eyO5QoGH6fqsnqo
 JnyYTH5OO841VxcE1UQLBztRAaxI3
X-Received: by 2002:a2e:9142:0:b0:2b6:e283:32cb with SMTP id
 q2-20020a2e9142000000b002b6e28332cbmr1919028ljg.23.1689267891366; 
 Thu, 13 Jul 2023 10:04:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGpNS6P5fjcf6HwZEvHT6CGam+WIYERoDGeQa91yNxw/GaYXoCWjrPgfpJIOXPsu+WdyaQ/Kw==
X-Received: by 2002:a2e:9142:0:b0:2b6:e283:32cb with SMTP id
 q2-20020a2e9142000000b002b6e28332cbmr1918992ljg.23.1689267891050; 
 Thu, 13 Jul 2023 10:04:51 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170906050500b009821ce1ea33sm4245853eja.7.2023.07.13.10.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:04:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-next v7 04/13] drm/nouveau: new VM_BIND uapi interfaces
Date: Thu, 13 Jul 2023 19:03:59 +0200
Message-ID: <20230713170429.2964-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
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
 include/uapi/drm/nouveau_drm.h    | 209 ++++++++++++++++++++++++++++++
 2 files changed, 217 insertions(+)

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
index 853a327433d3..4d3a70529637 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -126,6 +126,209 @@ struct drm_nouveau_gem_cpu_fini {
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
+ * @DRM_NOUVEAU_VM_BIND_OP_MAP:
+ *
+ * Map a GEM object to the GPU's VA space. Optionally, the
+ * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel to
+ * create sparse mappings for the given range.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
+ *
+ * Unmap an existing mapping in the GPU's VA space. If the region the mapping
+ * is located in is a sparse region, new sparse mappings are created where the
+ * unmapped (memory backed) mapping was mapped previously. To remove a sparse
+ * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
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
@@ -136,6 +339,9 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_NVIF               0x07
 #define DRM_NOUVEAU_SVM_INIT           0x08
 #define DRM_NOUVEAU_SVM_BIND           0x09
+#define DRM_NOUVEAU_VM_INIT            0x10
+#define DRM_NOUVEAU_VM_BIND            0x11
+#define DRM_NOUVEAU_EXEC               0x12
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -197,6 +403,9 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
 
+#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
+#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
+#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

