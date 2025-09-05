Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78ECB45CD9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2954110EBF8;
	Fri,  5 Sep 2025 15:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeXKPa+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE22510EBF8;
 Fri,  5 Sep 2025 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757087141; x=1788623141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FOTrG8ue0L8ud4gr9/TmXaKDM/SOItqRMTTvm6VIMKk=;
 b=eeXKPa+EAzVyA5BICIYt3i18E2rqs4chAyRvqe+ppevuIG/rxY7/z1zq
 tbJtjySp0C0Ao2xJdP80xTwcMfB4CXzmmq/K3NS49PZg9jQ9CoSLfwvtb
 vNIBDqqldSjOpoOgUDpx1ipWqMKwO5PNssHGhTlnpvF8TatskdV2nu0Y3
 SS6YdaO9mwsO9H7T/hdGd1DWT8LgV+97lYqIjbFhnb2M6YpcgCvrHsJ18
 fLuqckDmyG4jzV2SdQh8lFU79/YnpyXNYkgyfNSSgajEQZ6gfrRXaCiPi
 tdMRiBUV5pcH3T0LfdSY4VyBIFGtGNUD5kY/y/x8f72bOUaTqLn7/8UfZ w==;
X-CSE-ConnectionGUID: imWwv2E+QA60t0uLrVSn+Q==
X-CSE-MsgGUID: hL56Ya8TS7efxlkKlSufNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70144675"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70144675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:45:41 -0700
X-CSE-ConnectionGUID: qkcynP9zTVeLLZQAcNh9Vw==
X-CSE-MsgGUID: 6Iz5Cq0oRFun93vq8kLrdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172071826"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:45:37 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, mika.westerberg@linux.intel.com,
 lucas.demarchi@intel.com, karthik.poosa@intel.com
Subject: [PATCH v9 7/9] drm/xe/xe_late_bind_fw: Reload late binding fw during
 system resume
Date: Fri,  5 Sep 2025 21:19:51 +0530
Message-Id: <20250905154953.3974335-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905154953.3974335-1-badal.nilawar@intel.com>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
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

Reload late binding fw during resume from system suspend

v2:
  - Unconditionally reload late binding fw (Rodrigo)
  - Flush worker during system suspend

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7c05508f67a..6a170c8581e5 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -129,6 +129,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -216,6 +218,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

