Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BCD9BE4E9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C527E10E6B2;
	Wed,  6 Nov 2024 10:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlLAc+In";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBBB10E6B2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730890553; x=1762426553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6q7sgTYxQRgA9QPt05CvYZG30tLcNj75A+bn169rni8=;
 b=WlLAc+InAc39lHo5gJQFvbjnHkI7IfsB2IIuPCC03BZMvDzjV3Arm3nE
 k2MzGK6UVidDuEHYn9ug8RfqyYRb88tCeVhU4MGFnbRtQAqVkRTo5JbMX
 X9B2unvYI3EOquG4oHo7FwAD7oKiARLnHPpSSkBhMVzV6n32hdP7Tslhp
 buaVDR7QeGUmcy6LKeuv5D5z6SfxG/RE0FeCD2CpXxDyTlPJeTuvBcv4p
 i4isamp+nsBZRFkNqOTGVJq3Ld8hJaKty+tcJqILpjoD6dzVkVk91xx7V
 7qsDgvubKYFA4adwBfqVrMHnTtsfFfU4f1LbbH5ZxhPoCS6t1Fm302wOy g==;
X-CSE-ConnectionGUID: M1Bve05WR3KG1vXZkrY2Jg==
X-CSE-MsgGUID: phkOdW4iSUqKgqFzQT+EEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42081294"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="42081294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 02:55:53 -0800
X-CSE-ConnectionGUID: 5mr3BCv5TMqdlFbsYAnVMw==
X-CSE-MsgGUID: PUt/0mEWSVSJNR/zWkcVuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84114826"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 02:55:51 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org, Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix Qemu crash when running in passthrough
Date: Wed,  6 Nov 2024 11:55:49 +0100
Message-ID: <20241106105549.2757115-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Restore PCI state after putting the NPU in D0.
Restoring state before powering up the device caused a Qemu crash
if NPU was running in passthrough mode and recovery was performed.

Fixes: 3534eacbf101 ("accel/ivpu: Fix PCI D0 state entry in resume")
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 59d3170f5e354..5aac3d64045d3 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -73,8 +73,8 @@ static int ivpu_resume(struct ivpu_device *vdev)
 	int ret;
 
 retry:
-	pci_restore_state(to_pci_dev(vdev->drm.dev));
 	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D0);
+	pci_restore_state(to_pci_dev(vdev->drm.dev));
 
 	ret = ivpu_hw_power_up(vdev);
 	if (ret) {
-- 
2.45.1

