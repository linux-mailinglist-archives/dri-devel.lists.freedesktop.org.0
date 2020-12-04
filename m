Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD8E2CE9C6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A78C6EC72;
	Fri,  4 Dec 2020 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63BC6E12C;
 Fri,  4 Dec 2020 03:53:36 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id k8so4022073ilr.4;
 Thu, 03 Dec 2020 19:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULTmDl5ODAp5+pGiMlfRgGgqG7bhEVtrrqJo/V0Wv5o=;
 b=IqWzw/7LhLKatX2EcMZ7gPXa4FX987fJvD2fIX7S33kmZPPX9/QQhdFXd18ExVQsKP
 sW/pxBbVFcILY5G+8C0Hd7JrF91UtzuNPSkxy9+moOonfKdGEv38ehQddV13jPK8qZhS
 5lgBjYtrCsgneZH6Ityt0+U1RYuwDszWp9fQnAf5y1EYCsqnlcy3PHp6yiKYVItjFZc1
 z1/aSSLurV/FbaOfmjYkWwRXL6Mg0jbQ/ow+kszM5s5wHf8YGqfOt8ACPLi+LzM/USzM
 f/rrzkzNiPg2zE2ul+Jwmp2Cfb7HbEMQCOV+sQcBxl9WYyd8o1Y3Ng1IRztDmYk/EqS1
 Ahfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULTmDl5ODAp5+pGiMlfRgGgqG7bhEVtrrqJo/V0Wv5o=;
 b=Lj6NJX2nOP/FyD9birLqMNET9TYtgc3HLOYir7jkxbeV/c5hDbAEKnXO9uFWAROaTC
 54TVuVnTUQY1DvT7mbjdpNBlfW6e/lfPat+rWD5BaN2wyagXYxxkeC7Jt/F8Im6jR75B
 /gC2jOr2QEtc+yA1Ba9rMPcC5oYJGhxpiz+ALVMSFbIctNwzj513Y5UeEwvP5B9WskZk
 d+5abbpjqnCDxqL42mwNt/Vf8DTW3UNuuCA0MMsl5YtvMh7Apxf4nxeU6HAjm/otHSfX
 r1c2fsLxbKg4MdtRN7G2AtUzrJGGoBOoPM8ALxnMTz7TvHyTGaRWkxLXf0jSa0KnCfwX
 JuRw==
X-Gm-Message-State: AOAM533gX7O8jh5JMPjB/ZN27g0SYx0y/N7NS7+FHd0AXrHQB8B2w1gy
 Hg6xbeyMR6xZgYiMKhN83XOg/q6dKdFPPg==
X-Google-Smtp-Source: ABdhPJw/GpPxKvmdLgpe0UZqYix1EOwTWX/EGSHFiJY3r/MukaIIZNjhO1ojAeLgFHMsed0OsIErJA==
X-Received: by 2002:a92:58cb:: with SMTP id z72mr3406498ilf.104.1607054015671; 
 Thu, 03 Dec 2020 19:53:35 -0800 (PST)
Received: from frodo.mearth (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id o12sm671361ilj.55.2020.12.03.19.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 19:53:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] i915: POC use dynamic_debug_exec_queries to control
 pr_debugs in gvt
Date: Thu,  3 Dec 2020 20:53:18 -0700
Message-Id: <20201204035318.332419-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204035318.332419-1-jim.cromie@gmail.com>
References: <20201204035318.332419-1-jim.cromie@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, jbaron@akamai.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gvt component of this driver has ~120 pr_debugs, in 9 "classes".
Following model of drm.debug, add a parameter to map bits to these
classes.

In Makefile, add DYNAMIC_DEBUG_MODULE.  This converts gvt's pr_debugs,
even if the rest of drm is not using CONFIG_DRM_USE_DYNAMIC_DEBUG.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/gvt/Makefile  |  1 +
 drivers/gpu/drm/i915/i915_params.c | 74 ++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..e38a1eb618bd 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -6,4 +6,5 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 	fb_decoder.o dmabuf.o page_track.o
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
+ccflags-y				+= -DDYNAMIC_DEBUG_MODULE
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 7f139ea4a90b..ecc825558e00 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -260,3 +260,77 @@ void i915_params_free(struct i915_params *params)
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
+MODULE_PARM_DESC(debug_gvt, " gvt debug categories:"
+		 "\n\t0x1\t gvt: cmd:"
+		 "\n\t0x2\t gvt: core:"
+		 "\n\t0x4\t gvt: dpy:"
+		 "\n\t0x8\t gvt: el:"
+		 "\n\t0x10\t gvt: irq:"
+		 "\n\t0x20\t gvt: mm:"
+		 "\n\t0x40\t gvt: mmio:"
+		 "\n\t0x80\t gvt: render:"
+		 "\n\t0x100\t gvt: sched:" "\n");
+
+module_param_cb(debug_gvt, &param_ops_dyndbg, &__gvt_debug, 0644);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
