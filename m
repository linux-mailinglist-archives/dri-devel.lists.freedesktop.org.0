Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD62A78EE1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D3610E782;
	Wed,  2 Apr 2025 12:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqZOsFTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5186810E77F;
 Wed,  2 Apr 2025 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743598039; x=1775134039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qr8iSipiHo5jJvKJa3s9CyvhdjrZ/xOgb2s6Bw8S+1o=;
 b=jqZOsFTkU0CLMpH3f5WG4mPB8HafHAkHxiGS2dJN72KXtaw9DEqbJhxz
 fMxGE+LZkHZftEk8izXkrfcCb3MvFTf8Pjil63sgyLqB4cXsv9ysSMCU/
 hPmaK7Fpchv41m9SAcIiZzgU7BAYJPNeOLDZW7NQIATjQfW2KaUxhD7Lq
 kS9nOXXJYJPuFhsPGdLniUMZIYaamzDRA9Iec1DSlPZkoHayzKKEwZ1wP
 tpfDWH82/a2mzuXsSk9xNUFLhzUIaFlpwAWxaErZYystR1EDgnu5e72Fe
 ul8PHtq+LoPGjHalj2NX0UuVJCbAC8kaur2QktH2HUZbr/Hpi9Le/S9Zt A==;
X-CSE-ConnectionGUID: XJ8wXbfcS0abWVhsrA2ZsA==
X-CSE-MsgGUID: qJfOWndeSqmn0mMZgA5XEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953450"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="55953450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:47:18 -0700
X-CSE-ConnectionGUID: 2r3kwEmGRyGIsnfD+R/QXw==
X-CSE-MsgGUID: mmuF0WxgSoi5ifwFAya80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127180597"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:47:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, Jason Gunthorpe <jgg@nvidia.com>,
 Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] kbuild: add generic header check facility
Date: Wed,  2 Apr 2025 15:46:53 +0300
Message-Id: <20250402124656.629226-2-jani.nikula@intel.com>
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

Resurrect a generic header check facility. Check that the headers are
self-contained, have header guards, and (if enabled separately) pass
kernel-doc. Run header checks on .h files listed in header-check-y or
header-check-m, relative to $(src).

Hide header check artifacts under a .header-check subdirectory at the
top level of the build output directory.

Add the facility behind CONFIG_HEADER_CHECK_DISABLE, reversed to keep
the feature disabled for allmodconfig and allyesconfig builds. Also add
a proxy CONFIG_HEADER_CHECK option to simplify dependencies on the
facility. The kernel-doc check requires CONFIG_HEADER_CHECK_KERNEL_DOC.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
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
 init/Kconfig           | 25 +++++++++++++++++++++++++
 scripts/Makefile.build | 13 +++++++++++++
 scripts/Makefile.lib   |  7 +++++++
 3 files changed, 45 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 681f38ee68db..2678a5ba7b93 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -217,6 +217,31 @@ config UAPI_HEADER_TEST
 	  If you are a developer or tester and want to ensure the exported
 	  headers are self-contained, say Y here. Otherwise, choose N.
 
+# Reversed option to disable on allyesconfig/allmodconfig builds
+config HEADER_CHECK_DISABLE
+	bool "Disable extra build-time header checks"
+	default y
+	help
+	  Disable extra build-time header checks. The checks may be
+	  overzealous. They may slow down or fail the build altogether. They may
+	  create excessive dependency files in the tree. They should not be
+	  enabled for regular builds, and thus they are disabled by default.
+
+# Proxy config to allow simple "depends on HEADER_CHECK"
+config HEADER_CHECK
+	bool
+	depends on EXPERT && HEADER_CHECK_DISABLE=n
+	default !HEADER_CHECK_DISABLE
+
+config HEADER_CHECK_KERNEL_DOC
+	bool "Run kernel-doc as part of header checks"
+	depends on HEADER_CHECK
+	default n
+	help
+	  Run kernel-doc as part of header checks. In addition to compiling,
+	  also check kernel-doc comments. With CONFIG_WERROR=y, kernel-doc
+	  warnings are treated as errors.
+
 config LOCALVERSION
 	string "Local version - append to kernel release"
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 56be83024851..f963b2356b0e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -223,6 +223,19 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(obj)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Compile C headers (.h) for header check
+# ---------------------------------------------------------------------------
+
+# Include the header twice to detect missing include guard.
+quiet_cmd_header_check = HDRCHK  $(patsubst $(srctree)/%,%,$<)
+      cmd_header_check = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		$(if $(CONFIG_HEADER_CHECK_KERNEL_DOC),$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR),-Werror) $<,true); \
+		touch $@
+
+.header-check/$(obj)/%.header-check: $(src)/%.h FORCE
+	$(call if_changed_dep,header_check)
+
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 57620b439a1f..272a1b42292e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -89,6 +89,13 @@ multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 endif
 
+# Header checks
+# header-check-y/m contain .h files to be checked, relative to $(src)
+
+header-check-y	:= $(addprefix .header-check/$(obj)/,$(patsubst %.h,%.header-check,$(header-check-y) $(header-check-m)))
+
+always-$(CONFIG_HEADER_CHECK) += $(header-check-y)
+
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
 modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
-- 
2.39.5

