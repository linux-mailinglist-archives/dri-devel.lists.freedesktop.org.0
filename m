Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3841616FF9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 22:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1010E675;
	Wed,  2 Nov 2022 21:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C474E10E670;
 Wed,  2 Nov 2022 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667425219; x=1698961219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qWuhBKbHPJb36cGFU0VU6v9K4YPjSVx+VcZb+ch+i20=;
 b=iEtEqCQecJmk+iUK+g/UlR6KPdPkIrNG7jHst3CCzsKqq/VffyB2DiGs
 zQWejoN6cUIaEYWwxscw9oHrhcT3nVNw3vijHCCvS3jU69/fh6PAURzRY
 KJeqRX0GxIV4foQmYCkaGNh7Co16/0i8tI343HAitS7njNlm3UhQ6o39J
 np6yiu8OV2bgxw6b4iWT69/map8UZ9a9Q5KxuY7hFEiyf+LUeUcef0Zz2
 5gumQWnMnqyJinqBJ2V7lrxtTnuLI+xNbsU24LRbhGxWcS5Q84gfAjyUp
 BJNmhxXC6WIng35Apv6/hFIMnzUutDH8o3hgDDQPI7d/F/Rnu0hwHNNu8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="307141210"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="307141210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 14:40:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="697974532"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="697974532"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 14:40:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: don't hardcode BCS0 in guc_hang selftest
Date: Wed,  2 Nov 2022 14:43:10 -0700
Message-Id: <20221102214310.2829310-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL there are no BCS engines on the media GT, so we can't always use
BCS0 in the test. There is no actual reason to use a BCS engine over an
engine of a different class, so switch to using any available engine.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
index 01f8cd3c3134..d91b58f70403 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
@@ -35,11 +35,14 @@ static int intel_hang_guc(void *arg)
 	struct i915_request *rq;
 	intel_wakeref_t wakeref;
 	struct i915_gpu_error *global = &gt->i915->gpu_error;
-	struct intel_engine_cs *engine;
+	struct intel_engine_cs *engine = intel_selftest_find_any_engine(gt);
 	unsigned int reset_count;
 	u32 guc_status;
 	u32 old_beat;
 
+	if (!engine)
+		return 0;
+
 	ctx = kernel_context(gt->i915, NULL);
 	if (IS_ERR(ctx)) {
 		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
@@ -48,14 +51,13 @@ static int intel_hang_guc(void *arg)
 
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
-	ce = intel_context_create(gt->engine[BCS0]);
+	ce = intel_context_create(engine);
 	if (IS_ERR(ce)) {
 		ret = PTR_ERR(ce);
 		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
 		goto err;
 	}
 
-	engine = ce->engine;
 	reset_count = i915_reset_count(global);
 
 	old_beat = engine->props.heartbeat_interval_ms;
-- 
2.37.3

