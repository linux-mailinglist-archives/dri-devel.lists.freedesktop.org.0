Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F020A34D98
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94B810EB6B;
	Thu, 13 Feb 2025 18:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5Jg4K2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6959310EB6B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739471134; x=1771007134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLX7BKkCsOAAmxOi6VDKnJUBlyAfuP7t1DKSjk9fKlE=;
 b=S5Jg4K2Vs4K3i/d+CF1fT8NFfNmUnquhAdtAEW0vt8EVXS5Lk+M2ZJmM
 6hNijT7vi0l8xvESMz7Ok+bSbVdIzBWH2h/UicJ3j5HaVkJ33gvFgiZad
 AWcVMeXgCYudY/xkwMrmdEsttFZBhcXy+7ZgL80i9IUengilowe+/4Fe6
 Fwq0i7Xg5FGQUy+8o1Q0V5zodv8QbjP8IScZkJH5AUqRFvMGvt5SnTjWD
 NKgmNJDrEWeC0ZfGbCI7irnyPmxfbPbun5cW5Pk2PyKb7VkSRbPwwZyZY
 7+jeuy3ab9n2rqINe5qOQVIwr/HtqcJk/Ty44QCouhbJuXagFCJu1PzGg g==;
X-CSE-ConnectionGUID: XzjhmB/ASgGpi0XfMNRakQ==
X-CSE-MsgGUID: qdX8S4jtQImI/22/SkLngQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50407640"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="50407640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:25:34 -0800
X-CSE-ConnectionGUID: L6EReLleSf2aGolaPW7PZA==
X-CSE-MsgGUID: Y5FJqQU3Tbm7wX/V0GFH7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="118314411"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2025 10:25:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 068891F5; Thu, 13 Feb 2025 20:25:28 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexandru Ardelean <aardelean@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for wider use
Date: Thu, 13 Feb 2025 20:24:00 +0200
Message-ID: <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
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

Other subsystem(s) may want to reuse the for_each_if() macro.
Move it to util_macros.h to make it globally available.

Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/drm/drm_util.h      | 16 +---------------
 include/linux/util_macros.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
index 79952d8c4bba..440199618620 100644
--- a/include/drm/drm_util.h
+++ b/include/drm/drm_util.h
@@ -36,6 +36,7 @@
 #include <linux/kgdb.h>
 #include <linux/preempt.h>
 #include <linux/smp.h>
+#include <linux/util_macros.h>
 
 /*
  * Use EXPORT_SYMBOL_FOR_TESTS_ONLY() for functions that shall
@@ -47,21 +48,6 @@
 #define EXPORT_SYMBOL_FOR_TESTS_ONLY(x)
 #endif
 
-/**
- * for_each_if - helper for handling conditionals in various for_each macros
- * @condition: The condition to check
- *
- * Typical use::
- *
- *	#define for_each_foo_bar(x, y) \'
- *		list_for_each_entry(x, y->list, head) \'
- *			for_each_if(x->something == SOMETHING)
- *
- * The for_each_if() macro makes the use of for_each_foo_bar() less error
- * prone.
- */
-#define for_each_if(condition) if (!(condition)) {} else
-
 /**
  * drm_can_sleep - returns true if currently okay to sleep
  *
diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
index 825487fb66fa..3b570b765b75 100644
--- a/include/linux/util_macros.h
+++ b/include/linux/util_macros.h
@@ -4,6 +4,21 @@
 
 #include <linux/math.h>
 
+/**
+ * for_each_if - helper for handling conditionals in various for_each macros
+ * @condition: The condition to check
+ *
+ * Typical use::
+ *
+ *	#define for_each_foo_bar(x, y) \'
+ *		list_for_each_entry(x, y->list, head) \'
+ *			for_each_if(x->something == SOMETHING)
+ *
+ * The for_each_if() macro makes the use of for_each_foo_bar() less error
+ * prone.
+ */
+#define for_each_if(condition) if (!(condition)) {} else
+
 /**
  * find_closest - locate the closest element in a sorted array
  * @x: The reference value.
-- 
2.45.1.3035.g276e886db78b

