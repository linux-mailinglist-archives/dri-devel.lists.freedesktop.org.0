Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B852C6597
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BC16EDA2;
	Fri, 27 Nov 2020 12:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302F86ECB5;
 Fri, 27 Nov 2020 12:12:48 +0000 (UTC)
IronPort-SDR: Mr6lk6cUpVlqSgg/+zDjoJnruwm89NFZaWl9UMGo4qXDzD340ZNuRK1aUE5aequtxAZM2BkHZM
 uRBxCz+9ncGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883892"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883892"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:32 -0800
IronPort-SDR: b1KzdwnxoUxnep4MPYZMLTEjZVM8D0GyfeZKf5ZajVkEHDft6dYTot8CmrfPJBsotDgMmAXrZC
 YyFeRh3Z+nZA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030077"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:30 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 159/162] drm/i915/dg1: Fix mapping type for default state
 object
Date: Fri, 27 Nov 2020 12:07:15 +0000
Message-Id: <20201127120718.454037-160-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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

Use I915_MAP_WC when default state object is allocated on LMEM.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 041e2a50160d..1fbc070a4651 100644
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
