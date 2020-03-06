Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE817C5B2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 19:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCE56E4E8;
	Fri,  6 Mar 2020 18:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC366E4E8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 18:52:02 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id y204so2210968vsy.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S5a8cAZiktV+/m/VnQBvIet+YQ7zuiUbnE/m8SyWsgE=;
 b=pixAFbJ9BLxFH9l+54Fq+gnq07mpwC+96hv+Lp9UPpcZOQRisYoxPz5/rCL5RU6osN
 fDRNH/AaU80y6bYxv75qS0dUTI7PhprrIDPuNVC+TlyjEq31IWC9IM9JYFkSTjbyLH0T
 t3QWnhxEOW8h8dugqEcc7rJdEp171BwCNliERCoofFOcaZ+V9IClHdPH/JxqtNJq0U+G
 xKSAqiGjpVWGmpw7gyv1zDzfwUsWlGy93vzF4llvbn1jRT2ynbmLWkENqDiC53FoTG6k
 bXJ+w3WvaJCR+DQcD4OaVGx9jpk2BDxLG6MJOwX6LuYEdr41n8U9LWRIFrPrxGWjEimz
 aIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S5a8cAZiktV+/m/VnQBvIet+YQ7zuiUbnE/m8SyWsgE=;
 b=o4WXaQC1Q5cFuvKyizugO5DLI6NrY85Vs2/yWsfEOyz0yL+zypKBTV7r9BF64y7eQE
 tjtfNrCuQcxy+IoUhIY5s7nyenWDuX2vO1xvMVfRCNQt0S3VxxmkypxTLKYEoirDXHCL
 FLjukmlHZGINBuWEWhKf/tdeg2Mn/48mR6STFtXs3b7rDbNvRYLCT1n0mSFcDPSLrfqu
 cHbjbBhK9Aj4DS/GJ6YmSsgIckqcw6dR14awCegh96zbU1XmKvD/DRmv6uMkNmeC+Cak
 jhTx7a5ODMyROi1O1SiZazfWaVEHLfU+b0Ms6SOzEO0tFWY/9luZUIpLsO2lDkgnfTfj
 fgIQ==
X-Gm-Message-State: ANhLgQ0OlQ1SsXT/tybW66SE7uYHFuJywkYYGgNF/tEjiY9+x3fo5gWS
 GFua6M8dmKr12yON/hDqEz2MBBzQdIc20DSYiON6Ig4CXJs=
X-Google-Smtp-Source: ADFU+vtaq68YAPdUHUoBN1iusTLr6gJqNRRvjTrA1Vin4g14OdPbUQA3OkcWSVi++D/ger9CzvFqidV9oCcmsHVi9tk=
X-Received: by 2002:a05:6102:4ad:: with SMTP id
 r13mr3087262vsa.85.1583520721974; 
 Fri, 06 Mar 2020 10:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <20200306160012.42274b9a@eldfell.localdomain>
In-Reply-To: <20200306160012.42274b9a@eldfell.localdomain>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 6 Mar 2020 18:51:22 +0000
Message-ID: <CACvgo51cC08dqpqfsUddu-EuX+5bxVo70V7vDBohEJAZ_h1kKA@mail.gmail.com>
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

On Fri, 6 Mar 2020 at 14:00, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 19 Feb 2020 13:27:28 +0000
> Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
>
> ...
>
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
>
> Hi,
>
> sorry I had to trim this email harshly, but Google did not want to
> deliver it otherwise.
>
> I agree that being able to drop master without CAP_SYS_ADMIN sounds
> like a good thing.
>
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
>
> I understand the drop master part, because it is needed to get rid of
> apps that accidentally gain DRM master because they were the first one
> to open the DRM device (on a particular VT?). It could happen e.g. if a
> Wayland client is inspecting DRM devices to figure what it wants to
> lease while the user has VT-switched to a text-mode VT, I guess. E.g.
> starting a Wayland VR compositor from a VT for whatever reason.
>
> The set master without CAP_SYS_ADMIN part I don't understand.
>
As you point out application can drop master for various reasons. One
of which may be to say spawn another program which requires master for
_non_ modeset reasons. For example:
 - amdgpu: create a renderer and use the context/process priority override IOCTL
 - vmwgfx: stream claim/unref (amongst others).

Another case to consider is classic X or Wayland compositor. With
CAP_SYS_ADMIN for DROP_MASTER removed, yet retained in SET_MASTER, the
IOCTL will fail. Thus:
 - weston results in frozen session and session switching (have to
force kill weston or sudo loginctl kill-session)
 - depending on the driver, X will work or crash

To make this clearer I'll include //comment sections in the code.

// comment
To ensure the application can reclaim its master status, the tweaked
CAP_SYS_ADMIN handling is needed for both IOCTLs. Otherwise X or
Wayland compositors may freeze or crash as SET_MASTER fails.
// comment


> > + *
> > + * As a result this fixes, the following when using root-less build w/o logind
>
> Why is non-root without any logind-equivalent a use case that should
> work?
>
// comment
Some platforms don't have equivalent (Android, CrOS, some BSDs), yet
root is required _solely_ for DROP/SET MASTER. So tweaking the
requirement sounds perfectly reasonable.
// comment

> Why did DRM set/drop master use to require CAP_SYS_ADMIN in the first
> place?
>
I imagine something else could have been introduced instead. Although
I cannot find any details or discussion on the topic.

> What else happens if we allow DRM set master more than just for
> CAP_SYS_ADMIN?
>
If we're talking about removing CAP_SYS_ADMIN all together:
 - screen scraping by any random application
 - dead trivial way to DoS your compositor


> Does this interact with DRM leasing?
>
> Looks like drmIsMaster() should be unaffected at least:
> https://patchwork.kernel.org/patch/10776525/
>
Correct, both are unaffected. All the leasing IOCTLs happen by the
active true (aka non-lease) master.


> > + * - startx - some drivers work fine regardless
> > + * - weston
> > + * - various compositors based on wlroots
> > + */
> > +static int
> > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > +{
> > +     if (file_priv->pid == task_pid(current) && file_priv->was_master)
> > +             return 0;
>
> In case a helper e.g. logind opens the device, is file_priv->pid then
> referring to logind regardless of what happens afterwards?
>
Correct.

> > +
> > +     if (!capable(CAP_SYS_ADMIN))
> > +             return -EACCES;
> > +
> > +     return 0;
> > +}
> > +
> >  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> >                       struct drm_file *file_priv)
> >  {
> >       int ret = 0;
> >
> >       mutex_lock(&dev->master_mutex);
> > +
> > +     ret = drm_master_check_perm(dev, file_priv);
> > +     if (ret)
> > +             goto out_unlock;
> > +
> >       if (drm_is_current_master(file_priv))
> >               goto out_unlock;
> >
> > @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> >       int ret = -EINVAL;
> >
> >       mutex_lock(&dev->master_mutex);
> > +
> > +     ret = drm_master_check_perm(dev, file_priv);
>
> Why does drop-master need any kind of permission check? Why could it
> not be free for all?
>
Consider the arbitrator usecase - be that logind, Xorg (in ancient
times) or otherwise.

// comment
DROP_MASTER cannot be free for all, as any (say logind) user can:
 - can DoS/crash the arbitrator
 - open the node, become master implicitly and cause issues
// comment

I've added an IGT subtest to ensure this does not happen.

Let me know if I should include anything more to the commit, than the
above comment sections.

Thanks

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
