Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C850F2F12C9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4855F6E098;
	Mon, 11 Jan 2021 13:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E1E6E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GMTuGcVobGoCpe0N7Lt/EQB9YnWIJ0AExbU9sJWvfQs=; b=P+xREur0dUmD6H0sXJnbjozWy7
 xM7DHF+/tvypXtyoECGr2fEJuE8sK2fGEGQrLqlW+hQAmUB8ou/RjmPqK1/QD8c/7/n4BlxzIa69H
 1Tg5uujQ71O1M2uvEdV4DHKeI5aD/CqEY0T5tBnupjmf/Jr82aDDLOKkgIavONhj5is9wY8Q+qbsQ
 zG7H4RVRf4OmDVbrvZVg87ugAVfG2c55HN9yn4leN9kcP3bX0QQQ2N1Wo/Xe92HBo+kXzL/gQA2t9
 irwuRyLDZFFllRKgcC0IA8s5wdushRUmCpJigsM7E5p5mIICgOf+4UDCaws5mQ3AJC7tg+QurRKVc
 DHxSaX1Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kywo7-0002tl-C9; Mon, 11 Jan 2021 15:00:27 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
Date: Mon, 11 Jan 2021 15:00:13 +0200
Message-Id: <20210111130019.3515669-16-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
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
v4:
* Remove features that are not strictly necessary
* Remove padding/reserved fields in IOCTL structs where
  DRM's zero extension feature allows future expansion
v3:
* Remove timeout field
* Inline the syncpt_incrs array to the submit structure
* Remove WRITE_RELOC (it is now implicit)
---
 include/uapi/drm/tegra_drm.h | 338 ++++++++++++++++++++++++++++++++---
 1 file changed, 311 insertions(+), 27 deletions(-)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index c4df3c3668b3..014bc393c298 100644
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
@@ -674,6 +657,307 @@ struct drm_tegra_gem_get_flags {
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
+};
+
+struct drm_tegra_channel_close {
+	/**
+	 * @channel_ctx: [in]
+	 *
+	 * Identifier of the channel to close.
+	 */
+	__u32 channel_ctx;
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
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @mapping_id: [out]
+	 *
+	 * Identifier corresponding to the mapping, to be used for
+	 * relocations or unmapping later.
+	 */
+	__u32 mapping_id;
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
+};
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
+	 * @syncpt_incr: [in,out]
+	 *
+	 * Information about the syncpoint the job will increment.
+	 */
+	struct drm_tegra_submit_syncpt_incr syncpt_incr;
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
