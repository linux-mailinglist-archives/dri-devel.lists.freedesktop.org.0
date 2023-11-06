Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC17E2318
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196210E30E;
	Mon,  6 Nov 2023 13:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC35A10E30E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699276116; x=1730812116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J+MNH0BFHjfvyWkw4D4pAH8paM7odNFugYX/beFg4hw=;
 b=Qd0Xzkk7Jy3HTdzjZRE6+BPYqp/r1SuOmAbeUGOL+tIkihh05HNG2u6h
 V9tyV0gDSibZgArVhkCDMPmFxgjo3H9A7ZmO+kEzEcMSnHhNyfgPJpwdp
 SKcMpL901jWcE7hGUaP/tZY2NRcSQonfJiJ6wmynwnKy/TY7gUzZbWfwD
 17czdltbck/uPog+MXSVxqhnHSMAfcwCqngAut7VAawSsWVWBccmxEr2q
 recEjLxZITzL4jzY/+z2WvB4fh4i4yUd3+c5psa2CCBjZZkCbJgc/yiL7
 6VIO39DaOYUfMGTCf7hRECYv0IQtvR+bHYxXZURrcpy5/nRsh+vUAw6p6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369474961"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="369474961"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762313184"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="762313184"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:08:34 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Fix compilation with CONFIG_PM=n
Date: Mon,  6 Nov 2023 14:08:26 +0100
Message-ID: <20231106130827.1600948-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_status_suspended() instead of dev->power.runtime_status
field that is not available without PM.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index a5fb2e5e824b7..88453762c9d53 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -6,6 +6,7 @@
 #include <linux/genalloc.h>
 #include <linux/highmem.h>
 #include <linux/kthread.h>
+#include <linux/pm_runtime.h>
 #include <linux/wait.h>
 
 #include "ivpu_drv.h"
@@ -315,8 +316,7 @@ int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *r
 	struct vpu_jsm_msg hb_resp;
 	int ret, hb_ret;
 
-	drm_WARN_ON(&vdev->drm,
-		    vdev->drm.dev->power.runtime_status == RPM_SUSPENDED);
+	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev));
 
 	ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp, resp, channel, timeout_ms);
 	if (ret != -ETIMEDOUT)
-- 
2.42.0

