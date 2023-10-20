Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0B7D0DD3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F57F10E5BD;
	Fri, 20 Oct 2023 10:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A3610E5A9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798722; x=1729334722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/VDV8ZHTJxEtgPpFKDhmtWtHEFBN4Wj2cZHzCuyvZw=;
 b=Ys5nRbRC0LruNQkCY4UzoiCU6VgJOM5sLWbHlh51ub2U002GqlDsH7Xh
 Fxe87UMqRMOq1G6HSTRwqmiY3TZDQo1l6KWqfcMS5vLQ2BM/q4A40lkCM
 f/aPhtclo19eJZv4eqOVh0klh+9rGbHAWYvxjKgtWPZumydP9dlZ7DRJy
 3b0M5KXOK+63UqaeZeK50eD2pXb44f8JhNLCV3hK/RXkS8jzbkASLKYWX
 ZjI7t2/g+lU+QhBWkjsj0QaSl6KENPF/GQ0o+CIHR3eDvIIa5D7IIbxA4
 3b3oykNcc5RPEcRVSOBG0nFAgOILhZpEr45CM9Cy3XPs3HjlUHdwWUZ5L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287550"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287550"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572662"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572662"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:21 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] accel/ivpu: Do no initialize parameters on power up
Date: Fri, 20 Oct 2023 12:45:00 +0200
Message-Id: <20231020104501.697763-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize HW specific parameters only once. We do not have to do this
on every power_up (performed during initialization and on resume). Move
corresponding code to ->init_info()

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 8 ++++----
 drivers/accel/ivpu/ivpu_hw_40xx.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index edd4d860f135..63ce5418d3fa 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -632,6 +632,10 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 	ivpu_hw_init_range(&hw->ranges.shave, 0x180000000, SZ_2G);
 	ivpu_hw_init_range(&hw->ranges.dma,   0x200000000, SZ_8G);
 
+	ivpu_hw_read_platform(vdev);
+	ivpu_hw_wa_init(vdev);
+	ivpu_hw_timeouts_init(vdev);
+
 	return 0;
 }
 
@@ -688,10 +692,6 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ivpu_hw_read_platform(vdev);
-	ivpu_hw_wa_init(vdev);
-	ivpu_hw_timeouts_init(vdev);
-
 	ret = ivpu_hw_37xx_reset(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 1c2528549635..4bf4c8780044 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -722,6 +722,10 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 	ivpu_hw_init_range(&vdev->hw->ranges.shave,  0x80000000 + SZ_256M, SZ_2G - SZ_256M);
 	ivpu_hw_init_range(&vdev->hw->ranges.dma,   0x200000000, SZ_8G);
 
+	ivpu_hw_read_platform(vdev);
+	ivpu_hw_wa_init(vdev);
+	ivpu_hw_timeouts_init(vdev);
+
 	return 0;
 }
 
@@ -813,10 +817,6 @@ static int ivpu_hw_40xx_power_up(struct ivpu_device *vdev)
 		return ret;
 	}
 
-	ivpu_hw_read_platform(vdev);
-	ivpu_hw_wa_init(vdev);
-	ivpu_hw_timeouts_init(vdev);
-
 	ret = ivpu_hw_40xx_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
-- 
2.25.1

