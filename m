Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CE577B82
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DEDA9D59;
	Mon, 18 Jul 2022 06:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A46AA9D2F;
 Mon, 18 Jul 2022 06:38:56 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e69so1016182iof.5;
 Sun, 17 Jul 2022 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32h4ubovfLqXqscU0MjDWSjTeAO9s1p2u7LEUUtd5rI=;
 b=f/KZKpyhGpIlCYaS0gA1BFPLtLDquMCzBHon0q9Bmi7kklpxFO944AWw6wWXYwoTV2
 abxp21pEUKvbxpQqpBDyQjKINXOFQzATNRu9yBMX7gUdf1GoWBrYn9GDfgdmWQbtAxde
 EtPT2ri4B7Yw5ZTDYvmCe1hg7Nkl6qKjUWmac4ljdkw65UCGw6bylaZ5OkrhKsDys94S
 vzDJInG5O1ud1YgARAiuaMFIOquPZXTFmX3Psr0VoMtkGBu9HfwShCCZykTW8PoiqGqL
 hPLFreJuzhQ/NIa611hTCoxu1MX1JyU+TZA4YZAEy/XKfMdF3QSBnMWGQ5y4M+7hCEvO
 FrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32h4ubovfLqXqscU0MjDWSjTeAO9s1p2u7LEUUtd5rI=;
 b=7/bUfrI5nGXwXsbkJPwh+3wQgJikILqBEmOfbX1x8RERRnDN8DfaaA1s2BLqINPy8f
 q+CHKwSiVwxCY/Ap/vEtQ+E9E2GDISrqZIIVtoxcoRqGOQA5eoqEydr88GVYfwUFiXQi
 h7cGcNQ0qOb7TX2YuzRpip+k4yqnRXjIH6bs7Sx7d/pYCEKB7VjMCKSw9Wp/74YdIpMM
 fPEc81qIEdiByDdgRJXAHHE2A6zAvuqbAyiatl6cf5oeVtAI1Y7Du2WW15eW1GFq2Z2A
 8ZX6o+wtNEKH29yrlO1dJpJELCA5gJLf+uO+d5WzSmzhCrcudBDDnkb2JUJMaOEzkbF/
 rAgQ==
X-Gm-Message-State: AJIora9KASmisN550xj2z8vj22BMWf4HVRl5jIfKOeoypqWRvnB1cwv1
 RpsLN/W2ZjcaiW5aubo5x+g=
X-Google-Smtp-Source: AGRyM1u6+hnoyE7imG9e2ZOpcRgHgd2HNWZPxpVx+PBcSJJrITFOH8rnfPuUCEJ5oQkifbtYcrb+Rw==
X-Received: by 2002:a05:6638:3e9a:b0:33f:6b03:a298 with SMTP id
 ch26-20020a0566383e9a00b0033f6b03a298mr13595183jab.150.1658126336226; 
 Sun, 17 Jul 2022 23:38:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 27/41] drm_print: prefer bare printk KERN_DEBUG on generic
 fn
Date: Mon, 18 Jul 2022 00:36:15 -0600
Message-Id: <20220718063641.9179-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

