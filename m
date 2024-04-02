Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B28950C2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FDD10FC46;
	Tue,  2 Apr 2024 10:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KirCmYkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B2010FC48
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055007; x=1743591007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bn1O6jpz8P3aPcwD7qpRxdk76si1wGA4aXAasuYV0pU=;
 b=KirCmYkjUKdmom1PpQc2vqrqLWbdetBTh/bJbEca2mZpM0aNPbc49Hsj
 vwDn3CdErnJmIl2KRPngO7upaoQ72S0W/hLxFP0E4Fr03lo65rAOnFV6t
 F98FjnIgotP5NzmkCuNm6+Sx62mkPnGJJpZpdeWGBAPWBB+3wTFPAstR2
 x/CDyh43vICJcuzQvwvJ8LEdEBAOf5kSWa/ZLZyTTDzUotffqkwfA/kJS
 NCYKu7EtOKryGZj7Tp6nLnJ3XpiqhGrFWcr1HP4bxLLS1YcOxeEJrM+Om
 /yna6xvR0hzD09vAil3naAvQWBW4DIN2XwCeRV8vcpO/ZCFS7pRBI2NGP w==;
X-CSE-ConnectionGUID: hFMnVkSyRge5acGAIoDE7A==
X-CSE-MsgGUID: 5ULLImpGTae/JxMVE/mZ1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944406"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002492"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:06 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>, stable@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 1/8] accel/ivpu: Check return code of ipc->lock init
Date: Tue,  2 Apr 2024 12:49:22 +0200
Message-ID: <20240402104929.941186-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Return value of drmm_mutex_init(ipc->lock) was unchecked.

Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
Cc: <stable@vger.kernel.org> # v6.3+
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 04ac4b9840fb..56ff067f63e2 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/genalloc.h>
@@ -501,7 +501,11 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
 	spin_lock_init(&ipc->cons_lock);
 	INIT_LIST_HEAD(&ipc->cons_list);
 	INIT_LIST_HEAD(&ipc->cb_msg_list);
-	drmm_mutex_init(&vdev->drm, &ipc->lock);
+	ret = drmm_mutex_init(&vdev->drm, &ipc->lock);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize ipc->lock, ret %d\n", ret);
+		goto err_free_rx;
+	}
 	ivpu_ipc_reset(vdev);
 	return 0;
 
-- 
2.43.2

