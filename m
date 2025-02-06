Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4EA2B22B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 20:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75110E926;
	Thu,  6 Feb 2025 19:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7zmGta/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377F110E155
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738869685; x=1770405685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ycYpTL49hJrhopmTTMhsnFu8Qu6eZR8uaFzO8s4CwRc=;
 b=D7zmGta/xDxTvSRzhLEL+xNMWEz2OmWAcuqnInSPVCc2haItXBQFUkW6
 mVrx+hcuBvrCnNoHQ9JWMCuK9xCfjJNBlkO2wuY0e2++VHhLx6abw5Aiz
 h/cxo9zmLpmtAM32p6BjfGvEogOxB1/6X5PzDlXqokN2IxWyh5yt6HpP1
 nI24lbSKu85hNdgIzeJgVbiDvvVYOHwNX2rndkUvg2oxzm4H4+lufOPOQ
 2GD1x0fzNX42ljml3T7cZLcrNkJY/KFhQQ2gEBJ3yB7YnlFLaJ1apkgx0
 uE2fiYrF5ED/Rz3jw28uZ8PWzN9xOXFfYF+hUzG4thY8poSmrcazMbM2Q A==;
X-CSE-ConnectionGUID: IfVtrNu2Sryze9/zD8qvtg==
X-CSE-MsgGUID: Ci7OdrSXTGCf02kOo+jbtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39398690"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39398690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:21:24 -0800
X-CSE-ConnectionGUID: O3CxiniXRqCYbrAAuLainQ==
X-CSE-MsgGUID: wGzIOP+0TvO0gnQ3bC0dKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111502419"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2025 11:21:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D4CB3EE; Thu, 06 Feb 2025 21:21:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] accel/habanalabs: Switch to use %ptTs
Date: Thu,  6 Feb 2025 21:20:43 +0200
Message-ID: <20250206192109.1133364-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed the parameters to be the pointers

 drivers/accel/habanalabs/common/device.c | 25 +++---------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 30277ae410d4..96897c12dfee 100644
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
2.43.0.rc1.1336.g36b5255a03ac

