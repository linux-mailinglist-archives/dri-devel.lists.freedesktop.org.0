Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1552C651E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226886ECC7;
	Fri, 27 Nov 2020 12:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91266ECC7;
 Fri, 27 Nov 2020 12:10:48 +0000 (UTC)
IronPort-SDR: 1aV9j1d06nuGxW0ExZVOP/S0pf8sJMubd+UCXGVHch88WerCv4SS1ZizVhFZNwJu/NmAnDRKEo
 4a4yqSAPCIww==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092798"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092798"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:39 -0800
IronPort-SDR: 7TjejjbqZVIF4Am2VbwmJRuSYG1OaP2RDKBaYNmhPyUWP1mKDzXF3jJsfdE1KpPawioR6VvsdG
 U5upukv8JjNQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029463"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 104/162] drm/i915: move engine scratch to LMEM
Date: Fri, 27 Nov 2020 12:06:20 +0000
Message-Id: <20201127120718.454037-105-matthew.auld@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 44f1d51e5ae5..caf2e72de1a6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -4,6 +4,8 @@
  */
 
 #include "debugfs_gt.h"
+
+#include "gem/i915_gem_lmem.h"
 #include "i915_drv.h"
 #include "intel_context.h"
 #include "intel_gt.h"
@@ -342,9 +344,15 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
 	struct i915_vma *vma;
 	int ret;
 
-	obj = i915_gem_object_create_stolen(i915, size);
-	if (IS_ERR(obj))
-		obj = i915_gem_object_create_internal(i915, size);
+	if (HAS_LMEM(i915)) {
+		obj = i915_gem_object_create_lmem(i915, size,
+						  I915_BO_ALLOC_CONTIGUOUS |
+						  I915_BO_ALLOC_VOLATILE);
+	} else {
+		obj = i915_gem_object_create_stolen(i915, size);
+		if (IS_ERR(obj))
+			obj = i915_gem_object_create_internal(i915, size);
+	}
 	if (IS_ERR(obj)) {
 		DRM_ERROR("Failed to allocate scratch page\n");
 		return PTR_ERR(obj);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
