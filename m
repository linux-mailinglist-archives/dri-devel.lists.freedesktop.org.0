Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B151F2133
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F236E99D;
	Mon,  8 Jun 2020 21:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104C66E9A8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:53 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 205so18788814qkg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G8s6Lc0q3THMODVI6JTrmHxfOaWOZ58hrbwHPebtvg4=;
 b=QYpNbkRVzUdP7VPHHejsPGd18y8ACpyEtOL22/6VjDVAw5HZPd7aAdgK9bwMvw10RO
 SkLdgwLrxjrqDmJRwGyownr1IPMHJJmUV2O+oXNlN+B1bFxdv38skg7Z41VHRRGP4nyx
 LtzHGVRenPgXp/fD/hQ+IXT8gThweSlsozF2019un2ioafrqYWutMIA8DW2d+8tIQMkR
 LcDQI2tiClDmRX1V+z1oGBxQiKjgH3x51EMYDDLT0c8uRQZkJhFPFDaOxmR3wO1Bs6Cw
 ZnLNdH2h2tQEAOiOXQrLBEj0iD9mWAKn6oL1Hky2I3wayX6KnJTTpcVG8ZpP9bzbbNfe
 GgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G8s6Lc0q3THMODVI6JTrmHxfOaWOZ58hrbwHPebtvg4=;
 b=TgROswDhp3fZj1PUMfaT69pYCWxd/vqwi+a+fZd9wfxzIf+EhaLpRD0yIButiLpM2s
 mgpjq8ouXoO31ceAFR/nntGd1wuCcAhmtQzx3lVsmrJJEtDdRmWKvCFuMu1VRDn2rc6Z
 0REgAJ3l44q5WW41upfpvwXutJIiuUeCHEov3tLXlSljqpHDOwiQN++rOUX8Khnx2Fb5
 gMZWc4u7lEXyQ4AP4P812SOFi0DhFusY/udAZ2f1AE79NKo4LOz4apjRISAe1Oc6jBM6
 hZGu7fTCQw+4vbjsucYln4hUfdLOZ+fv+IB7ZWwYeeBbJhWR4aDdcj8hNjims0eduInR
 FVoA==
X-Gm-Message-State: AOAM530vFRwyZqOEfQavOSQARqH4ZS1wltRM4myyqoy7QSnPVusChNLF
 UbmiueC6q+4CUfECXO0VlwNNzZpWQyc=
X-Google-Smtp-Source: ABdhPJzbxnL8SIVo1wFOxtd4P2kmvwBZuduJGv6J2OE2wZx6cxGeEl5+ImV/lZqMg/CuBLL+bLvT8A==
X-Received: by 2002:ae9:eb83:: with SMTP id b125mr25614723qkg.85.1591650352010; 
 Mon, 08 Jun 2020 14:05:52 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id g140sm4303239qke.98.2020.06.08.14.05.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:51 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 05/13] drm/print: rename drm_debug* to be more
 syslog-centric
Date: Mon,  8 Jun 2020 17:04:55 -0400
Message-Id: <20200608210505.48519-6-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de
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

Changes in v5:
-Added to the set
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
