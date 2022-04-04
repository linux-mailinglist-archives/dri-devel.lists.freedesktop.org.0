Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C794F159F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1D210ED11;
	Mon,  4 Apr 2022 13:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229EF10EBEC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 13:15:10 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso7246331otj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ltcBLZnS9V4e6M8X4B3SVyTJJYiEdsgwwMNRIIm4eM=;
 b=GT6ZVdnvwXWRynNVO2HsvEKzZ2iY7+vZP/hsKupcWJ2lyXbTaC8Rqwx3WEMutndi4/
 NazFg1P/AeOLEVVqMWZtK85Hdjfj9t+398s8ZV8ojB0MoI1ZTf1rbaDZTO9uzxH30T5O
 pKYliaLO2NGjwMtqiQu6A9+TIqORO/KCicgzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ltcBLZnS9V4e6M8X4B3SVyTJJYiEdsgwwMNRIIm4eM=;
 b=zb6lHTxdj3v+skSkqfwFVP12FxhxbPqOlcreOge0z9AzuA2g7mpJ21OqzzGFA9RCtI
 XP4rVgTx7XoZaGgWDcp3UIu99MPmKYzo7lLz0WfHkmyN3rRWGOo/26RlQYrc6AzfbWcr
 YLOW9y7WNsHFRZaoQLg5W7F6nwJ1GLYIs9Tw3sAkS6h78BBG/d+plbpoLov+ekQL6BYP
 B3ZRHN/nBQuXVka335/2ZwzWLzdv2s+yVZRI+5oCUcaM3m7In6Za80QgzaBPprzdVHMV
 rbwQ8N37+1XDWnFMhKXJAEhzlMu+2CUMH3n5vU0vGycNy2o+tWfzXc0lam5dYGwksb/7
 0uWA==
X-Gm-Message-State: AOAM532wPAmm4j9NAFiISM0OrkUD1zezqDdX+WRvKR3JIa+SW9Pzgh7a
 7xj1L+VMFxF3ockLw3UkKTLp/OFZYOadf1uze7E3uETfD+1hnA==
X-Google-Smtp-Source: ABdhPJzwc/6JKSurwuA08HmIO4hxb9rsacdoy6E3cMORuJfaHspgC781BzB4vt6dnB6l9i1wOUTXN7lBvXrsmtVPodU=
X-Received: by 2002:a05:6830:14d3:b0:5b2:49d9:17b6 with SMTP id
 t19-20020a05683014d300b005b249d917b6mr11585718otq.321.1649078108986; Mon, 04
 Apr 2022 06:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
 <20220331204651.2699107-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20220331204651.2699107-5-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 4 Apr 2022 15:14:57 +0200
Message-ID: <CAKMK7uHfq1GSfG60KHEQmYi2DtJwGA+1UL+2F-jrVoQx1zas5Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/etnaviv: Don't break exclusive fence ordering
To: DRI Development <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 22:46, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> There's only one exclusive slot, and we must not break the ordering.
> Adding a new exclusive fence drops all previous fences from the
> dma_resv. To avoid violating the signalling order we err on the side of
> over-synchronizing by waiting for the existing fences, even if
> userspace asked us to ignore them.
>
> A better fix would be to us a dma_fence_chain or _array like e.g.
> amdgpu now uses, but it probably makes sense to lift this into
> dma-resv.c code as a proper concept, so that drivers don't have to
> hack up their own solution each on their own. Hence go with the simple
> fix for now.
>
> Another option is the fence import ioctl from Jason:
>
> https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/
>
> v2: Improve commit message per Lucas' suggestion.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org

Hm thinking about this some more, with Christian's dma_resv_usage work
this shouldn't be needed anymore.

Christian, do you want me to drop this?
-Daniel

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 5f502c49aec2..14c5ff155336 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -178,19 +178,21 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>         for (i = 0; i < submit->nr_bos; i++) {
>                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
>                 struct dma_resv *robj = bo->obj->base.resv;
> +               bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
>
> -               if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
> +               if (!(write)) {
>                         ret = dma_resv_reserve_shared(robj, 1);
>                         if (ret)
>                                 return ret;
>                 }
>
> -               if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> +               /* exclusive fences must be ordered */
> +               if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
>                         continue;
>
>                 ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
>                                                               &bo->obj->base,
> -                                                             bo->flags & ETNA_SUBMIT_BO_WRITE);
> +                                                             write);
>                 if (ret)
>                         return ret;
>         }
> --
> 2.34.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
