Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9E446923
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BB16ECC4;
	Fri,  5 Nov 2021 19:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C256E51D;
 Fri,  5 Nov 2021 19:27:14 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id y17so10507198ilb.9;
 Fri, 05 Nov 2021 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvSGgc/a2zL9qQXqo2hZGZDSnsMhKhweZrahoi+dXGk=;
 b=nIFXvFgJUVI40uQK1j8mkj2wbjIDptPEKgkPghcK+AIlCEVdv7Todg/RgHlsUcWjIp
 9i0cR4D+MV+bsjCH+bVBYYdc3rgwi775FtLGuq5ys3NCQVAofv1vY1uKeKf9Tjn2hdH+
 7vM9+8ysTrDq6DVq+nJhFdUaruHOdNJeI6Q4JRDYqoAmgqKMwBhMVne+JdHff9pI7htS
 Yr9p7r6MYTAK02diellN2E+/bheo/Zsrb+5HMJVwfSko7xgai230Vjd1yue0h2dL5Dd/
 dqfvzZwbT0IWDvWJjSZAg6qU5dJ9FbWlxD/rM4ewXMr2EVg1/6ZlqZWipp9HO6DIuvwY
 0DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvSGgc/a2zL9qQXqo2hZGZDSnsMhKhweZrahoi+dXGk=;
 b=W8UWJ5q7wnforjlb1QA4Xd5MGKesuBcGHLn3+gTCSR7R2bx8F+daRB4+X9FgL89Oow
 PcQLgmAPEO5Yc4YFYSf/eXN4/Plo1lgI5GyXujOYCyA3lur1D8x2w8eMF8MM+gxGrJ+m
 ZglfVfCsc5dhkn7GuvHCY5v63UoOLE8ZDs4yCKkzsLJxiKvlVOgWXAK0NM8MKnwy3MQ1
 vQZHtA/82u3PTAWVNTCzjf2qD5r1fOhOye1lXmxERShvDLIGeRL+gDBu+UuKWOSSqX8+
 sNw75veNpSHhRs08mrgKrQwvSthE9kEsJk22B+ZAul0MEV6JniLQvQCr+wzwwmXVj7Jf
 B04w==
X-Gm-Message-State: AOAM5327TGXK1KSJApN0+wiMSpFqEcpfF7B+9zKLUyCkT4MNvrMlYMZW
 cNpPVHryBbT54kR9gUmWciA=
X-Google-Smtp-Source: ABdhPJw82n8dn11E1uc666ITgKD9Xt+22cxLBspkQCprOBFrquFuP0d16j/jskJ8LuB6jASg1BrJBw==
X-Received: by 2002:a05:6e02:1a81:: with SMTP id
 k1mr29769895ilv.163.1636140433458; 
 Fri, 05 Nov 2021 12:27:13 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 06/10] drm_print: add choice to use dynamic debug in
 drm-debug
Date: Fri,  5 Nov 2021 13:26:33 -0600
Message-Id: <20211105192637.2370737-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105192637.2370737-1-jim.cromie@gmail.com>
References: <20211105192637.2370737-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm's debug system writes 10 distinct categories of messages to syslog
using a small API[1]: drm_dbg*(10 names), DRM_DEV_DEBUG*(3 names),
DRM_DEBUG*(8 names).  There are thousands of these callsites, each
categorized in this systematized way.

These callsites can be enabled at runtime by their category, each
controlled by a bit in drm.debug (/sys/modules/drm/parameter/debug).
In the current "basic" implementation, drm_debug_enabled() tests these
bits in __drm_debug each time an API[1] call is executed; while cheap
individually, the costs accumulate with uptime.

This patch uses dynamic-debug with (required) jump-label to patch
enabled callsites onto their respective NOOP slots, avoiding all
runtime bit-checks of __drm_debug by drm_debug_enabled().

Dynamic debug has no concept of category, but we can emulate one by
replacing enum categories with a set of prefix-strings; "drm:core:",
"drm:kms:" "drm:driver:" etc, and prepend them (at compile time) to
the given formats.

Then we can use:

   # echo module drm format "^drm:core: " +p > control`

to enable the whole category with one query.

This conversion yields many new prdbg callsites:

  dyndbg: 207 debug prints in module drm_kms_helper
  dyndbg: 376 debug prints in module drm
  dyndbg: 1811 debug prints in module i915
  dyndbg: 3917 debug prints in module amdgpu

Each site costs 56 bytes of .data, which is a big increase for
drm modules, so CONFIG_DRM_USE_DYNAMIC_DEBUG makes it optional.

CONFIG_JUMP_LABEL is also required, to get the promised optimizations.

The "basic" -> "dyndbg" switchover is layered into the macro scheme

A. A "prefix" version of DRM_UT_<CATs> map, named DRM_DBG_CAT_<CATs>

"basic":  DRM_DBG_CAT_<CATs>  <===  DRM_UT_<CATs>.  Identity map.
"dyndbg":
   #define DRM_DBG_CAT_KMS    "drm:kms: "
   #define DRM_DBG_CAT_PRIME  "drm:prime: "
   #define DRM_DBG_CAT_ATOMIC "drm:atomic: "

DRM_UT_* are preserved, since theyre used elsewhere.  Since the
callback maintains its state in __drm_debug, drm_debug_enabled() will
stay synchronized, and continue to work.  We can address them
separately if they are called enough to be worth fixing.

B. drm_dev_dbg() & drm_debug() are interposed with macros

basic:	  forward to renamed fn, with args preserved
enabled:  redirect to pr_debug, dev_dbg, with CATEGORY format catenated

This is where drm_debug_enabled() is avoided.  The prefix is prepended
at compile-time, no category at runtime.

C. API[1] uses DRM_DBG_CAT_<CAT>s

The API already uses B, now it uses A too, instead of DRM_UT_<CAT>, to
get the correct token type for "basic" and "dyndbg" configs.

D. use DEFINE_DYNAMIC_DEBUG_CATEGORIES()

This defines the map using DRM_CAT_<CAT>s, and creates the /sysfs
bitmap to control those categories.

CONFIG_DRM_USE_DYNAMIC_DEBUG is also used to adjust amdgpu, i915
makefiles to add -DDYNAMIC_DEBUG_MODULE; it includes the current
CONFIG_DYNAMIC_DEBUG_CORE and is enabled by the user.

LIMITATIONS:

dev_dbg(etal) effectively prepends twice, category then driver-name,
yielding format strings like so:

bash-5.1# grep amdgpu: /proc/dynamic_debug/control | grep drm: | cut -d= -f2-
_ "amdgpu: drm:core: fence driver on ring %s use gpu addr 0x%016llx\012"
_ "amdgpu: drm:kms: Cannot create framebuffer from imported dma_buf\012"

This means we cannot use anchored "^drm:kms: " to specify the
category, a small loss of precision.

Note that searching on "format ^amdgpu: " works, but this is less
valuable, because the same can be done with "module amdgpu".

NOTES:

Because the dyndbg callback is keeping state in __drm_debug, it
synchronizes with drm_debug_enabled() and its remaining users; the
switchover should be transparent.

Code Review is expected to catch the lack of correspondence between
bit=>prefix definitions (the selector) and the prefixes used in the
API[1] layer above pr_debug()

I've coded the categories with trailing spaces.  This excludes any
sub-categories which might get added later.  This convention protects
any "drm:atomic:fail:" callsites from getting stomped on by `echo 0 >
debug`.  Other categories could differ, but we need some default.

Dyndbg requires that the prefix be in the compiled-in format string;
run-time prefixing evades callsite selection by category.

	pr_debug("%s: ...", __func__, ...) // not ideal

Unfortunately __func__ is not a macro, and cannot be catenated at
preprocess/compile time.

If you want that, you might consider +mfl flags instead;)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5:
. use DEFINE_DYNAMIC_DEBUG_CATEGORIES in drm_print.c
. s/DRM_DBG_CLASS_/DRM_DBG_CAT_/ - dont need another term
. default=y in Kconfig entry - per @DanVet
. move some commit-log prose to dyndbg commit
. add-prototyes to (param_get/set)_dyndbg
. more wrinkles found by <lkp@intel.com>
. relocate ratelimit chunk from elsewhere
v6:
. add kernel doc
. fix cpp paste, drop '#'
v7:
. change __drm_debug to long, to fit with DEFINE_DYNAMIC_DEBUG_CATEGORIES
. add -DDYNAMIC_DEBUG_MODULE to ccflags if DRM_USE_DYNAMIC_DEBUG
v8:
. adapt to altered ^ insertion
. add mem cost numbers to kconfig
. kdoc improvements (I hope)
---
 drivers/gpu/drm/Kconfig             |  26 +++++
 drivers/gpu/drm/Makefile            |   2 +
 drivers/gpu/drm/amd/amdgpu/Makefile |   2 +-
 drivers/gpu/drm/drm_print.c         |  55 ++++++---
 drivers/gpu/drm/i915/Makefile       |   2 +-
 include/drm/drm_print.h             | 175 ++++++++++++++++++++++------
 6 files changed, 210 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2a926d0de423..6223d853907d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -62,6 +62,32 @@ config DRM_DEBUG_MM
 
 	  If in doubt, say "N".
 
+config DRM_USE_DYNAMIC_DEBUG
+	bool "use dynamic debug to implement drm.debug"
+	default y
+	depends on DRM
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on JUMP_LABEL
+	help
+	  The "basic" drm.debug facility does a lot of unlikely
+	  bit-field tests at runtime; while cheap individually, the
+	  cost accumulates.  DYNAMIC_DEBUG can patch pr_debug()s into
+	  NOOP slots, in a running kernel, so avoids those bit-test
+	  overheads, and is therefore recommended by default.
+
+	  DRM_USE_DYNAMIC_DEBUG converts "basic" to "dyndbg", this
+	  creates many new dyndbg callsites (56 bytes each), which
+	  significantly increases drm* module .data, so is optional.
+	  On an x86-64 kernel, with a config derived from fedora, that
+	  price is:
+		       #prdbgs  KiB     #with DRM_USE_DYNAMIC_DEBUG=y
+	  kernel       3079	166k
+	  drm		  1	.06k     376	 21k
+	  drm_kms_helper		 207	 12k
+	  i915	        167	9.3k	1811	101k
+	  amdgpu       2339	130k	3917	220k
+	  nouveau      	  3	.17k	 105	~60k
+
 config DRM_DEBUG_SELFTEST
 	tristate "kselftests for DRM"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0dff40bb863c..786d3256a163 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -33,6 +33,8 @@ drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 077342ca803f..d840319d29a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -38,7 +38,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
 	-I$(FULL_AMD_PATH)/amdkfd
 
-ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += -DYNAMIC_DEBUG_MODULE
 
 amdgpu-y := amdgpu_drv.o
 
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index f783d4963d4b..d5e0ffad467b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -28,9 +28,11 @@
 #include <linux/stdarg.h>
 
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 #include <drm/drm_drv.h>
@@ -40,19 +42,40 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned int __drm_debug;
+unsigned long __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
-MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
-"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
-"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
-"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
-"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
-"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
-"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
-"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
-"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
-module_param_named(debug, __drm_debug, int, 0600);
+#define DRM_DEBUG_DESC \
+"Enable debug output, where each bit enables a debug category.\n"	\
+"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"		\
+"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"	\
+"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"	\
+"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"		\
+"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"		\
+"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"		\
+"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"		\
+"\t\tBit 8 (0x100) will enable DP messages (displayport code)."
+
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+MODULE_PARM_DESC(debug, DRM_DEBUG_DESC);
+module_param_named(debug, __drm_debug, ulong, 0600);
+#else
+static struct dyndbg_bitdesc drm_dyndbg_bitmap[] = {
+	[0] = { DRM_DBG_CAT_CORE },
+	[1] = { DRM_DBG_CAT_DRIVER },
+	[2] = { DRM_DBG_CAT_KMS },
+	[3] = { DRM_DBG_CAT_PRIME },
+	[4] = { DRM_DBG_CAT_ATOMIC },
+	[5] = { DRM_DBG_CAT_VBL },
+	[6] = { DRM_DBG_CAT_STATE },
+	[7] = { DRM_DBG_CAT_LEASE },
+	[8] = { DRM_DBG_CAT_DP },
+	[9] = { DRM_DBG_CAT_DRMRES }
+};
+DEFINE_DYNAMIC_DEBUG_BITGRPS(debug, __drm_debug, DRM_DEBUG_DESC,
+			     drm_dyndbg_bitmap);
+
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
@@ -256,8 +279,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -278,9 +301,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -297,7 +320,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 
 	va_end(args);
 }
-EXPORT_SYMBOL(__drm_dbg);
+EXPORT_SYMBOL(___drm_dbg);
 
 void __drm_err(const char *format, ...)
 {
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 0fa5f53312a8..9801ac245b5d 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -317,7 +317,7 @@ i915-y += intel_gvt.o
 include $(src)/gvt/Makefile
 endif
 
-ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..392cff7cb95c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -35,7 +35,7 @@
 #include <drm/drm.h>
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned int __drm_debug;
+extern unsigned long __drm_debug;
 
 /**
  * DOC: print
@@ -252,15 +252,15 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
 /**
  * enum drm_debug_category - The DRM debug categories
  *
- * Each of the DRM debug logging macros use a specific category, and the logging
- * is filtered by the drm.debug module parameter. This enum specifies the values
- * for the interface.
+ * The drm.debug logging API[1] has 10 enumerated categories of
+ * messages, issued by 3 families of macros: 10 drm_dbg_<CATs>, 8
+ * DRM_DEBUG_<CATs>, and 3 DRM_DEV_DEBUG_<CATs>.
  *
  * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
  * DRM_DEBUG() logs to DRM_UT_CORE.
  *
- * Enabling verbose debug messages is done through the drm.debug parameter, each
- * category being enabled by a bit:
+ * Enabling categories of debug messages is done through the drm.debug
+ * parameter, each category being enabled by a bit:
  *
  *  - drm.debug=0x1 will enable CORE messages
  *  - drm.debug=0x2 will enable DRIVER messages
@@ -268,8 +268,8 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *  - ...
  *  - drm.debug=0x1ff will enable all messages
  *
- * An interesting feature is that it's possible to enable verbose logging at
- * run-time by echoing the debug value in its sysfs node::
+ * It's possible to enable drm.debug logging at run-time by echoing
+ * the debug value in its sysfs node::
  *
  *   # echo 0xf > /sys/module/drm/parameters/debug
  *
@@ -319,6 +319,103 @@ enum drm_debug_category {
 	DRM_UT_DRMRES		= 0x200,
 };
 
+/**
+ * DOC: CONFIG_DRM_USE_DYNAMIC_DEBUG - using dyndbg in drm.debug
+ *
+ * In the "basic" drm.debug implementation outlined above, each time a
+ * drm-debug API[1] call is executed, drm_debug_enabled(cat) tests
+ * __drm_debug vs cat before printing.
+ *
+ * DYNAMIC_DEBUG (aka: dyndbg) patches pr_debug()s in^out of the
+ * running kernel, so it can avoid drm_debug_enabled() and skip lots
+ * of unlikely bit tests.
+ *
+ * dyndbg has no concept of category, but we can prepend a
+ * class-prefix string: "drm:core: ", "drm:kms: ", "drm:driver: " etc,
+ * to pr_debug's format (at compile time).
+ *
+ * Then control the category::
+ *
+ *    # echo module drm format "^drm:core: " +p > control
+ *    c: dynamic_debug_exec_queries("format '^drm:core: ' +p", "drm");
+ *
+ * To do this for "basic" | "dyndbg", adaptation adds some macro indirection:
+ *
+ * 0. use dyndbg support to define the bits => prefixes map, and creates sysfs node
+ *
+ *    DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,
+ *			 "drm.debug - overview",
+ *			 { [0] = "drm:core: " },
+ *			 { [1] = "drm:kms: " }, ...);
+ *
+ * 1. DRM_DBG_CAT_<CAT>
+ *
+ * This set of symbols replaces DRM_UT_<CAT> inside the drm-debug API;
+ * for "basic" it is a copy of DRM_UT_<CAT>, otherwise they are the set
+ * of class prefix strings used in pr_debugs (either directly or by
+ * macro wrappers).
+ *
+ * 2. drm_dev_dbg & drm_debug are called by drm.debug API
+ *
+ * These are now macros, either forwarding to renamed functions, or
+ * prepending the class string to the format, and invoking pr_debug
+ * directly.  Since the API is all macros, dyndbg's pr_debug sees the
+ * actual (broad population of) callsites, and they're all
+ * individually controllable.
+ */
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+
+#define __drm_dbg(cls, fmt, ...)			\
+	___drm_dbg(cls, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, cls, fmt, ...)			\
+	__drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
+
+#define DRM_DBG_CAT_CORE	DRM_UT_CORE
+#define DRM_DBG_CAT_DRIVER	DRM_UT_DRIVER
+#define DRM_DBG_CAT_KMS		DRM_UT_KMS
+#define DRM_DBG_CAT_PRIME	DRM_UT_PRIME
+#define DRM_DBG_CAT_ATOMIC	DRM_UT_ATOMIC
+#define DRM_DBG_CAT_VBL		DRM_UT_VBL
+#define DRM_DBG_CAT_STATE	DRM_UT_STATE
+#define DRM_DBG_CAT_LEASE	DRM_UT_LEASE
+#define DRM_DBG_CAT_DP		DRM_UT_DP
+#define DRM_DBG_CAT_DRMRES	DRM_UT_DRMRES
+
+#else /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
+
+/* join prefix + format in cpp so dyndbg can see it */
+#define __drm_dbg(pfx, fmt, ...)		\
+	pr_debug(pfx fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, pfx, fmt, ...)		\
+	dev_dbg(dev, pfx fmt, ##__VA_ARGS__)
+
+/**
+ * enum-ish DRM_DBG_CAT_<categories>::
+ *
+ * - DRM_DBG_CAT_CORE	"drm:core: "
+ * - DRM_DBG_CAT_DRIVER	"drm:drvr: "
+ * - DRM_DBG_CAT_KMS	"drm:kms: "
+ * - DRM_DBG_CAT_PRIME	"drm:prime: "
+ * - DRM_DBG_CAT_ATOMIC	"drm:atomic: "
+ * - DRM_DBG_CAT_VBL	"drm:vbl: "
+ * - DRM_DBG_CAT_STATE	"drm:state: "
+ * - DRM_DBG_CAT_LEASE	"drm:lease: "
+ * - DRM_DBG_CAT_DP	"drm:dp: "
+ * - DRM_DBG_CAT_DRMRES	"drm:res: "
+ */
+#define DRM_DBG_CAT_CORE	"drm:core: "
+#define DRM_DBG_CAT_DRIVER	"drm:drvr: "
+#define DRM_DBG_CAT_KMS		"drm:kms: "
+#define DRM_DBG_CAT_PRIME	"drm:prime: "
+#define DRM_DBG_CAT_ATOMIC	"drm:atomic: "
+#define DRM_DBG_CAT_VBL		"drm:vbl: "
+#define DRM_DBG_CAT_STATE	"drm:state: "
+#define DRM_DBG_CAT_LEASE	"drm:lease: "
+#define DRM_DBG_CAT_DP		"drm:dp: "
+#define DRM_DBG_CAT_DRMRES	"drm:res: "
+
+#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
+
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & category);
@@ -334,8 +431,8 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -383,6 +480,16 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
+/**
+ * DRM debug API - library of macros to issue categorized syslog messages
+ *
+ * multiple flavors::
+ * - DRM_DEV_DEBUG<,_DRIVER,_KMS>
+ * - drm_dbg_<core,kms,prime,atomic,vbl,state,lease,dp,drmres>	(prefer these)
+ * - DRM_DEBUG<,_DRIVER,_KMS,_PRIME,_ATOMIC,_VBL,_LEASE,_DP>	(over these)
+ * - DRM_DEBUG_KMS_RATELIMITED
+ */
+
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
@@ -392,7 +499,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
-	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
 /**
  * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
  *
@@ -402,7 +509,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
 /**
  * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
  *
@@ -412,7 +519,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
 
 /*
  * struct drm_device based logging
@@ -454,27 +561,26 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_err_ratelimited(drm, fmt, ...)				\
 	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
 
-
 #define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
 #define drm_dbg(drm, fmt, ...)						\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRMRES, fmt, ##__VA_ARGS__)
 
 
 /*
@@ -484,7 +590,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  */
 
 __printf(2, 3)
-void __drm_dbg(enum drm_debug_category category, const char *format, ...);
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
@@ -523,35 +629,35 @@ void __drm_err(const char *format, ...);
 
 /* NOTE: this is deprecated in favor of drm_dbg_core(NULL, ...). */
 #define DRM_DEBUG(fmt, ...)						\
-	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
 #define DRM_DEBUG_DRIVER(fmt, ...)					\
-	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg_kms(NULL, ...). */
 #define DRM_DEBUG_KMS(fmt, ...)						\
-	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg_prime(NULL, ...). */
 #define DRM_DEBUG_PRIME(fmt, ...)					\
-	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_PRIME, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg_atomic(NULL, ...). */
 #define DRM_DEBUG_ATOMIC(fmt, ...)					\
-	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_ATOMIC, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg_vbl(NULL, ...). */
 #define DRM_DEBUG_VBL(fmt, ...)						\
-	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_VBL, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg_lease(NULL, ...). */
 #define DRM_DEBUG_LEASE(fmt, ...)					\
-	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_LEASE, fmt, ##__VA_ARGS__)
 
 /* NOTE: this is deprecated in favor of drm_dbg_dp(NULL, ...). */
 #define DRM_DEBUG_DP(fmt, ...)						\
-	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
+	__drm_dbg(DRM_DBG_CAT_DP, fmt, ## __VA_ARGS__)
 
 #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
 ({												\
@@ -559,7 +665,8 @@ void __drm_err(const char *format, ...);
 	const struct drm_device *drm_ = (drm);							\
 												\
 	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
+		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,					\
+			    DRM_DBG_CAT_ ## category, fmt, ##__VA_ARGS__);			\
 })
 
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
-- 
2.31.1

