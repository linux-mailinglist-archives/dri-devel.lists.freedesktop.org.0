Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70B3E59B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 14:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D997789DA2;
	Tue, 10 Aug 2021 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20589F9F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 12:13:18 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id x19so643154uat.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 05:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fLj82slZXz/iYkfqnFTc5Yp76dViJebG6AniQ5dEgiU=;
 b=KN2yjrXXcKqEcYm3XXHncdPIJfpr4b6x3puU6lYvK4uay2Phs9NKrTjvMbOyp0oT8F
 gYUJDY3KMlDZ9z5dK3GkTV8Zrsn5OtnOTtIZOACtIlug/28QxQU2zVOljXAQQxeswhrk
 eUxFf27vjcyIv7d7jDf1ffy1RY1adRi/ovjctbAlGz5YRw3UHrwi3aehszeDCzDoHg1Z
 J2R/Pu2SyhKnKfrF5wHM4TokDlB2reFEqDugfGQB6an7QIOHk8OLLPAExVmwyay20JCc
 GQG//E1HbuhD8XYxCQ/j+p3jVinvDxTGGWEzUb+4FE0dQoW5xlem8+AHr871972kQxg8
 yHPg==
X-Gm-Message-State: AOAM533XhnJrqJ+TqF8++PSHpNmJ6yjn3wSmfxhbSgLF0lETdzyiRgQq
 lbYsqGndr2pLC2yyr7LoxdwoBKOjyxbH+H8cljg=
X-Google-Smtp-Source: ABdhPJyQFTass/VoSbVTqzkWApbaXk9OOVu3k1ggWU0/EnRo0tdvOkP+djRBqu26XX64MRXe4AnkujkFVBV5MuxWZJ4=
X-Received: by 2002:a9f:31ad:: with SMTP id v42mr7648477uad.58.1628597597982; 
 Tue, 10 Aug 2021 05:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210723150944.528c10af@canb.auug.org.au>
 <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
In-Reply-To: <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Aug 2021 14:13:06 +0200
Message-ID: <CAMuHMdUCWdys_Xgh0wSuUX9coNFEics6rwnRWrx8f=OW0AYHEA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Fri, Jul 23, 2021 at 7:35 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Fri, Jul 23, 2021 at 03:09:44PM +1000, Stephen Rothwell wrote:
> > After merging the driver-core tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: error: initialization of 'void=
 (*)(struct device *)' from incompatible pointer type 'int (*)(struct devic=
e *)' [-Werror=3Dincompatible-pointer-types]
> >   106 |  .remove  =3D dp_aux_ep_remove,
> >       |             ^~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: note: (near initialization for=
 'dp_aux_bus_type.remove')
> >
> > Caused by commit
> >
> >   aeb33699fc2c ("drm: Introduce the DP AUX bus")
> >
> > from the drm tree interacting with commit
> >
> >   fc7a6209d571 ("bus: Make remove callback return void")
> >
> > from the driver-core tree.
> >
> > I applied the following merge fix patch.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 23 Jul 2021 14:58:25 +1000
> > Subject: [PATCH] fix for "drm: Introduce the DP AUX bus"
> >
> > interaction with "bus: Make remove callback return void"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/drm_dp_aux_bus.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_dp_=
aux_bus.c
> > index e49a70f3691b..298ea7a49591 100644
> > --- a/drivers/gpu/drm/drm_dp_aux_bus.c
> > +++ b/drivers/gpu/drm/drm_dp_aux_bus.c
> > @@ -67,9 +67,8 @@ static int dp_aux_ep_probe(struct device *dev)
> >   *
> >   * Calls through to the endpoint driver remove.
> >   *
> > - * Return: 0 if no error or negative error code.
> >   */
> > -static int dp_aux_ep_remove(struct device *dev)
> > +static void dp_aux_ep_remove(struct device *dev)
> >  {
> >       struct dp_aux_ep_driver *aux_ep_drv =3D to_dp_aux_ep_drv(dev->dri=
ver);
> >       struct dp_aux_ep_device *aux_ep =3D to_dp_aux_ep_dev(dev);
> > @@ -77,8 +76,6 @@ static int dp_aux_ep_remove(struct device *dev)
> >       if (aux_ep_drv->remove)
> >               aux_ep_drv->remove(aux_ep);
> >       dev_pm_domain_detach(dev, true);
> > -
> > -     return 0;
> >  }
>
> This looks right.
>
> Greg provided a tag containing fc7a6209d571 ("bus: Make remove callback
> return void") at
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git tags/bus_remove_return_void-5.15
>
> (see https://lore.kernel.org/lkml/YPkwQwf0dUKnGA7L@kroah.com).
>
> It would be great if this could be merged into the drm tree with the
> above diff squashed into the merge commit.

+1.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
