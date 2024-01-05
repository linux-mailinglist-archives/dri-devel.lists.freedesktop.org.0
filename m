Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6428252AE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049B910E5D1;
	Fri,  5 Jan 2024 11:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7343D10E5CF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453751; x=1735989751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRY0IVKnvZ/OZ4oKaKKhWNaeqJZX3a2HStN2ZiXWfd0=;
 b=WuNNKCH+wfRTD1Yyq+2dquXLP+qbUsCLlhpNgOiixoJNv3qV3XIYbYJz
 CV/0xk0/GnVEN32PWw7HT7sMfuvPe2DcgpkuAAJP1mGeLoVvFV5rJfdTg
 qBCmcwHWqHdx4QHtiFYc2ussRHn7m04UzAWpckPJSezNdj9eU0rhBWHki
 pMtf2ZTN/zYnZNWsLFMMYkZGZEVZ1vQamAwo3yBtbo40H1GS+j2joUWN4
 SoE9aLuQ0SQSMeOujjgQlroCaZwI4ZGDxNjo/kZfZlm68RBp/Tbw+Narr
 OvOekTJOLYbTEUGR5s09soqIRUv6kexVzsKni36/f1cZRWRHgzI6PPoli A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255425"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918726"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918726"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:29 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] accel/ivpu: Fix potential infinite loops in IRQ handlers
Date: Fri,  5 Jan 2024 12:22:13 +0100
Message-ID: <20240105112218.351265-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Limit number of iterations in ivpu_mmu_irq_evtq_handler() and
ivpu_ipc_irq_handler().

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c |  6 ++++++
 drivers/accel/ivpu/ivpu_mmu.c | 21 +++++++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index e86621f16f85..f69780248803 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -389,12 +389,18 @@ void ivpu_ipc_irq_handler(struct ivpu_device *vdev, bool *wake_thread)
 	unsigned long flags;
 	bool dispatched;
 	u32 vpu_addr;
+	int msg_count = 0;
 
 	/*
 	 * Driver needs to purge all messages from IPC FIFO to clear IPC interrupt.
 	 * Without purge IPC FIFO to 0 next IPC interrupts won't be generated.
 	 */
 	while (ivpu_hw_reg_ipc_rx_count_get(vdev)) {
+		if (++msg_count > IPC_MAX_RX_MSG) {
+			ivpu_pm_schedule_recovery(vdev);
+			return;
+		}
+
 		vpu_addr = ivpu_hw_reg_ipc_rx_addr_get(vdev);
 		if (vpu_addr == REG_IO_ERROR) {
 			ivpu_err_ratelimited(vdev, "Failed to read IPC rx addr register\n");
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 1f813625aab3..c82929b0ae9d 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -236,6 +236,8 @@
 #define IVPU_MMU_CERROR_ABT          0x2
 #define IVPU_MMU_CERROR_ATC_INV_SYNC 0x3
 
+#define IVPU_MMU_MAX_EVENT_COUNT     100
+
 static const char *ivpu_mmu_event_to_str(u32 cmd)
 {
 	switch (cmd) {
@@ -887,7 +889,7 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
 
 void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 {
-	bool schedule_recovery = false;
+	int event_count = 0;
 	u32 *event;
 	u32 ssid;
 
@@ -895,16 +897,19 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 
 	while ((event = ivpu_mmu_get_event(vdev)) != NULL) {
 		ivpu_mmu_dump_event(vdev, event);
+		if (++event_count > IVPU_MMU_MAX_EVENT_COUNT) {
+			ivpu_pm_schedule_recovery(vdev);
+			return;
+		}
 
 		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, event[0]);
-		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
-			schedule_recovery = true;
-		else
-			ivpu_mmu_user_context_mark_invalid(vdev, ssid);
-	}
+		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
+			ivpu_pm_schedule_recovery(vdev);
+			return;
+		}
 
-	if (schedule_recovery)
-		ivpu_pm_schedule_recovery(vdev);
+		ivpu_mmu_user_context_mark_invalid(vdev, ssid);
+	}
 }
 
 void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
-- 
2.43.0

