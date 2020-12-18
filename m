Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63F2DE766
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 17:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CCC6E204;
	Fri, 18 Dec 2020 16:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97AF6E204
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 16:24:06 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id o11so2408601ote.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QqQbpFMD6dkYLibiVClg3d7g7y7tRyurb1/VW+ic+G0=;
 b=MhcTzhtSsPXPCXJbfWKHsmWz86Veki87y6eADP+xTqJnN5ZPTGjxAb4fDGzbH4YBLt
 WjUjiYEfSKD7mmKYTplE11kGtdoITHmq58NPUS4k5ZNNp3GzDUpJfij4bNl6906lglYy
 wUVxADPIm1LYqZIpXEf+CWX27BGN6+uVe+kpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QqQbpFMD6dkYLibiVClg3d7g7y7tRyurb1/VW+ic+G0=;
 b=ILvi+wcwDQrU675hucTTWpnGGNGCaZ9IPrjndShSB2KKqFh+fd8RO2ht0yKvbcfByS
 1jEh8JpvvG2lLF+bbTwLindwVorX03/6QqYVlvLzLPLZmMNhDMvW14mITdSCMCtiUVm9
 c56mP+ofFI9lqdm5+9DNblZcYnrFJGmYozp9f94nnTdz1LwyFx+vDdxpiKLnJ5H87dUU
 MATQm9AL1214MFPwC7FiVrMGMEIUm2rUdzFeedEtLSXix3w+gESvKBAe0rjJC51bNGFG
 1UxVzIpJYHZCfX6vo4s0ZFS/cuOy7SCnXZdlzm914C/Re9m2MQufsi9yKkYZGV+k4bL/
 8CBg==
X-Gm-Message-State: AOAM530V5lgQq3Jt78mhkG1DHUcb/Kj7MzfrtlhDgs7KJ1Wn9LuKZryK
 wW9XZHvvUxVXcbMjBrOYSj4yi0UAKRm6UyGRZ8W6sg==
X-Google-Smtp-Source: ABdhPJwcCzLk4SZo7l5u4xEQ9jFcCgTViVhvgvQnWJwu13ClsiUz4ogGyWTFmuZasY2Lmv3ZnmkKKq/LXncK/+CK+t0=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr3434686otb.281.1608308646236; 
 Fri, 18 Dec 2020 08:24:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000cb6db205b68a971c@google.com>
 <CAKMK7uEiS5SrBYv-2w2wWL=9G4ByoHvtiWVsPqekswZzOGmzjg@mail.gmail.com>
 <20201216161621.GH2657@paulmck-ThinkPad-P72>
 <CAKMK7uH1agVS=e245b=25Lv9Q+u5c7=KL-_NF8Hte10nKTqAXw@mail.gmail.com>
 <20201218111031.226f8b59@gandalf.local.home>
In-Reply-To: <20201218111031.226f8b59@gandalf.local.home>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 18 Dec 2020 17:23:55 +0100
Message-ID: <CAKMK7uEOojWe=KEAkdor4fqWh8=Q6wZTYRNBPWaACaen-iyi0Q@mail.gmail.com>
Subject: Re: WARNING: suspicious RCU usage in modeset_lock
To: Steven Rostedt <rostedt@goodmis.org>
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

On Fri, Dec 18, 2020 at 5:10 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 17 Dec 2020 11:03:20 +0100
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > I think we're tripping over the might_sleep() all the mutexes have,
> > and that's not as good as yours, but good enough to catch a missing
> > rcu_read_unlock(). That's kinda why I'm baffled, since like almost
> > every 2nd function in the backtrace grabbed a mutex and it was all
> > fine until the very last.
> >
> > I think it would be really nice if the rcu checks could retain (in
> > debugging only) the backtrace of the outermost rcu_read_lock, so we
> > could print that when something goes wrong in cases where it's leaked.
> > For normal locks lockdep does that already (well not full backtrace I
> > think, just the function that acquired the lock, but that's often
> > enough). I guess that doesn't exist yet?
> >
> > Also yes without reproducer this is kinda tough nut to crack.
>
> I'm looking at drm_client_modeset_commit_atomic(), where it triggered after
> the "retry:" label, which to get to, does a bit of goto spaghetti, with
> a -EDEADLK detected and a goto backoff, which calls goto retry, and then
> the next mutex taken is the one that triggers the bug.

This is standard drm locking spaghetti using ww_mutexes. Enable
CONFIG_DEBUG_WW_MUTEX_SLOWPATH and you'll hit this all the time, in
all kinds of situations. We're using this all the time because it's
way too easy to to get the error cases wrong.

> As this is hard to reproduce, but reproducible by a fuzzer, I'm guessing
> there's some error return path somewhere in there that doesn't release an
> rcu_read_lock().

We're maybe a bit too happy to use funny locking schemes like
ww_mutex, but at least to my knowledge there's no rcu anywhere near
these. Or preempt disable fwiw (which I think the consensus is the
more likely culprit). So I have no idea how this leaks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
