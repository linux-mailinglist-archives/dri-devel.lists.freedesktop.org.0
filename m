Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56AD82EF67
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347310E580;
	Tue, 16 Jan 2024 13:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEDB10E54F;
 Tue, 16 Jan 2024 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410489; x=1736946489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=InbTkfRui2wcrj8u5F2mtdR8VHMKODP/LMwsMEh3hxw=;
 b=GgmPfFs8wXP4OGDsvI4RKPLnMMlQyFJoMy5rxAaa8v242HvB/sHl3EYT
 mrxSWF5pKZIBlzPxgzWN599IWXkuzuktTW4fsEx0GnbV2keXQQIR1OGFq
 jsDW5EapCXRNp0AiRX8H/2+iFMfnbLYtu32f7s9sQ2jpb73tGATQ4Abag
 7tHWlIfhTNanO/3JsvDUloeiRqXtJoEAgzMkx1+iB19dfev9wOkEU1xkL
 dRBdZrVnq/KJ8J/6Cu/XgTlpA9VzRT5yR8k2iRXVuS5tiXmp+L14p3iVF
 y0e8y+9E5n3O64v84+hQY0IM+AY9Nh/RPcIGLoTphil79jT5xllgR/xll A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6949403"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6949403"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="777046930"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="777046930"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] drm/print: add drm_dbg_printer() for drm device
 specific printer
Date: Tue, 16 Jan 2024 15:07:28 +0200
Message-Id: <48607d58e5cdf8341ffdd522257542fa2ce41a19.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
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
index b8b4cb9bb878..27e23c06dad4 100644
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

