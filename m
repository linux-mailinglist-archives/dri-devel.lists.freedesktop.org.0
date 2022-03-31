Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D04EDB6F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A523810EE2D;
	Thu, 31 Mar 2022 14:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8E410E732;
 Thu, 31 Mar 2022 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735775; x=1680271775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvJtbjaiyo18vSt0V+OzlGZjRF7mfVnj6BlDD8Nrkxs=;
 b=aO4UZwR9vS5vj2Cdbb5VnGVPDYk5XvuGAaeIN5Sy9sJwUWq/F97pRy+g
 0MF6RLXRYX4fpYXNSAQeTSMcWo42k97dpVrhnd7zlDHfD7RXZ67bbplBF
 u68N5r8iRTlktLRzZIrPpezCTzk8RaYpOMnMcxjas2ga7KSvPtv7qj9Lm
 VBMmHOq1kAWbk/uBDqJ/ynYe7BSmxx/gh+C+vDZS2PW4m1SarpojpE613
 MV4WXkGTAuIQjkBP5P4HrEIMdjJN0NPfZOZBw9ix6XRFoY1UPZPw8I1o9
 poNoH0qVG+SUJZB3yxmbMBVeY74HMxe2SenVITjhCFH7o0VDDNOFhVBaL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259825451"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259825451"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606114221"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:33 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915: Count engine instances per uabi class
Date: Thu, 31 Mar 2022 15:09:19 +0100
Message-Id: <20220331140920.2986689-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This will be useful to have at hand in a following patch.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 11 ++++++-----
 drivers/gpu/drm/i915/i915_drv.h             |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index b8c9b6b89003..0f6cd96b459f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -193,7 +193,6 @@ static void add_legacy_ring(struct legacy_ring *ring,
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
 	struct legacy_ring ring = {};
-	u8 uabi_instances[5] = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
 	LIST_HEAD(engines);
@@ -214,8 +213,10 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
 
-		GEM_BUG_ON(engine->uabi_class >= ARRAY_SIZE(uabi_instances));
-		engine->uabi_instance = uabi_instances[engine->uabi_class]++;
+		GEM_BUG_ON(engine->uabi_class >=
+			   ARRAY_SIZE(i915->engine_uabi_class_count));
+		engine->uabi_instance =
+			i915->engine_uabi_class_count[engine->uabi_class]++;
 
 		/* Replace the internal name with the final user facing name */
 		memcpy(old, engine->name, sizeof(engine->name));
@@ -245,8 +246,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		int class, inst;
 		int errors = 0;
 
-		for (class = 0; class < ARRAY_SIZE(uabi_instances); class++) {
-			for (inst = 0; inst < uabi_instances[class]; inst++) {
+		for (class = 0; class < ARRAY_SIZE(i915->engine_uabi_class_count); class++) {
+			for (inst = 0; inst < i915->engine_uabi_class_count[class]; inst++) {
 				engine = intel_engine_lookup_user(i915,
 								  class, inst);
 				if (!engine) {
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index bbda3e01d03d..7f33cf2afb9e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -500,6 +500,7 @@ struct drm_i915_private {
 	struct pci_dev *bridge_dev;
 
 	struct rb_root uabi_engines;
+	unsigned int engine_uabi_class_count[I915_LAST_UABI_ENGINE_CLASS + 1];
 
 	struct resource mch_res;
 
-- 
2.32.0

