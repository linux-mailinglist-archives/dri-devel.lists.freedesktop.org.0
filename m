Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B017F82F355
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB110E324;
	Tue, 16 Jan 2024 17:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EDC10E0B6;
 Tue, 16 Jan 2024 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705426954; x=1736962954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G6FwInhmVgslPiDEh7NzRcFZRdFlcS3bGJvtIQWy4Cc=;
 b=bH0FpdXJb9xQH4yr86tS/I3j5V+xvRhx4/LQnLQmtaI+dh3lewxDufRm
 kdoRm/c4+GOT2k4N8ErhkwJW7UmQLxq3fQ2Gqtds/7BYVkNNXVrBt5UqI
 PLEUWINuR2hoF4f0o/U4+DAbIScXtbM4WcUH1HkW2rNP4aq7HbyTkulsP
 LENIa4Bf8fRmZ8qGlhXXXRUtOCYFhWedQxkfQC8CxPURCqzpkE8GxqM+o
 zymS/M1vDd9cDdbIePuDacOWlFHR5PUsrm1XjCzci7qAodktK0w+URylW
 RJVfs9bPHa6aJVSCzvBvC8vRgnQDyp7FvGOd5OjNzA26IpuJ1nWLjYyeI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13288227"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="13288227"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927555530"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="927555530"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/xe/display: Avoid calling readq()
Date: Tue, 16 Jan 2024 09:40:48 -0800
Message-Id: <20240116174050.2435923-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116174050.2435923-1-lucas.demarchi@intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, ogabbay@kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

readq() is not available in 32bits. iosys-map already has the logic in
place to use read u64 in all cases, so simply add a helper variable for
using that.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 5f19550cc845..6739dadaf1a9 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -7,6 +7,7 @@
 #define _I915_GEM_OBJECT_H_
 
 #include <linux/types.h>
+#include <linux/iosys-map.h>
 
 #include "xe_bo.h"
 
@@ -36,6 +37,7 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
 {
 	struct ttm_bo_kmap_obj map;
 	void *virtual;
+	struct iosys_map vaddr;
 	bool is_iomem;
 	int ret;
 
@@ -52,10 +54,11 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
 	ofs &= ~PAGE_MASK;
 	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
 	if (is_iomem)
-		*ptr = readq((void __iomem *)(virtual + ofs));
+		iosys_map_set_vaddr_iomem(&vaddr, (void __iomem *)(virtual));
 	else
-		*ptr = *(u64 *)(virtual + ofs);
+		iosys_map_set_vaddr(&vaddr, virtual);
 
+	*ptr = iosys_map_rd(&vaddr, ofs, u64);
 	ttm_bo_kunmap(&map);
 out_unlock:
 	xe_bo_unlock(bo);
-- 
2.40.1

