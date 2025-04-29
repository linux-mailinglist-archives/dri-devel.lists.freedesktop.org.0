Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ECAAA113C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B744610E50A;
	Tue, 29 Apr 2025 16:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3ydvb5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8410E50A;
 Tue, 29 Apr 2025 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942893; x=1777478893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=95m+F+Bbj8H9yosXA2Wqnd/6VzW1AFpOCb9+mRjwq0k=;
 b=d3ydvb5mmola2SjNgxABcAFen/r4c5eU3YD2mBDPYnOTCrq6ca85uA41
 tblnkw8PS2WgZRU9YQez4Qbvfi8gZHFS5uLPkML2+sXpEreY3G4uTv/n5
 ctT+O5glbD3Bm5lUFOigxQSwlMU7uJ/tM4FGgYZ8JfVUeb4TMHEAGQ4Kc
 Vy8KkGkG878iUJ3jHow10Pf7Xv8UnCu6CSjVvmODWy8R+O0ztrBpo5H85
 DqcWhtn7G9g5j7UZopglCGJzLSQ8aTMRS6vJVf5OB9SAPct5skRa4YFA/
 cHtgV6wn61mm64YxQQsQt3bWSx8Ve2mZHtF3kEI7Imf2JsKsgz+4Wkkgd g==;
X-CSE-ConnectionGUID: GMaxsLFcSNetbkqumgf+qQ==
X-CSE-MsgGUID: Pqf9dY1ZRqKYBvDvepcpzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585495"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:08:13 -0700
X-CSE-ConnectionGUID: P+umvNVDSGGdT5EJ8rCrqw==
X-CSE-MsgGUID: JOxIrspHTCKaUlCWW1+t3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055947"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:08:11 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 7/9] drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3
 resume
Date: Tue, 29 Apr 2025 21:39:54 +0530
Message-Id: <20250429160956.1014376-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

Reload late binding fw during S2Idle/S3 resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index da7ee67eefd1..d0a3019caa34 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -206,6 +206,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

