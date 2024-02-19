Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA185A473
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BC110E200;
	Mon, 19 Feb 2024 13:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8ktyfK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D1610E0CB;
 Mon, 19 Feb 2024 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708348472; x=1739884472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=awlK11oBWPA87O8+7x2I7emzv0K7uQA5T6cTuDiuUIM=;
 b=i8ktyfK8Qgk7jTscnVmRlUYKQF43Hd3uL1GofAFFzBT4lIrF4w7NlzSq
 yg7AAPAQ2EJPJk8DrJWENhowrG4XrxmYygiCyaLlJcxvw1cAajeHX4NLl
 4IPIre+RCUhCcZhWsRFWMl18XFPvsABzU9Sj8uRHpSmn7zTmTeVlHuDJn
 kE+bNoNl9L27r3C7oVbu0c/CqtYPZBooiPAE4UcDT/9SU1PEJ6a41cge9
 Y8sI+Udc1OZ9nmZZEwnwvIQwvAhSrlUgJBxbeTmsAg4BZq2zpQOVt5o3k
 h514WUznUVuJ+9RcX7aniNjD0OcPNAX6pUDfLfaQh+SihTlkWyc3fEo3e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2549998"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2549998"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:14:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4451962"
Received: from coldacre-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.215.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:14:29 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/i915: Fix possible null pointer dereference after
 drm_dbg_printer conversion
Date: Mon, 19 Feb 2024 13:14:23 +0000
Message-Id: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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

Request can be NULL if no guilty request was identified so simply use
engine->i915 instead.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: d50892a9554c ("drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Luca Coelho <luciano.coelho@intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 5f8d86e25993..8d4bb95f8424 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -96,8 +96,8 @@ static void heartbeat_commit(struct i915_request *rq,
 static void show_heartbeat(const struct i915_request *rq,
 			   struct intel_engine_cs *engine)
 {
-	struct drm_printer p = drm_dbg_printer(&rq->i915->drm, DRM_UT_DRIVER,
-					       "heartbeat");
+	struct drm_printer p =
+		drm_dbg_printer(&engine->i915->drm, DRM_UT_DRIVER, "heartbeat");
 
 	if (!rq) {
 		intel_engine_dump(engine, &p,
-- 
2.40.1

