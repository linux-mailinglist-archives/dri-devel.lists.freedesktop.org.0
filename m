Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6635A984032
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CAF10E667;
	Tue, 24 Sep 2024 08:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUuV64+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1CE10E663
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165920; x=1758701920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKMHPLVtieDtNz7Q+5TXTfJD0HK2+Y5zuTQ5yGGrxJI=;
 b=KUuV64+Re2pwHYF6r64HFny53qZshv6PX9J5ld2PMjsxy39F0TxdZR5T
 dD/ALDEWzD11dPGM+nqnE9HrcD7bGk/cOQHtsmRwPxLGtLIqQx3OEBgmw
 5K11ifnPnLGZE0N5/NMy4Zr5cTlM95OmVjooKSoTnV3RaHUoBlKn01Jht
 yeJLls6yHWAbZCb47W72OShBLQRBrUtVkKx/FTNzVzySW1iMfpkNFe9mG
 6/VJOzlWrAbJcSQw1agcwKB72syQ7IXlIUszWQ9KVBHcigTRzzZXlVKAp
 TqLSrHYw5SlJrhSXdswY01khp57y8B3BU2ni0tx8M//2kU9W6Mv63E5J9 w==;
X-CSE-ConnectionGUID: nVPGAHWHSmeN7aK6dzkUcQ==
X-CSE-MsgGUID: aKAGysklSm+tSkewlNkGXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506974"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506974"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:40 -0700
X-CSE-ConnectionGUID: 4jdjyG6GSZqOUVWOC76JfQ==
X-CSE-MsgGUID: 5ymo0iLEQ3mShnw47avwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170726"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:38 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 17/29] accel/ivpu: Add test_mode bit to force turbo
Date: Tue, 24 Sep 2024 10:17:42 +0200
Message-ID: <20240924081754.209728-18-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Add new test_mode BIT(9) that forces firmware to
enable turbo burst mode.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h | 1 +
 drivers/accel/ivpu/ivpu_job.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 9acef14deab57..151ab9f2ddc9b 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -197,6 +197,7 @@ extern bool ivpu_force_snoop;
 #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
 #define IVPU_TEST_MODE_HWS_EXTRA_EVENTS	  BIT(7)
 #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
+#define IVPU_TEST_MODE_TURBO		  BIT(9)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 8798fb2046abc..dc5cf7ded9439 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -202,6 +202,11 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
 	jobq_header->engine_idx = engine;
 	jobq_header->head = 0;
 	jobq_header->tail = 0;
+	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
+		ivpu_dbg(vdev, JOB, "Turbo mode enabled");
+		jobq_header->flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
+	}
+
 	wmb(); /* Flush WC buffer for jobq->header */
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
-- 
2.45.1

