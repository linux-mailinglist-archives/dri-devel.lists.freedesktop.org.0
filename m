Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD5873F67
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA9E113455;
	Wed,  6 Mar 2024 18:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2uSZj47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC3B11344A;
 Wed,  6 Mar 2024 18:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709750005; x=1741286005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ZK7ytZ6+eBUdeS0KJgTV+/J3pXqIY/fgoKxUZW/rVc=;
 b=P2uSZj47wLB3oOotfPQGWwmUjOarXvTuXyOm7XrvYT4m4gO9CnlApOQc
 Qd/EDPlxHd0uV3qTAehDuU4Vxp5Wa6djyFO0H68q8xAakbFUR0BSW1RKW
 w2iNp70ml6wH8TJCbYv0geFay8fjXZ+H6pU+uq3oDEYEpuJWmsGGp4XKk
 0i96KnPDTCbw5OUUYes3PWX1UkDm/VYYci2ql6OwaWr+dr21vwIxVKfvl
 0cBfdAQnf3xJ9Qks5dkO0rahD1meWTXgLbqwrk4r5feSiJsLXF2nC24lC
 5LCUySs7Vr2TY9OhZ7XvBWK/hGNNYTRcrBfyDFXE2AcYi5EDZhelqvgbZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102892"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9989580"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 22/22] drm: ensure drm headers are self-contained and pass
 kernel-doc
Date: Wed,  6 Mar 2024 20:31:27 +0200
Message-Id: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
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
index c08e18108c2a..dd17685ef6e7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -429,3 +429,14 @@ config DRM_WERROR
 	  this config option is disabled by default.
 
 	  If in doubt, say N.
+
+config DRM_HEADER_TEST
+	bool "Ensure DRM headers are self-contained and pass kernel-doc"
+	depends on EXPERT
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

