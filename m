Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113044B5353
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 15:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107510E284;
	Mon, 14 Feb 2022 14:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4C10E284
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 14:29:31 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id o5so14869713qvm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DzUUlCeWb+cjyVm153dfLjuHJsL1m5SuX1sWSXylJ+0=;
 b=lv7qGdZo+Rshw3pOGZwK4nAvoI0nZKIGWSoLVTwLSCp2W2mR8DWPmaHBWEiqo8chu1
 E6KKA+x7zOvHWwaL7tUobjySSPN0WnPeTmVDhUHGVPHMnyJk06PS8x9ANhQeV1auCrg4
 ksFK6O/Ar+HyRKJb6XsBLumART8SzuCP5oGUUvCdQ0mtgHYocyVhOt28gdEvmaL6nk4d
 Wu6d4gtGbT1uUOFnI1hwsaFMHRaBDzvk1oSqcYJZzwXU95aAY1CEShNDluuPJJE8kJLv
 KWMrmfkdSi6/KsRX3fl5i7/RpucwWwcYHTJWh26Iq48WB0tYkTLadJxRSeLeCmswZskV
 43Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DzUUlCeWb+cjyVm153dfLjuHJsL1m5SuX1sWSXylJ+0=;
 b=PNew8JcROVW5GmNTAO/GgCoNrzHtY2zn7pdAOmTzkM0rmhueQytdyKMJIfEG0C7igM
 E5noBAW6qbU35OVYWsZ2dJ7SMpuBQG5JNC8mkWyrvIEbwRldBkAIfZ/aMs9Xm+5yTIF/
 xc8Xi2Lk8dSB/8xKzTHixC/c0ElWC29Q+9flRGVYE2n3mteopYH7/JbSwSPz8nJHH18o
 R/Hhh4pzgd/BGyld/9FlSr/VVg9iwTlC1S4ghD9Ifw2VT5V4KyioVkmX+EVFEsSOlF7g
 effzR/EMAOVeaoU/jyGVLhqRr4/hnSKmN7tAciKN16WA4h2o6nIw4nFf2nFj48WpfJUc
 OyIg==
X-Gm-Message-State: AOAM530KG8ay6Is7SrdCJegZAbq7qjE4sAe6jzhb7vZPLr7g8b65k+m3
 T2lEx2Ij07QH8f4U5REnOJxnWiON1Y681PUnQmMe4l5Qz64=
X-Google-Smtp-Source: ABdhPJxnSimm+BPxxsME4wVF+Hy8UFVh27lN1uY8mUsL1chNB3w1p9paE++9rp+Mx+w/w4UETx8xji6TIPn0iXN3260=
X-Received: by 2002:a05:6214:c88:: with SMTP id
 r8mr3411214qvr.21.1644848970625; 
 Mon, 14 Feb 2022 06:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-2-christian.koenig@amd.com>
 <CAM0jSHO-h5i8yrX+eDf8P-5GL=4m-5t3ENkEb0HHjU3pU5fomw@mail.gmail.com>
 <331d7611-2af6-cd22-7c7e-9e7188300d78@gmail.com>
In-Reply-To: <331d7611-2af6-cd22-7c7e-9e7188300d78@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 14:29:04 +0000
Message-ID: <CAM0jSHM-VqDa8R9Kv_5oS2e2uqRPiY=UAtfwhBJt=2dNFbTPjg@mail.gmail.com>
Subject: Re: [PATCH 02/11] drm/ttm: add common accounting to the resource mgr
 v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 13:23, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 14.02.22 um 11:34 schrieb Matthew Auld:
> > On Mon, 14 Feb 2022 at 09:34, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> It makes sense to have this in the common manager for debugging and
> >> accounting of how much resources are used.
> >>
> >> v2: cleanup kerneldoc a bit
> >> v3: drop the atomic, update counter under lock instead
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Reviewed-by: Huang Rui <ray.huang@amd.com> (v1)
> >> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >> ---
> >>   drivers/gpu/drm/ttm/ttm_resource.c | 30 ++++++++++++++++++++++++++++=
++
> >>   include/drm/ttm/ttm_resource.h     | 11 +++++++++--
> >>   2 files changed, 39 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/=
ttm_resource.c
> >> index ae40e144e728..bbb8a0f7aa14 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> >> @@ -41,6 +41,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
> >>                          const struct ttm_place *place,
> >>                          struct ttm_resource *res)
> >>   {
> >> +       struct ttm_resource_manager *man;
> >> +
> >>          res->start =3D 0;
> >>          res->num_pages =3D PFN_UP(bo->base.size);
> >>          res->mem_type =3D place->mem_type;
> >> @@ -50,6 +52,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo=
,
> >>          res->bus.is_iomem =3D false;
> >>          res->bus.caching =3D ttm_cached;
> >>          res->bo =3D bo;
> >> +
> >> +       man =3D ttm_manager_type(bo->bdev, place->mem_type);
> >> +       spin_lock(&bo->bdev->lru_lock);
> >> +       man->usage +=3D bo->base.size;
> >> +       spin_unlock(&bo->bdev->lru_lock);
> >>   }
> >>   EXPORT_SYMBOL(ttm_resource_init);
> >>
> >> @@ -65,6 +72,9 @@ EXPORT_SYMBOL(ttm_resource_init);
> >>   void ttm_resource_fini(struct ttm_resource_manager *man,
> >>                         struct ttm_resource *res)
> >>   {
> >> +       spin_lock(&man->bdev->lru_lock);
> >> +       man->usage -=3D res->bo->base.size;
> >> +       spin_unlock(&man->bdev->lru_lock);
> >>   }
> >>   EXPORT_SYMBOL(ttm_resource_fini);
> >>
> >> @@ -166,6 +176,7 @@ void ttm_resource_manager_init(struct ttm_resource=
_manager *man,
> >>          spin_lock_init(&man->move_lock);
> >>          man->bdev =3D bdev;
> >>          man->size =3D size;
> >> +       man->usage =3D 0;
> >>
> >>          for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> >>                  INIT_LIST_HEAD(&man->lru[i]);
> >> @@ -226,6 +237,24 @@ int ttm_resource_manager_evict_all(struct ttm_dev=
ice *bdev,
> >>   }
> >>   EXPORT_SYMBOL(ttm_resource_manager_evict_all);
> >>
> >> +/**
> >> + * ttm_resource_manager_usage
> >> + *
> >> + * @man: A memory manager object.
> >> + *
> >> + * Return how many resources are currently used.
> > Maybe mention the units here?
> >
> > "Return how many resources are currently used, in bytes."
>
> Well exactly that's not correct. The whole idea here is that these are
> driver defined units.

Ok, I was assuming bo->base.size to operate in bytes(the kernel-doc
seems to indicate that) and ttm_resource_{init, fini} are using this
to track the man->usage.

>
> E.g. for the AMDGPU OA and GWS resources it's essentially a hardware bloc=
k.
>
> Regards,
> Christian.
>
> >
> > Anyway,
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> >> + */
> >> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
> >> +{
> >> +       uint64_t usage;
> >> +
> >> +       spin_lock(&man->bdev->lru_lock);
> >> +       usage =3D man->usage;
> >> +       spin_unlock(&man->bdev->lru_lock);
> >> +       return usage;
> >> +}
> >> +EXPORT_SYMBOL(ttm_resource_manager_usage);
> >> +
> >>   /**
> >>    * ttm_resource_manager_debug
> >>    *
> >> @@ -238,6 +267,7 @@ void ttm_resource_manager_debug(struct ttm_resourc=
e_manager *man,
> >>          drm_printf(p, "  use_type: %d\n", man->use_type);
> >>          drm_printf(p, "  use_tt: %d\n", man->use_tt);
> >>          drm_printf(p, "  size: %llu\n", man->size);
> >> +       drm_printf(p, "  usage: %llu\n", ttm_resource_manager_usage(ma=
n));
> >>          if (man->func->debug)
> >>                  man->func->debug(man, p);
> >>   }
> >> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_reso=
urce.h
> >> index 555a11fb8a7f..323c14a30c6b 100644
> >> --- a/include/drm/ttm/ttm_resource.h
> >> +++ b/include/drm/ttm/ttm_resource.h
> >> @@ -27,6 +27,7 @@
> >>
> >>   #include <linux/types.h>
> >>   #include <linux/mutex.h>
> >> +#include <linux/atomic.h>
> >>   #include <linux/dma-buf-map.h>
> >>   #include <linux/dma-fence.h>
> >>   #include <drm/drm_print.h>
> >> @@ -130,10 +131,15 @@ struct ttm_resource_manager {
> >>          struct dma_fence *move;
> >>
> >>          /*
> >> -        * Protected by the global->lru_lock.
> >> +        * Protected by the bdev->lru_lock.
> >>           */
> >> -
> >>          struct list_head lru[TTM_MAX_BO_PRIORITY];
> >> +
> >> +       /**
> >> +        * @usage: How much of the resources are used, protected by th=
e
> >> +        * bdev->lru_lock.
> >> +        */
> >> +       uint64_t usage;
> >>   };
> >>
> >>   /**
> >> @@ -283,6 +289,7 @@ void ttm_resource_manager_init(struct ttm_resource=
_manager *man,
> >>   int ttm_resource_manager_evict_all(struct ttm_device *bdev,
> >>                                     struct ttm_resource_manager *man);
> >>
> >> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)=
;
> >>   void ttm_resource_manager_debug(struct ttm_resource_manager *man,
> >>                                  struct drm_printer *p);
> >>
> >> --
> >> 2.25.1
> >>
>
