Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A9BB3C1FD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228AE10E1C0;
	Fri, 29 Aug 2025 17:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8avuxjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E1B10E1C0;
 Fri, 29 Aug 2025 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756489576; x=1788025576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iINmr2KFYoSGsHTNTuQy3QPX4Iv/FtsHEayJdZ4JN8Q=;
 b=C8avuxjmhLeD7uA7aMNiwBTbOXBZ79mjCAx0EA+X4mQsqU+0SkPiRiG2
 KXaq//iZGqy/vNRS+iJGXCYJIpD+muDerCk77PGHhb7Il0LqYNdqOHWiv
 61FFjmTU3jaakdLFWj+vH/l5s10GcIZct5etIUji8CfzCQLAeYtQiyapF
 idsc9AW/8fj8pXSoLlWiaVgnHgxNVcbIbD8G3f/8C9vnI+BPBtYxb8mi/
 MxKF8es3g9wR0lx1Ry1JuwV8r4Qp9SM3qX/F8Nl3ZKRyh24FUUa9s5PWk
 UbAHUMFmMgdx85dNZcS/0ajJzfzpaYHYf19XWSU6YHGsm3Q8Ug5KwZlWX A==;
X-CSE-ConnectionGUID: ycYogkYPQGqyyguo0viJLw==
X-CSE-MsgGUID: Ef9uk8hqRbqXrWD0s1cXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58851383"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58851383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:46:16 -0700
X-CSE-ConnectionGUID: QVvqT+VwSzuYmS61GvWMGg==
X-CSE-MsgGUID: Zka0mUPyQ02fm5dlf3hXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175716538"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:46:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, jani.nikula@intel.com,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH 1/3] drm/i915: rename range_overflows_end() to
 range_end_overflows()
Date: Fri, 29 Aug 2025 20:45:59 +0300
Message-ID: <20250829174601.2163064-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Rename range_overflows_end() to range_end_overflows(), along with the _t
variant.

It's all rather subjective, but I think range_end_overflows() reads
better.

Cc: Kees Cook <kees@kernel.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_rc6.c      | 2 +-
 drivers/gpu/drm/i915/i915_utils.h        | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index d4c5deff9cbe..446e2ad28a70 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -383,11 +383,11 @@ static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = to_i915(display->drm);
 
 	drm_WARN_ON(display->drm,
-		    range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
+		    range_end_overflows_t(u64, i915_gem_stolen_area_address(i915),
 					  i915_gem_stolen_node_offset(&fbc->compressed_fb),
 					  U32_MAX));
 	drm_WARN_ON(display->drm,
-		    range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
+		    range_end_overflows_t(u64, i915_gem_stolen_area_address(i915),
 					  i915_gem_stolen_node_offset(&fbc->compressed_llb),
 					  U32_MAX));
 	intel_de_write(display, FBC_CFB_BASE,
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 9ca42589da4d..bf38cc5fe872 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -341,7 +341,7 @@ static int vlv_rc6_init(struct intel_rc6 *rc6)
 		return PTR_ERR(pctx);
 	}
 
-	GEM_BUG_ON(range_overflows_end_t(u64,
+	GEM_BUG_ON(range_end_overflows_t(u64,
 					 i915->dsm.stolen.start,
 					 pctx->stolen->start,
 					 U32_MAX));
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 9cb40c2c4b12..fdac9a158b53 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -79,7 +79,7 @@ bool i915_error_injected(void);
 #define range_overflows_t(type, start, size, max) \
 	range_overflows((type)(start), (type)(size), (type)(max))
 
-#define range_overflows_end(start, size, max) ({ \
+#define range_end_overflows(start, size, max) ({ \
 	typeof(start) start__ = (start); \
 	typeof(size) size__ = (size); \
 	typeof(max) max__ = (max); \
@@ -88,8 +88,8 @@ bool i915_error_injected(void);
 	start__ > max__ || size__ > max__ - start__; \
 })
 
-#define range_overflows_end_t(type, start, size, max) \
-	range_overflows_end((type)(start), (type)(size), (type)(max))
+#define range_end_overflows_t(type, start, size, max) \
+	range_end_overflows((type)(start), (type)(size), (type)(max))
 
 #define ptr_mask_bits(ptr, n) ({					\
 	unsigned long __v = (unsigned long)(ptr);			\
-- 
2.47.2

