Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DBD17EF4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A796810E497;
	Tue, 13 Jan 2026 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="tEVWLStN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134DA10E119
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D5mmMh3116559; Tue, 13 Jan 2026 10:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=X
 xdMkijMGY/BD48Tk2m2tmTv4RrhIGPyTTgSUykOlnY=; b=tEVWLStNgZlEQASP5
 e1Anvp0GoBQWJ6AxcaiaW6ADoQpG5rJjuRr8Lo7gbEjnkKd9mcL20VqrZVttwu0U
 n4vXkqnqDufQVBfkaVUq0LUyZ5GARfhXlETi+4AdEh64n7gU/YhC9Tch/7yMrjL/
 fOEG7jVSuwsFuzBpXIy5NQm+cYieQOm5KHDIWA4WoUV9CWOMpBIUruJhkdYgFQrC
 5ah60CUjK7SpbKS2GrOqTxSa9/jgSAXiN9/spMCV4+kAs5PN6p+vRNFGoZmdSOty
 bFbli+KAL5FT0XZDS07nIE0V2TZkIWajKoV0Y9HufcF8sbYNAD6qEfK36qaXzNcK
 AdzAA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:17:00 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:59 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 13 Jan 2026 10:16:44 +0000
Subject: [PATCH 6/6] drm/imagination: Warn or error on unsupported hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-device-support-info-v1-6-91e5db7f7294@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=PS8KNaN5fO3P9PKVidE6vGWm9jrWqRjCwvhUPfKqjcE=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU/z7Rc7dHdJgU5Tkeec16EytZccGSc/UqhhL+lsN
 zOZsndnRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEzkZAojwx3bCZmfDdnyF0fN
 Pukl7qKpw/TjZo7sHL3F0ZPb/zlEzGNk2PyRze9Q4pkHUnd48mqO5dqe1yx9yn5l4Y4iz/VZLNM
 PsQIA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfX271D35w3Rgzh
 fijf9fKohZCvvSCorXGyG9L6AIAlq2SI//RM7IQnwy5U9vg0MALAeVTOgA0jWRkE5to3jkWajhk
 wtJS0T/XLM01ATCvblQn+/K4gHYm0YBVlhkEhRtOwWwcjd91gLxlPKTniJwrkH+1ZN1O05z2ZKW
 oblOVYtDkvdvjQdLIXzK6k1r41VvwukcvZio1azPLikuKAWzHkwQpViWQlw2Ec2V6Ih5xodPRDT
 ZIfGlnM68uWgrZoXcWEnzsWozjXvo+S9jx1GURpUmaqEdUCrRpm3ikvnj1k4EY2FVHNQmKF47bn
 y8GO70XcgDxzOe6VIHeaiYjJsK0mIBFiA+Sp3/lRvaWvRdLxkb47ZzOuRP4+VZhTktxQiSftjQa
 SQIRxQ9cuYCKBW9qUnKqg1Xt1KpDFYIE1EuP7JjDfnqmq9v3fsP8A2GEAJFnr1LQ+fWKE9Znnnn
 IIYqaugw+YKacV4kAFw==
X-Proofpoint-GUID: F_hqvqp_PY0Wj41-qjEtvftlcxAdr__I
X-Proofpoint-ORIG-GUID: F_hqvqp_PY0Wj41-qjEtvftlcxAdr__I
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b9c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=p27HXWpvGPb40MpNPkkA:9
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

Gate the use of unsupported hardware behind a new module parameter
(exp_hw_support).

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 73 +++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index d87557812409a..f58bb66a63275 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -525,6 +525,77 @@ pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
 }
 EXPORT_SYMBOL_IF_KUNIT(pvr_gpuid_decode_string);
 
+static bool pvr_exp_hw_support;
+module_param_named(exp_hw_support, pvr_exp_hw_support, bool, 0600);
+MODULE_PARM_DESC(exp_hw_support, "Bypass runtime checks for fully supported GPU cores. WARNING: enabling this option may result in a buggy, insecure, or otherwise unusable driver.");
+
+/**
+ * enum pvr_gpu_support_level - The level of support for a gpu_id in the current
+ * version of the driver.
+ *
+ * @PVR_GPU_UNKNOWN: Cores that are unknown to the driver. These may not even exist.
+ * @PVR_GPU_EXPERIMENTAL: Cores that have experimental support.
+ * @PVR_GPU_SUPPORTED: Cores that are supported and maintained.
+ */
+enum pvr_gpu_support_level {
+	PVR_GPU_UNKNOWN,
+	PVR_GPU_EXPERIMENTAL,
+	PVR_GPU_SUPPORTED,
+};
+
+static enum pvr_gpu_support_level
+pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
+{
+	switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
+	case PVR_PACKED_BVNC(33, 15, 11, 3):
+	case PVR_PACKED_BVNC(36, 53, 104, 796):
+		return PVR_GPU_SUPPORTED;
+
+	case PVR_PACKED_BVNC(36, 52, 104, 182):
+		return PVR_GPU_EXPERIMENTAL;
+
+	default:
+		return PVR_GPU_UNKNOWN;
+	}
+}
+
+static int
+pvr_check_gpu_supported(struct pvr_device *pvr_dev,
+			const struct pvr_gpu_id *gpu_id)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	switch (pvr_gpu_support_level(gpu_id)) {
+	case PVR_GPU_SUPPORTED:
+		if (pvr_exp_hw_support)
+			drm_info(drm_dev, "Module parameter 'exp_hw_support' was set, but this hardware is fully supported by the current driver.");
+
+		break;
+
+	case PVR_GPU_EXPERIMENTAL:
+		if (!pvr_exp_hw_support) {
+			drm_err(drm_dev, "Unsupported GPU! Set 'exp_hw_support' to bypass this check.");
+			return -ENODEV;
+		}
+
+		drm_warn(drm_dev, "Running on unsupported hardware; you may encounter bugs!");
+		break;
+
+	/* NOTE: This code path may indicate misbehaving hardware. */
+	case PVR_GPU_UNKNOWN:
+	default:
+		if (!pvr_exp_hw_support) {
+			drm_err(drm_dev, "Unknown GPU! Set 'exp_hw_support' to bypass this check.");
+			return -ENODEV;
+		}
+
+		drm_warn(drm_dev, "Running on unknown hardware; expect issues.");
+		break;
+	}
+
+	return 0;
+}
+
 static char *pvr_gpuid_override;
 module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
 MODULE_PARM_DESC(gpuid, "GPU ID (BVNC) to be used instead of the value read from hardware.");
@@ -555,7 +626,7 @@ pvr_load_gpu_id(struct pvr_device *pvr_dev)
 			return err;
 	}
 
-	return 0;
+	return pvr_check_gpu_supported(pvr_dev, gpu_id);
 }
 
 /**

-- 
2.52.0

