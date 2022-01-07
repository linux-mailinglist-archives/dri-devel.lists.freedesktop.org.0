Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE32487289
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074AC113260;
	Fri,  7 Jan 2022 05:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EBC113237;
 Fri,  7 Jan 2022 05:30:01 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id x6so5757394iol.13;
 Thu, 06 Jan 2022 21:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+whnRInE6RCe8IE0tc3gMQFft25woQ2FviIb/MiH/k=;
 b=JhenPuVwR+eU0uHEksqOulZpa5e3OJYhulnV6N9KN+XJWrge1y9oMhr8zH1rM8i7bX
 yZ5XoCvdfycAgkTiwWJwWmyAPQiqoUdzKlKLdTiNf0iY7KXdrlmgZRGOGGrhg5fW+i/w
 9J08f903uSPuqbaLFBbQZKf7/8NOPYkfGt2rmhYlWOdUy2Z2HWACgt26Xg6E8Go6GFYu
 uAdUqTUZ2q9RJuBP4bt3GIzV4Bgk6Od8ysP/JsYrGluugD1ux+f9alWqtHmRywXi0sVE
 olvJcDp0zYC7jIY90t09WVT5gV84xPpp5Dk/B84fwFzsVMhuBlzK0e59aqIDMqNPPt9Q
 jPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+whnRInE6RCe8IE0tc3gMQFft25woQ2FviIb/MiH/k=;
 b=zo21tDSmeL5IYZNc1euB6LZlNZLIvlS6L1+c7/iHgfCUjNKn6e454hIbCE60WN5Ia7
 r1ysydouJcGIkNDkElOwAit0cOI3PAlYGM37b0W4aOFhJuUseEkqVzCVqlYE6DYa+LNG
 rDoAHiiXNIxJc5U6ELcFd6KGsec046GxMxMpFgqVjKrUDP7mznl9Qyw05E32GPVhw+8j
 Pd4NzjqYFtq7QZmR/ZYbtekn4PXcpS5AjGr79+76aCTd8fBP9o3rtCTARxftPHLEUsId
 X3RGJ6UIadOczw0jwGb0H8wUpNfpVZOV5vBOowYUGQjTi2fX7fHkFSsu/1Nr1jryxNgl
 nVKg==
X-Gm-Message-State: AOAM533x7xJG6ehhC6zWOfozm/xF78nTdq/1hEQ0OD5olvB0HsPdC487
 bkiSGlZwL+WCrFdH9jPdXt8=
X-Google-Smtp-Source: ABdhPJzRsRX1nIT4M3s/esAkmWqVAyhco+gRzEgZ4Si1rvTVOGDW5wSP5pmalpqqsm5K7wxwZepWPw==
X-Received: by 2002:a02:6289:: with SMTP id d131mr10292826jac.61.1641533399696; 
 Thu, 06 Jan 2022 21:29:59 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:59 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 08/19] drm_print: add trace_drm_dbg,
 trace_drm_devdbg events
Date: Thu,  6 Jan 2022 22:29:31 -0700
Message-Id: <20220107052942.1349447-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__drm_debug() and __drm_dev_dbg() currently printk to syslog.  These 2
underlay the vast bulk of DRM.debug api calls; they are a significant
source of debugging info, and could add useful context to debug traces.

Wire them to emit 2 new trace_*() events: drm_prdbg and drm_devdbg.

These events keep the args of those 2 callers:
- int/enum category, va_format *vaf
- struct device *dev, int/enum category, va_format *vaf

ISTM best to reflect args thru w/o altering; it is simple, least
surprising, and preserves info for possible filtering/selecting
events.

NOTES:

trace_*() additions are strictly redundant with printks to syslog, not
properly placed to reduce overall work.

Reuses trim-trailing-newline trick on vnsprintf

TLDR: The event called by __drm_dev_dbg() depends upon !!dev; theres
little value to storing a null in the trace. Yes, one could know that
devdbg was called with a null, but is that worthwhile ?  And if you
really needed to know the call (not available from control-file
format) the file:line gets you there.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 13 +++++--
 include/trace/events/drm.h  | 68 +++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 3 deletions(-)
 create mode 100644 include/trace/events/drm.h

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index f783d4963d4b..cfcb89ffd89d 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -36,6 +36,9 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/drm.h>
+
 /*
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
@@ -269,13 +272,15 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	vaf.fmt = format;
 	vaf.va = &args;
 
-	if (dev)
+	if (dev) {
 		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
 			   __builtin_return_address(0), &vaf);
-	else
+		trace_drm_devdbg(dev, category, &vaf);
+	} else {
 		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 		       __builtin_return_address(0), &vaf);
-
+		trace_drm_debug(category, &vaf);
+	}
 	va_end(args);
 }
 EXPORT_SYMBOL(drm_dev_dbg);
@@ -295,6 +300,8 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 	       __builtin_return_address(0), &vaf);
 
+	trace_drm_debug(category, &vaf);
+
 	va_end(args);
 }
 EXPORT_SYMBOL(__drm_dbg);
diff --git a/include/trace/events/drm.h b/include/trace/events/drm.h
new file mode 100644
index 000000000000..944aedaf6aa6
--- /dev/null
+++ b/include/trace/events/drm.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM drm
+
+#if !defined(_TRACE_DRM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DRM_H
+
+#include <linux/tracepoint.h>
+
+/* drm_debug() was called, pass its args */
+TRACE_EVENT(drm_debug,
+	TP_PROTO(int drm_debug_category, struct va_format *vaf),
+
+	TP_ARGS(drm_debug_category, vaf),
+
+	TP_STRUCT__entry(
+		__field(int, drm_debug_category)
+		__dynamic_array(char, msg, 256)
+	),
+
+	TP_fast_assign(
+		int len;
+
+		__entry->drm_debug_category = drm_debug_category;
+		vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
+
+		len = strlen(__get_str(msg));
+		if ((len > 0) && (__get_str(msg)[len-1] == '\n'))
+			len -= 1;
+		__get_str(msg)[len] = 0;
+	),
+
+	TP_printk("%s", __get_str(msg))
+);
+
+/* drm_devdbg() was called, pass its args, preserving order */
+TRACE_EVENT(drm_devdbg,
+	TP_PROTO(const struct device *dev, int drm_debug_category, struct va_format *vaf),
+
+	TP_ARGS(dev, drm_debug_category, vaf),
+
+	TP_STRUCT__entry(
+		__field(const struct device*, dev)
+		__field(int, drm_debug_category)
+		__dynamic_array(char, msg, 256)
+	),
+
+	TP_fast_assign(
+		int len;
+
+		__entry->drm_debug_category = drm_debug_category;
+		__entry->dev = dev;
+		vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
+
+		len = strlen(__get_str(msg));
+		if ((len > 0) && (__get_str(msg)[len-1] == '\n'))
+			len -= 1;
+		__get_str(msg)[len] = 0;
+	),
+
+	TP_printk("cat:%d, %s %s", __entry->drm_debug_category,
+		  dev_name(__entry->dev), __get_str(msg))
+);
+
+#endif /* _TRACE_DRM_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.33.1

