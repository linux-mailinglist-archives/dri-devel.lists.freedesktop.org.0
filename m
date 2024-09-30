Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCAD98AD66
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA17810E57C;
	Mon, 30 Sep 2024 19:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nd2oWaCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCE610E57C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726015; x=1759262015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mi2Nn2xisy466NzQRL8pZI/c7mNlFP+RFV5T2c9xWiA=;
 b=Nd2oWaCHlI3YT49NtLhgNjcMhZeACwFvOuFC8mOKRv+eWcwLlGZzQXe0
 BAXHI4dAyrQaqLnOgUBiIIwqqNvXl0c5jl0QxrcV17iY7nN6r7606nfil
 +mV2Ev9aXNdOwoD9GmwsF0YvlkK7RrIdx2enQqAIsbWVnxhCqipdmYxZN
 rW/dg9Oib7E0FfBm+gEVF7DHnKWjwFwbqbgGjAAadiNmwzg2Vm+JbuvU1
 sveIEUjQ0/o3RV3410dUUGXjaNqLZILims9kVFhisXtSeiwzJ6j0gu76M
 wtHvuTj85xu5iBKof/q1bvv1wA8LkypjcyrnKAhfqpuXJ93YQThkwIHi3 w==;
X-CSE-ConnectionGUID: 4dLxYMxTRMqgyNGk7JYevw==
X-CSE-MsgGUID: N8ImGDeOReO/mNCJWy9PDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962302"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962302"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:35 -0700
X-CSE-ConnectionGUID: 4Q1Jl3riRZev2o5kjODBZg==
X-CSE-MsgGUID: SQo3VeW4R4ego4bWIT6RiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73369994"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:34 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 06/31] accel/ivpu: Limit FW version string length
Date: Mon, 30 Sep 2024 21:52:57 +0200
Message-ID: <20240930195322.461209-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Limit FW version string, when parsing FW binary, to 256 bytes and
always add NULL-terminate it.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 7 ++++---
 drivers/accel/ivpu/ivpu_fw.h | 6 +++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 7beb95e8ef718..b91449aa8a7c6 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -25,7 +25,6 @@
 #define FW_SHAVE_NN_MAX_SIZE	SZ_2M
 #define FW_RUNTIME_MIN_ADDR	(FW_GLOBAL_MEM_START)
 #define FW_RUNTIME_MAX_ADDR	(FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
-#define FW_VERSION_HEADER_SIZE	SZ_4K
 #define FW_FILE_IMAGE_OFFSET	(VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
 
 #define WATCHDOG_MSS_REDIRECT	32
@@ -187,8 +186,10 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
 		 fw_hdr->header_version, fw_hdr->image_format);
 
-	ivpu_info(vdev, "Firmware: %s, version: %s", fw->name,
-		  (const char *)fw_hdr + VPU_FW_HEADER_SIZE);
+	if (!scnprintf(fw->version, sizeof(fw->version), "%s", fw->file->data + VPU_FW_HEADER_SIZE))
+		ivpu_warn(vdev, "Missing firmware version\n");
+
+	ivpu_info(vdev, "Firmware: %s, version: %s\n", fw->name, fw->version);
 
 	if (IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, BOOT, 3))
 		return -EINVAL;
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 40d9d17be3f52..5e8eb608b70f1 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -1,11 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_FW_H__
 #define __IVPU_FW_H__
 
+#define FW_VERSION_HEADER_SIZE	SZ_4K
+#define FW_VERSION_STR_SIZE	SZ_256
+
 struct ivpu_device;
 struct ivpu_bo;
 struct vpu_boot_params;
@@ -13,6 +16,7 @@ struct vpu_boot_params;
 struct ivpu_fw_info {
 	const struct firmware *file;
 	const char *name;
+	char version[FW_VERSION_STR_SIZE];
 	struct ivpu_bo *mem;
 	struct ivpu_bo *mem_shave_nn;
 	struct ivpu_bo *mem_log_crit;
-- 
2.45.1

