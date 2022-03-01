Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA53A4C90D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E827C10E6B3;
	Tue,  1 Mar 2022 16:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB9510E6B3;
 Tue,  1 Mar 2022 16:46:58 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h28so1056498ila.3;
 Tue, 01 Mar 2022 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14+i519RyXRhGHkk7y/NizorIrgQMa72y8v5Vs7LOmo=;
 b=oJhuKNskV8n8Y8k0p/nIWuqwzzuMNDEluIiOHKAl0o576sJ1HPmRAKwNtC0X5KmTRs
 icMnlJSV+BczI1iwr7ypddurkANPfvk9tsYf/4EbkWXKlYetwA8+4j8ArceUw5Io7h7K
 ZrLqtCzX4cF7W11tK0Q8kscz3jW9YVmyvhXJ6tM2RAWChlGzGfnAbi7AeOQUh6jAsc8i
 s4WnZLmkfuJbU39kjc7Q0zp4JZR9Fp4abkEVMeb1E0VqoTXqwjZ4QZG8+CyxesEOq0lc
 J9Meq3KHG/8uJe2DtjjhdZqXfODRh7ATy82QI4Bx2bxrqVI4Yplqmg1iKFonLatSEcFK
 Dt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14+i519RyXRhGHkk7y/NizorIrgQMa72y8v5Vs7LOmo=;
 b=YdPAyOUKtFtD5kRu+leDt3cHObYq7eMPxpcGVtIw2o5HxZ01zS8GXvZgQpcMkSZGbC
 uomO/zSpgieDB0UqqY4eA5lrgUepyNlT64UYZjGwCFARcO/O1bUE9afAJvZFTxsyszeF
 DX21sN6G8bnTHyEs7RmeFNw56BwKPBDn3K1U+AuIs7notQ86oq93TEj6NwAOMeN2/9OJ
 qvlPYWZWhfhZMUW3swl4RKBn82Q+J9/EiFgnhFjlGbikHlEZKUarV1BBPNSJaxKIXWAD
 /A06XxKzdljaNg8W4vww0uFkgjNB4mAihL1W4znw6r5UHkcqHqcNNeEXZE/BdXdyhKIk
 WGMA==
X-Gm-Message-State: AOAM531GaX78Lpb9osnH0BVYRfdj35YWdxRzG4xGIZHNuHwO8RUInq3U
 og1Jittv6ScPrDrI785QxCs=
X-Google-Smtp-Source: ABdhPJy/KCJFD5deAvJ68PlxwkNGgiICpCoLJxeZujYYZFdY6j2sWFoALhEsYtn+vDVwYE5UiaxVTg==
X-Received: by 2002:a05:6e02:2142:b0:2bf:ad10:e00e with SMTP id
 d2-20020a056e02214200b002bfad10e00emr23607973ilv.114.1646153217457; 
 Tue, 01 Mar 2022 08:46:57 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:57 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/13] drm_print: refine drm_debug_enabled for
 dyndbg+jump-label
Date: Tue,  1 Mar 2022 09:46:26 -0700
Message-Id: <20220301164629.3814634-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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

In order to use dynamic-debug's jump-label optimization in drm-debug,
its clarifying to refine drm_debug_enabled into 3 uses:

1.   drm_debug_enabled - legacy, public
2. __drm_debug_enabled - optimized for dyndbg jump-label enablement.
3.  _drm_debug_enabled - pr_debug instrumented, observable

1. The legacy version always checks the bits.

2. is privileged, for use by __drm_dbg(), __drm_dev_dbg(), which do an
early return unless the category is enabled (free of call/NOOP side
effects).  For dyndbg builds, debug callsites are selectively
"pre-enabled", so __drm_debug_enabled() short-circuits to true there.
Remaining callers of 1 may be able to use 2, case by case.

3. is 1st wrapped in a macro, with a pr_debug, which reports each
usage in /proc/dynamic_debug/control, making it observable in the
logs.  The macro lets the pr_debug see the real caller, not an inline
function.

When plugged into 1, it identified ~10 remaining callers of the
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
index e45ba224e57c..92e6e18026da 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -262,7 +262,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
@@ -285,7 +285,7 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 06f0ee06be1f..38ef044d786e 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -319,11 +319,39 @@ enum drm_debug_category {
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
2.35.1

