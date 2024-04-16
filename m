Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C188B8A781F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE710F3C8;
	Tue, 16 Apr 2024 22:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cexpf13j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4E910F20D;
 Tue, 16 Apr 2024 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713307805; x=1744843805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qkx1MaBONA0HBn0V1VicNxLk74eP8a4b6N/OV2hwGmE=;
 b=cexpf13jFUEPLMelzDuS7Phn7NGKfnmjKXNuX72fzg5uwzs7PSpxsza8
 fIQzb64A4vmHFy93Tme3FmKQLdtC9wGo9Uu+YLlr0Kln4OouqPbAhwwzt
 QJMbQAWXz8SOhl3pu916AuFfvJ86mx+phoerXlUeIrymwFba6/tLbIHbF
 sk/wR1C9IrnU1uaT4iIcbBjt5so3zr5MEqFbZ1rIWxuwbueXJrHW9GO+a
 8SxjrbDcx4R1PVPLGo/2wnqpfS9+lwW5VA8PZljfXoGOavT+o9NRR2FdX
 UEdHwVCtoGuzv8qBSJwJ0smXXJI3XHzYXacNREDzrFFMR3gIOeLqz5KoG A==;
X-CSE-ConnectionGUID: CtYjpZxsS7+JyrlikaDshA==
X-CSE-MsgGUID: pHkvR68hQryvRxfLa8nVDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8641294"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8641294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:50:04 -0700
X-CSE-ConnectionGUID: uVWjsg9uRQ6cWIZjpp0aGQ==
X-CSE-MsgGUID: Rj4vbulSRFGH/1yiL402dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22481497"
Received: from unknown (HELO intel.com) ([10.247.119.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:50:01 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Refactor uabi engine class/instance list creation
Date: Wed, 17 Apr 2024 00:49:53 +0200
Message-ID: <20240416224953.385726-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Hi,

just sending this patch to unburden the coming series from this
single patch inherited from a previously sent series.

Andi

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
2.43.0

