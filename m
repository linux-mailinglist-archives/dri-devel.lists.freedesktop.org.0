Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F1265CE4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D996E9EC;
	Fri, 11 Sep 2020 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4766E25D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 22:57:20 +0000 (UTC)
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08AMv8qc089110;
 Fri, 11 Sep 2020 07:57:08 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp);
 Fri, 11 Sep 2020 07:57:08 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08AMv7Ii089106
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 11 Sep 2020 07:57:08 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: [PATCH] fbcon: Fix user font detection test at fbcon_resize().
To: syzbot <syzbot+b38b1ef6edf0c74a8d97@syzkaller.appspotmail.com>,
 george.kennedy@oracle.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, syzkaller-bugs@googlegroups.com
References: <00000000000024be1505ad487cbb@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <f6e3e611-8704-1263-d163-f52c906a4f06@I-love.SAKURA.ne.jp>
Date: Fri, 11 Sep 2020 07:57:06 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <00000000000024be1505ad487cbb@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, natechancellor@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot is reporting OOB read at fbcon_resize() [1], for
commit 39b3cffb8cf31117 ("fbcon: prevent user font height or width change
 from causing potential out-of-bounds access") is by error using
registered_fb[con2fb_map[vc->vc_num]]->fbcon_par->p->userfont (which was
set to non-zero) instead of fb_display[vc->vc_num].userfont (which remains
zero for that display).

We could remove tricky userfont flag [2], for we can determine it by
comparing address of the font data and addresses of built-in font data.
But since that commit is failing to fix the original OOB read [3], this
patch keeps the change minimal in case we decide to revert altogether.

[1] https://syzkaller.appspot.com/bug?id=ebcbbb6576958a496500fee9cf7aa83ea00b5920
[2] https://syzkaller.appspot.com/text?tag=Patch&x=14030853900000
[3] https://syzkaller.appspot.com/bug?id=6fba8c186d97cf1011ab17660e633b1cc4e080c9

Reported-by: syzbot <syzbot+b38b1ef6edf0c74a8d97@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 39b3cffb8cf31117 ("fbcon: prevent user font height or width change from causing potential out-of-bounds access")
Cc: George Kennedy <george.kennedy@oracle.com>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 66167830fefd..dae7ae7f225a 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2203,7 +2203,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 	struct fb_var_screeninfo var = info->var;
 	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
 
-	if (ops->p && ops->p->userfont && FNTSIZE(vc->vc_font.data)) {
+	if (p->userfont && FNTSIZE(vc->vc_font.data)) {
 		int size;
 		int pitch = PITCH(vc->vc_font.width);
 
-- 
2.18.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
