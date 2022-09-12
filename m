Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7A5B538C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEF810E588;
	Mon, 12 Sep 2022 05:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1690C10E109;
 Mon, 12 Sep 2022 05:29:14 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id l6so3981582ilk.13;
 Sun, 11 Sep 2022 22:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ITRLSs656UGwBL27WS4PAEu4z+TFhuXj9Pi0xXaA2Xg=;
 b=d7h6IZ2LL+KeqOCYEFWUbsFBPvMYig1ya0J6yk6hWgz6wtXs7P6zqZ6Xot9UX9tCrr
 GyEkWPYn/VaYlXHqjEeTgHVCkEQt72UzCC/ckoMkbFpajeedGN4cg8ApmR/cMRCBSBV5
 6AKLco4R4+Wg7M6AcVKIB7xnZblixRODxoBH0/LBbAhgH8rSmMvyM7Nudac0CBv2oyjR
 xR4U3Tq1LfiT3tkoN2mlsb/zyHjl+L/QP+A8+Xc+fnkJiz2vDoxLYp0N6xJSup/9RgCU
 I+Cx7YVC3+o0Ka+vYgjJunU3sQ1PaJjoGD6lVXJkqkGp/iAS5C/9y+D9q/IdQ/LLZ+Da
 NBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ITRLSs656UGwBL27WS4PAEu4z+TFhuXj9Pi0xXaA2Xg=;
 b=5cRJNUDIuMVlXMtCQPWQrxj4i4+fpHkmqM/vhjw4GnGk/Jdv+Nv1ZzAf14b+y+POZ8
 7WxS40jkrrDf79jxuFoL9C0XLPuVQeyLOqo7x4+eSdtiAYPW/ds0wvwmCpp8vCfMN0hr
 oEmbeNtT88FW07NIpz1L7ct87Mu1PqpHDNDaa5BPcpVoztJp3xZraAudKtJLmKESe5c/
 nkorRYrd+C7GgOlxRtwG0heByZlU2kfWE9ociASnfowp9hqNXA++jwxC69bsbQQ8MJYC
 IEAIFuYZ+/Z1bzBdBul0eQ4OeNrQpSv4tdO4R6wNwVXJTPE9nT9Q/kDGVgIr7fJuB8Dt
 Uxfg==
X-Gm-Message-State: ACgBeo1YKWbkc7cO0FtjyTpabww9FNvEYNQlhjJdaGmPMxRj8vlDIbax
 m11uOwxBXf8wONQWWx89t+s=
X-Google-Smtp-Source: AA6agR5rCdnktWACXOjdGxRE7qHq3+fz7tOLmcMPlmy2aCmo61R329L72SfNxKqfY0Lm57XE7rOiSA==
X-Received: by 2002:a05:6e02:1caf:b0:2f2:1639:63a0 with SMTP id
 x15-20020a056e021caf00b002f2163963a0mr9415574ill.5.1662960553105; 
 Sun, 11 Sep 2022 22:29:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/9] drm_print: prefer bare printk KERN_DEBUG on generic fn
Date: Sun, 11 Sep 2022 23:28:51 -0600
Message-Id: <20220912052852.1123868-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.c calls pr_debug() just once, from __drm_printfn_debug(),
which is a generic/service fn.  The callsite is compile-time enabled
by DEBUG in both DYNAMIC_DEBUG=y/n builds.

For dyndbg builds, reverting this callsite back to bare printk is
correcting a few anti-features:

1- callsite is generic, serves multiple drm users.
   it is soft-wired on currently by #define DEBUG
   could accidentally: #> echo -p > /proc/dynamic_debug/control

2- optional "decorations" by dyndbg are unhelpful/misleading here,
   they describe only the generic site, not end users

IOW, 1,2 are unhelpful at best, and possibly confusing.

reverting yields a nominal data and text shrink:

   text    data     bss     dec     hex filename
 462583   36604   54592 553779   87333 /kernel/drivers/gpu/drm/drm.ko
 462515   36532   54592 553639   872a7 -dirty/kernel/drivers/gpu/drm/drm.ko

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index cb203d63b286..ec477c44a784 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -23,8 +23,6 @@
  * Rob Clark <robdclark@gmail.com>
  */
 
-#define DEBUG /* for pr_debug() */
-
 #include <linux/stdarg.h>
 
 #include <linux/io.h>
@@ -185,7 +183,8 @@ EXPORT_SYMBOL(__drm_printfn_info);
 
 void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
 {
-	pr_debug("%s %pV", p->prefix, vaf);
+	/* pr_debug callsite decorations are unhelpful here */
+	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_debug);
 
-- 
2.37.3

