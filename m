Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97C158548
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 22:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA136E261;
	Mon, 10 Feb 2020 21:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610D6E261
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 21:54:36 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 77so7997825oty.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6TN01GzOeOni8dv2Pua3rcMzfmy3cTDQag9x5yqO0TY=;
 b=Z+vF4GZmwWe+N1J+a++1T9cDvGwp64kBoE9MTLsRQXoSaS2Hbf4p4KqECfafkBkrWe
 73vWEEq2IQvZC5Vz2+LkGxAfFn0qPDURrz3ekMuyO/pSZl+e1HTa7t58J8iyn0KFiijy
 v/yg+KNw+N0j1JE7/GomQt7Nt9pBGNVXoy2PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6TN01GzOeOni8dv2Pua3rcMzfmy3cTDQag9x5yqO0TY=;
 b=SpCMNphjpnL74ZJ/dvn64Jdbx4KRBCRbkqp0qo/bPk3XzThHJhzY27kRWSryLo+Mdz
 HKaHBe+rDQYdcK8vLmFoynGfdRcSybDQzeeg23yBRxs6OJwdpd/8TXgs7V+xObyHEc9k
 Jfl42A+w95Qq2wtdnexv4oUSmP0RH8/5BwqJjbV5h5upH/+MUokbgREUIKP4GW2J64Hb
 0kl87M5u17pkhvyTlmsBRZIJD7xWr4xDrJGubgECuYrzqYXBpzIdSRMPHtaJMEpM0NYw
 /icC0+koEKtX2MzNKdGN6cYPJ7INxkK7TuIRfKhPSDgAzJACnv4STcVjG8FqJ2BoJS1T
 9RsQ==
X-Gm-Message-State: APjAAAUsRnbalSyMfJPzPFtyX5ml1TldJRuoHFkz6ST9wNjv+OerzJVt
 x7SH3t3E7PvkRL2RhY1DJSDN1FyRfridQehqIQ6PYQ==
X-Google-Smtp-Source: APXvYqwGLDYoqgJ25HRfUbxOjLMZQS/9qoaQ4HjasALwA+v7Eiuh6qgB+uIQ3Sfy+lQlf9K6kglv3mbEO5FcmiTL0xM=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr2885716otl.188.1581371675267; 
 Mon, 10 Feb 2020 13:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20200205174839.374658-1-emil.l.velikov@gmail.com>
 <20200207132942.GY43062@phenom.ffwll.local>
 <CACvgo52NO5uOnG5p360nWKiu6Bigs9bgP9x3XKMQ3vfT-APfmQ@mail.gmail.com>
In-Reply-To: <CACvgo52NO5uOnG5p360nWKiu6Bigs9bgP9x3XKMQ3vfT-APfmQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 10 Feb 2020 22:54:23 +0100
Message-ID: <CAKMK7uEoxPf023wuMmSByhBf5c=d9nxSn0rSccv_6e9Yq-JSzQ@mail.gmail.com>
Subject: Re: [RFC] drm: rework SET_MASTER and DROP_MASTER perm handling
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 8:01 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Thanks for having a look Daniel.
>
> On Fri, 7 Feb 2020 at 13:29, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Feb 05, 2020 at 05:48:39PM +0000, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > This commit reworks the permission handling of the two ioctls. In
> > > particular it enforced the CAP_SYS_ADMIN check only, if:
> > >  - we're issuing the ioctl from process other than the one which opened
> > > the node, and
> > >  - we are, or were master in the past
> > >
> > > This allows for any application which cannot rely on systemd-logind
> > > being present (for whichever reason), to drop it's master capabilities
> > > (and regain them at later point) w/o being ran as root.
> > >
> > > See the comment above drm_master_check_perm() for more details.
> > >
> > > Cc: Adam Jackson <ajax@redhat.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > ---
> > > This effectively supersedes an earlier patch [1] incorporating ajax's
> > > feedback (from IRC ages ago).
> > >
> > > [1] https://patchwork.freedesktop.org/patch/268977/
> > > ---
> > >  drivers/gpu/drm/drm_auth.c  | 59 +++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_ioctl.c |  4 +--
> > >  include/drm/drm_file.h      | 11 +++++++
> > >  3 files changed, 72 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index cc9acd986c68..01d9e35c0106 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
> > >               }
> > >       }
> > >
> > > +     fpriv->was_master = (ret == 0);
> > >       return ret;
> > >  }
> > >
> > > @@ -179,12 +180,64 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
> > >       return ret;
> > >  }
> > >
> > > +/*
> > > + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
> > > + * CAP_SYS_ADMIN was not set.
> > > + *
> > > + * Even though the first client is _always_ master, it also had to be run as
> > > + * root, otherwise SET/DROP_MASTER would fail. In those cases no other client
> > > + * could become master ... EVER.
> > > + *
> > > + * Resulting in a) the graphics session dying badly or b) a completely locked
> > > + * session :-\
> > > + *
> > > + * As some point systemd-logind was introduced to orchestrate and delegate
> > > + * master as applicable. It does so by opening the fd and passing it to users
> > > + * while in itself logind a) set/drop master per users' request and b)
> > > + * implicitly drops master on VT switch.
> > > + *
> > > + * Even though logind looks like the future, there are a few obstacles:
> > > + *  - using it is not possible on some platforms, or
> > > + *  - applications may not be updated to use it,
> > > + *  - any client which fails to drop master* can DoS the application using
> > > + * logind, to a varying degree.
> > > + *
> > > + * * Either due missing root permission or simply not calling DROP_MASTER.
> > > + *
> > > + *
> > > + * Here we implement the next best thing:
> > > + *   We enforce the CAP_SYS_ADMIN check only if the client was not a master
> > > + * before. We distinguish between the original master client (say logind) and
> > > + * another client which has the fd passed (say Xorg) by comparing the pids.
> > > + *
> > > + * As a result this fixes, the following when using root-less build w/o logind
> > > + * - startx - some drivers work fine regardless
> > > + * - weston
> > > + * - various compositors based on wlroots
> > > + */
> >
> > I think this breaks logind security. With logind no compositor can open
> > the device node directly, hence no compositor can accidentally become the
> > master and block everyone else.
> >
> I've explicitly considered this case. AFAICT this patch does not
> change any of the contract.
> If you think there's a scenario where things have broken, please let me know.
>
> > And for the vt switch logind is the only one that can grant master rights,
> > and it can make sure that the right compositor gets them. And if the old
> > compositor is non-cooperating, it can also forcefully remove master
> > rights.
> >
> Yes logind does set/drop master on VT switch, session setup/teardown, etc.
>
> To take this a step further, there is no logind API or dbus method for
> compositors to only set/drop master.
> Thus logind ensures that compositors are in sane state.
>
> > But with this here we lift this restriction if a compositor has ever been
> > master. So the following thing could happen:
> > - We have 3 compositors for different users C1, C2, C3
> > - We switch from C1 to C2
> > - While we switch no one is master for a moment, which means C3 could
> >   sneak in and do a quick setmaster, and become master
> > - Everything would come crashing done since logind believes it already
> >   revoked master for C1, but somehow it now cant grant master to C2
> >
> Does this scenario consider that all three compositors are logind users?
> If so, C3 should not be able to set or drop master. Since it got its
> fd from logind:
>
>  - `file_priv->pid` will point to systemd-logind, and
>  - `task_pid(current)` will point to the respective compositor
>
> -> EACCES will be returned to any compositor calling drmSetMaster.
>
> Regardless of my patch, C3 can open() and simply not release the master.
> Assuming it's the first DRM client of course - say switch to VTx +
> login + start C3.

Hm ... I guess this works indeed. Or should. I'm mildly freaked out
that we're checking for opener_pid == current->pid. Not sure how many
other security assumptions we're breaking.

> I've been lucky enough to spot various ways to softlock my system...
> even when the compositor is using logind ;-)
> If you're really interested I can share, but I'm worried that people
> may see them as bashing at logind.
>
> > I'm not sure we can even support these two models at the same time.
> >
> > > +static int
> > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > > +{
> > > +     if (file_priv->pid != task_pid(current) && file_priv->was_master)
> >
> > Isn't this a typo? Why should we only allow this if the opener is someone
> > else ... that looks like the logind approach? Or is my bolean logic parser
> > broken again.
> >
> Thanks for spotting it. Indeed that should be:
>
> if (file_priv->pid == task_pid(current) && file_priv->was_master)
>     return 0;
>
>
> Modulo any objections, I'll do proper testing and submit a non RFC version.
> The inline comments will explicitly mention your concerns and why the
> patch is safe.

Given the above bug I think a solid igt for both the logind and the
non-logind scenario is needed. We have some helpers to drop root and
fork stuff and all that, so shouldn't be many lines.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
