Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A44503D8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7936E6E9A8;
	Mon, 15 Nov 2021 11:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9566E9A8;
 Mon, 15 Nov 2021 11:53:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="213459181"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="213459181"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:32 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="671477488"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] agp/intel-gtt: reduce intel-gtt dependencies more
Date: Mon, 15 Nov 2021 13:53:13 +0200
Message-Id: <7bcaa1684587b9b008d3c41468fb40e63c54fbc7.1636977089.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1636977089.git.jani.nikula@intel.com>
References: <cover.1636977089.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't include stuff on behalf of users if they're not strictly necessary
for the header.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/char/agp/intel-gtt.c         | 1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 1 +
 include/drm/intel-gtt.h              | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/agp/intel-gtt.c b/drivers/char/agp/intel-gtt.c
index 5bfdf222d5f9..c53cc9868cd8 100644
--- a/drivers/char/agp/intel-gtt.c
+++ b/drivers/char/agp/intel-gtt.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/pagemap.h>
 #include <linux/agp_backend.h>
+#include <linux/intel-iommu.h>
 #include <linux/delay.h>
 #include <asm/smp.h>
 #include "agp.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 0c956e5e7fc7..555111c3bee5 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/agp_backend.h>
 #include <linux/stop_machine.h>
 
 #include <asm/set_memory.h>
diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
index 4e5f8e7e25d0..67530bfef129 100644
--- a/include/drm/intel-gtt.h
+++ b/include/drm/intel-gtt.h
@@ -4,10 +4,9 @@
 #ifndef _DRM_INTEL_GTT_H
 #define	_DRM_INTEL_GTT_H
 
-#include <linux/agp_backend.h>
-#include <linux/intel-iommu.h>
 #include <linux/types.h>
 
+struct agp_bridge_data;
 struct pci_dev;
 struct sg_table;
 
-- 
2.30.2

