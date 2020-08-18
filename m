Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D5248FDF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F0F6E159;
	Tue, 18 Aug 2020 21:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21026E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:27 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i20so5464091qkk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bW8e3uBqHkmjmdbdif7X59e+BqToe3orNHNdpYwg/LM=;
 b=KPoKMG1MW4YqCRwjwUY+SQdeOIEFrF4GZ4ngXt4gt8RCsUSNIrcTMzOYy+XSnM7df9
 +WPhpIfUB45+k86MdFLdWJQAFp1V8Z/EJ/n8vvyAi2C5U6GE7BChWL5s1wmAzXNYc9cY
 2zVucnY37rVjxo+5l2mImn2uJOWftfBWhASJw/Q0iLAP0x3P7A2u3n0DV01VZv/l0RfO
 tVjnzV5ImKCdvVkQfYK5/sz5i6RoWX6mWJbmM/3tdfLEE6yraCtfo7pVaiqZWqtF4lAz
 9xrBiJbXvvO+19MQUcoLehjnaf9iBAClcDRSM/g8zIPDNUA59+VKVs8qAIpGmTQXhs9O
 YAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bW8e3uBqHkmjmdbdif7X59e+BqToe3orNHNdpYwg/LM=;
 b=cIYq5xJSDjZM+TYr00FV31IZ7ZoNqHp+kdrjhTt2Ob6Ewgy2A0omSe9Vk8CxV3gfbr
 PMqMzQpw/93jwzT/VIYczLk3UdKJbbvWtOOPv2JXk9WzlunhevX41u6lpvcJyesWfQ1t
 wxmiSNjl0EVNo9fYSLYvs4IguzqDPqa8Yzq4os2o13XWkXxvllDD5slm3Oj06DnxHsI5
 rBhLj8mWt0aHXVwEZvceuyixTdag1SOBCzfLKBpTHLS7JXBoi5nYnxdtNqdgjLDgdX5Q
 99DfYH0AZAjgG/IFfLoWmlwGLjf+UFtcOuVDqvHDU0/PPEL9TQfNDkamKrFEAFE+wRy6
 H94g==
X-Gm-Message-State: AOAM531sKw/WqfiVQ5wif+dDsV7VPabIS51yW78H0xjYJo98cQjoIsae
 EwStHFiL0Uct4GTcAJxWLtsFMFFzWz1a+Q==
X-Google-Smtp-Source: ABdhPJyZ/TfryNxvM/GNsAP2YIQe6hSzgevrcAxOSmfgaycok6dwNP6cZH1Vo4d9BpqAIwrL4YkKOA==
X-Received: by 2002:a37:9c58:: with SMTP id f85mr17969190qke.345.1597784726773; 
 Tue, 18 Aug 2020 14:05:26 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id n33sm24445314qtd.43.2020.08.18.14.05.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:26 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 05/14] drm/print: rename drm_debug* to be more
 syslog-centric
Date: Tue, 18 Aug 2020 17:05:01 -0400
Message-Id: <20200818210510.49730-6-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 1c9417430d08..ce7675bf0d2b 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
