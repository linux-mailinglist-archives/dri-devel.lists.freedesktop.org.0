Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A295BD2F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B63410EB8C;
	Thu, 22 Aug 2024 17:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i430OEkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9523F10EB83;
 Thu, 22 Aug 2024 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347749; x=1755883749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGqZlLASKOiUpSGJmG2JheBwcGaqDp6yUy/4Dd817zo=;
 b=i430OEkX46nl9Z254vmyacTDOiEZZC2fYtoG/wK4Bx+xC3EPZ61RQrxG
 BSOtMgOCN0uRBwzh4GbU2OOnFp4ZqqkjdWz00SIbzTIh7F5WAqOr2ola2
 gLCBlUo58UecV8lf3wG8E2byJNeYMZft7xG5PtR/gSXFQxnoZz74T2ApP
 2bLoGFx01X3Keh/nrlJGdi2C5GAKVCfN2w44J2ZHifyIrKYPh4HwBTKXv
 sRGN3hQWe0JPXjBOKC7t9TK0HKble8yf8CJY5l1ofVycQ+ejd+KBrp+5D
 53SMErd4rhHPknKM6MZLzgL9bXcKHCTusZmkTzOvMmj22jkNGtNWk2Xx8 g==;
X-CSE-ConnectionGUID: AK/bY7nfTNycQWHsjuvTqA==
X-CSE-MsgGUID: X2y0e7bCQkSJ3pqI0HsQCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33448265"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33448265"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:08 -0700
X-CSE-ConnectionGUID: cOfiNl/FTMuyHc++vBmxnQ==
X-CSE-MsgGUID: SWP6Y0k6TCyFVnWCHQc+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61501114"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:07 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 04/15] drm/i915/gt: Refactor uabi engine class/instance
 list creation
Date: Thu, 22 Aug 2024 19:28:21 +0200
Message-ID: <20240822172832.494994-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the upcoming changes we need a cleaner way to build the list
of uabi engines.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 29 ++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..11cc06c0c785 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -203,7 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
 
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
-	u16 name_instance, other_instance = 0;
+	u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 2] = { };
 	struct legacy_ring ring = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
@@ -214,6 +214,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 	prev = NULL;
 	p = &i915->uabi_engines.rb_node;
 	list_for_each_safe(it, next, &engines) {
+		u16 uabi_class;
+
 		struct intel_engine_cs *engine =
 			container_of(it, typeof(*engine), uabi_list);
 
@@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
-		if (engine->uabi_class == I915_NO_UABI_CLASS) {
-			name_instance = other_instance++;
-		} else {
-			GEM_BUG_ON(engine->uabi_class >=
-				   ARRAY_SIZE(i915->engine_uabi_class_count));
-			name_instance =
-				i915->engine_uabi_class_count[engine->uabi_class]++;
-		}
-		engine->uabi_instance = name_instance;
+
+		if (engine->uabi_class == I915_NO_UABI_CLASS)
+			uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
+		else
+			uabi_class = engine->uabi_class;
+
+		GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));
+		engine->uabi_instance = class_instance[uabi_class]++;
 
 		/*
 		 * Replace the internal name with the final user and log facing
@@ -238,11 +239,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		 */
 		engine_rename(engine,
 			      intel_engine_class_repr(engine->class),
-			      name_instance);
+			      engine->uabi_instance);
 
-		if (engine->uabi_class == I915_NO_UABI_CLASS)
+		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
 			continue;
 
+		GEM_BUG_ON(uabi_class >=
+			   ARRAY_SIZE(i915->engine_uabi_class_count));
+		i915->engine_uabi_class_count[uabi_class]++;
+
 		rb_link_node(&engine->uabi_node, prev, p);
 		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
 
-- 
2.45.2

