Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FDKM2Vcg2mJlQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:49:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75720E763F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258AE10E148;
	Wed,  4 Feb 2026 14:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qn3RQoVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DB110E148
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 14:48:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3617360131;
 Wed,  4 Feb 2026 14:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C94FC4CEF7;
 Wed,  4 Feb 2026 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770216537;
 bh=xq9lHE9niifehutjarSdOqbGJQfP5ZeokUxgyLJkWP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qn3RQoVl4od3Ies8cIQB+crYdwCf42t56LQqTHGKqvXuSMvbseMI0wAy5uZtqWkZx
 fjw7hKis0WASXvzTC+H0L5dEvxtQJnmH9m9NK8C5tiwEw1KNePXWxb0iIVfwfcEmN5
 pkdCqY8ym+gs9uXoRt5D37dG1KFPmQ9Yvj9Pq5ro=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Ubisectech Sirius <bugreport@ubisectech.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 5.10 117/161] fbcon: always restore the old font data in
 fbcon_do_set_font()
Date: Wed,  4 Feb 2026 15:39:40 +0100
Message-ID: <20260204143855.957295933@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204143851.755002596@linuxfoundation.org>
References: <20260204143851.755002596@linuxfoundation.org>
User-Agent: quilt/0.69
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,ubisectech.com,ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:patches@lists.linux.dev,m:jirislaby@kernel.org,m:bugreport@ubisectech.com,m:daniel@ffwll.ch,m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:daniel.vetter@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_SPF_DNSFAIL(0.00)[temporary DNS error];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,linuxfoundation.org:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 75720E763F
X-Rspamd-Action: no action

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

commit 00d6a284fcf3fad1b7e1b5bc3cd87cbfb60ce03f upstream.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbcon.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2425,11 +2425,9 @@ static int fbcon_do_set_font(struct vc_d
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
@@ -2463,13 +2461,13 @@ static int fbcon_do_set_font(struct vc_d
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


