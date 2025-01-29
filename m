Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0740A21D64
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CE910E7ED;
	Wed, 29 Jan 2025 13:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR9D8z7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EB910E7F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155599; x=1769691599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zto4uKrqxQhlo4SyTWQXkccKXBhntubcoUAKNPmN+xo=;
 b=dR9D8z7aTSIT15vjlQHeWhOHv1T0M57tc384Ck3IcHxTcMa+zvWEX5Op
 OE/GaeTYVMlqKyHl8srWzPTCFYsh5iCYP33XngPUFde9uEOq2wXw+4Lfw
 qYtUiOdlyfU3Mbiw9RILEpWM5NNoYKyQVYyqf+W3qjcWw0AoLidW3p9Vc
 4CgpLthMXt3Xh8IAU/B9Z1SgRrcQhquVS+UkITtAu5j4n0u5WzUBlsDK1
 eDX5BrtExCISiHgmRv0LAIHLr2FS1qydh88A8/B2asEq7AJDRgYrIBaZ7
 JrEVvZMOZ34u9Ggu8g8V6Ajs+xkGgAh/23hZrzZBLSJO1S0AfVIDF3aBa w==;
X-CSE-ConnectionGUID: 6KTmr9LyTT+5rMEex2EsXg==
X-CSE-MsgGUID: J3StP0j9T4qau6BwLCVPNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50080762"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50080762"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:59:59 -0800
X-CSE-ConnectionGUID: 4XpSIwoISiCw3Lb6s2/4RQ==
X-CSE-MsgGUID: B4Gl9hHQTxCTz79D2XiTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109937355"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:56:50 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 6/6] accel/ivpu: Move recovery work to system_unbound_wq
Date: Wed, 29 Jan 2025 13:56:36 +0100
Message-ID: <20250129125636.1047413-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
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

Recovery work doesn't need to be bound to any specific CPU, so move it
to unbound workqueue to improve execution time and system latency.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 8f6222d157204..d3db944ad8643 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -165,7 +165,7 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
 	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
 		ivpu_hw_diagnose_failure(vdev);
 		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
-		queue_work(system_long_wq, &vdev->pm->recovery_work);
+		queue_work(system_unbound_wq, &vdev->pm->recovery_work);
 	}
 }
 
-- 
2.45.1

