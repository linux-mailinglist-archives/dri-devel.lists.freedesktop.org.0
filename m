Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5A57BA81
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7904C8F5E4;
	Wed, 20 Jul 2022 15:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DED38F080;
 Wed, 20 Jul 2022 15:33:27 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h16so9464678ila.2;
 Wed, 20 Jul 2022 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32h4ubovfLqXqscU0MjDWSjTeAO9s1p2u7LEUUtd5rI=;
 b=QcgmlDOmoAMqL35v3ejFDLRzXBZIm6n6GwVn+lx4z0ZgXr5nskM3OD/50IRGBuK1vF
 ql6tHKm+VvQtqxuetnQPraDm942VhsAHkxC2RISp1WQ+SEaJqBotvHcqaUGMulsjNccl
 WhqUdu3teLc/hGumg3gMdMl+wsiJ7erY79o2M1Dk1x8Sr0FHKiQeIFc8PAsNh+Mgf7LG
 Xiss+qhlFoGolG7+ywdPHzgSPbzWT6EtfWQK7E3Kk7nPLyfjkOY+LjO7vZOgjQIVh6I4
 rohcADD3b3s0D4UhMCnlPVR4uwgZa+bdlfOSvcuORH9KMrs2cWN3BcZhNevgofVYt9tj
 exxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32h4ubovfLqXqscU0MjDWSjTeAO9s1p2u7LEUUtd5rI=;
 b=i0mELeoyodKsTQ69MRs86oJDAcVMAN/oJWXldqqT3F9obGxhHi2ZkpdB8aK5sDryLq
 0o7jUGwcLCOHoFi61s/wwuqSpnu6P5PY/JGyVbF1qBmgzeO6ir14Y8jdtlKW/06Pa/sA
 6Ud9mBKgInnnvJrnuBnOV6vaHG+2UwQ3iDD0KRSAhiD5xPOtqqKvYFcgZbHQ0yx6jmtm
 V0VLyMRVe/s1+HYK/Ax1K7GpEJmVBgQy2oLykhT6vQp8rctIjFpT+wJtkKPlP51yZa37
 lzw4CR+0hE10TqCK2JOFg38GdCjgAgriNTtkudu7QILIspZcJjH7dAoz1fIHcgFFJjEa
 F2+g==
X-Gm-Message-State: AJIora/r9YDX4m2rLx8gmBsraWwtBmHcipli1RhLjf7jL/J9SRsIuHFn
 SA44cFO3UdrB17jSsIJ1lwAq6qDeR5YGqg==
X-Google-Smtp-Source: AGRyM1tZDrFhjX4z97EMn1515+sq3R3UhNPy+jAXCyyFitX9QpgEHSlG/Tdc/TQksCUPNSU+zqnftQ==
X-Received: by 2002:a05:6e02:158a:b0:2d3:f198:9f39 with SMTP id
 m10-20020a056e02158a00b002d3f1989f39mr20123294ilu.206.1658331206385; 
 Wed, 20 Jul 2022 08:33:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 27/41] drm_print: prefer bare printk KERN_DEBUG on generic
 fn
Date: Wed, 20 Jul 2022 09:32:19 -0600
Message-Id: <20220720153233.144129-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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
index effb95b3c2bf..e0de79a22255 100644
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
2.36.1

