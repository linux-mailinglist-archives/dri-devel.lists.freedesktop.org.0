Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4D21E8C9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EBC6E8DC;
	Tue, 14 Jul 2020 07:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F496E13F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 11:10:41 +0000 (UTC)
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06CBAJlv040321;
 Sun, 12 Jul 2020 20:10:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Sun, 12 Jul 2020 20:10:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp
 [106.72.142.33]) (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06CBAFJO040301
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 12 Jul 2020 20:10:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Subject: [PATCH v3] vt: Reject zero-sized screen buffer size.
Date: Sun, 12 Jul 2020 20:10:12 +0900
Message-Id: <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot is reporting general protection fault in do_con_write() [1] caused
by vc->vc_screenbuf == ZERO_SIZE_PTR caused by vc->vc_screenbuf_size == 0
caused by vc->vc_cols == vc->vc_rows == vc->vc_size_row == 0 caused by
fb_set_var() from ioctl(FBIOPUT_VSCREENINFO) on /dev/fb0 , for
gotoxy(vc, 0, 0) from reset_terminal() from vc_init() from vc_allocate()
 from con_install() from tty_init_dev() from tty_open() on such console
causes vc->vc_pos == 0x10000000e due to
((unsigned long) ZERO_SIZE_PTR) + -1U * 0 + (-1U << 1).

I don't think that a console with 0 column or 0 row makes sense. And it
seems that vc_do_resize() does not intend to allow resizing a console to
0 column or 0 row due to

  new_cols = (cols ? cols : vc->vc_cols);
  new_rows = (lines ? lines : vc->vc_rows);

exception.

Theoretically, cols and rows can be any range as long as
0 < cols * rows * 2 <= KMALLOC_MAX_SIZE is satisfied (e.g.
cols == 1048576 && rows == 2 is possible) because of

  vc->vc_size_row = vc->vc_cols << 1;
  vc->vc_screenbuf_size = vc->vc_rows * vc->vc_size_row;

in visual_init() and kzalloc(vc->vc_screenbuf_size) in vc_allocate().

Since we can detect cols == 0 or rows == 0 via screenbuf_size = 0 in
visual_init(), we can reject kzalloc(0). Then, vc_allocate() will return
an error, and con_write() will not be called on a console with 0 column
or 0 row.

We need to make sure that integer overflow in visual_init() won't happen.
Since vc_do_resize() restricts cols <= 32767 and rows <= 32767, applying
1 <= cols <= 32767 and 1 <= rows <= 32767 restrictions to vc_allocate()
will be practically fine.

This patch does not touch con_init(), for returning -EINVAL there
does not help when we are not returning -ENOMEM.

[1] https://syzkaller.appspot.com/bug?extid=017265e8553724e514e8

Reported-and-tested-by: syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/tty/vt/vt.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 48a8199f7845..42d8c67a481f 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1092,10 +1092,19 @@ static const struct tty_port_operations vc_port_ops = {
 	.destruct = vc_port_destruct,
 };
 
+/*
+ * Change # of rows and columns (0 means unchanged/the size of fg_console)
+ * [this is to be used together with some user program
+ * like resize that changes the hardware videomode]
+ */
+#define VC_MAXCOL (32767)
+#define VC_MAXROW (32767)
+
 int vc_allocate(unsigned int currcons)	/* return 0 on success */
 {
 	struct vt_notifier_param param;
 	struct vc_data *vc;
+	int err;
 
 	WARN_CONSOLE_UNLOCKED();
 
@@ -1125,6 +1134,11 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 	if (!*vc->vc_uni_pagedir_loc)
 		con_set_default_unimap(vc);
 
+	err = -EINVAL;
+	if (vc->vc_cols > VC_MAXCOL || vc->vc_rows > VC_MAXROW ||
+	    vc->vc_screenbuf_size > KMALLOC_MAX_SIZE || !vc->vc_screenbuf_size)
+		goto err_free;
+	err = -ENOMEM;
 	vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_KERNEL);
 	if (!vc->vc_screenbuf)
 		goto err_free;
@@ -1143,7 +1157,7 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 	visual_deinit(vc);
 	kfree(vc);
 	vc_cons[currcons].d = NULL;
-	return -ENOMEM;
+	return err;
 }
 
 static inline int resize_screen(struct vc_data *vc, int width, int height,
@@ -1158,14 +1172,6 @@ static inline int resize_screen(struct vc_data *vc, int width, int height,
 	return err;
 }
 
-/*
- * Change # of rows and columns (0 means unchanged/the size of fg_console)
- * [this is to be used together with some user program
- * like resize that changes the hardware videomode]
- */
-#define VC_RESIZE_MAXCOL (32767)
-#define VC_RESIZE_MAXROW (32767)
-
 /**
  *	vc_do_resize	-	resizing method for the tty
  *	@tty: tty being resized
@@ -1201,7 +1207,7 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 	user = vc->vc_resize_user;
 	vc->vc_resize_user = 0;
 
-	if (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
+	if (cols > VC_MAXCOL || lines > VC_MAXROW)
 		return -EINVAL;
 
 	new_cols = (cols ? cols : vc->vc_cols);
@@ -1212,7 +1218,7 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 	if (new_cols == vc->vc_cols && new_rows == vc->vc_rows)
 		return 0;
 
-	if (new_screen_size > KMALLOC_MAX_SIZE)
+	if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
 		return -EINVAL;
 	newscreen = kzalloc(new_screen_size, GFP_USER);
 	if (!newscreen)
@@ -3393,6 +3399,7 @@ static int __init con_init(void)
 		INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
 		tty_port_init(&vc->port);
 		visual_init(vc, currcons, 1);
+		/* Assuming vc->vc_{cols,rows,screenbuf_size} are sane here. */
 		vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_NOWAIT);
 		vc_init(vc, vc->vc_rows, vc->vc_cols,
 			currcons || !vc->vc_sw->con_save_screen);
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
