Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD785DEEE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A6710E763;
	Wed, 21 Feb 2024 14:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6+Pjfwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2E10E75F;
 Wed, 21 Feb 2024 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708525375; x=1740061375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wXjzPegQ7hzstl5iyH+W9m9S39ybvpWc+jKEcYQl4Go=;
 b=F6+PjfwdxxnhpadQOCFwqFBp3KDakRkmN3Goy5f3hilcmmx4MLp+ytjP
 FkXyFHcl+RuHqGnlyw3Wws05WPqTe0OCKFXwzGfUKwkSikDsXqCLvJY5r
 sH3a3UWxW1bfxHlv0NurnRzStfhVF/t2YO88qtiRg44Hdkg+6heqTWCch
 vECTirn7fEJz7b/noRaLoEa7ktEOLyOwMGEGoAjeZiyJXAIusBSSzX4gW
 OjUWntI0DYuxLvpoyu22YILoQ8SGLQCOvaPZQ2XjGt12XsZkJ9SxikXH8
 NdsbC3I0CkScZY2ptIoDrIkvOwiFmB1CzlzIBUmQXoAl2wRzz/cZvn1GG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14096334"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="14096334"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9845692"
Received: from jdoyle1x-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:22:53 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Carlos Santa <carlos.santa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/i915: Shadow default engine context image in the
 context
Date: Wed, 21 Feb 2024 14:22:44 +0000
Message-Id: <20240221142245.2331484-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240221142245.2331484-1-tvrtko.ursulin@linux.intel.com>
References: <20240221142245.2331484-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

To enable adding override of the default engine context image let us start
shadowing the per engine state in the context.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h   | 2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c             | 7 ++++---
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 7 ++++---
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 7eccbd70d89f..b179178680a5 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -99,6 +99,8 @@ struct intel_context {
 	struct i915_address_space *vm;
 	struct i915_gem_context __rcu *gem_context;
 
+	struct file *default_state;
+
 	/*
 	 * @signal_lock protects the list of requests that need signaling,
 	 * @signals. While there are any requests that need signaling,
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7c367ba8d9dc..d4eb822d20ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1060,9 +1060,8 @@ void lrc_init_state(struct intel_context *ce,
 
 	set_redzone(state, engine);
 
-	if (engine->default_state) {
-		shmem_read(engine->default_state, 0,
-			   state, engine->context_size);
+	if (ce->default_state) {
+		shmem_read(ce->default_state, 0, state, engine->context_size);
 		__set_bit(CONTEXT_VALID_BIT, &ce->flags);
 		inhibit = false;
 	}
@@ -1174,6 +1173,8 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
 
 	GEM_BUG_ON(ce->state);
 
+	ce->default_state = engine->default_state;
+
 	vma = __lrc_alloc_state(ce, engine);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 92085ffd23de..8625e88e785f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -474,8 +474,7 @@ static int ring_context_init_default_state(struct intel_context *ce,
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
-	shmem_read(ce->engine->default_state, 0,
-		   vaddr, ce->engine->context_size);
+	shmem_read(ce->default_state, 0, vaddr, ce->engine->context_size);
 
 	i915_gem_object_flush_map(obj);
 	__i915_gem_object_release_map(obj);
@@ -491,7 +490,7 @@ static int ring_context_pre_pin(struct intel_context *ce,
 	struct i915_address_space *vm;
 	int err = 0;
 
-	if (ce->engine->default_state &&
+	if (ce->default_state &&
 	    !test_bit(CONTEXT_VALID_BIT, &ce->flags)) {
 		err = ring_context_init_default_state(ce, ww);
 		if (err)
@@ -570,6 +569,8 @@ static int ring_context_alloc(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
 
+	ce->default_state = engine->default_state;
+
 	/* One ringbuffer to rule them all */
 	GEM_BUG_ON(!engine->legacy.ring);
 	ce->ring = engine->legacy.ring;
-- 
2.40.1

