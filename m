Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A95A6537
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC2D10E0E2;
	Tue, 30 Aug 2022 13:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788F10E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 13:41:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id h1so5811022wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4DJawcmHJDXK/larmzbFcsxblDinNYvWhKtjvg3WYsE=;
 b=NezfSURzPSk6ZZckYTP5Ey/86r35sJ8o0R6U5GZ6U34lrn3+OwN1vMTPscLU25Kxlh
 iFif4+GWl6ROmPgoirU8vInFZiTAq4jiuNaj6hzDRRgxAX/gpgoTIva231WLIbNMlUYZ
 I8bvzWqjx6F5CDKnwTyhmX8kUDzLcrSyPHL1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4DJawcmHJDXK/larmzbFcsxblDinNYvWhKtjvg3WYsE=;
 b=UwcJdRjVl0Cm9PwrnIWSjCM6sRD+/RxZotPqNM+U7LhLtxIX6o12PhhO9KmgnfEKRb
 0f6Ju3vA+gasXWBarrMooDm3qVeiyVkIDDAP6R5ncP0lGzo+W9XxWr0GeVltvpZ1x91S
 gakBLwDH8R2zrcPupcGNP2xibUkpqiVBJkZwZuTgQ+Tl4y8XsAM1P2NeWOCe7Fi9NPZb
 TwUWrXURnlGbhQ/QXdC+0bmP1tVEW+02zK/eCHO6w49Ghoi63As2LIQI9PSVf26DCLvv
 mQO6YTNp9K40SJZKkyqdZH/U7A81sAfDs3XK7lJl+iskwOzswCQ2TUBlKuiGHxx41NA3
 p3tw==
X-Gm-Message-State: ACgBeo2fX+nSXy6L1cYz9GtibxXZAucwpm0RvizQkfYuiYEitRCq832M
 SbWlNb4IrQ7hZVguJrfkuzCGbQ==
X-Google-Smtp-Source: AA6agR42uGyLFvr7VwfI8PKUOEjVgy62XeoPV+pO67oUMX9x7WyQAogYCnLFV8idBlRmO3NhaooWRA==
X-Received: by 2002:a7b:c8c1:0:b0:3a5:bb57:e7a9 with SMTP id
 f1-20020a7bc8c1000000b003a5bb57e7a9mr9764114wml.18.1661866879992; 
 Tue, 30 Aug 2022 06:41:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bd22-20020a05600c1f1600b003a8436e2a94sm8421146wmb.16.2022.08.30.06.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 06:41:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] tty/vt: Remove printable variable
Date: Tue, 30 Aug 2022 15:41:17 +0200
Message-Id: <20220830134117.416003-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
References: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
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

