Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEFD2C6586
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178CD6ED9C;
	Fri, 27 Nov 2020 12:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75306ED8F;
 Fri, 27 Nov 2020 12:12:17 +0000 (UTC)
IronPort-SDR: 57GVVoFoi1FOkIQfweP9lqQIm2Pd/ZZisYXE1AG3KfIRc1DaNd6Y+JpP2KaakZbSJPTq47ru2z
 XB+I4Zx8oyDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883856"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883856"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:17 -0800
IronPort-SDR: UGDmbgwzNigaSrZYg5Ox9fXxoGOyN0DZ2nA/rjvhE9iDt76NhzTHIdt+iaheUmFQRBqv9+SI6w
 No8sbXAkujrg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030018"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 150/162] drm/i915: need consider system BO snoop for dgfx
Date: Fri, 27 Nov 2020 12:07:06 +0000
Message-Id: <20201127120718.454037-151-matthew.auld@intel.com>
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
Cc: Sudeep Dutt <sudeep.dutt@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>, CQ Tang <cq.tang@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

When cache_level is NONE, we check HAS_LLC(i915).
But additionally for DGFX, we also need to check
HAS_SNOOP(i915) on system memory object to use
I915_BO_CACHE_COHERENT_FOR_READ. on dg1, has_llc=0, and
has_snoop=1. Otherwise, we set obj->cache_choerent=0 and
have performance impact.

Cc: Chris P Wilson <chris.p.wilson@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index ddb448f275eb..be603171c444 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -95,6 +95,20 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 	mutex_init(&obj->mm.get_dma_page.lock);
 }
 
+static bool i915_gem_object_use_llc(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+
+	if (HAS_LLC(i915))
+		return true;
+
+	if (IS_DGFX(i915) && HAS_SNOOP(i915) &&
+	    !i915_gem_object_is_lmem(obj))
+		return true;
+
+	return false;
+}
+
 /**
  * Mark up the object's coherency levels for a given cache_level
  * @obj: #drm_i915_gem_object
@@ -108,7 +122,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 	if (cache_level != I915_CACHE_NONE)
 		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
 				       I915_BO_CACHE_COHERENT_FOR_WRITE);
-	else if (HAS_LLC(to_i915(obj->base.dev)))
+	else if (i915_gem_object_use_llc(obj))
 		obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
 	else
 		obj->cache_coherent = 0;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
