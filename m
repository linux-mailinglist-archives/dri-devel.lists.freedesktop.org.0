Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD303C989A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 07:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2BF6E52C;
	Thu, 15 Jul 2021 05:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F6F6E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 05:57:38 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id c197so5222127oib.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 22:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5uJA4MF5IXjAK2IFNMu8bwFbh5v6mfekotBnk8n6EJc=;
 b=TR5fgVXeorF8FqfOGx0r/7jTi44lpbhbbfhd0R4D5nwwF1gomN54t84jPqNaPLza4Q
 rNxP2ONAQBW1c/EuV1m5/MS5ofFpZ8cji49KzaAg/7R48c9zlR3KhpYa23RsLUzlp6hT
 GVQ6e9RE2jZRP4C496BCTcjv7KgF1MlopzhSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5uJA4MF5IXjAK2IFNMu8bwFbh5v6mfekotBnk8n6EJc=;
 b=f/PSRTGvngA2PlmdP72X4UzgjbleFGuWlXYOHOUhIgCWCKrAg1MfFfwuzojL3eYAcv
 PRPbTMDuFt6LMbnyXYN2U5tVYgyvCmMjODymMhwB6b/DFCPoNjK1zH/u7t41IfVNqGVp
 hAt9bB2MAJRgtJxDLtgbOAS9BH0qiEhaTU9LicTih8e9WIUomrpr+UFDVlz0FGNErBCY
 4g4ThiBlJRgITI1RREDZxOfW1OAxyYWlXf8WrnWDgL6QFz7+ASoh9tee7wlaYoRHAgS5
 TYuBvJbiOh3yJwtflFjcxANX60Yl/lS0DkxzrfUGsjRr3j870SCRABC3i7FvJpWCIjBW
 tvfA==
X-Gm-Message-State: AOAM530mZBy+ufCrIeGfIpUStFXqHfoJgP2b1g955HL1oa/TwsQ3SlaY
 vvfc1wv8/8LHFKKYqiJzTraXQRGp3orjJSjr0SHqng==
X-Google-Smtp-Source: ABdhPJx+lMrZIEeuwDNifNOp5QnoTtgJ59lwMcinSCqE58A1kW5ucEHD70VNWWbPO0Cw7ryv/4UW1sswkRTQvDutJxA=
X-Received: by 2002:aca:3085:: with SMTP id w127mr6279097oiw.101.1626328658161; 
 Wed, 14 Jul 2021 22:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210712231234.1031975-1-jason@jlekstrand.net>
 <20210712231234.1031975-2-jason@jlekstrand.net>
 <YO2m36je6vf6Wgwu@phenom.ffwll.local>
 <CAM0jSHP3WyNwwr3VJ6zxKd5NqqXGJ+m_gSXACrptWO6zHnTAWw@mail.gmail.com>
 <YO2v2WbyseJ2PfkJ@phenom.ffwll.local>
 <CAOFGe97=BRTTeXgHdQG=2MpQKqoc78W74mgRHjp5mWweriW+OQ@mail.gmail.com>
In-Reply-To: <CAOFGe97=BRTTeXgHdQG=2MpQKqoc78W74mgRHjp5mWweriW+OQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Jul 2021 07:57:27 +0200
Message-ID: <CAKMK7uGYgc5mdD81a=-fw2L0+s3UsmyRh+DYmsn2aB=XwZedRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915/gem: Migrate to system at dma-buf attach
 time (v5)
To: Jason Ekstrand <jason@jlekstrand.net>
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

On Wed, Jul 14, 2021 at 11:01 PM Jason Ekstrand <jason@jlekstrand.net> wrot=
e:
>
> On Tue, Jul 13, 2021 at 10:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Jul 13, 2021 at 04:06:13PM +0100, Matthew Auld wrote:
> > > On Tue, 13 Jul 2021 at 15:44, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Jul 12, 2021 at 06:12:34PM -0500, Jason Ekstrand wrote:
> > > > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > >
> > > > > Until we support p2p dma or as a complement to that, migrate data
> > > > > to system memory at dma-buf attach time if possible.
> > > > >
> > > > > v2:
> > > > > - Rebase on dynamic exporter. Update the igt_dmabuf_import_same_d=
river
> > > > >   selftest to migrate if we are LMEM capable.
> > > > > v3:
> > > > > - Migrate also in the pin() callback.
> > > > > v4:
> > > > > - Migrate in attach
> > > > > v5: (jason)
> > > > > - Lock around the migration
> > > > >
> > > > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.inte=
l.com>
> > > > > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 25 +++++++++++++=
+++++-
> > > > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 ++-
> > > > >  2 files changed, 27 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers=
/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > index 9a655f69a0671..3163f00554476 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > @@ -170,8 +170,31 @@ static int i915_gem_dmabuf_attach(struct dma=
_buf *dmabuf,
> > > > >                                 struct dma_buf_attachment *attach=
)
> > > > >  {
> > > > >       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> > > > > +     struct i915_gem_ww_ctx ww;
> > > > > +     int err;
> > > > > +
> > > > > +     for_i915_gem_ww(&ww, err, true) {
> > > > > +             err =3D i915_gem_object_lock(obj, &ww);
> > > > > +             if (err)
> > > > > +                     continue;
> > > > > +
> > > > > +             if (!i915_gem_object_can_migrate(obj, INTEL_REGION_=
SMEM)) {
> > > > > +                     err =3D -EOPNOTSUPP;
> > > > > +                     continue;
> > > > > +             }
> > > > > +
> > > > > +             err =3D i915_gem_object_migrate(obj, &ww, INTEL_REG=
ION_SMEM);
> > > > > +             if (err)
> > > > > +                     continue;
> > > > >
> > > > > -     return i915_gem_object_pin_pages_unlocked(obj);
> > > > > +             err =3D i915_gem_object_wait_migration(obj, 0);
> > > > > +             if (err)
> > > > > +                     continue;
> > > > > +
> > > > > +             err =3D i915_gem_object_pin_pages(obj);
> > > > > +     }
> > > > > +
> > > > > +     return err;
> > > > >  }
> > > > >
> > > > >  static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> > > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c=
 b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > > index 3dc0f8b3cdab0..4f7e77b1c0152 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > > > > @@ -106,7 +106,9 @@ static int igt_dmabuf_import_same_driver(void=
 *arg)
> > > > >       int err;
> > > > >
> > > > >       force_different_devices =3D true;
> > > > > -     obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> > > > > +     obj =3D i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
> > > >
> > > > I'm wondering (and couldn't answer) whether this creates an lmem+sm=
em
> > > > buffer, since if we create an lmem-only buffer then the migration a=
bove
> > > > should fail.
> > >
> > > It's lmem-only, but it's also a kernel internal object, so the
> > > migration path will still happily migrate it if asked. On the other
> > > hand if it's a userspace object then we always have to respect the
> > > placements.
> > >
> > > I think for now the only usecase for that is in the selftests.
> >
> > Yeah I've read the kerneldoc, it's all nicely documented but feels a bi=
t
> > dangerous. What I proposed on irc:
> > - i915_gem_object_migrate does the placement check, i.e. as strict as
> >   can_migrate.
> > - A new __i915_gem_object_migrate is for selftest that do special stuff=
.
>
> I just sent out a patch which does this except we don't actually need
> the __ version because there are no self-tests that want to do a
> dangerous migrate.  We could add such a helper later if we needed.
>
> > - In the import selftest we check that lmem-only fails (because we can'=
t
> >   pin it into smem) for a non-dynamic importer, but lmem+smem works and
> >   gets migrated.
>
> I think we maybe want multiple things here?  The test we have right
> now is useful because, by creating an internal LMEM buffer we ensure
> that the migration actually happens.  If we create LMEM+SMEM, then
> it's possible it'll start off in SMEM and the migration would be a
> no-op.  Not sure how likely that is in reality in a self-test
> environment, though.

lmem+smem is supposed to allocate in lmem first (I guess we could
verify this by peeking behind the curtain), so it should migrate.
-Daniel

>
> --Jason
>
> > - Once we have dynamic dma-buf for p2p pci, then we'll have another
> >   selftest which checks that things work for lmem only if and only if t=
he
> >   importer is dynamic and has set the allow_p2p flag.
> >
> > We could also add the can_migrate check everywhere (including
> > dma_buf->attach), but that feels like the less save api.
> > -Daniel
> >
> >
> > >
> > > >
> > > > Which I'm also not sure we have a testcase for that testcase either=
 ...
> > > >
> > > > I tried to read some code here, but got a bit lost. Ideas?
> > > > -Daniel
> > > >
> > > > > +     if (IS_ERR(obj))
> > > > > +             obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZ=
E);
> > > > >       if (IS_ERR(obj))
> > > > >               goto out_ret;
> > > > >
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
