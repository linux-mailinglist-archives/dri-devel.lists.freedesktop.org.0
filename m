Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83C18A303
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 20:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496436E94D;
	Wed, 18 Mar 2020 19:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0E6E94D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 19:14:49 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k18so27038742oib.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tirqn28qWGiRm0ZsAmx5tHN1Z8cYZCNbITbhp7kGX0k=;
 b=SoqEl3isJxQcL3J/ZG0AmKpQhXBz2onp9UAcroE4AxFINyWRlQYzdt2Ac9iDqLkgu3
 Y2wy2YqlNrAx5yFGkIRYSSAgTeQfkJmiywrEhdWg+ogPzfmuUGrxRvF8/c3GA4W3feUy
 E29WuUo3arfAFc/eCZ970Ym0o/OKzzfbbeYBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tirqn28qWGiRm0ZsAmx5tHN1Z8cYZCNbITbhp7kGX0k=;
 b=dmJlihFydbJ8LjE/GhYXdDr/1yZ5ARqt7cj3WdaR6J212kP0FnEmmts41y7Y9J/0iS
 0stmsOIFnU4D8ljTue+mRAzXLWYDPPkZWNo4KhC6gN3gF5Wa488wlEzJ5+hS3IYl5LJr
 3FMhJly1bl5Lz2EDNkYYz9JzDeLIRTuOrKho2pL9e56SjlK8mY4q5llHU4JM4LN+XSuJ
 q3bxTVFY5kmRFXyCxsOe1Yjqs/TWl7rBygtn0By2mIs/X97jLMar0PuuG2LauZfHMtD/
 KRG4KeqZSOpIySluQxqFlqx1Z19CZHKU5pdUXb07/siyEvaLDotWPMdAD1YoVH/bs3Kw
 vM+g==
X-Gm-Message-State: ANhLgQ11+Nccjfw0h/OHynYwm3f/rqxRZPH2GcxpUHz4L7JGUSl2MNJV
 jsKbVfoe7HpdCcppOuy7xofRXo/Ktnre6y+Z2Pfd5uo5/Sc=
X-Google-Smtp-Source: ADFU+vs3L/QsU1v8R6LT3iJx4bmPEDoOXEc3hAR9iWEv8DVHvy3G5+6mKNBDtw3DW2QVwyHjXsWf2FrxPwABH1g70zA=
X-Received: by 2002:aca:aac1:: with SMTP id t184mr4463065oie.14.1584558888658; 
 Wed, 18 Mar 2020 12:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <CACvgo52MOoRzZjZ_mvmehpachB+Y0D+pXWtd5US6Q1o0JddQsw@mail.gmail.com>
 <CACvgo53RwqZFcb+Nr0Uk6bMTR-hBSv-rteoy9u_=oiEQaCD1=g@mail.gmail.com>
In-Reply-To: <CACvgo53RwqZFcb+Nr0Uk6bMTR-hBSv-rteoy9u_=oiEQaCD1=g@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 18 Mar 2020 20:14:37 +0100
Message-ID: <CAKMK7uFb9xKEhkqq0uc34pW2_6KXg2vC-C=HO8ztUAc-pkOaGA@mail.gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
To: Emil Velikov <emil.l.velikov@gmail.com>, Jesse Barnes <jsbarnes@google.com>,
 Sean Paul <sean@poorly.run>
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

On Tue, Mar 17, 2020 at 1:26 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Mon, 2 Mar 2020 at 18:29, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > On Wed, 19 Feb 2020 at 13:27, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > This commit reworks the permission handling of the two ioctls. In
> > > particular it enforced the CAP_SYS_ADMIN check only, if:
> > >  - we're issuing the ioctl from process other than the one which opened
> > > the node, and
> > >  - we are, or were master in the past
> > >
> > > This ensures that we:
> > >  - do not regress the systemd-logind style of DRM_MASTER arbitrator
> > >  - allow applications which do not use systemd-logind to drop their
> > > master capabilities (and regain them at later point) ... w/o running as
> > > root.
> > >
> > > See the comment above drm_master_check_perm() for more details.
> > >
> > > v1:
> > >  - Tweak wording, fixup all checks, add igt test
> > >
> > > Cc: Adam Jackson <ajax@redhat.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Testcase: igt/core_setmaster/master-drop-set-user
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_auth.c  | 62 +++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_ioctl.c |  4 +--
> > >  include/drm/drm_file.h      | 11 +++++++
> > >  3 files changed, 75 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index cc9acd986c68..b26986bca271 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
> > >                 }
> > >         }
> > >
> > > +       fpriv->was_master = (ret == 0);
> > >         return ret;
> > >  }
> > >
> > > @@ -179,12 +180,67 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
> > >         return ret;
> > >  }
> > >
> > > +/*
> > > + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
> > > + * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
> > > + * from becoming master and/or failing to release it.
> > > + *
> > > + * At the same time, the first client (for a given VT) is _always_ master.
> > > + * Thus in order for the ioctls to succeed, one had to _explicitly_ run the
> > > + * application as root or flip the setuid bit.
> > > + *
> > > + * If the CAP_SYS_ADMIN was missing, no other client could become master...
> > > + * EVER :-( Leading to a) the graphics session dying badly or b) a completely
> > > + * locked session.
> > > + *
> > > + *
> > > + * As some point systemd-logind was introduced to orchestrate and delegate
> > > + * master as applicable. It does so by opening the fd and passing it to users
> > > + * while in itself logind a) does the set/drop master per users' request and
> > > + * b)  * implicitly drops master on VT switch.
> > > + *
> > > + * Even though logind looks like the future, there are a few issues:
> > > + *  - using it is not possible on some platforms
> > > + *  - applications may not be updated to use it,
> > > + *  - any client which fails to drop master* can DoS the application using
> > > + * logind, to a varying degree.
> > > + *
> > > + * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
> > > + *
> > > + *
> > > + * Here we implement the next best thing:
> > > + *  - ensure the logind style of fd passing works unchanged, and
> > > + *  - allow a client to drop/set master, iff it is/was master at a given point
> > > + * in time.
> > > + *
> > > + * As a result this fixes, the following when using root-less build w/o logind
> > > + * - startx - some drivers work fine regardless
> > > + * - weston
> > > + * - various compositors based on wlroots
> > > + */
> > > +static int
> > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > > +{
> > > +       if (file_priv->pid == task_pid(current) && file_priv->was_master)
> > > +               return 0;
> > > +
> > > +       if (!capable(CAP_SYS_ADMIN))
> > > +               return -EACCES;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> > >                         struct drm_file *file_priv)
> > >  {
> > >         int ret = 0;
> > >
> > >         mutex_lock(&dev->master_mutex);
> > > +
> > > +       ret = drm_master_check_perm(dev, file_priv);
> > > +       if (ret)
> > > +               goto out_unlock;
> > > +
> > >         if (drm_is_current_master(file_priv))
> > >                 goto out_unlock;
> > >
> > > @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> > >         int ret = -EINVAL;
> > >
> > >         mutex_lock(&dev->master_mutex);
> > > +
> > > +       ret = drm_master_check_perm(dev, file_priv);
> > > +       if (ret)
> > > +               goto out_unlock;
> > > +
> > > +       ret = -EINVAL;
> > >         if (!drm_is_current_master(file_priv))
> > >                 goto out_unlock;
> > >
> > > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > > index 9e41972c4bbc..73e31dd4e442 100644
> > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > @@ -599,8 +599,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
> > >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> > >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
> > >
> > > -       DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, DRM_ROOT_ONLY),
> > > -       DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, DRM_ROOT_ONLY),
> > > +       DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
> > > +       DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
> > >
> > >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
> > >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > index 19df8028a6c4..c4746c9d3619 100644
> > > --- a/include/drm/drm_file.h
> > > +++ b/include/drm/drm_file.h
> > > @@ -201,6 +201,17 @@ struct drm_file {
> > >          */
> > >         bool writeback_connectors;
> > >
> > > +       /**
> > > +        * @was_master:
> > > +        *
> > > +        * This client has or had, master capability. Protected by struct
> > > +        * &drm_device.master_mutex.
> > > +        *
> > > +        * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
> > > +        * client is or was master in the past.
> > > +        */
> > > +       bool was_master;
> > > +
> > >         /**
> > >          * @is_master:
> > >          *
> > > --
> > > 2.25.0
> > >
> >
> > Humble poke?
> >
> Another humble poke?
>
> Daniel you seemed on the fence for the RFC.
> With the questions raised by Pekka and addressed by yours truly, can
> you please review this patch?

Just wanted to make sure the igt are address and things look
reasonable for uapi. Jesse just pinged me on irc that CrOS wants
this/needs this, I think best if one of the cros people (we should
have a bunch here) reviews this and then you can push it.

> The IGT tests have been in the i915-CI for a while now.

Yeah thanks a lot for doing that.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
