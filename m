Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA57F7415
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5E810E7D3;
	Fri, 24 Nov 2023 12:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0D610E7E8;
 Fri, 24 Nov 2023 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829863; x=1732365863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZH0I2mDfZJAA6EI7gWpQwKj7GUTe9+ey6o2oV3S7QZ0=;
 b=enMq6dKGzSSz76OHyxxxsWPFw/MW39u/w7xRMnhTdz89qs9wer/KJ5qo
 JJqZ3UKeD8H1aWImBVEUo754F9Q+yNB1y4eeJoUytxnKlEWDqaciInulv
 m9CzN5NKxMmQgv/9W97nA4tXjOzlfoYWZ7ujUCELiH/s0zk8p02trc+Nm
 uwC8g59iRlfcwJJCDFrblomSFXjaqfMFl7kfaLVZksdGmXemMtdXJtEqJ
 ODOKhDjtDYeCXKOoYvGCcEoZuEmnNaXVXvkGuuKlMB7AXlbKap2nJN8J/
 TU2ZCFo2giBNV+qWtZrIfPBHKUFdhxngjNLrvq0qgSxDcC/xtsFlc2AV9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478626952"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478626952"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833687963"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833687963"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/print: add drm_dbg_printer() for drm device specific
 printer
Date: Fri, 24 Nov 2023 14:43:57 +0200
Message-Id: <fba6fded60a9616fa57907f313fabb993f2867f7.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've lacked a device specific debug printer. Add one. Take category
into account too.

__builtin_return_address(0) is inaccurate here, so don't use it. If
necessary, we can later pass __func__ to drm_dbg_printer() by wrapping
it inside a macro.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_print.c | 21 +++++++++++++++++++++
 include/drm/drm_print.h     | 24 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 91dbcdeaad3f..673b29c732ea 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -189,6 +189,27 @@ void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
 }
 EXPORT_SYMBOL(__drm_printfn_debug);
 
+void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
+{
+	const struct drm_device *drm = p->arg;
+	const struct device *dev = drm ? drm->dev : NULL;
+	enum drm_debug_category category = p->category;
+	const char *prefix = p->prefix ?: "";
+	const char *prefix_pad = p->prefix ? " " : "";
+
+	if (!__drm_debug_enabled(category))
+		return;
+
+	/* Note: __builtin_return_address(0) is useless here. */
+	if (dev)
+		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME "]%s%s %pV",
+			   prefix_pad, prefix, vaf);
+	else
+		printk(KERN_DEBUG "[" DRM_NAME "]%s%s %pV",
+		       prefix_pad, prefix, vaf);
+}
+EXPORT_SYMBOL(__drm_printfn_dbg);
+
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
 {
 	struct drm_device *drm = p->arg;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 2d57939429a9..c6a7a7fecccc 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -176,6 +176,7 @@ struct drm_printer {
 	void (*puts)(struct drm_printer *p, const char *str);
 	void *arg;
 	const char *prefix;
+	enum drm_debug_category category;
 };
 
 void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf);
@@ -184,6 +185,7 @@ void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf);
 void __drm_puts_seq_file(struct drm_printer *p, const char *str);
 void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
+void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
 
 __printf(2, 3)
@@ -331,6 +333,28 @@ static inline struct drm_printer drm_debug_printer(const char *prefix)
 	return p;
 }
 
+/**
+ * drm_dbg_printer - construct a &drm_printer for drm device specific output
+ * @drm: the &struct drm_device pointer, or NULL
+ * @category: the debug category to use
+ * @prefix: debug output prefix, or NULL for no prefix
+ *
+ * RETURNS:
+ * The &drm_printer object
+ */
+static inline struct drm_printer drm_dbg_printer(struct drm_device *drm,
+						 enum drm_debug_category category,
+						 const char *prefix)
+{
+	struct drm_printer p = {
+		.printfn = __drm_printfn_dbg,
+		.arg = drm,
+		.prefix = prefix,
+		.category = category,
+	};
+	return p;
+}
+
 /**
  * drm_err_printer - construct a &drm_printer that outputs to drm_err()
  * @drm: the &struct drm_device pointer
-- 
2.39.2

