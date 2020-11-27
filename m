Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67102C654E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5516ED06;
	Fri, 27 Nov 2020 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD26ED01;
 Fri, 27 Nov 2020 12:11:31 +0000 (UTC)
IronPort-SDR: 3H2UNiUB8j7eRPdEXzhMnghtsRSF2GzILqp0FOttnJuRhQ6bRkWSlhPt6+FZ7JdAKpQQyS5NBy
 sv4dZgDafngw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092906"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:31 -0800
IronPort-SDR: 2si7V3/3/TrTwqUiiBqYf8YKIS29Fy9q9yZflD9aMgKMGW85yD6RkfqwwE1Y4zlE1EgSpqOCH4
 j9rnWh45AiBA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029799"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 124/162] drm/i915/lmem: allocate HWSP in lmem
Date: Fri, 27 Nov 2020 12:06:40 +0000
Message-Id: <20201127120718.454037-125-matthew.auld@intel.com>
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
 Michel Thierry <michel.thierry@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michel Thierry <michel.thierry@intel.com>

Signed-off-by: Michel Thierry <michel.thierry@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 10 +++++++++-
 drivers/gpu/drm/i915/gt/intel_timeline.c  |  8 +++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 0ba020346566..9e0394b06f38 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -25,6 +25,7 @@
 #include <drm/drm_print.h>
 
 #include "gem/i915_gem_context.h"
+#include "gem/i915_gem_lmem.h"
 
 #include "i915_drv.h"
 
@@ -657,7 +658,14 @@ static int init_status_page(struct intel_engine_cs *engine)
 	 * in GFP_DMA32 for i965, and no earlier physical address users had
 	 * access to more than 4G.
 	 */
-	obj = i915_gem_object_create_internal(engine->i915, PAGE_SIZE);
+	if (HAS_LMEM(engine->i915)) {
+		obj = i915_gem_object_create_lmem(engine->i915,
+						  PAGE_SIZE,
+						  I915_BO_ALLOC_CONTIGUOUS |
+						  I915_BO_ALLOC_VOLATILE);
+	} else {
+		obj = i915_gem_object_create_internal(engine->i915, PAGE_SIZE);
+	}
 	if (IS_ERR(obj)) {
 		drm_err(&engine->i915->drm,
 			"Failed to allocate status page\n");
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 065943781586..589559b526eb 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -6,6 +6,7 @@
 
 #include "i915_drv.h"
 
+#include "gem/i915_gem_lmem.h"
 #include "i915_active.h"
 #include "i915_syncmap.h"
 #include "intel_gt.h"
@@ -34,7 +35,12 @@ static int __hwsp_alloc(struct intel_gt *gt, struct intel_timeline_hwsp *hwsp)
 	int type;
 	int ret;
 
-	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
+	if (HAS_LMEM(i915))
+		obj = i915_gem_object_create_lmem(i915, PAGE_SIZE,
+						  I915_BO_ALLOC_CONTIGUOUS |
+						  I915_BO_ALLOC_VOLATILE);
+	else
+		obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
