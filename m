Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC70253E4E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B476EB34;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161F96E226
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:00:51 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z17so2859945ioi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TT/nPbomDmh8NQShHOC8FZBWwCU19NUKn3EZB0b0q/I=;
 b=Fce5lMZPmSr/R6QTYB7eE6nL3eFrkLLX7rJdVbaoCg7NYYWUOFtn4jZPNhguFFE0Ww
 h0t8AECaIll/C9E6AEcxUoJ5le0j7fFyRKNONqAaRXBJnN0KLBLAQ6tGEt4vlttY7Irt
 8ykSWtiAR+VTO+UpMmiH+94GgFSa8xkKNW414kXDcTWCcgUp7wHg+/0FAlbiTnFGQZRd
 yWEHyK34HqJ8LhWzwexYM1kssLa7LBk/nCIcve+q3U4MBqz1RGTdHqBlk9an4wtlFMBy
 jpM0KSbhTeS7lR3i9cIExK0K18jOaaBOZs9YPIGbC5Upj3gY2ddewNA8VEyQ0cNBtdjx
 InCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TT/nPbomDmh8NQShHOC8FZBWwCU19NUKn3EZB0b0q/I=;
 b=Yw7VbFJDHV9G5h5p3fsJKw3MeHwkjL60wUmGuAr2JVFOjedAsm9lDU7uCOmX0lo4w/
 F2cXvnDN1wFgZyKyoWCwLHXOQgKslS7nvR965RxLJ8uZYLVxyHcYisSZJnfYIhh1RD/I
 7uWL16X+BlPqbK6aftScth7aCxoG088dFODki1buPBt9E8IYHwvXfm5mRxeZ2dHp5xf6
 yVyv7LFKWJTJTuVYZQ1+fJK7smHrOmjQJnVBc8P9r0eOLYbIJ+As9MZMpTYYm+9c+ET9
 +TPdoS2aCdF+g1bupQ+KISdcl0fEx6/beHcSLWrFEcPETF1esOOlBIhTnpWveI/tUKsT
 yzpg==
X-Gm-Message-State: AOAM532AO5xOEHJ8quE0NBZViMg80LoQsbPqOHd9/UpzcsZZTVz+Trqq
 IamfDtofOVE2BIJamOkLTVU=
X-Google-Smtp-Source: ABdhPJxy5A5rKdHB0JGFzyPbJaQvXJ1YHzMRzjOYm2I0ca1HWwoG3rk1JxilvNBEZOnEKffrPVxEDw==
X-Received: by 2002:a6b:7411:: with SMTP id s17mr10699072iog.192.1598461250478; 
 Wed, 26 Aug 2020 10:00:50 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8203:5970::c4c])
 by smtp.googlemail.com with ESMTPSA id p78sm1479606iod.0.2020.08.26.10.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:00:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jbaron@akamai.com
Subject: [PATCH 1/4] drm-printk: POC caller of dynamic-debug-exec-queries
Date: Wed, 26 Aug 2020 11:00:38 -0600
Message-Id: <20200826170041.2497546-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826170041.2497546-1-jim.cromie@gmail.com>
References: <20200826170041.2497546-1-jim.cromie@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jim Cromie <jim.cromie@gmail.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export of dynamic-debug-exec-queries exists for users like drm.

This commit is a 1st user-test; it adds a 2nd knob, __drm_debug2,
similar in function to __drm_debug.  module_param_cb wires it to a
callback which maps the input value to one of: "module=drm* +/-p".

The include is needed to see the exported function prototype.

Notes:

The define DEBUG at top of drm-printk enables all pr_debug()s,
independent of CONFIG_DYNAMIC_DEBUG_CORE.

drm-printk is an independent print control system using __drm_debug
bits.  The plan is to find the low-level macros in which to insert a
pr_debug call, their eventual callsites will have distinct METADATA,
so will be itemized in control, and individually selectable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 111b932cf2a9..52abaf2ae053 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -27,6 +27,7 @@
 
 #include <stdarg.h>
 
+#include <linux/dynamic_debug.h>
 #include <linux/io.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
@@ -54,6 +55,40 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
 module_param_named(debug, __drm_debug, int, 0600);
 
+/* POC for callback -> ddebug_exec_queries */
+unsigned int __drm_debug2;
+EXPORT_SYMBOL(__drm_debug2);
+
+static int param_set_dyndbg(const char *val, const struct kernel_param *kp)
+{
+	int chgct, result;
+
+	result = kstrtouint(val, 0, (unsigned int *)kp->arg);
+	pr_warn("set_dyndbg: result:%d from %s\n", result, val);
+
+	if (result)
+		chgct = dynamic_debug_exec_queries("module=drm* +p", NULL);
+	else
+		chgct = dynamic_debug_exec_queries("module=drm* -p", NULL);
+
+	pr_warn("change ct:%d\n", chgct);
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
+MODULE_PARM_DESC(debug_dyn, "Enable debug output, where each bit enables a debug category.\n"
+		 "\t\tthese wont work yet\n");
+module_param_cb(debug_dyn, &param_ops_dyndbg, &__drm_debug2, 0644);
+
+
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
 	struct drm_print_iterator *iterator = p->arg;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
