Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC2BECC60
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 11:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63C910E17A;
	Sat, 18 Oct 2025 09:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BsyH+Huz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8937410E17A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 09:22:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-27ee41e0798so43112855ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760779346; x=1761384146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8G9BxEckj/hKiD9YMQD9HVfTYNNFZve6IgS2FIJnpK0=;
 b=BsyH+HuzqB4QXp11qbw7Eqhq71AaFIvOxGxL41ZGiKtkep8YjFRbS8seU2pGrWo0QL
 91UUdf9fndKBnuKOGj2lQO3VGdnql9godzheyo0QqENVxH3+sm51OG8ZT+PmpH1gijrz
 ijDuA/rcsKHsYTLH+r1wsNgRyoMGIrbjj2AB6Lz5Nk0zRjdcsGAlLxJqyPUdSLkdoumk
 NQ5EyeycxVJYIw/hSzKyAfeyPDq8mgP3crdY7WeaOpINkT6rGCQuxQJ8z17s3zFc934m
 CfVdxk48Z4x74DaZfjDRjOGgIcjqvW3KHOWU4CYN20aWv/exVDaf+cwjKHnYejr7cYMK
 pHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760779346; x=1761384146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8G9BxEckj/hKiD9YMQD9HVfTYNNFZve6IgS2FIJnpK0=;
 b=GmkSYUZKBLohF51NlSfVuYqkWLAJW9KbW9Bn4Ou34n3vo1NPkVil0AkxOU7sKje/rt
 hipx2hgykON20Z3zNx2yddrY3S5wVlG9adD03A2Od5K1eA3NxKUoiNzv6cOqcYvH57rD
 gcgqbZ0DuICeyZMCbX4udiRGEjeZBFPIOCMVXYTI8vVz4jn7V2xz743S+fZcOv4TEYRs
 D/k48YVz3HPSQNIipNCvy13FHpfe1qptpPikDqmeRhwZLyUg3/DzC7DRbwh5vHoOc7gb
 EEOmjdu68Ke1JpmOBUBQGH8YK7/oVLCBBh7sk3L9gryGzf0WytAJNg7mVobB4tLAfXg6
 saDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWypUxwCSOyOPgbnAR62j6o7NZ1FJJmmv9VraRfj+oBd1xQAxMKcJw+WZO3p6ciopyjvG/MOcUWNyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjVd1FvcMMChGyDigFsF9Lv5iHCnY3NwH/mFS5maOsA5nW7dHJ
 q8+yGvNKHRVBkb2/+nf1A4h21QbSe/9qsytVVjjUuaihg/RZv4O234kPFCDtfEEBHyEDA7WGy5x
 C2VvUalSspMClCKQj7nh3t/C+9/Fo/Qw=
X-Gm-Gg: ASbGnctfkEz/Tz0mz6VsLK02f7zct/pzggbMmOwMNvx09FxAEImwyI85ISgKdiGGb8V
 uio8vwXxslxwkGxEuDVPnnroX9uFWmIhb8lXkioVHmjP12FmdE0sIiE1TmL1L6hfSj5NZ5YZC/B
 QixQEcyRAzmiNwc2b1MEklc9q5XZVjyc8dApyEXTfo50hG1DthclRX49UUsQ21u0SRBgUCrv+Li
 0mwK82I7Js2XF0g/9ICUOwBXOdctKC6aZAsu08mDo2w4aRs4ClHxTMvNyEKAkDuIGUlhsauYwe+
 sc/Qthj69MJAlVE7SvaKN9g7t7R8mtEAzq84RUm3W1XFG+LSIoiSNNX3pZJiu9P5NEDd5QBoe3g
 X
X-Google-Smtp-Source: AGHT+IEDraNRZq42ZNDrvZOFr/ZhVuZxPKdBOfz5GcwmFXkQIMvrymtjNxBY7OaPdZra3os9hGzTd4YOk5RGIoRB1pc=
X-Received: by 2002:a17:903:15c7:b0:269:b2ff:5c0e with SMTP id
 d9443c01a7336-290cbb49964mr84235515ad.46.1760779345803; Sat, 18 Oct 2025
 02:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250928054913.7871-1-opensource206@gmail.com>
 <CAKPKb8_8uQdzNevB4wVpXcRrBr0-rjfvBR=oNNyCCA4yASgK-g@mail.gmail.com>
In-Reply-To: <CAKPKb8_8uQdzNevB4wVpXcRrBr0-rjfvBR=oNNyCCA4yASgK-g@mail.gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Sat, 18 Oct 2025 14:52:14 +0530
X-Gm-Features: AS18NWA37AT3s44AjDjx0AdSOALzC5N477YH04L3-Zo96vppdITWdCR4HCOVGAo
Message-ID: <CAKPKb8-JE5W58jQOFSxr74sguoRop=3BH9EsVid-dXyGZkEpCA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace schedule() with schedule_hrtimeout()
 in fallback wait
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Oct 7, 2025 at 4:21=E2=80=AFPM opensource india <opensource206@gmai=
l.com> wrote:
>
> On Sun, Sep 28, 2025 at 11:19=E2=80=AFAM Pavan Bobba <opensource206@gmail=
.com> wrote:
> >
> > Replace the open-coded polling with schedule() in vmw_fallback_wait()
> > by schedule_hrtimeout(). The old code wakes up at jiffy granularity and
> > leads to unnecessary CPU wakeups during fence waits.
> >
> > schedule_hrtimeout() provides high-resolution sleep with finer control,
> > reducing CPU utilization without affecting fence correctness. For the
> > non-interruptible case, use schedule_timeout_uninterruptible().
> >
> > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_irq.c
> > index 05773eb394d3..64045b0efafc 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> > @@ -202,16 +202,12 @@ int vmw_fallback_wait(struct vmw_private *dev_pri=
v,
> >                 if (lazy)
> >                         schedule_timeout(1);
> >                 else if ((++count & 0x0F) =3D=3D 0) {
> > -                       /**
> > -                        * FIXME: Use schedule_hr_timeout here for
> > -                        * newer kernels and lower CPU utilization.
> > -                        */
> > -
> > -                       __set_current_state(TASK_RUNNING);
> > -                       schedule();
> > -                       __set_current_state((interruptible) ?
> > -                                           TASK_INTERRUPTIBLE :
> > -                                           TASK_UNINTERRUPTIBLE);
> > +                       ktime_t delta =3D ktime_set(0, NSEC_PER_MSEC);
> > +
> > +                       if (interruptible)
> > +                               schedule_hrtimeout(&delta, HRTIMER_MODE=
_REL);
> > +                       else
> > +                               schedule_timeout_uninterruptible(delta)=
;
> >                 }
> >                 if (interruptible && signal_pending(current)) {
> >                         ret =3D -ERESTARTSYS;
> > --
> > 2.43.0
> >
>
> anyone please review this patch?

Hi all, can anyone please review this?
