Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E385F7887A9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB4710E675;
	Fri, 25 Aug 2023 12:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933CF10E672
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967311; x=1724503311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0+KmXSn9or5f7PHLW9ZKwnQGghIYuzQmWputSae0SQ=;
 b=L1Stz8At4UKRYMOvOGxX+66RDbwrS1094ExoLni6AW8o81ANlpdSxDJ/
 Nynrcbvq8utWkuhJvrZFaJHMrDeft8p2rY4gBOjNRogIvkgCSgbjejiv5
 j3qlQbrd0eZLrC9hAXepK4ytTTcXvZS4Xd2Jw3mp9vjs84S4ruCAVqMfZ
 QqBUTW5xZdehnDfQm7e4dlMadP+Ltbb5W84cSFNZ2s0BijEF2A98w1A5T
 LOKYRLdzBlru+G+D6Z3pmc010V+VxczbBspV5TstgdR9NA1I5lxTiDxUb
 7kKGpgDdHjSrs+FLz2ok3dLFGExyTlg7aAGdCgqs0E5t5qG7/tvDXOqnv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573894"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573894"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272272"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272272"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:49 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] accel/ivpu: Print information about used workarounds
Date: Fri, 25 Aug 2023 14:41:29 +0200
Message-Id: <20230825124135.4086628-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
References: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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
index 2c824358be31..3f0faf2042d7 100644
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

