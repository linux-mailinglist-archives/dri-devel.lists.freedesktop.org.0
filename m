Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C003D5A306F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A110E2FE;
	Fri, 26 Aug 2022 20:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C578B10E2FE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 20:24:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id s23so1395987wmj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=4DJawcmHJDXK/larmzbFcsxblDinNYvWhKtjvg3WYsE=;
 b=C7B1XHqI0ZcRrjTFImvAPSWeCO8mbIfY/NZVpVEp6lzTyKYL2Yj7ZGrrlfBlPkOWNr
 cyp8PMIKRM5QcNYagLSQjfv6T1hdE3Y1HSHn72kqlXuBGm5AuF2upRD+Ad4Uz3NhSAsX
 WLr/yusg1P1Nsf6CdFldkc+iKGRN7B7mgjUIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4DJawcmHJDXK/larmzbFcsxblDinNYvWhKtjvg3WYsE=;
 b=rqCTVxodv/cj9PzjSJdWHgd40xbVbPMPG4ZOmiecnLKDjOP3svbM05OWyuc1vJ3++W
 65INfdSXCDKEHQyc1LszoV+SJLDdsUGi/4agHG7nRvVHYVUUNd1P8tr6KO+Ae/8CYnKE
 VilOFhGkHPvPw0MxylO59gB9ZhAvs983Bl67qTSOzdxI4t6HoU0e26ERemCF04Awr+I2
 UDU+aSmLnDfzn3J1PirS5f6YaCAB0iD6IlTj+MvTm7SAshcTcD3FZ0jai45VNAB7oMEy
 xYRov4RCCS2QLAi4W9oF9mOFv2ZzXWwUpyNncJNaEF1tANZPL1IKpWh2gbFT1X53dQxr
 1+wQ==
X-Gm-Message-State: ACgBeo2N1YS8e2fb+SXA2J/ORTeFxBrlen3rEUvy9oZfpDip7KI8cFwW
 lymhZ15EA6D6HFIECGd9Ucee/Q==
X-Google-Smtp-Source: AA6agR5lSHWPtslgy1PrFiq+dwYPQZfa4Tp3P/IFJZ2of8xR+KDJ1cZOwXfycvVbtaiWWg8JyvE75A==
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id
 u16-20020a05600c035000b003a534731c23mr664134wmd.9.1661545462136; 
 Fri, 26 Aug 2022 13:24:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f14-20020adff98e000000b002252ec781f7sm613713wrr.8.2022.08.26.13.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:24:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] tty/vt: Remove printable variable
Date: Fri, 26 Aug 2022 22:24:19 +0200
Message-Id: <20220826202419.198535-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Yangxi Xiang <xyangxi5@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, nick black <dankamongmen@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every since the 0.99.7A release when console_register() was introduced
it's become impossible to call vt_console_print (called
console_print() back then still) directly. Which means the
initialization issue this variable protected against is no more.

Give it a send off with style and let it rest in peace.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: nick black <dankamongmen@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Yangxi Xiang <xyangxi5@gmail.com>
Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
---
 drivers/tty/vt/vt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index ae9c926acd6f..4d29e4a17db7 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -157,7 +157,6 @@ static void set_palette(struct vc_data *vc);
 
 #define vt_get_kmsg_redirect() vt_kmsg_redirect(-1)
 
-static int printable;		/* Is console ready for printing? */
 int default_utf8 = true;
 module_param(default_utf8, int, S_IRUGO | S_IWUSR);
 int global_cursor_default = -1;
@@ -3085,8 +3084,6 @@ static void vt_console_print(struct console *co, const char *b, unsigned count)
 	int kmsg_console;
 
 	/* console busy or not yet initialized */
-	if (!printable)
-		return;
 	if (!spin_trylock(&printing_lock))
 		return;
 
@@ -3537,7 +3534,6 @@ static int __init con_init(void)
 	pr_info("Console: %s %s %dx%d\n",
 		vc->vc_can_do_color ? "colour" : "mono",
 		display_desc, vc->vc_cols, vc->vc_rows);
-	printable = 1;
 
 	console_unlock();
 
-- 
2.37.2

