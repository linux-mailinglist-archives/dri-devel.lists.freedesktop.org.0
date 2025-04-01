Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33800A77AA4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEE810E586;
	Tue,  1 Apr 2025 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbX1VpJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2158110E324;
 Tue,  1 Apr 2025 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743509960; x=1775045960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+JFvSQ26FarxrRAOquTbPWkCD8Pzve2Gh9zf2uf7Ew=;
 b=jbX1VpJy3JZalOIPMZ67A88AXrC4zSXIw0WCCsV+MigyAVAtRAmzwObw
 dO6eEyDy4M/C7IPtS+T4ysDSZ4UHU65sTA8KqvOPZk8KlyulBmL+rvfOT
 k2wcr/Rfy1ilyFBT2Dg7sgupFvjjOcm5irmvETIMclu/hZuHwd9OSkrsw
 ve7MaWvdlAbQCD2cfPpU1cAzCONKdnYkpxjFL3CGKnrToeIPm2nglXfLL
 +u6fNXulV3Vq2wfh9QTfnaObbe1FZJBu6eiLW1axJy5fVkf0/k5uMBUQ7
 117LWJZ7jXu2gkY30uzG2fzhgTBQUpeoUlC4T2XtAXBnos9BJTjeS9eNq A==;
X-CSE-ConnectionGUID: ikfUYhJ8RpytRKosldXKxQ==
X-CSE-MsgGUID: DhiDsMAwSvSxQKcnbJMlmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44981762"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44981762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:19:20 -0700
X-CSE-ConnectionGUID: O3fed8/ISRavwWB0+7AiGA==
X-CSE-MsgGUID: X3cpC3b2Skq3VReLpCGmUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="157365168"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:19:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, Masahiro Yamada <masahiroy@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm: add config option for extra build-time checks
Date: Tue,  1 Apr 2025 15:18:30 +0300
Message-Id: <20250401121830.21696-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401121830.21696-1-jani.nikula@intel.com>
References: <20250401121830.21696-1-jani.nikula@intel.com>
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

The DRM subsystem contains additional build-time checks, primarily aimed
at DRM developers and CI systems. The checks may be overzealous. They
may slow down or fail the build altogether. They may create excessive
dependency files in the build tree. They should not be enabled for
regular builds, and certainly not forced on unsuspecting developers
running an allyesconfig or allmodconfig build.

Add config DRM_DISABLE_EXTRA_BUILD_CHECKS, enabled by default as well as
by allyesconfig/allmodconfig, hiding the extra checks from anyone but
people who intentionally opt-in for the checks.

For example, to enable header tests:

$ scripts/config --disable CONFIG_DRM_DISABLE_EXTRA_BUILD_CHECKS --enable CONFIG_DRM_HEADER_TEST
$ make olddefconfig

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com
Fixes: 62ae45687e43 ("drm: ensure drm headers are self-contained and pass kernel-doc")
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2cba2b6ebe1c..5a3fce9ef998 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -489,9 +489,26 @@ config DRM_PRIVACY_SCREEN
 	bool
 	default n
 
+# Reversed option to disable on allyesconfig/allmodconfig builds
+config DRM_DISABLE_EXTRA_BUILD_CHECKS
+	bool "Disable DRM subsystem extra build-time checks"
+	default y
+	help
+	  The DRM subsystem contains additional build-time checks, primarily
+	  aimed at DRM developers and CI systems. The checks may be
+	  overzealous. They may slow down or fail the build altogether. They may
+	  create excessive dependency files in the tree. They should not be
+	  enabled for regular builds, and thus they are disabled by default.
+
+# Proxy config to allow simple "depends on DRM_EXTRA_BUILD_CHECKS"
+config DRM_EXTRA_BUILD_CHECKS
+	bool
+	depends on DRM && EXPERT && DRM_DISABLE_EXTRA_BUILD_CHECKS=n
+	default !DRM_DISABLE_EXTRA_BUILD_CHECKS
+
 config DRM_WERROR
 	bool "Compile the drm subsystem with warnings as errors"
-	depends on DRM && EXPERT
+	depends on DRM_EXTRA_BUILD_CHECKS
 	depends on !WERROR
 	default n
 	help
@@ -505,7 +522,7 @@ config DRM_WERROR
 
 config DRM_HEADER_TEST
 	bool "Ensure DRM headers are self-contained and pass kernel-doc"
-	depends on DRM && EXPERT && BROKEN
+	depends on DRM_EXTRA_BUILD_CHECKS
 	default n
 	help
 	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
-- 
2.39.5

