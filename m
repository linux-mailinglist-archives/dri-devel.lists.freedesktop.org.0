Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E644F5A669D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0210E0FC;
	Tue, 30 Aug 2022 14:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69C010E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:49:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u18so1883624wrq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=kZOaD1B8emphOfywTXzw4uigM54srkRRmu9c5V6NK1A=;
 b=TYS4YvSN1AwESNxvEaaENxBSTEIASwZ0luttSQjo1X3Lce5ydRuQLu3JwlKvSpKDYs
 sd0pjW75BkM1hAar8lrW/TM+TVp5OuMrI10WEFguN+TskyaUZcGI1+8MdEPQsnv1sGPt
 dk283ZnDDTzZjOJq1v0fp6N0Vk60Vx6K3z/Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=kZOaD1B8emphOfywTXzw4uigM54srkRRmu9c5V6NK1A=;
 b=1NQ348ZVcOuC1EXXLe/SPPFKdyQp7fxGa9VV3KgjFmrFekxxXhI/gMqrj31T0XkugG
 RPILjDYci8/AEwRpMROQH8PILAEsafnuomr78+bc9qp0ZpA1xs6hGpQ+aj6URrmxfoVB
 TE0m7Lue7jxCqbVFs/BOKqz+MeGtL0WoanFI6BKQ6wfrkqPv58vm3qZsR8gjgAWrIJis
 mlGgZvfwt6QHJwNyLxPBW2UuKjAxWa4M00lmedTTO/XGbeiTPncDOaViS9hJ6OHLDied
 qK2f9Q9jMYKmuCyRfPcNuVzMvne7vy8wQcx9ljatUTfmpemLPSHFdgohliCX3wXQEIyg
 JS9Q==
X-Gm-Message-State: ACgBeo3kWhRjyaIQHVSCUkO3/DFoiiozyC6acypU0NshBk6hvv6h+Mmy
 Cv+q9c524A6dkJiBxjbWxfVxfQOguNxud2IT
X-Google-Smtp-Source: AA6agR7IMUCFZ3dgjIQVl3c5wI9BXlutzG3Yq1jGBDzrat+5siYaeXaWXUU2UMfR7XiA2eFppONTFw==
X-Received: by 2002:a05:6000:81d:b0:226:dbad:1699 with SMTP id
 bt29-20020a056000081d00b00226dbad1699mr5622520wrb.212.1661870990105; 
 Tue, 30 Aug 2022 07:49:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4848000000b00226d01a4635sm9805359wrs.35.2022.08.30.07.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 07:49:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] tty/vt: Add console_lock check to vt_console_print()
Date: Tue, 30 Aug 2022 16:49:45 +0200
Message-Id: <20220830144945.430528-1-daniel.vetter@ffwll.ch>
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
Cc: Petr Mladek <pmladek@suse.com>, Yangxi Xiang <xyangxi5@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, nick black <dankamongmen@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Steven Rostedt <rostedt@goodmis.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm scratching my head why we have this printing_lock. Digging through
historical git trees shows that:
- Added in 1.1.73, and I found absolutely no reason why.
- Converted to atomic bitops in 2.1.125pre2, I guess as part of SMP
  enabling/bugfixes.
- Converted to a proper spinlock in b0940003f25d ("vt: bitlock fix")
  because the hand-rolled atomic version lacked necessary memory
  barriers.

Digging around in lore for that time period did also not shed further
light.

The only reason I think this might still be relevant today is that (to
my understanding at least, ymmv) during an oops we might be printing
without console_lock held. See console_flush_on_panic() and the
comments in there - we flush out the console buffers irrespective of
whether we managed to acquire the right locks.

The strange thing is that this reason is fairly recent, because the
console flushing was historically done without oops_in_progress set.
This only changed in c7c3f05e341a ("panic: avoid deadlocks in
re-entrant console drivers"), which removed the call to
bust_spinlocks(0) (which decrements oops_in_progress again) before
flushing out the console (which back then was open coded as a
console_trylock/unlock pair).

Note that this entire mess should be properly fixed in the
printk/console layer, and not inflicted on each implementation.

For now just document what's going on and check that in all other
cases callers obey the locking rules.

v2: WARN_CONSOLE_UNLOCKED already checks for oops_in_progress
(something else that should be fixed I guess), hence remove the
open-coded check I've had.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
Cc: Yangxi Xiang <xyangxi5@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: nick black <dankamongmen@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
--
Note that this applies on top of my earlier vt patch:

https://lore.kernel.org/lkml/20220826202419.198535-1-daniel.vetter@ffwll.ch/

Expect more, I'm digging around in here a bit ...
-Daniel
---
 drivers/tty/vt/vt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 4d29e4a17db7..a6be32798fad 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3083,7 +3083,9 @@ static void vt_console_print(struct console *co, const char *b, unsigned count)
 	ushort start_x, cnt;
 	int kmsg_console;
 
-	/* console busy or not yet initialized */
+	WARN_CONSOLE_UNLOCKED();
+
+	/* this protects against concurrent oops only */
 	if (!spin_trylock(&printing_lock))
 		return;
 
-- 
2.37.2

