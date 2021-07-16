Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B43CB883
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBE76E99B;
	Fri, 16 Jul 2021 14:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F205D6E99B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:10:40 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id b13so15071076ybk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IialkKlO1QfxRfNOevGxiK6VDX8foERQw+UWNyzrLCc=;
 b=CD6i7EMooTnSpQaxHdXYkA7TATFP60lyZ0gUpJuHDXtNnP+KPve5A37QOMOrTdtxDG
 c7SREaUkZJCuekUdJ/AeKfkiWiVS2kfVrPDsaD1vRYUscxeM/m8rHJ+6C+iiDtUEU0hO
 vPUpLHgQgGUGYc4hhANxdEaMISYdgTVKM8a9QomzltNjzf/Pj14f5UXkMeYzglMEceJ7
 IhuNLS1IlgRY9qAFHSaLzuw9JmgUMdUaknn0cQ5METVCtpMFV1mwpc6pM6unyKqcJrYa
 EcWxQya2ylUREwoHUMd7Bh0+cIUFuE6A2feZzY91AN9vEKpLLiLi+Xs7kqqkcqMP8c1y
 OA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IialkKlO1QfxRfNOevGxiK6VDX8foERQw+UWNyzrLCc=;
 b=KINuQzUXwNyyC0keNmKHD7Js3G39Bqer4CpHZXCfJZJmzCZZ5QTpGHiwrGKspLiPmY
 7WgZJe5FR1ktq8GMvp7BW5pPgEnAGmZRrQS18VP5UILr5Ve7fkvOUie5/aLvWyqCfe8T
 yDQxG7EkGa/sVBAPOIDjYdyy4cJ0+OOzLEkml1t2wrCZeyEm6TXuCvpPHsIw3oVI8FII
 iSyQ8mqqbeq05WFPOYCRMFPyoCwQbbl4mJ3YwP9VY0N6IdR15G6onrIjg9lhv7E9sZAD
 j38WccbLtqUe39wuoGKzEDLU/mqUCO8P3BwAjgNwwp5HkSfa8pstIoD3yuiKjEMa1HFf
 5+Pg==
X-Gm-Message-State: AOAM533B51VFos/aqcLvSFESq7M1WT2b/MEel6gExFmiMo1Xe4LjQLZJ
 P2/sLlJS9oZ4zW1Fs2Mb8K1mC5FQuUE8LioHqP6scA==
X-Google-Smtp-Source: ABdhPJwBk/rEtKcJNxTz3uz1i/alMA0aSzahdbhjatb0Bq1SRLevugLNS/ywkTKhReArFoDpL2m0jSIwJuTYTc8yHdk=
X-Received: by 2002:a25:d3c1:: with SMTP id
 e184mr13230517ybf.139.1626444640094; 
 Fri, 16 Jul 2021 07:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-6-jason@jlekstrand.net>
 <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
In-Reply-To: <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 16 Jul 2021 09:10:29 -0500
Message-ID: <CAOFGe95gEUNsjCh+30AXhrQLz8_OKbHwwxv=_OhaGKQxGpvcew@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
To: Matthew Auld <matthew.william.auld@gmail.com>
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

On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> >
> > Whenever we had a user object (n_placements > 0), we were ignoring
> > obj->mm.region and always putting obj->placements[0] as the requested
> > region.  For LMEM+SMEM objects, this was causing them to get shoved int=
o
> > LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say=
,
> > i915_gem_object_migrate().
>
> i915_ttm_migrate calls i915_ttm_place_from_region() directly with the
> requested region, so there shouldn't be an issue with migration right?
> Do you have some more details?

With i915_ttm_migrate directly, no.  But, in the last patch in the
series, we're trying to migrate LMEM+SMEM buffers into SMEM on
attach() and pin it there.  This blows up in a very unexpected (IMO)
way.  The flow goes something like this:

 - Client attempts a dma-buf import from another device
 - In attach() we call i915_gem_object_migrate() which calls
i915_ttm_migrate() which migrates as requested.
 - Once the migration is complete, we call i915_gem_object_pin_pages()
which calls i915_ttm_get_pages() which depends on
i915_ttm_placement_from_obj() and so migrates it right back to LMEM.

Maybe the problem here is actually that our TTM code isn't respecting
obj->mm.pages_pin_count?

In case you can't tell, I really have no clue what I'm doing here.
I'm really stumbling around in the dark finding things that make my
bug go away.  I'm happy for the feedback.

--Jason

>
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index d30f274c329c7..5985e994d56cf 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -150,8 +150,7 @@ i915_ttm_placement_from_obj(const struct drm_i915_g=
em_object *obj,
> >         unsigned int i;
> >
> >         placement->num_placement =3D 1;
> > -       i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] =
:
> > -                                  obj->mm.region, requested, flags);
> > +       i915_ttm_place_from_region(obj->mm.region, requested, flags);
> >
> >         /* Cache this on object? */
> >         placement->num_busy_placement =3D num_allowed;
> > --
> > 2.31.1
> >
