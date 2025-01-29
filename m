Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E028FA21D3E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A6B10E7E4;
	Wed, 29 Jan 2025 12:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwqZcDQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AEA10E7E4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738154418; x=1769690418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B2CrWdcsOicH9+yP6JOFhLTScavsFkbHwpJkajJlaJM=;
 b=cwqZcDQI9gR7C8CXeNKU5y9hmIg/TjzD52uwOj7sLrrN7MERd3FY2CVQ
 oJ87oqtVnJu9SrTlNMSIddxhedTKH2Tg/cbHuMOKRt5o/l66dqatiRI4Z
 0MpoXRnz9/E9B/bn4HbFgoKE4Q5ltwIiOvT2l/Mx3yDac5unYdSgE7vRF
 ERkt0jzj78zkrDmapVtepz4Pi5z20Zjdq2JRK1izSL2YY6RtyaW7wqoo1
 TiBycyVfHjNGYtLbVvN+XDjT1qMDWx2z1frJGBkLNq1f40gPmmpAUbwvv
 bMTDOVP69mYGEwMEL1cqNl3ogfdGaKDmsTHBufXUZRDNIfgpqLGfnHvjD g==;
X-CSE-ConnectionGUID: xZeSZMYQRA+71sKvehRRfg==
X-CSE-MsgGUID: nPaPqodjSNKDySH29qMEfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49647269"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="49647269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:40:17 -0800
X-CSE-ConnectionGUID: RxrTt+IvSJ2xz4kjOzRMsg==
X-CSE-MsgGUID: g0R02cOsRemid+OBtV39Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113030872"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:40:15 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/3] accel/ivpu: Clear runtime_error after
 pm_runtime_resume_and_get() fails
Date: Wed, 29 Jan 2025 13:40:08 +0100
Message-ID: <20250129124009.1039982-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
References: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
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

pm_runtime_resume_and_get() sets dev->power.runtime_error that causes
all subsequent pm_runtime_get_sync() calls to fail.
Clear the runtime_error using pm_runtime_set_suspended(), so the driver
doesn't have to be reloaded to recover when the NPU fails to boot during
runtime resume.

Fixes: 7d4b4c74432d ("accel/ivpu: Remove suspend_reschedule_counter")
Cc: <stable@vger.kernel.org> # v6.11+
Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 949f4233946c6..c3774d2221326 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -309,7 +309,10 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 	int ret;
 
 	ret = pm_runtime_resume_and_get(vdev->drm.dev);
-	drm_WARN_ON(&vdev->drm, ret < 0);
+	if (ret < 0) {
+		ivpu_err(vdev, "Failed to resume NPU: %d\n", ret);
+		pm_runtime_set_suspended(vdev->drm.dev);
+	}
 
 	return ret;
 }
-- 
2.45.1

