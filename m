Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87478A935
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 11:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D164510E267;
	Mon, 28 Aug 2023 09:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C02A10E267
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693216064; x=1724752064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jMIRDeONkaFTosToITSfRdpizEle2S4amA0esw+SJAY=;
 b=KaL5VySVVDhkEoZz3A7jdPu64P7uNXj7BPhyCIP7/nogmi3GiEW124vK
 74zJiTW2liQu2qoQvpq37CMr+/Yxrpc08i0nNQpd/a1SFW+72lY+Y+mbX
 x4yw7hRglXIZfhyKxw0M3dG0TLCYSvb6SWFJnKJSkkj8hDVErGPoihBx+
 7P5wXiMvYLkRr61i5dTdanedPzwqLBALUC2tI6/59O66TjJQIKCUEOFA0
 DwfiDiVvzc5Ygg8VZQAPgRLZn3YyXXhALM7jRdr9e1hgIlFIt+ajv8eZQ
 dzYD13GgJ0APc9O7mLTCVkxw4Wyaqe0bdoy1c3USisoEKP+m6B2Cf8QE8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="439011762"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="439011762"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 02:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852778806"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="852778806"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 02:47:41 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] accel/ivpu: Move set autosuspend delay to HW specific
 code
Date: Mon, 28 Aug 2023 11:47:28 +0200
Message-Id: <20230828094736.4137092-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
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
 drivers/accel/ivpu/ivpu_drv.h     |  1 +
 drivers/accel/ivpu/ivpu_hw_37xx.c |  2 ++
 drivers/accel/ivpu/ivpu_hw_40xx.c |  3 +++
 drivers/accel/ivpu/ivpu_pm.c      | 14 ++++++++------
 4 files changed, 14 insertions(+), 6 deletions(-)

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
index 34626d66fa10..09ba07443396 100644
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
index e6f27daf5560..954c9ecd3e14 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -286,6 +286,7 @@ int ivpu_pm_init(struct ivpu_device *vdev)
 {
 	struct device *dev = vdev->drm.dev;
 	struct ivpu_pm_info *pm = vdev->pm;
+	int delay;
 
 	pm->vdev = vdev;
 	pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
@@ -293,14 +294,15 @@ int ivpu_pm_init(struct ivpu_device *vdev)
 	atomic_set(&pm->in_reset, 0);
 	INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
 
-	pm_runtime_use_autosuspend(dev);
-
 	if (ivpu_disable_recovery)
-		pm_runtime_set_autosuspend_delay(dev, -1);
-	else if (ivpu_is_silicon(vdev))
-		pm_runtime_set_autosuspend_delay(dev, 100);
+		delay = -1;
 	else
-		pm_runtime_set_autosuspend_delay(dev, 60000);
+		delay = vdev->timeout.autosuspend;
+
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, delay);
+
+	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", delay);
 
 	return 0;
 }
-- 
2.25.1

