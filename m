Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B668652945C
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256C310F3EC;
	Mon, 16 May 2022 22:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC8210F68B;
 Mon, 16 May 2022 22:57:32 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id q203so1805263iod.0;
 Mon, 16 May 2022 15:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=caFoAHAZrN6Nrr5FNeRmlwujqgilZpBF2BSLNzuccOo=;
 b=NinNvSUN/V7+ZBcOy7kFMOYb2ewqtyqY6O7HWY3BR6FV7Yhj9jnrpeooDnoAcckWIr
 ELrZbo+4SuvVcAbWbb+xUAL306VSI3QFk6P2p3HXVez72y347OrXoSSKXNosPuUIP+67
 r6swfAiLyWz75WRG32WMwXcJ6C33jUFVgQtXkikEfYfA3YG8jpZxKu4XpBImCxI5UNmO
 UQVXa/N1t8AxBA65WVkCUgRmxqoq8aWSlc1tiWE3HbLH4t8OVTa1Xk8keeXy0JU23E8P
 FdF6AAajZkc7+S635APfipItn1/LufrGU4CxiBzyrYWiTCMpNCwVvx7yDdGtGyywjj5l
 smZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=caFoAHAZrN6Nrr5FNeRmlwujqgilZpBF2BSLNzuccOo=;
 b=osIq7grbvZ82v3yM+c1gpZnOlOY22G7sSf2wlGOMFDbXQB+HYvV4mk2vO+y4kjUjY1
 QCywM5rHxyiJ/drdJfeR9z1Z3bn2Wxl1O29SN6GaBS8PMQPwZZ1aj7Q0nkxIqMi4YJMk
 S6VmkQSqIfyibZEGTJFUtzaha4hXE2qKfsNX/DoJehLf4MgB3s/rC6K/LAAP1CpCBGgL
 op+CKjpkgoY3QK8TdYTXSWjsqf3fpHajaOfafA18o6PiX+nIuJpUzv2zJVkni0hH7vKe
 cwnIaDnsGmUn5xAyLPCAkUaQxLIa8He5C3GJevxh/+AqMIhrJzhA3u0GnOVvYMUjlgRn
 9sgA==
X-Gm-Message-State: AOAM531sRblUxPArAAPGWcO8FsvclPyngvG4m6CSt8XRDj02daSqhNmG
 gHFd+W4NiEwKPTMxVDbvLLY=
X-Google-Smtp-Source: ABdhPJxexOwsRq4mvWcqWxBeARmtX2+64hrtcuD4DHJKBDexKi2pI1LKCe+a949qXkiCGFOgxAz29Q==
X-Received: by 2002:a05:6638:19c:b0:32e:fba:fdfe with SMTP id
 a28-20020a056638019c00b0032e0fbafdfemr7493119jaq.88.1652741852141; 
 Mon, 16 May 2022 15:57:32 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 25/27] dyndbg: add write-events-to-tracefs code
Date: Mon, 16 May 2022 16:56:38 -0600
Message-Id: <20220516225640.3102269-26-jim.cromie@gmail.com>
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
 vincent.whitchurch@axis.com, rostedt@goodmis.org, mingo@redhat.com,
 mathieu.desnoyers@efficios.com, quic_psodagud@quicinc.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
 .../admin-guide/dynamic-debug-howto.rst       |   1 +
 drivers/gpu/drm/drm_print.c                   |   4 +-
 lib/dynamic_debug.c                           | 156 +++++++++++++++---
 3 files changed, 133 insertions(+), 28 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 01ca6f635dcc..b8c6772b88ac 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -239,6 +239,7 @@ of the characters::
 The flags are::
 
   p    enables the pr_debug() callsite.
+  T    enables callsite to issue a dyndbg:* trace-event
   f    Include the function name in the printed message
   l    Include line number in the printed message
   m    Include module name in the printed message
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 77b56399147a..63125a507577 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -280,11 +280,11 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 	vaf.va = &args;
 
 	if (dev) {
-		if (desc->flags && _DPRINTK_FLAGS_PRINTK)
+		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
 			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
 				   __builtin_return_address(0), &vaf);
 	} else {
-		if (desc->flags && _DPRINTK_FLAGS_PRINTK)
+		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
 			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 			       __builtin_return_address(0), &vaf);
 	}
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5682ee477677..81cfe6e21d15 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
+#include <trace/events/printk.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -88,6 +89,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINTK, 'p' },
+	{ _DPRINTK_FLAGS_TRACE, 'T' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -770,6 +772,98 @@ static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
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
@@ -784,16 +878,18 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
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
@@ -803,16 +899,18 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
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
@@ -825,6 +923,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 			  const struct net_device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
+	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -834,22 +933,24 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 
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
@@ -865,26 +966,29 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
2.35.3

