Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49141E143
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 20:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920886EC45;
	Thu, 30 Sep 2021 18:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122496EC45
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 18:34:42 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w206so8502410oiw.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzEFhcvH/Na9w/rh3vRVxZizFbaM18w+Th+vRdfVjxw=;
 b=OKZoY3nu59ohhZIGR9rXi4peRz7SQuNBkUJQZfiWyWMgNU31fC/2YKvc3uv3oLDxVz
 QupNMRm1Kou669rMbTjmKfydZLdm1h/SeITsid38QYO5+BBNQVc1DxwVgPZhI13xf7Vc
 YHe7NepSVTMn6I3JqwOQkIQqqKmwYSs2pWsH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzEFhcvH/Na9w/rh3vRVxZizFbaM18w+Th+vRdfVjxw=;
 b=Wn7F+yxEqOsJI+JWkaW+paZOCJ689oz1uSuok1JlIovAckSBxDbppOGPInU1eXOPDk
 +ZXcAMQjZLx63zMamEIK8hdIobGe+E1a9/oJ3mw+KRw/zhwSTOguT3/KSNf2PeK7flqI
 Ia1Zc/r6opbPM2me1odZ3I7Dk5MT+6Mtymf5LbQdnggX2v3TD13kdX1POzLST2LJv73s
 QIN6OrfJKf+I3C1T5Yoscv74wIzAZXijgrNZSKr5aHc1R7Bdr6F7WWTsZvKp8mY0oZhh
 Cti3ezM7ohx9qkvZ7DsZNp3VOtXJkp2NkI2ffJOkODVNp1Wg2i+GIQLWDMSQOQLe8Wh8
 YASA==
X-Gm-Message-State: AOAM5311e6gk3Xf+wYkL06F4WExbH5wgVTn3hGJ4JTbkVg3i6mOb3Ep1
 XGPAhIdmfOf0nc3HBwT7boKXxjBdrC4kGj5cRAzOWA==
X-Google-Smtp-Source: ABdhPJx9ELUrirwIP326cxiFbEMEgFqEj7GidWLBwOvTQWdCuRmskxLM7MklwgV1364VuPz5akiuxQy9fSdf1gjNQCk=
X-Received: by 2002:a05:6808:697:: with SMTP id
 k23mr620644oig.128.1633026881376; 
 Thu, 30 Sep 2021 11:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210930182506.1236811-1-robdclark@gmail.com>
In-Reply-To: <20210930182506.1236811-1-robdclark@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 30 Sep 2021 20:34:30 +0200
Message-ID: <CAKMK7uF1kfUD1mc4UScvVG0Su9HiN6M388YhT0jO+iGExxnVtw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Track current ctx by seqno
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>, 
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Yangtao Li <tiny.windzz@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 30, 2021 at 8:20 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> In theory a context can be destroyed and a new one allocated at the same
> address, making the pointer comparision to detect when we don't need to
> update the current pagetables invalid.  Instead assign a sequence number
> to each context on creation, and use this for the check.
>
> Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Usually the weak reference pattern is to wrap a spinlock or something
around it and clear it out on destruction. Or hold a full reference
(e.g. on intel hw the hw goes unhappy if there's no context/pagetables
at all, so we always need some). But I guess this works too.
-Daniel

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 ++++++++++-
>  drivers/gpu/drm/msm/msm_drv.c         |  3 +++
>  drivers/gpu/drm/msm/msm_drv.h         |  1 +
>  4 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5e1ae3df42ba..e0a8b2fd1ff0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>         u32 asid;
>         u64 memptr = rbmemptr(ring, ttbr0);
>
> -       if (ctx == a6xx_gpu->cur_ctx)
> +       if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
>                 return;
>
>         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> @@ -139,7 +139,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>         OUT_PKT7(ring, CP_EVENT_WRITE, 1);
>         OUT_RING(ring, 0x31);
>
> -       a6xx_gpu->cur_ctx = ctx;
> +       a6xx_gpu->cur_ctx_seqno = ctx->seqno;
>  }
>
>  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> @@ -1081,7 +1081,7 @@ static int hw_init(struct msm_gpu *gpu)
>         /* Always come up on rb 0 */
>         a6xx_gpu->cur_ring = gpu->rb[0];
>
> -       a6xx_gpu->cur_ctx = NULL;
> +       a6xx_gpu->cur_ctx_seqno = 0;
>
>         /* Enable the SQE_to start the CP engine */
>         gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 0bc2d062f54a..8e5527c881b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -19,7 +19,16 @@ struct a6xx_gpu {
>         uint64_t sqe_iova;
>
>         struct msm_ringbuffer *cur_ring;
> -       struct msm_file_private *cur_ctx;
> +
> +       /**
> +        * cur_ctx_seqno:
> +        *
> +        * The ctx->seqno value of the context with current pgtables
> +        * installed.  Tracked by seqno rather than pointer value to
> +        * avoid dangling pointers, and cases where a ctx can be freed
> +        * and a new one created with the same address.
> +        */
> +       int cur_ctx_seqno;
>
>         struct a6xx_gmu gmu;
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 624078b3adf2..30c1efc3d8a0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -711,6 +711,7 @@ static void load_gpu(struct drm_device *dev)
>
>  static int context_init(struct drm_device *dev, struct drm_file *file)
>  {
> +       static atomic_t ident = ATOMIC_INIT(0);
>         struct msm_drm_private *priv = dev->dev_private;
>         struct msm_file_private *ctx;
>
> @@ -727,6 +728,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>         ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
>         file->driver_priv = ctx;
>
> +       ctx->seqno = atomic_inc_return(&ident);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index de062450add4..8633d0059a3e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -59,6 +59,7 @@ struct msm_file_private {
>         int queueid;
>         struct msm_gem_address_space *aspace;
>         struct kref ref;
> +       int seqno;
>  };
>
>  enum msm_mdp_plane_property {
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
