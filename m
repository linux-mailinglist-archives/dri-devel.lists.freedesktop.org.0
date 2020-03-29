Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930F197525
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA5A6E0AD;
	Mon, 30 Mar 2020 07:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142AE6E082
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 08:56:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n17so14596177lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=j9mujlxbObmOJIv9aY8Pv9+f4Diabo1dscBEk1uTFZ8=;
 b=LQu+EVoLSJKX0tHv/setWOeqwKWK+bWXztDRZ5UJroVq+XxYPRIhA9sSrTKTT2ibEY
 yB/6BCgeWRViYpqnPuBKAerGApUXQnxeG+X0WoOXn5axXbeok3hIPq11BbkPWdqDreNy
 /THe8rlu1cI4/e6WfTUHpVqpotR7Dd2kDsVzvcEwWWDOrSWFxb3Ds6YKGThFJab8ivoO
 daDXvYPXRAlZnzHQkB1KpdXtMB27sAdYXiBCqIHlCU7kRjveZm5jDb8J670PFFxPt6uL
 QZDBl8oREV/wjQydRKzSSOW2PiVRbx1TEAU8mPdrUnCkZsHza59pbO832vXPFQSv8D2S
 Vpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j9mujlxbObmOJIv9aY8Pv9+f4Diabo1dscBEk1uTFZ8=;
 b=rqzJsiNvwm3I96kka2wqisZgb1tuvlV5HdnsKvAA308JYeG0Rwyu1qwYI3Ks36KL8k
 gNU2c1yM0X3mhx0xnPmlvYsSwX1h6hmC4gmh1ym05LMCmgTSKRcrIYycGn7BgHlkWrLg
 4wbmZY1CqK2QeBYM5IVv1PpSMzu2TGRpYDGBcQy0Yy0XFpg2xE7v7GW5ux7z2JCVbiUT
 vVIAzMEG8t2+eXaQd/QWWzHflH+HQkpAv1nLHvwItkjxMRmldOS/zeHQ+JMFCAIgWQWb
 oqdjTGLLuSuSIZh4YPGNVqsRUT4d7O9C1I5V32STFNL3e7WuOjQ9JDGDQOymzr3+Tnfn
 kTIg==
X-Gm-Message-State: AGi0PublSMid5Ylcl54xrU3i+j5Pcd9jAHj1/RtqU8/7XLs4gUJPrTZZ
 l/QCezEha3M4JDVHwpG3amg=
X-Google-Smtp-Source: APiQypILmyETDoZAWXoLBcXENwr7izGJwTkjiZlQpOLwdm0cfT9q3DBAk44CF2QOzRRtVdc3Nvj7nA==
X-Received: by 2002:a05:651c:1108:: with SMTP id
 d8mr4072521ljo.198.1585472214451; 
 Sun, 29 Mar 2020 01:56:54 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id g18sm3797574lfh.1.2020.03.29.01.56.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Mar 2020 01:56:53 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: b.zolnierkie@samsung.com
Subject: [PATCH v2] fbcon: fix null-ptr-deref in fbcon_switch
Date: Sun, 29 Mar 2020 16:56:47 +0800
Message-Id: <20200329085647.25133-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: daniel.thompson@linaro.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ghalat@redhat.com, sam@ravnborg.org,
 Qiujun Huang <hqjagain@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set logo_shown to FBCON_LOGO_CANSHOW when the vc was deallocated.

syzkaller report: https://lkml.org/lkml/2020/3/27/403
general protection fault, probably for non-canonical address
0xdffffc000000006c: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000360-0x0000000000000367]
RIP: 0010:fbcon_switch+0x28f/0x1740
drivers/video/fbdev/core/fbcon.c:2260

Call Trace:
redraw_screen+0x2a8/0x770 drivers/tty/vt/vt.c:1008
vc_do_resize+0xfe7/0x1360 drivers/tty/vt/vt.c:1295
fbcon_init+0x1221/0x1ab0 drivers/video/fbdev/core/fbcon.c:1219
visual_init+0x305/0x5c0 drivers/tty/vt/vt.c:1062
do_bind_con_driver+0x536/0x890 drivers/tty/vt/vt.c:3542
do_take_over_console+0x453/0x5b0 drivers/tty/vt/vt.c:4122
do_fbcon_takeover+0x10b/0x210 drivers/video/fbdev/core/fbcon.c:588
fbcon_fb_registered+0x26b/0x340 drivers/video/fbdev/core/fbcon.c:3259
do_register_framebuffer drivers/video/fbdev/core/fbmem.c:1664 [inline]
register_framebuffer+0x56e/0x980 drivers/video/fbdev/core/fbmem.c:1832
dlfb_usb_probe.cold+0x1743/0x1ba3 drivers/video/fbdev/udlfb.c:1735
usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374

accessing vc_cons[logo_shown].d->vc_top causes the bug.

Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index bb6ae995c2e5..5eb3fc90f9f6 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1283,6 +1283,9 @@ static void fbcon_deinit(struct vc_data *vc)
 	if (!con_is_bound(&fb_con))
 		fbcon_exit();
 
+	if (vc->vc_num == logo_shown)
+		logo_shown = FBCON_LOGO_CANSHOW;
+
 	return;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
