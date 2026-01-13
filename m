Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4942D17EFA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C4910E49A;
	Tue, 13 Jan 2026 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="v9La1J1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABA410E490
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D6XiIS3196794; Tue, 13 Jan 2026 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=Z
 w788SzHZ6X+qopWNgn6e9jJ+VJXNluv2HjpPwnE7i0=; b=v9La1J1b8nnODhY9+
 dwR6IVSBGg4MT41GT6rHgig6g+1tf7r8P6SujMQa2VWNsMFOPqbWZMmus+zl3bPs
 /pBVkB0nR8PINDPivMsNOjssIsiAJphcC7Ka5YZ7hrymPcntdC3PhvIT8X+M6EY/
 B332oJ/v6GRz8dyeTOi3eQzT5NPhU2Gik/V+VQRE/5xfvohynwoMf1LOTImkiuz4
 6aiAeBHMNf0cjxp3jN7D5uws2Y45VHyisKS50nqt/nEICR9h+w4Ve1XwQ5yEEhh4
 HtWBkJ0zwMgSc3tjlvI2lubeHm+/zxyq0aVzhZ+OoGNAiOCbL74VPqT0CCE4PaiD
 idL3w==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:16:57 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:56 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 13 Jan 2026 10:16:40 +0000
Subject: [PATCH 2/6] drm/imagination: Validate fw trace group_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-device-support-info-v1-2-91e5db7f7294@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4987;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=e48rK276oHs7zkZU1GPlTK5G1OMsY6vbZe40B8Ci+g4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU8LPBzet+LYsm1t/uXZbllzLSaubf3SXeNgxF1ss
 2Z9NHNNRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEykV4uRYeEk32+WMqGHfab4
 WLWc9z2mzhLttedzHI/M5NDIBDGhCEaGW6HyU+WuNek8di/f+WX/UYOb396ureBfGtcQteDNzmw
 2fgA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfX2LgACICv+lMY
 MK6nPAkr/vlKM5TId0Yn/1Zp0NmFCcSrQsgLff0qOnsBFKx5QS5cAdxhxRGgAun8o4r1FUlW9IM
 FaGan9sP7l21yIH+BSyfTiTJGVX0Be9RndwRrrvXk6HJIXBsCuXaAPzfM7wy2vUNbiJe/Ij6AVo
 kgu7OOz8r+E/Fi4atjSiEqn5wk+W4UTFW0fL2gZYePxarn3O1xfX6NikQI4D9sfSDlhCNo0r62t
 TOO6uByXqgF6SR24bRfwNUYOJR4gPHKCYJHrfm7Ua43TzhNGhbArBdaGkoxb7xBP/n9gyIRTsgC
 iKlhbFsosEDP6g3Y3aVV0/wrhGFgEFyZo8O1sKkrL8oMm05U+sGqXdsUweS3vyC9OtQFgMM848l
 28IfGHGFNov3N59we9wzV286FXBpLTM+10H1iOaoNbwm8/pbhKMo53ErqjwbusqrtUlupIM/mSH
 LiCrGl2rad24+Dav0JA==
X-Proofpoint-GUID: ppISc8BZrdA-8qX2HTFw-0qEPa7ugPoP
X-Proofpoint-ORIG-GUID: ppISc8BZrdA-8qX2HTFw-0qEPa7ugPoP
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b99 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=Nbp4WR2GB4CHkkDwQf0A:9
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

This value can come from two places: a module parameter or a debugfs file.
In both cases, validate it early to provide feedback to userspace at the
time the value is set instead of deferring until the value is used.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 76 ++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index a607e5b108915..a2aa588cbe5fa 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -12,12 +12,35 @@
 #include <drm/drm_print.h>
 
 #include <linux/build_bug.h>
+#include <linux/compiler_attributes.h>
 #include <linux/dcache.h>
 #include <linux/debugfs.h>
 #include <linux/moduleparam.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
+static int
+validate_group_mask(struct pvr_device *pvr_dev, const u32 group_mask)
+{
+	if (group_mask & ~ROGUE_FWIF_LOG_TYPE_GROUP_MASK) {
+		drm_warn(from_pvr_device(pvr_dev),
+			 "Invalid fw_trace group mask 0x%08x (must be a subset of 0x%08x)",
+			 group_mask, ROGUE_FWIF_LOG_TYPE_GROUP_MASK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static inline u32
+build_log_type(const u32 group_mask)
+{
+	if (!group_mask)
+		return ROGUE_FWIF_LOG_TYPE_NONE;
+
+	return group_mask | ROGUE_FWIF_LOG_TYPE_TRACE;
+}
+
 /*
  * Don't gate this behind CONFIG_DEBUG_FS so that it can be used as an initial
  * value without further conditional code...
@@ -29,7 +52,33 @@ static u32 pvr_fw_trace_init_mask;
  * there's no reason to turn on fw_trace without it.
  */
 #if IS_ENABLED(CONFIG_DEBUG_FS)
-module_param_named(init_fw_trace_mask, pvr_fw_trace_init_mask, hexint, 0600);
+static int
+pvr_fw_trace_init_mask_set(const char *val, const struct kernel_param *kp)
+{
+	u32 mask = 0;
+	int err;
+
+	err = kstrtouint(val, 0, &mask);
+	if (err)
+		return err;
+
+	err = validate_group_mask(NULL, mask);
+	if (err)
+		return err;
+
+	*(unsigned int *)kp->arg = mask;
+
+	return 0;
+}
+
+const struct kernel_param_ops pvr_fw_trace_init_mask_ops = {
+	.set = pvr_fw_trace_init_mask_set,
+	.get = param_get_hexint,
+};
+
+param_check_hexint(init_fw_trace_mask, &pvr_fw_trace_init_mask);
+module_param_cb(init_fw_trace_mask, &pvr_fw_trace_init_mask_ops, &pvr_fw_trace_init_mask, 0600);
+__MODULE_PARM_TYPE(init_fw_trace_mask, "hexint");
 MODULE_PARM_DESC(init_fw_trace_mask,
 		 "Enable FW trace for the specified groups at device init time");
 #endif
@@ -42,11 +91,7 @@ tracebuf_ctrl_init(void *cpu_ptr, void *priv)
 
 	tracebuf_ctrl->tracebuf_size_in_dwords = ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
 	tracebuf_ctrl->tracebuf_flags = 0;
-
-	if (fw_trace->group_mask)
-		tracebuf_ctrl->log_type = fw_trace->group_mask | ROGUE_FWIF_LOG_TYPE_TRACE;
-	else
-		tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+	tracebuf_ctrl->log_type = build_log_type(fw_trace->group_mask);
 
 	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
 		struct rogue_fwif_tracebuf_space *tracebuf_space =
@@ -140,7 +185,7 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
 /**
  * update_logtype() - Send KCCB command to trigger FW to update logtype
  * @pvr_dev: Target PowerVR device
- * @group_mask: New log group mask.
+ * @group_mask: New log group mask; must pass validate_group_mask().
  *
  * Returns:
  *  * 0 if the provided @group_mask is the same as the current value (this is a
@@ -153,6 +198,7 @@ static int
 update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 {
 	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct rogue_fwif_kccb_cmd cmd;
 	int idx;
 	int err;
@@ -161,15 +207,11 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 	if (fw_trace->group_mask == group_mask)
 		return 0;
 
-	if (group_mask)
-		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_TRACE | group_mask;
-	else
-		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
-
 	fw_trace->group_mask = group_mask;
+	fw_trace->tracebuf_ctrl->log_type = build_log_type(group_mask);
 
 	down_read(&pvr_dev->reset_sem);
-	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+	if (!drm_dev_enter(drm_dev, &idx)) {
 		err = -EIO;
 		goto err_up_read;
 	}
@@ -472,8 +514,14 @@ static int pvr_fw_trace_mask_get(void *data, u64 *value)
 static int pvr_fw_trace_mask_set(void *data, u64 value)
 {
 	struct pvr_device *pvr_dev = data;
+	const u32 group_mask = (u32)value;
+	int err;
+
+	err = validate_group_mask(pvr_dev, group_mask);
+	if (err)
+		return err;
 
-	return update_logtype(pvr_dev, (u32)value);
+	return update_logtype(pvr_dev, group_mask);
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(pvr_fw_trace_mask_fops, pvr_fw_trace_mask_get,

-- 
2.52.0

