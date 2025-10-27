Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68BC0E1A6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5081710E4A2;
	Mon, 27 Oct 2025 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbYgLpwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B087510E4A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761572401; x=1793108401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eIacE2e3q/S4trwRdeKOUlRNlNjdA7RrNxsf2diA+sc=;
 b=FbYgLpwt/GkhIcy0tQK9s8RH8AAJ7k2XEumLEn2XcQkOENor8mZ0sReY
 53+ej08up/JG1glpmRKZr3YSdCXNP/e2DzTWDa+sW9sZ4ky4MBuEcTffg
 9C8p4TUBBH3B9daLWoXoZrtsngHTzOc2+l9xbdKx7DiPJwh1z7+8h+ovh
 fiBnVSt2t0YDvssXIgmXduC1pC8nLSAZUhDrfOHvkNJrfxk3uKCBgkN0P
 ylqJ4lP4ruGL80nFK5H8Mnx3JqRuZNfIMMMPdLPq5IgUwBJVoDGxCbPiG
 fY+whSxGtx72YEhgDWEOVnfaEQydto+WFDYBfJt5YJ1e4Q0QFjFU1wWcS Q==;
X-CSE-ConnectionGUID: e32GxmlBRp6dmogwjZz0Gg==
X-CSE-MsgGUID: qNINJWu2QpKbIOwi7QKiiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63685170"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63685170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:40:00 -0700
X-CSE-ConnectionGUID: 0JIet4aKSVec22ZabxDyyg==
X-CSE-MsgGUID: GLRohp87TsCQmPDZHSdcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184940846"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:39:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 641B511FADA;
 Mon, 27 Oct 2025 15:39:56 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDNS0-00000001eKx-1VSf; Mon, 27 Oct 2025 15:39:56 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 1/1] accel/ivpu: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Mon, 27 Oct 2025 15:39:56 +0200
Message-ID: <20251027133956.393375-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 1 -
 drivers/accel/ivpu/ivpu_pm.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index ba4535a75aa7..4eb7287cd083 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -1114,6 +1114,5 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	mutex_unlock(&vdev->submitted_jobs_lock);
 
 runtime_put:
-	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 63c95307faa1..fe6f93af6ab0 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -359,7 +359,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 
 void ivpu_rpm_put(struct ivpu_device *vdev)
 {
-	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
@@ -428,7 +427,6 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
 	struct device *dev = vdev->drm.dev;
 
 	pm_runtime_allow(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.47.3

