Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB3E845A5D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 15:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7E610E6E2;
	Thu,  1 Feb 2024 14:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ25h6rO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0B710E5E9;
 Thu,  1 Feb 2024 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706798012; x=1738334012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOZ8qoyvsO0EiZIYOqY7ZCIJ9jsI5Ale860kLi6LMSg=;
 b=VJ25h6rOeDpfrq13m2UA7nqSOhb6y7JXiYDiBzR9t8LQ4KQbedeuHUrl
 A27tTRmpfoD608J0tTl7RWl3KnHeAwYJm1OyVYHwKiK5RbkBfqmaXG15l
 +m4fTbacJKyj2GgzCE7DCBwYg1IVTN6GfyOIcGM/wfDWCx6Da6MUD6F4J
 hJlzziZACsqZ5G0/uCyfc9LVzuwJajeGXxJDqNXPQfjmLjCSTOpVw1GVI
 cfRs/aBha1XBgmymt55oOyiob4ynvlLltBTwOm9HGgM7bCi8kuhLV04Iw
 Z+0upQdUWWBdM3zsIH5piRyqIeIyLSTyjAXnh9QbloSBNYRE9VcVcOc8u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401036937"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401036937"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4425734"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:33:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH v3 2/2] drm: Add CONFIG_DRM_WERROR
Date: Thu,  1 Feb 2024 16:33:09 +0200
Message-Id: <d198aa042dadb034409d4343a9403fba95c740a0.1706797803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706797803.git.jani.nikula@intel.com>
References: <cover.1706797803.git.jani.nikula@intel.com>
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

Add kconfig to enable -Werror subsystem wide. This is useful for
development and CI to keep the subsystem warning free, while avoiding
issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
hit.

v2: Don't depend on COMPILE_TEST

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/Makefile |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 872edb47bb53..706fe169bd8e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -413,3 +413,16 @@ config DRM_LIB_RANDOM
 config DRM_PRIVACY_SCREEN
 	bool
 	default n
+
+config DRM_WERROR
+	bool "Compile the drm subsystem with warnings as errors"
+	depends on EXPERT
+	default n
+	help
+	  A kernel build should not cause any compiler warnings, and this
+	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
+
+	  The drm subsystem enables more warnings than the kernel default, so
+	  this config option is disabled by default.
+
+	  If in doubt, say N.
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 04722a5dfb78..ea2791487229 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -30,6 +30,9 @@ subdir-ccflags-y += -Wno-sign-compare
 endif
 # --- end copy-paste
 
+# Enable -Werror in CI and development
+subdir-ccflags-$(CONFIG_DRM_WERROR) += -Werror
+
 drm-y := \
 	drm_aperture.o \
 	drm_atomic.o \
-- 
2.39.2

