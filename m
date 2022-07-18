Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BB577B83
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F0BA9D5C;
	Mon, 18 Jul 2022 06:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159B1A9CFF;
 Mon, 18 Jul 2022 06:38:55 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id l11so3423409ilf.11;
 Sun, 17 Jul 2022 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZ3Q5KVq+ZJLReu3DAK5foUVy/OiDsXtwGwiJj5P6rQ=;
 b=YEGztQy6ga6KUkQrsvEfp8u/3M+3l98VGnRZQkPO0jMUYZjQg9qtUoFUBBC7rln+ZA
 8O4TnNNfSiTpTc0B8K5IQkZMH5SUxvcrTYpo2JFvT97bdAcIGgdvnEy66Z6cuA+k12hS
 J9XwgngRgdee7snErWB86Ty0x94lH0uuqoeQ3xjXbCkx9JSlaKoPwvD78Qql7qCRH8h2
 fGpIvpWWH67QZiUQHr+Wjpo90wiTzvHH9L17xD33r7Z800yDqcfgJbgXm2j92i5YRZ4Y
 /3AjylCNPBUMYRwLzM1eKjljZHirzrMLU5TF61eVmZcBSpQMwEGtvgJ+I65gZH1kxWTM
 r53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZ3Q5KVq+ZJLReu3DAK5foUVy/OiDsXtwGwiJj5P6rQ=;
 b=fF8ocNX527QJglrO6p4LirO7879lW+mT6Iw5EJGzOxsMDwD8/gF9xt90CqcxmvOGKj
 uPzgKcQf/cV2A86Wijg2Wv+J6vydXKAg45KP5UB5asc4Fk07Cd+EXshKwevGMb3U6rZ1
 6Aiym813Ndox6XIPi2NdyX8axjiRYku8TSqfcgvHuRIr4quV6DWXyc3Pmb28p9RSARlC
 WH0Ci6qd1eTr/3iRuwc5psuMqh/c/by0SuBcYoGgQAP11Uk2llTxnHlyxQIN0D5TgwJR
 2Kh1SHiCyDRILyr+8jPi4fmh1gtzPhODuO4l4B6YY8a70w4tyIOlmtTnQw0Xe0hKABWt
 yGsg==
X-Gm-Message-State: AJIora99p1KpgACQNZUMw1mFwESLzWMk6eH9hgncFWaXctFcanC32NEA
 jIYTjv55U6DLGFaKu0mLgtY=
X-Google-Smtp-Source: AGRyM1vIkK9Fe645GPG4U3WPQcuvW5cRy7aJvr7ZHb17vBPzeb28JtrIcG2OKMPtUIwhFoZNrI9idw==
X-Received: by 2002:a05:6e02:174d:b0:2dc:5fe0:eae1 with SMTP id
 y13-20020a056e02174d00b002dc5fe0eae1mr12105485ill.235.1658126333307; 
 Sun, 17 Jul 2022 23:38:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 26/41] drm_print: refine drm_debug_enabled for jump-label
Date: Mon, 18 Jul 2022 00:36:13 -0600
Message-Id: <20220718063641.9179-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to use dynamic-debug's jump-label optimization in drm-debug,
its clarifying to refine drm_debug_enabled into 3 uses:

1.   drm_debug_enabled - legacy, public
2. __drm_debug_enabled - optimized for dyndbg jump-label enablement.
3.  _drm_debug_enabled - pr_debug instrumented, observable

1. The legacy version always checks the bits.

2. is privileged, for use by __drm_dbg(), __drm_dev_dbg(), which do an
early return unless the category is enabled.  For dyndbg builds, debug
callsites are selectively "pre-enabled", so __drm_debug_enabled()
short-circuits to true there.  Remaining callers of 1 may be able to
use 2, case by case.

3. is 1st wrapped in a macro, with a pr_debug, which reports each
usage in /proc/dynamic_debug/control, making it observable in the
logs.  The macro lets the pr_debug see the real caller, not an inline
function.

When plugged into 1, 3 identified ~10 remaining callers of the
function, leading to the follow-on cleanup patch, and would allow
activating the pr_debugs, estimating the callrate, and the potential
savings by using the wrapper macro.  It is unused ATM, but it fills
out the picture.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c |  4 ++--
 include/drm/drm_print.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 21b416af0be2..effb95b3c2bf 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -285,7 +285,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
@@ -308,7 +308,7 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index dfdd81c3287c..7631b5fb669e 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -321,11 +321,39 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+/*
+ * 3 name flavors of drm_debug_enabled:
+ *   drm_debug_enabled - public/legacy, always checks bits
+ *  _drm_debug_enabled - instrumented to observe call-rates, est overheads.
+ * __drm_debug_enabled - privileged - knows jump-label state, can short-circuit
+ */
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
 }
 
+/*
+ * Wrap fn in macro, so that the pr_debug sees the actual caller, not
+ * the inline fn.  Using this name creates a callsite entry / control
+ * point in /proc/dynamic_debug/control.
+ */
+#define _drm_debug_enabled(category)				\
+	({							\
+		pr_debug("todo: maybe avoid via dyndbg\n");     \
+		drm_debug_enabled(category);			\
+	})
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+/*
+ * dyndbg is wrapping the drm.debug API, so as to avoid the runtime
+ * bit-test overheads of drm_debug_enabled() in those api calls.
+ * In this case, executed callsites are known enabled, so true.
+ */
+#define __drm_debug_enabled(category)	true
+#else
+#define __drm_debug_enabled(category)	drm_debug_enabled(category)
+#endif
+
 /*
  * struct device based logging
  *
-- 
2.36.1

