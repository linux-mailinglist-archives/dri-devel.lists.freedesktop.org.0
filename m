Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1FB5A2436
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548A10E7D9;
	Fri, 26 Aug 2022 09:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAE010E7D2;
 Fri, 26 Aug 2022 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661505835; x=1693041835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5ubSVm0qy0aiuAplX+caL5gzwAORJfcY1m0LqYoDoNc=;
 b=l/v5SrokYg5Jnw7edQgJSSe48El38SbBCrKalHwcFAyXPzqQHANW0O7Q
 1izfzs6s4S1XnX47hOb4/qcmRSnShu3l6mZ1m1paVP/X+E1fxiqLYEqS4
 w+BQotaBzL6ir3kkSpvG6A2CqQcUZcvKVMR8Jt2OJ16liBeDHptogMFcs
 7pJaL8jXrHy9jWm29P7w8CIb2yELzTkWUJeWIZ5BHJBDQux5ZLcHSNQ4N
 k/eAbUdzA10QwJumIMerzseZRJRVBlG/tdhpelVTn9Yzy3j1snE3K3FWo
 HvFKAv8v2Rw2oRfdIbe79mbDIE9L3UTjUE5rKvxWPUF3K0M0gPkv532Ov g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="294470138"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="294470138"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:23:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="561379589"
Received: from jaoriord-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.12.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:23:51 -0700
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/i915/guc: Remove log size module parameters
Date: Fri, 26 Aug 2022 12:23:43 +0300
Message-Id: <20220826092343.184568-1-joonas.lahtinen@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the module parameters for configuring GuC log size.

We should instead rely on tuning the defaults to be usable for
reporting bugs.

v2:
- Use correct 1M unit

Fixes: 8ad0152afb1b ("drm/i915/guc: Make GuC log sizes runtime configurable")
Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  7 +++----
 drivers/gpu/drm/i915/i915_params.c         | 12 ------------
 drivers/gpu/drm/i915/i915_params.h         |  3 ---
 3 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 3a2243b4ac9f..55d4b8f8e33e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -79,9 +79,9 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 		}
 	};
 	s32 params[GUC_LOG_SECTIONS_LIMIT] = {
-		i915->params.guc_log_size_crash,
-		i915->params.guc_log_size_debug,
-		i915->params.guc_log_size_capture,
+		GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE / SZ_1M,
+		GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE / SZ_1M,
+		GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE / SZ_1M,
 	};
 	int i;
 
@@ -90,7 +90,6 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 
 	/* If debug size > 1MB then bump default crash size to keep the same units */
 	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
-	    (i915->params.guc_log_size_crash == -1) &&
 	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
 		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
 
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 06ca5b822111..6fc475a5db61 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -171,18 +171,6 @@ i915_param_named(guc_log_level, int, 0400,
 	"GuC firmware logging level. Requires GuC to be loaded. "
 	"(-1=auto [default], 0=disable, 1..4=enable with verbosity min..max)");
 
-i915_param_named(guc_log_size_crash, int, 0400,
-	"GuC firmware logging buffer size for crash dumps (in MB)"
-	"(-1=auto [default], NB: max = 4, other restrictions apply)");
-
-i915_param_named(guc_log_size_debug, int, 0400,
-	"GuC firmware logging buffer size for debug logs (in MB)"
-	"(-1=auto [default], NB: max = 16, other restrictions apply)");
-
-i915_param_named(guc_log_size_capture, int, 0400,
-	"GuC error capture register dump buffer size (in MB)"
-	"(-1=auto [default], NB: max = 4, other restrictions apply)");
-
 i915_param_named_unsafe(guc_firmware_path, charp, 0400,
 	"GuC firmware path to use instead of the default one");
 
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index f684d1ab8707..2733cb6cfe09 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -61,9 +61,6 @@ struct drm_printer;
 	param(int, invert_brightness, 0, 0600) \
 	param(int, enable_guc, -1, 0400) \
 	param(int, guc_log_level, -1, 0400) \
-	param(int, guc_log_size_crash, -1, 0400) \
-	param(int, guc_log_size_debug, -1, 0400) \
-	param(int, guc_log_size_capture, -1, 0400) \
 	param(char *, guc_firmware_path, NULL, 0400) \
 	param(char *, huc_firmware_path, NULL, 0400) \
 	param(char *, dmc_firmware_path, NULL, 0400) \
-- 
2.37.2

