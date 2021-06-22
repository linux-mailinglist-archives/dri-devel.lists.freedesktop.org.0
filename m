Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD023B0401
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291B26E4B5;
	Tue, 22 Jun 2021 12:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311876E4B5;
 Tue, 22 Jun 2021 12:15:40 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id y4so1206984qvs.10;
 Tue, 22 Jun 2021 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nxRrLEXXQZCZaPxAAQ858r1CzjCtn0cUWXGvZcoRWl4=;
 b=BDIwnu7PFP2+O54vQKlxd7lsMa+FFYhBOkoUoHYCH/b/7hVVzD8Sjy8WFeo00Qua0C
 is8dJkgjijPJXKmEy6k5FsT7x4y8RaL0usdVPWOW0SLrWp+KvxjFJaRXLmrL+H0x3+7u
 x7k8UFB/vZp9OVu6s5tzer7PDQ4hhmn6QC4LzdR0bMDV6rl0eioTePUSAfpbDcxSVXR0
 x24cHdlfKKVP46+hixfWuYDe/LzMHcaZi+ymuv13Dbe1SiahrZiyTMCiPqdwggLzgsyX
 mo0X85Sb3xj5QJFyDtcEZQ7Uxiqx1ZZ/8LEJF660YsCz7ejDSj5QtlQqJFFnsnfMB5rW
 Dxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nxRrLEXXQZCZaPxAAQ858r1CzjCtn0cUWXGvZcoRWl4=;
 b=E52fkoM5P2OxLqLLaycjI33zXkx/uMCkCmmyLXgOHUSERPyTthpTPuUyE2KX5MpY6b
 LUfu2WBhOlECeR771iLgajOS3MM9owGqUPbEiGNF0r9O0rZzNaWgiZqN2FwohqXounZ7
 Gfd8cUkvkSwA89GKuJzSsgm4Pb8vTEssXlaJrzo6NDXOBuHHJkO3q2sNW03tTHV3xcWi
 OPsiOOZrAt5Pj8z1KlP4OG0mBxCML4j/CAW58xn+lu1u4XC1dz5ISxCUtz3Na2fTcw+s
 ZXjYQuqsnFCsQ2QwKHB4c4lZqOJGTu0kZCLFeasa3zeS/oLBvQqqjdc2wgcZY3PGLTYb
 o2yQ==
X-Gm-Message-State: AOAM531N/gXUOQSMK4KwcIFE/bl1tw3L0ka0uONq6+7/fC/0c75B/RKL
 coUWiOUEw74BB5snyxlsUV3oj6dB4aTNoeZvIM4=
X-Google-Smtp-Source: ABdhPJzs02UGYWw4tweHEw9GtER/PdJRilCPNciLFN96a5ioL21gH7gKqgBd7g1X50iPMsKGf9vS/aOjJS2PY2YrwmQ=
X-Received: by 2002:a05:6214:850:: with SMTP id
 dg16mr7346677qvb.60.1624364139070; 
 Tue, 22 Jun 2021 05:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210622095843.132549-1-matthew.auld@intel.com>
 <1aeeac85-07d7-b6d5-4253-386801088307@linux.intel.com>
In-Reply-To: <1aeeac85-07d7-b6d5-4253-386801088307@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 22 Jun 2021 13:15:12 +0100
Message-ID: <CAM0jSHOmtdAQ3GVzjAJxa9ZrdFYTuh78gy4Vbzhzf-r=9bofWw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: consider all placements for the
 page alignment
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Jun 2021 at 11:11, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 6/22/21 11:58 AM, Matthew Auld wrote:
> > Just checking the current region is not enough, if we later migrate the
> > object somewhere else. For example if the placements are {SMEM, LMEM},
> > then we might get this wrong. Another idea might be to make the
> > page_alignment part of the ttm_place, instead of the BO.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 21 ++++++++++++++++++++-
> >   1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index c5deb8b7227c..5d894bba6430 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -753,6 +753,25 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object =
*bo)
> >               call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> >   }
> >
> > +static u64 i915_gem_object_page_size(struct drm_i915_gem_object *obj)
> > +{
> > +     u64 page_size;
> > +     int i;
> > +
> > +     if (!obj->mm.n_placements)
> > +             return obj->mm.region->min_page_size;
> > +
> > +     page_size =3D 0;
> > +     for (i =3D 0; i < obj->mm.n_placements; i++) {
> > +             struct intel_memory_region *mr =3D obj->mm.placements[i];
> > +
> > +             page_size =3D max_t(u64, mr->min_page_size, page_size);
> > +     }
> > +
> > +     GEM_BUG_ON(!page_size);
> > +     return page_size;
> > +}
> > +
> >   /**
> >    * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem obje=
ct
> >    * @mem: The initial memory region for the object.
> > @@ -793,7 +812,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
> >       obj->base.vma_node.driver_private =3D i915_gem_to_ttm(obj);
> >       ret =3D ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> >                         bo_type, &i915_sys_placement,
> > -                       mem->min_page_size >> PAGE_SHIFT,
> > +                       i915_gem_object_page_size(obj) >> PAGE_SHIFT,
>
> Hmm, can't we just have the buddy manager silently enforce its
> min_page_size?

Maybe, but we need some way of overriding it for all of our page-table
allocations(and some other stuff also), so being able to control the
page_alignment at the object level here seems reasonable? Could maybe
pass it through with create_lmem_with_page_size(..., page_size)? Ok,
it might be best to first type it and then see how it will all fit
together.


>
> /Thomas
>
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
