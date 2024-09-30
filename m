Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A905398AD7C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95B10E590;
	Mon, 30 Sep 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWZX5syU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE9710E58B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726035; x=1759262035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZk8tQGfBMKKxzhSWVwlao4wNnwJScksH6yWFTPokwk=;
 b=JWZX5syUD1WeiiZ6lr2vR7mTq8mrICAWu4uJZ230UxUasUq7pkb3dX+q
 RLojUhz+B2OYlr2T5Zc0cUFau/flpUxqi0Qm5gtdLaUXIE6JEgwsaSgLp
 u5ZAnobQhJyi0B0Fyj3O6HNFYFsn8YewUD9SATpFE9OC/A2OTxS/MD2sJ
 COVi3cstth7aq0kZ1x1eU57z49oHavw30y61Jv8ZRJ9vgY59RM1OgadFo
 jwoGXhlsTbfhgx9unmoZ8UVyTXWuWLGfH1OXN7qRtgvfYnrrr/f2dKSEL
 D5twMS/xtjXXM5/31tZn6evQ8ZdXo0qrm9zhfYSbEAmQlaP7YN+C3H9I3 w==;
X-CSE-ConnectionGUID: 9j/qjK0gQlWnTCXIGiopIQ==
X-CSE-MsgGUID: kOMXXzZNTC2C/34C2Iba9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962348"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962348"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:55 -0700
X-CSE-ConnectionGUID: wmKLYUWARgOSs1Qs2vuCxw==
X-CSE-MsgGUID: 7vRODOzYSV6pQwU1gAMh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370134"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:53 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 19/31] accel/ivpu: Add test_mode bit to force turbo
Date: Mon, 30 Sep 2024 21:53:10 +0200
Message-ID: <20240930195322.461209-20-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Add new test_mode BIT(9) that forces firmware to
enable turbo burst mode.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

