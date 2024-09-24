Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0C98403F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A46810E67A;
	Tue, 24 Sep 2024 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgApC46I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19B710E669
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165928; x=1758701928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fexwg3VeLbb1YrrBx3Za5ENyFHeIsFn65yRVcI6m8Uk=;
 b=JgApC46IF2LTY6TNcXQ0TPTuXFnVCSrRY6K01sdauzFWXYQBWeXtKZk6
 +RmrDZ8/ZRvmrnVERjwulopzO8fgh4VVpDUAEDY0mbWjQEC9L78rXh5zo
 5IEoyOlPa6W+rFvRYTM1nnNuaI8YS/iqcCExDJvlPY05r1VH79Bj1maDf
 9PdbjT7W5IR318JJeKYB9PV4n4w1gzASQm4bXGRfxwWgy0AwXK8Dx1FEX
 Zgb0FLvhGCHPQPawXCXoaNxnR3WfaMs56jy8GBYrDamSFatGZWL25l3Sx
 rb6BNfMHdeM+z4fp+0yKLa+V5k63ikENVZ5a0Y7xQ8yquKcNdI2Ks07pq Q==;
X-CSE-ConnectionGUID: Ghl5kwvbS4aYNFv4XE2ZiQ==
X-CSE-MsgGUID: npZNvqp9TTyuKLasFw7T7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506995"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:46 -0700
X-CSE-ConnectionGUID: Q38iRnJGREmkNhwKnYYfGA==
X-CSE-MsgGUID: d43wYpk+R3WJ8tnkuIZW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170746"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:44 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 21/29] accel/ivpu: Refactor failure diagnostics during boot
Date: Tue, 24 Sep 2024 10:17:46 +0200
Message-ID: <20240924081754.209728-22-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Move diagnostic functions to common error handling within ivpu_boot()
function to ensure diagnostics are gathered even in cases where NPU
fails after successful boot (DCT and HWS init failures).

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ffb8309a4f657..14c2412c6f8e6 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -386,10 +386,7 @@ int ivpu_boot(struct ivpu_device *vdev)
 	ret = ivpu_wait_for_ready(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
-		ivpu_hw_diagnose_failure(vdev);
-		ivpu_mmu_evtq_dump(vdev);
-		ivpu_dev_coredump(vdev);
-		return ret;
+		goto err_diagnose_failure;
 	}
 
 	ivpu_hw_irq_clear(vdev);
@@ -400,12 +397,20 @@ int ivpu_boot(struct ivpu_device *vdev)
 	if (ivpu_fw_is_cold_boot(vdev)) {
 		ret = ivpu_pm_dct_init(vdev);
 		if (ret)
-			return ret;
+			goto err_diagnose_failure;
 
-		return ivpu_hw_sched_init(vdev);
+		ret = ivpu_hw_sched_init(vdev);
+		if (ret)
+			goto err_diagnose_failure;
 	}
 
 	return 0;
+
+err_diagnose_failure:
+	ivpu_hw_diagnose_failure(vdev);
+	ivpu_mmu_evtq_dump(vdev);
+	ivpu_dev_coredump(vdev);
+	return ret;
 }
 
 void ivpu_prepare_for_reset(struct ivpu_device *vdev)
-- 
2.45.1

