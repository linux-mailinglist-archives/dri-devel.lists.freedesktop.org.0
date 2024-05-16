Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB378C79F3
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 18:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6A510E16A;
	Thu, 16 May 2024 16:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRtJmMCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F1E10E16A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715875227; x=1747411227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TGnzsfQc27cQgimwyIBL3uBYRd0MqgHh+V4iiIaQYgI=;
 b=iRtJmMCuTaUNkxEeazH5k1d4lwAv/Vmj2aNtKOAhb2D/FFioVrEGdJiK
 QaYOvqhlY6gimaiMOX0IqYs09JHHeeKnDEnPUbi90x6quasmG1XzjedCt
 kmj16TZJkAtOnhVXGbyXmSUxUjIXN6+EXrqXhh/2rEpaWJtCqNf+Q1YvK
 iw9yAeMBHIQVpbPEvKSVrzsxlX7KhsgSNkP7Vegawmnc5Go90VALRgxkA
 DLg5s90257mqYAB9woN+UUp2LkSMBbPsodYT7mplNidwEEWjk4pMSlzxW
 ZJ4Te7EniHg6TgFYLRSyhH5OFbNS0JRYN2vcIWnJLxrTofFedTcgBcVNu w==;
X-CSE-ConnectionGUID: 1Ggz6IedRM2sU/0Z7HtNIg==
X-CSE-MsgGUID: Dve9p7vaQq+jnO6Jq31JtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11558521"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11558521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:00:27 -0700
X-CSE-ConnectionGUID: a8Vs5sdvTLa5ydQ/0+osFw==
X-CSE-MsgGUID: jNXFSSQERpKUyktvc1HYxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="35976366"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:00:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/print: Kill ___drm_dbg()
Date: Thu, 16 May 2024 18:00:15 +0200
Message-Id: <20240516160015.2260-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There is no point in maintaining a separate print function, while
there is __drm_dev_dbg() function that can work with a NULL device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_print.c | 19 -------------------
 include/drm/drm_print.h     |  8 +++-----
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index cf2efb44722c..7e16ce7c7c7a 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -323,25 +323,6 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 }
 EXPORT_SYMBOL(__drm_dev_dbg);
 
-void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...)
-{
-	struct va_format vaf;
-	va_list args;
-
-	if (!__drm_debug_enabled(category))
-		return;
-
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
-
-	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-	       __builtin_return_address(0), &vaf);
-
-	va_end(args);
-}
-EXPORT_SYMBOL(___drm_dbg);
-
 void __drm_err(const char *format, ...)
 {
 	struct va_format vaf;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 089950ad8681..6f8cb5fada41 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -527,17 +527,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
  * Prefer drm_device based logging over device or prink based logging.
  */
 
-__printf(3, 4)
-void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-#define __drm_dbg(cat, fmt, ...)		___drm_dbg(NULL, cat, fmt, ##__VA_ARGS__)
+#define __drm_dbg(cat, fmt, ...)	__drm_dev_dbg(NULL, NULL, cat, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(cat, fmt, ...)					\
-	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
-			       cat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,			\
+			       NULL, cat, fmt, ##__VA_ARGS__)
 #endif
 
 /* Macros to make printk easier */
-- 
2.43.0

