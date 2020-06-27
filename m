Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7A20BF2D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 09:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2A6E53C;
	Sat, 27 Jun 2020 07:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB2F6E542
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 07:03:57 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f2so5117749plr.8
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 00:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGdLcrAvmkPIKoBWNvP5dEwpw2VzB6ZsodUaJtAc268=;
 b=Zn9TKw226u2aXcveeQJo/6qpreREm/sGylWxm517psg7XF3rhiVwVoOx4GGf81IF6K
 02bnu6Ug6Yef/NSdnI0j7TiUy+4P2Y9azEev4dgE90ePiTN4KDha4DcvvRKkyj4CCKWF
 eA4pcyWPPy3mJD+efzBV99Tr0VTZbPa5N6tbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGdLcrAvmkPIKoBWNvP5dEwpw2VzB6ZsodUaJtAc268=;
 b=i7m/myxZLjRDM31kICHBcHIYz8PZDyiU08Mf+l82rj6dGduVZ2Hn3SCY0yvav4MyvT
 OIzPlEyuKsVWOUWxCQochQfow9GLfk02k7ajDXqEr925WQjKKo2XrKvPMPGv5XPBD2Dh
 fMqFgrAo3OQCPjkYCSVPNYq8gE9fn7AYFlv69vGUwMJe5WW2GPYlrsOvHfFXJHdJ6Qz6
 I5P5s/oWfN/e+XAPio83w3M0mEJChCLzLW09BD/vGUOVELor1n7OuXSY2zhO+BP20+gL
 6LrGXnYbhLpietQzltv06IctkDpV9PnLfEcFMQ+5LOoAxeAJeDRQER27jn02aPGMCMNW
 Gw+g==
X-Gm-Message-State: AOAM5322eCJ0YH3luHqoNiVG68Ao8xkv82/04dPmSaeTLKdaqYYC0lZW
 +lQMdHfVvKaxSmZ7oix7oS+WUQ==
X-Google-Smtp-Source: ABdhPJyrPO8mMivZ9WdRk9xUe9m8FFceT04ent9x0NWwUKTZQRxEsVK15EeSeQRHuWdJSKitwza3qg==
X-Received: by 2002:a17:902:fe90:: with SMTP id
 x16mr4430374plm.307.1593241436775; 
 Sat, 27 Jun 2020 00:03:56 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u4sm28133269pfl.102.2020.06.27.00.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 00:03:55 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] kernel/trace: Add TRACING_ALLOW_PRINTK config option
Date: Sat, 27 Jun 2020 15:03:07 +0800
Message-Id: <20200627070307.516803-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200627070307.516803-1-drinkcat@chromium.org>
References: <20200627070307.516803-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: Peter Chen <peter.chen@nxp.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 Rafael Aquini <aquini@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicolas Boichat <drinkcat@chromium.org>, Jayshri Pawar <jpawar@cadence.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gross <agross@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Chao Yu <chao@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

trace_printk is meant as a debugging tool, and should not be
compiled into production code without specific debug Kconfig
options enabled, or source code changes, as indicated by the
warning that shows up on boot if any trace_printk is called:
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **                                                      **
 ** trace_printk() being used. Allocating extra memory.  **
 **                                                      **
 ** This means that this is a DEBUG kernel and it is     **
 ** unsafe for production use.                           **

If this option is set to n, the kernel will generate a
build-time error if trace_printk is used.

Note that the code to handle trace_printk is still present,
so this does not prevent people from compiling out-of-tree
kernel modules with the option set to =y, or BPF programs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

Changes since v1:
 - Use static_assert instead of __static_assert (Jason Gunthorpe)
 - Fix issues that can be detected by this patch (running some
   randconfig in a loop, kernel test robot, or manual inspection),
   by:
   - Making some debug config options that use trace_printk depend
     on the new config option.
   - Adding 3 patches before this one.

There is a question from Alexei whether the warning is warranted,
and it's possibly too strongly worded, but the fact is, we do
not want trace_printk to be sprinkled in kernel code by default,
unless a very specific Kconfig command is enabled (or preprocessor
macro).

There's at least 3 reasons that I can come up with:
 1. trace_printk introduces some overhead.
 2. If the kernel keeps adding always-enabled trace_printk, it will
    be much harder for developers to make use of trace_printk for
    debugging.
 3. People may assume that trace_printk is for debugging only, and
    may accidentally output sensitive data (theoritical at this
    stage).

 drivers/gpu/drm/i915/Kconfig.debug |  4 ++--
 fs/f2fs/Kconfig                    |  1 +
 include/linux/kernel.h             | 17 ++++++++++++++++-
 kernel/trace/Kconfig               | 10 ++++++++++
 samples/Kconfig                    |  2 ++
 5 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 1cb28c20807c59d..fa30f9bdc82311f 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -84,7 +84,7 @@ config DRM_I915_ERRLOG_GEM
 config DRM_I915_TRACE_GEM
 	bool "Insert extra ftrace output from the GEM internals"
 	depends on DRM_I915_DEBUG_GEM
-	select TRACING
+	depends on TRACING_ALLOW_PRINTK
 	default n
 	help
 	  Enable additional and verbose debugging output that will spam
@@ -98,7 +98,7 @@ config DRM_I915_TRACE_GEM
 config DRM_I915_TRACE_GTT
 	bool "Insert extra ftrace output from the GTT internals"
 	depends on DRM_I915_DEBUG_GEM
-	select TRACING
+	depends on TRACING_ALLOW_PRINTK
 	default n
 	help
 	  Enable additional and verbose debugging output that will spam
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index d13c5c6a978769b..d161d96cc1b7418 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -80,6 +80,7 @@ config F2FS_IO_TRACE
 	bool "F2FS IO tracer"
 	depends on F2FS_FS
 	depends on FUNCTION_TRACER
+	depends on TRACING_ALLOW_PRINTK
 	help
 	  F2FS IO trace is based on a function trace, which gathers process
 	  information and block IO patterns in the filesystem level.
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 196607aaf653082..8abce95b0c95a0e 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -721,10 +721,15 @@ do {									\
 #define trace_printk(fmt, ...)				\
 do {							\
 	char _______STR[] = __stringify((__VA_ARGS__));	\
+							\
+	static_assert(					\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),\
+		"trace_printk called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
+							\
 	if (sizeof(_______STR) > 3)			\
 		do_trace_printk(fmt, ##__VA_ARGS__);	\
 	else						\
-		trace_puts(fmt);			\
+		do_trace_puts(fmt);			\
 } while (0)
 
 #define do_trace_printk(fmt, args...)					\
@@ -773,6 +778,13 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
  */
 
 #define trace_puts(str) ({						\
+	static_assert(							\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),		\
+		"trace_puts called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
+	do_trace_puts(str);						\
+})
+
+#define do_trace_puts(str) ({						\
 	static const char *trace_printk_fmt __used			\
 		__attribute__((section("__trace_printk_fmt"))) =	\
 		__builtin_constant_p(str) ? str : NULL;			\
@@ -794,6 +806,9 @@ extern void trace_dump_stack(int skip);
  */
 #define ftrace_vprintk(fmt, vargs)					\
 do {									\
+	static_assert(							\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),		\
+		"ftrace_vprintk called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt __used		\
 		  __attribute__((section("__trace_printk_fmt"))) =	\
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0b4508c99..971b6035b197823 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -111,6 +111,15 @@ config GENERIC_TRACER
 	bool
 	select TRACING
 
+config TRACING_ALLOW_PRINTK
+	bool "Allow trace_printk"
+	default y if DEBUG_KERNEL
+	depends on TRACING
+	help
+	  trace_printk is only meant as a debugging tool. If this option is
+	  set to n, the kernel will generate a build-time error if trace_printk
+	  is used.
+
 #
 # Minimum requirements an architecture has to meet for us to
 # be able to offer generic tracing facilities:
@@ -686,6 +695,7 @@ config TRACEPOINT_BENCHMARK
 config RING_BUFFER_BENCHMARK
 	tristate "Ring buffer benchmark stress tester"
 	depends on RING_BUFFER
+	depends on TRACING_ALLOW_PRINTK
 	help
 	  This option creates a test to stress the ring buffer and benchmark it.
 	  It creates its own ring buffer such that it will not interfere with
diff --git a/samples/Kconfig b/samples/Kconfig
index 0ed6e4d71d87b16..6b1ade57f00dd5d 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -19,6 +19,7 @@ config SAMPLE_TRACE_EVENTS
 config SAMPLE_TRACE_PRINTK
         tristate "Build trace_printk module - tests various trace_printk formats"
 	depends on EVENT_TRACING && m
+	depends on TRACING_ALLOW_PRINTK
 	help
 	 This builds a module that calls trace_printk() and can be used to
 	 test various trace_printk() calls from a module.
@@ -26,6 +27,7 @@ config SAMPLE_TRACE_PRINTK
 config SAMPLE_FTRACE_DIRECT
 	tristate "Build register_ftrace_direct() example"
 	depends on DYNAMIC_FTRACE_WITH_DIRECT_CALLS && m
+	depends on TRACING_ALLOW_PRINTK
 	depends on X86_64 # has x86_64 inlined asm
 	help
 	  This builds an ftrace direct function example
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
