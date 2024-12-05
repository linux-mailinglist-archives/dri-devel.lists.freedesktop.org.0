Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006419E51B3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 10:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8FA10E38F;
	Thu,  5 Dec 2024 09:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTApHbAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292710E38B;
 Thu,  5 Dec 2024 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733392187; x=1764928187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v0+FabkxUt9Ev8knat/9ZdJcyv0F3U6dWzcSG5Lv0ZE=;
 b=KTApHbAqhy/gyjnqDLguYTVis3KqY0UQuSBFBVN/7VehbzHZkSlwAz9x
 90/E9hTfkdAMm1+9jQfeMb5nFSHc/bZECM12NDfc2WO8m6/d2ra+uQyrP
 +XtlVzpRXRjIYMrHRpLlxD6P9bP9a43pAYbo32WLADRio3ykEz3f+ysvr
 dgXvr1FUfOGFzypcIcnAdFmlf6Y8cmSwGDEWqrnHvuUoh0vkNjfh+V8D/
 E0+LZg6V/URAC/AjXghPTXwdqzESAZtj62Voq5jp5qNSroZbryj4NsDKC
 BUg3q48PoyYpx55MQPXtmEN7eNucYz/QLnva/g+II6+dva5neYg5SOm6M w==;
X-CSE-ConnectionGUID: Idn8WlYfRkW62gZiQ8GG0A==
X-CSE-MsgGUID: elfasFTTQTCtGjXuD4Q70g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33938939"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33938939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:47 -0800
X-CSE-ConnectionGUID: zAieTZ1RR+S+/6Vd1cgoRA==
X-CSE-MsgGUID: /zEyLcKfQWqqayoUXNE4DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="124862172"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/3] drm/print: add drm_print_hex_dump()
Date: Thu,  5 Dec 2024 11:49:33 +0200
Message-Id: <f650fe1ed3e3bb74760426fa7461c3b028d661fb.1733392101.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733392101.git.jani.nikula@intel.com>
References: <cover.1733392101.git.jani.nikula@intel.com>
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

Add a helper to print a hex dump to a struct drm_printer. There's no
fancy formatting stuff, just 16 space-separated bytes per line, with an
optional prefix.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_print.c | 23 +++++++++++++++++++++++
 include/drm/drm_print.h     |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 08cfea04e22b..79517bd4418f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -390,3 +390,26 @@ void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *regset)
 	}
 }
 EXPORT_SYMBOL(drm_print_regset32);
+
+/**
+ * drm_print_hex_dump - print a hex dump to a &drm_printer stream
+ * @p: The &drm_printer
+ * @prefix: Prefix for each line, may be NULL for no prefix
+ * @buf: Buffer to dump
+ * @len: Length of buffer
+ *
+ * Print hex dump to &drm_printer, with 16 space-separated hex bytes per line,
+ * optionally with a prefix on each line. No separator is added after prefix.
+ */
+void drm_print_hex_dump(struct drm_printer *p, const char *prefix,
+			const u8 *buf, size_t len)
+{
+	int i;
+
+	for (i = 0; i < len; i += 16) {
+		int bytes_per_line = min(16, len - i);
+
+		drm_printf(p, "%s%*ph\n", prefix ?: "", bytes_per_line, buf + i);
+	}
+}
+EXPORT_SYMBOL(drm_print_hex_dump);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index b3906dc04388..f77fe1531cf8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -199,6 +199,8 @@ void drm_puts(struct drm_printer *p, const char *str);
 void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *regset);
 void drm_print_bits(struct drm_printer *p, unsigned long value,
 		    const char * const bits[], unsigned int nbits);
+void drm_print_hex_dump(struct drm_printer *p, const char *prefix,
+			const u8 *buf, size_t len);
 
 __printf(2, 0)
 /**
-- 
2.39.5

