Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CA9D1130
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8D10E347;
	Mon, 18 Nov 2024 13:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Ec9DuVnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0FF10E4C2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:49 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICJqTR027657;
 Mon, 18 Nov 2024 13:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=G
 5uz6bT4S5ti8LYkYMrA0j9MoSl+xz3DdBrZ3ZH5+LE=; b=Ec9DuVnqQqDT5nCAW
 G5YyVYGw2WG3M3XSqqINHTELzalQq+0H48R6saBolGgCvLuWYqZ2kvD0Z7nI8Rf3
 w0tmJo+XLadImlva4CBY4sLwjX5tbSV9+oT//uFMf+Gb43aDnQ6haGwWihQ21VFz
 2AWM0HBu761/G6MkgwfxvyJ46vgCFFu+f0maAiXprRnDDXuvHgm8j2HIwhuNDrbQ
 4YOdI7sLHFfIw0l0mYfB1WM7wT74shcj8/eZImYpxnpPvNZnNdSh3f/J2XkrmrCU
 TMUt8r3ocWbyXAAsoklWmWY5X+LuV6sfxVWB95Br5dONu+ZkCnCgwKkXDz6ECueY
 dJ/dw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:41 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:39 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:05 +0000
Subject: [PATCH v2 13/21] drm/imagination: Use a lookup table for fw defs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-13-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=k9c5VTM7RWNwn1UTnKr9XL+LzgxXMJarwH5+lJvVnCk=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz190z7l74Fe5V9PIs48YzYK2NfostJZryJaRmTa8
 j/xDEGnO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAiN0sZGbpvyLvfXD9flOXk
 MY+5HzfM9tfgTj+/7KzCCeaut6u/siYyMnw4baXKbSh0LFq3/Og1z59zxRKmXhZqDjtV3aLytFF
 pLxcA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: iW23UQbhrEUdpdXA6M1t8dytHfwoXfpO
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af1 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=iYL5nd4a90DRai7o0HQA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: iW23UQbhrEUdpdXA6M1t8dytHfwoXfpO
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

With more than two firmware processor types, the if/else chain in
pvr_fw_init() gets a bit ridiculous. Use a static array indexed on
pvr_fw_processor_type (which is now a proper enum instead of #defines)
instead.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-13-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.h |  4 ----
 drivers/gpu/drm/imagination/pvr_fw.c     | 21 ++++++++++++++++-----
 drivers/gpu/drm/imagination/pvr_fw.h     |  7 +++++++
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 930129334807168cf11ee843f446eb5063464d55..ec5eb78af82a3f3c32d6c89b68b7bc0fcee0b9d2 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -738,8 +738,4 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
 					      __union_size, __member_size);  \
 	})
 
-#define PVR_FW_PROCESSOR_TYPE_META  0
-#define PVR_FW_PROCESSOR_TYPE_MIPS  1
-#define PVR_FW_PROCESSOR_TYPE_RISCV 2
-
 #endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 808844eb10b5ccb29ed2b8e9bdfe3be829cc57d1..b77c4a42caf2f208f6289160e5cec36c683b1e65 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -926,16 +926,27 @@ pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev)
 int
 pvr_fw_init(struct pvr_device *pvr_dev)
 {
+	static const struct pvr_fw_defs *fw_defs[PVR_FW_PROCESSOR_TYPE_COUNT] = {
+		[PVR_FW_PROCESSOR_TYPE_META] = &pvr_fw_defs_meta,
+		[PVR_FW_PROCESSOR_TYPE_MIPS] = &pvr_fw_defs_mips,
+		[PVR_FW_PROCESSOR_TYPE_RISCV] = NULL,
+	};
+
 	u32 kccb_size_log2 = ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
 	u32 kccb_rtn_size = (1 << kccb_size_log2) * sizeof(*pvr_dev->kccb.rtn);
 	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
 	int err;
 
-	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META)
-		fw_dev->defs = &pvr_fw_defs_meta;
-	else if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_MIPS)
-		fw_dev->defs = &pvr_fw_defs_mips;
-	else
+	if (fw_dev->processor_type >= PVR_FW_PROCESSOR_TYPE_COUNT)
+		return -EINVAL;
+
+	fw_dev->defs = fw_defs[fw_dev->processor_type];
+
+	/*
+	 * Not all firmware processor types are currently supported.
+	 * Once they are, this check can be removed.
+	 */
+	if (!fw_dev->defs)
 		return -EINVAL;
 
 	err = fw_dev->defs->init(pvr_dev);
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index 180d310074e3585c641e540a9e2576b5ab2a5705..88ad713468ce3a1ee459b04dde5363c24791a4f1 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -402,6 +402,13 @@ struct pvr_fw_device {
 #define pvr_fw_irq_clear(pvr_dev) \
 	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
 
+enum pvr_fw_processor_type {
+	PVR_FW_PROCESSOR_TYPE_META = 0,
+	PVR_FW_PROCESSOR_TYPE_MIPS,
+	PVR_FW_PROCESSOR_TYPE_RISCV,
+	PVR_FW_PROCESSOR_TYPE_COUNT,
+};
+
 extern const struct pvr_fw_defs pvr_fw_defs_meta;
 extern const struct pvr_fw_defs pvr_fw_defs_mips;
 

-- 
2.47.0

