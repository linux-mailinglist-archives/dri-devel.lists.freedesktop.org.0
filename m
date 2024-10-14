Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB799C0FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F1010E392;
	Mon, 14 Oct 2024 07:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rEb9DryS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051A410E392
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:16:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso1750935e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728890202; x=1729495002;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYrGaKIzbaXW4/HOHDYKu2NdNnaNeNcKNsI65YJRIJQ=;
 b=rEb9DrySVKAOmK7cZ35kmw/TSMOpwYor/nLIbCNlyRpcR0+ryQC2a8NqS1HzNn+YKs
 UGqrUDFtaX0B3BjEu7mPfOXe8NyvkMuEl0pLZ20wl5AQhVbf8rHZheyca5K8jd9VU9oz
 TJ+QVtKGToN4bO7lGl7nscJKLcDvz4nFNa43qhpgfMjToGkN/lqnLFU7s8Yj1VTOxco1
 26CEvCt0jJRwOOBpZ5Y0h76NZBHdL3qHUPbpVjd4q6Pz+ZBBzKTAX/ATy+qoDOZuyQDr
 ETgM8oczjqMR0RvZURzGvkCXtMdP/tmv5M0fBKAv0W9J1cRJo9d5c+VO+tSbM6Aab9GY
 j4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728890202; x=1729495002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYrGaKIzbaXW4/HOHDYKu2NdNnaNeNcKNsI65YJRIJQ=;
 b=BDn2khR+68Mw+Lml3uDJdPWAw2xtcZhOBU8MHZnMiFA2ii+PJ/9PLZi+btUS1d6q6p
 YOZprPmoIG5QOqXkKAwwlEej1lhituQvo67RUZg6e0jAg+xe+KhovmdHPf9WZ6NYD5b2
 fFKNcCSEy9pIFVvxn0wg62GuZ98p4LPH5rsc5H0YJGa64wF5MFUcsmPBUwY5BXDrDemE
 V24x39PhLrI93Q6YuJdVXgtf1qQN84dKkS2fQdqgVNPupsEb91t17CXEJ1ACpuIgylFD
 dKpwbr0H7x1vFUFzkH+dZkdIeH4oiM5c5Gxx+G2dJJaUXRh1qhfysZG583Kc9SnqfXxF
 T9jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXdDXp6SkG8b2lf7xh+CQtqIc9UIcx5OglGtn44JnvF/pM5tVEz6w+LFLDyR2l1ISlPW8h/Q4Y/4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOdvRvY8515/iigjfj5HP7u6OUkZR3I/7OYGsbIMoD71+E24Jy
 zn6A3MHEfExXs9NRUqWD002fNaiPzeG9ANxepy1b3tDyWkFkXVxUsFPn0yzqPFrb/TZZoo83Sp+
 s0agpVC4lXb/RfAxcTPFOU4ItB6k4YmgChNbtXA==
X-Google-Smtp-Source: AGHT+IGPExr/iGdzqGOOs1sdsdXchDfXIqGllV+yq5qtcgDH+8WKLL/qB4Dnxru8GItrut/gJbXsTIfYoiaKcgAvmrE=
X-Received: by 2002:a05:6512:3d87:b0:539:eec0:20de with SMTP id
 2adb3069b0e04-539eec02255mr1155970e87.10.1728890201974; Mon, 14 Oct 2024
 00:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <37842441-e372-40e9-b0f5-cf69defc2db5@stanley.mountain>
 <CAMRc=MdFYTtosq53tDFaPSBn11V3P36DOX8xsxRqFhu5iPwUcw@mail.gmail.com>
In-Reply-To: <CAMRc=MdFYTtosq53tDFaPSBn11V3P36DOX8xsxRqFhu5iPwUcw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 09:16:31 +0200
Message-ID: <CAMRc=Mdsb-93m5X6q6qJUmaomJGdBAOWqSFBY0y7z8KsQ3NA6A@mail.gmail.com>
Subject: Re: [PATCH] fbdev/da8xx-fb: unlock on error paths in suspend/resume
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sekhar Nori <nsekhar@ti.com>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Mon, Oct 14, 2024 at 9:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Fri, Oct 11, 2024 at 9:42=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
> >
> > Add a missing console_unlock() in the suspend and resume functions on
> > the error paths.
> >
> > Fixes: 611097d5daea ("fbdev: da8xx: add support for a regulator")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/video/fbdev/da8xx-fb.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx=
-fb.c
> > index fad1e13c6332..66ff8456b231 100644
> > --- a/drivers/video/fbdev/da8xx-fb.c
> > +++ b/drivers/video/fbdev/da8xx-fb.c
> > @@ -1610,8 +1610,10 @@ static int fb_suspend(struct device *dev)
> >         console_lock();
> >         if (par->lcd_supply) {
> >                 ret =3D regulator_disable(par->lcd_supply);
> > -               if (ret)
> > +               if (ret) {
> > +                       console_unlock();
> >                         return ret;
> > +               }
> >         }
> >
> >         fb_set_suspend(info, 1);
> > @@ -1636,8 +1638,10 @@ static int fb_resume(struct device *dev)
> >
> >                 if (par->lcd_supply) {
> >                         ret =3D regulator_enable(par->lcd_supply);
> > -                       if (ret)
> > +                       if (ret) {
> > +                               console_unlock();
> >                                 return ret;
> > +                       }
> >                 }
> >         }
> >
> > --
> > 2.45.2
> >
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I technically still maintain this platform so I took a second look and
seeing this[1] made me realize that this driver is no longer used on
any board. The platform data structure is not defined anywhere and
there's no OF compatible list.

This patch can be dropped and I'll send one removing this driver from
the kernel.

Bartosz

[1] https://elixir.bootlin.com/linux/v6.11.3/source/drivers/video/fbdev/da8=
xx-fb.c#L1340
