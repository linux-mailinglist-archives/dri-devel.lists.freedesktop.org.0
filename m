Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D2DB57678
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0C510E415;
	Mon, 15 Sep 2025 10:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2ml/s/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1852610E415
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757932451; x=1789468451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5B8OiW0eZELDjkwu5Y1exqiEHJncCvP35Gx9n2sVEMg=;
 b=A2ml/s/Z8FKHZatvImKJDoAUy84YHtV0nFDjScNYVZqTUwpjheidmlah
 h4PeZSoohOfulPl+j2AqKOZ1vGsRFiyOWgY/TKCo0G+WL/qE8gERnB0T4
 mIe2vLR20AFrRa2xHZAZNWIu7J/4F8LEAaFEFrwtxzJNP69zfxjkdwUMf
 Q2Gs3XDi1siXb3HMGJjRb/94ew7DnaMyDqWazzAVJAf5V3P/qt7z49vLB
 SI8BL2a3BLpBwq9ooikBgNJ2HBEOM/2wVW03DNfzLuXEtjaaXL5FqUpG5
 mjx73Xi25GW8WzwNkkn+nqxKC5doto3u0bJkAkarOvRFVIr6IGlfZgnNo A==;
X-CSE-ConnectionGUID: DkhyM7hWRXyCT0rz3j+qzg==
X-CSE-MsgGUID: ofAsVVDgSvWDX5+Q0P2IYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77632709"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77632709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:34:11 -0700
X-CSE-ConnectionGUID: VzPPAAUQTxKfTI88MM2rWQ==
X-CSE-MsgGUID: Wri++cEWTjyFotCGNSWWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174186899"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:34:09 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Refactor priority_bands_show for readability
Date: Mon, 15 Sep 2025 12:34:01 +0200
Message-ID: <20250915103401.830045-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reduce code duplication and improve the overall readability of the debugfs
output for job scheduling priority bands.

Additionally fix clang-tidy warning about missing default case in the
switch statement.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 38 ++++++++++++-------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index cd24ccd20ba6..3bd85ee6c26b 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -398,35 +398,25 @@ static int dct_active_set(void *data, u64 active_percent)
 
 DEFINE_DEBUGFS_ATTRIBUTE(ivpu_dct_fops, dct_active_get, dct_active_set, "%llu\n");
 
+static void print_priority_band(struct seq_file *s, struct ivpu_hw_info *hw,
+				int band, const char *name)
+{
+	seq_printf(s, "%-9s: grace_period %9u process_grace_period %9u process_quantum %9u\n",
+		   name,
+		   hw->hws.grace_period[band],
+		   hw->hws.process_grace_period[band],
+		   hw->hws.process_quantum[band]);
+}
+
 static int priority_bands_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = s->private;
 	struct ivpu_hw_info *hw = vdev->hw;
 
-	for (int band = VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE;
-	     band < VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT; band++) {
-		switch (band) {
-		case VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE:
-			seq_puts(s, "Idle:     ");
-			break;
-
-		case VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL:
-			seq_puts(s, "Normal:   ");
-			break;
-
-		case VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS:
-			seq_puts(s, "Focus:    ");
-			break;
-
-		case VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME:
-			seq_puts(s, "Realtime: ");
-			break;
-		}
-
-		seq_printf(s, "grace_period %9u process_grace_period %9u process_quantum %9u\n",
-			   hw->hws.grace_period[band], hw->hws.process_grace_period[band],
-			   hw->hws.process_quantum[band]);
-	}
+	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE, "Idle");
+	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL, "Normal");
+	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS, "Focus");
+	print_priority_band(s, hw, VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME, "Realtime");
 
 	return 0;
 }
-- 
2.43.0

