Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45862A21D66
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE72D10E7F4;
	Wed, 29 Jan 2025 13:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdzHhfDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E11C10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155599; x=1769691599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJVJg36eEjgWhK6XKLogVvV+KvHwPDZ6kSkVsnxUCOo=;
 b=QdzHhfDuAey0c50qDS8MVfTvzrrHwX8Up+jafqfogab/uL/dyjxi8YK2
 JK9diUjOiFDwNEqTu190KEJF09zLawJNcn3IDn7t1HjiftXbepQt+xpwi
 kKe+YW8lh4i61XgR/nOEv6y3d60ixjx/ErmpaieWcHAIMhwVbtHS3Q6nI
 cbAcqhA1vKfgD7yQ6vz+OQv69184HC0jynHAusAQxJGPyV0tMeNfAiq1M
 x3fRyYq9bY9pgVnPD/rrIuTd7SlhDcJs7vw4q+JShZXhuRWQBGGg0McSH
 mYhbL5lHYf59JQXsdHcv3Hrs1PVnjONF4waQJm+MZuh4FRIs12vtcsywk g==;
X-CSE-ConnectionGUID: M0VDlk85QwyGgDl/CfBfFw==
X-CSE-MsgGUID: 7ZQpdqYBTsiK0z1Mig74dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50080770"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50080770"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:59:59 -0800
X-CSE-ConnectionGUID: UwES4nOcRfKCIvU/q9kSng==
X-CSE-MsgGUID: /WlLImiGRGuGHrGYnV2lng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109937353"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:56:48 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 5/6] accel/ivpu: Enable recovery and adjust timeouts for fpga
Date: Wed, 29 Jan 2025 13:56:35 +0100
Message-ID: <20250129125636.1047413-6-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Recovery now works on fpga. JSM state dump timeout needs to
be really long for the new fpga model releases.

Enable punit on fpga.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw.c | 10 +++++-----
 drivers/accel/ivpu/ivpu_pm.c |  5 -----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 4199f0bbb435b..2057907c5aa6a 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -58,7 +58,7 @@ static void platform_init(struct ivpu_device *vdev)
 
 static void wa_init(struct ivpu_device *vdev)
 {
-	vdev->wa.punit_disabled = ivpu_is_fpga(vdev);
+	vdev->wa.punit_disabled = false;
 	vdev->wa.clear_runtime_mem = false;
 
 	if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
@@ -87,12 +87,12 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = -1;
 	} else if (ivpu_is_fpga(vdev)) {
-		vdev->timeout.boot = 100000;
-		vdev->timeout.jsm = 50000;
-		vdev->timeout.tdr = 2000000;
+		vdev->timeout.boot = 50;
+		vdev->timeout.jsm = 15000;
+		vdev->timeout.tdr = 30000;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = 500;
-		vdev->timeout.state_dump_msg = 10;
+		vdev->timeout.state_dump_msg = 10000;
 	} else if (ivpu_is_simics(vdev)) {
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 500;
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index f41b3bfe40af4..8f6222d157204 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -161,11 +161,6 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
 		return;
 	}
 
-	if (ivpu_is_fpga(vdev)) {
-		ivpu_err(vdev, "Recovery not available on FPGA\n");
-		return;
-	}
-
 	/* Trigger recovery if it's not in progress */
 	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
 		ivpu_hw_diagnose_failure(vdev);
-- 
2.45.1

