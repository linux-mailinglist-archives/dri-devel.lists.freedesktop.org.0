Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4775A9FDF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 21:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA6310E0ED;
	Thu,  1 Sep 2022 19:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282B10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 19:26:38 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11eb44f520dso29788598fac.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 12:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=nUFKb0lwuoJnPBzhuuDRyGpS99t7DT6AsET+CKwieMQ=;
 b=kab0/IS7ZlINDcHCLmc50JrBFqemoC73endhL3ZpKsJ3xs4hicL9pGZtRgbHUVZHJ6
 9Np79qggyerdPcGnJ463kP4VGbE1WVilQH4gI8q2W09RSjHrThq5srLUj2g4yBnjXSbb
 kdcWybUERjlnw69YdIO9w2hmaYZltUrxsDfxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nUFKb0lwuoJnPBzhuuDRyGpS99t7DT6AsET+CKwieMQ=;
 b=N5Rtx60v9xS7H350oiYV5qwNO1sK0o61WsYWp6/Q2MNJoHpsKbRhnoVBrfnlLxqRoY
 BiSWde/YP1P0I0W3CrbfEY3pOHUpc/h2/a/jxTPWXyZ153OPzsI0CAnyp6AVM2/3A1j2
 cQIeqV+76hxOO+P+s8kkwZ2ScUTfD7hDIz2tz1NmvwfuE+HHtcI78oleUa5Yp5rpiFUd
 UWCZWI+JlhWZMJtlsnbuSeqvOA1jnsaJRYfaTcErAcjI6aDZQ6kQlToxVixdXU0CyrLU
 cyXpxSaOzgeHiRIC9Aeh0J+S+lEae+53F7PK38OMfEO1jYfLBjkkfvnRm9svAGb0LJXC
 5wsw==
X-Gm-Message-State: ACgBeo1WVkpfn9A6CJ2hsCNBmrtEaZHk4n4slK7TnNxVcwvSnLMINRqz
 hv6W7c7JH01odvd94DL9lyqtLW+HNhW2tKMa3sT65A==
X-Google-Smtp-Source: AA6agR76Qx1UhZamCUF7S9TUTYDl6xeDAqqmTX5Bo6k+e7Hx34+fSOeUvrMaPFePMLZcsKk4Dq+ttY1jW3moMxdkm/k=
X-Received: by 2002:a54:448a:0:b0:344:99d1:1578 with SMTP id
 v10-20020a54448a000000b0034499d11578mr325859oiv.7.1662060398178; Thu, 01 Sep
 2022 12:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220830145004.430545-1-daniel.vetter@ffwll.ch>
 <YxCY57DmFfTuHs1q@alley>
In-Reply-To: <YxCY57DmFfTuHs1q@alley>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 1 Sep 2022 21:26:27 +0200
Message-ID: <CAKMK7uFwJumoLCddSxtd=tPoV1xLFw5uCWpY+WDtiRC=fiSedg@mail.gmail.com>
Subject: Re: [PATCH] kernel/panic: Drop unblank_screen call
To: Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Yangxi Xiang <xyangxi5@gmail.com>, Marco Elver <elver@google.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 John Ogness <john.ogness@linutronix.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 nick black <dankamongmen@gmail.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Luis Chamberlain <mcgrof@kernel.org>, David Gow <davidgow@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, tangmeng <tangmeng@uniontech.com>,
 Jiri Slaby <jirislaby@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Sept 2022 at 13:35, Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2022-08-30 16:50:04, Daniel Vetter wrote:
> > console_unblank() does this too (called in both places right after),
> > and with a lot more confidence inspiring approach to locking.
> >
> > Reconstructing this story is very strange:
> >
> > In b61312d353da ("oops handling: ensure that any oops is flushed to
> > the mtdoops console") it is claimed that a printk(" "); flushed out
> > the console buffer, which was removed in e3e8a75d2acf ("[PATCH]
> > Extract and use wake_up_klogd()"). In todays kernels this is done way
> > earlier in console_flush_on_panic with some really nasty tricks. I
> > didn't bother to fully reconstruct this all, least because the call to
> > bust_spinlock(0); gets moved every few years, depending upon how the
> > wind blows (or well, who screamed loudest about the various issue each
> > call site caused).
> >
> > Before that commit the only calls to console_unblank() where in s390
> > arch code.
> >
> > The other side here is the console->unblank callback, which was
> > introduced in 2.1.31 for the vt driver. Which predates the
> > console_unblank() function by a lot, which was added (without users)
> > in 2.4.14.3. So pretty much impossible to guess at any motivation
> > here. Also afaict the vt driver is the only (and always was the only)
> > console driver implementing the unblank callback, so no idea why a
> > call to console_unblank() was added for the mtdooops driver - the
> > action actually flushing out the console buffers is done from
> > console_unlock() only.
>
> My understanding is that mtdoops is not a real console. The commit
> 4b23aff083649eafa141 ("[MTD] oops and panic message logging to MTD
> device") suggests that it was just (mis)using the console
> infrastructure.
>
> The commit 2e386e4bac90554887e73d ("mtd: mtdoops: refactor as a
> kmsg_dumper") converted it to use the new kmsg_dumper API that
> was created for this use case.
>
> So, I would consider all the mtdoops-related changes as a misuse
> of the console API.

Ah, that's a good piece of information that I didn't figure out.

Greg, if you haven't baked in the patch yet, can you perhaps add the
above information from Petr to the commit message?

Thanks, Daniel

>
>
> > Note that as prep for the s390 users the locking was adjusted in
> > 2.5.22 (I couldn't figure out how to properly reference the BK commit
> > from the historical git trees) from a normal semaphore to a trylock.
> >
> > Note that a copy of the direct unblank_screen() call was added to
> > panic() in c7c3f05e341a ("panic: avoid deadlocks in re-entrant console
> > drivers"), which partially inlined the bust_spinlocks(0); call.
> >
> > Long story short, I have no idea why the direct call to unblank_screen
> > survived for so long (the infrastructure to do it properly existed for
> > years), nor why it wasn't removed when the console_unblank() call was
> > finally added. But it makes a ton more sense to finally do that than
> > not - it's just better encapsulation to go through the console
> > functions instead of doing a direct call, so let's dare. Plus it
> > really does not make much sense to call the only unblank
> > implementation there is twice, once without, and once with appropriate
> > locking.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> Nice analyze. The change makes perfect sense from my POV:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Best Regards,
> Petr



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
