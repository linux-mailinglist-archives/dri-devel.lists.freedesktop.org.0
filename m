Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4CE2DE73F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 17:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA56E1F7;
	Fri, 18 Dec 2020 16:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F28E6E200
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 16:10:34 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E453C23B6C;
 Fri, 18 Dec 2020 16:10:32 +0000 (UTC)
Date: Fri, 18 Dec 2020 11:10:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: WARNING: suspicious RCU usage in modeset_lock
Message-ID: <20201218111031.226f8b59@gandalf.local.home>
In-Reply-To: <CAKMK7uH1agVS=e245b=25Lv9Q+u5c7=KL-_NF8Hte10nKTqAXw@mail.gmail.com>
References: <000000000000cb6db205b68a971c@google.com>
 <CAKMK7uEiS5SrBYv-2w2wWL=9G4ByoHvtiWVsPqekswZzOGmzjg@mail.gmail.com>
 <20201216161621.GH2657@paulmck-ThinkPad-P72>
 <CAKMK7uH1agVS=e245b=25Lv9Q+u5c7=KL-_NF8Hte10nKTqAXw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 syzbot <syzbot+972b924c988834e868b2@syzkaller.appspotmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Josh Triplett <josh@joshtriplett.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, rcu@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Dec 2020 11:03:20 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> I think we're tripping over the might_sleep() all the mutexes have,
> and that's not as good as yours, but good enough to catch a missing
> rcu_read_unlock(). That's kinda why I'm baffled, since like almost
> every 2nd function in the backtrace grabbed a mutex and it was all
> fine until the very last.
> 
> I think it would be really nice if the rcu checks could retain (in
> debugging only) the backtrace of the outermost rcu_read_lock, so we
> could print that when something goes wrong in cases where it's leaked.
> For normal locks lockdep does that already (well not full backtrace I
> think, just the function that acquired the lock, but that's often
> enough). I guess that doesn't exist yet?
> 
> Also yes without reproducer this is kinda tough nut to crack.

I'm looking at drm_client_modeset_commit_atomic(), where it triggered after
the "retry:" label, which to get to, does a bit of goto spaghetti, with
a -EDEADLK detected and a goto backoff, which calls goto retry, and then
the next mutex taken is the one that triggers the bug.

As this is hard to reproduce, but reproducible by a fuzzer, I'm guessing
there's some error return path somewhere in there that doesn't release an
rcu_read_lock().

-- Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
