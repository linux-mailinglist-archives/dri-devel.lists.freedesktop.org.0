Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790F5AC73C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEBA10E313;
	Sun,  4 Sep 2022 21:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D112E10E183;
 Sun,  4 Sep 2022 21:42:44 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id s11so3868252ilt.7;
 Sun, 04 Sep 2022 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hLX0vmxfE2cNoXxW+pxt5dZIDGNJfmOeoJDSMO1hano=;
 b=ZpQL1fgEKB26ROGXg3bIaSFjutqwzthCJGLTsOMm82G/WKNEV7RaSc1HgHH+4EYBBS
 I4kKHN3sYKUpq6oxtDqQ1rCKWqBdgYhjSyRVZjcy2kkCKt36zUM2J/ACsEbogd/hT1/4
 424RgMlqSajD+0g+5qs3goYOHny/cd7TJJkRA/BMgzHJmFhr2Q29luzQuKVFVIgObj69
 m8/YXI9TBy0MBh8wQ/bAntqEfcQ5RhKh7RL9djNRQrRx1PcKpAkktrHMphwSX2m7oEaQ
 uSJsFu2GqUMeiXnT8ItzwB1PI1sTsJRhpbzjAcUWmn/b2uQrxhPmWUibRuhMD2GPNPqm
 PVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hLX0vmxfE2cNoXxW+pxt5dZIDGNJfmOeoJDSMO1hano=;
 b=iQF1uvIPCR6D0kYP7Il3cbLSE97NBxOGuHps0YuV4QwnASBlj+sYHciRenmDAIRinD
 4TIl1jRunISFcBzfmfgTik8d1J8BmJ9lUmACT4R4lsALsMdfdji77pmgD4MRvQ12HQ2D
 qDBc5e6/FK3TPCvHTNMH9vTTS7/jZ6sGXjpIOaatQA7kW/TP7FHdmWxAKvVCrXLCMEXN
 GyIqworL1ioDKOvwlh0VlsiYQfaY2zbFrFCHhhr1WtYmAX7STVlh/QohNs3Zba+q+ZyO
 UVqu8+omkmBf4WgO9Q6vR0yHghsySsBDKv2pSNbRTJTBLtuxXIcF2oPmFyTzQXaxflkj
 BpDg==
X-Gm-Message-State: ACgBeo2v+9YFo3IMA+j0EZA1WGC1bvNQ8pDBZHInsrmLq2HCC2mN9gEK
 se4znNlrDH0nN4mPG4a+JYU=
X-Google-Smtp-Source: AA6agR6D4aeYAw5/pzfOTRxYtiGWHhCcgKpGfv2afQnTmQdaB6TE6PRIg59M3lVF8/S7qM7IzEmgCg==
X-Received: by 2002:a05:6e02:1a6c:b0:2f1:5a6e:93c6 with SMTP id
 w12-20020a056e021a6c00b002f15a6e93c6mr1815104ilv.175.1662327764441; 
 Sun, 04 Sep 2022 14:42:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 36/57] dyndbg: add write-events-to-tracefs code
Date: Sun,  4 Sep 2022 15:41:13 -0600
Message-Id: <20220904214134.408619-37-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, vincent.whitchurch@axis.com,
 linux@rasmusvillemoes.dk, seanpaul@chromium.org, joe@perches.com
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
index 1e9d0124a0e9..3c6c18f13889 100644
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
@@ -854,6 +856,98 @@ static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
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
@@ -868,16 +962,18 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
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
@@ -887,16 +983,18 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
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
@@ -909,6 +1007,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
+	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -918,22 +1017,24 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
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
@@ -949,26 +1050,29 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
2.37.2

