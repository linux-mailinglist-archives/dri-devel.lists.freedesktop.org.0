Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15456DF00A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 11:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E55D10E742;
	Wed, 12 Apr 2023 09:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA6E10E73E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:08:24 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id bm45so1494842oib.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681290503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDKu9h07XSmG8BLT1PMkO3nxryyYNz+99k5JAa1yFlc=;
 b=NJjaBn9J6P1o8FjDOWAGbzakyXnwQ02owAEtdIV0/Soj2vrlHyZUojkRikTFNqw7Ut
 37hxct4D74KuwiJzy99g5qvm1cB8lVv7OxOq8sSRjbLdg5ICy6lT5Rc1X89GtDenH/EF
 7bk5oWiI3sv9eeorYFh+eN0e32TUvYGZKyktk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681290503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDKu9h07XSmG8BLT1PMkO3nxryyYNz+99k5JAa1yFlc=;
 b=Qu2zc4maYo/IHW/Q3cvkoVk6hq75CSjcXFseS0p1mX3A243JFEHNUozyQBPwirSzHo
 12WdrXSaFLqLok27u2hsuUcCMCPIF6pWa0W/dstJtplQ6DUF9Fm37IAk0Uix9dwNhl6M
 7sWf2MH36tV4AL0Ja6H8ErQxtrTbMbaMwWIybRzFM2MiMYAmLZFbYJ6CVyjdSAaQAjeV
 2eSXRIvTAuB/A8SwwoeeYAcxHTQmj0ZCwzBfuSQiG6nabsR18CIYKuOL9H5chf4kz2nc
 naaZVrI1YHgMy+50n8kd1KG7WTlw/UMSeiebXAyfc+oaEMnvxys73DLJmSb65SoeJxEr
 awJQ==
X-Gm-Message-State: AAQBX9dX0v92Dbu/jUz/K7apsCWcLSuYRcwTswMitOAuDOzVM9U2uYwc
 AzGkg1bHFwS6DfBM/P7yVUMA+ZZzAQmHDDsx0r8Z+A==
X-Google-Smtp-Source: AKy350YhiIV9O0+MOoL5UhAzdVEopIuUdVfTDs491jtq25WL+DJc7SdRItpzEv2WtOqX1Kx7CX+wpqvOcQZXWyNlZSw=
X-Received: by 2002:aca:2407:0:b0:389:2b9b:fe5f with SMTP id
 n7-20020aca2407000000b003892b9bfe5fmr399260oic.8.1681290503070; Wed, 12 Apr
 2023 02:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
 <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
In-Reply-To: <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 12 Apr 2023 11:08:11 +0200
Message-ID: <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian K=C3=B6nig wrote:
> > Am 11.04.23 um 11:51 schrieb Daniel Vetter:
> > > On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > When swapping out, we will split multi-order pages both in order to
> > > > move them to the swap-cache and to be able to return memory to the
> > > > swap cache as soon as possible on a page-by-page basis.
> > > > Reduce the page max order to the system PMD size, as we can then be=
 nicer
> > > > to the system and avoid splitting gigantic pages.
> > > >
> > > > Looking forward to when we might be able to swap out PMD size folio=
s
> > > > without splitting, this will also be a benefit.
> > > >
> > > > v2:
> > > > - Include all orders up to the PMD size (Christian K=C3=B6nig)
> > > > v3:
> > > > - Avoid compilation errors for architectures with special PFN_SHIFT=
s
> > > >
> > > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.=
com>
> > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Apparently this fails on ppc build testing. Please supply build fix a=
sap
> > > (or I guess we need to revert). I'm kinda not clear why this only sho=
wed
> > > up when I merged the drm-misc-next pr into drm-next ...
> >
> > I'm really wondering this as well. It looks like PMD_SHIFT isn't a cons=
tant
> > on this particular platform.
> >
> > But from what I can find in the upstream 6.2 kernel PMD_SHIFT always se=
ems
> > to be a constant.
> >
> > So how exactly can that here break?
>
> There's some in-flight patches to rework MAX_ORDER and other things in
> linux-next, maybe it's recent? If you check out linux-next then you need
> to reapply the patch (since sfr reverted it).

So I looked and on ppc64 PMD_SHIFT is defined in terms of
PTE_INDEX_SIZE, which is defined (for book3s) in terms of the variable
__pte_index_size. This is in 6.3 already and seems pretty old.

So revert? Or fixup patch to make this work on ppc?


> > > > ---
> > > >   drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++----------=
-
> > > >   1 file changed, 19 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/t=
tm_pool.c
> > > > index dfce896c4bae..18c342a919a2 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > @@ -47,6 +47,11 @@
> > > >   #include "ttm_module.h"
> > > > +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
> > > > +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
> > > > +/* Some architectures have a weird PMD_SHIFT */
> > > > +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <=3D MAX_ORDER ? __TTM_DIM_=
ORDER : MAX_ORDER)
> > > > +
> > > >   /**
> > > >    * struct ttm_pool_dma - Helper object for coherent DMA mappings
> > > >    *
> > > > @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
> > > >   static atomic_long_t allocated_pages;
> > > > -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> > > > -static struct ttm_pool_type global_uncached[MAX_ORDER];
> > > > +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
> > > > +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
> > > > -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER]=
;
> > > > -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> > > > +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_OR=
DER];
> > > > +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
> > > >   static spinlock_t shrinker_lock;
> > > >   static struct list_head shrinker_list;
> > > > @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struc=
t ttm_tt *tt,
> > > >           else
> > > >                   gfp_flags |=3D GFP_HIGHUSER;
> > > > - for (order =3D min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages=
));
> > > > + for (order =3D min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages=
));
> > > >                num_pages;
> > > >                order =3D min_t(unsigned int, order, __fls(num_pages=
))) {
> > > >                   struct ttm_pool_type *pt;
> > > > @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struc=
t device *dev,
> > > >           if (use_dma_alloc) {
> > > >                   for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > > -                 for (j =3D 0; j < MAX_ORDER; ++j)
> > > > +                 for (j =3D 0; j < TTM_DIM_ORDER; ++j)
> > > >                                   ttm_pool_type_init(&pool->caching=
[i].orders[j],
> > > >                                                      pool, i, j);
> > > >           }
> > > > @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> > > >           if (pool->use_dma_alloc) {
> > > >                   for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > > -                 for (j =3D 0; j < MAX_ORDER; ++j)
> > > > +                 for (j =3D 0; j < TTM_DIM_ORDER; ++j)
> > > >                                   ttm_pool_type_fini(&pool->caching=
[i].orders[j]);
> > > >           }
> > > > @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_=
file *m)
> > > >           unsigned int i;
> > > >           seq_puts(m, "\t ");
> > > > - for (i =3D 0; i < MAX_ORDER; ++i)
> > > > + for (i =3D 0; i < TTM_DIM_ORDER; ++i)
> > > >                   seq_printf(m, " ---%2u---", i);
> > > >           seq_puts(m, "\n");
> > > >   }
> > > > @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_=
pool_type *pt,
> > > >   {
> > > >           unsigned int i;
> > > > - for (i =3D 0; i < MAX_ORDER; ++i)
> > > > + for (i =3D 0; i < TTM_DIM_ORDER; ++i)
> > > >                   seq_printf(m, " %8u", ttm_pool_type_count(&pt[i])=
);
> > > >           seq_puts(m, "\n");
> > > >   }
> > > > @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages=
)
> > > >   {
> > > >           unsigned int i;
> > > > + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
> > > > + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
> > > > +
> > > >           if (!page_pool_size)
> > > >                   page_pool_size =3D num_pages;
> > > >           spin_lock_init(&shrinker_lock);
> > > >           INIT_LIST_HEAD(&shrinker_list);
> > > > - for (i =3D 0; i < MAX_ORDER; ++i) {
> > > > + for (i =3D 0; i < TTM_DIM_ORDER; ++i) {
> > > >                   ttm_pool_type_init(&global_write_combined[i], NUL=
L,
> > > >                                      ttm_write_combined, i);
> > > >                   ttm_pool_type_init(&global_uncached[i], NULL, ttm=
_uncached, i);
> > > > @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
> > > >   {
> > > >           unsigned int i;
> > > > - for (i =3D 0; i < MAX_ORDER; ++i) {
> > > > + for (i =3D 0; i < TTM_DIM_ORDER; ++i) {
> > > >                   ttm_pool_type_fini(&global_write_combined[i]);
> > > >                   ttm_pool_type_fini(&global_uncached[i]);
> > > > --
> > > > 2.39.2
> > > >
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
