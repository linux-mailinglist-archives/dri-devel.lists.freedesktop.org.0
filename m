Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB92865AD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 19:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BA46E927;
	Wed,  7 Oct 2020 17:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2745E6E902
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jNjvkWl3Ro3OYCw1CzPg5Q9N3r9p/TmjDfeS4m1i9fo=; b=SVobqRI5w6foYs+8hGo+cWIJk/
 +PXxx37huU8AO+8e7njNwniNZPNa7qcS53wZiZngLzerOhmbSrsbYZ8lSjF/+Zb7gcg7++z6OPF12
 YaOw9hyFXVycPw+mEFkg4DYBqYY6P2jgcjKPep2rzyyi13KjFBY2ffqsg+SorbAYDeLXJc+/B75eo
 6HMdDYMrbmn8cJPx/FVKVkRy6ex6FWGRciAMuRw6LEJ5hO1L+xab7SrVBNzfrBUH30UAkykEb0jVI
 B9pf39ah05vj9URPrE02J5ZmK9QIWe0TcQ7BkA8VguuNURmyhZyah9FB9DWXtEyuh9GFM7XaJijca
 OWV/Yz3A==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kQD40-0006P9-Rm; Wed, 07 Oct 2020 20:17:16 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 15/20] drm/tegra: Add new UAPI to header
Date: Wed,  7 Oct 2020 20:12:33 +0300
Message-Id: <20201007171238.1795964-16-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the tegra_drm.h UAPI header, adding the new proposed UAPI.
The old staging UAPI is left in for now, with minor modification
to avoid name collisions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Remove timeout field
* Inline the syncpt_incrs array to the submit structure
* Remove WRITE_RELOC (it is now implicit)
---
 include/uapi/drm/tegra_drm.h | 420 ++++++++++++++++++++++++++++++++---
 1 file changed, 393 insertions(+), 27 deletions(-)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index c4df3c3668b3..9588d5e3308f 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -1,24 +1,5 @@
-/*
- * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
+/* Copyright (c) 2012-2020 NVIDIA Corporation */
 
 #ifndef _UAPI_TEGRA_DRM_H_
 #define _UAPI_TEGRA_DRM_H_
@@ -29,6 +10,8 @@
 extern "C" {
 #endif
 
+/* TegraDRM legacy UAPI. Only enabled with STAGING */
+
 #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
 #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
 
@@ -644,13 +627,13 @@ struct drm_tegra_gem_get_flags {
 	__u32 flags;
 };
 
-#define DRM_TEGRA_GEM_CREATE		0x00
-#define DRM_TEGRA_GEM_MMAP		0x01
+#define DRM_TEGRA_GEM_CREATE_LEGACY	0x00
+#define DRM_TEGRA_GEM_MMAP_LEGACY	0x01
 #define DRM_TEGRA_SYNCPT_READ		0x02
 #define DRM_TEGRA_SYNCPT_INCR		0x03
 #define DRM_TEGRA_SYNCPT_WAIT		0x04
-#define DRM_TEGRA_OPEN_CHANNEL		0x05
-#define DRM_TEGRA_CLOSE_CHANNEL		0x06
+#define DRM_TEGRA_OPEN_CHANNEL	        0x05
+#define DRM_TEGRA_CLOSE_CHANNEL	        0x06
 #define DRM_TEGRA_GET_SYNCPT		0x07
 #define DRM_TEGRA_SUBMIT		0x08
 #define DRM_TEGRA_GET_SYNCPT_BASE	0x09
@@ -659,8 +642,8 @@ struct drm_tegra_gem_get_flags {
 #define DRM_TEGRA_GEM_SET_FLAGS		0x0c
 #define DRM_TEGRA_GEM_GET_FLAGS		0x0d
 
-#define DRM_IOCTL_TEGRA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_CREATE, struct drm_tegra_gem_create)
-#define DRM_IOCTL_TEGRA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_MMAP, struct drm_tegra_gem_mmap)
+#define DRM_IOCTL_TEGRA_GEM_CREATE_LEGACY DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_CREATE_LEGACY, struct drm_tegra_gem_create)
+#define DRM_IOCTL_TEGRA_GEM_MMAP_LEGACY DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_MMAP_LEGACY, struct drm_tegra_gem_mmap)
 #define DRM_IOCTL_TEGRA_SYNCPT_READ DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SYNCPT_READ, struct drm_tegra_syncpt_read)
 #define DRM_IOCTL_TEGRA_SYNCPT_INCR DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SYNCPT_INCR, struct drm_tegra_syncpt_incr)
 #define DRM_IOCTL_TEGRA_SYNCPT_WAIT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SYNCPT_WAIT, struct drm_tegra_syncpt_wait)
@@ -674,6 +657,389 @@ struct drm_tegra_gem_get_flags {
 #define DRM_IOCTL_TEGRA_GEM_SET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_SET_FLAGS, struct drm_tegra_gem_set_flags)
 #define DRM_IOCTL_TEGRA_GEM_GET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_GET_FLAGS, struct drm_tegra_gem_get_flags)
 
+/* New TegraDRM UAPI */
+
+struct drm_tegra_channel_open {
+	/**
+	 * @host1x_class: [in]
+	 *
+	 * Host1x class of the engine that will be programmed using this
+	 * channel.
+	 */
+	__u32 host1x_class;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @channel_ctx: [out]
+	 *
+	 * Opaque identifier corresponding to the opened channel.
+	 */
+	__u32 channel_ctx;
+
+	/**
+	 * @hardware_version: [out]
+	 *
+	 * Version of the engine hardware. This can be used by userspace
+	 * to determine how the engine needs to be programmed.
+	 */
+	__u32 hardware_version;
+
+	__u32 reserved[2];
+};
+
+struct drm_tegra_channel_close {
+	/**
+	 * @channel_ctx: [in]
+	 *
+	 * Identifier of the channel to close.
+	 */
+	__u32 channel_ctx;
+
+	__u32 reserved[1];
+};
+
+#define DRM_TEGRA_CHANNEL_MAP_READWRITE			(1<<0)
+
+struct drm_tegra_channel_map {
+	/**
+	 * @channel_ctx: [in]
+	 *
+	 * Identifier of the channel to which make memory available for.
+	 */
+	__u32 channel_ctx;
+
+	/**
+	 * @handle: [in]
+	 *
+	 * GEM handle of the memory to map.
+	 */
+	__u32 handle;
+
+	/**
+	 * @offset: [in]
+	 *
+	 * Offset in the GEM handle's underlying memory to start the
+	 * mapping from.
+	 */
+	__u64 offset;
+
+	/**
+	 * @length: [in]
+	 *
+	 * Length of memory to map.
+	 */
+	__u64 length;
+
+	/**
+	 * @iova: [out]
+	 *
+	 * IOVA of mapped memory. Only available if hardware memory
+	 * isolation is supported. If provided, userspace can program this
+	 * address directly to the engine to skip using relocations.
+	 *
+	 * Will be set to U64_MAX if unavailable.
+	 */
+	__u64 iova;
+
+	/**
+	 * @mapping_id: [out]
+	 *
+	 * Identifier corresponding to the mapping, to be used for
+	 * relocations or unmapping later.
+	 */
+	__u32 mapping_id;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	__u32 reserved[2];
+};
+
+struct drm_tegra_channel_unmap {
+	/**
+	 * @channel_ctx: [in]
+	 *
+	 * Channel identifier of the channel to unmap memory from.
+	 */
+	__u32 channel_ctx;
+
+	/**
+	 * @mapping_id: [in]
+	 *
+	 * Mapping identifier of the memory mapping to unmap.
+	 */
+	__u32 mapping_id;
+
+	__u32 reserved[2];
+};
+
+/* Submission */
+
+/**
+ * Specify that bit 39 of the patched-in address should be set to
+ * trigger layout swizzling between Tegra and non-Tegra Blocklinear
+ * layout on systems that store surfaces in system memory in non-Tegra
+ * Blocklinear layout.
+ */
+#define DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR		(1<<0)
+/**
+ * Specify that any implicit fences required to read this buffer
+ * should be waited before executing the job.
+ */
+#define DRM_TEGRA_SUBMIT_BUF_RESV_READ			(1<<1)
+/**
+ * Specify that any implicit fences required to write this buffer
+ * should be waited before executing the job.
+ */
+#define DRM_TEGRA_SUBMIT_BUF_RESV_WRITE			(1<<2)
+
+struct drm_tegra_submit_buf {
+	/**
+	 * @mapping_id: [in]
+	 *
+	 * Identifier of the mapping to use in the submission.
+	 */
+	__u32 mapping_id;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * Information for relocation patching. Relocation patching will
+	 * be done if the MAP IOCTL that created `mapping_id` did not
+	 * return an IOVA. If an IOVA was returned, the application is
+	 * responsible for patching the address into the gather.
+	 */
+	struct {
+		/**
+		 * @target_offset: [in]
+		 *
+		 * Offset from the start of the mapping of the data whose
+		 * address is to be patched into the gather.
+		 */
+		__u64 target_offset;
+
+		/**
+		 * @gather_offset_words: [in]
+		 *
+		 * Offset in words from the start of the gather data to
+		 * where the address should be patched into.
+		 */
+		__u32 gather_offset_words;
+
+		/**
+		 * @shift: [in]
+		 *
+		 * Number of bits the address should be shifted right before
+		 * patching in.
+		 */
+		__u32 shift;
+	} reloc;
+
+	__u32 reserved[2];
+};
+
+#define DRM_TEGRA_SUBMIT_SYNCPT_INCR_CREATE_SYNC_FILE  (1<<0)
+
+struct drm_tegra_submit_syncpt_incr {
+	/**
+	 * @syncpt_fd: [in]
+	 *
+	 * Syncpoint file descriptor of the syncpoint that the job will
+	 * increment.
+	 */
+	__s32 syncpt_fd;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @num_incrs: [in]
+	 *
+	 * Number of times the job will increment this syncpoint.
+	 */
+	__u32 num_incrs;
+
+	/**
+	 * @fence_value: [out]
+	 *
+	 * Value the syncpoint will have once the job has completed all
+	 * its specified syncpoint increments.
+	 *
+	 * Note that the kernel may increment the syncpoint before or after
+	 * the job. These increments are not reflected in this field.
+	 *
+	 * If the job hangs or times out, not all of the increments may
+	 * get executed.
+	 */
+	__u32 fence_value;
+
+	/**
+	 * @sync_file_fd: [out]
+	 *
+	 * Created sync_file file descriptor corresponding to the threshold
+	 * specified by `fence_value`. Only set if the CREATE_SYNC_FILE
+	 * flag is specified.
+	 */
+	__s32 sync_file_fd;
+
+	__u32 reserved[3];
+};
+
+/**
+ * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
+ * buffer. Each GATHER_UPTR command uses successive words from the buffer.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
+/**
+ * Wait for the fence represented by the sync_file file descriptor to be
+ * signaled before continuing with further commands. This command may be
+ * executed before submission of the job to hardware.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNC_FILE		2
+
+/**
+ * If set, the driver is allowed to skip execution of this command if
+ * the previous job executed by the engine was from the same channel
+ * context as this job.
+ */
+#define DRM_TEGRA_SUBMIT_CONTEXT_SETUP			(1<<0)
+
+struct drm_tegra_submit_cmd_gather_uptr {
+	__u32 words;
+	__u32 reserved[3];
+};
+
+struct drm_tegra_submit_cmd_wait_syncpt {
+	__u32 id;
+	__u32 threshold;
+	__u32 reserved[2];
+};
+
+struct drm_tegra_submit_cmd_wait_sync_file {
+	__s32 fd;
+	__u32 reserved[3];
+};
+
+struct drm_tegra_submit_cmd {
+	/**
+	 * @type: [in]
+	 *
+	 * Command type to execute. One of the DRM_TEGRA_SUBMIT_CMD*
+	 * defines.
+	 */
+	__u32 type;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	union {
+		struct drm_tegra_submit_cmd_gather_uptr gather_uptr;
+		struct drm_tegra_submit_cmd_wait_syncpt wait_syncpt;
+		struct drm_tegra_submit_cmd_wait_sync_file wait_sync_file;
+		__u32 reserved[4];
+	};
+};
+
+struct drm_tegra_channel_submit {
+	/**
+	 * @channel_ctx: [in]
+	 *
+	 * Identifier of the channel to submit this job to.
+	 */
+	__u32 channel_ctx;
+
+	__u32 reserved0;
+
+	/**
+	 * @bufs_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_buf structures.
+	 */
+	__u64 bufs_ptr;
+
+	/**
+	 * @cmds_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_cmd structures.
+	 */
+	__u64 cmds_ptr;
+
+	/**
+	 * @gather_data_ptr: [in]
+	 *
+	 * Pointer to an array of Host1x opcodes to be used by GATHER_UPTR
+	 * commands.
+	 */
+	__u64 gather_data_ptr;
+
+	/**
+	 * @num_bufs: [in]
+	 *
+	 * Number of elements in the `bufs_ptr` array.
+	 */
+	__u32 num_bufs;
+
+	/**
+	 * @num_cmds: [in]
+	 *
+	 * Number of elements in the `cmds_ptr` array.
+	 */
+	__u32 num_cmds;
+
+	/**
+	 * @gather_data_words: [in]
+	 *
+	 * Number of 32-bit words in the `gather_data_ptr` array.
+	 */
+	__u32 gather_data_words;
+
+	__u32 reserved1;
+
+	/**
+	 * @syncpt_incrs: [in,out]
+	 *
+	 * Information about each distinct syncpoint the job will increment.
+	 */
+	struct drm_tegra_submit_syncpt_incr syncpt_incrs[2];
+};
+
+#define DRM_IOCTL_TEGRA_CHANNEL_OPEN     DRM_IOWR(DRM_COMMAND_BASE + 0x10, struct drm_tegra_channel_open)
+#define DRM_IOCTL_TEGRA_CHANNEL_CLOSE    DRM_IOWR(DRM_COMMAND_BASE + 0x11, struct drm_tegra_channel_close)
+#define DRM_IOCTL_TEGRA_CHANNEL_MAP      DRM_IOWR(DRM_COMMAND_BASE + 0x12, struct drm_tegra_channel_map)
+#define DRM_IOCTL_TEGRA_CHANNEL_UNMAP    DRM_IOWR(DRM_COMMAND_BASE + 0x13, struct drm_tegra_channel_unmap)
+#define DRM_IOCTL_TEGRA_CHANNEL_SUBMIT   DRM_IOWR(DRM_COMMAND_BASE + 0x14, struct drm_tegra_channel_submit)
+
+#define DRM_IOCTL_TEGRA_GEM_CREATE       DRM_IOWR(DRM_COMMAND_BASE + 0x15, struct drm_tegra_gem_create)
+#define DRM_IOCTL_TEGRA_GEM_MMAP         DRM_IOWR(DRM_COMMAND_BASE + 0x16, struct drm_tegra_gem_mmap)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
