Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0044BE86
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161DB6EC41;
	Wed, 10 Nov 2021 10:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153196EC41
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:24:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="231366141"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="231366141"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:24:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="501330380"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2021 02:24:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 963FD155; Wed, 10 Nov 2021 12:24:27 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm: Replace kernel.h with the necessary inclusions
Date: Wed, 10 Nov 2021 12:24:23 +0200
Message-Id: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/drm/drm_gem_ttm_helper.h  | 2 +-
 include/drm/drm_gem_vram_helper.h | 2 +-
 include/drm/drm_mm.h              | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm_helper.h
index c1aa02bd4c89..78040f6cc6f3 100644
--- a/include/drm/drm_gem_ttm_helper.h
+++ b/include/drm/drm_gem_ttm_helper.h
@@ -3,7 +3,7 @@
 #ifndef DRM_GEM_TTM_HELPER_H
 #define DRM_GEM_TTM_HELPER_H
 
-#include <linux/kernel.h>
+#include <linux/container_of.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index d3cf06c9af65..b4ce27a72773 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -11,8 +11,8 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
+#include <linux/container_of.h>
 #include <linux/dma-buf-map.h>
-#include <linux/kernel.h> /* for container_of() */
 
 struct drm_mode_create_dumb;
 struct drm_plane;
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index 9b4292f229c6..ac33ba1b18bc 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -39,13 +39,15 @@
  */
 #include <linux/bug.h>
 #include <linux/rbtree.h>
-#include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/mm_types.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #ifdef CONFIG_DRM_DEBUG_MM
 #include <linux/stackdepot.h>
 #endif
+#include <linux/types.h>
+
 #include <drm/drm_print.h>
 
 #ifdef CONFIG_DRM_DEBUG_MM
-- 
2.33.0

