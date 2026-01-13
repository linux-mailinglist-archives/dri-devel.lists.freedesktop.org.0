Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF98D17EF7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A903110E498;
	Tue, 13 Jan 2026 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Y1MajCw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908710E490
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D6s9BD3231942; Tue, 13 Jan 2026 10:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=y
 7KbZH7pJe4OUK8l8BTzMgqTxGTSurHYwOj4kGCSNcY=; b=Y1MajCw0ympEARzwL
 sOhbjrbTPb5HSX36VVoCzZXWPBDXPRZ64QhMPWSv/7NhMQxM97cC9OC1SN1m8mWw
 9fbgfv7YdIdtspGc/S47SPcoU3jUcTgWR/T0/btNPdWJXWqilgGFDdl0SeS4bFC8
 Bh/nrZw2uJRRM+nytGZY9OUomWhYL4pzu8+d0/cQzEzYrWfA58gjdLuXaq78ihQ6
 etZ0KQwDwn4e4RrOPfZhXX8qjFbc0Hk6Tgb7jI33qR/yXY9t+fveJptv2G1b/2ni
 bEh9umTRitCmkzKqn399MEZ8Rh2Y424BUU2hmhriiJIeESBaU5hb87F13vnYUk8O
 4m93A==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:16:59 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:58 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 13 Jan 2026 10:16:42 +0000
Subject: [PATCH 4/6] drm/imagination: Add gpuid module parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-device-support-info-v1-4-91e5db7f7294@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6114;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=+y/dBA+BeRbuqFYzY1p34KWE4SaglYANlS150uP+4/A=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU+bL2wptvDc0lsmMXx7/a+8W8Nqlbl1n6fO4cpXB
 y/PWn5bsqOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmkijByDBR7XRMeu007uoF
 xhfOGUUfu/7bLtzvDtOF9g/bBE385M4yMmxeEvjhSNTNu4dWFc7/nRTQJhqsESPxcN2ciMQvv/Z
 zP2IEAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfXy/Bt3WDvRCSa
 LTZzt25+ldDnAjhMBi/HAgBvLY9Ixy9tG54UVD0RcnoaDvp6FP6bk/bAZZQV+DD4q+o6tsYVL2U
 aW94uOJKPwXdy/0C4WEjTN9pB1aTBD4LAmEfUrhTvuEeX664AYvRXBXubHX/hkcNWgdsqTRgNpk
 VNMvvyRqlyOH6tdznWwpzoENt9mycR5XDQz5La/mbaB2frCJvWNsSSMQ4614W1t95ZgAy9eL3xJ
 iGv8DgjhO0sXT9rhtf+LJNHU2jB60ABcwh5aFNTA2K6VCX0fUAL7l3Qxcjd17HudsFp2tQnTVg/
 NyLJB3O4xGmc2ZeuMXUmGX2PuFPhNwKCwFLz513lrk3pkXhNVayOP9NpM1kzVs4S7GHcQiw7aT7
 spws2E1WvsIR+/prm8u+AUSfJIfaNk4GPG9l8owO+cu4B7UnGWK07murhhRLzw7SPtJ1CtPmESS
 PsLSKIm61IpuMOYONHQ==
X-Proofpoint-GUID: VHxVPakON5Yq925irH0h015hDOFaYbws
X-Proofpoint-ORIG-GUID: VHxVPakON5Yq925irH0h015hDOFaYbws
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b9b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=4Q53omCfAPGnJu_YSsAA:9
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

From: Alexandru Dadu <alexandru.dadu@imgtec.com>

The "gpuid" module parameter is used to override the gpuid read from a
hardware register and is useful for testing the loading of different
firmware (including processing of the firmware header) without having
the hardware to hand.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 117 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_device.h |   7 +-
 2 files changed, 114 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index abe8ad1d447ac..db844e4e2e945 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -421,23 +421,21 @@ pvr_request_firmware(struct pvr_device *pvr_dev)
 }
 
 /**
- * pvr_load_gpu_id() - Load a PowerVR device's GPU ID (BVNC) from control registers.
+ * pvr_gpuid_decode_reg() - Decode the GPU ID from GPU register
  *
- * Sets struct pvr_dev.gpu_id.
+ * Sets the b, v, n, c fields of struct pvr_dev.gpu_id.
  *
  * @pvr_dev: Target PowerVR device.
+ * @gpu_id: Output to be updated with the GPU ID.
  */
 static void
-pvr_load_gpu_id(struct pvr_device *pvr_dev)
+pvr_gpuid_decode_reg(const struct pvr_device *pvr_dev, struct pvr_gpu_id *gpu_id)
 {
-	struct pvr_gpu_id *gpu_id = &pvr_dev->gpu_id;
-	u64 bvnc;
-
 	/*
 	 * Try reading the BVNC using the newer (cleaner) method first. If the
 	 * B value is zero, fall back to the older method.
 	 */
-	bvnc = pvr_cr_read64(pvr_dev, ROGUE_CR_CORE_ID__PBVNC);
+	u64 bvnc = pvr_cr_read64(pvr_dev, ROGUE_CR_CORE_ID__PBVNC);
 
 	gpu_id->b = PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__BRANCH_ID);
 	if (gpu_id->b != 0) {
@@ -456,6 +454,107 @@ pvr_load_gpu_id(struct pvr_device *pvr_dev)
 	}
 }
 
+/**
+ * pvr_gpuid_decode_string() - Decode the GPU ID from a module input string
+ *
+ * Sets the b, v, n, c fields of struct pvr_dev.gpu_id.
+ *
+ * @pvr_dev: Target PowerVR device.
+ * @param_bvnc: GPU ID (BVNC) module parameter.
+ * @gpu_id: Output to be updated with the GPU ID.
+ */
+static int
+pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
+			const char *param_bvnc, struct pvr_gpu_id *gpu_id)
+{
+	const struct drm_device *drm_dev = &pvr_dev->base;
+	char str_cpy[PVR_GPUID_STRING_MAX_LENGTH];
+	char *pos, *tkn;
+	int ret, idx = 0;
+	u16 user_bvnc_u16[4];
+	u8 dot_cnt = 0;
+
+	ret = strscpy(str_cpy, param_bvnc);
+
+	/*
+	 * strscpy() should return at least a size 7 for the input to be valid.
+	 * Returns -E2BIG for the case when the string is empty or too long.
+	 */
+	if (ret < PVR_GPUID_STRING_MIN_LENGTH) {
+		drm_info(drm_dev,
+			 "Invalid size of the input GPU ID (BVNC): %s",
+			 str_cpy);
+		return -EINVAL;
+	}
+
+	while (*param_bvnc) {
+		if (*param_bvnc == '.')
+			dot_cnt++;
+		param_bvnc++;
+	}
+
+	if (dot_cnt != 3) {
+		drm_info(drm_dev,
+			 "Invalid format of the input GPU ID (BVNC): %s",
+			 str_cpy);
+		return -EINVAL;
+	}
+
+	pos = str_cpy;
+
+	while ((tkn = strsep(&pos, ".")) != NULL && idx < 4) {
+		/* kstrtou16() will also handle the case of consecutive dots */
+		ret = kstrtou16(tkn, 10, &user_bvnc_u16[idx]);
+		if (ret) {
+			drm_info(drm_dev,
+				 "Invalid format of the input GPU ID (BVNC): %s",
+				 str_cpy);
+			return -EINVAL;
+		}
+		idx++;
+	}
+
+	gpu_id->b = user_bvnc_u16[0];
+	gpu_id->v = user_bvnc_u16[1];
+	gpu_id->n = user_bvnc_u16[2];
+	gpu_id->c = user_bvnc_u16[3];
+
+	return 0;
+}
+
+static char *pvr_gpuid_override;
+module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
+MODULE_PARM_DESC(gpuid, "GPU ID (BVNC) to be used instead of the value read from hardware.");
+
+/**
+ * pvr_load_gpu_id() - Load a PowerVR device's GPU ID (BVNC) from control
+ * registers or input parameter. The input parameter is processed instead
+ * of the GPU register if provided.
+ *
+ * Sets the arch field of struct pvr_dev.gpu_id.
+ *
+ * @pvr_dev: Target PowerVR device.
+ */
+static int
+pvr_load_gpu_id(struct pvr_device *pvr_dev)
+{
+	struct pvr_gpu_id *gpu_id = &pvr_dev->gpu_id;
+
+	if (!pvr_gpuid_override || !pvr_gpuid_override[0]) {
+		pvr_gpuid_decode_reg(pvr_dev, gpu_id);
+	} else {
+		drm_warn(from_pvr_device(pvr_dev),
+			 "Using custom GPU ID (BVNC) provided by the user!");
+
+		int err = pvr_gpuid_decode_string(pvr_dev, pvr_gpuid_override,
+						  gpu_id);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /**
  * pvr_set_dma_info() - Set PowerVR device DMA information
  * @pvr_dev: Target PowerVR device.
@@ -516,7 +615,9 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 {
 	int err;
 
-	pvr_load_gpu_id(pvr_dev);
+	err = pvr_load_gpu_id(pvr_dev);
+	if (err)
+		return err;
 
 	err = pvr_request_firmware(pvr_dev);
 	if (err)
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index d0e61923fd9b4..5608a977f6d21 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -39,6 +39,9 @@ struct firmware;
 /* Forward declaration from <linux/pwrseq/consumer.h> */
 struct pwrseq_desc;
 
+#define PVR_GPUID_STRING_MIN_LENGTH 7U
+#define PVR_GPUID_STRING_MAX_LENGTH 32U
+
 /**
  * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
  * @b: Branch ID.
@@ -558,7 +561,7 @@ pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature);
  * Return: The value of the requested register.
  */
 static __always_inline u32
-pvr_cr_read32(struct pvr_device *pvr_dev, u32 reg)
+pvr_cr_read32(const struct pvr_device *pvr_dev, u32 reg)
 {
 	return ioread32(pvr_dev->regs + reg);
 }
@@ -571,7 +574,7 @@ pvr_cr_read32(struct pvr_device *pvr_dev, u32 reg)
  * Return: The value of the requested register.
  */
 static __always_inline u64
-pvr_cr_read64(struct pvr_device *pvr_dev, u32 reg)
+pvr_cr_read64(const struct pvr_device *pvr_dev, u32 reg)
 {
 	return ioread64(pvr_dev->regs + reg);
 }

-- 
2.52.0

