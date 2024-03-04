Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F156870F77
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F99B10E36D;
	Mon,  4 Mar 2024 21:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="StmttDSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E42B10E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 21:54:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8B641CE17A2;
 Mon,  4 Mar 2024 21:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5C0C433C7;
 Mon,  4 Mar 2024 21:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1709589287;
 bh=iSD8lQrUC2a6huqfUP7TPUMa7hjhEO/fw2MLY3BN+q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=StmttDSkWtfPqp1rjLY5wefMHDM3EAO7I52atZzaLNLCye12WYOkb04upifDt2bUd
 Ibl6g6kr2oUPiMuN8N7BsDghhzsYkskMaLgrE/83lc8AP8SGYblCfwcg8ACQ42oOlx
 jJndxkTEPGfdrk88mFlhkUIMTA5dADIoHqjMKhHg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Ubisectech Sirius <bugreport@ubisectech.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 44/84] fbcon: always restore the old font data in
 fbcon_do_set_font()
Date: Mon,  4 Mar 2024 21:24:17 +0000
Message-ID: <20240304211543.802938730@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304211542.332206551@linuxfoundation.org>
References: <20240304211542.332206551@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

[ Upstream commit 00d6a284fcf3fad1b7e1b5bc3cd87cbfb60ce03f ]

Commit a5a923038d70 (fbdev: fbcon: Properly revert changes when
vc_resize() failed) started restoring old font data upon failure (of
vc_resize()). But it performs so only for user fonts. It means that the
"system"/internal fonts are not restored at all. So in result, the very
first call to fbcon_do_set_font() performs no restore at all upon
failing vc_resize().

This can be reproduced by Syzkaller to crash the system on the next
invocation of font_get(). It's rather hard to hit the allocation failure
in vc_resize() on the first font_set(), but not impossible. Esp. if
fault injection is used to aid the execution/failure. It was
demonstrated by Sirius:
  BUG: unable to handle page fault for address: fffffffffffffff8
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD cb7b067 P4D cb7b067 PUD cb7d067 PMD 0
  Oops: 0000 [#1] PREEMPT SMP KASAN
  CPU: 1 PID: 8007 Comm: poc Not tainted 6.7.0-g9d1694dc91ce #20
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
  RIP: 0010:fbcon_get_font+0x229/0x800 drivers/video/fbdev/core/fbcon.c:2286
  Call Trace:
   <TASK>
   con_font_get drivers/tty/vt/vt.c:4558 [inline]
   con_font_op+0x1fc/0xf20 drivers/tty/vt/vt.c:4673
   vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
   vt_ioctl+0x632/0x2ec0 drivers/tty/vt/vt_ioctl.c:752
   tty_ioctl+0x6f8/0x1570 drivers/tty/tty_io.c:2803
   vfs_ioctl fs/ioctl.c:51 [inline]
  ...

So restore the font data in any case, not only for user fonts. Note the
later 'if' is now protected by 'old_userfont' and not 'old_data' as the
latter is always set now. (And it is supposed to be non-NULL. Otherwise
we would see the bug above again.)

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Fixes: a5a923038d70 ("fbdev: fbcon: Properly revert changes when vc_resize() failed")
Reported-and-tested-by: Ubisectech Sirius <bugreport@ubisectech.com>
Cc: Ubisectech Sirius <bugreport@ubisectech.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20240208114411.14604-1-jirislaby@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbcon.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b6712655ec1f0..b163b54b868e6 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2409,11 +2409,9 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize, ret, old_userfont, old_width, old_height, old_charcount;
-	char *old_data = NULL;
+	u8 *old_data = vc->vc_font.data;
 
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
-	if (p->userfont)
-		old_data = vc->vc_font.data;
 	vc->vc_font.data = (void *)(p->fontdata = data);
 	old_userfont = p->userfont;
 	if ((p->userfont = userfont))
@@ -2447,13 +2445,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 		update_screen(vc);
 	}
 
-	if (old_data && (--REFCOUNT(old_data) == 0))
+	if (old_userfont && (--REFCOUNT(old_data) == 0))
 		kfree(old_data - FONT_EXTRA_WORDS * sizeof(int));
 	return 0;
 
 err_out:
 	p->fontdata = old_data;
-	vc->vc_font.data = (void *)old_data;
+	vc->vc_font.data = old_data;
 
 	if (userfont) {
 		p->userfont = old_userfont;
-- 
2.43.0



