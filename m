Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56145918ED1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 20:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6D410E9A3;
	Wed, 26 Jun 2024 18:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RnLn6kA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDC910E9A3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 18:51:11 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-37621e7468eso2896815ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719427870; x=1720032670;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8d6uZEg1ICTrlLD+Rn8W5NaQPKS3C+VdvtVteNUOcU=;
 b=RnLn6kA5WtzUSD0aAjL7m1dCfIDA/pirl+Uvp9X1zmZXI05XBt31FepyL3dfHNZV67
 1t0eWR3qdh6zqBAcD3LMONHvzM8c/sulLUFe+7vHhk27x6zN+nPeWCJqDbdhJgSoqYQR
 5nOKN4pyNqZ5mnQMcD63vWrhbZJAt/3t9rVbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719427870; x=1720032670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8d6uZEg1ICTrlLD+Rn8W5NaQPKS3C+VdvtVteNUOcU=;
 b=azWlBombsKncdLUM4eWNryp+pT1kE5FCcAPf1HdtaC0y7w6hu3+vC3Xt6nCXfm3ACp
 5LcRTP2nlFL97kYqqcFkgqZxgb/dX62ldw5/HLFvwm3jfo88xFkYoLJtberww1+kJlTU
 ljm0uqo3m+3OfpA1NooXnQeDBaL90euH7TBPfySJv9B5+QogEhKuJh90Tzn4j9QFcoCn
 tpKtySVCicDENIf2sOkB7IqMhcr0TMH0nIZGLwVAgsHMzPloExQDK9p62bgJsbT9zcna
 ZPRws49oivRDmcZBxuKGmkRnF2tlrtkmMlUI/yvCs2Q01wmEJcLbYxK0ZJSsm/J1aoF0
 55ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUABJKrYHwS8FhZpoigZ5w2uRhBB3C5aVhOJ6InXl9tydb7oeu5pBeRJyitvWmHOxRawwVsPUA/GpucpMjuejlYzkx+txPhlUx839fVZY6X
X-Gm-Message-State: AOJu0Yzg052iHKtO4KHfL9D+wM9IN2OJcmHXd7LuTA6ji6Q8rHxwzsUH
 +GtAv7/q0pp0PzBOQfHADF/GnfXfCVJgYdN18KiXab2A/l3OenOJVrnzKyOAjYw3YzjFlc+5Jf3
 hxaIED7D6aE5lRm/Q/70fdQzfGCJl65PVUJuR
X-Google-Smtp-Source: AGHT+IFYmoIPuXrQ6X+r4Y9Mx9oFP9At/nom0H2pGqOwukQ0q/k1IJpylwBvpAp3LdN5ahziYWtZdBiaT2jjIi2gCrA=
X-Received: by 2002:a92:ca4e:0:b0:375:a3eb:bfcd with SMTP id
 e9e14a558f8ab-37639edb0e5mr69485865ab.8.1719427870589; Wed, 26 Jun 2024
 11:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
 <20240624151401.GB8706@willie-the-truck>
In-Reply-To: <20240624151401.GB8706@willie-the-truck>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 26 Jun 2024 11:50:59 -0700
Message-ID: <CAJs_Fx5jWJTUjaw1X0htzsmBVo_E6kkzOFDFMM5gazata5u0Vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>, 
 Joao Martins <joao.m.martins@oracle.com>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
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

On Mon, Jun 24, 2024 at 8:14=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add an io-pgtable method to walk the pgtable returning the raw PTEs tha=
t
> > would be traversed for a given iova access.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
> >  include/linux/io-pgtable.h     |  4 +++
> >  2 files changed, 46 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f7828a7aad41..f47a0e64bb35 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgta=
ble_ops *ops, unsigned long iov
> >                               data->start_level, ptep);
> >  }
> >
> > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > -                                      unsigned long iova)
> > +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned =
long iova,
> > +                     int (*cb)(void *cb_data, void *pte, int level),
> > +                     void *cb_data)
> >  {
> >       struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> >       arm_lpae_iopte pte, *ptep =3D data->pgd;
> >       int lvl =3D data->start_level;
> > +     int ret;
> >
> >       do {
> >               /* Valid IOPTE pointer? */
> >               if (!ptep)
> > -                     return 0;
> > +                     return -EFAULT;
>
> nit: -ENOENT might be a little better, as we're only checking against a
> NULL entry rather than strictly any faulting entry.
>
> >               /* Grab the IOPTE we're interested in */
> >               ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct i=
o_pgtable_ops *ops,
> >
> >               /* Valid entry? */
> >               if (!pte)
> > -                     return 0;
> > +                     return -EFAULT;
>
> Same here (and at the end of the function).
>
> > +
> > +             ret =3D cb(cb_data, &pte, lvl);
>
> Since pte is on the stack, rather than pointing into the actual pgtable,
> I think it would be clearer to pass it by value to the callback.
>
> > +             if (ret)
> > +                     return ret;
> >
> > -             /* Leaf entry? */
> > +             /* Leaf entry?  If so, we've found the translation */
> >               if (iopte_leaf(pte, lvl, data->iop.fmt))
> > -                     goto found_translation;
> > +                     return 0;
> >
> >               /* Take it to the next level */
> >               ptep =3D iopte_deref(pte, data);
> >       } while (++lvl < ARM_LPAE_MAX_LEVELS);
> >
> >       /* Ran out of page tables to walk */
> > +     return -EFAULT;
> > +}
> > +
> > +struct iova_to_phys_walk_data {
> > +     arm_lpae_iopte pte;
> > +     int level;
> > +};
>
> Expanding a little on Robin's suggestion, why don't we drop this structur=
e
> in favour of something more generic:
>
>         struct arm_lpae_walk_data {
>                 arm_lpae_iopte ptes[ARM_LPAE_MAX_LEVELS];
>         };
>
> and then do something in the walker like:
>
>         if (cb && !cb(pte, lvl))
>                 walk_data->ptes[lvl] =3D pte;
>

So thinking about this some more... if I use a walk_data struct to
return the PTEs, I can just get rid of the callback entirely.  That
ends up looking more like my first version.   The callback taking
void* was mainly to avoid coding the PTE size in the generic
io_pgtable interface.  But if we just go with u64, because that is the
biggest PTE size we need to deal with, then it all gets simpler.  (The
callback was actually a semi-awkward interface to use from drm/msm.)

BR,
-R

> which could return the physical address at the end, if it reaches a leaf
> entry. That way arm_lpae_iova_to_phys() is just passing a NULL callback
> to the walker and your debug callback just needs to return 0 (i.e. the
> callback is basically just saying whether or not to continue the walk).
>
> Will
