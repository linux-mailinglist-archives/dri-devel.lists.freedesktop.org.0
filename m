Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291319973AD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 19:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFA610E7B5;
	Wed,  9 Oct 2024 17:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Swr62LFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5766410E7BB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728496155; x=1760032155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H0jSc8tLifPnFFmDfie1Flb8rJ+AuErzzUdGHgP8HYk=;
 b=Swr62LFW+w13q6Ks2jP/ztbfSYwK9EFqjhgOshFNdr+l9JmE4x9ovu2+
 krwfQW3q/WnQQpWmbyYlv818fei+za1caDJH59PL6oXAB3TXy5Dsgy05P
 bxbJSpDBq/IhVIAo5Ogj70NcSK9F/lysexITauxX9irXBg3nuNeBHM9fQ
 HN5NZDIfulB9vNN9aMJMMmTyNvYSrzBz5lOykzoZGWWvmM+vwzKNmzVTt
 CxBWzXkamF5s/WY2DtjVb60pNNviYPcqlVxrk+Kno0RWALLHbG6oEvwAQ
 meDio19H1L6lCX5yx0JidsArq9C97wokGPh6iZBgyv6wWUtDyeG8lB2jA Q==;
X-CSE-ConnectionGUID: SWpZvuF8S+KMzf2OmYBfCA==
X-CSE-MsgGUID: ANldtWCcRou+02xrxJFJeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31609471"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="31609471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:49:14 -0700
X-CSE-ConnectionGUID: ZibxkBWqTUazLC6/ZneWsA==
X-CSE-MsgGUID: WCXRv4ckQ8y46akOu3UUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="99654964"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2024 10:49:12 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 nirmoy.das@intel.com
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
Date: Wed,  9 Oct 2024 17:14:12 +0000
Message-Id: <20241009171412.706671-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

There is error message like below during stress test.
"[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
And change the timeout value from 150 to 500, could help avoid
this error message in the stress test.
xe_mmio_wait32() is implemented as wait 10us at beginning, then
double the wait value as next wait until the timeout value is
reached. So for the normal case, the real wait time is not changed.
The larger timeout value should take effect for the bad case only.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd241a8e1838..60aebf7561ec 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 	spin_lock(&gt->global_invl_lock);
 	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
 
-	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 	spin_unlock(&gt->global_invl_lock);
 
-- 
2.25.1

