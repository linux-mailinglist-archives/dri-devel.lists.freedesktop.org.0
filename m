Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A91487262
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37A9113220;
	Fri,  7 Jan 2022 05:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EB0113216;
 Fri,  7 Jan 2022 05:29:54 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id o1so3643485ilo.6;
 Thu, 06 Jan 2022 21:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwfS1KATHD4qlF4EIAswj+v50MYv6dXEgUQ2kHGwxaY=;
 b=kLxZUeIiUHVpFydZkyGdzXJ27X73eVmnvUhjCBe6B6DjPI0Pf+xMAbzxg+u5iKIVNQ
 4WM76bt3BfUMZbbTwgdsNVD6jnfZybduM/LCiv8jGZmFzAqq8akfEnHGeWxZ1+tiZjw6
 Rq+2hbxKQx4aW9PNWwj6wvN9v9Neg+tTdIWV0i+ZetRoXN4hcr/wtT2P3fBostoTCDwZ
 h+zsCzE7033XDvFul+qtLtGkSKYLJLMg4aHvunIv5/WMkQjLgauWgd3HmELztB8Qyjaq
 tM/r4XIyGMG9FB+euiCZGnBekoii88bKl9KtUnfUepfzZJPNcoCbTO7pT0A7xiInYAjT
 pihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwfS1KATHD4qlF4EIAswj+v50MYv6dXEgUQ2kHGwxaY=;
 b=Vf0QI0V3HtpLLFbipnndZG+GzWfWMpo6C82OYOmdrydK3L9S4XX6eSELQFU72Zt+pT
 qs1bQkIqvdRM70OAWaHyer73dwDCzh8fMC8qzc0gj7PdXfLls8MUeXDTKP4JVvYkGxe/
 XG29fX+DaqtRHWu36rRq7raCBS6mWwNXWwkG53VaQ9Vtp4RBZoT+gJYbcGell3EXIeX9
 kFo7DggfED9NVnPHfqeLnTOlPzTirwWRALgZ6bfgu4VRy2+AHBM2xE0IBQVHHwBA+uQU
 UEraMcXq2GVSZOLh1OmLUYoNTWgyr040d93ZG9m4lTOVek29n0T2RLLorOlvMO4fy24N
 e0FQ==
X-Gm-Message-State: AOAM532Pn/rWLUaP/JqKRiZ3V+wdC+iLsDNRI4IRHP3Djm8xafo/7+0P
 0rug1G/dtSrAEGIwiV0MFmU=
X-Google-Smtp-Source: ABdhPJxJuqCjFl5e7DAMZoQn88gADlHCPWi3iC9gJSxC0rmA5z56lvaNsv1+DXz8Gou8DtO0ZHXUfg==
X-Received: by 2002:a92:ddc4:: with SMTP id d4mr4637305ilr.281.1641533393416; 
 Thu, 06 Jan 2022 21:29:53 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:53 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 03/19] dyndbg: add write-to-tracefs code
Date: Thu,  6 Jan 2022 22:29:26 -0700
Message-Id: <20220107052942.1349447-4-jim.cromie@gmail.com>
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
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org,
 vincent.whitchurch@axis.com, mingo@redhat.com, quic_psodagud@quicinc.com,
 maz@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adds: dynamic_trace()
 uses trace_console() temporarily to issue printk:console event
 uses internal-ish __ftrace_trace_stack code:
      4-context buffer stack, barriers per Steve

call it from new funcs:
  dynamic_printk() - print to both syslog/tracefs
  dynamic_dev_printk() - dev-print to both syslog/tracefs

These handle both _DPRINTK_FLAGS_PRINTK and _DPRINTK_FLAGS_TRACE
cases, allowing to vsnprintf the message once and use it for both,
skipping past the KERN_DEBUG character for tracing.

Finally, adjust the callers: __dynamic_{pr_debug,{,net,ib}dev_dbg},
replacing printk and dev_printk with the new funcs above.

The _DPRINTK_FLAGS_TRACE flag character s 'T', so the following finds
all callsites enabled for tracing:

  grep -P =p?T /proc/dynamic_debug/control

Enabling debug-to-tracefs is 2 steps:

  # event enable
  echo 1 > /sys/kernel/tracing/events/dyndbg/enable
  # callsite enable
  echo module foo +T > /proc/dynamic_debug/control

This patch,~1,~2 are based upon:
  https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/

.. with simplification of temporarily reusing trace_console() rather
than adding a new printk:dyndbg event.  Soon, add 2 new events
capturing the pr_debug & dev_dbg() args.

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |   1 +
 lib/dynamic_debug.c                           | 155 +++++++++++++++---
 2 files changed, 130 insertions(+), 26 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index a89cfa083155..3c8f104a143f 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -228,6 +228,7 @@ of the characters::
 The flags are::
 
   p    enables the pr_debug() callsite.
+  T    enables callsite to issue a dyndbg:* trace-event
   f    Include the function name in the printed message
   l    Include line number in the printed message
   m    Include module name in the printed message
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 78a2912976c1..3fd035cd4653 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
+#include <trace/events/printk.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -87,6 +88,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINTK, 'p' },
+	{ _DPRINTK_FLAGS_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -628,6 +630,96 @@ static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 	return buf;
 }
 
+/*
+ * This code is heavily based on __ftrace_trace_stack().
+ *
+ * Allow 4 levels of nesting: normal, softirq, irq, NMI.
+ */
+#define DYNAMIC_TRACE_NESTING	4
+
+struct dynamic_trace_buf {
+	char buf[256];
+};
+
+struct dynamic_trace_bufs {
+	struct dynamic_trace_buf bufs[DYNAMIC_TRACE_NESTING];
+};
+
+static DEFINE_PER_CPU(struct dynamic_trace_bufs, dynamic_trace_bufs);
+static DEFINE_PER_CPU(int, dynamic_trace_reserve);
+
+static void dynamic_trace(const char *fmt, va_list args)
+{
+	struct dynamic_trace_buf *buf;
+	int bufidx;
+	int len;
+
+	preempt_disable_notrace();
+
+	bufidx = __this_cpu_inc_return(dynamic_trace_reserve) - 1;
+
+	if (WARN_ON_ONCE(bufidx > DYNAMIC_TRACE_NESTING))
+		goto out;
+
+	/* For the same reasons as in __ftrace_trace_stack(). */
+	barrier();
+
+	buf = this_cpu_ptr(dynamic_trace_bufs.bufs) + bufidx;
+
+	len = vscnprintf(buf->buf, sizeof(buf->buf), fmt, args);
+	trace_console(buf->buf, len);
+
+out:
+	/* As above. */
+	barrier();
+	__this_cpu_dec(dynamic_trace_reserve);
+	preempt_enable_notrace();
+}
+
+static void dynamic_printk(unsigned int flags, const char *fmt, ...)
+{
+	if (flags & _DPRINTK_FLAGS_TRACE) {
+		va_list args;
+
+		va_start(args, fmt);
+		/*
+		 * All callers include the KERN_DEBUG prefix to keep the
+		 * vprintk case simple; strip it out for tracing.
+		 */
+		dynamic_trace(fmt + strlen(KERN_DEBUG), args);
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
+static void dynamic_dev_printk(unsigned int flags, const struct device *dev,
+			       const char *fmt, ...)
+{
+
+	if (flags & _DPRINTK_FLAGS_TRACE) {
+		va_list args;
+
+		va_start(args, fmt);
+		dynamic_trace(fmt, args);
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
@@ -642,7 +734,8 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
+	dynamic_printk(descriptor->flags, KERN_DEBUG "%s%pV",
+		       dynamic_emit_prefix(descriptor, buf), &vaf);
 
 	va_end(args);
 }
@@ -652,6 +745,7 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 		      const struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
+	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -661,16 +755,18 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
+	flags = descriptor->flags;
 
 	if (!dev) {
-		printk(KERN_DEBUG "(NULL device *): %pV", &vaf);
+		dynamic_printk(flags, KERN_DEBUG "(NULL device *): %pV",
+			       &vaf);
 	} else {
 		char buf[PREFIX_SIZE] = "";
 
-		dev_printk_emit(LOGLEVEL_DEBUG, dev, "%s%s %s: %pV",
-				dynamic_emit_prefix(descriptor, buf),
-				dev_driver_string(dev), dev_name(dev),
-				&vaf);
+		dynamic_dev_printk(flags, dev, "%s%s %s: %pV",
+				   dynamic_emit_prefix(descriptor, buf),
+				   dev_driver_string(dev), dev_name(dev),
+				   &vaf);
 	}
 
 	va_end(args);
@@ -683,6 +779,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
+	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -692,22 +789,24 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
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
+		dynamic_dev_printk(flags, dev->dev.parent,
+				   "%s%s %s %s%s: %pV",
+				   dynamic_emit_prefix(descriptor, buf),
+				   dev_driver_string(dev->dev.parent),
+				   dev_name(dev->dev.parent),
+				   netdev_name(dev), netdev_reg_state(dev),
+				   &vaf);
 	} else if (dev) {
-		printk(KERN_DEBUG "%s%s: %pV", netdev_name(dev),
-		       netdev_reg_state(dev), &vaf);
+		dynamic_printk(flags, KERN_DEBUG "%s%s: %pV",
+			       netdev_name(dev), netdev_reg_state(dev), &vaf);
 	} else {
-		printk(KERN_DEBUG "(NULL net_device): %pV", &vaf);
+		dynamic_printk(flags, KERN_DEBUG "(NULL net_device): %pV",
+			       &vaf);
 	}
 
 	va_end(args);
@@ -723,29 +822,33 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
+		dynamic_dev_printk(flags, ibdev->dev.parent,
+				   "%s%s %s %s: %pV",
+				   dynamic_emit_prefix(descriptor, buf),
+				   dev_driver_string(ibdev->dev.parent),
+				   dev_name(ibdev->dev.parent),
+				   dev_name(&ibdev->dev),
+				   &vaf);
 	} else if (ibdev) {
-		printk(KERN_DEBUG "%s: %pV", dev_name(&ibdev->dev), &vaf);
+		dynamic_printk(flags, KERN_DEBUG "%s%s: %pV",
+			       dev_name(&ibdev->dev), &vaf);
 	} else {
-		printk(KERN_DEBUG "(NULL ib_device): %pV", &vaf);
+		dynamic_printk(flags, KERN_DEBUG "(NULL ip_device): %pV",
+			       &vaf);
 	}
 
-	va_end(args);
+va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_ibdev_dbg);
 
-- 
2.33.1

