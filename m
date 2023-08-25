Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049457887A7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF6110E66B;
	Fri, 25 Aug 2023 12:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54FB10E66B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967303; x=1724503303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=py9UYIoiD/UbjwwSBGuPKpMm133oUpL4h5Xxm6zhV3c=;
 b=d3ry//+CEdj8xRYbL2yxgC+lEhLpxYUaRchEaU/vYxsPOGUoeH64Jjo5
 zAmsAw0sBXKtGwziQf53tPE+6cJFbW1NVd3kwt64k/bS+3WhI63bffI7Z
 oAd10qCeKVCC5ujXFkCBXcYbZesnpHyRMHbFlaBvZwA8nde8ncCzWSf1D
 iy4OOpCk4kLnGZLs8E1Vnyh1/S6CZFecv8jh8TVd4RxefGLoHaDAEh2re
 l52VRa7eaqslCrp8gQ6Lt3sZzoebphkv8x/zDgx+C6Ak01Gq20oIBsniV
 gjpF53q6JgdHV6H0FVgxZw2LO0ajriRkYxn91grtS8Va+TjIvRRolpRS8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573879"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272249"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272249"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:41 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] accel/ivpu: Move set autosuspend delay to HW specific code
Date: Fri, 25 Aug 2023 14:41:27 +0200
Message-Id: <20230825124135.4086628-2-stanislaw.gruszka@linux.intel.com>
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>

Configure autosuspend values per HW generation and per platform.

For non silicon platforms disable autosuspend for now, for silicon
reduce it to 10 ms.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h     | 1 +
 drivers/accel/ivpu/ivpu_hw_37xx.c | 2 ++
 drivers/accel/ivpu/ivpu_hw_40xx.c | 3 +++
 drivers/accel/ivpu/ivpu_pm.c      | 6 +++---
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 9e8c075fe9ef..44d857094bbc 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -117,6 +117,7 @@ struct ivpu_device {
 		int jsm;
 		int tdr;
 		int reschedule_suspend;
+		int autosuspend;
 	} timeout;
 };
 
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 9eae1c241bc0..1090c91e1ba3 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -113,11 +113,13 @@ static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.jsm = 50000;
 		vdev->timeout.tdr = 2000000;
 		vdev->timeout.reschedule_suspend = 1000;
+		vdev->timeout.autosuspend = -1;
 	} else {
 		vdev->timeout.boot = 1000;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 2000;
 		vdev->timeout.reschedule_suspend = 10;
+		vdev->timeout.autosuspend = 10;
 	}
 }
 
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 00c5dbbe6847..2c824358be31 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -135,16 +135,19 @@ static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.jsm = 50000;
 		vdev->timeout.tdr = 2000000;
 		vdev->timeout.reschedule_suspend = 1000;
+		vdev->timeout.autosuspend = -1;
 	} else if (ivpu_is_simics(vdev)) {
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 10000;
 		vdev->timeout.reschedule_suspend = 10;
+		vdev->timeout.autosuspend = -1;
 	} else {
 		vdev->timeout.boot = 1000;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 2000;
 		vdev->timeout.reschedule_suspend = 10;
+		vdev->timeout.autosuspend = 10;
 	}
 }
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index e6f27daf5560..b3a422305141 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -297,10 +297,10 @@ int ivpu_pm_init(struct ivpu_device *vdev)
 
 	if (ivpu_disable_recovery)
 		pm_runtime_set_autosuspend_delay(dev, -1);
-	else if (ivpu_is_silicon(vdev))
-		pm_runtime_set_autosuspend_delay(dev, 100);
 	else
-		pm_runtime_set_autosuspend_delay(dev, 60000);
+		pm_runtime_set_autosuspend_delay(dev, vdev->timeout.autosuspend);
+
+	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", dev->power.autosuspend_delay);
 
 	return 0;
 }
-- 
2.25.1

