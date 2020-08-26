Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330E253E59
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57B66EB38;
	Thu, 27 Aug 2020 06:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037176E226
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:00:54 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id g13so2846334ioo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1oMOfwKEWmeEjN59H8V2mAsUSePsbdq0+d1rTYV7cF4=;
 b=KJPDjh/CsHrR6htvj8qR1P2z1AP7kbrQj+KgZDUBR0k0fiXnMtd4xcisqf+NCVtUJa
 5WvbWO8VmZBIH5lnToxyIG2ucMnzMZaFPYUULUWnFEMUeFkfSEgSZej8eirrQCNRc8fA
 5iB4aR78TvM4rU5PyJBkp+d9UnBfkjWT+WR01pGGzlAYKUciTKI9Hah3ONMJSuz/892u
 JfFr26tO4jzqG9wLaxUVSjKCXqNdGqHcvjBisRNa6qhjpu7g6ZRE9s0fodG6rRP4Gy4o
 5duMgFwrJLBZtNEOHuCyrNO8QQbRiOoFqGixd9T9wB9TP9a8PcSlNLIn/uaWgpAnSunE
 a9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1oMOfwKEWmeEjN59H8V2mAsUSePsbdq0+d1rTYV7cF4=;
 b=LgJrpF6kJZGaOiBAk3nN2xwFITksFyHgoFvTK9RMxH+0C10kEJxVSbgWRWcS6Efyhq
 1aBCQpeF8WSnH33txNUjpsWYcpP4gx63eyK6r28BhPngIMUV6YHvrUAu5zQa5uu2XrYx
 IzCRheXRHqSoyjJKaXUgMtxAChpDQ6U+T/1yt87N8iw8jvlX3iedg3BvleKC1lrsbprF
 UQLJUQcodOfqZarYHiQn1XP8DTWqMPzAYn7MRWSCqzV4B85FY+KNTTxKxHQLUDEskply
 5wWTvct8N/B2v/NIXGzFd+so4a8g5hbUah8oNj0mGDXw3q7k6rCIbCc3i12Evw60P/Dh
 Pr9g==
X-Gm-Message-State: AOAM5319kJ8GN28aWS4Da+/Y5WagU8MdUQKD+s3uln6UN+qUsl4XPLj2
 l1YVMojij4o/PLmNVZeNOrM=
X-Google-Smtp-Source: ABdhPJzx+6JA1HW/akyHMxAsm/O6krv6/v8LwlcppdbYy47niZhoGtCRaXULzeNoN8h2OHZ9wmxWMA==
X-Received: by 2002:a02:c919:: with SMTP id t25mr16243562jao.38.1598461253305; 
 Wed, 26 Aug 2020 10:00:53 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8203:5970::c4c])
 by smtp.googlemail.com with ESMTPSA id p78sm1479606iod.0.2020.08.26.10.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:00:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jbaron@akamai.com
Subject: [PATCH 2/4] drm-printk: call pr_debug() from drm_dev_dbg, __drm_dbg
Date: Wed, 26 Aug 2020 11:00:39 -0600
Message-Id: <20200826170041.2497546-3-jim.cromie@gmail.com>
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

Put the pr_debug() after the vaf setup work, so as to use it.  And
move the if-category-disabled-return after both, so the pr_debug()
runs unconditionally.

This lets both debug-printers execute independently, according to
their respective controls, allowing later comparison to each other.

 #> echo module=drm +pmftl > /proc/dynamic_debug/control
yields logging like:

 [1772] drm:drm_dev_dbg:305: i915 0000:00:02.0: [drm:intel_atomic_get_global_obj_state [i915]]
   Cat:16 Added new global object 000000006fa51dd6 state 00000000bbddcf9d to 000000005f6e1bc3
 [1772] drm:drm_dev_dbg:305: i915 0000:00:02.0: [drm:intel_atomic_get_global_obj_state [i915]]
   Cat:16 Added new global object 000000002a5e020a state 000000002b3685ed to 000000005f6e1bc3
 [198] drm:drm_dev_dbg:305: i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
   Cat:32 updating vblank count on crtc 0: current=260920, diff=0, hw=192024 hw_last=192024
 [1772] drm:__drm_dbg:331: [drm:drm_atomic_nonblocking_commit [drm]] Cat:16 committing 000000005f6e1bc3 nonblocking
 [1772] drm:__drm_dbg:331: [drm:drm_mode_object_put.part.0 [drm]] Cat:1 OBJ ID: 113 (4)
 [1772] drm:__drm_dbg:331: [drm:drm_ioctl [drm]] Cat:1 comm="gnome-shell" pid=1772, dev=0xe200, auth=1, I915_GEM_CREATE
 [1772] drm:__drm_dbg:331: [drm:drm_ioctl [drm]] Cat:1 comm="gnome-shell" pid=1772, dev=0xe200, auth=1, I915_GEM_SET_DOMAIN
 [1772] drm:__drm_dbg:331: [drm:drm_ioctl [drm]] Cat:1 comm="gnome-shell" pid=1772, dev=0xe200, auth=1, I915_GEM_SET_TILING
 [1772] drm:__drm_dbg:331: [drm:drm_ioctl [drm]] Cat:1 comm="gnome-shell" pid=1772, dev=0xe200, auth=1, I915_GEM_MMAP_OFFSET

Clearly, the mflt flags arent very helpful here, and callsite control
is all or nothing (since theres only 2 callsites handling all the
categories).  We are 1 below the function layer of interest, but
theres room for optimism.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 52abaf2ae053..fa2bcf4ec475 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -27,6 +27,7 @@
 
 #include <stdarg.h>
 
+#define DYNAMIC_DEBUG_MODULE
 #include <linux/dynamic_debug.h>
 #include <linux/io.h>
 #include <linux/moduleparam.h>
@@ -61,17 +62,17 @@ EXPORT_SYMBOL(__drm_debug2);
 
 static int param_set_dyndbg(const char *val, const struct kernel_param *kp)
 {
-	int chgct, result;
+	int chgct, rc, result;
 
-	result = kstrtouint(val, 0, (unsigned int *)kp->arg);
-	pr_warn("set_dyndbg: result:%d from %s\n", result, val);
+	rc = kstrtouint(val, 0, &result);
+	pr_debug("set_dyndbg: rc:%d got:%d from %s\n", rc, result, val);
 
 	if (result)
 		chgct = dynamic_debug_exec_queries("module=drm* +p", NULL);
 	else
 		chgct = dynamic_debug_exec_queries("module=drm* -p", NULL);
 
-	pr_warn("change ct:%d\n", chgct);
+	pr_debug("change ct:%d\n", chgct);
 	return 0;
 }
 static int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
@@ -297,13 +298,16 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
-		return;
-
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
 
+	dev_dbg(dev, "[" DRM_NAME ":%ps] Cat:%d %pV",
+		__builtin_return_address(0), category, &vaf);
+
+	if (!drm_debug_enabled(category))
+		return;
+
 	if (dev)
 		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
 			   __builtin_return_address(0), &vaf);
@@ -320,13 +324,16 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
-		return;
-
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
 
+	pr_debug("[" DRM_NAME ":%ps] Cat:%d %pV",
+		 __builtin_return_address(0), category, &vaf);
+
+	if (!drm_debug_enabled(category))
+		return;
+
 	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 	       __builtin_return_address(0), &vaf);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
