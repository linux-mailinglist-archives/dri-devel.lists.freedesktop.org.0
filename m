Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B23EAB5B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F396E466;
	Thu, 12 Aug 2021 19:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F56B6E466
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 19:51:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v2so1099642edq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=joPZ6dol5VkAv6F3K92Os9XZIN2li9QRyV1Q1ZnWYR0=;
 b=YtS8rQKhxyRC9UElHOPBaFBILfiijTV1wf51L2QQFx8u1n/jtrbI6fD0SCkrqvyTJf
 ke4x1ftb+i2gAJ7TuO7xkc7iLwNxVgVYWYqpGUcA4FHz32ZPrzNU2g64x36BrjX8rErv
 +OUkVSxURWAl40eXKb/BWnSwmaQ0mkf98KD6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=joPZ6dol5VkAv6F3K92Os9XZIN2li9QRyV1Q1ZnWYR0=;
 b=oIHc1kW3kzdhb0XiFyvPLAr8kXgJMrpQaCFeZpuwaLoOK4P5yEN0+WBdChfgZGfa+p
 xt5C5zE5J3+2M2TpXqhYMRdarlUWh7hN1cAx98HFnP+QO6WMfmMFbNuqYXnUm/QaKRBz
 7Jkw7F4c2iCYYiBMIobSjbkjlMClvquVI7un84i/DWmCv2hAjRwKTILQj7VyIPnEnN+9
 FRTCKy9eLxLq4AH9+6C6FJfexa9Al5ZKe3qRwSmHgrxB23DdsmlEp6D1sVMglGm7vf7E
 2Kl6VXirACEk7W95JVhctrRr0xnZoHnakl39NRpWpHxtYmhSB+bB+s+AR5eeCy7DRsFn
 SaWg==
X-Gm-Message-State: AOAM5307Ql2nkLiKsAXygHAuHyPrYAEeyICOiq2+dUCjO7cTj1OdW7N8
 giUWk8NVeFBn/2EW3T4nSD6zB7agMUHejOvcitDTxOoePNwzZ2pX
X-Google-Smtp-Source: ABdhPJw5K9NQn869OgQPz5KmdRaafJ1/7j22i3pcOxwE9rlpeg1pNoomZgC5J3UJvsY60raNuMhMzzgTDsNHo9wsgCc=
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr7654436edd.330.1628797890102; 
 Thu, 12 Aug 2021 12:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210811175525.2125964-1-markyacoub@chromium.org>
 <de7e8dc0-b73d-f6c2-e017-121b5dc0df83@daenzer.net>
In-Reply-To: <de7e8dc0-b73d-f6c2-e017-121b5dc0df83@daenzer.net>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 12 Aug 2021 15:51:19 -0400
Message-ID: <CAJUqKUpCPUdDoJZFm5xfNXjTUKna7TyEsEO_8Cv6uf6ok1p7PA@mail.gmail.com>
Subject: Re: [PATCH] drm: Copy drm_wait_vblank request and copy_to_user before
 return.
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org, 
 Rob Clark <robdclark@chromium.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 12, 2021 at 5:26 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-08-11 7:55 p.m., Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Userspace should get back a copy of the request that's been modified
> > even when drm_wait_vblank_ioctl returns a failure.
> >
> > Rationale:
> > drm_wait_vblank_ioctl modifies the request and expects the user to read
> > back. When the type is RELATIVE, it modifies it to ABSOLUTE and updates
> > the sequence to become current_vblank_count + sequence (which was
> > relative), not it becomes absolute.
> > drmWaitVBlank (in libdrm), expects this to be the case as it modifies
> > the request to be Absolute as it expects the sequence to would have bee=
n
> > updated.
> >
> > The change is in compat_drm_wait_vblank, which is called by
> > drm_compat_ioctl. This change of copying the data back regardless of th=
e
> > return number makes it en par with drm_ioctl, which always copies the
> > data before returning.
> >
> > [How]
> > Copy the drm_wait_vblank request.
> > Return from the function after everything has been copied to user.
> >
> > Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> > Tested on ChromeOS Trogdor(msm)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_ioc32.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> > index d29907955ff79..275b860df8fbe 100644
> > --- a/drivers/gpu/drm/drm_ioc32.c
> > +++ b/drivers/gpu/drm/drm_ioc32.c
> > @@ -855,17 +855,19 @@ static int compat_drm_wait_vblank(struct file *fi=
le, unsigned int cmd,
> >       req.request.sequence =3D req32.request.sequence;
> >       req.request.signal =3D req32.request.signal;
> >       err =3D drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_U=
NLOCKED);
> > -     if (err)
> > -             return err;
> >
> >       req32.reply.type =3D req.reply.type;
> >       req32.reply.sequence =3D req.reply.sequence;
> >       req32.reply.tval_sec =3D req.reply.tval_sec;
> >       req32.reply.tval_usec =3D req.reply.tval_usec;
> > +     /* drm_wait_vblank_ioctl modifies Request, update their values he=
re as well. */
> > +     req32.request.type =3D req.request.type;
> > +     req32.request.sequence =3D req.request.sequence;
> > +     req32.request.signal =3D req.request.signal;
>
> The added assignments are superfluous, since req32.reply and req32.reques=
t are members of the same union.
Noted.
>
>
> >       if (copy_to_user(argp, &req32, sizeof(req32)))
> >               return -EFAULT;
> >
> > -     return 0;
> > +     return err;
> >  }
>
> The other changes look correct.
Thanks! updated v2:
https://patchwork.freedesktop.org/patch/449768/?series=3D93605&rev=3D2
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
