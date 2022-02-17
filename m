Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532A4B9726
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBC410E7B5;
	Thu, 17 Feb 2022 03:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960AF10E7B5;
 Thu, 17 Feb 2022 03:48:53 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id p11so1386945ils.1;
 Wed, 16 Feb 2022 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+1diemf3MRoXdblNNavyGZGnh4l9BWi+2yg35q/w2I=;
 b=piNFTBhwQ7mhrk0SHb3PWRDl5OjBX/bAyNasGSPh1MsbJOAUlq4M54/Ycs9JEz1OkK
 ajhk18Y44UImCvX03at6dUQBwc5j8vy67kAtnKDCOYHUbW3oNqVu5AQYP1CNBcWAJXyx
 7ATDZmawW4xanGN6qmHekUzUPlIwkViD3xOIQiA9DMIvaFoN//ASa3mFsYgEglo1/2wS
 FriiPIYnPHJvQnETNxtDTyeu0G+YT4qQXT6YzncWfiy55/qVnfJYcUY7uI45Z/ZaMfJ+
 XKf9lW5gCeT4210yp9SCnnt0FkxKMe9FDNoK3D32OZBZfcoopIMU3gCIg3tOjq2EODRt
 hGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+1diemf3MRoXdblNNavyGZGnh4l9BWi+2yg35q/w2I=;
 b=EG/MMyVxN0gAKjjYNcVrR2YNd+xGqwyxnp4BPN2Ctpl3Aqz4YrzfRgTDfJohC4vLDd
 5NkCrygHx80EFdiZ9yVRglYziXc1ZDXHqKCUidXaCH+dOanBpLYbV7Taw0c6DVoiG8aD
 Wi4GFH3IQcI7CfWerOma7g5j1Av2mQh3zjwZP2YlTo/QOPApmXN3SHjAa6gZlF2LN4jh
 PwQH/ju75gncG0iaR9mZ4vSWNZF4snoyE4++ADhhHHmBoAJE15ozQOCnNAeMst1YhsRF
 w7D7z0yR3ZqEjRcu/XnoFH1miW9xYhxfPkSx0QKFvqcqauo0IVNKs20lqmjUIXrB+ykx
 dGxw==
X-Gm-Message-State: AOAM533iBbhtTDP1Fsu7Ily1I5p8vx4c8uQu4loQy0wXjQJHbY3neTli
 /5VRhojyOGjzUpIHkJjug/g=
X-Google-Smtp-Source: ABdhPJzlC3U68DCLsbYeOcinMvhFhlX0fVCV6UVlgNQZ/JDGtbLNJFcAGBXvUWtwMqJomXO85pvLPw==
X-Received: by 2002:a92:cece:0:b0:2be:a529:d457 with SMTP id
 z14-20020a92cece000000b002bea529d457mr750693ilq.154.1645069732006; 
 Wed, 16 Feb 2022 19:48:52 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/13] drm_print: prefer bare printk KERN_DEBUG on generic fn
Date: Wed, 16 Feb 2022 20:48:27 -0700
Message-Id: <20220217034829.64395-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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
   its hardwired on currently
   could accidentally: #> echo -p > /proc/dynamic_debug/control

2- optional "decorations" by dyndbg are unhelpful/misleading
   they describe only the generic site, not end users

IOW, 1,2 are unhelpful at best, and possibly confusing.

reverting yields a nominal data and text shrink:

   text    data     bss     dec     hex filename
 462583   36604   54592 553779   87333 /lib/modules/5.16.0-rc4-lm1-00008-ged3eac8ceeea/kernel/drivers/gpu/drm/drm.ko
 462515   36532   54592 553639   872a7 /lib/modules/5.16.0-rc4-lm1-00009-g6ce0b88d2539-dirty/kernel/drivers/gpu/drm/drm.ko

NB: this was noticed using _drm_debug_enabled(), added earlier.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 92e6e18026da..24c57b92dc69 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -23,8 +23,6 @@
  * Rob Clark <robdclark@gmail.com>
  */
 
-#define DEBUG /* for pr_debug() */
-
 #include <linux/stdarg.h>
 
 #include <linux/io.h>
@@ -162,7 +160,8 @@ EXPORT_SYMBOL(__drm_printfn_info);
 
 void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
 {
-	pr_debug("%s %pV", p->prefix, vaf);
+	/* pr_debug callsite decorations are unhelpful here */
+	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_debug);
 
-- 
2.35.1

