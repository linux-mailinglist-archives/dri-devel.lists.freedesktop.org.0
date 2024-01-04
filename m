Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5C82411A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4A10E43E;
	Thu,  4 Jan 2024 11:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3867310E437
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369447; x=1735905447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRY0IVKnvZ/OZ4oKaKKhWNaeqJZX3a2HStN2ZiXWfd0=;
 b=YwUeyJXxd23T3d7XCPJ3SOaRoJGRw4LZ9T5QwBYBY7I4pJ7jJl5bqz1g
 Izw1g8p0MGDFxIdgx3E0DiPlWVwFkx+HmZsqqtpGe2L+6ETMgWx72zXbV
 pLyfhDgzSkP0kD6VWi8jyCeup+gN6fB0FPxDY2KPo4SRAfm8R2hESTty/
 OIYm38oa9P1c0j8269QgVA77+qm2PUZvpW5NyoRY7yE4L8v2MLqdoVTP5
 L6Nc9t6UZFSh03VIrKN4hykoAPfDzn84UqYQcjvaeZRzgQ+gfIc30SSR9
 J0IkKLI5bQQ4qeMX93APjZIv7++8qPuZcy7ey83b2HOt4pupQwWmy5ZjY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584134"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584134"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275713"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275713"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:25 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/16] accel/ivpu: Fix potential infinite loops in IRQ handlers
Date: Thu,  4 Jan 2024 12:57:00 +0100
Message-ID: <20240104115713.8657-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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

