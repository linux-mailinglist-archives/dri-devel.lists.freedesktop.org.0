Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA282319EB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDF06E45D;
	Wed, 29 Jul 2020 06:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D00E6E440
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 05:30:35 +0000 (UTC)
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06T5UUEP052197;
 Wed, 29 Jul 2020 14:30:30 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp);
 Wed, 29 Jul 2020 14:30:30 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp
 [106.72.142.33]) (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06T5UOZI052019
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 29 Jul 2020 14:30:30 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Subject: [PATCH] vt: Handle recursion in vc_do_resize().
Date: Wed, 29 Jul 2020 14:30:20 +0900
Message-Id: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot is reporting OOB read bug in vc_do_resize() [1] caused by memcpy()
based on outdated old_{rows,row_size} values, for resize_screen() can
recurse into vc_do_resize() which changes vc->vc_{cols,rows} that outdates
old_{rows,row_size} values which were read before calling resize_screen().

Minimal fix might be to read vc->vc_{rows,size_row} after resize_screen().
A different fix might be to forbid recursive vc_do_resize() request.
I can't tell which fix is the better.

But since I guess that new_cols == vc->vc_cols && new_rows == vc->vc_rows
check could become true after returning from resize_screen(), and I assume
that not calling clear_selection() when resize_screen() will return error
is harmless, let's redo the check by moving resize_screen() earlier.

[1] https://syzkaller.appspot.com/bug?id=c70c88cfd16dcf6e1d3c7f0ab8648b3144b5b25e

Reported-by: syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/tty/vt/vt.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 42d8c67..952a067 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1217,7 +1217,24 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 
 	if (new_cols == vc->vc_cols && new_rows == vc->vc_rows)
 		return 0;
+	if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
+		return -EINVAL;
 
+	/*
+	 * Since fbcon_resize() from resize_screen() can recurse into
+	 * this function via fb_set_var(), handle recursion now.
+	 */
+	err = resize_screen(vc, new_cols, new_rows, user);
+	if (err)
+		return err;
+	/* Reload values in case recursion changed vc->vc_{cols,rows}. */
+	new_cols = (cols ? cols : vc->vc_cols);
+	new_rows = (lines ? lines : vc->vc_rows);
+	new_row_size = new_cols << 1;
+	new_screen_size = new_row_size * new_rows;
+
+	if (new_cols == vc->vc_cols && new_rows == vc->vc_rows)
+		return 0;
 	if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
 		return -EINVAL;
 	newscreen = kzalloc(new_screen_size, GFP_USER);
@@ -1238,13 +1255,6 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 	old_rows = vc->vc_rows;
 	old_row_size = vc->vc_size_row;
 
-	err = resize_screen(vc, new_cols, new_rows, user);
-	if (err) {
-		kfree(newscreen);
-		vc_uniscr_free(new_uniscr);
-		return err;
-	}
-
 	vc->vc_rows = new_rows;
 	vc->vc_cols = new_cols;
 	vc->vc_size_row = new_row_size;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
