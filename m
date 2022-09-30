Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA25F040C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 07:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C093010EB4D;
	Fri, 30 Sep 2022 05:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C6710E1A4;
 Fri, 30 Sep 2022 05:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664514591; x=1696050591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SGUsbKhOm0pdXxXmw6qbwtIINHibHeem7UpuGzGQz90=;
 b=BfqcwCsII8/Sw3iYS+/OxQABrZwlHBghC8MSMoPxcNtPfToMsubFw6f4
 THOd3iY3XmoQ2EOr75k6aqXa+XQGYH0R1tzle791Pu0H2ImSnQlv9mWaU
 QdMx3cqLzDyTOwQ/VCRKLWLUC+s9CG5ArGYm0IQ1Zdv+XSi0koPGyKiok
 K4PTa/NGXLXgYngNUzQ2j4uhGNMY/MzVIKxo1IHRS0pIoPuRUUezq4WLC
 2TAXvgsHVyuca/tNXHhG2pvkTITd9FCh0flFf5BnT9ywKv+gSbeYaptol
 qPER3YEj8EqNYQw5+5MINKIsBQylzFf0CI9yMrmiAGbJL6VGX9Ps84ifu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="299707897"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="299707897"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="711668539"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="711668539"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/gt: Fix platform prefix
Date: Thu, 29 Sep 2022 22:09:03 -0700
Message-Id: <20220930050903.3479619-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930050903.3479619-1-lucas.demarchi@intel.com>
References: <20220930050903.3479619-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Different handling for XeHP and later platforms should be using the
xehp prefix, not gen125. Rename them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 24 +++++++++----------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h      | 12 +++++-----
 .../drm/i915/gt/intel_execlists_submission.c  |  4 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index e000eaf8abed..e1c76e5bfa82 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -396,10 +396,10 @@ int gen8_emit_init_breadcrumb(struct i915_request *rq)
 	return 0;
 }
 
-static int __gen125_emit_bb_start(struct i915_request *rq,
-				  u64 offset, u32 len,
-				  const unsigned int flags,
-				  u32 arb)
+static int __xehp_emit_bb_start(struct i915_request *rq,
+				u64 offset, u32 len,
+				const unsigned int flags,
+				u32 arb)
 {
 	struct intel_context *ce = rq->context;
 	u32 wa_offset = lrc_indirect_bb(ce);
@@ -437,18 +437,18 @@ static int __gen125_emit_bb_start(struct i915_request *rq,
 	return 0;
 }
 
-int gen125_emit_bb_start_noarb(struct i915_request *rq,
-			       u64 offset, u32 len,
-			       const unsigned int flags)
+int xehp_emit_bb_start_noarb(struct i915_request *rq,
+			     u64 offset, u32 len,
+			     const unsigned int flags)
 {
-	return __gen125_emit_bb_start(rq, offset, len, flags, MI_ARB_DISABLE);
+	return __xehp_emit_bb_start(rq, offset, len, flags, MI_ARB_DISABLE);
 }
 
-int gen125_emit_bb_start(struct i915_request *rq,
-			 u64 offset, u32 len,
-			 const unsigned int flags)
+int xehp_emit_bb_start(struct i915_request *rq,
+		       u64 offset, u32 len,
+		       const unsigned int flags)
 {
-	return __gen125_emit_bb_start(rq, offset, len, flags, MI_ARB_ENABLE);
+	return __xehp_emit_bb_start(rq, offset, len, flags, MI_ARB_ENABLE);
 }
 
 int gen8_emit_bb_start_noarb(struct i915_request *rq,
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
index e4d24c811dd6..655e5c00ddc2 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
@@ -32,12 +32,12 @@ int gen8_emit_bb_start(struct i915_request *rq,
 		       u64 offset, u32 len,
 		       const unsigned int flags);
 
-int gen125_emit_bb_start_noarb(struct i915_request *rq,
-			       u64 offset, u32 len,
-			       const unsigned int flags);
-int gen125_emit_bb_start(struct i915_request *rq,
-			 u64 offset, u32 len,
-			 const unsigned int flags);
+int xehp_emit_bb_start_noarb(struct i915_request *rq,
+			     u64 offset, u32 len,
+			     const unsigned int flags);
+int xehp_emit_bb_start(struct i915_request *rq,
+		       u64 offset, u32 len,
+		       const unsigned int flags);
 
 u32 *gen8_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs);
 u32 *gen12_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index c718e6dc40b5..0187bc72310d 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3471,9 +3471,9 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 
 	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50)) {
 		if (intel_engine_has_preemption(engine))
-			engine->emit_bb_start = gen125_emit_bb_start;
+			engine->emit_bb_start = xehp_emit_bb_start;
 		else
-			engine->emit_bb_start = gen125_emit_bb_start_noarb;
+			engine->emit_bb_start = xehp_emit_bb_start_noarb;
 	} else {
 		if (intel_engine_has_preemption(engine))
 			engine->emit_bb_start = gen8_emit_bb_start;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0ef295a94060..d81f68fef9a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4094,7 +4094,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 
 	engine->emit_bb_start = gen8_emit_bb_start;
 	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
-		engine->emit_bb_start = gen125_emit_bb_start;
+		engine->emit_bb_start = xehp_emit_bb_start;
 }
 
 static void rcs_submission_override(struct intel_engine_cs *engine)
-- 
2.37.3

