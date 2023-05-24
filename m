Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F670EFDD
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0018010E58D;
	Wed, 24 May 2023 07:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5EA10E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684914610; x=1716450610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yW8Akrmw1TNYES2KtbQyqRe7sSbu3h7wvXR8Qr6XB1I=;
 b=ROo1OZiUHCLtLyfgjG4VyOIblc1OzESYEvxHgBDlpQzPv3nCsR3ER1ud
 F3/ygOQoxJGdZm5UVYP+JsWaHq67RLG9eMnylns+aO7+McaMZEp6ncKOx
 r+u3fjPBKG+W3uh6LdDXRdfCPC98DoRfumPT1xQZyV5rMV9MNW6CImhuZ
 GLUFJ0ISMmem4BnWIoouOpEZiwl8Fw5aQYIY1gvrgOu/KaG5Kfj6KaRTl
 bVUU4EY28/sRrpMU+9OK5knm5JCZrvG4K+irYtFToMgNU2UspiHBJ7DMK
 CgNVYbG+52meO6sEB6Wa2i8vZMvCT9o3iImAGppSDp8gAxQgMakTDvEHk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419200839"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="419200839"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="681767754"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="681767754"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:51 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] accel/ivpu: Print firmware name and version
Date: Wed, 24 May 2023 09:48:46 +0200
Message-Id: <20230524074847.866711-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

Firmware file name and version are very important for debugging
customer issues - print them as INFO level message instead
of DEBUG message that is turned off by default.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 16 ++++++++++++----
 drivers/accel/ivpu/ivpu_fw.h |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 3599bb8706eb..317716482a15 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -52,13 +52,19 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
 	int ret = -ENOENT;
 	int i;
 
-	if (ivpu_firmware)
-		return request_firmware(&vdev->fw->file, ivpu_firmware, vdev->drm.dev);
+	if (ivpu_firmware) {
+		ret = request_firmware(&vdev->fw->file, ivpu_firmware, vdev->drm.dev);
+		if (!ret)
+			vdev->fw->name = ivpu_firmware;
+		return ret;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(fw_names); i++) {
 		ret = firmware_request_nowarn(&vdev->fw->file, fw_names[i], vdev->drm.dev);
-		if (!ret)
+		if (!ret) {
+			vdev->fw->name = fw_names[i];
 			return 0;
+		}
 	}
 
 	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
@@ -143,7 +149,9 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	}
 	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
 		 fw_hdr->header_version, fw_hdr->image_format);
-	ivpu_dbg(vdev, FW_BOOT, "FW version: %s\n", (char *)fw_hdr + VPU_FW_HEADER_SIZE);
+
+	ivpu_info(vdev, "Firmware: %s, version: %s", fw->name,
+		  (const char *)fw_hdr + VPU_FW_HEADER_SIZE);
 
 	if (IVPU_FW_CHECK_API(vdev, fw_hdr, BOOT, 3))
 		return -EINVAL;
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 3cc3a1497a4a..8567fdf925fe 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -12,6 +12,7 @@ struct vpu_boot_params;
 
 struct ivpu_fw_info {
 	const struct firmware *file;
+	const char *name;
 	struct ivpu_bo *mem;
 	struct ivpu_bo *mem_shave_nn;
 	struct ivpu_bo *mem_log_crit;
-- 
2.25.1

