Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EF9AF8A14
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EF710E96F;
	Fri,  4 Jul 2025 07:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leyJnn35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFAD10E969
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615641; x=1783151641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ytS98LP09yxUibnFIJ15FCH120g81M7gToAN6HatlE=;
 b=leyJnn35wA1fclrEMPDqejnN+NT+wnDJyH2jfAWilYUkAvsCXPkoGkNw
 wl8+epK3MWsWM0VQpidVfsuht2KDPWUvEx8lwAXx54zPJPOrNf/5NVJ+p
 jNmzFNCFChr2XLbLFs3AwR0MN4BLJoJR5ZLKQEg0ZiY1S/KJlC4x5xtw1
 i2AqT7snd1OlElVGEKC6sCkuxp2GgbUrWSWTGw0py8JB8wLjE0Ri33qNT
 ryvVCtHkiTyU5LRmTc1emTlo5DqVQKs0HL6YQNxSP6M3w4F37Qk/WwlTT
 oTU+PCjDpa2bo5v2VcbSooT/QEeaizVLaatpmXdGCVCalylzLiJPxU5Kk A==;
X-CSE-ConnectionGUID: 80UbnDnERhqEhG+JsBeXSQ==
X-CSE-MsgGUID: DELvmqtJRfiW+78lD1QaSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494445"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:01 -0700
X-CSE-ConnectionGUID: MHb23xx3RHCVWynOmTIl3A==
X-CSE-MsgGUID: +zKqp9/NRbmdahhWuJas7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924153"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:53:59 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1470F44394;
 Fri,  4 Jul 2025 10:53:57 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/80] accel/ivpu: Remove redundant
 pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:56 +0300
Message-Id: <20250704075356.3216699-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
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
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/accel/ivpu/ivpu_job.c | 1 -
 drivers/accel/ivpu/ivpu_pm.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 060f1fc031d3..05a1a768e1c9 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -1049,6 +1049,5 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	mutex_unlock(&vdev->submitted_jobs_lock);
 
 runtime_put:
-	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index eacda1dbe840..761b4d7e1a5a 100644
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
2.39.5

