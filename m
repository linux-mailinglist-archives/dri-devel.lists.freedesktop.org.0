Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1E78FB71
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FA210E75D;
	Fri,  1 Sep 2023 09:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1C210E75D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693561817; x=1725097817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ys2Jj7tki1VMANEiPYSMbdlDM30zV7ABtuWgrUz65mk=;
 b=Wek5HJqyW1AS1irS3ay6IjZgtZFwE2zRbNEtJHYHBECDid8+L6GZrvho
 NMcU0Z95y29+5Pr4pabxwXNRnLuRDQsiNAONh1omTI/4UOtYkF+SYMMjv
 CY1AwUS8kekUB7MvDPdqQNvMSfoR58GAwfVDDeidu9kQtPex77Y/SoNKr
 KzwYgveommLcuZSebO6JbaXaqoakCiERF71JXuVNxe75tDxTovs6zbxq2
 lXTgxqmQPv7ucLnQ41id7qkobbGp3b4et2xPJIMi3nyLw8+gUuwJODfew
 5if8BxF0Av0O1xek9U2SXKJon2cULpVUDvCHP+F8u3S54Re9sAktbdzS2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361206907"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361206907"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070679939"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070679939"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:15 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/11] accel/ivpu: Print information about used workarounds
Date: Fri,  1 Sep 2023 11:49:51 +0200
Message-Id: <20230901094957.168898-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
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
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ivpu_dbg(MISC) to print information about workarounds.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h     | 5 +++++
 drivers/accel/ivpu/ivpu_hw_37xx.c | 5 +++++
 drivers/accel/ivpu/ivpu_hw_40xx.c | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 44d857094bbc..060c09402227 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -75,6 +75,11 @@
 
 #define IVPU_WA(wa_name) (vdev->wa.wa_name)
 
+#define IVPU_PRINT_WA(wa_name) do {					\
+	if (IVPU_WA(wa_name))						\
+		ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");	\
+} while (0)
+
 struct ivpu_wa_table {
 	bool punit_disabled;
 	bool clear_runtime_mem;
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 1090c91e1ba3..bf3432b68879 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -104,6 +104,11 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 
 	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_MTL && ivpu_revision(vdev) < 4)
 		vdev->wa.interrupt_clear_with_0 = true;
+
+	IVPU_PRINT_WA(punit_disabled);
+	IVPU_PRINT_WA(clear_runtime_mem);
+	IVPU_PRINT_WA(d3hot_after_power_off);
+	IVPU_PRINT_WA(interrupt_clear_with_0);
 }
 
 static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 09ba07443396..1c2528549635 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -126,6 +126,10 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 
 	if (ivpu_hw_gen(vdev) == IVPU_HW_40XX)
 		vdev->wa.disable_clock_relinquish = true;
+
+	IVPU_PRINT_WA(punit_disabled);
+	IVPU_PRINT_WA(clear_runtime_mem);
+	IVPU_PRINT_WA(disable_clock_relinquish);
 }
 
 static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
-- 
2.25.1

