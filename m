Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6498AD81
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF0B10E593;
	Mon, 30 Sep 2024 19:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEbIWIss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5902A10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726042; x=1759262042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hRij3TqTc1nzxTbbtCDCToz2Qawehn1hef12F/tFbVQ=;
 b=lEbIWIssJz9+I6hEivKcUV28WgZvDWv+4liaOVcsJbTzyHlZDNXnHML1
 mhyczI1za5PKf/jHZZ9MLf4KsDYzpxpSxXfWHGr4vHLpGKN03Rij7d3yr
 cHu/Bakg+QiYP29TvF+6taBzGlQcXM1JIUBi3aqzCR1+VHzALcpqic2pU
 BO93Orh7FDVEiVNTNRCvqX+tuXg9N+8K3utteU3Z2FEwedMwU7EvYD2Nf
 aOzHbOF8vE2/QCbNaTjkOYIcxn/wfevmC97J/wGXrEOrKoYk0oPfMb+Nx
 UELIGAIgyd4k+FzPkq4jAMSoDu20hMIsIVI8gFk5BzyCAQ4xxW3JKlF4u w==;
X-CSE-ConnectionGUID: D82/qLG8QbqPjy5ncwXRgg==
X-CSE-MsgGUID: N4ZN1tfoQwOzhmxYLLXJ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962363"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:01 -0700
X-CSE-ConnectionGUID: 911vlAuERTa48PilZNE90Q==
X-CSE-MsgGUID: 3iCxGG8CTdiddu/MrR8FVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370214"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:59 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 23/31] accel/ivpu: Refactor failure diagnostics during boot
Date: Mon, 30 Sep 2024 21:53:14 +0200
Message-ID: <20240930195322.461209-24-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

