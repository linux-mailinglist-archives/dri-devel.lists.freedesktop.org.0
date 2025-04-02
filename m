Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AEEA78EE4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0AE10E0A4;
	Wed,  2 Apr 2025 12:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLyzR+AS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7FA10E0A4;
 Wed,  2 Apr 2025 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743598052; x=1775134052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5VI9ZLfR6Us/gAEzp8GzzGH2ksRebnMw1CHva4QmGk=;
 b=lLyzR+ASX8laYTGZVBlKOzctX3MdsQcDTDvVKUuX0P1Z1JmMmAqlBqtE
 jA4KZB0t4Boz99o8AfY88OU3N+AqZ8WzfdtxNe6kPRHdCgPYpi42+TRmN
 Ch6iBBBG1EQMwzBVddjKRBtIrUkS6iVFeGNZrKI4o+7A8IhubtJ11/HHl
 x1AHre765p9SSvOnT/NlFyPCgskhmKAn1I2pHhZF0WrG55+lXcnHxWg2r
 yyFIYs5YTsAdEokPcuZphSARTYr3hDVcVXvMSVlEwyL9xSr95F8dbRvy+
 5RDyfzxf+TtygoqUYzDD+ohbhuIyBfrqyGb5WT/QShZ9LyR6XMeFnQbqj A==;
X-CSE-ConnectionGUID: kgSRkMRwRq+Wa/dBbS/xdA==
X-CSE-MsgGUID: CDR4p2rwT02QXQMybYF6MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953478"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="55953478"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:47:31 -0700
X-CSE-ConnectionGUID: Qm6j3l87QeyOmk7HqQrGjw==
X-CSE-MsgGUID: /PtvqrrtQXqWU0aknNHXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127180654"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:47:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, Jason Gunthorpe <jgg@nvidia.com>,
 Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915: switch to generic header check facility
Date: Wed,  2 Apr 2025 15:46:55 +0300
Message-Id: <20250402124656.629226-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
References: <20250402124656.629226-1-jani.nikula@intel.com>
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

Switch to the generic header check facility, and sunset the copy-pasted
local version.

Keep the header checks gated on CONFIG_DRM_I915_WERROR as before. To be
unified later.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: c6d4a099a240 ("drm/i915: reimplement header test feature")
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/Makefile | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..dca187e58bda 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -411,19 +411,9 @@ ifdef CONFIG_DRM_I915_WERROR
     cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
 endif
 
-# header test
-
 # exclude some broken headers from the test coverage
 no-header-test := \
 	display/intel_vbt_defs.h
 
-always-$(CONFIG_DRM_I915_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
-		$(shell cd $(src) && find * -name '*.h')))
-
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
-		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
-
-$(obj)/%.hdrtest: $(src)/%.h FORCE
-	$(call if_changed_dep,hdrtest)
+header-check-$(CONFIG_DRM_I915_WERROR) += \
+	$(filter-out $(no-header-test),$(shell cd $(src) && find * -name '*.h'))
-- 
2.39.5

