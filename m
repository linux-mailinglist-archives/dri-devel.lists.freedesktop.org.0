Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBDE382CF4
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609D6E956;
	Mon, 17 May 2021 13:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF88F6E956
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:10:30 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 e7-20020a4ad2470000b02902088d0512ceso1449899oos.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAwEga9MsVbe/5u0H4dGqnZ+LwHKVSj8ppgsSx/dwXA=;
 b=OqI9STlkR7u8mi0tTXuV5SyeZialb8aH253QDX1o+zeoCJ+S5gkI85n74dHCZFGZBj
 ciyUa3BieaaWvJ/XofZxNU4eItL61acH6SFLNcUyfjmgkFxOv0X3HqAsEYSRKc8UaEPb
 CR56j6NK/wn5NCcRHFQktnOm55tx52mvWG/RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAwEga9MsVbe/5u0H4dGqnZ+LwHKVSj8ppgsSx/dwXA=;
 b=Vrg1Mke9RdS/cnaSuc+r+4Pc+zRttCtqtTO4tIgYp98s4nlXpDoRpv1JHY1aBCXyA/
 gvNKbju1QV1B8+dKWvDbwDw/mlbxlp/trUo74Fi1DsIqpsVXCScI+Un4cXxbuAgqlSa1
 gi8nCuknCqYaVp1HaGAZgwsQHLHLjSeYeswUe6EXfK3hfKuyNl3HnC2hzwrJByt96L4K
 Q/0tpdqbZ0moy9y7aOK5pjyr74IbGC6Vtu6o0BNDThpt+MSYsNQ4PYToXRbCel65RsaL
 Kh6vtmzPnQO65C5TS7gBxpM2GMyu/khScA4/CmgIoDykSxZPFk0p5KJ9K480IVfs85/2
 yFpw==
X-Gm-Message-State: AOAM531ug/QBK8ndKOL+Dihsbr1lSocQ9tKAJvrMbHI6Zpc/nOB/qPe4
 3IoqNIjx9IrMXpc3Bb1TEBB0gmCguF87404o1zvHjQ==
X-Google-Smtp-Source: ABdhPJzFaSHRb7QuxFF/A3nf7goNfiB9Dxae23DnvcuYbdfw7QRmTBAoqHPvKmf8Utr2ioPitAchQ4NTWof0wYag0JU=
X-Received: by 2002:a4a:8e04:: with SMTP id q4mr1459797ook.28.1621257030052;
 Mon, 17 May 2021 06:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
 <CAKMK7uGLP2zn7LX4ATExA4DLo16shVivSd_W58X-rBZNPSb3_w@mail.gmail.com>
In-Reply-To: <CAKMK7uGLP2zn7LX4ATExA4DLo16shVivSd_W58X-rBZNPSb3_w@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 15:10:19 +0200
Message-ID: <CAKMK7uFfuV1GH7rvTwLCovnWvd0hYXPGbAyYELoX9PqZn3u2gQ@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Colin King <colin.king@canonical.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 3:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 14, 2021 at 10:33 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, May 14, 2021 at 1:25 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> > >
> > >  Overall I think it does make sense to resize the text console at any
> > > time, even if the visible console (VT) chosen is in the graphics mode,
> >
> > It might make sense, but only if we call the function to update the
> > low-level data.
> >
> > Not calling it, and then starting to randomly use the (wrong)
> > geometry, and just limiting it so that it's all within the buffer -
> > THAT does not make sense.
> >
> > So I think your patch is fundamentally wrong. It basically says "let's
> > use random stale incorrect data, but just make sure that the end
> > result is still within the allocated buffer".
> >
> > My patch is at least conceptually sane.
> >
> > An alternative would be to just remove the "vcmode != KD_GRAPHICS"
> > check entirely, and always call con_resize() to update the low-level
> > data, but honestly, that seems very likelty to break something very
> > fundamentally, since it's not how any of fbcon has ever been tested,
>
> Just an aside: I think with fbdev drivers this would go boom, because
> you'd have fbcon interferring with a direct /dev/fb/* user.

Boom here means a bit of screen corruption, because fbcon overdraws
your X sessions. Fixed by the next redraw of X.

> But if your fbdev driver is actually a drm modeset driver, then we
> have additional limitations: If the userspace accesses the display
> through /dev/dri/card0, then the kernel blocks all access through
> /dev/fb/* (including fbcon) to the actual display (it only goes into
> the buffer used for fbdev emulation). And everything would be fine.
>
> Also generally you'd get away with this even in problematic cases,
> since usually you resize your console when looking at it, not when X
> or something else is using your fbdev direct access.
>
> The one thing that's left out here a bit in the cold is userspace
> modeset drivers in X. Those would get hosed. But also, we stopped
> supporting those in at least i915/amd/radeon/nouveau drivers,
> automatically falling back to the fbdev stuff in most cases (with or
> without the drm drivers underneath that), and no one screamed. So
> probably not many users left.

This one could lead to incosistent hw state, which would be worse.

> So I /think/ we could wager this, if it's the least intrusive fix from
> the kernel pov. But it has some risks that we need to revert again if
> we break some of the really old use-cases here.

Cheers, Daniel

> > Another alternative would be to just delay the resize to when vcmode
> > is put back to text mode again. That sounds somewhat reasonable to me,
> > but it's a pretty big thing.
> >
> > But no, your patch to just "knowingly use entirely wrong values, then
> > add a limit check because we know the values are possibly garbage and
> > not consistent with reality" is simply not acceptable.
> >
> >               Linus
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
