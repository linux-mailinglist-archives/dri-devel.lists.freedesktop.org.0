Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5E41CBE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230F6EAD5;
	Wed, 29 Sep 2021 18:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147176EAD1;
 Wed, 29 Sep 2021 18:34:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="286027690"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="286027690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:34:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="520927756"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:34:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Move IS_CONFIG_NONZERO() to kconfig.h
Date: Wed, 29 Sep 2021 11:33:57 -0700
Message-Id: <20210929183357.1490204-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929183357.1490204-1-lucas.demarchi@intel.com>
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
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

The check for config value doesn't really belong to i915_utils.h - we
are trying to eliminate that utils helper and share them when possible
with other drivers and subsystems.

Rationale for having such macro is in commit
babaab2f4738 ("drm/i915: Encapsulate kconfig constant values inside boolean predicates")
whereas later it is improved to not break the build if used with
undefined configs. The caveat is detailed in the documentation: unlike
IS_ENABLED(): it's not preprocessor-only logic so can't be used for
things like `#if IS_CONFIG_NONZERO(...)`

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 17 -----------------
 include/linux/kconfig.h           | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 436ce612c46a..62f189e064a9 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -28,7 +28,6 @@
 #include <linux/list.h>
 #include <linux/overflow.h>
 #include <linux/sched.h>
-#include <linux/stringify.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -459,20 +458,4 @@ static inline bool timer_expired(const struct timer_list *t)
 	return timer_active(t) && !timer_pending(t);
 }
 
-/*
- * This is a lookalike for IS_ENABLED() that takes a kconfig value,
- * e.g. CONFIG_DRM_I915_SPIN_REQUEST, and evaluates whether it is non-zero
- * i.e. whether the configuration is active. Wrapping up the config inside
- * a boolean context prevents clang and smatch from complaining about potential
- * issues in confusing logical-&& with bitwise-& for constants.
- *
- * Sadly IS_ENABLED() itself does not work with kconfig values.
- *
- * Returns 0 if @config is 0, 1 if set to any value.
- */
-#define IS_CONFIG_NONZERO(config) (						\
-	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
-	__stringify_1(config)[0] == '-'						\
-)
-
 #endif /* !__I915_UTILS_H */
diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index 20d1079e92b4..e84f7c1c8e26 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_KCONFIG_H
 #define __LINUX_KCONFIG_H
 
+#include <linux/stringify.h>
 #include <generated/autoconf.h>
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
@@ -26,8 +27,8 @@
 #define ____or(arg1_or_junk, y)		__take_second_arg(arg1_or_junk 1, y)
 
 /*
- * Helper macros to use CONFIG_ options in C/CPP expressions. Note that
- * these only work with boolean and tristate options.
+ * Helper macros to use CONFIG_ options in C/CPP expressions. Note that except
+ * for IS_CONFIG_NONZERO, these only work with boolean and tristate options.
  */
 
 /*
@@ -72,4 +73,15 @@
  */
 #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
 
+/*
+ * This is a lookalike for IS_ENABLED(), but works with int kconfig options
+ * with the caveat that it can't be used on preprocessor checks.
+ *
+ * Returns 0 if @config is 0 or undefined, 1 if set to any value.
+ */
+#define IS_CONFIG_NONZERO(config) (						\
+	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
+	__stringify_1(config)[0] == '-'						\
+)
+
 #endif /* __LINUX_KCONFIG_H */
-- 
2.33.0

