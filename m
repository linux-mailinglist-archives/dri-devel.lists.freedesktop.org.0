Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381492A271F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3946E0A1;
	Mon,  2 Nov 2020 09:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174636E0A1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:37:15 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y14so10586091pfp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 01:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q4LWjOQb48RbMvuqunvROMBYqbWJviRmRbs1farYf+o=;
 b=Ouivo3WkaZWDdXarHlxfc76m/TrdvxXtNjxs/qxYSq5z1VkleGC5Biq3uMuBsyswOw
 sewYi9DabhWO7RN0Qvtwl9XEYrmkScHJrmHPoSUlYwXuGUrsfb7uYXvkM4O+iHn6kqh+
 MYJIDi6A4Ufxb+P5QQUIB2ztW1TBwwoaxRAWXfj904qfJAiNKy6X2oafViYxJR1oq5qT
 fgm9qCtv3huwI6tLzKwUE8+0Xu9caqDo2RTNhA7Fx8KTtWLom/JvHNfI2YHgAwodKNxn
 sGmDA0j9bSydLptOUNPWxXJzv5RZcEvHgWExANOO60Sn8cR6+dxA/yNo3PdA8jR5DQcU
 +1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q4LWjOQb48RbMvuqunvROMBYqbWJviRmRbs1farYf+o=;
 b=h6E99Q29cw3TTRZsbaYOyLkXKSaXspOC2EVfnFVbIe/2uuf4h59BDWpHYfcmQfb6wz
 24uWJ9XeBxZZJFJEEJmfMUjkrNEZW0vJ3zVScY108/hD3pgPyKydQ41hJKoNP8/gFTSm
 Kp8rQEEhmUK6zis81FOdG8AkXNK3U1l9dVQYB1xzXf0Dcmzyd74avX1YCK+pAsKV5LFS
 RcaERZTtWs/tIt0FC3E3ZcyDrEoogiqELbpDP6iT4+mFvwlNieLWI9q5YXUJpSa13rl2
 PkdHXi2xStorLdYf4/uFSmmCGUUCoLXPcsm0CzBBIaaRcKFgrpd2jdsIEecqbc2Pqd1e
 C58g==
X-Gm-Message-State: AOAM530ww/oGNd3I7riGs8p7QyCzpFDWzekhleYh9nxTWa85MxATTNbU
 UV8pwMxYQh6JhxDuRWlJbg==
X-Google-Smtp-Source: ABdhPJzsH5NB3PxiruEjGrp4JTwVXQZfViSpD41UawE+gLt4Mib6M7rMtc3KzqmkqFgSe0xUpuE/iA==
X-Received: by 2002:a62:1991:0:b029:155:f476:2462 with SMTP id
 139-20020a6219910000b0290155f4762462mr21521857pfz.43.1604309834682; 
 Mon, 02 Nov 2020 01:37:14 -0800 (PST)
Received: from localhost.localdomain (59-125-13-244.HINET-IP.hinet.net.
 [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id 199sm5566013pgg.18.2020.11.02.01.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 01:37:13 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>
Subject: [PATCH v2 1/2] console: Remove dummy con_font_op() callback
 implementations
Date: Mon,  2 Nov 2020 04:36:05 -0500
Message-Id: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`struct console_font` is a UAPI structure, thus ideally should not be
used for kernel internal abstraction. Remove some dummy .con_font_set,
.con_font_default and .con_font_copy `struct consw` callback
implementations, to make it cleaner.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
  - [v2 2/2] no longer Cc: stable, so do not Cc: stable

Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/

 drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
 drivers/video/console/dummycon.c        | 20 --------------------
 2 files changed, 41 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
index c63e545fb105..dfa0d5ce6012 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -1345,24 +1345,6 @@ static int sisusbdummycon_blank(struct vc_data *vc, int blank, int mode_switch)
 	return 0;
 }
 
-static int sisusbdummycon_font_set(struct vc_data *vc,
-				   struct console_font *font,
-				   unsigned int flags)
-{
-	return 0;
-}
-
-static int sisusbdummycon_font_default(struct vc_data *vc,
-				       struct console_font *font, char *name)
-{
-	return 0;
-}
-
-static int sisusbdummycon_font_copy(struct vc_data *vc, int con)
-{
-	return 0;
-}
-
 static const struct consw sisusb_dummy_con = {
 	.owner =		THIS_MODULE,
 	.con_startup =		sisusbdummycon_startup,
@@ -1375,9 +1357,6 @@ static const struct consw sisusb_dummy_con = {
 	.con_scroll =		sisusbdummycon_scroll,
 	.con_switch =		sisusbdummycon_switch,
 	.con_blank =		sisusbdummycon_blank,
-	.con_font_set =		sisusbdummycon_font_set,
-	.con_font_default =	sisusbdummycon_font_default,
-	.con_font_copy =	sisusbdummycon_font_copy,
 };
 
 int
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 2a0d0bda7faa..f1711b2f9ff0 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -124,23 +124,6 @@ static int dummycon_switch(struct vc_data *vc)
 	return 0;
 }
 
-static int dummycon_font_set(struct vc_data *vc, struct console_font *font,
-			     unsigned int flags)
-{
-	return 0;
-}
-
-static int dummycon_font_default(struct vc_data *vc,
-				 struct console_font *font, char *name)
-{
-	return 0;
-}
-
-static int dummycon_font_copy(struct vc_data *vc, int con)
-{
-	return 0;
-}
-
 /*
  *  The console `switch' structure for the dummy console
  *
@@ -159,8 +142,5 @@ const struct consw dummy_con = {
 	.con_scroll =	dummycon_scroll,
 	.con_switch =	dummycon_switch,
 	.con_blank =	dummycon_blank,
-	.con_font_set =	dummycon_font_set,
-	.con_font_default =	dummycon_font_default,
-	.con_font_copy =	dummycon_font_copy,
 };
 EXPORT_SYMBOL_GPL(dummy_con);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
