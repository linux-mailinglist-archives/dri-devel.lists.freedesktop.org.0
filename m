Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7C8763DE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8013F1138B3;
	Fri,  8 Mar 2024 11:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLST9wA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57FC1138AB;
 Fri,  8 Mar 2024 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899077; x=1741435077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xEZPiOuwz/IqmQQHkYnuuAN/wvniqGJc+dYiDHNlB/E=;
 b=ZLST9wA9MZ2LAz/flJMPvdHfejsBV9ljs68dpdSdXoFMijmMLvhcPdvD
 Ua0eFcOjLtShNI12PG6RYZCmV0VXDmE7F0o/h1ZTQOAi36xXObwT9eW6P
 F7hrLjQ4eVJapFUUAuQ/RfWDKKo9Jl6UT/E/eNayi9/ty4mFiwfVHKSGS
 QUljiYZWDwz7w+ke91D6IaBjpBlTb8ZBrVLjG45ahlf5czJ21/kmlIzoH
 +rAbLHQFJdk0zzNVAKGU8gj0c+I6cyrglP6nP+GSe5znZdZI2hYHbV2eE
 Pj7X/s6RQtgB8Yn5uJZ6jDc76XTslj0l9Rv8Orya6ziyMLXH0OjwEXAO3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15262455"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15262455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10487934"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 16/16] drm: ensure drm headers are self-contained and pass
 kernel-doc
Date: Fri,  8 Mar 2024 13:55:54 +0200
Message-Id: <ba6527a126daeae8e66e1cd64053580645106612.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

