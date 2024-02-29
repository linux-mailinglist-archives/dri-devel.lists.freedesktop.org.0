Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E51C86D7D2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 00:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8D10E696;
	Thu, 29 Feb 2024 23:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXgTYZRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D68310E696;
 Thu, 29 Feb 2024 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709249358; x=1740785358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FsJg7da216jGR+DSt67oF8jsZ7fqGOUmPlzjNCsMDdU=;
 b=eXgTYZRhoLBae9SFMSuio8tCeJ+xILWQnevLqgPhE0kVG0b052MjAV1i
 ov0Ww25RqIA/9BFh3kmRVHEAPjG1pBmZiHgQdsAHAYef1RZH4Y5obenPW
 E1CITDdHrwshdSIYr9BOe9vKl4ekdb1rj8W02XXFRzx5V8gB/mlWkJ/nv
 tSbZRNLgdG04HvCh/gqQGsMXMcTo76/LXIczN2IJw+8t0NwDnjC2kvCSi
 m8WZYUJBh+sGBZHU7oHk7lEXmFP0+fLqSWmFULCiS6DpMumqv3+jaDFl2
 xtGOoYF/BpVGh/MxM/9w78oNEbzgZUdHw5p8nvKR1F+gRdF/MR2Fn5zCo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15201218"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="15201218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="45544060"
Received: from syhu-mobl2.ccr.corp.intel.com (HELO intel.com) ([10.94.248.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:14 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 2/4] drm/i915/gt: Do not exposed fused off engines.
Date: Fri,  1 Mar 2024 00:28:57 +0100
Message-ID: <20240229232859.70058-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229232859.70058-1-andi.shyti@linux.intel.com>
References: <20240229232859.70058-1-andi.shyti@linux.intel.com>
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

Some of the CCS engines are disabled. They should not be listed
in the uabi_engine list, that is the list of engines that the
user can see.

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Requires: 4e4f77d74878 ("drm/i915/gt: Refactor uabi engine class/instance list creation")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index cf8f24ad88f6..ec5bcd1c1ec4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -244,6 +244,18 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
 			continue;
 
+		/*
+		 * If the CCS engine is fused off, the corresponding bit
+		 * in the engine mask is disabled. Do not expose it
+		 * to the user.
+		 *
+		 * By default at least one engine is enabled (check
+		 * the engine_mask_apply_compute_fuses() function.
+		 */
+		if (!(engine->gt->info.engine_mask &
+		      BIT(_CCS(engine->uabi_instance))))
+			continue;
+
 		GEM_BUG_ON(uabi_class >=
 			   ARRAY_SIZE(i915->engine_uabi_class_count));
 		i915->engine_uabi_class_count[uabi_class]++;
-- 
2.43.0

