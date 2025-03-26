Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0438A72729
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838710E796;
	Wed, 26 Mar 2025 23:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd6WgXwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA00610E796;
 Wed, 26 Mar 2025 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032448; x=1774568448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pP5/UWSGcS8q2Imu26bLoyXiWQfUfxs2LGdRR/o8DGM=;
 b=Pd6WgXwfmQyeg+vV1KjqIj+nysw5g+/pSGzjvEHQvjfRTuMFX7m3ZA4N
 +oY02dNqi8YHFHEwvj0fi8NTIVhmLu1UURUbcDT9SGhooF3WqhZp8sahn
 /0Km1MuD69UCgoAyM6UuHeJb86EO9IicpqkukZ/W8jGDZk7NJnhYzoURr
 2H60PoO5xWb5gRh9R0ammEsxeEBwPKmtCQGi0yX4g8orPCGtHGu9C59Fq
 OB7sN536bP82n7TMny774VKa+9jY9uhB+uYdEbDIp2v9sA7nI6K7FmEfK
 a07t7N4ohDQQqsiXnXjjXtDmIi+risM/Ci0E5yb+thB2KDfvirCjn1GZo w==;
X-CSE-ConnectionGUID: 3ebyTjXHR3uV+nD2KMLlMA==
X-CSE-MsgGUID: f0MjF32SS6+IlQ7plD1atw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61741445"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61741445"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:48 -0700
X-CSE-ConnectionGUID: gwO0MftlTjWa1rJHfpPGOg==
X-CSE-MsgGUID: NRtEeMzURNaQf9MaUaAScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148143333"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:45 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 5/6] drm/i915/gt/uc: Use FIRST_CCS() helper for one-time
 CCS operations
Date: Thu, 27 Mar 2025 00:40:04 +0100
Message-ID: <20250326234005.1574688-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
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

From: Andi Shyti <andi.shyti@intel.com>

Replace checks for I915_ENGINE_FIRST_RENDER_COMPUTE combined
with CCS_MASK() with the FIRST_CCS() helper. This improves
readability and ensures that certain CCS-specific actions, such
as enabling GEN12_RCU_MODE and calling xehp_enable_ccs_engines(),
are performed only once, on the first CCS engine encountered.

This is particularly relevant for platforms like DG2, which
support multiple CCS engines.

Signed-off-by: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c        | 3 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 46fabbfc775e..bf1686af29e7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -392,8 +392,7 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	ret |= GUC_MMIO_REG_ADD(gt, regset, RING_HWS_PGA(base), false);
 	ret |= GUC_MMIO_REG_ADD(gt, regset, RING_IMR(base), false);
 
-	if ((engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) &&
-	    CCS_MASK(engine->gt))
+	if (FIRST_CCS(engine))
 		ret |= GUC_MMIO_REG_ADD(gt, regset, GEN12_RCU_MODE, true);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f8cb7c630d5b..18545196c9f4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4422,7 +4422,7 @@ static int guc_resume(struct intel_engine_cs *engine)
 	setup_hwsp(engine);
 	start_engine(engine);
 
-	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
+	if (FIRST_CCS(engine))
 		xehp_enable_ccs_engines(engine);
 
 	return 0;
-- 
2.47.2

