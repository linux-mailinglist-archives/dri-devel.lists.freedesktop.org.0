Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B13D15AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA73B6EB3C;
	Wed, 21 Jul 2021 17:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BC86EB3C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:55 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id o9so1350205qvu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10zX+wWQODXoUYiEX6WIkatRpliDTXvVrzyJ0vNDwmo=;
 b=HuN+irXh+kCBSteEi9Z4q5/qRkmGvQCG0mQVsvrvukbke/C0SCxY13/EbQaMbzAwsV
 DwQ3ZxvQEV6AXvYq+XNQxA93pCfFYIUREn8uOD/L8z/6RhTx9PnAbimtqdeGJZFQeBmT
 i/0gs90W82EtU0MzV91Us2HXlqkOlPeItYnKg3eItgUXzib39pPDCfwTWOF8oTJaLX5Y
 KjzEUBLg0o9JIuklPWlbI9rCVPUPW/OssvDmmhbT1/1ThFyZuyBb4L6nuN1PcHsVQPcH
 TNtnt1IvAOkjt1hoNi1T0h9SEE4/pmywdZ49zYB2eKsH5+710GyAZyU3l5hZyyJIBLgD
 s34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10zX+wWQODXoUYiEX6WIkatRpliDTXvVrzyJ0vNDwmo=;
 b=fc1+HN5XG5VjIMbHXkUpOKERpqsadZwYgxBW7Kv+vcAAdn30g4209hmIXhg3DZvcld
 pBdGYVQi69M2Tmrav34snh0oeBdPGrr0SFJ1qHrvOV2tJ0i6MRx2ES6KZJCSqIPuilgg
 8fpxiCKZD0IJQg8ARfJJCL2ykc0EYrgqWRtSZufBqlX7JYSr1dZsTMULLAnCP+M0r1EL
 WwkueTdBkvbJYy3DxXZmWwbWJ/f234HH/qKwLDfzuCFniHy0jYFpp35ifq0x9zngParp
 e+Z610SA68HNwRgGz+fODIEhuVwDX8Xtp3PzoaB2dFDLPZpRAMFmFvdSWTsIg0N6wPVG
 QNyw==
X-Gm-Message-State: AOAM532nT0JBsnNI7pYmiwhg1NGTDfy9cVCHgx9YxeK1dNl7KRui5lVZ
 oj9F5jFZytmbeeUruIZaPmfoM3lQTtSNZQ==
X-Google-Smtp-Source: ABdhPJyVBV+VlLf5zeMR21cLXHKlKy4zszLEFKqHYPZE5iWw3BfFjefH71tv0xlXNvAQq7dqQCFf2A==
X-Received: by 2002:ad4:52ea:: with SMTP id p10mr37286736qvu.45.1626890154449; 
 Wed, 21 Jul 2021 10:55:54 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id a11sm5017625qkl.125.2021.07.21.10.55.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:54 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 05/14] drm/print: rename drm_debug* to be more
 syslog-centric
Date: Wed, 21 Jul 2021 13:55:12 -0400
Message-Id: <20210721175526.22020-6-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

In preparation for tracefs support, rename drm_debug related functions
to reflect that it targets the syslog. This will allow us to selectively
target syslog and/or tracefs.

No functional changes here.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-6-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/drm_print.c | 12 ++++++------
 include/drm/drm_print.h     | 13 +++++++++----
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 111b932cf2a9..2ff7a6ecc632 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -37,11 +37,11 @@
 #include <drm/drm_print.h>
 
 /*
- * __drm_debug: Enable debug output.
+ * __drm_debug_syslog: Enable debug output to system logs
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned int __drm_debug;
-EXPORT_SYMBOL(__drm_debug);
+unsigned int __drm_debug_syslog;
+EXPORT_SYMBOL(__drm_debug_syslog);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
 "\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
@@ -52,7 +52,7 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
-module_param_named(debug, __drm_debug, int, 0600);
+module_param_named(debug, __drm_debug_syslog, int, 0600);
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
@@ -160,11 +160,11 @@ void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf)
 }
 EXPORT_SYMBOL(__drm_printfn_info);
 
-void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
+void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf)
 {
 	pr_debug("%s %pV", p->prefix, vaf);
 }
-EXPORT_SYMBOL(__drm_printfn_debug);
+EXPORT_SYMBOL(__drm_printfn_debug_syslog);
 
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9b66be54dd16..2ea0ffd9c1ce 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -35,7 +35,7 @@
 #include <drm/drm.h>
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned int __drm_debug;
+extern unsigned int __drm_debug_syslog;
 
 /**
  * DOC: print
@@ -85,7 +85,7 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str);
 void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf);
 void __drm_puts_seq_file(struct drm_printer *p, const char *str);
 void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
-void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
+void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf);
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
 
 __printf(2, 3)
@@ -227,7 +227,7 @@ static inline struct drm_printer drm_info_printer(struct device *dev)
 static inline struct drm_printer drm_debug_printer(const char *prefix)
 {
 	struct drm_printer p = {
-		.printfn = __drm_printfn_debug,
+		.printfn = __drm_printfn_debug_syslog,
 		.prefix = prefix
 	};
 	return p;
@@ -319,9 +319,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES		= 0x200,
 };
 
+static inline bool drm_debug_syslog_enabled(enum drm_debug_category category)
+{
+	return unlikely(__drm_debug_syslog & category);
+}
+
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
-	return unlikely(__drm_debug & category);
+	return drm_debug_syslog_enabled(category);
 }
 
 /*
-- 
Sean Paul, Software Engineer, Google / Chromium OS

