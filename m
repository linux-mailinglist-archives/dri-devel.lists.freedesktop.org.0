Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB555B5395
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6A610E0BF;
	Mon, 12 Sep 2022 05:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F8110E1B4;
 Mon, 12 Sep 2022 05:29:15 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id k13so2304196ilc.11;
 Sun, 11 Sep 2022 22:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mSClBv+YMHjCelLo1EhsewE6hP3wTbgC0DRNv0VPhHs=;
 b=StDGxERICaNtO/MWOKOgGPpN0K/uy13ONokxOkqYAaZjX4KHAFnRfhTBCc8bQhit2y
 gZ3Ur1wskb70k9V1X9Ri0sdLVe5gMaVvXggpW/8GLtLDasXI3SwKAh9hsDCAiGf9etTX
 VKoftvlSsWhFNzRgf6bemRyfW4xndlHtY2NeTaav7UHg/DS296GlPC+y9dgRFppIDy2N
 S4ica+O5t6X0MzR0pVGPNyA6AHxlFkKlLWnTV0d+xhCXTrQPCy2KtUCPBkLDFGGvxXBi
 4hYd5j6zidurXvxchTCxDDr/jsVm2aDJvfe8y6mB3bozzLYGhNkpdaRhdFxmcwDcfocy
 cjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mSClBv+YMHjCelLo1EhsewE6hP3wTbgC0DRNv0VPhHs=;
 b=SDZw3PwdvXzvXY8YhcDLxi/4hQtRQRXxhL5FImhQPiZ8QXkhkc1NBjcQCtzyhiNcnA
 3xbHrhdWTTwoiVGv8krAcJtlKjJdt3/TD1ze+yc0BWE0cAfpNYYbSggs5ZZTi+NXfSj3
 IXRYFOmESHqyFnGuVRNmlIfSDTv+sOMcQDudm0k5VkxmmM+fMtIfpLuEgUsrcjgCqhkM
 d6xMUJxuEL5Q+ubNMv9NQCBbUMYSWET9DVOUkEMKXXGu/nKjE0iqR/6GjZwDm1V2s9aW
 IbDgn3qYH+MCarklW7B6pjtRYDhb3GFj6be9YmKm8E1B/Wf6eZDQbUXgsOU6bArXM3hT
 b4nw==
X-Gm-Message-State: ACgBeo1SNS0lIuSR1PdTUNdQjLD4oSOq+2ZB3oUZTbJwkLV+umFUBVcS
 T2WscSp9q/gJfW5r3HVxd9s=
X-Google-Smtp-Source: AA6agR6WOElTbvZcWBDLNgRT1L6h9WJGhihQJW5zGPjIJBCSEhK0r/DX6Fq17h9F3h/cF/FQ/QryDw==
X-Received: by 2002:a05:6e02:214f:b0:2f1:87fb:783b with SMTP id
 d15-20020a056e02214f00b002f187fb783bmr9708111ilv.161.1662960554820; 
 Sun, 11 Sep 2022 22:29:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 9/9] drm_print: add _ddebug descriptor to drm_*dbg
 prototypes
Date: Sun, 11 Sep 2022 23:28:52 -0600
Message-Id: <20220912052852.1123868-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

upgrade the callchain to drm_dbg() and drm_dev_dbg(); add a struct
_ddebug ptr parameter to them, and supply that additional param by
replacing the '_no_desc' flavor of dyndbg Factory macro currently used
with the flavor that supplies the descriptor.

NOTES:

The descriptor gives these fns access to the decorator flags, but they
do none of the dynamic-prefixing done by dynamic_emit_prefix(), which
is currently static.

DRM already has conventions for logging/messaging; just tossing
optional decorations on top probably wouldn't help.  Instead, existing
flags (or new ones, perhaps 'sd' ala lspci) can be used to make
current message conventions optional.  This suggests a new
drmdbg_prefix_emit() to handle prefixing locally.

For CONFIG_DRM_USE_DYNAMIC_DEBUG=N, just pass null descriptor.

desc->class_id is redundant with category parameter, but its
availability is dependent on desc.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c |  8 +++++---
 include/drm/drm_print.h     | 23 ++++++++++++-----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index ec477c44a784..5b93c11895bb 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -29,6 +29,7 @@
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 #include <drm/drm_drv.h>
@@ -278,8 +279,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -287,6 +288,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	if (!__drm_debug_enabled(category))
 		return;
 
+	/* we know we are printing for either syslog, tracefs, or both */
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
@@ -302,7 +304,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 }
 EXPORT_SYMBOL(__drm_dev_dbg);
 
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9af57d3df259..a44fb7ef257f 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -354,9 +354,10 @@ static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
-__printf(3, 4)
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+struct _ddebug;
+__printf(4, 5)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -406,11 +407,11 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 #define drm_dev_dbg(dev, cat, fmt, ...)				\
-	__drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
 #else
 #define drm_dev_dbg(dev, cat, fmt, ...)				\
-	_dynamic_func_call_no_desc(fmt, __drm_dev_dbg,			\
-				   dev, cat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
+			       dev, cat, fmt, ##__VA_ARGS__)
 #endif
 
 /**
@@ -514,17 +515,17 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * Prefer drm_device based logging over device or prink based logging.
  */
 
-__printf(2, 3)
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
+__printf(3, 4)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-#define __drm_dbg(fmt, ...)		___drm_dbg(fmt, ##__VA_ARGS__)
+#define __drm_dbg(fmt, ...)		___drm_dbg(NULL, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(cat, fmt, ...)					\
-	_dynamic_func_call_no_desc(fmt, ___drm_dbg,			\
-				   cat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
+			       cat, fmt, ##__VA_ARGS__)
 #endif
 
 /* Macros to make printk easier */
-- 
2.37.3

