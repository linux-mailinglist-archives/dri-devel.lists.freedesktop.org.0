Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A36C4613
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552010E8D3;
	Wed, 22 Mar 2023 09:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27DA10E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476764; x=1711012764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9IRKWA4ZLsUF/eXvGWEQWwOgEvdSo1J8nAgTncNlgB4=;
 b=Sea40Oq8KXkdshENiVgW3skduEjiQ9bVhQBDw/Dwxbm5A6XLyJxUxefU
 ntdRwM6bqyq25kYfsl7Ucdhssz4lYf4pilBzjnNDuKFnaNUAZj0qYwRT9
 gQ5h6jT16GUot7nyoDSdqVr36D72pw4F6gfmGFsaSqTZo7OyEn6u3Aiz1
 IYrYCGDcT0XcsN/St2thkBuwsX7in9sUseYbxk5Io4+YgwpbBX6Ce/1vV
 lWxhz+GygLpduowE0IABg6mKH03abxkY05TGHlLJbw6Ce6o5pW3vu4jZR
 3gy/4ICz83jTzCNlUm4erRn3JvboLEqkNJ204okCBG00YQel61nPkbNas A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904318"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904318"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229821"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229821"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:23 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] accel/ivpu: Do not use SSID 1
Date: Wed, 22 Mar 2023 10:18:56 +0100
Message-Id: <20230322091900.1982453-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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

