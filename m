Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3E52946A
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B19710F5B3;
	Mon, 16 May 2022 22:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C190710EE55;
 Mon, 16 May 2022 22:57:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m6so17635914iob.4;
 Mon, 16 May 2022 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5YN3gFWspJywlBdR94M3GwnkLtOFuABN4Pf+hFKzHmQ=;
 b=CcmMQh0kPmG/mGl9sIX5ljtGzreaFyY+zLEeWbI0F+9I2jxNH8XiXCal5UvxHS9dvx
 E/Bx71gMQt+1mMTOXjmO05++zU4ejmLsjTjha0qWcyWmFX+BT2ecEeAfS0LbHIAyXF2P
 ZlEG44BrjYRqg538ymK3gHjOMzsidIF5LwjORO7y9R3fp7ATS5rAfjagYj2szfO+rNQe
 tmwZGGU1tBbJ8xfaJEfuvUUEmUi8C8ENeObZJg9XUjsZD70YTGy1WENzR5sEeWB0NO7i
 3aHymezosUBnziGU+fUJohnC1il7TlIRTaSOGjWpixSrbKy8bQwwze93boECK4s8sYR8
 l5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5YN3gFWspJywlBdR94M3GwnkLtOFuABN4Pf+hFKzHmQ=;
 b=M9FoyAzE3tEAPmJ5KKikJeWZaM4Ivjsyxr/CIiFky2p+9Vn+w2S51KdniSUkj6Qxd4
 qGlxfIKg4Oik8XogsI7Bh7niUwFTK3ezz4LlIY+ptsPIhJCz01a1XeeZtFUEbwF0o1od
 GKIU5ctxMS9+/QZY/+SzbZBqVjUBLzHNzWr2qyMZvpWFokJGvBFfPL/SAo4W87fX/FFs
 WaKKbh34XW9dikYZNpGrD6VquWhn8Jkzw5mDDRhg+OV8kTeWvSXyc5L+wanz3+WOdFZd
 1tWdqZ9utrY1/rDvygJs/Oe0B+fLaisBO2nQQlOhcVbQmLNOH84cMGqQvzFNgwOzaSol
 y+0A==
X-Gm-Message-State: AOAM531wB5s4bAVde9IEEXePBnpTSe+yNKKXj1nEiggV73q5mNLooLmd
 Zm1amaAsJYzxPi7lVR2Hbhk=
X-Google-Smtp-Source: ABdhPJxQ/HvGhAv8CR9eQzEEl354u66m2ukgeT1V6hfr/VeviMOBm82PeDApak4yOKEqhJQo/fQSaQ==
X-Received: by 2002:a05:6638:2603:b0:32b:a724:2b8c with SMTP id
 m3-20020a056638260300b0032ba7242b8cmr10036821jat.278.1652741853347; 
 Mon, 16 May 2022 15:57:33 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 26/27] dyndbg: 4 new trace-events: pr_debug, dev_dbg, drm_{,
 dev}debug
Date: Mon, 16 May 2022 16:56:39 -0600
Message-Id: <20220516225640.3102269-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ddebug_trace() currently issues a single printk:console event.
Replace that, adding include/trace/events/dyndbg.h, which defines 2
new events:

- dyndbg:prdbg  - from trace_prdbg()  - if !dev
- dyndbg:devdbg - from trace_devdbg() - if !!dev

This links the legacy pr_debug API to tracefs, via dyndbg, allowing
pr_debug()s etc to add just a little more user-context to the
trace-logs, and then at users option, less syslog.

The 2 new trace_*() calls accept their caller's args respectively,
keeping the available info w/o alteration; we can't improve on
transparency.  The args:

 1- struct _ddebug *descriptor, giving tracefs all of dyndbg's info.
 2- struct device *dev, used by trace_devdbg(), if !!dev

The trace_*() calls need the descriptor arg, the callchain prototypes
above them are extended to provide it.

The existing category param in this callchain is partially redundant;
when descriptor is available, it has the class_id.

dev_dbg(desc, dev...), if dev is true, issues a trace_devdbg(),
otherwise trace_prdbg().  This way we dont consume buffer space
storing nulls.  Otherwise the events are equivalent.

Also add include/trace/events/drm.h, to create 2 events for use in
drm_dbg() and drm_devdbg(), and call them.  This recapitulates the
changes described above, connecting 3-10K drm.debug callsites to
tracefs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c   |  9 +++++
 include/trace/events/drm.h    | 68 ++++++++++++++++++++++++++++++++
 include/trace/events/dyndbg.h | 74 +++++++++++++++++++++++++++++++++++
 lib/dynamic_debug.c           | 73 +++++++++++++++++-----------------
 4 files changed, 188 insertions(+), 36 deletions(-)
 create mode 100644 include/trace/events/drm.h
 create mode 100644 include/trace/events/dyndbg.h

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 63125a507577..9afb676bda4d 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -34,6 +34,9 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/drm.h>
+
 /*
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
@@ -283,10 +286,14 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
 			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
 				   __builtin_return_address(0), &vaf);
+		if (desc->flags & _DPRINTK_FLAGS_TRACE)
+			trace_drm_devdbg(dev, category, &vaf);
 	} else {
 		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
 			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 			       __builtin_return_address(0), &vaf);
+		if (desc->flags & _DPRINTK_FLAGS_TRACE)
+			trace_drm_debug(category, &vaf);
 	}
 	va_end(args);
 }
@@ -307,6 +314,8 @@ void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const ch
 	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 	       __builtin_return_address(0), &vaf);
 
+	trace_drm_debug(category, &vaf);
+
 	va_end(args);
 }
 EXPORT_SYMBOL(___drm_dbg);
diff --git a/include/trace/events/drm.h b/include/trace/events/drm.h
new file mode 100644
index 000000000000..6de80dd68620
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
+	    TP_PROTO(int drm_debug_category, struct va_format *vaf),
+
+	    TP_ARGS(drm_debug_category, vaf),
+
+	    TP_STRUCT__entry(
+		    __field(int, drm_debug_category)
+		    __dynamic_array(char, msg, 256)
+		    ),
+
+	    TP_fast_assign(
+		    int len;
+
+		    __entry->drm_debug_category = drm_debug_category;
+		    vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
+
+		    len = strlen(__get_str(msg));
+		    if (len > 0 && (__get_str(msg)[len - 1] == '\n'))
+			    len -= 1;
+		    __get_str(msg)[len] = 0;
+		    ),
+
+	    TP_printk("%s", __get_str(msg))
+);
+
+/* drm_devdbg() was called, pass its args, preserving order */
+TRACE_EVENT(drm_devdbg,
+	    TP_PROTO(const struct device *dev, int drm_debug_category, struct va_format *vaf),
+
+	    TP_ARGS(dev, drm_debug_category, vaf),
+
+	    TP_STRUCT__entry(
+		    __field(const struct device*, dev)
+		    __field(int, drm_debug_category)
+		    __dynamic_array(char, msg, 256)
+		    ),
+
+	    TP_fast_assign(
+		    int len;
+
+		    __entry->drm_debug_category = drm_debug_category;
+		    __entry->dev = dev;
+		    vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
+
+		    len = strlen(__get_str(msg));
+		    if (len > 0 && (__get_str(msg)[len - 1] == '\n'))
+			    len -= 1;
+		    __get_str(msg)[len] = 0;
+		    ),
+
+	    TP_printk("cat:%d, %s %s", __entry->drm_debug_category,
+		      dev_name(__entry->dev), __get_str(msg))
+);
+
+#endif /* _TRACE_DRM_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/include/trace/events/dyndbg.h b/include/trace/events/dyndbg.h
new file mode 100644
index 000000000000..e19fcb56566c
--- /dev/null
+++ b/include/trace/events/dyndbg.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dyndbg
+
+#if !defined(_TRACE_DYNDBG_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DYNDBG_H
+
+#include <linux/tracepoint.h>
+
+/* capture pr_debug() callsite descriptor and message */
+TRACE_EVENT(prdbg,
+	    TP_PROTO(const struct _ddebug *desc, const char *text, size_t len),
+
+	    TP_ARGS(desc, text, len),
+
+	    TP_STRUCT__entry(
+		    __field(const struct _ddebug *, desc)
+		    __dynamic_array(char, msg, len + 1)
+		    ),
+
+	    TP_fast_assign(
+		    __entry->desc = desc;
+		    /*
+		     * Each trace entry is printed in a new line.
+		     * If the msg finishes with '\n', cut it off
+		     * to avoid blank lines in the trace.
+		     */
+		    if (len > 0 && (text[len - 1] == '\n'))
+			    len -= 1;
+
+		    memcpy(__get_str(msg), text, len);
+		    __get_str(msg)[len] = 0;
+		    ),
+
+	    TP_printk("%s.%s %s", __entry->desc->modname,
+		      __entry->desc->function, __get_str(msg))
+);
+
+/* capture dev_dbg() callsite descriptor, device, and message */
+TRACE_EVENT(devdbg,
+	    TP_PROTO(const struct _ddebug *desc, const struct device *dev,
+		     const char *text, size_t len),
+
+	    TP_ARGS(desc, dev, text, len),
+
+	    TP_STRUCT__entry(
+		    __field(const struct _ddebug *, desc)
+		    __field(const struct device *, dev)
+		    __dynamic_array(char, msg, len + 1)
+		    ),
+
+	    TP_fast_assign(
+		    __entry->desc = desc;
+		    __entry->dev = (struct device *) dev;
+		    /*
+		     * Each trace entry is printed in a new line.
+		     * If the msg finishes with '\n', cut it off
+		     * to avoid blank lines in the trace.
+		     */
+		    if (len > 0 && (text[len - 1] == '\n'))
+			    len -= 1;
+
+		    memcpy(__get_str(msg), text, len);
+		    __get_str(msg)[len] = 0;
+		    ),
+
+	    TP_printk("%s.%s %s", __entry->desc->modname,
+		      __entry->desc->function, __get_str(msg))
+);
+
+#endif /* _TRACE_DYNDBG_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 81cfe6e21d15..a97ca94a266a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,7 +36,9 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
-#include <trace/events/printk.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/dyndbg.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -790,7 +792,9 @@ struct ddebug_trace_bufs {
 static DEFINE_PER_CPU(struct ddebug_trace_bufs, ddebug_trace_bufs);
 static DEFINE_PER_CPU(int, ddebug_trace_reserve);
 
-static void ddebug_trace(const char *fmt, va_list args)
+__printf(3, 0)
+static void ddebug_trace(struct _ddebug *desc, const struct device *dev,
+			 const char *fmt, va_list args)
 {
 	struct ddebug_trace_buf *buf;
 	int bufidx;
@@ -809,7 +813,11 @@ static void ddebug_trace(const char *fmt, va_list args)
 	buf = this_cpu_ptr(ddebug_trace_bufs.bufs) + bufidx;
 
 	len = vscnprintf(buf->buf, sizeof(buf->buf), fmt, args);
-	trace_console(buf->buf, len);
+
+	if (!dev)
+		trace_prdbg(desc, buf->buf, len);
+	else
+		trace_devdbg(desc, dev, buf->buf, len);
 
 out:
 	/* As above. */
@@ -819,9 +827,9 @@ static void ddebug_trace(const char *fmt, va_list args)
 }
 
 __printf(2, 3)
-static void ddebug_printk(unsigned int flags, const char *fmt, ...)
+static void ddebug_printk(struct _ddebug *desc, const char *fmt, ...)
 {
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -829,11 +837,11 @@ static void ddebug_printk(unsigned int flags, const char *fmt, ...)
 		 * All callers include the KERN_DEBUG prefix to keep the
 		 * vprintk case simple; strip it out for tracing.
 		 */
-		ddebug_trace(fmt + strlen(KERN_DEBUG), args);
+		ddebug_trace(desc, NULL, fmt + strlen(KERN_DEBUG), args);
 		va_end(args);
 	}
 
-	if (flags & _DPRINTK_FLAGS_PRINTK) {
+	if (desc->flags & _DPRINTK_FLAGS_PRINTK) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -843,19 +851,19 @@ static void ddebug_printk(unsigned int flags, const char *fmt, ...)
 }
 
 __printf(3, 4)
-static void ddebug_dev_printk(unsigned int flags, const struct device *dev,
+static void ddebug_dev_printk(struct _ddebug *desc, const struct device *dev,
 			      const char *fmt, ...)
 {
 
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
-		ddebug_trace(fmt, args);
+		ddebug_trace(desc, dev, fmt, args);
 		va_end(args);
 	}
 
-	if (flags & _DPRINTK_FLAGS_PRINTK) {
+	if (desc->flags & _DPRINTK_FLAGS_PRINTK) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -878,7 +886,7 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	ddebug_printk(descriptor->flags, KERN_DEBUG "%s%pV",
+	ddebug_printk(descriptor, KERN_DEBUG "%s%pV",
 		      dynamic_emit_prefix(descriptor, buf), &vaf);
 
 	va_end(args);
@@ -889,7 +897,6 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 		       const struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -899,15 +906,14 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (!dev) {
-		ddebug_printk(flags, KERN_DEBUG "(NULL device *): %pV",
-			      &vaf);
+		ddebug_printk(descriptor, KERN_DEBUG "(NULL device *): %pV",
+			       &vaf);
 	} else {
 		char buf[PREFIX_SIZE] = "";
 
-		ddebug_dev_printk(flags, dev, "%s%s %s: %pV",
+		ddebug_dev_printk(descriptor, dev, "%s%s %s: %pV",
 				  dynamic_emit_prefix(descriptor, buf),
 				  dev_driver_string(dev), dev_name(dev),
 				  &vaf);
@@ -923,7 +929,6 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -933,24 +938,22 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (dev && dev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		ddebug_dev_printk(flags, dev->dev.parent,
-				   "%s%s %s %s%s: %pV",
-				   dynamic_emit_prefix(descriptor, buf),
-				   dev_driver_string(dev->dev.parent),
-				   dev_name(dev->dev.parent),
-				   netdev_name(dev), netdev_reg_state(dev),
-				   &vaf);
+		ddebug_dev_printk(descriptor, dev->dev.parent,
+				  "%s%s %s %s%s: %pV",
+				  dynamic_emit_prefix(descriptor, buf),
+				  dev_driver_string(dev->dev.parent),
+				  dev_name(dev->dev.parent),
+				  netdev_name(dev), netdev_reg_state(dev),
+				  &vaf);
 	} else if (dev) {
-		ddebug_printk(flags, KERN_DEBUG "%s%s: %pV",
-			       netdev_name(dev), netdev_reg_state(dev), &vaf);
+		ddebug_dev_printk(descriptor, &dev->dev, KERN_DEBUG "%s%s: %pV",
+				  netdev_name(dev), netdev_reg_state(dev), &vaf);
 	} else {
-		ddebug_printk(flags, KERN_DEBUG "(NULL net_device): %pV",
-			       &vaf);
+		ddebug_printk(descriptor, KERN_DEBUG "(NULL net_device): %pV", &vaf);
 	}
 
 	va_end(args);
@@ -966,18 +969,16 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 {
 	struct va_format vaf;
 	va_list args;
-	unsigned int flags;
 
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (ibdev && ibdev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		ddebug_dev_printk(flags, ibdev->dev.parent,
+		ddebug_dev_printk(descriptor, ibdev->dev.parent,
 				  "%s%s %s %s: %pV",
 				  dynamic_emit_prefix(descriptor, buf),
 				  dev_driver_string(ibdev->dev.parent),
@@ -985,10 +986,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				  dev_name(&ibdev->dev),
 				  &vaf);
 	} else if (ibdev) {
-		ddebug_printk(flags, KERN_DEBUG "%s: %pV",
-			      dev_name(&ibdev->dev), &vaf);
+		ddebug_dev_printk(descriptor, &ibdev->dev, KERN_DEBUG "%s: %pV",
+				  dev_name(&ibdev->dev), &vaf);
 	} else {
-		ddebug_printk(flags, KERN_DEBUG "(NULL ip_device): %pV", &vaf);
+		ddebug_printk(descriptor, KERN_DEBUG "(NULL ip_device): %pV", &vaf);
 	}
 
 	va_end(args);
-- 
2.35.3

