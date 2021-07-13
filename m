Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7503C72C9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5689E26;
	Tue, 13 Jul 2021 15:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84E89E26;
 Tue, 13 Jul 2021 15:06:42 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id z25so14105619qto.12;
 Tue, 13 Jul 2021 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=avcOBSneHtGwYvnS2J/3XZrWAcF6J73D9WvRA0UvBhU=;
 b=kuTtEgYVX+1RRPUPhHSNdmLfnpVf7kUntHscsvdQlI2As7RiJcwyid0Qv1NzIQrJgu
 NUcalAkEuHzbFXguYYmDxRjxWlOSSGiIYJugMse5ikVd9HnekJIZSrG9VOOrkaO6yC7D
 Yh+PABZm3/AmrLGB3ViQsjI+Hj9nWIit4nZd8SVgOc9BSs37Arf6n7RM2vdEyCB8D+3y
 fL+52/Ul+AbqdCguocOGKlmy4w1Vf1VvgrAaTxpHNlasx9O3feqCxK9ZzK+iJvLkGfO/
 5OKrImM9meLPE/hamrD+xEwYg5+nPOEVZm903arWqAaOpPOtofLQkuUJMslF9rzInbBF
 HsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=avcOBSneHtGwYvnS2J/3XZrWAcF6J73D9WvRA0UvBhU=;
 b=YdHGu7vrcDQ19I4y8OxcM2m7IsaAfFyRRcm0xHBqDY0wPjrZ6ESsxqn6tNSbgxqJb+
 8/pOuRQ3sNAqSbVvome3BI5AtQFqNhPlR/jwgMyEy+okUuFLkKLUQzDSJF8NcSItAOBW
 kfHlGToeI5G6H4Rc0IkhGCAv+a1VupO+dPVhohe0Fu8HdUoyct+RPfbV+y03gvaGiVHS
 aErPk95T/dsvNquKyNYM6OBpaSz6+alNyhE4q5xmZGpyH0jNcUPqVKiOkduQityGQhIp
 i7emEDMa+GL3wZ2SNh7U+sLB1/OJW34+Q2F4MMwvpTH0hsssKyKznhRizhJd+Z5DKKKR
 jXLw==
X-Gm-Message-State: AOAM531SvbIxv5EOK5L6UuL4eNnUANVAQ+qF00HlJtlzDbfDeaI4DJBP
 8bmjoYTz3vO8Z+CBuWosMT7H9rZn9DQsgjR29RE=
X-Google-Smtp-Source: ABdhPJzrMAQ7eStNSFHWPQorTQaxWIZWDONBkw6Hukt4kXVOpjj2O1k2bO6uX7IRZAKPxsgP0wUNXEylk3oZrbA7Q98=
X-Received: by 2002:a05:622a:448:: with SMTP id
 o8mr4483460qtx.341.1626188801707; 
 Tue, 13 Jul 2021 08:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210712231234.1031975-1-jason@jlekstrand.net>
 <20210712231234.1031975-2-jason@jlekstrand.net>
 <YO2m36je6vf6Wgwu@phenom.ffwll.local>
In-Reply-To: <YO2m36je6vf6Wgwu@phenom.ffwll.local>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 13 Jul 2021 16:06:13 +0100
Message-ID: <CAM0jSHP3WyNwwr3VJ6zxKd5NqqXGJ+m_gSXACrptWO6zHnTAWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915/gem: Migrate to system at dma-buf attach
 time (v5)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel test robot <lkp@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jul 2021 at 15:44, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jul 12, 2021 at 06:12:34PM -0500, Jason Ekstrand wrote:
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >
> > Until we support p2p dma or as a complement to that, migrate data
> > to system memory at dma-buf attach time if possible.
> >
> > v2:
> > - Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
> >   selftest to migrate if we are LMEM capable.
> > v3:
> > - Migrate also in the pin() callback.
> > v4:
> > - Migrate in attach
> > v5: (jason)
> > - Lock around the migration
> >
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 25 ++++++++++++++++++-
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 ++-
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_dmabuf.c
> > index 9a655f69a0671..3163f00554476 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@ -170,8 +170,31 @@ static int i915_gem_dmabuf_attach(struct dma_buf *=
dmabuf,
> >                                 struct dma_buf_attachment *attach)
> >  {
> >       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> > +     struct i915_gem_ww_ctx ww;
> > +     int err;
> > +
> > +     for_i915_gem_ww(&ww, err, true) {
> > +             err =3D i915_gem_object_lock(obj, &ww);
> > +             if (err)
> > +                     continue;
> > +
> > +             if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))=
 {
> > +                     err =3D -EOPNOTSUPP;
> > +                     continue;
> > +             }
> > +
> > +             err =3D i915_gem_object_migrate(obj, &ww, INTEL_REGION_SM=
EM);
> > +             if (err)
> > +                     continue;
> >
> > -     return i915_gem_object_pin_pages_unlocked(obj);
> > +             err =3D i915_gem_object_wait_migration(obj, 0);
> > +             if (err)
> > +                     continue;
> > +
> > +             err =3D i915_gem_object_pin_pages(obj);
> > +     }
> > +
> > +     return err;
> >  }
> >
> >  static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/dri=
vers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > index 3dc0f8b3cdab0..4f7e77b1c0152 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > @@ -106,7 +106,9 @@ static int igt_dmabuf_import_same_driver(void *arg)
> >       int err;
> >
> >       force_different_devices =3D true;
> > -     obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> > +     obj =3D i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
>
> I'm wondering (and couldn't answer) whether this creates an lmem+smem
> buffer, since if we create an lmem-only buffer then the migration above
> should fail.

It's lmem-only, but it's also a kernel internal object, so the
migration path will still happily migrate it if asked. On the other
hand if it's a userspace object then we always have to respect the
placements.

I think for now the only usecase for that is in the selftests.

>
> Which I'm also not sure we have a testcase for that testcase either ...
>
> I tried to read some code here, but got a bit lost. Ideas?
> -Daniel
>
> > +     if (IS_ERR(obj))
> > +             obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> >       if (IS_ERR(obj))
> >               goto out_ret;
> >
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
