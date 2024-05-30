Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60F8D4C74
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8BD10E4FF;
	Thu, 30 May 2024 13:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHlU8LIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC90112502;
 Thu, 30 May 2024 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075206; x=1748611206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JSu3bQMJ/NXCJea98r2Rhs/jTpKMVQcfGkUm8eww2Tc=;
 b=iHlU8LImuMbdNYjJRs5j6yulNqnULpRalxK8dOKsf7umZ6y9/rnAsyEU
 ijBCRhKw+y7TczM1Sszuji4fBEhjqIRgLAi4Kd8R64XLIViMM2V3ZLPtJ
 Hi+mDg9B5koXqD4wDbFnd3IrD4wzdr4M8pkg9I6hkxpOxvf9rWVQ7BMjJ
 1fCbgFiBEFK9cvu70ZEY1mpRbKIFKd7t5pzmQHUd8Gb2Dxs+L/E9uuVMN
 kT0bo4HKtIF8/453EpxJOD7qQYVaHcu1d4RJMWobBOY7oqy0pQGeCFGhb
 fDXciHF0JddBvQv0U+K81zVfWZbAIUYXadXlT2aoMwUmHajNGW0jNkY4m A==;
X-CSE-ConnectionGUID: 1y2ophH6T7q1Tdpjisb7zg==
X-CSE-MsgGUID: YlIy7AckSwChKYfLK58ebw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13431586"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13431586"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:05 -0700
X-CSE-ConnectionGUID: oJXGtfwTSemKgfTDOAGzDQ==
X-CSE-MsgGUID: FCoapcfITbWkDh6Sln7j1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35845659"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 08/10] drm: move xe_pciids.h under include/drm/intel
Date: Thu, 30 May 2024 16:19:09 +0300
Message-Id: <e19543f2ae978678c2ff814454f07c96ccd02175.1717075103.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
References: <cover.1717075103.git.jani.nikula@intel.com>
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

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c         | 2 +-
 include/drm/{ => intel}/xe_pciids.h | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename include/drm/{ => intel}/xe_pciids.h (100%)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1385d68c12c9..5655222aa4e1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -13,7 +13,7 @@
 
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
-#include <drm/xe_pciids.h>
+#include <drm/intel/xe_pciids.h>
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
diff --git a/include/drm/xe_pciids.h b/include/drm/intel/xe_pciids.h
similarity index 100%
rename from include/drm/xe_pciids.h
rename to include/drm/intel/xe_pciids.h
-- 
2.39.2

