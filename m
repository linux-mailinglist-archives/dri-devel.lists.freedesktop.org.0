Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08F4F31E3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 14:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6915110E204;
	Tue,  5 Apr 2022 12:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FD210E54F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 12:51:50 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-df22f50e0cso14284217fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vAMZWyQPi++NIG3C7Hd5tl61Qwhvt+GmWt/uyMS5zPc=;
 b=F88Er/sA6gn4c3Q9c0kbiamCyrxgXHhzfpD1/ZZR2jc4+kPIodKB1c4IJDgnKu/3oY
 ZsdILjG4eAHrFekM+tqqawcTtcWyCc6PBXpffmxP60FdUwv9PmFa9kXS57DbGgQFMDC7
 LzRb3bz313JeP1VbI/P9xd10yD8Qgyl7neROA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vAMZWyQPi++NIG3C7Hd5tl61Qwhvt+GmWt/uyMS5zPc=;
 b=4NV2XoMiv3vOVV+2t9SmRXcln7O4F0IHm+KtdFr11R4VeCtfyL9+DdSmE8ipbRKNKX
 aIr9hMv0CrwPh4LrP+sFEqIKRGm+EE9CNE2ZRqBxkh/eGrAsI09TyKSLPtHyMhZdKpmM
 GXghMMBSctGHcaSETnQo0FVqUNJkD6BmtKXgtnaVtxIG08vNlS47zL5uDMY+qnZjoGjw
 3bXgEay9a/wFTXwH1obaqQUVNmb+LbUL7IuPLtMC/wWmPjrRUHL8coM3fyiqjmekuh2T
 hGf2XvvNsIlcwlJp40NP178TmXfSVATaHsiWLki4zAB2m7iCX5Jm1Q+jf88nklYuU+WQ
 6+Hg==
X-Gm-Message-State: AOAM533gutEvby28YRU09muJ2oxRFaZizotaLAH31+bl9xcFbCuaHmQP
 9bexF9hVfi78Lk1kueZf65MtGAUiMI4II0mjyiamfA==
X-Google-Smtp-Source: ABdhPJwwLk1dHXoNHSXp8culFysPIZTh/YIWalKSjWBtY1UyLgct8tsmj2mD40Po3KXMnaYTKh3tBv4zL5eP301YRRU=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr1464435oap.228.1649163109986; Tue, 05
 Apr 2022 05:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-23-christian.koenig@amd.com>
 <YkMtmPFWiaLFEnWg@phenom.ffwll.local>
 <0fe76123-e2a0-908d-49cd-8fc4f442123f@amd.com>
In-Reply-To: <0fe76123-e2a0-908d-49cd-8fc4f442123f@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 5 Apr 2022 14:51:38 +0200
Message-ID: <CAKMK7uGD28a9DJzEuP7GoPPQ8at2x1KkNQboW+B=suG9RDN5+A@mail.gmail.com>
Subject: Re: [PATCH 23/23] drm/ttm: remove bo->moving
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 11:25, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 29.03.22 um 18:02 schrieb Daniel Vetter:
> > On Mon, Mar 21, 2022 at 02:58:56PM +0100, Christian K=C3=B6nig wrote:
> > [SNIP]
> >>   static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/dr=
m/vmwgfx/vmwgfx_resource.c
> >> index f999fdd927df..c6d02c98a19a 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> >> @@ -1163,12 +1163,6 @@ int vmw_resources_clean(struct vmw_buffer_objec=
t *vbo, pgoff_t start,
> >>              *num_prefault =3D __KERNEL_DIV_ROUND_UP(last_cleaned - re=
s_start,
> >>                                                    PAGE_SIZE);
> >>              vmw_bo_fence_single(bo, NULL);
> >> -            if (bo->moving)
> >> -                    dma_fence_put(bo->moving);
> >> -
> >> -            return dma_resv_get_singleton(bo->base.resv,
> >> -                                          DMA_RESV_USAGE_KERNEL,
> >> -                                          &bo->moving);
> > This seems to be entirely misplaced and I'm pretty sure doesn't even
> > compile interim.
>
> Mhm, removing that is correctly placed as far as I can see.
>
> What VMWGFX does here is to update bo->moving to please TTM, but since
> we now drop the bo->moving fence from TTM and always wait for all fences
> with DMA_RESV_USAGE_KERNEL before allowing CPU access that workaround
> isn't necessary any more.

Hm yeah that makes sense. Just out of paranoid would be good if you
can get an ack on the previous patch that downgrades from USAGE_WRITE
to USAGE_KERNEL here from vmwgfx folks, but I guess that should be
fine.

Just from reading the commit that introduce this is looks a little bit
like the intent is actually to make any USAGE_WRITE a mandatory fence
you can never cheat out of, but maybe I got this all wrong.

>
> >>      }
> >>
> >>      return 0;
> >> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api=
.h
> >> index c17b2df9178b..4c7134550262 100644
> >> --- a/include/drm/ttm/ttm_bo_api.h
> >> +++ b/include/drm/ttm/ttm_bo_api.h
> >> @@ -97,7 +97,6 @@ struct ttm_tt;
> >>    * @lru: List head for the lru list.
> >>    * @ddestroy: List head for the delayed destroy list.
> >>    * @swap: List head for swap LRU list.
> >> - * @moving: Fence set when BO is moving
> >>    * @offset: The current GPU offset, which can have different meaning=
s
> >>    * depending on the memory type. For SYSTEM type memory, it should b=
e 0.
> >>    * @cur_placement: Hint of current placement.
> >> @@ -150,7 +149,6 @@ struct ttm_buffer_object {
> >>       * Members protected by a bo reservation.
> >>       */
> >>
> >> -    struct dma_fence *moving;
> >>      unsigned priority;
> >>      unsigned pin_count;
> > Aside from the vmwgfx thing this looks good. With the vmwgfx patch spli=
t
> > issue (I think it's just that) fixed:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Is it enough if I explain why we update VMWGFX in the commit message?

Yeah sounds fine to me, this patch isn't a functional change now that
you explained it that's clear. I'm still wondering whether there's
something fishy going on, but that's on earlier patches.
-Daniel

>
> Thanks,
> Christian.
>
> >
> >>
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
