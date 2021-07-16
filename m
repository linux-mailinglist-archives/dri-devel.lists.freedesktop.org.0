Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78003CBA1E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 17:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCEB6E9BC;
	Fri, 16 Jul 2021 15:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE26E9BC;
 Fri, 16 Jul 2021 15:52:56 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id c13so4778153qtc.10;
 Fri, 16 Jul 2021 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oPTPski1ORUB66m06AbzRvR4PXPdL9/VUAQLg0BC2sI=;
 b=iCKD9OfYicCjcjuSQtw3KOgE8AevxMoSeceixZcBSyLuy2PyQFZ7Ru1QaIURwaPE0T
 smRfKHBc4dEqbSOkXT1nYW3M/UpDIphOyPCDAnDlYWcymkJUr0T+vpasW2cnYiTFEuaZ
 3Qvq094utwdkmMVhv3tkaUsDmWv/vUdv8Ix8dVy+0BQZsv16QQTVSTpZa4JtAadZad6j
 1SdcrtleSJeV0Nk6MslIzX7jlpikzyvsuJTSZLerZ+CjerMHi8UlthAz0CMD+GbZzjKs
 QXbusuu8X2p6KslQsLWFPScA7rCys8NEVYHLPDyENSJ5EA9rOqDLUkxNiAUiQ1JgKx9T
 fSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oPTPski1ORUB66m06AbzRvR4PXPdL9/VUAQLg0BC2sI=;
 b=je0e/7m5J3SoZ7wgMsFeHZj0tJNbh0eoie3Irsm76DF61JRf92sCQlVrcPOXbY+OHW
 jxSyzw6XCwgkbDqrMdWkNLWMLhal13OISfMOgqMHb913i96caLaUzCXfcm2P/XAtNeub
 6ilFv9KBFb7WT8G+aEE4ssvCW4hwJfqNYgxGVVpWfA2oh/2GJ7HVuLYomYj0aXHn3CKK
 XQuTu4Ly0cqM0VBbYnt5kuNgXHX9HdI3V7/Kmr/REk6DOi4ruYSm+bnEVsSoxeZxmrd2
 1FWSYdNW/MWMRzlepWNokgKCBuokBy8tCXcFN3Bwqldqa8rJnOobdSWX9NHT7rN6kSK4
 tE8Q==
X-Gm-Message-State: AOAM531pOIf9A81KDuoYDVGKgr+mAOycHZhmWghMiXi0oO8eIf1HJ0R1
 Enyn7c3nt4Gr+59U/W2XqxczLmW0+o1QF1ci9vE=
X-Google-Smtp-Source: ABdhPJyVoEbPmYlqPHm1aqE49rTrcE8HH2OxVO0P5ZZW0FbmMUoScEIaB1tQ9VnNA6IfXLc4omQWR+FuzIt2IMS3QTk=
X-Received: by 2002:a05:622a:89:: with SMTP id
 o9mr9647470qtw.339.1626450776035; 
 Fri, 16 Jul 2021 08:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-6-jason@jlekstrand.net>
 <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
 <CAOFGe95gEUNsjCh+30AXhrQLz8_OKbHwwxv=_OhaGKQxGpvcew@mail.gmail.com>
In-Reply-To: <CAOFGe95gEUNsjCh+30AXhrQLz8_OKbHwwxv=_OhaGKQxGpvcew@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 16:52:27 +0100
Message-ID: <CAM0jSHO4EU_gBXo-56GtDJffezfVHYoUhCeOnb97ZgBj5vyA7Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> > >
> > > Whenever we had a user object (n_placements > 0), we were ignoring
> > > obj->mm.region and always putting obj->placements[0] as the requested
> > > region.  For LMEM+SMEM objects, this was causing them to get shoved i=
nto
> > > LMEM on every i915_ttm_get_pages() even when SMEM was requested by, s=
ay,
> > > i915_gem_object_migrate().
> >
> > i915_ttm_migrate calls i915_ttm_place_from_region() directly with the
> > requested region, so there shouldn't be an issue with migration right?
> > Do you have some more details?
>
> With i915_ttm_migrate directly, no.  But, in the last patch in the
> series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> attach() and pin it there.  This blows up in a very unexpected (IMO)
> way.  The flow goes something like this:
>
>  - Client attempts a dma-buf import from another device
>  - In attach() we call i915_gem_object_migrate() which calls
> i915_ttm_migrate() which migrates as requested.
>  - Once the migration is complete, we call i915_gem_object_pin_pages()
> which calls i915_ttm_get_pages() which depends on
> i915_ttm_placement_from_obj() and so migrates it right back to LMEM.

The mm.pages must be NULL here, otherwise it would just increment the
pages_pin_count?

>
> Maybe the problem here is actually that our TTM code isn't respecting
> obj->mm.pages_pin_count?

I think if the resource is moved, we always nuke the mm.pages after
being notified of the move. Also TTM is also not allowed to move
pinned buffers.

I guess if we are evicted/swapped, so assuming we are not holding the
object lock, and it's not pinned, the future call to get_pages() will
see mm.pages =3D NULL, even though the ttm_resource is still there, and
because we prioritise the placements[0], instead of mm.region we end
up moving it for no good reason. But in your case you are holding the
lock, or it's pinned? Also is this just with the selftest, or
something real?

>
> In case you can't tell, I really have no clue what I'm doing here.
> I'm really stumbling around in the dark finding things that make my
> bug go away.  I'm happy for the feedback.
>
> --Jason
>
> >
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_ttm.c
> > > index d30f274c329c7..5985e994d56cf 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > @@ -150,8 +150,7 @@ i915_ttm_placement_from_obj(const struct drm_i915=
_gem_object *obj,
> > >         unsigned int i;
> > >
> > >         placement->num_placement =3D 1;
> > > -       i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0=
] :
> > > -                                  obj->mm.region, requested, flags);
> > > +       i915_ttm_place_from_region(obj->mm.region, requested, flags);
> > >
> > >         /* Cache this on object? */
> > >         placement->num_busy_placement =3D num_allowed;
> > > --
> > > 2.31.1
> > >
