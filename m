Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36850229307
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 10:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BE46E44C;
	Wed, 22 Jul 2020 08:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837636E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 08:07:18 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id r8so1130328oij.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DOy7v3hfT/utQT3C9G3K+8RtCzbiTsBHt7vvQa8xceo=;
 b=JPSVdh9idiN0Up4ibzccMsoV86w485WS4bmMB7o8cngcTQKmUWXuOg45HnkCXh7Z9m
 rJ2EnrDrVQMzeE2+3r2zS6sZClAZKnxbEr4gf4Bk2cBwL+KmikN4Zwd3oAeSvowgW33C
 cqwu0LUPOLEili0aFnDflsr7HDOO9Q/+g0zMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DOy7v3hfT/utQT3C9G3K+8RtCzbiTsBHt7vvQa8xceo=;
 b=baeQUIYSv/II1Bv/RyAefJPBMyRQ9Ix9acePE5ZvCcL2F7LbZpW8DmaAdA1R8F7jqi
 gsATnBS7Pq07PfqNiAGnatatxfL3YrRQICCSC6ElHIv6+/rQ4lsP3uHyt19yB36r3q89
 Z9mHtbcCJQ3h14tR1iNFSit0rs218bqkqNi6O/0c7B1woQ054AJWfEaTGXQFrbkfarfg
 ODx+gZLDh0zkOqjXLb45a0dfBQjedCl0lwW8ccbeo+VhkdNQWo1gX3cW1rRKZo3n/w5F
 ocTupo6EBhEprUtgc5AYgb59t37Jsymp6Wtj90dC+QkQiRqdLVK3qr1/N0MzAAUPmhKO
 iQkg==
X-Gm-Message-State: AOAM5330LJ7/s+JuaWT3c4AgJKYcznvjrQ5Davb1qqld+WDubXnhFeJF
 9hjZocLyP9NX/e6ekkpO9RnQBJDEhzQv+CV9xgMxxA==
X-Google-Smtp-Source: ABdhPJzq8mU6U0neT362ppAInRVQZhwjY0sqr8Tk++7PkdwpIPEpXPOOgY91NHX8PUlb02j2SoGhjC2YQxJ8rExyWjQ=
X-Received: by 2002:aca:cc8e:: with SMTP id c136mr6219460oig.128.1595405237785; 
 Wed, 22 Jul 2020 01:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
 <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
 <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
 <20200715151220.GE2571@kadam>
 <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
 <20200716100006.GN3278063@phenom.ffwll.local>
 <b202b74b-6a7b-e2be-2350-72144331303b@i-love.sakura.ne.jp>
 <20200721160836.GA2109047@kroah.com>
In-Reply-To: <20200721160836.GA2109047@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 10:07:06 +0200
Message-ID: <CAKMK7uGtDQKkSJhvr4YrGOmcbfVyTeEvSD-QSoHhUtH8=D856w@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 George Kennedy <george.kennedy@oracle.com>, Dmitry Vyukov <dvyukov@google.com>,
 Jiri Slaby <jslaby@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 6:08 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 16, 2020 at 08:27:21PM +0900, Tetsuo Handa wrote:
> > On 2020/07/16 19:00, Daniel Vetter wrote:
> > > On Thu, Jul 16, 2020 at 12:29:00AM +0900, Tetsuo Handa wrote:
> > >> On 2020/07/16 0:12, Dan Carpenter wrote:
> > >>> I've complained about integer overflows in fbdev for a long time...
> > >>>
> > >>> What I'd like to see is something like the following maybe.  I don't
> > >>> know how to get the vc_data in fbmem.c so it doesn't include your checks
> > >>> for negative.
> > >>
> > >> Yes. Like I said "Thus, I consider that we need more sanity/constraints checks." at
> > >> https://lore.kernel.org/lkml/b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp/ ,
> > >> we want basic checks. That's a task for fbdev people who should be familiar with
> > >> necessary constraints.
> > >
> > > I think the worldwide supply of people who understand fbdev and willing to
> > > work on it is roughly 0. So if someone wants to fix this mess properly
> > > (which likely means adding tons of over/underflow checks at entry points,
> > > since you're never going to catch the driver bugs, there's too many and
> > > not enough people who care) they need to fix this themselves.
> >
> > But I think we can enforce reasonable constraint which is much stricter than Dan's basic_checks()
> > (which used INT_MAX). For example, do we need to accept var->{xres,yres} >= 1048576, for
> > "32768 rows or cols" * "32 pixels per character" = 1045876 and vc_do_resize() accepts only
> > rows and cols < 32768 ?
> >
> > >
> > > Just to avoid confusion here.
> > >
> > >> Anyway, my two patches are small and low cost; can we apply these patches regardless
> > >> of basic checks?
> > >
> > > Which two patches where?
> >
> > [PATCH v3] vt: Reject zero-sized screen buffer size.
> >  from https://lkml.kernel.org/r/20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp
>
> This is now in my tree.
>
> > [PATCH v2] fbdev: Detect integer underflow at "struct fbcon_ops"->clear_margins.
> >  from https://lkml.kernel.org/r/20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp
>
> That should be taken by the fbdev maintainer, but I can take it too if
> people want.

Just missed this weeks pull request train and feeling like not worth
making this an exception (it's been broken forever after all), so
maybe best if you just add this to vt.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also this avoids the impression I know what's going on in fbdev code,
maybe with sufficient abandon from my side someone will pop up who
cares an fixes the bazillion of syzkaller issues we seem to have
around console/vt and everything related.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
