Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48849D17EE5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B192C10E495;
	Tue, 13 Jan 2026 10:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="pwNSCw+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66DF10E492
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D5o3eK3118609; Tue, 13 Jan 2026 10:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=f
 Jm9vmmZLy2U33YDNX0kpovc6Ih90z166NKY84u6Ulw=; b=pwNSCw+oy9rCfCOtA
 Lzav+tWFBCvek01ZyrXqoBqUykoFCO6ND0uvfG9PQtbE0MjWwFXmC4EK4SfihC3e
 F7d/uB+ZAKd9TW98R5gE0Kc1LL63GVr7t93s2JSTKu2zyGfBLRzdVj8EQAolcQ1y
 D68gV9Xo61kcMiVag8o/4sR+SKZktXCm7gkXfiNUYe6xonNcNfYssYp3+gNXkM0X
 IYo6iSKLHGeIPNJ1GLydyXSqdJ12rvbp4LYH5HbWrVK/T6ZIvnEXW9o42jto4ZyZ
 7hLEQ5/OQortKU1MoaO7SOW1lvcLmjjXu97YuzyzMKBD4RMJYVPpEEq/M2CvOOjF
 CQYOA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:16:57 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:55 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 13 Jan 2026 10:16:39 +0000
Subject: [PATCH 1/6] drm/imagination: Simplify module parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-device-support-info-v1-1-91e5db7f7294@imgtec.com>
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
In-Reply-To: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15589;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=6aqVeJpps/3ZhmTvQaT6R5v+8BB2w0ReDbd5719z0LU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU+zY7TdVBdYWbnwVf8k+YRKlReai4PW3tzENmHlh
 BQ13lvNHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjARoW8M/yOt1BWNvP/NM5gi
 o8677UOVTY/vpxVKtb87k+0WXjzO/Zjhf1ZUYmxx8Z1JS0983FfgWtv1K/H/VeaHXN0+exZYt2s
 95gYA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfX7JbDwh8H8FHh
 ZS169yFfKKtZRJNNqXTh4TWrAw5ZXupf46yLuJX1S7st2k5nV6xr1byo9TknY90Dy5LwFYhIwc+
 mMMRGjUMsZlInxy2Anr+DMm/uhp505toEFuZ+6Y1oz6Bl1X9mMEhYT/HUZ3CuCwQGWNFSyyBWdg
 799vxa/J+AUWX1GzytuTxJEONrEMN51Jl8jfde8/NH9lFbUJ84yrTKUNcqdU0jtTETOUw4SRuBQ
 uV8IuuWFzuJa1dnOc3yV+lkBXfR46upkFE+8erjZwOuhgY8E5guo+Ug0r/nhBH5wjqugBcvulHo
 y1V8T4fMlelfXHWavxyCFoDJa0upuVIbvPwWgRB+xM9NWCP9MGHaYgsfm3PSNl+ftJHnqatiFwh
 s/xQN/67HpdHEucBMtxV0QJb4qRqsg0Z3kMP8vcF4uVJnwY+/UednLGLbLhfbe1t4R6/5azrwld
 EeMGcZajbfqDxymY0Tg==
X-Proofpoint-GUID: _S6YtbFmLBAd7LQnxJQ-5T1VEfaaVS-e
X-Proofpoint-ORIG-GUID: _S6YtbFmLBAd7LQnxJQ-5T1VEfaaVS-e
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b99 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=6dx0svsTsglNHlDHw4cA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

We had a whole load of bloaty infrastructure to deal with module parameters
in a way that's wholly unnecessary. Strip it all back to basics to make
adding new parameters less of a headache.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile       |   1 -
 drivers/gpu/drm/imagination/pvr_debugfs.c  |   2 -
 drivers/gpu/drm/imagination/pvr_device.c   |   9 --
 drivers/gpu/drm/imagination/pvr_device.h   |  10 --
 drivers/gpu/drm/imagination/pvr_fw_trace.c |  46 ++++++++-
 drivers/gpu/drm/imagination/pvr_fw_trace.h |   3 -
 drivers/gpu/drm/imagination/pvr_params.c   | 147 -----------------------------
 drivers/gpu/drm/imagination/pvr_params.h   |  72 --------------
 8 files changed, 42 insertions(+), 248 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 7cca66f00a38a..ab63eac9ba7f7 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -20,7 +20,6 @@ powervr-y := \
 	pvr_hwrt.o \
 	pvr_job.o \
 	pvr_mmu.o \
-	pvr_params.o \
 	pvr_power.o \
 	pvr_queue.o \
 	pvr_stream.o \
diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.c b/drivers/gpu/drm/imagination/pvr_debugfs.c
index c7ce7daaa87a0..ebdb05de40728 100644
--- a/drivers/gpu/drm/imagination/pvr_debugfs.c
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.c
@@ -5,7 +5,6 @@
 
 #include "pvr_device.h"
 #include "pvr_fw_trace.h"
-#include "pvr_params.h"
 
 #include <linux/dcache.h>
 #include <linux/debugfs.h>
@@ -18,7 +17,6 @@
 #include <drm/drm_print.h>
 
 static const struct pvr_debugfs_entry pvr_debugfs_entries[] = {
-	{"pvr_params", pvr_params_debugfs_init},
 	{"pvr_fw", pvr_fw_trace_debugfs_init},
 };
 
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 78d6b8a0a4506..abe8ad1d447ac 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,7 +5,6 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
-#include "pvr_params.h"
 #include "pvr_power.h"
 #include "pvr_queue.h"
 #include "pvr_rogue_cr_defs.h"
@@ -607,14 +606,6 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	/* Get the platform-specific data based on the compatible string. */
 	pvr_dev->device_data = of_device_get_match_data(dev);
 
-	/*
-	 * Setup device parameters. We do this first in case other steps
-	 * depend on them.
-	 */
-	err = pvr_device_params_init(&pvr_dev->params);
-	if (err)
-		return err;
-
 	/* Enable and initialize clocks required for the device to operate. */
 	err = pvr_device_clk_init(pvr_dev);
 	if (err)
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ec53ff2755418..d0e61923fd9b4 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -7,7 +7,6 @@
 #include "pvr_ccb.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
-#include "pvr_params.h"
 #include "pvr_rogue_fwif_stream.h"
 #include "pvr_stream.h"
 
@@ -192,15 +191,6 @@ struct pvr_device {
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
 
-	/**
-	 * @params: Device-specific parameters.
-	 *
-	 *          The values of these parameters are initialized from the
-	 *          defaults specified as module parameters. They may be
-	 *          modified at runtime via debugfs (if enabled).
-	 */
-	struct pvr_device_params params;
-
 	/** @stream_musthave_quirks: Bit array of "must-have" quirks for stream commands. */
 	u32 stream_musthave_quirks[PVR_STREAM_TYPE_MAX][PVR_STREAM_EXTHDR_TYPE_MAX];
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 8a56952f6730e..a607e5b108915 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -14,9 +14,26 @@
 #include <linux/build_bug.h>
 #include <linux/dcache.h>
 #include <linux/debugfs.h>
+#include <linux/moduleparam.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
+/*
+ * Don't gate this behind CONFIG_DEBUG_FS so that it can be used as an initial
+ * value without further conditional code...
+ */
+static u32 pvr_fw_trace_init_mask;
+
+/*
+ * ...but do only expose the module parameter if debugfs is enabled, since
+ * there's no reason to turn on fw_trace without it.
+ */
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+module_param_named(init_fw_trace_mask, pvr_fw_trace_init_mask, hexint, 0600);
+MODULE_PARM_DESC(init_fw_trace_mask,
+		 "Enable FW trace for the specified groups at device init time");
+#endif
+
 static void
 tracebuf_ctrl_init(void *cpu_ptr, void *priv)
 {
@@ -126,6 +143,8 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
  * @group_mask: New log group mask.
  *
  * Returns:
+ *  * 0 if the provided @group_mask is the same as the current value (this is a
+ *    short-circuit evaluation),
  *  * 0 on success,
  *  * Any error returned by pvr_kccb_send_cmd(), or
  *  * -%EIO if the device is lost.
@@ -138,6 +157,10 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 	int idx;
 	int err;
 
+	/* No change in group_mask => nothing to update. */
+	if (fw_trace->group_mask == group_mask)
+		return 0;
+
 	if (group_mask)
 		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_TRACE | group_mask;
 	else
@@ -437,13 +460,25 @@ static const struct file_operations pvr_fw_trace_fops = {
 	.release = fw_trace_release,
 };
 
-void
-pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask, u32 new_mask)
+static int pvr_fw_trace_mask_get(void *data, u64 *value)
+{
+	struct pvr_device *pvr_dev = data;
+
+	*value = pvr_dev->fw_dev.fw_trace.group_mask;
+
+	return 0;
+}
+
+static int pvr_fw_trace_mask_set(void *data, u64 value)
 {
-	if (IS_ENABLED(CONFIG_DEBUG_FS) && old_mask != new_mask)
-		update_logtype(pvr_dev, new_mask);
+	struct pvr_device *pvr_dev = data;
+
+	return update_logtype(pvr_dev, (u32)value);
 }
 
+DEFINE_DEBUGFS_ATTRIBUTE(pvr_fw_trace_mask_fops, pvr_fw_trace_mask_get,
+			 pvr_fw_trace_mask_set, "0x%08llx\n");
+
 void
 pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
 {
@@ -463,4 +498,7 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
 				    &fw_trace->buffers[thread_nr],
 				    &pvr_fw_trace_fops);
 	}
+
+	debugfs_create_file("trace_mask", 0600, dir, fw_trace,
+			    &pvr_fw_trace_mask_fops);
 }
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.h b/drivers/gpu/drm/imagination/pvr_fw_trace.h
index 1d0ef937427a5..0cc57f66675d8 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.h
@@ -68,9 +68,6 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev);
 /* Forward declaration from <linux/dcache.h>. */
 struct dentry;
 
-void pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask,
-			      u32 new_mask);
-
 void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
 
 #endif /* PVR_FW_TRACE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_params.c b/drivers/gpu/drm/imagination/pvr_params.c
deleted file mode 100644
index b91759f362c57..0000000000000
--- a/drivers/gpu/drm/imagination/pvr_params.c
+++ /dev/null
@@ -1,147 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only OR MIT
-/* Copyright (c) 2023 Imagination Technologies Ltd. */
-
-#include "pvr_params.h"
-
-#include <linux/cache.h>
-#include <linux/moduleparam.h>
-
-static struct pvr_device_params pvr_device_param_defaults __read_mostly = {
-#define X(type_, name_, value_, desc_, ...) .name_ = (value_),
-	PVR_DEVICE_PARAMS
-#undef X
-};
-
-#define PVR_DEVICE_PARAM_NAMED(name_, type_, desc_) \
-	module_param_named(name_, pvr_device_param_defaults.name_, type_, \
-			   0400);                                         \
-	MODULE_PARM_DESC(name_, desc_);
-
-/*
- * This list of defines must contain every type specified in "pvr_params.h" as
- * ``PVR_PARAM_TYPE_*_C``.
- */
-#define PVR_PARAM_TYPE_X32_MODPARAM uint
-
-#define X(type_, name_, value_, desc_, ...) \
-	PVR_DEVICE_PARAM_NAMED(name_, PVR_PARAM_TYPE_##type_##_MODPARAM, desc_);
-PVR_DEVICE_PARAMS
-#undef X
-
-int
-pvr_device_params_init(struct pvr_device_params *params)
-{
-	/*
-	 * If heap-allocated parameters are added in the future (e.g.
-	 * modparam's charp type), they must be handled specially here (via
-	 * kstrdup() in the case of charp). Since that's not necessary yet,
-	 * a straight copy will do for now. This change will also require a
-	 * pvr_device_params_fini() function to free any heap-allocated copies.
-	 */
-
-	*params = pvr_device_param_defaults;
-
-	return 0;
-}
-
-#if defined(CONFIG_DEBUG_FS)
-#include "pvr_device.h"
-
-#include <linux/dcache.h>
-#include <linux/debugfs.h>
-#include <linux/export.h>
-#include <linux/fs.h>
-#include <linux/stddef.h>
-
-/*
- * This list of defines must contain every type specified in "pvr_params.h" as
- * ``PVR_PARAM_TYPE_*_C``.
- */
-#define PVR_PARAM_TYPE_X32_FMT "0x%08llx"
-
-#define X_SET(name_, mode_) X_SET_##mode_(name_)
-#define X_SET_DEF(name_, update_, mode_) X_SET_DEF_##mode_(name_, update_)
-
-#define X_SET_RO(name_) NULL
-#define X_SET_RW(name_) __pvr_device_param_##name_##set
-
-#define X_SET_DEF_RO(name_, update_)
-#define X_SET_DEF_RW(name_, update_)                                    \
-	static int                                                      \
-	X_SET_RW(name_)(void *data, u64 val)                            \
-	{                                                               \
-		struct pvr_device *pvr_dev = data;                      \
-		/* This is not just (update_) to suppress -Waddress. */ \
-		if ((void *)(update_) != NULL)                          \
-			(update_)(pvr_dev, pvr_dev->params.name_, val); \
-		pvr_dev->params.name_ = val;                            \
-		return 0;                                               \
-	}
-
-#define X(type_, name_, value_, desc_, mode_, update_)                     \
-	static int                                                         \
-	__pvr_device_param_##name_##_get(void *data, u64 *val)             \
-	{                                                                  \
-		struct pvr_device *pvr_dev = data;                         \
-		*val = pvr_dev->params.name_;                              \
-		return 0;                                                  \
-	}                                                                  \
-	X_SET_DEF(name_, update_, mode_)                                   \
-	static int                                                         \
-	__pvr_device_param_##name_##_open(struct inode *inode,             \
-					  struct file *file)               \
-	{                                                                  \
-		__simple_attr_check_format(PVR_PARAM_TYPE_##type_##_FMT,   \
-					   0ull);                          \
-		return simple_attr_open(inode, file,                       \
-					__pvr_device_param_##name_##_get,  \
-					X_SET(name_, mode_),               \
-					PVR_PARAM_TYPE_##type_##_FMT);     \
-	}
-PVR_DEVICE_PARAMS
-#undef X
-
-#undef X_SET
-#undef X_SET_RO
-#undef X_SET_RW
-#undef X_SET_DEF
-#undef X_SET_DEF_RO
-#undef X_SET_DEF_RW
-
-static struct {
-#define X(type_, name_, value_, desc_, mode_, update_) \
-	const struct file_operations name_;
-	PVR_DEVICE_PARAMS
-#undef X
-} pvr_device_param_debugfs_fops = {
-#define X(type_, name_, value_, desc_, mode_, update_)     \
-	.name_ = {                                         \
-		.owner = THIS_MODULE,                      \
-		.open = __pvr_device_param_##name_##_open, \
-		.release = simple_attr_release,            \
-		.read = simple_attr_read,                  \
-		.write = simple_attr_write,                \
-		.llseek = generic_file_llseek,             \
-	},
-	PVR_DEVICE_PARAMS
-#undef X
-};
-
-void
-pvr_params_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
-{
-#define X_MODE(mode_) X_MODE_##mode_
-#define X_MODE_RO 0400
-#define X_MODE_RW 0600
-
-#define X(type_, name_, value_, desc_, mode_, update_)             \
-	debugfs_create_file(#name_, X_MODE(mode_), dir, pvr_dev,   \
-			    &pvr_device_param_debugfs_fops.name_);
-	PVR_DEVICE_PARAMS
-#undef X
-
-#undef X_MODE
-#undef X_MODE_RO
-#undef X_MODE_RW
-}
-#endif
diff --git a/drivers/gpu/drm/imagination/pvr_params.h b/drivers/gpu/drm/imagination/pvr_params.h
deleted file mode 100644
index 5807915b456bf..0000000000000
--- a/drivers/gpu/drm/imagination/pvr_params.h
+++ /dev/null
@@ -1,72 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
-/* Copyright (c) 2023 Imagination Technologies Ltd. */
-
-#ifndef PVR_PARAMS_H
-#define PVR_PARAMS_H
-
-#include "pvr_rogue_fwif.h"
-
-#include <linux/cache.h>
-#include <linux/compiler_attributes.h>
-
-/*
- * This is the definitive list of types allowed in the definition of
- * %PVR_DEVICE_PARAMS.
- */
-#define PVR_PARAM_TYPE_X32_C u32
-
-/*
- * This macro defines all device-specific parameters; that is parameters which
- * are set independently per device.
- *
- * The X-macro accepts the following arguments. Arguments marked with [debugfs]
- * are ignored when debugfs is disabled; values used for these arguments may
- * safely be gated behind CONFIG_DEBUG_FS.
- *
- * @type_: The definitive list of allowed values is PVR_PARAM_TYPE_*_C.
- * @name_: Name of the parameter. This is used both as the field name in C and
- *         stringified as the parameter name.
- * @value_: Initial/default value.
- * @desc_: String literal used as help text to describe the usage of this
- *         parameter.
- * @mode_: [debugfs] One of {RO,RW}. The access mode of the debugfs entry for
- *         this parameter.
- * @update_: [debugfs] When debugfs support is enabled, parameters may be
- *           updated at runtime. When this happens, this function will be
- *           called to allow changes to propagate. The signature of this
- *           function is:
- *
- *              void (*)(struct pvr_device *pvr_dev, T old_val, T new_val)
- *
- *           Where T is the C type associated with @type_.
- *
- *           If @mode_ does not allow write access, this function will never be
- *           called. In this case, or if no update callback is required, you
- *           should specify NULL for this argument.
- */
-#define PVR_DEVICE_PARAMS                                                    \
-	X(X32, fw_trace_mask, ROGUE_FWIF_LOG_TYPE_NONE,                      \
-	  "Enable FW trace for the specified groups. Specifying 0 disables " \
-	  "all FW tracing.",                                                 \
-	  RW, pvr_fw_trace_mask_update)
-
-struct pvr_device_params {
-#define X(type_, name_, value_, desc_, ...) \
-	PVR_PARAM_TYPE_##type_##_C name_;
-	PVR_DEVICE_PARAMS
-#undef X
-};
-
-int pvr_device_params_init(struct pvr_device_params *params);
-
-#if defined(CONFIG_DEBUG_FS)
-/* Forward declaration from "pvr_device.h". */
-struct pvr_device;
-
-/* Forward declaration from <linux/dcache.h>. */
-struct dentry;
-
-void pvr_params_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
-#endif /* defined(CONFIG_DEBUG_FS) */
-
-#endif /* PVR_PARAMS_H */

-- 
2.52.0

