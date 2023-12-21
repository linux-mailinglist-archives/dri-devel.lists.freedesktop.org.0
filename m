Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F381C10C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956B910E72D;
	Thu, 21 Dec 2023 22:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB56110E71C;
 Thu, 21 Dec 2023 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197695; x=1734733695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G6FwInhmVgslPiDEh7NzRcFZRdFlcS3bGJvtIQWy4Cc=;
 b=aLNb5q4Wyv4JM8yf3QB8wNOjTsl2AQOEUTG0QAKuqyqBJzTbgqKwb74/
 +lLsAbxMaSEsd1L9DzOhNxOkgKOVfaal//zKyCX96i5NLGfVVFPqXXE3d
 wo6Q9ESsH7ky7zMAgtwQ9Z+FdghjWz5LOt+RU+GR6WE32ySm0+nyUG+o5
 ZbUP8IToDZucQScy0HCRwpmOYDijAp+0JpiMQSLaaRV/NiXKpJyevf3T2
 /xGu+4FtgH76zAuL+a/0Hp3TJTbgHXZqn0FHd9Wch0IMq774tyOghejFV
 bkphLzy2a6LPfdaBdbfCC8CddaAjLOu3UDeU48a6IsqgAdYyEUBsYDWXO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876527"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876527"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458219"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458219"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/xe/display: Avoid calling readq()
Date: Thu, 21 Dec 2023 14:28:07 -0800
Message-Id: <20231221222809.4123220-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221222809.4123220-1-lucas.demarchi@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 ogabbay@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 airlied@gmail.com
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

