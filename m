Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D3A4FD08
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 12:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9591C10E0D2;
	Wed,  5 Mar 2025 11:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5A+PoQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6206D10E0D2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 11:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741172491; x=1772708491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GpRp9L00DRuTC3CdDytrwHek71bCCrqaSgJl3vTeZ5g=;
 b=b5A+PoQ9YL/a6S86xbjSfEJFOmzRe+WyDL4mr1wm5jXskIiNJvMW0cOl
 lOCDFgfxO69+uYDGyZap3AXQBKZn02CM1TfOq4v8BDTKEqW8QkIF2kcfB
 ERuh1HVpwm7s6kCw5cOD1xVMjwcMnGdLkCbkioi0sV2EZof5iTUR42rOq
 6T1VuVDjGHYrNiQqxjzo9Pz50FpebtWVh3DRGiouDJ/CduM19MMKyAUTb
 lmuqaE0MOeTuAeai5Hm771pysVU50l26cpvTfDBkLv8IYQ9/IQt+HWgnn
 Yqpc44cx5xp9KYiu961mEpU8cq7baxKFKvMcG0pnI5hgPUQht669rFCZi Q==;
X-CSE-ConnectionGUID: TLwVolsOTL6dRP0ssktBsQ==
X-CSE-MsgGUID: DWMaTOIFRK6LebPIBHs9Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42375627"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42375627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:01:30 -0800
X-CSE-ConnectionGUID: D7Vq9gXiSKeOefM5s4LZgg==
X-CSE-MsgGUID: 3p2sJt5lSiquD+2kXPAsVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="141911060"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2025 03:01:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5763B21F; Wed, 05 Mar 2025 13:01:28 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
Date: Wed,  5 Mar 2025 13:00:25 +0200
Message-ID: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

Use %ptTs instead of open-coded variant to print contents of time64_t type
in human readable form.

This changes N/A output to 1970-01-01 00:00:00 for zero timestamps,
but it's used only in the dev_err() output and won't break anything.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v3: explained the difference for N/A cases (Jani)
v2: fixed the parameters to be the pointers

 drivers/accel/habanalabs/common/device.c | 25 +++---------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 68eebed3b050..80fa08bf57bd 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1066,28 +1066,11 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 	return (device_id == hdev->pdev->device);
 }
 
-static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
-						bool is_pq_hb)
-{
-	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
-					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
-	struct tm tm;
-
-	if (!seconds)
-		return;
-
-	time64_to_tm(seconds, 0, &tm);
-
-	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
-		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
-}
-
 static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 {
 	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
 	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
-	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
 
 	if (!prop->cpucp_info.eq_health_check_supported)
 		return true;
@@ -1095,17 +1078,15 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 	if (!hdev->eq_heartbeat_received) {
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
 
-		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
-		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
 		dev_err(hdev->dev,
-			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
+			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
 			hdev->event_queue.ci,
 			heartbeat_debug_info->heartbeat_event_counter,
-			eq_time_str,
+			&hdev->heartbeat_debug_info.last_eq_heartbeat_ts,
 			hdev->kernel_queues[cpu_q_id].pi,
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
-			pq_time_str);
+			&hdev->heartbeat_debug_info.last_pq_heartbeat_ts);
 
 		hl_eq_dump(hdev, &hdev->event_queue);
 
-- 
2.47.2

