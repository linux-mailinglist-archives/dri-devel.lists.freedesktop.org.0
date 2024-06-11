Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3F903B68
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E9310E5F8;
	Tue, 11 Jun 2024 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+D/Jlzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237F010E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107494; x=1749643494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdlHJ+3/jP3s3R4kPpjJAkYZf5EFnfZ0lUQK1EXTuCY=;
 b=n+D/JlzbiA+anLoYbbZJCNSmHH904hVkEjAqmGzHCN6jaHiI4ZDl1EPr
 jcS9wTNUjwYn5XH8GhYeciQbXrYvYOCiqgRvFkFTCgOeGIAF+/VxrgJy5
 bfNzvVc9AO6xWN1s59x4fuF17qWi6Q2O/80OqUTpJ6BqY91TdAcobSXTT
 YlBZkT/+W8aciFKXHoFbqlsxWvY4juS6QwCSJ2BeO5uMyVNsGhveSTkdF
 j89w4RaN05Xanp31vu19kBcG6n2085pMhXeOQPH5O73Xs1uz6Kwf6SMAa
 szJWgasz/Bz7cM+0joBzHGC1aswbtiEZoixSaExs5rf38JaeH8vo5zFOZ g==;
X-CSE-ConnectionGUID: zOONYQwEQlWq77FGgmBu0A==
X-CSE-MsgGUID: wVCZZRSGRNeitbkg+djLwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296081"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:54 -0700
X-CSE-ConnectionGUID: tz1OZr5OTpKR0h0MhhgDJA==
X-CSE-MsgGUID: qNSTAmHYT+2wcLz/fmEEmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877124"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:52 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 10/15] accel/ivpu: Add test mode flag for disabling timeouts
Date: Tue, 11 Jun 2024 14:04:27 +0200
Message-ID: <20240611120433.1012423-11-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

From: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Add new test mode flag that will disable all timeouts
defined in timeout fields of struct ivpu_device.
Remove also reschedule_suspend field as it is unused.

Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h |  2 +-
 drivers/accel/ivpu/ivpu_hw.c  | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index d340bd8d66eb..63f13b697eed 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -150,7 +150,6 @@ struct ivpu_device {
 		int boot;
 		int jsm;
 		int tdr;
-		int reschedule_suspend;
 		int autosuspend;
 		int d0i3_entry_msg;
 	} timeout;
@@ -188,6 +187,7 @@ extern bool ivpu_force_snoop;
 #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
 #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
 #define IVPU_TEST_MODE_HWS_EXTRA_EVENTS	  BIT(7)
+#define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 09398a17c710..a4a13ac67047 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -77,25 +77,28 @@ static void wa_init(struct ivpu_device *vdev)
 
 static void timeouts_init(struct ivpu_device *vdev)
 {
-	if (ivpu_is_fpga(vdev)) {
+	if (ivpu_test_mode & IVPU_TEST_MODE_DISABLE_TIMEOUTS) {
+		vdev->timeout.boot = -1;
+		vdev->timeout.jsm = -1;
+		vdev->timeout.tdr = -1;
+		vdev->timeout.autosuspend = -1;
+		vdev->timeout.d0i3_entry_msg = -1;
+	} else if (ivpu_is_fpga(vdev)) {
 		vdev->timeout.boot = 100000;
 		vdev->timeout.jsm = 50000;
 		vdev->timeout.tdr = 2000000;
-		vdev->timeout.reschedule_suspend = 1000;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = 500;
 	} else if (ivpu_is_simics(vdev)) {
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 10000;
-		vdev->timeout.reschedule_suspend = 10;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = 100;
 	} else {
 		vdev->timeout.boot = 1000;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 2000;
-		vdev->timeout.reschedule_suspend = 10;
 		vdev->timeout.autosuspend = 10;
 		vdev->timeout.d0i3_entry_msg = 5;
 	}
-- 
2.45.1

