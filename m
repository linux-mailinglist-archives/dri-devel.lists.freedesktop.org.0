Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F776E01BD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 00:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FEB10E0E6;
	Wed, 12 Apr 2023 22:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA4010E0E6;
 Wed, 12 Apr 2023 22:18:38 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bx42so25231760oib.6;
 Wed, 12 Apr 2023 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681337917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/nX5ZUWZ+h14V2FRkq8UuCb9+sDAe/a4u14goLUk2eQ=;
 b=cE5xZzmiH+xB6rbLmtl0fzBJVegyhjkLsVveqwxO5qbNd4xIuKTR3hTFoqJeF9WUhm
 JlHLAC27LDrFCRNQay/+gqmrXNnoQ8btdgulvP28AuJaWw/c9JRdp4CiPW7KItWgORuP
 X3GdvgE4UN5p2reyTu+wLa1eNhaMkyUyDlipXEMw/uQeYawfDdj847Rp2y1ncrbAMPRR
 Pqh+A+wEisSSGwOy8FrS/bJ6eDtK6RIBn3Bp7m8s0zUaaWShkI3zI4+DluUfRpkSm9TF
 WpiQwT1ks7DbLSHJFmx23w1eXfdDI5y+vXcfAmosXdK406t32J/z2S1j08SeSoPMpb6s
 OSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681337917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/nX5ZUWZ+h14V2FRkq8UuCb9+sDAe/a4u14goLUk2eQ=;
 b=PnbOb2esF56gIDDXkiTT6gDEzzMA9nqtwC5dvW4cgttOR8OIW8pHM1pMCZ3YQRrL47
 p/7P07zs+NOF59X+uN708pyTusWZxU1K7Wc1O6DOQ/kAk0dzJkUU/TKBDd/2gjGQz+SN
 NISVxHqZTyDbN6NPGZLSwdq8/lcDetH4oUt74bUxwudcWeRMaAoAyOQehf17jisd7ZoX
 TKyBPtdvhE+W9MjrCLOZdZzm3RZ3R+Gq0bXww2tXRBXBhRfi9IFnDFMUJvxBRvcYkJ/1
 5MB2VCbIjYTvsycM4M0OlUS0xB2JJrr/8MdHZULPH3QqRPI29XwDEMeTGflZVnA9D33M
 61Pw==
X-Gm-Message-State: AAQBX9dgxRJj5pi1+L6NQBN2+IjorfMyQJgvfMDfPmxYwNxmorzdIcAL
 I8y0VXaqWv/vm85HO2270zpoZeXG8EEbqCz6jHw=
X-Google-Smtp-Source: AKy350bOhvWIiyhe+J80+lztyliieDNbQlmei33h8VmroEAF5j/kc0QWcldJvL0uwIA2beG8ww2iwFaa8ZM/TtWtX3A=
X-Received: by 2002:aca:917:0:b0:386:a109:57c8 with SMTP id
 23-20020aca0917000000b00386a10957c8mr34183oij.5.1681337917575; Wed, 12 Apr
 2023 15:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-6-robdclark@gmail.com>
 <ZDZk+8uWouvMtWle@phenom.ffwll.local>
In-Reply-To: <ZDZk+8uWouvMtWle@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Apr 2023 15:18:26 -0700
Message-ID: <CAF6AEGtNANeM4b4Btso8xMreTEMiZSwUfQEJSm=7q+z=C0N9hw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/etnaviv: Switch to fdinfo helper
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christopher Healy <healych@amazon.com>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
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

On Wed, Apr 12, 2023 at 12:59=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
>
> On Tue, Apr 11, 2023 at 03:56:10PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> You're on an old tree, this got reverted. But I'm kinda wondering whether
> another patch on top shouldn't just includ the drm_show_fdinfo in
> DRM_GEM_FOPS macro ... There's really no good reasons for drivers to not
> have this I think?

oh, I'm roughly on msm-next, so didn't see the revert.. I'll drop this
one.  But with things in flux, this is why I decided against adding it
to DRM_GEM_FOPS.  Ie. we should do that as a followup cleanup step
once everyone is moved over to the new helpers to avoid conflicts or
build breaks when merging things via different driver trees

BR,
-R

> -Daniel
>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/et=
naviv/etnaviv_drv.c
> > index 44ca803237a5..170000d6af94 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -476,9 +476,8 @@ static const struct drm_ioctl_desc etnaviv_ioctls[]=
 =3D {
> >       ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
> >  };
> >
> > -static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f=
)
> > +static void etnaviv_fop_show_fdinfo(struct drm_printer *p, struct drm_=
file *file)
> >  {
> > -     struct drm_file *file =3D f->private_data;
> >       struct drm_device *dev =3D file->minor->dev;
> >       struct etnaviv_drm_private *priv =3D dev->dev_private;
> >       struct etnaviv_file_private *ctx =3D file->driver_priv;
> > @@ -487,8 +486,6 @@ static void etnaviv_fop_show_fdinfo(struct seq_file=
 *m, struct file *f)
> >        * For a description of the text output format used here, see
> >        * Documentation/gpu/drm-usage-stats.rst.
> >        */
> > -     seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
> > -     seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
> >
> >       for (int i =3D 0; i < ETNA_MAX_PIPES; i++) {
> >               struct etnaviv_gpu *gpu =3D priv->gpu[i];
> > @@ -507,7 +504,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file=
 *m, struct file *f)
> >                       cur =3D snprintf(engine + cur, sizeof(engine) - c=
ur,
> >                                      "%sNN", cur ? "/" : "");
> >
> > -             seq_printf(m, "drm-engine-%s:\t%llu ns\n", engine,
> > +             drm_printf(p, "drm-engine-%s:\t%llu ns\n", engine,
> >                          ctx->sched_entity[i].elapsed_ns);
> >       }
> >  }
> > @@ -515,7 +512,7 @@ static void etnaviv_fop_show_fdinfo(struct seq_file=
 *m, struct file *f)
> >  static const struct file_operations fops =3D {
> >       .owner =3D THIS_MODULE,
> >       DRM_GEM_FOPS,
> > -     .show_fdinfo =3D etnaviv_fop_show_fdinfo,
> > +     .show_fdinfo =3D drm_fop_show_fdinfo,
> >  };
> >
> >  static const struct drm_driver etnaviv_drm_driver =3D {
> > @@ -529,6 +526,7 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
> >  #ifdef CONFIG_DEBUG_FS
> >       .debugfs_init       =3D etnaviv_debugfs_init,
> >  #endif
> > +     .show_fdinfo        =3D etnaviv_fop_show_fdinfo,
> >       .ioctls             =3D etnaviv_ioctls,
> >       .num_ioctls         =3D DRM_ETNAVIV_NUM_IOCTLS,
> >       .fops               =3D &fops,
> > --
> > 2.39.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
