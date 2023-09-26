Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2717AE502
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 07:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943310E0B0;
	Tue, 26 Sep 2023 05:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7277010E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 05:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695705965; x=1727241965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MMKJKBuY/REBfuMaq8DGRl4xjVMldY2e67bFkaDXX7M=;
 b=nVpON96nFiX0UgeOxQaq4SuxXI/tA4zr1ldIA8fea0BTyV061sdp/pYR
 a29hKKtLEVY+NraCKGBw/8sXPLhJADifEuPqkfBpiaGd3TbF4S+CzlB8E
 faXej4mlfK/I96sgkuWHGHsJvI6DekXyqBI4tHSXbQGns+H0uEWOR5nm6
 LWDnikOGj0/E1t9N9g5gnmAIcWy1261WgGLhxLzUNtPi8YMtQzCMoiWyC
 In9ywKKN3zr1Rqts+Pt6XQMX1NQKEsYMSYT/uVBhnP+aufHipY8wGPl3H
 4Gmza0fFzxNW/Q4fO56u2B5oG6WMl9AgRKC/Mq/r1J7uYtSKGliNY5Gt3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445619843"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="445619843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 22:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872369697"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="872369697"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 22:26:03 -0700
Date: Tue, 26 Sep 2023 07:26:01 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/2] accel/ivpu: Use local variable for debugfs root
Message-ID: <20230926052601.GC846747@linux.intel.com>
References: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
 <20230907072610.433497-2-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907072610.433497-2-stanislaw.gruszka@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use local variable for debugfs root, just to make further changes
easier.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---

I'll squash that patch into patch 1

 drivers/accel/ivpu/ivpu_debugfs.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 9163bc6bd3ef..ea453b985b49 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -273,20 +273,22 @@ static const struct file_operations ivpu_reset_engine_fops = {
 
 void ivpu_debugfs_init(struct ivpu_device *vdev)
 {
+	struct dentry *debugfs_root = vdev->drm.debugfs_root;
+
 	drm_debugfs_add_files(&vdev->drm, vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list));
 
-	debugfs_create_file("force_recovery", 0200, vdev->drm.debugfs_root, vdev,
+	debugfs_create_file("force_recovery", 0200, debugfs_root, vdev,
 			    &ivpu_force_recovery_fops);
 
-	debugfs_create_file("fw_log", 0644, vdev->drm.debugfs_root, vdev,
+	debugfs_create_file("fw_log", 0644, debugfs_root, vdev,
 			    &fw_log_fops);
-	debugfs_create_file("fw_trace_destination_mask", 0200, vdev->drm.debugfs_root, vdev,
+	debugfs_create_file("fw_trace_destination_mask", 0200, debugfs_root, vdev,
 			    &fw_trace_destination_mask_fops);
-	debugfs_create_file("fw_trace_hw_comp_mask", 0200, vdev->drm.debugfs_root, vdev,
+	debugfs_create_file("fw_trace_hw_comp_mask", 0200, debugfs_root, vdev,
 			    &fw_trace_hw_comp_mask_fops);
-	debugfs_create_file("fw_trace_level", 0200, vdev->drm.debugfs_root, vdev,
+	debugfs_create_file("fw_trace_level", 0200, debugfs_root, vdev,
 			    &fw_trace_level_fops);
 
-	debugfs_create_file("reset_engine", 0200, vdev->drm.debugfs_root, vdev,
+	debugfs_create_file("reset_engine", 0200, debugfs_root, vdev,
 			    &ivpu_reset_engine_fops);
 }
-- 
2.25.1

