Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C82A6042A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 23:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2BD10E955;
	Thu, 13 Mar 2025 22:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="X0dKBdkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9C10E955
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:18:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741904314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BdxXLyUFqR6Z0E2jOyrW9HeSvjCyP8GDPS+okV2hWlA=;
 b=X0dKBdkwUQoa3kp/Jxxn1rNMZQwhZXKPSTFdScVjxVDiVZ2hEC9I36AWK+Okch1G3Ojs6J
 zh3JMqLE7ULWrQRMXgVcKeQupqyk228zpWNPdnZCL5OwcUBNVoajs5JUAvrtHqFigz4Kl/
 ZwEC0Od2OMzXh3UoClCDwhEc2ABxrbsbSFj+B7pD5iEPVGE3M9lxA77mvluF4WbVaMFcqi
 n6RiutbF7EUwX1rKvgrnQMq7NiSGek2/CPvKUsIvK8zWOzeHRFCnI0zxFI0Hcl63cT5QDE
 84YweWh/8xs1eKfChlxFxmdGXD+U4Sn2XpH1QNN1c8RY5oGTNAiMMtA3VjHzBg==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Thu, 13 Mar 2025 18:18:10 -0400
Subject: [PATCH v2] drm: Add UAPI for the Asahi driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-agx-uapi-v2-1-59cc53a59ea3@rosenzweig.io>
X-B4-Tracking: v=1; b=H4sIAKFZ02cC/0XMQQ6CMBCF4auQWVszBWqpK+9hWDQ4lNm0pNWKE
 u5uJSYu/5eXb4VEkSnBuVohUubEwZeoDxUMk/WOBN9KQ421wga1sG4RDzuzMA0qbdpGj9JAuc+
 RRl526tqXnjjdQ3ztcpbf9YdI/CNZCim609ChQYXY0iWGRP79JHZHDtBv2/YB5YWS4aQAAAA=
X-Change-ID: 20250307-agx-uapi-930579437f19
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Sergio Lopez Pascual <slp@sinrega.org>, 
 Ryan Houdek <sonicadvance1@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=41992; i=alyssa@rosenzweig.io; 
 h=from:subject:message-id;
 bh=t2d+BIsunRowSrYJrcgbK4HUKtHyCo8/XJnFmbFjVmo=; 
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBn01m1De+nd/G+Hiu2HMhqe9RGynLlWffTavU1J
 1xow/evETWJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ9NZtQAKCRD+/lBaCvVY
 DbN3D/9xgPGGN2cznb2oP9tkVrUa7EsZDXeeSYEFcIuXT5MUzvZLoxv8vm0+9qBpRkMaOy8YX9N
 +wIroItEdBsisqwJcupm2TiD0+WaAqudEoSpyIuCbA/KW16JYHanwJtj5jSUX4Ki0R0nfnQQ2h7
 R2LLzwVZ6vPJBzNOss2LVXEtleW9CJR0KUujphZQfdLJpi+TgUf+1mt/eJTFQOWYQMxYdFt5qI6
 /LAJPs1hueyNKR3/jyiSN/DtOrpeYjdU06rOhCtv++g02aURAQ7t+NYjlP9bDW72TG/5hWCrHKc
 CSTJu4rUGjX8JYaOto9/ANDVIfQKxv0Zld7YYjJYn4wmmf40LvO1i7HpfTGxxu7+5jbzuvuM/Sz
 NFnqjqASXE/9d3/LS4AXH6dJcPXTwvbZqG7d5rwa4TIu8Ud4MiXJdWCrKFV1syh390m/LJK2APh
 WiAc9THsBBJWw0cH9BVNF8HnJdpzArlrNCTaN6LFb4XgZbdUk+T2bOQZM6efHZ6CpYF96tGgrDp
 XsX5khQT5Je9RK4B5z/AmqB9YCoRgDwiGKuvTCJM65DIBuqvRqUKR7t7tOQNUqahfF373S9/tKK
 +n0wKQAAXKmeuPuBegl2Lw9WrAmJA/qdT6Ywb8fUM8oMN72t2w7eV8KJA8kHtwSXzBiInb+Ufbl
 CroKXfwR8FJsn+w==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
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

This adds the UAPI for the Asahi driver targeting the GPU in the Apple
M1 and M2 series systems on chip. The UAPI design is based on other
modern Vulkan-capable drivers, including Xe and Panthor. Memory
management is based on explicit VM management. Synchronization is
exclusively explicit sync.

This UAPI is validated against our open source Mesa stack, which is
fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and
Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising the
VM_BIND mechanism.

This patch adds the standalone UAPI header. It is implemented by an open
source DRM driver written in Rust. We fully intend to upstream this
driver when possible. However, as a production graphics driver, it
depends on a significant number of Rust abstractions that will take a
long time to upstream. In the mean time, our userspace is upstream in
Mesa but is not allowed to probe with upstream Mesa as the UAPI is not
yet reviewed and merged in the upstream kernel. Although we ship a
patched Mesa in Fedora Asahi Remix, any containers shipping upstream
Mesa builds are broken for our users, including upstream Flatpak and
Waydroid runtimes. Additionally, it forces us to maintain forks of Mesa
and virglrenderer, which complicates bisects.

The intention in sending out this patch is for this UAPI to be
thoroughly reviewed. Once we as the DRM community are satisfied with the
UAPI, this header lands signifying that the UAPI is stable and must only
be evolved in backwards-compatible ways; it will be the UAPI implemented
in the DRM driver that eventually lands upstream. That promise lets us
enable upstream Mesa, solving all these issues while the upstream Rust
abstractions are developed.

https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v2 contains
the DRM driver implementing this proposed UAPI.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains
the Mesa patches to implement this proposed UAPI. It is mirrored at
https://github.com/alyssarosenzweig/mesa/tree/agx-uapi-v2 to allow
continued review during upcoming gitlab.freedesktop.org downtime.

That Linux and Mesa branch together give a complete graphics/compute
stack on top of this UAPI.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Changes in v2:
- Flatten submits. Previously, the submit ioctl pointed to an array of
  command structures, which each pointed to separate payload structures,
  which pointed to attachment structures. This is a lot of indirection,
  which complicates greatly virtgpu. In the new approach, the submit
  ioctl points to a single contiguous blob of plain-old-data, no CPU
  pointers, copied from userspace in one go and suitable as virtgpu wire
  protocol.
- Remove vm_page_size, userspace has to hardcode it anyway.
- Turn random #defines into enums for better kernel doc, etc.
- Improve comments, particularly around barriers[].
- Rename various flags/fields to better match canonical names when known
  (a lot of the names are pulled from the drivers/gpu/drm/imagination,
  naturally).
- Drop unnecessary encoder_id, cmd_id handles.
- Fix padding in submit ioctl (thanks Ryan).
- Link to v1: https://lore.kernel.org/r/20250310-agx-uapi-v1-1-86c80905004e@rosenzweig.io
---
 Documentation/gpu/driver-uapi.rst |    5 +
 MAINTAINERS                       |    1 +
 include/uapi/drm/asahi_drm.h      | 1194 +++++++++++++++++++++++++++++++++++++
 3 files changed, 1200 insertions(+)

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 971cdb4816fc98d80a64d93637481d10c2e79718..1f15a8ca126516c23bd7374cc4aead0dfbbccf67 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -27,3 +27,8 @@ drm/xe uAPI
 ===========
 
 .. kernel-doc:: include/uapi/drm/xe_drm.h
+
+drm/asahi uAPI
+================
+
+.. kernel-doc:: include/uapi/drm/asahi_drm.h
diff --git a/MAINTAINERS b/MAINTAINERS
index d1050702f681fbd0e4e2d0457b2ba569a64070d9..7f692a935808d4ec82ee741324f8043302dae491 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2256,6 +2256,7 @@ F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
 F:	include/linux/soc/apple/*
+F:	include/uapi/drm/asahi_drm.h
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
diff --git a/include/uapi/drm/asahi_drm.h b/include/uapi/drm/asahi_drm.h
new file mode 100644
index 0000000000000000000000000000000000000000..951fe81866c90d8fca66456c113e618713130bac
--- /dev/null
+++ b/include/uapi/drm/asahi_drm.h
@@ -0,0 +1,1194 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) The Asahi Linux Contributors
+ * Copyright (C) 2018-2023 Collabora Ltd.
+ * Copyright (C) 2014-2018 Broadcom
+ */
+#ifndef _ASAHI_DRM_H_
+#define _ASAHI_DRM_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * DOC: Introduction to the Asahi UAPI
+ *
+ * This documentation describes the Asahi IOCTLs.
+ *
+ * Just a few generic rules about the data passed to the Asahi IOCTLs (cribbed
+ * from Panthor):
+ *
+ * - Structures must be aligned on 64-bit/8-byte. If the object is not
+ *   naturally aligned, a padding field must be added.
+ * - Fields must be explicitly aligned to their natural type alignment with
+ *   pad[0..N] fields.
+ * - All padding fields will be checked by the driver to make sure they are
+ *   zeroed.
+ * - Flags can be added, but not removed/replaced.
+ * - New fields can be added to the main structures (the structures
+ *   directly passed to the ioctl). Those fields can be added at the end of
+ *   the structure, or replace existing padding fields. Any new field being
+ *   added must preserve the behavior that existed before those fields were
+ *   added when a value of zero is passed.
+ * - New fields can be added to indirect objects (objects pointed by the
+ *   main structure), iff those objects are passed a size to reflect the
+ *   size known by the userspace driver (see
+ *   drm_asahi_command::cmd_buffer_size).
+ * - If the kernel driver is too old to know some fields, those will be
+ *   ignored if zero, and otherwise rejected (and so will be zero on output).
+ * - If userspace is too old to know some fields, those will be zeroed
+ *   (input) before the structure is parsed by the kernel driver.
+ * - Each new flag/field addition must come with a driver version update so
+ *   the userspace driver doesn't have to trial and error to know which
+ *   flags are supported.
+ * - Structures should not contain unions, as this would defeat the
+ *   extensibility of such structures.
+ * - IOCTLs can't be removed or replaced. New IOCTL IDs should be placed
+ *   at the end of the drm_asahi_ioctl_id enum.
+ */
+
+/**
+ * enum drm_asahi_ioctl_id - IOCTL IDs
+ *
+ * Place new ioctls at the end, don't re-order, don't replace or remove entries.
+ *
+ * These IDs are not meant to be used directly. Use the DRM_IOCTL_ASAHI_xxx
+ * definitions instead.
+ */
+enum drm_asahi_ioctl_id {
+	/** @DRM_ASAHI_GET_PARAMS: Query device properties. */
+	DRM_ASAHI_GET_PARAMS = 0,
+
+	/** @DRM_ASAHI_VM_CREATE: Create a GPU VM address space. */
+	DRM_ASAHI_VM_CREATE,
+
+	/** @DRM_ASAHI_VM_DESTROY: Destroy a VM. */
+	DRM_ASAHI_VM_DESTROY,
+
+	/** @DRM_ASAHI_GEM_CREATE: Create a buffer object. */
+	DRM_ASAHI_GEM_CREATE,
+
+	/**
+	 * @DRM_ASAHI_GEM_MMAP_OFFSET: Get offset to pass to mmap() to map a
+	 * given GEM handle.
+	 */
+	DRM_ASAHI_GEM_MMAP_OFFSET,
+
+	/** @DRM_ASAHI_GEM_BIND: Bind/unbind memory to a VM. */
+	DRM_ASAHI_GEM_BIND,
+
+	/** @DRM_ASAHI_QUEUE_CREATE: Create a scheduling queue. */
+	DRM_ASAHI_QUEUE_CREATE,
+
+	/** @DRM_ASAHI_QUEUE_DESTROY: Destroy a scheduling queue. */
+	DRM_ASAHI_QUEUE_DESTROY,
+
+	/** @DRM_ASAHI_SUBMIT: Submit commands to a queue. */
+	DRM_ASAHI_SUBMIT,
+
+	/** @DRM_ASAHI_GET_TIME: Query device time. */
+	DRM_ASAHI_GET_TIME,
+
+	/** @DRM_ASAHI_GEM_BIND_OBJECT: Bind memory as a special object */
+	DRM_ASAHI_GEM_BIND_OBJECT,
+};
+
+#define DRM_ASAHI_MAX_CLUSTERS	64
+
+/**
+ * struct drm_asahi_params_global - Global parameters.
+ *
+ * This struct may be queried by drm_asahi_get_params.
+ */
+struct drm_asahi_params_global {
+	/** @features: Feature bits from drm_asahi_feature */
+	__u64 features;
+
+	/** @gpu_generation: GPU generation, e.g. 13 for G13G */
+	__u32 gpu_generation;
+
+	/** @gpu_variant: GPU variant as a character, e.g. 'G' for G13G */
+	__u32 gpu_variant;
+
+	/**
+	 * @gpu_revision: GPU revision in BCD, e.g. 0x00 for 'A0' or
+	 * 0x21 for 'C1'
+	 */
+	__u32 gpu_revision;
+
+	/** @chip_id: Chip ID in BCD, e.g. 0x8103 for T8103 */
+	__u32 chip_id;
+
+	/** @num_dies: Number of dies in the SoC */
+	__u32 num_dies;
+
+	/** @num_clusters_total: Number of GPU clusters (across all dies) */
+	__u32 num_clusters_total;
+
+	/**
+	 * @num_cores_per_cluster: Number of logical cores per cluster
+	 * (including inactive/nonexistent)
+	 */
+	__u32 num_cores_per_cluster;
+
+	/** @num_frags_per_cluster: Number of frags per cluster */
+	__u32 num_frags_per_cluster;
+
+	/** @num_gps_per_cluster: Number of GPs per cluster */
+	__u32 num_gps_per_cluster;
+
+	/** @max_power_mw: Maximum GPU power consumption */
+	__u32 max_power_mw;
+
+	/** @core_masks: Bitmask of present/enabled cores per cluster */
+	__u64 core_masks[DRM_ASAHI_MAX_CLUSTERS];
+
+	/** @timer_frequency_hz: Clock frequency for timestamps */
+	__u64 timer_frequency_hz;
+
+	/** @min_frequency_khz: Minimum GPU core clock frequency */
+	__u32 min_frequency_khz;
+
+	/** @max_frequency_khz: Maximum GPU core clock frequency */
+	__u32 max_frequency_khz;
+
+	/** @vm_user_start: VM user range start VMA */
+	__u64 vm_user_start;
+
+	/** @vm_user_end: VM user range end VMA */
+	__u64 vm_user_end;
+
+	/**
+	 * @vm_kernel_min_size: Minimum kernel VMA window size within user
+	 * range
+	 */
+	__u64 vm_kernel_min_size;
+
+	/**
+	 * @max_commands_per_submission: Maximum number of supported commands
+	 * per submission
+	 */
+	__u32 max_commands_per_submission;
+
+	/**
+	 * @max_attachments: Maximum number of drm_asahi_attachment's per
+	 * command
+	 */
+	__u32 max_attachments;
+
+	/**
+	 * @firmware_version: GPU firmware version, as 4 integers
+	 */
+	__u32 firmware_version[4];
+
+	/**
+	 * @user_timestamp_frequency_hz: Timebase frequency for user timestamps
+	 */
+	__u64 user_timestamp_frequency_hz;
+};
+
+/**
+ * enum drm_asahi_feature - Feature bits
+ *
+ * This covers only features that userspace cannot infer from the architecture
+ * version. Most features don't need to be here.
+ */
+enum drm_asahi_feature {
+	/**
+	 * @DRM_ASAHI_FEATURE_SOFT_FAULTS: GPU has "soft fault" enabled. Shader
+	 * loads of unmapped memory will return zero. Shader stores to unmapped
+	 * memory will be silently discarded. Note that only shader load/store
+	 * is affected. Other hardware units are not affected, notably including
+	 * texture sampling.
+	 */
+	DRM_ASAHI_FEATURE_SOFT_FAULTS = (1UL) << 0,
+};
+
+/**
+ * struct drm_asahi_get_params - Arguments passed to DRM_IOCTL_ASAHI_GET_PARAMS
+ */
+struct drm_asahi_get_params {
+	/** @param_group: Parameter group to fetch (MBZ) */
+	__u32 param_group;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @pointer: User pointer to write parameter struct */
+	__u64 pointer;
+
+	/** @size: Size of user buffer, max size supported on return */
+	__u64 size;
+};
+
+/**
+ * struct drm_asahi_vm_create - Arguments passed to DRM_IOCTL_ASAHI_VM_CREATE
+ */
+struct drm_asahi_vm_create {
+	/** @kernel_start: Start of the kernel-reserved address range */
+	__u64 kernel_start;
+
+	/** @kernel_end: End of the kernel-reserved address range */
+	__u64 kernel_end;
+
+	/** @vm_id: Returned VM ID */
+	__u32 vm_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * struct drm_asahi_vm_destroy - Arguments passed to DRM_IOCTL_ASAHI_VM_DESTROY
+ */
+struct drm_asahi_vm_destroy {
+	/** @vm_id: VM ID to be destroyed */
+	__u32 vm_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * enum drm_asahi_gem_flags - Flags for GEM creation
+ */
+enum drm_asahi_gem_flags {
+	/**
+	 * @DRM_ASAHI_GEM_WRITEBACK: BO should be CPU-mapped as writeback.
+	 *
+	 * Map as writeback instead of write-combine. This optimizes for CPU
+	 * reads.
+	 */
+	DRM_ASAHI_GEM_WRITEBACK = (1L << 0),
+
+	/**
+	 * @DRM_ASAHI_GEM_VM_PRIVATE: BO is private to this GPU VM (no exports).
+	 */
+	DRM_ASAHI_GEM_VM_PRIVATE = (1L << 1),
+};
+
+/**
+ * struct drm_asahi_gem_create - Arguments passed to DRM_IOCTL_ASAHI_GEM_CREATE
+ */
+struct drm_asahi_gem_create {
+	/** @size: Size of the BO */
+	__u64 size;
+
+	/** @flags: Combination of drm_asahi_gem_flags flags. */
+	__u32 flags;
+
+	/**
+	 * @vm_id: VM ID to assign to the BO, if DRM_ASAHI_GEM_VM_PRIVATE is set
+	 */
+	__u32 vm_id;
+
+	/** @handle: Returned GEM handle for the BO */
+	__u32 handle;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * struct drm_asahi_gem_mmap_offset - Arguments passed to
+ * DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET
+ */
+struct drm_asahi_gem_mmap_offset {
+	/** @handle: Handle for the object being mapped. */
+	__u32 handle;
+
+	/** @flags: Must be zero */
+	__u32 flags;
+
+	/** @offset: The fake offset to use for subsequent mmap call */
+	__u64 offset;
+};
+
+/**
+ * enum drm_asahi_bind_op - Bind operation
+ */
+enum drm_asahi_bind_op {
+	/** @DRM_ASAHI_BIND_OP_BIND: Bind a BO to a GPU VMA range */
+	DRM_ASAHI_BIND_OP_BIND = 0,
+
+	/** @DRM_ASAHI_BIND_OP_UNBIND: Unbind a GPU VMA range */
+	DRM_ASAHI_BIND_OP_UNBIND = 1,
+
+	/** @DRM_ASAHI_BIND_OP_UNBIND_ALL: Unbind all mappings of a given BO */
+	DRM_ASAHI_BIND_OP_UNBIND_ALL = 2,
+};
+
+/**
+ * enum drm_asahi_bind_flags - Flags for GEM binding
+ */
+enum drm_asahi_bind_flags {
+	/** @DRM_ASAHI_BIND_READ: Map BO with GPU read permission */
+	DRM_ASAHI_BIND_READ = (1L << 0),
+
+	/** @DRM_ASAHI_BIND_WRITE: Map BO with GPU write permission */
+	DRM_ASAHI_BIND_WRITE = (1L << 1),
+
+	/**
+	 * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single page of the BO repeatedly
+	 * across the VA range.
+	 *
+	 * This is useful to fill a VA range with scratch pages or zero pages.
+	 * It is intended as a mechanism to accelerate sparse.
+	 */
+	DRM_ASAHI_BIND_SINGLE_PAGE = (1L << 2),
+};
+
+/**
+ * struct drm_asahi_gem_bind - Arguments passed to
+ * DRM_IOCTL_ASAHI_GEM_BIND
+ */
+struct drm_asahi_gem_bind {
+	/** @op: Bind operation (enum drm_asahi_bind_op) */
+	__u32 op;
+
+	/** @flags: Combination of drm_asahi_bind_flags flags. */
+	__u32 flags;
+
+	/** @handle: GEM object to bind/unbind (BIND or UNBIND_ALL) */
+	__u32 handle;
+
+	/** @vm_id: The ID of the VM to operate on */
+	__u32 vm_id;
+
+	/** @offset: Offset into the object (BIND only) */
+	__u64 offset;
+
+	/**
+	 * @range: Number of bytes to bind/unbind to addr (BIND or UNBIND only)
+	 */
+	__u64 range;
+
+	/** @addr: Address to bind to (BIND or UNBIND only) */
+	__u64 addr;
+};
+
+/**
+ * enum drm_asahi_bind_object_op - Special object bind operation
+ */
+enum drm_asahi_bind_object_op {
+	/** @DRM_ASAHI_BIND_OBJECT_OP_BIND: Bind a BO as a special GPU object */
+	DRM_ASAHI_BIND_OBJECT_OP_BIND = 0,
+
+	/** @DRM_ASAHI_BIND_OBJECT_OP_UNBIND: Unbind a special GPU object */
+	DRM_ASAHI_BIND_OBJECT_OP_UNBIND = 1,
+};
+
+/**
+ * enum drm_asahi_bind_object_flags - Special object bind flags
+ */
+enum drm_asahi_bind_object_flags {
+	/**
+	 * @DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS: Map a BO as a timestamp
+	 * buffer.
+	 */
+	DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS = (1L << 0),
+};
+
+/**
+ * struct drm_asahi_gem_bind_object - Arguments passed to
+ * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT
+ */
+struct drm_asahi_gem_bind_object {
+	/** @op: Bind operation (enum drm_asahi_bind_object_op) */
+	__u32 op;
+
+	/** @flags: Combination of drm_asahi_bind_object_flags flags. */
+	__u32 flags;
+
+	/** @handle: GEM object to bind/unbind (BIND) */
+	__u32 handle;
+
+	/** @vm_id: The ID of the VM to operate on (MBZ currently) */
+	__u32 vm_id;
+
+	/** @offset: Offset into the object (BIND only) */
+	__u64 offset;
+
+	/** @range: Number of bytes to bind/unbind (BIND only) */
+	__u64 range;
+
+	/** @object_handle: Object handle (out for BIND, in for UNBIND) */
+	__u32 object_handle;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * enum drm_asahi_cmd_type - Command type
+ */
+enum drm_asahi_cmd_type {
+	/**
+	 * @DRM_ASAHI_CMD_RENDER: Render command, executing on the render
+	 * subqueue. Combined vertex and fragment operation.
+	 *
+	 * Followed by a @drm_asahi_cmd_render payload.
+	 */
+	DRM_ASAHI_CMD_RENDER = 0,
+
+	/**
+	 * @DRM_ASAHI_CMD_COMPUTE: Compute command on the compute subqueue.
+	 *
+	 * Followed by a @drm_asahi_cmd_compute payload.
+	 */
+	DRM_ASAHI_CMD_COMPUTE = 1,
+
+	/**
+	 * @DRM_ASAHI_SET_VERTEX_ATTACHMENTS: Software command to set
+	 * attachments for subsequent vertex shaders in the same submit.
+	 *
+	 * Followed by (possibly multiple) @drm_asahi_attachment payloads.
+	 */
+	DRM_ASAHI_SET_VERTEX_ATTACHMENTS = 2,
+
+	/**
+	 * @DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS: Software command to set
+	 * attachments for subsequent fragment shaders in the same submit.
+	 *
+	 * Followed by (possibly multiple) @drm_asahi_attachment payloads.
+	 */
+	DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS = 3,
+
+	/**
+	 * @DRM_ASAHI_SET_COMPUTE_ATTACHMENTS: Software command to set
+	 * attachments for subsequent compute shaders in the same submit.
+	 *
+	 * Followed by (possibly multiple) @drm_asahi_attachment payloads.
+	 */
+	DRM_ASAHI_SET_COMPUTE_ATTACHMENTS = 4,
+};
+
+/**
+ * enum drm_asahi_queue_cap - Queue capabilities
+ */
+enum drm_asahi_queue_cap {
+	/** @DRM_ASAHI_QUEUE_CAP_RENDER: Supports render commands */
+	DRM_ASAHI_QUEUE_CAP_RENDER	= (1UL << DRM_ASAHI_CMD_RENDER),
+
+	/** @DRM_ASAHI_QUEUE_CAP_COMPUTE: Supports compute commands */
+	DRM_ASAHI_QUEUE_CAP_COMPUTE	= (1UL << DRM_ASAHI_CMD_COMPUTE),
+};
+
+/**
+ * struct drm_asahi_queue_create - Arguments passed to
+ * DRM_IOCTL_ASAHI_QUEUE_CREATE
+ */
+struct drm_asahi_queue_create {
+	/** @flags: MBZ */
+	__u32 flags;
+
+	/** @vm_id: The ID of the VM this queue is bound to */
+	__u32 vm_id;
+
+	/** @queue_caps: Bitmask of DRM_ASAHI_QUEUE_CAP_* */
+	__u32 queue_caps;
+
+	/** @priority: Queue priority, 0-3 */
+	__u32 priority;
+
+	/** @queue_id: The returned queue ID */
+	__u32 queue_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * struct drm_asahi_queue_destroy - Arguments passed to
+ * DRM_IOCTL_ASAHI_QUEUE_DESTROY
+ */
+struct drm_asahi_queue_destroy {
+	/** @queue_id: The queue ID to be destroyed */
+	__u32 queue_id;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * enum drm_asahi_sync_type - Sync item type
+ */
+enum drm_asahi_sync_type {
+	/** @DRM_ASAHI_SYNC_SYNCOBJ: Binary sync object */
+	DRM_ASAHI_SYNC_SYNCOBJ = 0,
+
+	/** @DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ: Timeline sync object */
+	DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ = 1,
+};
+
+/**
+ * struct drm_asahi_sync - Sync item
+ */
+struct drm_asahi_sync {
+	/** @sync_type: One of drm_asahi_sync_type */
+	__u32 sync_type;
+
+	/** @handle: The sync object handle */
+	__u32 handle;
+
+	/** @timeline_value: Timeline value for timeline sync objects */
+	__u64 timeline_value;
+};
+
+/**
+ * enum drm_asahi_subqueue - Subqueue within a queue
+ */
+enum drm_asahi_subqueue {
+	/** @DRM_ASAHI_SUBQUEUE_RENDER: Render subqueue */
+	DRM_ASAHI_SUBQUEUE_RENDER = 0,
+
+	/** @DRM_ASAHI_SUBQUEUE_COMPUTE: Compute subqueue */
+	DRM_ASAHI_SUBQUEUE_COMPUTE = 1,
+
+	/**
+	 * @DRM_ASAHI_SUBQUEUE_COUNT: Queue count, must remain multiple of 2
+	 * for struct alignment
+	 */
+	DRM_ASAHI_SUBQUEUE_COUNT = 2,
+};
+
+/**
+ * define DRM_ASAHI_BARRIER_NONE - Command index for no barrier
+ *
+ * This special value may be passed in to drm_asahi_command::barriers[] to
+ * indicate that the respective subqueue should not wait on any previous work.
+ */
+#define DRM_ASAHI_BARRIER_NONE (0xFFFFu)
+
+/**
+ * struct drm_asahi_cmd_header - Top level command structure
+ */
+struct drm_asahi_cmd_header {
+	/** @cmd_type: One of drm_asahi_cmd_type */
+	__u16 cmd_type;
+
+	/**
+	 * @size: Size of this command, not including this header.
+	 *
+	 * For hardware commands, this enables extensibility of commands without
+	 * requiring extra command types.  Passing a command that is shorter
+	 * than expected is explicitly allowed for backwards-compatability.
+	 * Truncated fields will be zeroed.
+	 *
+	 * For the synthetic attachment setting commands, this implicitly
+	 * encodes the number of attachments. These commands take multiple
+	 * fixed-size @drm_asahi_attachment structures as their payload, so size
+	 * equals number of attachments * sizeof(struct drm_asahi_attachment).
+	 */
+	__u16 size;
+
+	/**
+	 * @barriers: Array of command indices per subqueue to wait on.
+	 *
+	 * Barriers are indices relative to the beginning of a given submit. A
+	 * barrier of 0 waits on commands submitted to the subqueue in previous
+	 * submit ioctls. A barrier of N waits on N previous commands on the
+	 * subqueue within the current submit ioctl. As a special case, passing
+	 * @DRM_ASAHI_BARRIER_NONE avoids waiting on any commands in the
+	 * subqueue.
+	 *
+	 * Examples:
+	 *
+	 *   (0, 0): This waits on all previous work.
+	 *
+	 *   (NONE, 0): This waits on previously submitted compute commands but
+	 *   does not wait on any render commands.
+	 *
+	 *   (1, NONE): This waits on the first render command in the submit.
+	 *   This only makes sense if there are multiple render commands in the
+	 *   same submit.
+	 *
+	 * Barriers only make sense for hardware commands. Synthetic software
+	 * commands to set attachments must pass (NONE, NONE) here.
+	 */
+	__u16 barriers[DRM_ASAHI_SUBQUEUE_COUNT];
+};
+
+/**
+ * struct drm_asahi_submit - Arguments passed to DRM_IOCTL_ASAHI_SUBMIT
+ */
+struct drm_asahi_submit {
+	/**
+	 * @in_syncs: An optional array of drm_asahi_sync to wait on before
+	 * starting this job.
+	 */
+	__u64 in_syncs;
+
+	/**
+	 * @out_syncs: An optional array of drm_asahi_sync objects to signal
+	 * upon completion.
+	 */
+	__u64 out_syncs;
+
+	/**
+	 * @cmdbuf: Pointer to the command buffer to submit.
+	 *
+	 * This is a flat command buffer. By design, it contains no CPU
+	 * pointers, which makes it suitable for a virtgpu wire protocol without
+	 * requiring any serializing/deserializing step.
+	 *
+	 * It consists of a series of commands. Each command begins with a
+	 * fixed-size @drm_asahi_cmd_header and is followed by a variable-length
+	 * payload according to the type and size in the header.
+	 */
+	__u64 cmdbuf;
+
+	/** @flags: Flags for command submission (MBZ) */
+	__u32 flags;
+
+	/** @queue_id: The queue ID to be submitted to */
+	__u32 queue_id;
+
+	/**
+	 * @in_sync_count: Number of sync objects to wait on before starting
+	 * this job.
+	 */
+	__u32 in_sync_count;
+
+	/**
+	 * @out_sync_count: Number of sync objects to signal upon completion of
+	 * this job.
+	 */
+	__u32 out_sync_count;
+
+	/** @cmdbuf_size: Command buffer size in bytes */
+	__u32 cmdbuf_size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+/**
+ * struct drm_asahi_attachment - Describe an "attachment".
+ *
+ * Attachments are any memory written by shaders, notably including render
+ * target attachments written by the end-of-tile program. This is purely a hint
+ * about the accessed memory regions. It is optional to specify, which is
+ * fortunate as it cannot be specified precisely with bindless access anyway.
+ * But where possible, it's probably a good idea for userspace to include these
+ * hints, forwarded to the firmware.
+ */
+struct drm_asahi_attachment {
+	/** @pointer: Base address of the attachment */
+	__u64 pointer;
+
+	/** @size: Size of the attachment in bytes */
+	__u64 size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @flags: MBZ */
+	__u32 flags;
+};
+
+enum drm_asahi_render_flags {
+	/**
+	 * @DRM_ASAHI_RENDER_VERTEX_SCRATCH: A vertex stage shader uses scratch
+	 * memory.
+	 */
+	DRM_ASAHI_RENDER_VERTEX_SCRATCH = (1UL << 0),
+
+	/**
+	 * @DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES: Process even empty tiles.
+	 * This must be set when clearing render targets.
+	 */
+	DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES = (1UL << 1),
+
+	/**
+	 * @DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING: Run vertex stage on a single
+	 * cluster (on multicluster GPUs)
+	 *
+	 * This harms performance but can workaround certain sync/coherency
+	 * bugs, and therefore is useful for debugging.
+	 */
+	DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING = (1UL << 2),
+
+	/**
+	 * @DRM_ASAHI_RENDER_DBIAS_IS_INT: Use integer depth bias formula.
+	 *
+	 * Graphics specifications contain two alternate formulas for depth
+	 * bias, a float formula used with floating-point depth buffers and an
+	 * integer formula using with unorm depth buffers. This flag specifies
+	 * that the integer formula should be used. If omitted, the float
+	 * formula is used instead.
+	 *
+	 * This corresponds to bit 18 of the relevant hardware control register,
+	 * so we match that here for efficiency.
+	 */
+	DRM_ASAHI_RENDER_DBIAS_IS_INT = (1UL << 18),
+};
+
+/**
+ * struct drm_asahi_zls_buffer - Describe a depth or stencil buffer.
+ *
+ * These fields correspond directly to hardware registers in the ZLS (Z
+ * Load/Store) unit. Together, they configure a single depth or stencil buffer.
+ * Typically, load/store/partial will all use the same values. However, the
+ * hardware does not require this.
+ */
+struct drm_asahi_zls_buffer {
+	/** @load: Base address of the buffer to load at the start */
+	__u64 load;
+
+	/** @store: Base address of the buffer to store at the end */
+	__u64 store;
+
+	/**
+	 * @partial: Base address of the buffer to load and store during a
+	 * partial render operation.
+	 */
+	__u64 partial;
+
+	/**
+	 * @comp_load: If the load buffer is compressed, address of the
+	 * compression metadata section.
+	 */
+	__u64 comp_load;
+
+	/**
+	 * @comp_store: If the load buffer is compressed, address of the
+	 * compression metadata section.
+	 */
+	__u64 comp_store;
+
+	/**
+	 * @comp_partial: If the partial render buffer is compressed, address of
+	 * the compression metadata section.
+	 */
+	__u64 comp_partial;
+
+	/**
+	 * @load_stride: If layered rendering is enabled, the number of bytes
+	 * between each layer of the load buffer.
+	 */
+	__u32 load_stride;
+
+	/**
+	 * @store_stride: If layered rendering is enabled, the number of bytes
+	 * between each layer of the store buffer.
+	 */
+	__u32 store_stride;
+
+	/**
+	 * @partial_stride: If layered rendering is enabled, the number of bytes
+	 * between each layer of the partial render buffer.
+	 */
+	__u32 partial_stride;
+
+	/**
+	 * @comp_load_stride: If layered rendering is enabled, the number of bytes
+	 * between each layer of the compression metadata for loads.
+	 */
+	__u32 comp_load_stride;
+
+	/**
+	 * @comp_store_stride: If layered rendering is enabled, the number of
+	 * bytes between each layer of the compression metadata for stores.
+	 */
+	__u32 comp_store_stride;
+
+	/**
+	 * @comp_partial_stride: If layered rendering is enabled, the number of
+	 * bytes between each layer of the compression metadata for partial
+	 * renders.
+	 */
+	__u32 comp_partial_stride;
+};
+
+/**
+ * struct drm_asahi_timestamp - Describe a timestamp write.
+ *
+ * The firmware can optionally write the GPU timestamp at render pass
+ * granularities, but it needs to be mapped specially via
+ * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT. This structure therefore describes where to
+ * write as a handle-offset pair, rather than a GPU address like normal.
+ */
+struct drm_asahi_timestamp {
+	/**
+	 * @handle: Handle of the timestamp buffer, or 0 to skip this
+	 * timestamp. If nonzero, this must equal the value returned in
+	 * drm_asahi_gem_bind_object::object_handle.
+	 */
+	__u32 handle;
+
+	/** @offset: Offset to write into the timestamp buffer */
+	__u32 offset;
+};
+
+/**
+ * struct drm_asahi_timestamps - Describe timestamp writes.
+ *
+ * Each operation that can be timestamped, can be timestamped at the start and
+ * end. Therefore, drm_asahi_timestamp structs always come in pairs, bundled
+ * together into drm_asahi_timestamps.
+ */
+struct drm_asahi_timestamps {
+	/** @start: Timestamp recorded at the start of the operation */
+	struct drm_asahi_timestamp start;
+
+	/** @end: Timestamp recorded at the end of the operation */
+	struct drm_asahi_timestamp end;
+};
+
+/**
+ * struct drm_asahi_helper_program - Describe helper program configuration.
+ *
+ * The helper program is a compute-like kernel required for various hardware
+ * functionality. Its most important role is dynamically allocating
+ * scratch/stack memory for individual subgroups, by partitioning a static
+ * allocation shared for the whole device. It is supplied by userspace via
+ * drm_asahi_helper_program and internally dispatched by the hardware as needed.
+ */
+struct drm_asahi_helper_program {
+	/**
+	 * @binary: USC address to the helper program binary. This is a tagged
+	 * pointer with configuration in the bottom bits.
+	 */
+	__u32 binary;
+
+	/** @cfg: Configuration bits for the helper program. */
+	__u32 cfg;
+
+	/**
+	 * @data: Data passed to the helper program. This value is not
+	 * interpreted by the kernel, firmware, or hardware in any way. It is
+	 * simply a sideband for userspace, set with the submit ioctl and read
+	 * via special registers inside the helper program.
+	 *
+	 * In practice, userspace will pass a 64-bit GPU VA here pointing to the
+	 * actual arguments, which presumably don't fit in 64-bits.
+	 */
+	__u64 data;
+};
+
+/**
+ * struct drm_asahi_bg_eot - Describe a background or end-of-tile program.
+ *
+ * The background and end-of-tile programs are dispatched by the hardware at the
+ * beginning and end of rendering. As the hardware "tilebuffer" is simply local
+ * memory, these programs are necessary to implement API-level render targets.
+ * The fragment-like background program is responsible for loading either the
+ * clear colour or the existing render target contents, while the compute-like
+ * end-of-tile program stores the tilebuffer contents to memory.
+ */
+struct drm_asahi_bg_eot {
+	/**
+	 * @usc: USC address of the hardware USC words binding resources
+	 * (including images and uniforms) and the program itself. Note this is
+	 * an additional layer of indirection compared to the helper program,
+	 * avoiding the need for a sideband for data. This is a tagged pointer
+	 * with additional configuration in the bottom bits.
+	 */
+	__u32 usc;
+
+	/**
+	 * @rsrc_spec: Resource specifier for the program. This is a packed
+	 * hardware data structure describing the required number of registers,
+	 * uniforms, bound textures, and bound samplers.
+	 */
+	__u32 rsrc_spec;
+};
+
+/**
+ * struct drm_asahi_cmd_render - Command to submit 3D
+ *
+ * This command submits a single render pass. The hardware control stream may
+ * include many draws and subpasses, but within the command, the framebuffer
+ * dimensions and attachments are fixed.
+ *
+ * The hardware requires the firmware to set a large number of Control Registers
+ * setting up state at render pass granularity before each command rendering 3D.
+ * The firmware bundles this state into data structures. Unfortunately, we
+ * cannot expose either any of that directly to userspace, because the
+ * kernel-firmware ABI is not stable. Although we can guarantee the firmware
+ * updates in tandem with the kernel, we cannot break old userspace when
+ * upgrading the firmware and kernel. Therefore, we need to abstract well the
+ * data structures to avoid tying our hands with future firmwares.
+ *
+ * The bulk of drm_asahi_cmd_render therefore consists of values of hardware
+ * control registers, marshalled via the firmware interface.
+ *
+ * The framebuffer/tilebuffer dimensions are also specified here. In addition to
+ * being passed to the firmware/hardware, the kernel requires these dimensions
+ * to calculate various essential tiling-related data structures. It is
+ * unfortunate that our submits are heavier than on vendors with saner
+ * hardware-software interfaces. The upshot is all of this information is
+ * readily available to userspace with all current APIs.
+ *
+ * It looks odd - but it's not overly burdensome and it ensures we can remain
+ * compatible with old userspace.
+ */
+struct drm_asahi_cmd_render {
+	/** @flags: Combination of drm_asahi_render_flags flags. */
+	__u64 flags;
+
+	/**
+	 * @ctrl_stream_base: VDM_CTRL_STREAM_BASE register value. GPU address
+	 * to the beginning of the VDM control stream.
+	 *
+	 * We don't prefix the name with "VDM", since render commands have only
+	 * a VDM control stream.
+	 */
+	__u64 ctrl_stream_base;
+
+	/**
+	 * @usc_exec_base: USC_EXEC_BASE_TA and USC_EXEC_BASE_ISP register
+	 * value. GPU base address for all USC binaries (shaders) used in this
+	 * command. USC addresses are 32-bit relative to this 64-bit base.
+	 */
+	__u64 usc_exec_base;
+
+	/** @vertex_helper: Helper program used for the vertex shader */
+	struct drm_asahi_helper_program vertex_helper;
+
+	/** @fragment_helper: Helper program used for the fragment shader */
+	struct drm_asahi_helper_program fragment_helper;
+
+	/**
+	 * @isp_scissor_base: ISP_SCISSOR_BASE register value. GPU address of an
+	 * array of scissor descriptors indexed in the render pass.
+	 */
+	__u64 isp_scissor_base;
+
+	/**
+	 * @isp_dbias_base: ISP_DBIAS_BASE register value. GPU address of an
+	 * array of depth bias values indexed in the render pass.
+	 */
+	__u64 isp_dbias_base;
+
+	/**
+	 * @isp_oclqry_base: ISP_OCLQRY_BASE register value. GPU address of an
+	 * array of occlusion query results written by the render pass.
+	 */
+	__u64 isp_oclqry_base;
+
+	/** @depth: Physical buffers backing the logical depth buffer */
+	struct drm_asahi_zls_buffer depth;
+
+	/** @stencil: Physical buffers backing the logical stencil buffer */
+	struct drm_asahi_zls_buffer stencil;
+
+	/** @zls_ctrl: ZLS_CTRL register value */
+	__u64 zls_ctrl;
+
+	/** @ppp_multisamplectl: PPP_MULTISAMPLECTL register value */
+	__u64 ppp_multisamplectl;
+
+	/**
+	 * @sampler_heap: Base address of the sampler heap. This heap is used
+	 * for both vertex shaders and fragment shaders. The registers are
+	 * per-stage, but there is no known use case for separate heaps.
+	 */
+	__u64 sampler_heap;
+
+	/** @ppp_ctrl: PPP_CTRL register value */
+	__u32 ppp_ctrl;
+
+	/** @width_px: Framebuffer width in pixels */
+	__u16 width_px;
+
+	/** @height_px: Framebuffer height in pixels */
+	__u16 height_px;
+
+	/** @layers: Number of layers in the framebuffer */
+	__u16 layers;
+
+	/** @sampler_count: Number of samplers in the sampler heap. */
+	__u16 sampler_count;
+
+	/** @utile_width_px: Width of a logical tilebuffer tile in pixels */
+	__u8 utile_width_px;
+
+	/** @utile_height_px: Height of a logical tilebuffer tile in pixels */
+	__u8 utile_height_px;
+
+	/** @samples: # of samples in the framebuffer. Must be 1, 2, or 4. */
+	__u8 samples;
+
+	/** @sample_size_B: # of bytes in the tilebuffer required per sample. */
+	__u8 sample_size_B;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/**
+	 * @isp_merge_upper_x: 32-bit float used in the
+	 * hardware triangle merging. Calculate as:
+	 *
+	 *	tan(60 deg) * width
+	 *
+	 * Making these values UAPI avoids requiring floating-point calculations
+	 * in the kernel in the hot path.
+	 */
+	__u32 isp_merge_upper_x;
+
+	/**
+	 * @isp_merge_upper_y: 32-bit float. Calculate as:
+	 *
+	 *	tan(60 deg) * height
+	 *
+	 * See @isp_merge_upper_x.
+	 */
+	__u32 isp_merge_upper_y;
+
+	/**
+	 * @bg: Background program ran at the start of each tile at the start of
+	 * the render pass.
+	 */
+	struct drm_asahi_bg_eot bg;
+
+	/**
+	 * @eot: End-of-tile program ran at the end of each tile at the end of
+	 * the render pass.
+	 */
+	struct drm_asahi_bg_eot eot;
+
+	/**
+	 * @partial_bg: Background program ran at the start of each tile when
+	 * resuming the render pass during a partial render.
+	 */
+	struct drm_asahi_bg_eot partial_bg;
+
+	/**
+	 * @partial_eot: End-of-tile program ran at the end of each tile when
+	 * pausing the render pass during a partial render.
+	 */
+	struct drm_asahi_bg_eot partial_eot;
+
+	/**
+	 * @isp_zls_pixels: ISP_ZLS_PIXELS register value. This contains the
+	 * depth buffer width/height, which is allowed to differ from the
+	 * framebuffer width/height.
+	 */
+	__u32 isp_zls_pixels;
+
+	/**
+	 * @isp_bgobjdepth: ISP_BGOBJDEPTH register value. This is the depth
+	 * buffer clear value, encoded in the depth buffer's format: either a
+	 * 32-bit float or a 16-bit unorm (with upper bits zeroed).
+	 */
+	__u32 isp_bgobjdepth;
+
+	/**
+	 * @isp_bgobjvals: ISP_BGOBJVALS register value. The bottom 8-bits
+	 * contain the stencil buffer clear value.
+	 */
+	__u32 isp_bgobjvals;
+
+	/** @ts_vtx: Timestamps for the vertex portion of the render */
+	struct drm_asahi_timestamps ts_vtx;
+
+	/** @ts_frag: Timestamps for the fragment portion of the render */
+	struct drm_asahi_timestamps ts_frag;
+};
+
+/**
+ * struct drm_asahi_cmd_compute - Command to submit compute
+ *
+ * This command submits a control stream consisting of compute dispatches. There
+ * is essentially no limit on how many compute dispatches may be included in a
+ * single compute command, although timestamping only occurs at command
+ * granularity.
+ */
+struct drm_asahi_cmd_compute {
+	/** @flags: MBZ */
+	__u64 flags;
+
+	/**
+	 * @ctrl_stream_base: CDM_CTRL_STREAM_BASE register value. GPU address
+	 * to the beginning of the CDM control stream.
+	 *
+	 * We don't prefix the name with "CDM", since render commands have only
+	 * a CDM control stream.
+	 */
+	__u64 ctrl_stream_base;
+
+	/**
+	 * @ctrl_stream_end: GPU base address to the end of the hardware control
+	 * stream. Note this only considers the first contiguous segment of the
+	 * control stream, as the stream might jump elsewhere.
+	 */
+	__u64 ctrl_stream_end;
+
+	/**
+	 * @usc_exec_base: USC_EXEC_BASE_CP register value. GPU Base address for
+	 * all USC binaries (shaders) used in this command. USC addresses are
+	 * 32-bit relative to this 64-bit base.
+	 */
+	__u64 usc_exec_base;
+
+	/**
+	 * @sampler_heap: Base address of the sampler heap. This heap is used
+	 * for both vertex shaders and fragment shaders. The registers are
+	 * per-stage, but there is no known use case for separate heaps.
+	 */
+	__u64 sampler_heap;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @sampler_count: Number of samplers in the sampler heap. */
+	__u32 sampler_count;
+
+	/** @helper: Helper program used for this compute shader */
+	struct drm_asahi_helper_program helper;
+
+	/** @ts: Timestamps for the compute command */
+	struct drm_asahi_timestamps ts;
+};
+
+/**
+ * struct drm_asahi_get_time - Arguments passed to DRM_IOCTL_ASAHI_GET_TIME
+ */
+struct drm_asahi_get_time {
+	/** @flags: MBZ. */
+	__u64 flags;
+
+	/** @gpu_timestamp: On return, the current GPU timestamp */
+	__u64 gpu_timestamp;
+};
+
+/**
+ * DRM_IOCTL_ASAHI() - Build an Asahi IOCTL number
+ * @__access: Access type. Must be R, W or RW.
+ * @__id: One of the DRM_ASAHI_xxx id.
+ * @__type: Suffix of the type being passed to the IOCTL.
+ *
+ * Don't use this macro directly, use the DRM_IOCTL_ASAHI_xxx
+ * values instead.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define DRM_IOCTL_ASAHI(__access, __id, __type) \
+	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_ASAHI_ ## __id, \
+			   struct drm_asahi_ ## __type)
+
+/* Note: this is an enum so that it can be resolved by Rust bindgen. */
+enum {
+	DRM_IOCTL_ASAHI_GET_PARAMS       = DRM_IOCTL_ASAHI(WR, GET_PARAMS, get_params),
+	DRM_IOCTL_ASAHI_VM_CREATE        = DRM_IOCTL_ASAHI(WR, VM_CREATE, vm_create),
+	DRM_IOCTL_ASAHI_VM_DESTROY       = DRM_IOCTL_ASAHI(W, VM_DESTROY, vm_destroy),
+	DRM_IOCTL_ASAHI_GEM_CREATE       = DRM_IOCTL_ASAHI(WR, GEM_CREATE, gem_create),
+	DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET  = DRM_IOCTL_ASAHI(WR, GEM_MMAP_OFFSET, gem_mmap_offset),
+	DRM_IOCTL_ASAHI_GEM_BIND         = DRM_IOCTL_ASAHI(W, GEM_BIND, gem_bind),
+	DRM_IOCTL_ASAHI_QUEUE_CREATE     = DRM_IOCTL_ASAHI(WR, QUEUE_CREATE, queue_create),
+	DRM_IOCTL_ASAHI_QUEUE_DESTROY    = DRM_IOCTL_ASAHI(W, QUEUE_DESTROY, queue_destroy),
+	DRM_IOCTL_ASAHI_SUBMIT           = DRM_IOCTL_ASAHI(W, SUBMIT, submit),
+	DRM_IOCTL_ASAHI_GET_TIME         = DRM_IOCTL_ASAHI(WR, GET_TIME, get_time),
+	DRM_IOCTL_ASAHI_GEM_BIND_OBJECT  = DRM_IOCTL_ASAHI(WR, GEM_BIND_OBJECT, gem_bind_object),
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _ASAHI_DRM_H_ */

---
base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2
change-id: 20250307-agx-uapi-930579437f19

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

