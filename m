Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F84B9720
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBFD10E7A7;
	Thu, 17 Feb 2022 03:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A397B10E7BC;
 Thu, 17 Feb 2022 03:48:53 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id i74so211335ioa.0;
 Wed, 16 Feb 2022 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14+i519RyXRhGHkk7y/NizorIrgQMa72y8v5Vs7LOmo=;
 b=oHx5SA+pA20pWvzGLkJ4yhng4E+IvjuoVEMElPdEpgwBAXZX8Ayc2SvfCLXwvFcehP
 o0AHme5wuSQ63YxgN3QSc0rUbOV/j/+6G6zQRS4NCVt/yEL1Crq/uwf9UDEKebgjg//9
 QjwYPtTiQ0qXnz1UoGaup0sTfsdK8RdEHeUiQduq7H62ZAi7uIXJLbm6AdTtwuFcGXuD
 HV1h9OqMqWbRjdNwm8pC+0EWihoDDr44lxgfi0RIrrwF4+9Cz21iiE95YFoJBmglrB4c
 uqhiYzFY7DXRbPHXJsC8Kzs9wY0qwRswwrK0gBC7Y2uHlx1hH59CcbFMZGDMbalV1nve
 ffkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14+i519RyXRhGHkk7y/NizorIrgQMa72y8v5Vs7LOmo=;
 b=1877tvCGV/fffkOCYpgCPy/FjZJq/JFct6RZDhon4A7R8LqmOkBD1BAnRNQuyQ7TgB
 xXjPIw8RINLcjybF7N84f/H+3KfAa5PqSw82tDVUtXLjNJLA6uwXeSJCKrEHdkXMGphb
 nlhI6LIt7WTLdg6VrEJhZueJzpgqmLVlbj9i8Pyz6pJqhDohhQZvx3C6g6GI4RycSCBU
 WsrznVKuIajtTHzOXDy/h9AYVg2A8UdZQs/d+oJELKOEj30/rnu9MsRNwLOr3KqnAiJb
 MkSJSGhvXjkgngJ61G7l6rbOHmo47mX5bRUR96dHofyEPZ5JbZvpsgRFAA4MovFYvhJi
 0BYQ==
X-Gm-Message-State: AOAM533gy0cI0ykC4YM81ob4UkObCrif4Em2jlF/TLKAgBwsNH+UtaOr
 kA9uh/qjrm2KFbH2gK+tVV0=
X-Google-Smtp-Source: ABdhPJwQdM+YASo9bZwGxmAll7Ye37UoRGfnFLBMbW70/Q8CqJm3xpdtwTbFefjn4OZb9vDTlUFoSw==
X-Received: by 2002:a05:6638:1350:b0:314:7f2a:ab14 with SMTP id
 u16-20020a056638135000b003147f2aab14mr717303jad.215.1645069731093; 
 Wed, 16 Feb 2022 19:48:51 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:50 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/13] drm_print: refine drm_debug_enabled for
 dyndbg+jump-label
Date: Wed, 16 Feb 2022 20:48:26 -0700
Message-Id: <20220217034829.64395-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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

