Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7D83DA2D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B5B10F9FB;
	Fri, 26 Jan 2024 12:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8C810F9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272091; x=1737808091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lviOGH9900spYiqqIUAkGOfkEjO6shTQ0mr4f1v7BQ=;
 b=XwGXf+j2423GtJ5oRvU4jEtqdrp89CqZKzvvlbO3O66WZNaHIKyoXMI0
 cbVucO7yY/CvMDYvpGnz9Qbj7f/4xXAq54WWiYSbQZbz0mjh91QgZjsiv
 A8yjxu/jzhq/ZAJgRyGjPFtSzo+aVMJ/rP2NishXHaoxM7ieC8AtulmcL
 DH0fxyEAOGck7LeIWUffjcvzagVDCbMvrDk7h/vlRsfoR0Eg1nf6RCEHl
 N0oCamuUSzJC/WzlYx157XINYbziASvrSyygQUR+YSC8topGLfDZS64N9
 W7gVtoplKc1M3XYWDhZpLG40DDl8QfAp+80R4ERSAqZxjSCqWz5e7G7vy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207429"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207429"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731897"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:10 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] accel/ivpu: Correct MMU queue size checking functions
Date: Fri, 26 Jan 2024 13:27:59 +0100
Message-ID: <20240126122804.2169129-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Do not use kernel CIRC_SPACE and CIRC_CNT that
incorrectly return space of a queue when wrap bit was set.
Use correct implementation that compares producer, consumer and
wrap bit values.

Without this fix it was possible to lose events in case when event
queue was full.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 8df78adeee33..91bd640655ab 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -72,10 +72,10 @@
 
 #define IVPU_MMU_Q_COUNT_LOG2		4 /* 16 entries */
 #define IVPU_MMU_Q_COUNT		((u32)1 << IVPU_MMU_Q_COUNT_LOG2)
-#define IVPU_MMU_Q_WRAP_BIT		(IVPU_MMU_Q_COUNT << 1)
-#define IVPU_MMU_Q_WRAP_MASK		(IVPU_MMU_Q_WRAP_BIT - 1)
-#define IVPU_MMU_Q_IDX_MASK		(IVPU_MMU_Q_COUNT - 1)
+#define IVPU_MMU_Q_WRAP_MASK            GENMASK(IVPU_MMU_Q_COUNT_LOG2, 0)
+#define IVPU_MMU_Q_IDX_MASK             (IVPU_MMU_Q_COUNT - 1)
 #define IVPU_MMU_Q_IDX(val)		((val) & IVPU_MMU_Q_IDX_MASK)
+#define IVPU_MMU_Q_WRP(val)             ((val) & IVPU_MMU_Q_COUNT)
 
 #define IVPU_MMU_CMDQ_CMD_SIZE		16
 #define IVPU_MMU_CMDQ_SIZE		(IVPU_MMU_Q_COUNT * IVPU_MMU_CMDQ_CMD_SIZE)
@@ -475,20 +475,32 @@ static int ivpu_mmu_cmdq_wait_for_cons(struct ivpu_device *vdev)
 	return 0;
 }
 
+static bool ivpu_mmu_queue_is_full(struct ivpu_mmu_queue *q)
+{
+	return ((IVPU_MMU_Q_IDX(q->prod) == IVPU_MMU_Q_IDX(q->cons)) &&
+		(IVPU_MMU_Q_WRP(q->prod) != IVPU_MMU_Q_WRP(q->cons)));
+}
+
+static bool ivpu_mmu_queue_is_empty(struct ivpu_mmu_queue *q)
+{
+	return ((IVPU_MMU_Q_IDX(q->prod) == IVPU_MMU_Q_IDX(q->cons)) &&
+		(IVPU_MMU_Q_WRP(q->prod) == IVPU_MMU_Q_WRP(q->cons)));
+}
+
 static int ivpu_mmu_cmdq_cmd_write(struct ivpu_device *vdev, const char *name, u64 data0, u64 data1)
 {
-	struct ivpu_mmu_queue *q = &vdev->mmu->cmdq;
-	u64 *queue_buffer = q->base;
-	int idx = IVPU_MMU_Q_IDX(q->prod) * (IVPU_MMU_CMDQ_CMD_SIZE / sizeof(*queue_buffer));
+	struct ivpu_mmu_queue *cmdq = &vdev->mmu->cmdq;
+	u64 *queue_buffer = cmdq->base;
+	int idx = IVPU_MMU_Q_IDX(cmdq->prod) * (IVPU_MMU_CMDQ_CMD_SIZE / sizeof(*queue_buffer));
 
-	if (!CIRC_SPACE(IVPU_MMU_Q_IDX(q->prod), IVPU_MMU_Q_IDX(q->cons), IVPU_MMU_Q_COUNT)) {
+	if (ivpu_mmu_queue_is_full(cmdq)) {
 		ivpu_err(vdev, "Failed to write MMU CMD %s\n", name);
 		return -EBUSY;
 	}
 
 	queue_buffer[idx] = data0;
 	queue_buffer[idx + 1] = data1;
-	q->prod = (q->prod + 1) & IVPU_MMU_Q_WRAP_MASK;
+	cmdq->prod = (cmdq->prod + 1) & IVPU_MMU_Q_WRAP_MASK;
 
 	ivpu_dbg(vdev, MMU, "CMD write: %s data: 0x%llx 0x%llx\n", name, data0, data1);
 
@@ -873,12 +885,10 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
 	u32 *evt = evtq->base + (idx * IVPU_MMU_EVTQ_CMD_SIZE);
 
 	evtq->prod = REGV_RD32(IVPU_MMU_REG_EVTQ_PROD_SEC);
-	if (!CIRC_CNT(IVPU_MMU_Q_IDX(evtq->prod), IVPU_MMU_Q_IDX(evtq->cons), IVPU_MMU_Q_COUNT))
+	if (ivpu_mmu_queue_is_empty(evtq))
 		return NULL;
 
 	evtq->cons = (evtq->cons + 1) & IVPU_MMU_Q_WRAP_MASK;
-	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, evtq->cons);
-
 	return evt;
 }
 
@@ -899,6 +909,7 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 		}
 
 		ivpu_mmu_user_context_mark_invalid(vdev, ssid);
+		REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, vdev->mmu->evtq.cons);
 	}
 }
 
-- 
2.43.0

