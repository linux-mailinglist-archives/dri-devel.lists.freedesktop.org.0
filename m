Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68735A669E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEED10E0FF;
	Tue, 30 Aug 2022 14:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062810E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:50:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u18so1884874wrq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hw1EJiwr4Al7TCfH8SB9V/gTFnExQ67cbO1DoH3A/6Q=;
 b=i9RDRTllGAeTyupOXinyWn4xi9uMuo8hOBZb1u7BPZJI0mWVvCAnZZngKQec7WUR/u
 LZI150GiVdviCoWWQiUhcPslBdFM31/iCXrLduHiTrz9ne6r4a6BpmvKcpSkswTFh+eh
 PrJVi+po5hGMRgLE+vOzHKw8ac8G64mcS45yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hw1EJiwr4Al7TCfH8SB9V/gTFnExQ67cbO1DoH3A/6Q=;
 b=ozyOlD/QrkqDefXXazwVLl1C84wKcHbAOiEEjV1BWgJhLFngpViizfQsxiU6vv/T5x
 eDoW1Ko54L65//LSU79zS9/psp9SecqYK2dlpIq1DGrB76lmvrfLIZbGF+YCVkeXxANw
 Ieiz2HobZ2IQuY6Sj1tYV6mVYTQVM60rium62bX3xLdGzNIA4EoM1FVeIn9+AbDenK8g
 8y0PsDvPrlSwE18+TG/2pe3YlyMdE/mxcvL3ePKkjtRkCjBC8AOzJ/MS6qTrI3gXY20d
 oW0aTdPednse4ldnJOgZn8to6P66aO75BoIqIWxGghPU/DvuDdwt99kg6EIopJNCrCkT
 aYAw==
X-Gm-Message-State: ACgBeo1OSQ5eayIANPQWN7Dt1YzEIxlDKFuTR1pE2CppZRomh92wCDt0
 QZFOsQJTdQ+DDs8kIDbFzjLnZg==
X-Google-Smtp-Source: AA6agR5vnx/Qj8N0shwU05wIS8ZamJQt01pDAEzx54hq/2rMu3bvqyQWBWhD/bErmOj0YIPk1QhkDA==
X-Received: by 2002:a5d:6b09:0:b0:225:37cf:fb8b with SMTP id
 v9-20020a5d6b09000000b0022537cffb8bmr9247069wrw.179.1661871007971; 
 Tue, 30 Aug 2022 07:50:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l9-20020adfe9c9000000b0022586045c89sm10278212wrn.69.2022.08.30.07.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 07:50:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] kernel/panic: Drop unblank_screen call
Date: Tue, 30 Aug 2022 16:50:04 +0200
Message-Id: <20220830145004.430545-1-daniel.vetter@ffwll.ch>
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
Cc: Petr Mladek <pmladek@suse.com>, Yangxi Xiang <xyangxi5@gmail.com>,
 Marco Elver <elver@google.com>, John Ogness <john.ogness@linutronix.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, nick black <dankamongmen@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Luis Chamberlain <mcgrof@kernel.org>, David Gow <davidgow@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, tangmeng <tangmeng@uniontech.com>,
 Jiri Slaby <jirislaby@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

console_unblank() does this too (called in both places right after),
and with a lot more confidence inspiring approach to locking.

Reconstructing this story is very strange:

In b61312d353da ("oops handling: ensure that any oops is flushed to
the mtdoops console") it is claimed that a printk(" "); flushed out
the console buffer, which was removed in e3e8a75d2acf ("[PATCH]
Extract and use wake_up_klogd()"). In todays kernels this is done way
earlier in console_flush_on_panic with some really nasty tricks. I
didn't bother to fully reconstruct this all, least because the call to
bust_spinlock(0); gets moved every few years, depending upon how the
wind blows (or well, who screamed loudest about the various issue each
call site caused).

Before that commit the only calls to console_unblank() where in s390
arch code.

The other side here is the console->unblank callback, which was
introduced in 2.1.31 for the vt driver. Which predates the
console_unblank() function by a lot, which was added (without users)
in 2.4.14.3. So pretty much impossible to guess at any motivation
here. Also afaict the vt driver is the only (and always was the only)
console driver implementing the unblank callback, so no idea why a
call to console_unblank() was added for the mtdooops driver - the
action actually flushing out the console buffers is done from
console_unlock() only.

Note that as prep for the s390 users the locking was adjusted in
2.5.22 (I couldn't figure out how to properly reference the BK commit
from the historical git trees) from a normal semaphore to a trylock.

Note that a copy of the direct unblank_screen() call was added to
panic() in c7c3f05e341a ("panic: avoid deadlocks in re-entrant console
drivers"), which partially inlined the bust_spinlocks(0); call.

Long story short, I have no idea why the direct call to unblank_screen
survived for so long (the infrastructure to do it properly existed for
years), nor why it wasn't removed when the console_unblank() call was
finally added. But it makes a ton more sense to finally do that than
not - it's just better encapsulation to go through the console
functions instead of doing a direct call, so let's dare. Plus it
really does not make much sense to call the only unblank
implementation there is twice, once without, and once with appropriate
locking.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
Cc: Yangxi Xiang <xyangxi5@gmail.com>
Cc: nick black <dankamongmen@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marco Elver <elver@google.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: David Gow <davidgow@google.com>
Cc: tangmeng <tangmeng@uniontech.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/tty/vt/vt.c     | 3 ++-
 include/linux/vt_kern.h | 1 -
 kernel/panic.c          | 3 ---
 lib/bust_spinlocks.c    | 3 ---
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index a6be32798fad..08498fcf080a 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -154,6 +154,7 @@ static void console_callback(struct work_struct *ignored);
 static void con_driver_unregister_callback(struct work_struct *ignored);
 static void blank_screen_t(struct timer_list *unused);
 static void set_palette(struct vc_data *vc);
+static void unblank_screen(void);
 
 #define vt_get_kmsg_redirect() vt_kmsg_redirect(-1)
 
@@ -4450,7 +4451,7 @@ EXPORT_SYMBOL(do_unblank_screen);
  * call it with 1 as an argument and so force a mode restore... that may kill
  * X or at least garbage the screen but would also make the Oops visible...
  */
-void unblank_screen(void)
+static void unblank_screen(void)
 {
 	do_unblank_screen(0);
 }
diff --git a/include/linux/vt_kern.h b/include/linux/vt_kern.h
index b5ab452fca5b..c1f5aebef170 100644
--- a/include/linux/vt_kern.h
+++ b/include/linux/vt_kern.h
@@ -30,7 +30,6 @@ struct vc_data *vc_deallocate(unsigned int console);
 void reset_palette(struct vc_data *vc);
 void do_blank_screen(int entering_gfx);
 void do_unblank_screen(int leaving_gfx);
-void unblank_screen(void);
 void poke_blanked_console(void);
 int con_font_op(struct vc_data *vc, struct console_font_op *op);
 int con_set_cmap(unsigned char __user *cmap);
diff --git a/kernel/panic.c b/kernel/panic.c
index 1fc3d98417d1..74a7b55851c4 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -330,9 +330,6 @@ void panic(const char *fmt, ...)
 	if (_crash_kexec_post_notifiers)
 		__crash_kexec(NULL);
 
-#ifdef CONFIG_VT
-	unblank_screen();
-#endif
 	console_unblank();
 
 	/*
diff --git a/lib/bust_spinlocks.c b/lib/bust_spinlocks.c
index 8be59f84eaea..bfd53972a4d8 100644
--- a/lib/bust_spinlocks.c
+++ b/lib/bust_spinlocks.c
@@ -22,9 +22,6 @@ void bust_spinlocks(int yes)
 	if (yes) {
 		++oops_in_progress;
 	} else {
-#ifdef CONFIG_VT
-		unblank_screen();
-#endif
 		console_unblank();
 		if (--oops_in_progress == 0)
 			wake_up_klogd();
-- 
2.37.2

