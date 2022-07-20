Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AA57BA76
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CB48F56A;
	Wed, 20 Jul 2022 15:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1041A8F24F;
 Wed, 20 Jul 2022 15:33:26 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id n13so902463ilk.1;
 Wed, 20 Jul 2022 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZ3Q5KVq+ZJLReu3DAK5foUVy/OiDsXtwGwiJj5P6rQ=;
 b=UiQrI4NAxDEw/Kcvs8mdBmMie/F3AReVKsUfiDFKKkKV/60UTtcp24qzXjSLpud2gj
 9Havnqesmom1O4wOKiFAGJnPeh7tCgG+P6muBOG2rYJkGG1f4Wb5Psu/DCj3/idvW7eF
 /4+ZbT9GIPXZkhyZnf0N7vgYZDCJ1gnwQ2xU0H06BLarUURhBA9f77Qdf4J8YxVunZPq
 Cd+b9DJsdE7Zzx7CU5vhBawDCFKc4Em7E+3ml4dc7mn1GMCIKsSmuLvHDEiSxlXOLRwy
 RWKTHZ+VHvmKFTocmKEwyfQdbhct42GPbBtyphaK9cac+2sgTiO2JWLKb5zDSwDIjBGU
 CGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZ3Q5KVq+ZJLReu3DAK5foUVy/OiDsXtwGwiJj5P6rQ=;
 b=Y5zkL17iJImMI62dj7ZHP6utHhTwMrygkRkTo6iSTfNW2rFzcO5LyhgpIHWNsxhAIk
 BserXkfMxddok7dpI0Qxr6FLV6tT/JD960dKQz4Vl2e18W4pQo609Rltr9hohclqxpyz
 tiJFEDelvCFecDLpsv5yQjuZoupMDkUvE8c9/Bo23UzolcO2sbcR3pYMIVwKrIQSTobp
 DpioDA0N53AhDl+IEt/c7gur1XK5I62dZZqC6IrAQUgOjtsw8A2pVL/+fbYvpj+w41Uy
 le+jO1trS5ulADsff2MQPhA7YCWb/Hwzbop/sMhFWQEiMA6Wru0Hlj21DZPn6H4ho9Tq
 BZww==
X-Gm-Message-State: AJIora/5d9bwxID9IeI5AIMJZv/Sg6SyB/JH+lkMwjkHSPhzCosfAbf2
 P0cfjB8rfLfIDowaEF4IXUE17tnxvZDOgA==
X-Google-Smtp-Source: AGRyM1vsAnChCcLMNEoMvV8wLSjEjQQ9rrUOK39l29F0zKEoltZsjv7zG+YH5EQU1tNKAP9U2llX9A==
X-Received: by 2002:a92:1944:0:b0:2dc:23f4:76a1 with SMTP id
 e4-20020a921944000000b002dc23f476a1mr17897759ilm.44.1658331205464; 
 Wed, 20 Jul 2022 08:33:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 26/41] drm_print: refine drm_debug_enabled for jump-label
Date: Wed, 20 Jul 2022 09:32:18 -0600
Message-Id: <20220720153233.144129-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

