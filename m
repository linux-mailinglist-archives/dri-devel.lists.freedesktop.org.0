Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A84C0023
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C4610EB8C;
	Tue, 22 Feb 2022 17:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B3B10EB7C;
 Tue, 22 Feb 2022 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645550815; x=1677086815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xqff8hT2sslG1mdDrG1PBKNPQ/JVRc+8V++vkhf3+Mg=;
 b=dgjtKrGOqOHPEWoFnwlS3Dws0ymROTzULjKh+8baE9yjHbn74sHMBKNU
 Ms2/KTBDimAzMcbi76Kc0HeOKdJIatmma+n7dYn13fgDiI52PSBJNqPAc
 HDGQY64wJ/XN7tTRVpkMqNOqY1w09rzLwYpW4oY5Ig0Eb9pvM94kb2xq9
 cM/M/Y1fT7NreT+G5okh9Owei+czcSoZVcc/fmPnyfqRXVXOJ551KA6QV
 8wOx2kgsZ3vpCyvTFQfzEXCcQiKC0IZe7lWI+Kd+Ungs7MSq9ddtCReh7
 e8/wvbaOOCGeHf5/TZzfeyuceL088qK0xxGctRu6yTy4vQ478JFbvbOql Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231736917"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="231736917"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 09:26:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="683594316"
Received: from shreyasj-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.209.93.217])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 09:26:54 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915/gem: Remove logic for wbinvd_on_all_cpus
Date: Tue, 22 Feb 2022 09:26:48 -0800
Message-Id: <20220222172649.331661-3-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222172649.331661-1-michael.cheng@intel.com>
References: <20220222172649.331661-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch removes logic for wbinvd_on_all_cpus and brings in
drm_cache.h. This header has the logic that outputs a warning
when wbinvd_on_all_cpus when its being used on a non-x86 platform.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 00359ec9d58b..ee4783e4d135 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -13,12 +13,7 @@
 #include "i915_driver.h"
 #include "i915_drv.h"
 
-#if defined(CONFIG_X86)
-#include <asm/smp.h>
-#else
-#define wbinvd_on_all_cpus() \
-	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
-#endif
+#include <drm/drm_cache.h>
 
 void i915_gem_suspend(struct drm_i915_private *i915)
 {
-- 
2.25.1

