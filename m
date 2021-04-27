Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B043F36C143
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 10:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0076B6E151;
	Tue, 27 Apr 2021 08:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA46E060;
 Tue, 27 Apr 2021 08:54:34 +0000 (UTC)
IronPort-SDR: 7hNVom0mu1G39D05FqhGTN8QWRAt+Kh8fov5/Sz+VdcekKFefzKj4ASJIqCWoRLd6SmT8BW/Eb
 TOJWIllfbhrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="260428686"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="260428686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:54:32 -0700
IronPort-SDR: XwmMQg58DTuRwNvDId3GK0BGD/k3AaFLjJBO6YYowHceWF2E/7RIYPeKtxgBBVmaO2w0VzKFVt
 4NTL9ggdiDFQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="422978833"
Received: from galinart-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.239])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:54:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/i915/dg1: Fix mapping type for default state object
Date: Tue, 27 Apr 2021 09:54:11 +0100
Message-Id: <20210427085417.120246-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

Use I915_MAP_WC when default state object is allocated in LMEM.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index f8f02aab842b..0683b27a3890 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -8,6 +8,7 @@
 #include <linux/shmem_fs.h>
 
 #include "gem/i915_gem_object.h"
+#include "gem/i915_gem_lmem.h"
 #include "shmem_utils.h"
 
 struct file *shmem_create_from_data(const char *name, void *data, size_t len)
@@ -39,7 +40,8 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
 		return file;
 	}
 
-	ptr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	ptr = i915_gem_object_pin_map_unlocked(obj, i915_gem_object_is_lmem(obj) ?
+						I915_MAP_WC : I915_MAP_WB);
 	if (IS_ERR(ptr))
 		return ERR_CAST(ptr);
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
