Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CEA77FA5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C74310E5EA;
	Tue,  1 Apr 2025 15:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieCck9Uc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3368610E5EA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743523089; x=1775059089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KC9IqAC+1yetzZ4dZeZRWXGPpfD0dUAxhHtcS6CzGHc=;
 b=ieCck9UcMGzz6ihlcHesDcrtyvN/0lG6h/QQbH7TdpZgecuFrbiC41p2
 dbYdOF8db3of+ROg+rFB/bdVZQQ2ERZ4QUBEDcJFrtCOKbqvfY+Gmujuk
 JtyplJRWMwCXqlNd9coujYT15TLi97Vu+PTfm6yCBjOzygfytHXflYPXv
 LHfXouT2Fo7txABJv0lC6rU7RDOXfbXzGOAB/XbxlsCXYXM9K97OG69RQ
 cDjUUTWmRXcrDyZfowcs226uYOFY5ARoJM5KzAIlbEQt2a8j/sUi6nG+c
 kRIZPZsoTjjK8+j/WPuP3P4SqETzaRkWtMXQi3xZhB9c4FfM92UCLfmQr Q==;
X-CSE-ConnectionGUID: 53WmMLQRTh+/n8NhtRQ4Aw==
X-CSE-MsgGUID: o8Wn0EbCQrSwnuYzvj0EWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44108433"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44108433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:58:08 -0700
X-CSE-ConnectionGUID: QuoabnVRT4y88FX+VvP+rA==
X-CSE-MsgGUID: 9+SHAuSNRqKMUfg0TmdXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="157413576"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:58:07 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Flush pending jobs of device's workqueues
Date: Tue,  1 Apr 2025 17:57:55 +0200
Message-ID: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Use flush_work() instead of cancel_work_sync() for driver
workqueues to guarantee that remaining pending work
will be handled.

Fixes: bc3e5f48b7ee ("accel/ivpu: Use workqueue for IRQ handling")
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 4fa73189502e..5e3888ff1022 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -421,9 +421,9 @@ void ivpu_prepare_for_reset(struct ivpu_device *vdev)
 {
 	ivpu_hw_irq_disable(vdev);
 	disable_irq(vdev->irq);
-	cancel_work_sync(&vdev->irq_ipc_work);
-	cancel_work_sync(&vdev->irq_dct_work);
-	cancel_work_sync(&vdev->context_abort_work);
+	flush_work(&vdev->irq_ipc_work);
+	flush_work(&vdev->irq_dct_work);
+	flush_work(&vdev->context_abort_work);
 	ivpu_ipc_disable(vdev);
 	ivpu_mmu_disable(vdev);
 }
-- 
2.43.0

