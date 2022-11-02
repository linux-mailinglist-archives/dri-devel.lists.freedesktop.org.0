Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C4616A0F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBCE10E511;
	Wed,  2 Nov 2022 17:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175B10E518;
 Wed,  2 Nov 2022 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667408910; x=1698944910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6CFSztkRB584Z0WS53OTAd+62vP+Rhr7QzCZ2mrTDxo=;
 b=D5GEWfYboBOvi/kL9ndS6zoHO9nG8piOT6LRNiqztj5ZIISQPL7Sejpi
 AVOP+j4LUrAdHsX8PlsjEgq4LyxhnAf4rtC6IM1TzFCBCrdNQIH2J4W0x
 8Ow4+8QEqS4t6LHf2we7Hg//s/u+ZFkfTveUZNKcHAKx6En5oNvi0ikQr
 df7bkilROmJWgrIxO+TGVi71XUJ9dSyHe8OBYNX3QZpLVnYWVHiS9fnDl
 oR0uLNFbNH0S6n4HbXx8Y+bCOCitTLUH/mDiFnIDvSCQwMGlS3Tpy9E9m
 X7Itd3eiBbpf7nwcNL93N0l6tQE1ylVXuEkpWbwrg8ZJ8+Pcf3hudFEsc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395777190"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="395777190"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="739835406"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="739835406"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:05 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/i915/mtl: don't expose GSC command streamer to the
 user
Date: Wed,  2 Nov 2022 10:10:47 -0700
Message-Id: <20221102171047.2787951-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no userspace user for this CS yet, we only need it for internal
kernel ops (e.g. HuC, PXP), so don't expose it.

v2: even if it's not exposed, rename the engine so it is easier to
identify in the debug logs (Matt)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 27 ++++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 79312b734690..cd4f1b126f75 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -191,6 +191,15 @@ static void add_legacy_ring(struct legacy_ring *ring,
 		ring->instance++;
 }
 
+static void engine_rename(struct intel_engine_cs *engine, const char *name, u16 instance)
+{
+	char old[sizeof(engine->name)];
+
+	memcpy(old, engine->name, sizeof(engine->name));
+	scnprintf(engine->name, sizeof(engine->name), "%s%u", name, instance);
+	drm_dbg(&engine->i915->drm, "renamed %s to %s\n", old, engine->name);
+}
+
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
 	struct legacy_ring ring = {};
@@ -206,11 +215,19 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		struct intel_engine_cs *engine =
 			container_of((struct rb_node *)it, typeof(*engine),
 				     uabi_node);
-		char old[sizeof(engine->name)];
 
 		if (intel_gt_has_unrecoverable_error(engine->gt))
 			continue; /* ignore incomplete engines */
 
+		/*
+		 * We don't want to expose the GSC engine to the users, but we
+		 * still rename it so it is easier to identify in the debug logs
+		 */
+		if (engine->id == GSC0) {
+			engine_rename(engine, "gsc", 0);
+			continue;
+		}
+
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
 
@@ -220,11 +237,9 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 			i915->engine_uabi_class_count[engine->uabi_class]++;
 
 		/* Replace the internal name with the final user facing name */
-		memcpy(old, engine->name, sizeof(engine->name));
-		scnprintf(engine->name, sizeof(engine->name), "%s%u",
-			  intel_engine_class_repr(engine->class),
-			  engine->uabi_instance);
-		DRM_DEBUG_DRIVER("renamed %s to %s\n", old, engine->name);
+		engine_rename(engine,
+			      intel_engine_class_repr(engine->class),
+			      engine->uabi_instance);
 
 		rb_link_node(&engine->uabi_node, prev, p);
 		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
-- 
2.37.3

