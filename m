Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0361188405
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 13:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B1389624;
	Tue, 17 Mar 2020 12:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA5689624
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 12:26:18 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t10so13697183vsp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 05:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DjWq76ONUSHKPxxYrnqMkMpnusPy0k0NqZWhPl16sxo=;
 b=MkwEIUX7TBTqZirerMyn21HiCS8tndYW0qMNN8uUsJE6OdPv60acUyCLc3NeuIctzY
 IsMLru9GWnHs1w94McdFsoBa/GE4TO9DM+7dvPi2lQ+pOI0e9p5xG9ak5tPhhFQyEcxy
 Xjri/Qdn8aCwJeVzQASk82UxOd0Rvrst+mJigOegRAWJrPMW8ydouEJTez6SnhK6xyhl
 dwW1davUB3ipKbn1u1u9Lc/osHhQM7H5gc0Vzo8aQt5tab28oU1lhHr4v3e88lCBARXA
 3+h4MrLB+gZMJ/IJcOdzmGPExF0KmpeUlegXYUyd+oT2ztwC34S9t+z2zpXgWAj6wXnU
 er0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DjWq76ONUSHKPxxYrnqMkMpnusPy0k0NqZWhPl16sxo=;
 b=Ivpm6qM5GPT7hnl8UULtOY52ETlhnDN1f26QyInIwRhZDlc4iq72YjKljbq5Alxem+
 8ls86h8/COAQaJ3eG489eMcrMQwkeO5Zr4MZ+NLm5jojdTJWjHxH0ODkIn0J4wIvYTAP
 HOJhmbPiRilqTRYdSae0AEBVyv1LPKDsHAGLK258ROS4cfnK72cceNO14Yi2fnWcJaTA
 OhlJrBIv60j7fU0HYvtecN9m0c8b5Nj6F8sbOFD24StlqdJogCo/cU+0P0Qu5Pl8nDdb
 YJWiShDak6aSPYHoXj8VdDv6C/uM6q+zvs2oS7NkwHzZSmtF3J1dLAQ2NfYWakkIHuUr
 BSzQ==
X-Gm-Message-State: ANhLgQ1AzGDkOY2ROYQ40aYIIpuJR+1b4vcgY0PeP+4Eg9/RoeKpFqSK
 Ljv9+SHEEvSidOTP2sZ1rAErKHm4+b64UUlytqiCG3CX
X-Google-Smtp-Source: ADFU+vvIE0SupujuUy+XzWLd5UtisSOW53d7pyhMfUTiTDKRT7OlNLD1Zj9h/aMp3O6LSJGaKa5PiWZsFYuP7Dy800g=
X-Received: by 2002:a67:8d43:: with SMTP id p64mr3380153vsd.37.1584447977122; 
 Tue, 17 Mar 2020 05:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <CACvgo52MOoRzZjZ_mvmehpachB+Y0D+pXWtd5US6Q1o0JddQsw@mail.gmail.com>
In-Reply-To: <CACvgo52MOoRzZjZ_mvmehpachB+Y0D+pXWtd5US6Q1o0JddQsw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 17 Mar 2020 12:25:16 +0000
Message-ID: <CACvgo53RwqZFcb+Nr0Uk6bMTR-hBSv-rteoy9u_=oiEQaCD1=g@mail.gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Mar 2020 at 18:29, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Wed, 19 Feb 2020 at 13:27, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > This commit reworks the permission handling of the two ioctls. In
> > particular it enforced the CAP_SYS_ADMIN check only, if:
> >  - we're issuing the ioctl from process other than the one which opened
> > the node, and
> >  - we are, or were master in the past
> >
> > This ensures that we:
> >  - do not regress the systemd-logind style of DRM_MASTER arbitrator
> >  - allow applications which do not use systemd-logind to drop their
> > master capabilities (and regain them at later point) ... w/o running as
> > root.
> >
> > See the comment above drm_master_check_perm() for more details.
> >
> > v1:
> >  - Tweak wording, fixup all checks, add igt test
> >
> > Cc: Adam Jackson <ajax@redhat.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Testcase: igt/core_setmaster/master-drop-set-user
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_auth.c  | 62 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_ioctl.c |  4 +--
> >  include/drm/drm_file.h      | 11 +++++++
> >  3 files changed, 75 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index cc9acd986c68..b26986bca271 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
> >                 }
> >         }
> >
> > +       fpriv->was_master = (ret == 0);
> >         return ret;
> >  }
> >
> > @@ -179,12 +180,67 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
> >         return ret;
> >  }
> >
> > +/*
> > + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
> > + * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
> > + * from becoming master and/or failing to release it.
> > + *
> > + * At the same time, the first client (for a given VT) is _always_ master.
> > + * Thus in order for the ioctls to succeed, one had to _explicitly_ run the
> > + * application as root or flip the setuid bit.
> > + *
> > + * If the CAP_SYS_ADMIN was missing, no other client could become master...
> > + * EVER :-( Leading to a) the graphics session dying badly or b) a completely
> > + * locked session.
> > + *
> > + *
> > + * As some point systemd-logind was introduced to orchestrate and delegate
> > + * master as applicable. It does so by opening the fd and passing it to users
> > + * while in itself logind a) does the set/drop master per users' request and
> > + * b)  * implicitly drops master on VT switch.
> > + *
> > + * Even though logind looks like the future, there are a few issues:
> > + *  - using it is not possible on some platforms
> > + *  - applications may not be updated to use it,
> > + *  - any client which fails to drop master* can DoS the application using
> > + * logind, to a varying degree.
> > + *
> > + * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
> > + *
> > + *
> > + * Here we implement the next best thing:
> > + *  - ensure the logind style of fd passing works unchanged, and
> > + *  - allow a client to drop/set master, iff it is/was master at a given point
> > + * in time.
> > + *
> > + * As a result this fixes, the following when using root-less build w/o logind
> > + * - startx - some drivers work fine regardless
> > + * - weston
> > + * - various compositors based on wlroots
> > + */
> > +static int
> > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > +{
> > +       if (file_priv->pid == task_pid(current) && file_priv->was_master)
> > +               return 0;
> > +
> > +       if (!capable(CAP_SYS_ADMIN))
> > +               return -EACCES;
> > +
> > +       return 0;
> > +}
> > +
> >  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> >                         struct drm_file *file_priv)
> >  {
> >         int ret = 0;
> >
> >         mutex_lock(&dev->master_mutex);
> > +
> > +       ret = drm_master_check_perm(dev, file_priv);
> > +       if (ret)
> > +               goto out_unlock;
> > +
> >         if (drm_is_current_master(file_priv))
> >                 goto out_unlock;
> >
> > @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> >         int ret = -EINVAL;
> >
> >         mutex_lock(&dev->master_mutex);
> > +
> > +       ret = drm_master_check_perm(dev, file_priv);
> > +       if (ret)
> > +               goto out_unlock;
> > +
> > +       ret = -EINVAL;
> >         if (!drm_is_current_master(file_priv))
> >                 goto out_unlock;
> >
> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > index 9e41972c4bbc..73e31dd4e442 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -599,8 +599,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
> >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
> >
> > -       DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, DRM_ROOT_ONLY),
> > -       DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, DRM_ROOT_ONLY),
> > +       DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
> > +       DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
> >
> >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
> >         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 19df8028a6c4..c4746c9d3619 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -201,6 +201,17 @@ struct drm_file {
> >          */
> >         bool writeback_connectors;
> >
> > +       /**
> > +        * @was_master:
> > +        *
> > +        * This client has or had, master capability. Protected by struct
> > +        * &drm_device.master_mutex.
> > +        *
> > +        * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
> > +        * client is or was master in the past.
> > +        */
> > +       bool was_master;
> > +
> >         /**
> >          * @is_master:
> >          *
> > --
> > 2.25.0
> >
>
> Humble poke?
>
Another humble poke?

Daniel you seemed on the fence for the RFC.
With the questions raised by Pekka and addressed by yours truly, can
you please review this patch?

The IGT tests have been in the i915-CI for a while now.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
