Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E51737781
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 00:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D560C10E033;
	Tue, 20 Jun 2023 22:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CE710E033
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 22:31:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so7003852e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687300303; x=1689892303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8g7XlJwr5YrB5QgygUhOX+J8ps+0PMCUjpiQSimRqI=;
 b=QQ6wf5t4OPvWtBiXbHi9kFp6xs+igp2FHkxmVTjd/RZzFrBtEyfkzp28dfCKmXFD6b
 2K+ESddjzaKsCoSe3Bbgf9Ac+cbRpLOQfh+RfZVvxmF4PPfHMPq9s7AULasBaWmGi2of
 mgVWUGDrzQUD9rTKRM4rcP1XqCRPkjSrIl++5TEeP0GifQMRugFrPNPAJd9LbrghSoiZ
 3LqytqPB06aRyyuu7cV0T3YUCm3v1E86oSr/MhfjSdi35FwwLtWMqqMbtXWDTVgoYhIU
 eV5GIFjSPJY/UIlPer3Rwosgn8kXLNHfm05dJYEeCeTUaVEtygXWZwAWUw3ujSOvn5ji
 Fnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687300303; x=1689892303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8g7XlJwr5YrB5QgygUhOX+J8ps+0PMCUjpiQSimRqI=;
 b=esIpyaa+3UCHQZKUvyxr2tGomVJ9vRvZ0blQYmiIYDcbwKMpzgm/kTtD+nkQ24tJAi
 5OWNa3heQ+oRdpA5MJYb2fScMDplP0KNnVAYfqEbL+lcJe5auntDPjVup7ItIQxo85w4
 qBe2FuRx8zL9hJb25OmsCbxOqwqLmjqxV7dmY8eOuAMoItX5UKxjeJ6NCLiUGl/kk/tc
 8QhbuLZ/2LixZ3yaT2M0loUQAOMRY9h2SBd5EnfQmPInu7IuyJ9r75e/b8uE7wRl8De5
 X5+OoZWBlexJmOq0OzIr+vo68SC2zvlNd3b6eJGlyBkV4yw0CrU51CaPQCiOtkT1gZEV
 JYFQ==
X-Gm-Message-State: AC+VfDzT2LN38nJEFKD51R3DjfDQRUZOG2k+JIZ3nd/EH7Casua67//5
 Q/51amqsrT8P/XEV0A1R6ag=
X-Google-Smtp-Source: ACHHUZ5Ao1x+QM+m6wssekEtutjiw4nI0b4dmUXXaJSrXCZHUQkgmjFdNnMptISbiZE1sVrciuVvpw==
X-Received: by 2002:a05:6512:551:b0:4f8:675c:3667 with SMTP id
 h17-20020a056512055100b004f8675c3667mr5191712lfl.21.1687300302951; 
 Tue, 20 Jun 2023 15:31:42 -0700 (PDT)
Received: from suse.localnet (host-95-233-134-55.retail.telecomitalia.it.
 [95.233.134.55]) by smtp.gmail.com with ESMTPSA id
 m4-20020a5d56c4000000b003078354f774sm2888992wrw.36.2023.06.20.15.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 15:31:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sumitra Sharma <sumitraartsy@gmail.com>
Subject: Re: [PATCH] drm/gma500: Replace kmap{,_atomic}() with page_address()
Date: Wed, 21 Jun 2023 00:31:40 +0200
Message-ID: <2565983.Lt9SDvczpP@suse>
In-Reply-To: <20230620180148.GA419134@sumitra.com>
References: <20230620180148.GA419134@sumitra.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Deepak R Varma <drv@mailo.com>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>,
 zhao1.liu@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On marted=EC 20 giugno 2023 20:01:48 CEST Sumitra Sharma wrote:
> Remove unnecessary calls to kmap{,_atomic}() when acquiring
> pages using GFP_DMA32.
>=20
> The GFP_DMA32 uses the DMA32 zone to satisfy the allocation
> requests. Therefore, pages allocated with GFP_DMA32 cannot
> come from Highmem.
>=20
> Avoid using calls to kmap_local_page() / kunmap_local() and
> kmap() / kunmap() in the psb_mmu_alloc_pd function. Instead,
> utilize page_address().
>=20
> Remove the usage of kmap_atomic() / kunmap_atomic() in the
> psb_mmu_alloc_pt function. Use page_address() instead.
>=20
> Substitute kmap_atomic(pt->p) / kunmap_atomic(pt->v) calls
> in the psb_mmu_pt_alloc_map_lock() and psb_mmu_pt_unmap_unlock()
> functions with page_address(pt->p). This is possible as
> pt =3D psb_mmu_alloc_pt(pd) allocates a page using
> pt->p =3D alloc_page(GFP_DMA32).

Sumitra,

I'm sorry because this patch cannot acked with this commit message.

This commit message is missing two _really_ important information. Therefor=
e,=20
it is not acked. Please check again what I write below and either add the=20
missing information or change the code accordingly...

You should assure everybody that the code between the old kmap_atomic() /=20
kunmap_atomic() doesn't depend either on implicit pagefault_disable() or=20
preempt_disable() calls or both.=20

Please read again the section of the Highmem's documentation regarding=20
kmap_atomic() at https://docs.kernel.org/mm/highmem.html

In particular take care to read and understand what "[] the code between ca=
lls=20
to kmap_atomic() and kunmap_atomic() may implicitly depend on the side effe=
cts=20
of atomic mappings, i.e. disabling page faults or preemption, or both. In t=
hat=20
case, explicit calls to pagefault_disable() or preempt_disable() or both mu=
st=20
be made in conjunction with the use of kmap_local_page().".

Please study carefully also the following patch from Zhao, suggested by Ira=
=20
and reviewed by Ira and I: "[PATCH v2 3/9] drm/i915: Use kmap_local_page() =
in=20
gem/i915_gem_shmem.c". It's not yet reached upstream so you need to find it=
 in=20
lore.kernel.org at https://lore.kernel.org/lkml/20230329073220.3982460-4-zh=
ao1.liu@linux.intel.com/

Please note that, in turn, that patch also contains a link to a patch from =
Ira=20
who too had to disable faults (https://lore.kernel.org/all/
20220813220034.806698-1-ira.weiny@intel.com)

I haven't yet looked at your code. If any sections do depend on those impli=
cit=20
disables, you should act accordingly and add one or both of the above-
mentioned calls, even in cases where you get rid of local mappings.

Instead if the sections don't depend on the mentioned side effects, you sho=
uld=20
write something like what I wrote in "[PATCH] NFS: Convert kmap_atomic() to=
=20
kmap_local_folio()" that you can find at https://lore.kernel.org/lkml/
20230503172411.3356-1-fmdefrancesco@gmail.com/ or, by by using "git show=20
4b71e2416ec4".

Thanks for working on this,

=46abio=20

>=20
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/gpu/drm/gma500/mmu.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> index a70b01ccdf70..59aa5661e56a 100644
> --- a/drivers/gpu/drm/gma500/mmu.c
> +++ b/drivers/gpu/drm/gma500/mmu.c
> @@ -184,20 +184,15 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct
> psb_mmu_driver *driver, pd->invalid_pte =3D 0;
>  	}
>=20
> -	v =3D kmap_local_page(pd->dummy_pt);
> +	v =3D page_address(pd->dummy_pt);
>  	for (i =3D 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] =3D pd->invalid_pte;
>=20
> -	kunmap_local(v);
> -
> -	v =3D kmap_local_page(pd->p);
> +	v =3D page_address(pd->p);
>  	for (i =3D 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] =3D pd->invalid_pde;
>=20
> -	kunmap_local(v);
> -
> -	clear_page(kmap(pd->dummy_page));
> -	kunmap(pd->dummy_page);
> +	clear_page(page_address(pd->dummy_page));
>=20
>  	pd->tables =3D vmalloc_user(sizeof(struct psb_mmu_pt *) * 1024);
>  	if (!pd->tables)
> @@ -279,7 +274,7 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct
> psb_mmu_pd *pd)
>=20
>  	spin_lock(lock);
>=20
> -	v =3D kmap_atomic(pt->p);
> +	v =3D page_address(pt->p);
>  	clf =3D (uint8_t *) v;
>  	ptes =3D (uint32_t *) v;
>  	for (i =3D 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
> @@ -293,7 +288,6 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct
> psb_mmu_pd *pd) }
>  		mb();
>  	}
> -	kunmap_atomic(v);
>  	spin_unlock(lock);
>=20
>  	pt->count =3D 0;
> @@ -339,7 +333,7 @@ static struct psb_mmu_pt=20
*psb_mmu_pt_alloc_map_lock(struct
> psb_mmu_pd *pd, atomic_set(&pd->driver->needs_tlbflush, 1);
>  		}
>  	}
> -	pt->v =3D kmap_atomic(pt->p);
> +	pt->v =3D page_address(pt->p);
>  	return pt;
>  }
>=20
> @@ -365,7 +359,6 @@ static void psb_mmu_pt_unmap_unlock(struct psb_mmu_pt=
=20
*pt)
> struct psb_mmu_pd *pd =3D pt->pd;
>  	uint32_t *v;
>=20
> -	kunmap_atomic(pt->v);
>  	if (pt->count =3D=3D 0) {
>  		v =3D kmap_atomic(pd->p);
>  		v[pt->index] =3D pd->invalid_pde;
> --
> 2.25.1




