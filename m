Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB04C90CF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102610E615;
	Tue,  1 Mar 2022 16:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7BA10E723;
 Tue,  1 Mar 2022 16:46:58 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id 9so12973423ily.11;
 Tue, 01 Mar 2022 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+1diemf3MRoXdblNNavyGZGnh4l9BWi+2yg35q/w2I=;
 b=fZzouo8Gq4lZgktfrleVNOZJgE7AAveGDRPW5fk+Y2hAGgIwA66+3FomMB4cLs+w8V
 U9QyWzk7IircTiOz7sIgxqqwq2uB86JSHs84Roy4ZE/xcD1rg1/K2jxn3QMud3EINs8G
 MvxPZvP7qy+PBCo/7GB4xNa675NiFtSeu3al+TEiaV8Ol9KByxYskONt9Gl74piL2sPe
 tls31NghJiSek1de4mUm7xgKA3JzEBz5F3BY4KLbfokTiBbfeKZFZboEdGanaPPY6nO0
 dRV5SIb/uMqg2+3TfKK3olU3HlO/5b+PnLjiDlw99GeQywftdZxM6zxD9Zg0FqSViFyu
 Z1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+1diemf3MRoXdblNNavyGZGnh4l9BWi+2yg35q/w2I=;
 b=FkQZv/hTGToq8hPAlManUaUNGaZUbD3t/13/EgkoOcaqzLt/iwkWvO3cmOsG4Zo1JJ
 mG7QzWk326BtI9IF5vR9hD02U9se94pfb0RDgXSmSQA7myRuohmNJQcS30huRpCjjm/p
 Oe0yNWmOdocGOtVpjMAuYydUtb8AU4TqsS64hZqsW98RofsNLV7qbaa/wFz+1jEsY/Vw
 3eOgxQ+ObWzkbVUTlkubrHMHPw4y0DmNo91yPO2UwX562X04EPhtSliUhvT/ttp9f5WP
 //bhi0wqm8a3RQw6F2roDR1DxxNDiMHFIpyyQ68bdTSxWOtZm9GBkUV3iof/NsYxwssF
 3CMg==
X-Gm-Message-State: AOAM533W64UTBqx6mH0Z5yoYgZXMPhPD3oRzycE5HGmdfZ7GXX4zflwV
 VvWv4vRN2NYiAAfm5F6RH5Y=
X-Google-Smtp-Source: ABdhPJwf7VxPkYrrRG/vET57AY/ByM1ZpdNgjy505b5OX+6OmR5WWqWAqy/trwzf4yd2fyO7wN3M4A==
X-Received: by 2002:a92:b009:0:b0:2c2:c409:1252 with SMTP id
 x9-20020a92b009000000b002c2c4091252mr15603632ilh.8.1646153218282; 
 Tue, 01 Mar 2022 08:46:58 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/13] drm_print: prefer bare printk KERN_DEBUG on generic fn
Date: Tue,  1 Mar 2022 09:46:27 -0700
Message-Id: <20220301164629.3814634-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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

