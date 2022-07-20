Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C109957BA73
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1818F268;
	Wed, 20 Jul 2022 15:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EBC8F49E;
 Wed, 20 Jul 2022 15:33:33 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id l24so14530008ion.13;
 Wed, 20 Jul 2022 08:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLy9bGKDke7xD1kJ5ci1YEj/jyeVtbX9aQMBfETvouU=;
 b=moDvtXV3/A0GAHpixflC1n1IixIKOZZCoQmN/8cWz42wytzPboEtzLQj499OBOwCmw
 XzZl8MI96eHXyupZhthN8dpv0y2vu20yEp4QDz3ID4EUj8Fkf3furKwSwkx7sPBTRqtD
 MnYa/t8FWXRbUiU187HVqGmtBs3sasZ+fyq/+C2HvIw0rrUI+zEqwMel5G8XguOhoeBS
 4qxcKcg+u0KBYCN5VxbKm/CTfQNJ7aEccaqyFVWnZU1d/x+276xmv9c45gRQlFMP4GXG
 cRNr3WdWvTArDcgbR28lJo3J5j5Qa7NQyz//OFeacLuge46pNN+DYFzevKS2js3tH6Di
 zWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLy9bGKDke7xD1kJ5ci1YEj/jyeVtbX9aQMBfETvouU=;
 b=ts/MgJlXbHbD7iD2zpP9yszTkiVMNkVMx1ouvOT9FT/lXPzgq0rjkXh/WJwosWAa5Y
 yQr3ouTVlRu6tDhwUrGzrJ80TKb6PHTHEgcIJv8BNA9EdYzGObDHu58XzT0v3v+VVYGH
 cJggpow0tcULmtmrTU6KcoL7N43S6IkXkiwNePExW941E5l/6ha97Fo5eftMNIH6H2pz
 WM+tS/xJlr+odF35N21STL1aka/3bxEUfV6e+hOOk296Tk6RlfFjTo8379AKloxuBFJV
 4g3Sc3hxy0xG4I3gVnWausZsSLsTr0Hu55iThgXaOBLtRL0wk9ZPNdarFyNcHD8FQm+s
 W9Dw==
X-Gm-Message-State: AJIora8oY5iQ3vdEWS+IBQT4lyeSvLVYGY3VoX2FpBHg3CjJ5kv8a7vC
 3NKAUSWEo1zEIvo5O2ZdwCU0+BbhazSKcw==
X-Google-Smtp-Source: AGRyM1u+G3Lk8AYSRCZRE2OFkf8dfVNWa8aN7ElueYh9toYFBRWhgpT7Xlwh4nt41yG8BpWGwnJnhA==
X-Received: by 2002:a6b:4019:0:b0:669:3314:ebcb with SMTP id
 k25-20020a6b4019000000b006693314ebcbmr17819133ioa.197.1658331212473; 
 Wed, 20 Jul 2022 08:33:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 33/41] dyndbg: add write-events-to-tracefs code
Date: Wed, 20 Jul 2022 09:32:25 -0600
Message-Id: <20220720153233.144129-34-jim.cromie@gmail.com>
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
Cc: vincent.whitchurch@axis.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1st, internals:

adds: ddebug_trace()
 uses trace_console() temporarily to issue printk:console event
 uses internal-ish __ftrace_trace_stack code:
      4-context buffer stack, barriers per Steve Rostedt

call it from new mid-layer funcs:
  ddebug_printk() - ddebug_trace or vprintk (to syslog)
  ddebug_dev_printk() - ddebug_trace or dev_printk_emit

These handle both _DPRINTK_FLAGS_PRINTK and _DPRINTK_FLAGS_TRACE
cases, allowing to vsnprintf the message once and use it for both,
skipping past the KERN_DEBUG prefix for tracing.

Finally, adjust the top-layer: __dynamic_{pr_debug,{,net,ib}dev_dbg),
replacing printk/dev_printk_emit with ddebug_printk/ddebug_dev_printk.

Interface additions:
  new 'T' flag decl in opt_array. existing code handles it like others.
  document the new flag.

To enable drm.debug ATOMIC messages to tracefs:

  :#> echo class DRM_UT_ATOMIC +T > /proc/dynamic_debug/control

NB:

This patch,~1,~2 are basically direct copies of:
  https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/

with a few differences:

- s/dynamic_/ddebug_/ on Vincent's additions, tighter naming.
- __printf attrs on the _printk funcs.
- reuses trace_console() event, not adding a new "printk:dyndbg" event.
  later patches differentiate to new events.

- a flags arg remains unchanged, adapt later to *descriptor.

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |   5 +-
 lib/dynamic_debug.c                           | 156 +++++++++++++++---
 2 files changed, 133 insertions(+), 28 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index faa22f77847a..45b6e5697c89 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -209,8 +209,9 @@ of the characters::
 
 The flags are::
 
-  p    enables the pr_debug() callsite.
-  _    enables no flags.
+  p    callsite prints to syslog
+  T    callsite issues a dyndbg:* trace-event
+  _    enables no flags
 
   Decorator flags add to the message-prefix, in order:
   t    Include thread ID, or <intr>
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2a46c642373a..66f12b9127c7 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
+#include <trace/events/printk.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -90,6 +91,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINTK, 'p' },
+	{ _DPRINTK_FLAGS_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -835,6 +837,98 @@ static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 	return buf;
 }
 
+/*
+ * This code is heavily based on __ftrace_trace_stack().
+ *
+ * Allow 4 levels of nesting: normal, softirq, irq, NMI.
+ */
+#define DYNAMIC_TRACE_NESTING	4
+
+struct ddebug_trace_buf {
+	char buf[256];
+};
+
+struct ddebug_trace_bufs {
+	struct ddebug_trace_buf bufs[DYNAMIC_TRACE_NESTING];
+};
+
+static DEFINE_PER_CPU(struct ddebug_trace_bufs, ddebug_trace_bufs);
+static DEFINE_PER_CPU(int, ddebug_trace_reserve);
+
+static void ddebug_trace(const char *fmt, va_list args)
+{
+	struct ddebug_trace_buf *buf;
+	int bufidx;
+	int len;
+
+	preempt_disable_notrace();
+
+	bufidx = __this_cpu_inc_return(ddebug_trace_reserve) - 1;
+
+	if (WARN_ON_ONCE(bufidx > DYNAMIC_TRACE_NESTING))
+		goto out;
+
+	/* For the same reasons as in __ftrace_trace_stack(). */
+	barrier();
+
+	buf = this_cpu_ptr(ddebug_trace_bufs.bufs) + bufidx;
+
+	len = vscnprintf(buf->buf, sizeof(buf->buf), fmt, args);
+	trace_console(buf->buf, len);
+
+out:
+	/* As above. */
+	barrier();
+	__this_cpu_dec(ddebug_trace_reserve);
+	preempt_enable_notrace();
+}
+
+__printf(2, 3)
+static void ddebug_printk(unsigned int flags, const char *fmt, ...)
+{
+	if (flags & _DPRINTK_FLAGS_TRACE) {
+		va_list args;
+
+		va_start(args, fmt);
+		/*
+		 * All callers include the KERN_DEBUG prefix to keep the
+		 * vprintk case simple; strip it out for tracing.
+		 */
+		ddebug_trace(fmt + strlen(KERN_DEBUG), args);
+		va_end(args);
+	}
+
+	if (flags & _DPRINTK_FLAGS_PRINTK) {
+		va_list args;
+
+		va_start(args, fmt);
+		vprintk(fmt, args);
+		va_end(args);
+	}
+}
+
+__printf(3, 4)
+static void ddebug_dev_printk(unsigned int flags, const struct device *dev,
+			      const char *fmt, ...)
+{
+
+	if (flags & _DPRINTK_FLAGS_TRACE) {
+		va_list args;
+
+		va_start(args, fmt);
+		ddebug_trace(fmt, args);
+		va_end(args);
+	}
+
+	if (flags & _DPRINTK_FLAGS_PRINTK) {
+		va_list args;
+
+		va_start(args, fmt);
+		dev_vprintk_emit(LOGLEVEL_DEBUG, dev, fmt, args);
+		va_end(args);
+	}
+}
+
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 {
 	va_list args;
@@ -849,16 +943,18 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
+	ddebug_printk(descriptor->flags, KERN_DEBUG "%s%pV",
+		      dynamic_emit_prefix(descriptor, buf), &vaf);
 
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_pr_debug);
 
 void __dynamic_dev_dbg(struct _ddebug *descriptor,
-		      const struct device *dev, const char *fmt, ...)
+		       const struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
+	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -868,16 +964,18 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
+	flags = descriptor->flags;
 
 	if (!dev) {
-		printk(KERN_DEBUG "(NULL device *): %pV", &vaf);
+		ddebug_printk(flags, KERN_DEBUG "(NULL device *): %pV",
+			      &vaf);
 	} else {
 		char buf[PREFIX_SIZE] = "";
 
-		dev_printk_emit(LOGLEVEL_DEBUG, dev, "%s%s %s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
-				dev_driver_string(dev), dev_name(dev),
-				&vaf);
+		ddebug_dev_printk(flags, dev, "%s%s %s: %pV",
+				  dynamic_emit_prefix(descriptor, buf),
+				  dev_driver_string(dev), dev_name(dev),
+				  &vaf);
 	}
 
 	va_end(args);
@@ -890,6 +988,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
+	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -899,22 +998,24 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
+	flags = descriptor->flags;
 
 	if (dev && dev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		dev_printk_emit(LOGLEVEL_DEBUG, dev->dev.parent,
-				"%s%s %s %s%s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
-				dev_driver_string(dev->dev.parent),
-				dev_name(dev->dev.parent),
-				netdev_name(dev), netdev_reg_state(dev),
-				&vaf);
+		ddebug_dev_printk(flags, dev->dev.parent,
+				   "%s%s %s %s%s: %pV",
+				   dynamic_emit_prefix(descriptor, buf),
+				   dev_driver_string(dev->dev.parent),
+				   dev_name(dev->dev.parent),
+				   netdev_name(dev), netdev_reg_state(dev),
+				   &vaf);
 	} else if (dev) {
-		printk(KERN_DEBUG "%s%s: %pV", netdev_name(dev),
-		       netdev_reg_state(dev), &vaf);
+		ddebug_printk(flags, KERN_DEBUG "%s%s: %pV",
+			       netdev_name(dev), netdev_reg_state(dev), &vaf);
 	} else {
-		printk(KERN_DEBUG "(NULL net_device): %pV", &vaf);
+		ddebug_printk(flags, KERN_DEBUG "(NULL net_device): %pV",
+			       &vaf);
 	}
 
 	va_end(args);
@@ -930,26 +1031,29 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 {
 	struct va_format vaf;
 	va_list args;
+	unsigned int flags;
 
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
+	flags = descriptor->flags;
 
 	if (ibdev && ibdev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		dev_printk_emit(LOGLEVEL_DEBUG, ibdev->dev.parent,
-				"%s%s %s %s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
-				dev_driver_string(ibdev->dev.parent),
-				dev_name(ibdev->dev.parent),
-				dev_name(&ibdev->dev),
-				&vaf);
+		ddebug_dev_printk(flags, ibdev->dev.parent,
+				  "%s%s %s %s: %pV",
+				  dynamic_emit_prefix(descriptor, buf),
+				  dev_driver_string(ibdev->dev.parent),
+				  dev_name(ibdev->dev.parent),
+				  dev_name(&ibdev->dev),
+				  &vaf);
 	} else if (ibdev) {
-		printk(KERN_DEBUG "%s: %pV", dev_name(&ibdev->dev), &vaf);
+		ddebug_printk(flags, KERN_DEBUG "%s: %pV",
+			      dev_name(&ibdev->dev), &vaf);
 	} else {
-		printk(KERN_DEBUG "(NULL ib_device): %pV", &vaf);
+		ddebug_printk(flags, KERN_DEBUG "(NULL ip_device): %pV", &vaf);
 	}
 
 	va_end(args);
-- 
2.36.1

