Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89A577BCB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931F9A9E44;
	Mon, 18 Jul 2022 06:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD074A9D3C;
 Mon, 18 Jul 2022 06:39:07 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id x64so186650iof.1;
 Sun, 17 Jul 2022 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8u9TQsA4i84F8q6VN0j735LsnnakqdbH23eQrky597Y=;
 b=R+4qQBdZmfQKSkMJLZ0OSPTnVJc3LBnKG5xh47ARBVF26QGP+7U0iTIvy3UihiJJCF
 VxzK7gtewq8zFawB994KbLtnRXnln+4evEHAbVdNSw9PAyfVoOPoKz3Ikpb97CeOA0KS
 GWTZ7QI32SqA9eB1ZKREZn3qJxDNizYWK0TK1R0o2jA3wxJAU7k0ZI37liwCpwuHrYu1
 Vjc4FAgg8BX7fl/XhWQ++qiK+UDiUHJQa+XN9zooy49PhystFSgAwqQUT4o6J1y9Yskg
 xpO8clfSK0+GAGHXjiRPBlI5O5qXoHaAEFzVd0a0RTvJ8R8xuxZFryEMP9KvxFrAnP3Z
 5fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8u9TQsA4i84F8q6VN0j735LsnnakqdbH23eQrky597Y=;
 b=RpLYinje+heGQr5fYwwjuWYnidWXpGeCitMTdXkFk7FnbLkZACovnQVxEmHgYiSQnK
 bAyRZuzbHkjYLRwWfh197BG4TJFHhiAjQ3+b1VwRTv8C1UBKdxF05ZQBOS//xx0T9NJG
 uA7P9SY130IckOwOBkbm2GsnwoUAfTsVBWaHUQHhHiAi9pkNAq3hdv1o+TClYTqZCPJv
 ZsWDwvsEJ84entKVXW7ApjcclU9jzDK+MckCmoUueysVEQFGhsUYN+sYd9sf7xu1MqGa
 DEaU7VF16xS6xgL3/blvLH/c6zsZbTVvsi2y7utejwIJMH4/OSLqI/Nv9NuuWKKEhom/
 0DGA==
X-Gm-Message-State: AJIora/2UHa1WXDvVIg8l+x2p/KQphOhq4zMZb266m3zZlybXSFI6rep
 dA98azZ8CmEUwa8fqfrlO0I=
X-Google-Smtp-Source: AGRyM1saDWTryIh1BymJ4HPx29bYUBvzn+uBqcYFzDbYhj6n3FcXLRAp+ZBNdqejqICUUepNBF9ZMA==
X-Received: by 2002:a02:cf81:0:b0:341:7cde:7035 with SMTP id
 w1-20020a02cf81000000b003417cde7035mr24249jar.161.1658126347105; 
 Sun, 17 Jul 2022 23:39:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 31/39] dyndbg: add write-events-to-tracefs code
Date: Mon, 18 Jul 2022 00:36:23 -0600
Message-Id: <20220718063641.9179-40-jim.cromie@gmail.com>
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
 vincent.whitchurch@axis.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adds: ddebug_trace()
 uses trace_console() temporarily to issue printk:console event
 uses internal-ish __ftrace_trace_stack code:
      4-context buffer stack, barriers per Steve Rostedt

call it from new funcs:
  ddebug_printk() - print to both syslog/tracefs
  ddebug_dev_printk() - dev-print to both syslog/tracefs

These handle both _DPRINTK_FLAGS_PRINTK and _DPRINTK_FLAGS_TRACE
cases, allowing to vsnprintf the message once and use it for both,
skipping past the KERN_DEBUG character for tracing.

Finally, adjust the callers: __ddebug_{pr_debug,{,net,ib}dev_dbg},
replacing printk and dev_printk with the new funcs above.

The _DPRINTK_FLAGS_TRACE flag character is 'T', so the following finds
all callsites enabled for tracing:

  grep -P =p?T /proc/dynamic_debug/control

This patch,~1,~2 are basically copies of:
  https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/

with a few differences:

- s/dynamic_/ddebug_/ on Vincent's additions
- __printf attrs on the _printk funcs
- reuses trace_console() event, not adding a new "printk:dyndbg" event.
  next patch replaces this with 2 new events

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |   5 +-
 lib/dynamic_debug.c                           | 156 +++++++++++++++---
 2 files changed, 133 insertions(+), 28 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index cdf1da69e43c..103e79269bac 100644
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

