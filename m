Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC54EBFD2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 13:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89B410E954;
	Wed, 30 Mar 2022 11:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62DA10E954
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 11:32:43 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id i4so17748479qti.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLUVH17Uign6BvR+nDTbfXhu0XLyilVb6NY5dVncXfw=;
 b=bNxRNv7F13x/jJOsff+xDk0gPlGPDOyrSemkFfl4L44wg4lqMIDbt2LieOwGnTZq/i
 UDByN8P0ETFO3gZBAgCUWJQEe743l1wBK2B6IwbXcrlE/PZnNFW1NUxWghXeH74sIsTT
 uWhRffTGlIS1hA1Avx8XQXHwFUz871acsJFssUQZsHgCNQ0wF6PQ6QbmKTpEDebb6qXQ
 7x3X7In0H4akcpSzxJJ7KM91JBUCTz11squZ+uGVpPIbFB2cLruMZk1ugWxVhl1mEgUJ
 /gKGIpR/4d2A5/+0xHiWMjElo8vns3shGA8xBxVvD6gpkWSTCnQt2/o/02p2Y9gmzIGb
 902A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLUVH17Uign6BvR+nDTbfXhu0XLyilVb6NY5dVncXfw=;
 b=vifbuJIkxFK74WyhNH89t1hQ7+AhETWkRr9NTBZyi0rlqF2YFonBStDE11Kbxuogup
 DRYoMagaLGxUDnQAYnpzeYO48AFCwD7LYabXJVIvO7e7TnP1yw6yPiGDswYqFHeKl6SE
 0hedcctf6kiv9ej+9yrEoW6WDlUxxlSX7k0IR8K5ykJvPez0N1cvRNlyTi7t7mOwU9LQ
 Mz8pq+xMQpuB369U5I2ObSvWVjN+bhumo7NmL29WuT/IZdq//HTCFtcKGyKprio2M1l9
 pbK+iq+hTXLN6IiuQ9UzrB6Qi1kf9L3exVA8vQOGvmDhtA7VvE3/9HMi18kxpuXCM8y6
 gfQg==
X-Gm-Message-State: AOAM531pBadYCtmMTXam1OnF4+HL8mWfZvsCqSr0tp/5D0FC8La2ELtq
 cK+ffYE0y08i9VwYbnAzUNp4KIzBpFENGNg4dQifeg==
X-Google-Smtp-Source: ABdhPJwx+6eprB6Q5XPxYzgTUiqSDOQdVYYmG242HODu6johshrHsDsGJYL1m7iaKoPFFzKcIyGksMtG0596HZPmvb4=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr32044988qta.295.1648639962608; Wed, 30
 Mar 2022 04:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-4-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Mar 2022 14:32:31 +0300
Message-ID: <CAA8EJpqAaW0Q-QeQObonUqAhdWaw8mPPvChmboH88ttTx+2XGg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/msm/gem: Split out inuse helper
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Prep for a following patch.  While we are at it, convert a few remaining
> WARN_ON()s to GEM_WARN_ON().

Well... GEM_WARN_ON doesn't really look like a 'while we are at it'.
It might be better to split it into a separate commit.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c     |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h     |  1 +
>  drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++-----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index a4f61972667b..f96d1dc72021 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>                                 name, comm ? ":" : "", comm ? comm : "",
>                                 vma->aspace, vma->iova,
>                                 vma->mapped ? "mapped" : "unmapped",
> -                               vma->inuse);
> +                               msm_gem_vma_inuse(vma));
>                         kfree(comm);
>                 }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 947ff7d9b471..1b7f0f0b88bf 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -61,6 +61,7 @@ struct msm_gem_vma {
>  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma, int npages,
>                 u64 range_start, u64 range_end);
> +bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma);
>  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index f914ddbaea89..dc2ae097805e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
>         return aspace;
>  }
>
> +bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
> +{
> +       return !!vma->inuse;
> +}

It almost  asks to be a static inline. The patch 04 makes it complex,
so it's probably not that important.

> +
>  /* Actually unmap memory for the vma */
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
> @@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>         unsigned size = vma->node.size << PAGE_SHIFT;
>
>         /* Print a message if we try to purge a vma in use */
> -       if (WARN_ON(vma->inuse > 0))
> +       if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
>                 return;
>
>         /* Don't do anything if the memory isn't mapped */
> @@ -61,7 +66,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
>  {
> -       if (!WARN_ON(!vma->iova))
> +       if (!GEM_WARN_ON(!vma->iova))
>                 vma->inuse--;
>  }
>
> @@ -73,7 +78,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>         unsigned size = npages << PAGE_SHIFT;
>         int ret = 0;
>
> -       if (WARN_ON(!vma->iova))
> +       if (GEM_WARN_ON(!vma->iova))
>                 return -EINVAL;
>
>         /* Increase the usage counter */
> @@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
>  {
> -       if (WARN_ON(vma->inuse > 0 || vma->mapped))
> +       if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
>                 return;
>
>         spin_lock(&aspace->lock);
> @@ -120,7 +125,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>  {
>         int ret;
>
> -       if (WARN_ON(vma->iova))
> +       if (GEM_WARN_ON(vma->iova))
>                 return -EBUSY;
>
>         spin_lock(&aspace->lock);
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
