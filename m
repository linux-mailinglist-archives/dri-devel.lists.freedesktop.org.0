Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA34BAAF1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595E10E809;
	Thu, 17 Feb 2022 20:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC2810E790;
 Thu, 17 Feb 2022 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645129616; x=1676665616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVDGf1dJNIS7op/ho91MBOqEVTzq6Y+bedisro38V48=;
 b=HNCmrCAcLps4/VCxNQf1tqeXJ3hbB0tWD0h0Pdoy9Md6iKVV93oThl9u
 e4v6xKkUsvBwKf2nzcHw+VTGJ6/G0JUCMPVclrF++phprXPWZ9cnVxg4i
 0O0V8EhvuR5bHcNmfFlmBzZ8oHpUC9tFJi/2YiPWxG7s+NkFjboJyvVda
 0lzYHeZUjHcDbZuKwV3VvB583FIzNjAxqGooVDjtLJYgNXxSsJqPI5UX9
 F6DjxPI7BFW6nISnJnR6I9+xD1R5blbk+m/Vh6Xy0c1CHZRoqVdlEU0qK
 XPpdqcywPSvpO2ejDMKJ4XMNZl3orGeBDTshSFdfUv9mcv+zX3NDHG9X2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238370947"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="238370947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545842101"
Received: from zlwang-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.198.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:55 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/gem: Remove logic for wbinvd_on_all_cpus
Date: Thu, 17 Feb 2022 12:26:43 -0800
Message-Id: <20220217202644.122937-3-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217202644.122937-1-michael.cheng@intel.com>
References: <20220217202644.122937-1-michael.cheng@intel.com>
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
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_cache.h now handles calls to wbinvd_on_all_cpus.

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

