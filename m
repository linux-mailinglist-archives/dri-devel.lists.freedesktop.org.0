Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E383895606
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A3810FD59;
	Tue,  2 Apr 2024 14:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHuuwFs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425810FD55;
 Tue,  2 Apr 2024 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712066521; x=1743602521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MnbKETqqvlRt+Iy6DkMGMtHlisuIC0nQBpZ9iTeinyw=;
 b=RHuuwFs1RbUotaiF3Ioyo8SALmkz7My2LhjxL6lJ/VL67rv1X+pTkcG5
 /yFFsR0aTX0eQqGa+VpLAbKfSJy3prgi7NdLd0hGrjbq5iT7xEX0qHFpj
 TYr7Em7xqPkx7UZj/wnY2EAdV2PJ1557TbpuQkCupneaS5soEnEUuV1A7
 o2VKrIL7WMZw96OSPDaNlieoooc+y2+yy7BfQ76FwzxPAsNy0zFmkXxcC
 qgvrUYCVNxnI6pIaoQrd4PGmgL1XBAitLhJOsfMQqOaQJPZlXTIS7xl7m
 QMNjmZ9q3q3nEy34hZ7i9eRTkfItbRzChWTY5j+stOcQuI5//RPDqPeWP Q==;
X-CSE-ConnectionGUID: 1nYx+0w7ToSS+0q8YzRGFA==
X-CSE-MsgGUID: cH0tJNY3QAy5i/Llue7gDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7090235"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7090235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:02:00 -0700
X-CSE-ConnectionGUID: uNwqPLJ4TjGy4wfV8QLNiA==
X-CSE-MsgGUID: 3bYASW+EQwmBK4dYaX9Duw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18149661"
Received: from pramona-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.179])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:01:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2] drm: ensure drm headers are self-contained and pass
 kernel-doc
Date: Tue,  2 Apr 2024 17:01:36 +0300
Message-Id: <20240402140136.1722533-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Ensure drm headers build, are self-contained, have header guards, and
have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=y.

The mechanism follows similar patters used in i915, xe, and usr/include.

To cover include/drm, we need to recurse there using the top level
Kbuild and the new include/Kbuild files.

v2: make DRM_HEADER_TEST depend on DRM

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Kbuild                   |  1 +
 drivers/gpu/drm/Kconfig  | 11 +++++++++++
 drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
 include/Kbuild           |  1 +
 include/drm/Makefile     | 18 ++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 include/Kbuild
 create mode 100644 include/drm/Makefile

diff --git a/Kbuild b/Kbuild
index 464b34a08f51..f327ca86990c 100644
--- a/Kbuild
+++ b/Kbuild
@@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES)	+= samples/
 obj-$(CONFIG_NET)	+= net/
 obj-y			+= virt/
 obj-y			+= $(ARCH_DRIVERS)
+obj-$(CONFIG_DRM_HEADER_TEST)	+= include/
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3914aaf443a8..a388c4fda984 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -431,3 +431,14 @@ config DRM_WERROR
 	  this config option is disabled by default.
 
 	  If in doubt, say N.
+
+config DRM_HEADER_TEST
+	bool "Ensure DRM headers are self-contained and pass kernel-doc"
+	depends on DRM && EXPERT
+	default n
+	help
+	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
+	  include/drm compile, are self-contained, have header guards, and have
+	  no kernel-doc warnings.
+
+	  If in doubt, say N.
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a73c04d2d7a3..6605d5686d01 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -218,3 +218,21 @@ obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
+
+# Ensure drm headers are self-contained and pass kernel-doc
+hdrtest-files := \
+	$(shell cd $(srctree)/$(src) && find . -maxdepth 1 -name 'drm_*.h') \
+	$(shell cd $(srctree)/$(src) && find display lib -name '*.h')
+
+always-$(CONFIG_DRM_HEADER_TEST) += \
+	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
+
+# Include the header twice to detect missing include guard.
+quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+      cmd_hdrtest = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_DRM_WERROR),-Werror) $<; \
+		touch $@
+
+$(obj)/%.hdrtest: $(src)/%.h FORCE
+	$(call if_changed_dep,hdrtest)
diff --git a/include/Kbuild b/include/Kbuild
new file mode 100644
index 000000000000..5e76a599e2dd
--- /dev/null
+++ b/include/Kbuild
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_HEADER_TEST)	+= drm/
diff --git a/include/drm/Makefile b/include/drm/Makefile
new file mode 100644
index 000000000000..b9f391d7aadd
--- /dev/null
+++ b/include/drm/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Ensure drm headers are self-contained and pass kernel-doc
+hdrtest-files := \
+	$(shell cd $(srctree)/$(src) && find * -name '*.h' 2>/dev/null)
+
+always-$(CONFIG_DRM_HEADER_TEST) += \
+	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
+
+# Include the header twice to detect missing include guard.
+quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+      cmd_hdrtest = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_DRM_WERROR),-Werror) $<; \
+		touch $@
+
+$(obj)/%.hdrtest: $(src)/%.h FORCE
+	$(call if_changed_dep,hdrtest)
-- 
2.39.2

