Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12840C3066C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B3410E117;
	Tue,  4 Nov 2025 10:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPqKfXCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0872E10E117
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762250581; x=1793786581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n0ch8n7kpVmHj+25nNGNqLohU2Q7y/brQWo2jqD0xMc=;
 b=NPqKfXCypujVNvKdw5nVBRjlw3oxElCpFUCUkSyHi8FBbcb89yamuP98
 3neGul6nu0OEUfcVHVHQ7nfue2Cs6pBgtJuGjWg0Hh/VUNZgFFWNShZpw
 FN4/SCqCgBM5CASCd6IB3StFjHfkYRYp/52HbJIBDMTJib1TLlWF5IVe0
 4RPUshTW+XgJwWS3MKKijeDoeO1rR60O8jTyqjv4h60H0Mzlxqtx/Ijiv
 UOLhr6diERPz1aOuTmzVB22hB5dyA1WHGW//fsRXUolLyB+Bp5uuDyF4O
 cElezZ2U7sax9mtS9Ba2HqtiN2Ol+J0yK/So+7cD3G9SssM0rQFNKQ4y3 Q==;
X-CSE-ConnectionGUID: B1FsqWqvT0iP20ljC5wbkw==
X-CSE-MsgGUID: iKQ/8+b+RRetnqEfjlLYZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64225935"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64225935"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:03:00 -0800
X-CSE-ConnectionGUID: cLqCBZGxRYyPyJ/0eW/v2Q==
X-CSE-MsgGUID: YynPxdOHRDWVQwdYXWPQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186807403"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:02:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/hyperv: include drm_print.h where needed
Date: Tue,  4 Nov 2025 12:02:53 +0200
Message-ID: <20251104100253.646577-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

hyperv_drm_drv.c and hyperv_drm_modeset.c depend on drm_print.h being
indirectly included via drm_buddy.h, drm_mm.h, or
ttm/ttm_resource.h. Include drm_print.h explicitly.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20251104101158.1cc9abcd@canb.auug.org.au
Fixes: f6e8dc9edf96 ("drm: include drm_print.h where needed")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c     | 1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 0d49f168a919..06b5d96e6eaf 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -14,6 +14,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "hyperv_drm.h"
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 6e6eb1c12a68..7978f8c8108c 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -19,6 +19,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
-- 
2.47.3

