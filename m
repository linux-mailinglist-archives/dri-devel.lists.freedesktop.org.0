Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8774769BFF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ACE10E2C0;
	Mon, 31 Jul 2023 16:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5464810E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819992; x=1722355992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BoYo8nydcDUOKHjifi3JI6nHBMEVwZyZLugRznfSMIk=;
 b=jdpkfgRaxS7Z5oeJYLTIPOYYGetJVvL28Bt3XiIPGe69lOR+u9byZbNr
 SmUOpFzH5sKDKp/VUIo5rOaCwdj6QCQm0JEYQHIAqmAATGelUzW/JrgcY
 1uaTvUhMW/l1U3RX7JQC4al2eOJgvvNCVKSrfE4PxvgeSHFBw5uMI63b6
 q+ROtOa/Znlq0kM2RhcG75e/S+XTz8YL27SXfFXNYuoVA9y0vVuvDhqtu
 VwRS9hqn0V/nUguazZgkq9S/bO81h9n0baT0bsHNEnOrLSnjl7F5RVm8N
 wl6AdGsZSILw0bpZUNSqHJQEzoVvpgUsFWVN/+LlMsteWkkmHPBic+CTA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400007874"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="400007874"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818396356"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="818396356"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:10 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] accel/ivpu: Switch to generation based FW names
Date: Mon, 31 Jul 2023 18:12:55 +0200
Message-Id: <20230731161258.2987564-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Use VPU IP generation for naming FW instead of the platform name.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 317716482a15..7caf90a169a3 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -43,12 +43,18 @@ static char *ivpu_firmware;
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
 MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
 
+/* TODO: Remove mtl_vpu.bin from names after transition to generation based FW names */
+static struct {
+	int gen;
+	const char *name;
+} fw_names[] = {
+	{ IVPU_HW_37XX, "vpu_37xx.bin" },
+	{ IVPU_HW_37XX, "mtl_vpu.bin" },
+	{ IVPU_HW_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
+};
+
 static int ivpu_fw_request(struct ivpu_device *vdev)
 {
-	static const char * const fw_names[] = {
-		"mtl_vpu.bin",
-		"intel/vpu/mtl_vpu_v0.0.bin"
-	};
 	int ret = -ENOENT;
 	int i;
 
@@ -60,9 +66,12 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(fw_names); i++) {
-		ret = firmware_request_nowarn(&vdev->fw->file, fw_names[i], vdev->drm.dev);
+		if (fw_names[i].gen != ivpu_hw_gen(vdev))
+			continue;
+
+		ret = firmware_request_nowarn(&vdev->fw->file, fw_names[i].name, vdev->drm.dev);
 		if (!ret) {
-			vdev->fw->name = fw_names[i];
+			vdev->fw->name = fw_names[i].name;
 			return 0;
 		}
 	}
-- 
2.25.1

