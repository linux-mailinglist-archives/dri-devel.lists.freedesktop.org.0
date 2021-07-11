Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11F23C3B1B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 09:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17CA6EB89;
	Sun, 11 Jul 2021 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1066EB8F;
 Sun, 11 Jul 2021 05:50:19 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 62so6142565iob.0;
 Sat, 10 Jul 2021 22:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JU6IkdQvvp5Go0AxPwnfi1zth99vpSVeAzYXXLnyDA=;
 b=jX+yyHpgVqTIhve6qLKx+vddez8pXVVp/zoXrJJ/ZSic9YPuiCLLFG2GJ/joO0L9Po
 GEgjbLkfs6WMeuA2PKTWTR3t/bALkAHtwMEfcPTAeKm3E4M6DfPNgqZv6bL30LxXkAKU
 aPRYDI0K0V9YmdKsd6VPaj25SZIPP5um2ZFwohJMhWPvmDrO8SzsNWR9ifqkUG50ksQ8
 AoYwZ3QbklETQ7Z35OCBQmd788+Ef4kbGouyCALrWsWfAwhwD++48AowJt8/w6mLz2ZG
 lQt+BsWbofwFiR839XGfyVMeiJtJLVz2ozyyEmqoBJgmgAL2IosB4LQUyBZvm1++txjL
 xZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JU6IkdQvvp5Go0AxPwnfi1zth99vpSVeAzYXXLnyDA=;
 b=ZhhwsYg2v780e9K549gSY7yUzDgO2lkwUYsh4wxVDBDSKWvzjhGioEmPbJsvKGx+Ev
 cqzXthUw/efmxW4/O3FG0Vv5Hca9oMoIADIYahqZ4FXNfvHaMyeOzXpLqSP8Zugt6lmt
 4POInYXugWb9C0icBs3GYhmS4RKTZjTKzLw2EIow68N636obOdeLZ9LXft/Evon4ra7P
 bFJ+CCQUpJ+nqnzc7ZQq1rVnbRGH/A77/Kr4Fzx2mL8WtwrAPy4Iq4tgelOS8qaQ0HQy
 1BMe4BuobuBZ3hVhBiOCnAOD9a4XeZ1rGGdb5Xs2GTnU258T9ROWAkRtk4c75MEMBQEt
 8+4g==
X-Gm-Message-State: AOAM530ZxJbc+WckKGn74rMQO9AM6w99XyCl6ChDNiklbGqL7sWiOSx0
 +luH/X2vIS6gOJc5VjXFfsM=
X-Google-Smtp-Source: ABdhPJzHBs42lAveyvzML9lmuADkqzvZAMbBGeS3sw2D9YMkkwV+8J1AY2NDXsE7ZLT7wJlTDJaARw==
X-Received: by 2002:a05:6602:1c4:: with SMTP id
 w4mr34031289iot.44.1625982618817; 
 Sat, 10 Jul 2021 22:50:18 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x8sm5852400ilq.63.2021.07.10.22.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 22:50:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH v2 4/4] i915: map gvt pr_debug categories to bits in
 parameters/debug_gvt
Date: Sat, 10 Jul 2021 23:50:02 -0600
Message-Id: <20210711055003.528167-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711055003.528167-1-jim.cromie@gmail.com>
References: <20210711055003.528167-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jul 2021 07:52:04 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gvt component of this driver has ~120 pr_debugs, in 9 "classes".
Following the interface model of drm.debug, add a parameter to map
bits to these classes.

If CONFIG_DRM_USE_DYNAMIC_DEBUG=y (and CONFIG_DYNAMIC_DEBUG_CORE), add
-DDYNAMIC_DEBUG_MODULE into Makefile.  TBD: maybe add a separate
CONFIG_I915_USE_DYNAMIC_DEBUG to more fully optionalize this.

In i915_params.c, add callback to map bits to queries.

TBD: the callback code should probably be moved to lib/dynamic_debug,
and given a declarative interface, with implied bit-numbering,
something like:

MOD_PARM_BITMAP_DESC(__gvt_debug,
	"gvt: cmd: ",  "command processing"
	"gvt: core: ", "core help",
	"gvt: dpy: ",  "display help",
	"gvt: el: ",   "help",
	"gvt: irq: ",  "help",
	"gvt: mm: ",   "help",
	"gvt: mmio: ", "help",
	"gvt: render: ", "help",
	"gvt: sched: " "help");
---
 drivers/gpu/drm/i915/gvt/Makefile  |  4 ++
 drivers/gpu/drm/i915/i915_params.c | 76 ++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..846ba73b8de6 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -7,3 +7,7 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
+
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+ccflags-y	+= -DDYNAMIC_DEBUG_MODULE
+#endif
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index e07f4cfea63a..e0d13aff5274 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -265,3 +265,79 @@ void i915_params_free(struct i915_params *params)
 	I915_PARAMS_FOR_EACH(FREE);
 #undef FREE
 }
+
+/* POC for callback -> dynamic_debug_exec_queries */
+unsigned long __gvt_debug;
+EXPORT_SYMBOL(__gvt_debug);
+
+static char *format_prefix_classes[] = {
+	"gvt: cmd: ",
+	"gvt: core: ",
+	"gvt: dpy: ",
+	"gvt: el: ",
+	"gvt: irq: ",
+	"gvt: mm: ",
+	"gvt: mmio: ",
+	"gvt: render: ",
+	"gvt: sched: "
+};
+#define NUM_CLASSES	ARRAY_SIZE(format_prefix_classes)
+#define OUR_QUERY_SIZE	128 /* we need about 20 */
+
+#include <linux/module.h>
+
+static int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{
+	unsigned int val;
+	unsigned long changes, result;
+	int rc, chgct = 0, totct = 0, bitpos;
+	char query[OUR_QUERY_SIZE];
+
+	rc = kstrtouint(instr, 0, &val);
+	if (rc) {
+		pr_err("set_dyndbg: failed\n");
+		return -EINVAL;
+	}
+	result = val;
+	pr_info("set_dyndbg: result:0x%lx from %s\n", result, instr);
+
+	changes = result ^ __gvt_debug;
+
+	for_each_set_bit(bitpos, &changes, NUM_CLASSES) {
+
+		sprintf(query, "format '^%s' %cp", format_prefix_classes[bitpos],
+			test_bit(bitpos, &result) ? '+' : '-');
+
+		chgct = dynamic_debug_exec_queries(query, "i915");
+
+		pr_info("%d changes on: %s\n", chgct, query);
+		totct += chgct;
+	}
+	pr_info("total changes: %d\n", totct);
+	__gvt_debug = result;
+	return 0;
+}
+static int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+{
+	return scnprintf(buffer, PAGE_SIZE, "%u\n",
+			 *((unsigned int *)kp->arg));
+}
+static const struct kernel_param_ops param_ops_dyndbg = {
+	.set = param_set_dyndbg,
+	.get = param_get_dyndbg,
+};
+
+#define info_ln(hexi, prefix) "\n\t0x" __stringify(hexi) "\t" prefix
+
+MODULE_PARM_DESC(debug_gvt, " gvt debug categories:"
+		 info_ln(1, "gvt: cmd:")
+		 info_ln(2, "gvt: core:")
+		 info_ln(4, "gvt: dpy:")
+		 info_ln(8, "gvt: el:")
+		 info_ln(10, "gvt: irq:")
+		 info_ln(20, "gvt: mm:")
+		 info_ln(40, "gvt: mmio:")
+		 info_ln(80, "gvt: render:")
+		 info_ln(100, "gvt: sched:"));
+
+module_param_cb(debug_gvt, &param_ops_dyndbg, &__gvt_debug, 0644);
-- 
2.31.1

