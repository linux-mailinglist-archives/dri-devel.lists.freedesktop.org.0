Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4411A6C9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0306EACA;
	Wed, 11 Dec 2019 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF776E267;
 Wed, 11 Dec 2019 02:33:10 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id s25so6363072iob.0;
 Tue, 10 Dec 2019 18:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GrAG6kLQMvFo2FrJr01O5T9GlO2dR89/UhNJQdzENU=;
 b=EgDqi25IbUwAwp7dwIJhuNEqwyNNOtC85pn5r70RBay5vcedNi9BB6aacz7YXTABx1
 wDSX3ggjnYQw/3Kgl72WpvAaNrOmq92b8OGHK4t9UxS051jmAHU1DciGdAuQDvrlsi+W
 qfSneVBUZgjr0xAS3HYgLC3l4xKXXx6Zm2yNy6Lzd8G7QRfRfz6QT03+PoJqwu960eSI
 BzGc85fwzHV/oDCv5TCHrCwKoTGqvmYsJXIGPdxM06JeDB1Xdu2sGDZI463+xpQPDYEt
 7wQK4x2QSNZcu8ejPlZCIZyE7hyF3v3iIds+A3rnpnYTztYybJ/0O4RMadNMlOfpfiUv
 WBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GrAG6kLQMvFo2FrJr01O5T9GlO2dR89/UhNJQdzENU=;
 b=gzMuGO6vr0nu1QLBBT7l+lR5ISFV8NwyA46PBlIorPXnbUicEcv+lEtPh0RGCIMsnQ
 f4w4GzpzpgD/QXjkcCn2Hn3xTic+D4T4QxrfvbImg1IAg89Abt2afPIILsryAl//IneM
 rIM3rI+2KFMlB//9JVyVmGubChtMpL2Yq0/0RFdJgOMSdFi3KqciM2J0wE+g3Cmfp2F4
 POF6APq8byOT6CNq6sPlm5oSf27bNnNfG4VH8b27w9IX+CqAHbd9jzqsIVzX22FCbIVE
 I1vrKes0M6ERitoMKJ203icwFV0BVxusRdmjQcECkp92DUHpYE8Jv9ADPvvjkftFN15F
 utGQ==
X-Gm-Message-State: APjAAAXmo4oFny2E5VmBeUZtsT0wHJpr4EMPAjkAqgmGEzZquWkSeIEa
 pvy6BrWrR3/6Rv+uBTTlPOdCGK+UT+MUjSA9CvI=
X-Google-Smtp-Source: APXvYqyCaLIIOXPLUgXqGqbeH81ULEklvTw5RLv+9WPZZBso5Pi8eKoTJ2dHz6EXIBOrL/9X1WVoBRuzDrjHc7dKkEQ=
X-Received: by 2002:a6b:c3c2:: with SMTP id t185mr987251iof.252.1576031589271; 
 Tue, 10 Dec 2019 18:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
 <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
 <CAEkB2ER4dof02PcH6BDQoFNhkkds=zrPf+5-rSygUh=XU8H0zQ@mail.gmail.com>
In-Reply-To: <CAEkB2ER4dof02PcH6BDQoFNhkkds=zrPf+5-rSygUh=XU8H0zQ@mail.gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 10 Dec 2019 20:32:58 -0600
Message-ID: <CAEkB2EQiJXmc6U9axYEg8cgh5L9vFtoD5x0byAey+GCc-WTwOA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping ...

On Tue, Nov 26, 2019 at 11:50 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> ping...
>
> On Thu, Nov 21, 2019 at 12:09 PM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 4:14 PM Navid Emamdoost
> > <navid.emamdoost@gmail.com> wrote:
> > >
> > > In the implementation of nouveau_bo_alloc() if it fails to determine the
> > > target page size via pi, then the allocated memory for nvbo should be
> > > released.
> > >
> > > Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
> > > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> >
> > Would you please review this patch?
> >
> >
> > Thanks,
> > Navid.
> >
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > index f8015e0318d7..18857cf44068 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > @@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
> > >                         break;
> > >         }
> > >
> > > -       if (WARN_ON(pi < 0))
> > > +       if (WARN_ON(pi < 0)) {
> > > +               kfree(nvbo);
> > >                 return ERR_PTR(-EINVAL);
> > > +       }
> > >
> > >         /* Disable compression if suitable settings couldn't be found. */
> > >         if (nvbo->comp && !vmm->page[pi].comp) {
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > Navid.
>
>
>
> --
> Navid.



-- 
Navid.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
