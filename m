Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3083A6C68EF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631FF10E797;
	Thu, 23 Mar 2023 12:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E949110E70B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576123; x=1711112123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GvQw6XwvnAUKfdd2MCffUA2KW3+tguU2dygaxQdaQA0=;
 b=C0cMgU1CRNl8bHBikgRH8rVZN/5FZWizKcMOmqPgddKoF1qG9Co2gxtO
 xmY33hV4Wo2C/6J69V0ChWdYDdd5+RohrZTnvpeiQ58xr8tyDyqgaF4hV
 OIHeqbSHEiQjEtRF5qMXWYQtrXLUz0qxFHctI+18wVwVDY/uqcckPPvSy
 qgOIrtYbatrIyK6tFjqCUGlw+lVBjpEpWPGDDMEi3HsgFhztUIgsp+6IS
 l30rSYYx/9Qs1dXmnSuMDw6hWhA1foLPmhZBJqcZ4Tjos//FajkzbgnEJ
 o9UiGC4+cK8YPx7qW5YV8f9as14QzjIj2meKraw9lZfL48MO4aXi3QiPK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404362723"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404362723"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682294668"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682294668"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:22 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/8] accel/ivpu: Do not use SSID 1
Date: Thu, 23 Mar 2023 13:54:59 +0100
Message-Id: <20230323125504.2586442-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SSID=1 is used by the firmware as default value in
case SSID mapping is not initialized. This allows
detecting use of miss-configured memory contexts.
The future FW versions may not allow using SSID=1.

SSID=65 is valid value, number of contexts are limited
by number of available command queues, but SSID can be
any u16 value.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ++--
 drivers/accel/ivpu/ivpu_drv.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index d9e311b40348..70245cf84593 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -474,8 +474,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 
 	vdev->hw->ops = &ivpu_hw_mtl_ops;
 	vdev->platform = IVPU_PLATFORM_INVALID;
-	vdev->context_xa_limit.min = IVPU_GLOBAL_CONTEXT_MMU_SSID + 1;
-	vdev->context_xa_limit.max = IVPU_CONTEXT_LIMIT;
+	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
+	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
 	atomic64_set(&vdev->unique_id_counter, 0);
 	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
 	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 1b2aa05840ad..ef12a38e06e1 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -25,7 +25,10 @@
 #define PCI_DEVICE_ID_MTL   0x7d1d
 
 #define IVPU_GLOBAL_CONTEXT_MMU_SSID 0
-#define IVPU_CONTEXT_LIMIT	     64
+/* SSID 1 is used by the VPU to represent invalid context */
+#define IVPU_USER_CONTEXT_MIN_SSID   2
+#define IVPU_USER_CONTEXT_MAX_SSID   (IVPU_USER_CONTEXT_MIN_SSID + 63)
+
 #define IVPU_NUM_ENGINES	     2
 
 #define IVPU_PLATFORM_SILICON 0
-- 
2.25.1

