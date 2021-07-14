Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09823C92B5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 23:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8826E505;
	Wed, 14 Jul 2021 21:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4966E505
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 21:01:59 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v189so5462835ybg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=99qF/5iUqzOh0o7tbx6oSMidCvgGjsQhhCSiehDxPrw=;
 b=GCdnp+VmY/q2HUx9dWqpjIDK9cTLQcm2xzKGfoZZ6MdQfXeg13+AqYexYF4pf3Cu72
 x0bWLmgxsOh+jhVQAHcYW+894Muzr9NjjJ+miolDoR5CGvrhm3310M4BDzVXWbCAMaQO
 u1rrANbxJJXGejye8vUv5Uy23i93+SbntAOmp5hJxa7beMJAhxB70dFaQo2mZg8QO8pu
 qyFB3L6sXZzBP7BHKUmGk9rLaNKaoRYc5ppXUEMCz/HlDmYvM3/4/4pSYEFex7MUHfTl
 kOCy/RtlYFw5L1/xVHw0ymGmvgu3mJiCEmNfwjkneK6qt3IJx6PaC/BzkA5N9OXOYgp5
 JWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=99qF/5iUqzOh0o7tbx6oSMidCvgGjsQhhCSiehDxPrw=;
 b=mw7Agn8LwcLm2QqO3x9xHYHOTgoepaO9GnEb5hi85g+Lfz/6ARyBpYi6GO2nhkBGTj
 7UUZsuCgLuANoTm1S7G97yNiwpX1S8a2it4JfBjHudPmgEPjeOn9HOm1+SWZL5IQMWZh
 aVQ+aaWtyDd8+peUmkp/N6Cq6fOWQZFOkF0g2XDsF2WSJRteOUjzKc8AoFK2TGz8APA/
 lr+xRYytef7kKV+MNLNx2NG+sTnHbXYrY8HBs18oCdDQopF1l7fuOOB8sCu5Q83ILmSh
 lrqTp11jdk9mdxG9d2cplvbDCfYyd3CGNfzhhSa1HdVhvEHY6atJ5euiXLRcvNm+uzne
 otLg==
X-Gm-Message-State: AOAM530R9OY9deHTG9Q+QEsv2ILqwcg83DfVoUr070RIqy96Jo2dJuwd
 k+JDd8Io/LGM/kwzjv8y4kRuhYwfKSTOs3L1lDR6yA==
X-Google-Smtp-Source: ABdhPJw6VfDqR7UURgDdKkBZL4HslzSeQNKrEwUApmHWeKpmLgl0BcROaLKTIZsYfDUkbLIJFUtKNNe6HbLMtrpEUfc=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr15866158ybi.241.1626296518186; 
 Wed, 14 Jul 2021 14:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210712231234.1031975-1-jason@jlekstrand.net>
 <20210712231234.1031975-2-jason@jlekstrand.net>
 <YO2m36je6vf6Wgwu@phenom.ffwll.local>
 <CAM0jSHP3WyNwwr3VJ6zxKd5NqqXGJ+m_gSXACrptWO6zHnTAWw@mail.gmail.com>
 <YO2v2WbyseJ2PfkJ@phenom.ffwll.local>
In-Reply-To: <YO2v2WbyseJ2PfkJ@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 16:01:47 -0500
Message-ID: <CAOFGe97=BRTTeXgHdQG=2MpQKqoc78W74mgRHjp5mWweriW+OQ@mail.gmail.com>
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
 Matthew Auld <matthew.william.auld@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 10:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jul 13, 2021 at 04:06:13PM +0100, Matthew Auld wrote:
> > On Tue, 13 Jul 2021 at 15:44, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Jul 12, 2021 at 06:12:34PM -0500, Jason Ekstrand wrote:
> > > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > >
> > > > Until we support p2p dma or as a complement to that, migrate data
> > > > to system memory at dma-buf attach time if possible.
> > > >
> > > > v2:
> > > > - Rebase on dynamic exporter. Update the igt_dmabuf_import_same_dri=
ver
> > > >   selftest to migrate if we are LMEM capable.
> > > > v3:
> > > > - Migrate also in the pin() callback.
> > > > v4:
> > > > - Migrate in attach
> > > > v5: (jason)
> > > > - Lock around the migration
> > > >
> > > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.=
com>
> > > > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > ---
> > > >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 25 +++++++++++++++=
+++-
> > > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 ++-
> > > >  2 files changed, 27 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/g=
pu/drm/i915/gem/i915_gem_dmabuf.c
> > > > index 9a655f69a0671..3163f00554476 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > @@ -170,8 +170,31 @@ static int i915_gem_dmabuf_attach(struct dma_b=
uf *dmabuf,
> > > >                                 struct dma_buf_attachment *attach)
> > > >  {
> > > >       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> > > > +     struct i915_gem_ww_ctx ww;
> > > > +     int err;
> > > > +
> > > > +     for_i915_gem_ww(&ww, err, true) {
> > > > +             err =3D i915_gem_object_lock(obj, &ww);
> > > > +             if (err)
> > > > +                     continue;
> > > > +
> > > > +             if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SM=
EM)) {
> > > > +                     err =3D -EOPNOTSUPP;
> > > > +                     continue;
> > > > +             }
> > > > +
> > > > +             err =3D i915_gem_object_migrate(obj, &ww, INTEL_REGIO=
N_SMEM);
> > > > +             if (err)
> > > > +                     continue;
> > > >
> > > > -     return i915_gem_object_pin_pages_unlocked(obj);
> > > > +             err =3D i915_gem_object_wait_migration(obj, 0);
> > > > +             if (err)
> > > > +                     continue;
> > > > +
> > > > +             err =3D i915_gem_object_pin_pages(obj);
> > > > +     }
> > > > +
> > > > +     return err;
> > > >  }
> > > >
> > > >  static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b=
/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > index 3dc0f8b3cdab0..4f7e77b1c0152 100644
> > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > @@ -106,7 +106,9 @@ static int igt_dmabuf_import_same_driver(void *=
arg)
> > > >       int err;
> > > >
> > > >       force_different_devices =3D true;
> > > > -     obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> > > > +     obj =3D i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
> > >
> > > I'm wondering (and couldn't answer) whether this creates an lmem+smem
> > > buffer, since if we create an lmem-only buffer then the migration abo=
ve
> > > should fail.
> >
> > It's lmem-only, but it's also a kernel internal object, so the
> > migration path will still happily migrate it if asked. On the other
> > hand if it's a userspace object then we always have to respect the
> > placements.
> >
> > I think for now the only usecase for that is in the selftests.
>
> Yeah I've read the kerneldoc, it's all nicely documented but feels a bit
> dangerous. What I proposed on irc:
> - i915_gem_object_migrate does the placement check, i.e. as strict as
>   can_migrate.
> - A new __i915_gem_object_migrate is for selftest that do special stuff.

I just sent out a patch which does this except we don't actually need
the __ version because there are no self-tests that want to do a
dangerous migrate.  We could add such a helper later if we needed.

> - In the import selftest we check that lmem-only fails (because we can't
>   pin it into smem) for a non-dynamic importer, but lmem+smem works and
>   gets migrated.

I think we maybe want multiple things here?  The test we have right
now is useful because, by creating an internal LMEM buffer we ensure
that the migration actually happens.  If we create LMEM+SMEM, then
it's possible it'll start off in SMEM and the migration would be a
no-op.  Not sure how likely that is in reality in a self-test
environment, though.

--Jason

> - Once we have dynamic dma-buf for p2p pci, then we'll have another
>   selftest which checks that things work for lmem only if and only if the
>   importer is dynamic and has set the allow_p2p flag.
>
> We could also add the can_migrate check everywhere (including
> dma_buf->attach), but that feels like the less save api.
> -Daniel
>
>
> >
> > >
> > > Which I'm also not sure we have a testcase for that testcase either .=
..
> > >
> > > I tried to read some code here, but got a bit lost. Ideas?
> > > -Daniel
> > >
> > > > +     if (IS_ERR(obj))
> > > > +             obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE)=
;
> > > >       if (IS_ERR(obj))
> > > >               goto out_ret;
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
