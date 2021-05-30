Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D23955FF
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 09:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0C86E86C;
	Mon, 31 May 2021 07:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF96E303
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 19:21:59 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 e27-20020a056820061bb029020da48eed5cso2295756oow.10
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RhjJ3uOxa28Wx8fXMaiW9Nwea+8yIZB26w1iBcw7X80=;
 b=dI8u97fQOkNiL5Bt+Hh5MLkZ5/qSCzc8MB6vAQorklAWtTJaWM5XFprAJnmRMUewiC
 qwF3VSr4NvT7NupAnHJErsohLb4ZL1PUUOkt3YoWtKmFTCcT4sSrtp8QEzgfWmOT59WW
 Ah91PmL8IRc8MKixTp4hSbd0Ey8g5NC9vRF9zceHm19DxVqPHiRTNFI+iiTF3Srtj1vO
 NejehbUhr+f7iMvFUgGrpKekFrzdqhHorTmkmCXXg2qT3BMHEq3GVV1OpucTCW7Az+A+
 MeEy+kP/CddePnww9BlIYuE/cqt5mTOcV3VKC09YJVuRnsCQBwBzJ3sakRgHZBrtr5uY
 JIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RhjJ3uOxa28Wx8fXMaiW9Nwea+8yIZB26w1iBcw7X80=;
 b=KdyOefQDIEV8fRxgpRdo8BGpR5mDDAwMM3rSJTMSkYsWO4QWOKPph01WcknEjdTHub
 t+qeO1wLop2Pj7C5wpNyoQmJNwKFUpHFObDurDSgpgKJYcVXcPDdW+b7qarDQh/asw/4
 KpkVOVJpM6XX1xe24pst1WjvdNdW0bKmuTSv6NLUxMHwcmk1VxrckjPyia0ay9FUliWu
 DGWHhdO/hvC9nkz/C0VMIF6SG5W2Giv5jo+PVXCxlLNQV5rQE6odCTaKSdcpc1L7XeCh
 9MNLobrmL9aAKl+CDCwrga2eP7HSDPKsRUYzKptKO80VQe0QPo3uYCwcE4lsu2pSkTiD
 TxsQ==
X-Gm-Message-State: AOAM531YykJ7wZF8p0sMKT1PE7leXLUDpPPDBHBxmNkNKCkXDE++WSBZ
 pJ0h6mQp+fburqQW+Z/tcxstO9lcOSUJUg==
X-Google-Smtp-Source: ABdhPJxSz9AnKKUlF1Ry+e3I8lu/QtwcJ0WOjm+h6qdnqDUdm7vfmNu7hQqLR+Y9L17u2iWYVgS8Rw==
X-Received: by 2002:a4a:d650:: with SMTP id y16mr2515460oos.74.1622402518607; 
 Sun, 30 May 2021 12:21:58 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a18sm2418076oiy.24.2021.05.30.12.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 12:21:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/4] i915: map gvt pr_debug categories to bits in
 parameters/debug_gvt
Date: Sun, 30 May 2021 13:21:46 -0600
Message-Id: <20210530192146.393761-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530192146.393761-1-jim.cromie@gmail.com>
References: <20210530192146.393761-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 May 2021 07:23:08 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gvt component of this driver has ~120 pr_debugs, in 9 "classes".
Following model of drm.debug, add a parameter to map bits to these
classes.

In Makefile, add DYNAMIC_DEBUG_MODULE if CONFIG_DRM_USE_DYNAMIC_DEBUG.
In i915_params.c, add callback to map bits to queries.

TBD: consider moving the callback code into lib/dynamic_debug, it
might make for a declarative interface, like an adorned version of:

 +static char *format_prefix_classes[] = {
 +       "gvt: cmd: ",

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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
index 0320878d96b0..13757f1f6b60 100644
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

