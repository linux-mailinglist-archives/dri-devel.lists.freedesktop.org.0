Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FFF17E0E3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 14:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9376E43A;
	Mon,  9 Mar 2020 13:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4A36E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:14:07 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id g21so893475uaj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqCLiPd23R253GfX6Enlt6Ir5rUGhzk7VZWpF4p673o=;
 b=RlMdQxl5lf5uIH1HYJmPevvu4kJ048NfnELy7pB5Tgq7kKuKE4E+md9jx+tWNEw4/A
 Z+r126AKUPusdkIuBvXXzZhSBzU5EdmzLkIrDEy+ZzA0nojQneAnYKw7C4Wo1NU0qUpE
 9siPAl0Fa+jqpL6CCYl/eW3PkxAKgrdOzxgRKayx8knZh/yyZVo8LrprkXj1kwOLJ0ax
 /YKLR433/yIyQ6jnU++G6MFV8B0U951jrYM5VGDijVUkqf/IhqySJBXjQOucZB7n0zA9
 F5mGErlMpcXA8OaRw2OZJOeynSIF8p5pN9SRXzH95IGVG152YfJqfYHkNYcncbqohv5o
 0Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqCLiPd23R253GfX6Enlt6Ir5rUGhzk7VZWpF4p673o=;
 b=Wkc+GOl02+LD9DILJp387Pt9CMBYIFkcnR0s8fC5VK3A8sehgHU7hgx6+MvddqajO6
 tXX2uqhArDEuuv42sXE8WGtUYOfTFcf/aN7qmP0HOFTTtLxYVXhKqFoclh/WZ5PtqrNC
 /T1Zf4bkMcMCXEOiMwoM/x4vuvEnqW1xxFSjuAmUWteyWghsEOAu8wpIfX5F1ChP/qWR
 yr9IyhJQklyFtTnysSil1nyiAbu57/YcXlsQu+A+AxqW+glFSkxT7k4orUvBgS5tm54H
 acjhpmH7eQW69g7BxwGd8ZtxO7mwlpH06sqhQXQYvC2RnFO1EtaReLRlQ8J6kuFVWz4d
 kZ3w==
X-Gm-Message-State: ANhLgQ1nfjLvy6aRhVv+4KH7G/g8iACfrS356yqUNRajDG/cBxjQ0+0z
 Dr4hHgUH9DS56rd5njkpx2wkuUocqRH7nus66qI=
X-Google-Smtp-Source: ADFU+vvh0gD0crB7za6rkEcPQTr6p7UDHnSk7p0JGHbQfYk+U1p6Dgwmh/d71Vh2N67EnDfKojpAzs4utKANBY6UL5U=
X-Received: by 2002:ab0:133:: with SMTP id 48mr5121219uak.69.1583759646437;
 Mon, 09 Mar 2020 06:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <20200306160012.42274b9a@eldfell.localdomain>
 <CACvgo51cC08dqpqfsUddu-EuX+5bxVo70V7vDBohEJAZ_h1kKA@mail.gmail.com>
 <20200309103824.7d106671@eldfell.localdomain>
In-Reply-To: <20200309103824.7d106671@eldfell.localdomain>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 9 Mar 2020 13:13:22 +0000
Message-ID: <CACvgo51TO7ByNWVN880uUZA35zjiwLmHMj3HoXHm6+u--AJ5Zg@mail.gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Mar 2020 at 08:38, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 6 Mar 2020 18:51:22 +0000
> Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > On Fri, 6 Mar 2020 at 14:00, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Wed, 19 Feb 2020 13:27:28 +0000
> > > Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > > From: Emil Velikov <emil.velikov@collabora.com>
> > > >
> > >
> > > ...
> > >
> > > > +/*
> > > > + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
> > > > + * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
> > > > + * from becoming master and/or failing to release it.
> > > > + *
> > > > + * At the same time, the first client (for a given VT) is _always_ master.
> > > > + * Thus in order for the ioctls to succeed, one had to _explicitly_ run the
> > > > + * application as root or flip the setuid bit.
> > > > + *
> > > > + * If the CAP_SYS_ADMIN was missing, no other client could become master...
> > > > + * EVER :-( Leading to a) the graphics session dying badly or b) a completely
> > > > + * locked session.
> > > > + *
> > >
> > > Hi,
> > >
> > > sorry I had to trim this email harshly, but Google did not want to
> > > deliver it otherwise.
> > >
> > > I agree that being able to drop master without CAP_SYS_ADMIN sounds
> > > like a good thing.
> > >
> > > > + *
> > > > + * As some point systemd-logind was introduced to orchestrate and delegate
> > > > + * master as applicable. It does so by opening the fd and passing it to users
> > > > + * while in itself logind a) does the set/drop master per users' request and
> > > > + * b)  * implicitly drops master on VT switch.
> > > > + *
> > > > + * Even though logind looks like the future, there are a few issues:
> > > > + *  - using it is not possible on some platforms
> > > > + *  - applications may not be updated to use it,
> > > > + *  - any client which fails to drop master* can DoS the application using
> > > > + * logind, to a varying degree.
> > > > + *
> > > > + * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
> > > > + *
> > > > + *
> > > > + * Here we implement the next best thing:
> > > > + *  - ensure the logind style of fd passing works unchanged, and
> > > > + *  - allow a client to drop/set master, iff it is/was master at a given point
> > > > + * in time.
> > >
> > > I understand the drop master part, because it is needed to get rid of
> > > apps that accidentally gain DRM master because they were the first one
> > > to open the DRM device (on a particular VT?). It could happen e.g. if a
> > > Wayland client is inspecting DRM devices to figure what it wants to
> > > lease while the user has VT-switched to a text-mode VT, I guess. E.g.
> > > starting a Wayland VR compositor from a VT for whatever reason.
> > >
> > > The set master without CAP_SYS_ADMIN part I don't understand.
> > >
> > As you point out application can drop master for various reasons. One
> > of which may be to say spawn another program which requires master for
> > _non_ modeset reasons. For example:
> >  - amdgpu: create a renderer and use the context/process priority override IOCTL
> >  - vmwgfx: stream claim/unref (amongst others).
>
> Hi,
>
> if none of that is about KMS resources specifically, then to me it
> seems like a mis-design that should be avoided if still possible. DRM
> master is all about modeset, and in my option should be about nothing
> else.
>
> Are those needed to keep existing userspace working?
>
In a perfect world sure. In practical terms - fixing these is less
likely. We have limited time and thou shalt not regress userspace.
About specifics on the individual drivers, I'll refer you to the
respective teams.

>
> > Another case to consider is classic X or Wayland compositor. With
> > CAP_SYS_ADMIN for DROP_MASTER removed, yet retained in SET_MASTER, the
> > IOCTL will fail. Thus:
> >  - weston results in frozen session and session switching (have to
> > force kill weston or sudo loginctl kill-session)
> >  - depending on the driver, X will work or crash
> >
> > To make this clearer I'll include //comment sections in the code.
> >
> > // comment
> > To ensure the application can reclaim its master status, the tweaked
> > CAP_SYS_ADMIN handling is needed for both IOCTLs. Otherwise X or
> > Wayland compositors may freeze or crash as SET_MASTER fails.
> > // comment
>
> A Wayland compositor or Xorg that got DRM master by first-opener up to
> now has not been able to drop DRM master, which means VT switching away
> does not work - does it?
Correct - it does not. Yet the return code of the drmDropMaster is
ignored so the compositor continues working... Somewhat. Weston got
some checks recently IIRC.

> If drop-master succeeded, then VT-switch back
> doesn't work, which in my opinion is VT-switching failing again just in
> a different way.
>
If the drmSetMaster fails (while Drop was successful), you'll get
user-facing issues.
The crash or freeze as mentioned earlier.

> OTOH, if applications exist that rely on drop-master failing in this
> specific case, making drop-master succeed would break them. That might
> include a buggy set-master path that was written, but does not actually
> work because it was never tested since drop-master never worked.
>
> So I do not fully buy this argument yet, but I also cannot name any
> explicit examples that would break.
>
>
I've ventured for a while in the X (Xorg + drivers), Weston,
sway/wlroots and Mesa's codebase.
There were zero instances of such misuse. If other projects come to
mind - I'll gladly take a look.

Based on my observation and the drmDropMaster semantics, inclined to
say the example is purely theoretical.
I'm open to be proven otherwise.

> > > > + *
> > > > + * As a result this fixes, the following when using root-less build w/o logind
> > >
> > > Why is non-root without any logind-equivalent a use case that should
> > > work?
> > >
> > // comment
> > Some platforms don't have equivalent (Android, CrOS, some BSDs), yet
> > root is required _solely_ for DROP/SET MASTER. So tweaking the
> > requirement sounds perfectly reasonable.
> > // comment
>
> For those that use a Linux kernel, I disagree. For those that do not
> use a Linux kernel, how is this relevant?
>
Please elaborate.

Both Android and CrOS use the linux kernel. Because of this issue,
they resort to other hacks or workarounds. There are also
distributions which do not ship logind.

I can see how tempting it is to close our eyes and say "not my
problem", although it's not really respectful IMHO.

>
> > > Why did DRM set/drop master use to require CAP_SYS_ADMIN in the first
> > > place?
> > >
> > I imagine something else could have been introduced instead. Although
> > I cannot find any details or discussion on the topic.
> >
> > > What else happens if we allow DRM set master more than just for
> > > CAP_SYS_ADMIN?
> > >
> > If we're talking about removing CAP_SYS_ADMIN all together:
> >  - screen scraping by any random application
> >  - dead trivial way to DoS your compositor
>
> No, I am asking about your specific proposal here. This is the question
> about which neither of us can see more than we already wrote, so it
> needs someone else to think hard.
>
I see what you mean.

I've explored for potential issues for quite some time and discussed
those with couple of people already.
To our mutual understanding there are no implications or issues that
this patch may cause.

>
> > > Does this interact with DRM leasing?
> > >
> > > Looks like drmIsMaster() should be unaffected at least:
> > > https://patchwork.kernel.org/patch/10776525/
> > >
> > Correct, both are unaffected. All the leasing IOCTLs happen by the
> > active true (aka non-lease) master.
>
> Do you assume that DRM leasing clients (lessee) will not or cannot call
> set-master/drop-master ioctls?
>
> What happens if they do call set/drop master ioctls on a leased DRM file
> description?
>
> After all, the leased DRM file description must be good for modeset
> operations that normally need the real DRM master.
>
The leasing infra acts _internally_ as pseudo master. The whole
set/drop master machinery is a no-op for them.

>
> > > > + * - startx - some drivers work fine regardless
> > > > + * - weston
> > > > + * - various compositors based on wlroots
> > > > + */
> > > > +static int
> > > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > > > +{
> > > > +     if (file_priv->pid == task_pid(current) && file_priv->was_master)
> > > > +             return 0;
> > >
> > > In case a helper e.g. logind opens the device, is file_priv->pid then
> > > referring to logind regardless of what happens afterwards?
> > >
> > Correct.
> >
> > > > +
> > > > +     if (!capable(CAP_SYS_ADMIN))
> > > > +             return -EACCES;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> > > >                       struct drm_file *file_priv)
> > > >  {
> > > >       int ret = 0;
> > > >
> > > >       mutex_lock(&dev->master_mutex);
> > > > +
> > > > +     ret = drm_master_check_perm(dev, file_priv);
> > > > +     if (ret)
> > > > +             goto out_unlock;
> > > > +
> > > >       if (drm_is_current_master(file_priv))
> > > >               goto out_unlock;
> > > >
> > > > @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> > > >       int ret = -EINVAL;
> > > >
> > > >       mutex_lock(&dev->master_mutex);
> > > > +
> > > > +     ret = drm_master_check_perm(dev, file_priv);
> > >
> > > Why does drop-master need any kind of permission check? Why could it
> > > not be free for all?
> > >
> > Consider the arbitrator usecase - be that logind, Xorg (in ancient
> > times) or otherwise.
> >
> > // comment
> > DROP_MASTER cannot be free for all, as any (say logind) user can:
> >  - can DoS/crash the arbitrator
>
> How would this happen?
>
Specifics depend on the arbitrator - I anticipate a use-after-free
being possible. Looking at logind - it seems safe.

Although logind also ignores the return value of drmDropMaster. Hence
a good example where relaxing DROP_MASTER yet, keeping SET_MASTER
as-is is a bad idea.

>
> >  - open the node, become master implicitly and cause issues
>
> How would this follow? Is this not already the case and also remain the
> case even with your changes?
>
Theoretically yes, although a _lot_ harder to pull on in practise.

Today the arbitrator implicitly does the DROP_MASTER on VT switch et
al. The app has to race between the DROP and the VT switch ACK (also
done by the arbitrator).

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
