Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC96D73B961
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41C010E63D;
	Fri, 23 Jun 2023 14:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73510E63D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:08:04 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b5d57d7db9so570508a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687529283; x=1690121283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/3fUzXxv7sGFDIrEvJ9+1pPeFkf+dJmhwHYbYnDEa0=;
 b=TX8J0y6Va4OULoGq+xDbb2d4DyZmkkAKSHbmo9JdS8TMGhltEtcs4J4CkGRtTVqYdx
 wOhxvCFLM63hBjAPBdYvxcB0C4jNEAjYEHxF2ihx1swx2OFb6Yc1q5BoyZkJdzPRAsql
 gDcDyxuwMm6VCKnA+J1163WaZRriOBi4700ch+RFASIqE7pTvtuMC53P1y+kqPHz9PdF
 9K/76dQgU73uupK1nnhLXzBykSMf0pEv+fD/LtqKeLR0PvwfWno5lYuTfE5txK7/szjy
 YluwAxdlq4ucjUeNGpiPHd9Q98VlL8tNLeDx8BbB0E4rmVT1vF0gGopTWY1W7atq4jnx
 TjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687529283; x=1690121283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/3fUzXxv7sGFDIrEvJ9+1pPeFkf+dJmhwHYbYnDEa0=;
 b=QwkuFW1dfvkesHX1Mtx5xXs7qulpSvUV1/V6ceLQFdrAhtUXgR+5XaLLHzvW4cChzA
 v51UpT3aDTzQ3SFuc8FQ9/LGfzO6ypQE7p2UEK4hnamvgRY0WpopusSYgfGHR8ZMHcJ4
 +S6/TG3PW+5b54gXn73sNbAw/co3t9F0O87yT5Uw0p7CrQyYPKcCsrNJ6QCj/HKzeuUM
 VqD2SLiG7OcVdoLr48rk9bT9v2KXhu84Hy2MVxYh8eIylJTdmxZHWhEGPBNf3HxK9r+i
 IlhqDo7IObogRIOnIkA7tqQIDY/53li3q+kTYwNgZ/iMnZ9qli84yWiPoT48som7Eldc
 jdtA==
X-Gm-Message-State: AC+VfDzS/BSsQ+aflO/EDgLtQ+qmO5AQ/7SxDm85QlSEdxTiREndGlx9
 u9y5jwzymk1GfLwnob7JsOsJ5xkQOK8be94NsqQ=
X-Google-Smtp-Source: ACHHUZ5MsXsQWfc4E5U1uOm/l5xz6VHUb2UG9n4ULdLppmYgyR7p5EsDmsmLjIplkzMw9B1FzDi5lXT/kKnhmkVMIlI=
X-Received: by 2002:a05:6870:e742:b0:1a2:7012:1ca7 with SMTP id
 t2-20020a056870e74200b001a270121ca7mr12065342oak.19.1687529283436; Fri, 23
 Jun 2023 07:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230623090856.110456-1-christian.koenig@amd.com>
In-Reply-To: <20230623090856.110456-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jun 2023 10:07:52 -0400
Message-ID: <CADnq5_P=nz+c7q4v7KW0rrbsepom_7+wtY=F+G0k-5Hx-XA3Dw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences v2
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
Cc: Luben.Tuikov@amd.com, juan.hao@nxp.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 5:09=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Some Android CTS is testing for that.
>
> v2: use the current time if the fence is still in the signaling path and
> the timestamp not yet available.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 20 +++++++++++++++++---
>  drivers/dma-buf/dma-fence.c        |  5 +++--
>  drivers/gpu/drm/drm_syncobj.c      |  2 +-
>  include/linux/dma-fence.h          |  2 +-
>  4 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fen=
ce-unwrap.c
> index 7002bca792ff..46c2d3a474cd 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -66,18 +66,32 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned i=
nt num_fences,
>  {
>         struct dma_fence_array *result;
>         struct dma_fence *tmp, **array;
> +       ktime_t timestamp;
>         unsigned int i;
>         size_t count;
>
>         count =3D 0;
> +       timestamp =3D ns_to_ktime(0);
>         for (i =3D 0; i < num_fences; ++i) {
> -               dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> -                       if (!dma_fence_is_signaled(tmp))
> +               dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
> +                       if (!dma_fence_is_signaled(tmp)) {
>                                 ++count;
> +                       } else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +                                           &tmp->flags)) {
> +                               if (ktime_after(tmp->timestamp, timestamp=
))
> +                                       timestamp =3D tmp->timestamp;
> +                       } else {
> +                               /*
> +                                * Use the current time if the fence is
> +                                * currently signaling.
> +                                */
> +                               timestamp =3D ktime_get();
> +                       }
> +               }
>         }
>
>         if (count =3D=3D 0)
> -               return dma_fence_get_stub();
> +               return dma_fence_allocate_private_stub(timestamp);
>
>         array =3D kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>         if (!array)
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f177c56269bb..ad076f208760 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
>
>  /**
>   * dma_fence_allocate_private_stub - return a private, signaled fence
> + * @timestamp: timestamp when the fence was signaled
>   *
>   * Return a newly allocated and signaled stub fence.
>   */
> -struct dma_fence *dma_fence_allocate_private_stub(void)
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>  {
>         struct dma_fence *fence;
>
> @@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(voi=
d)
>         set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>                 &fence->flags);
>
> -       dma_fence_signal(fence);
> +       dma_fence_signal_timestamp(fence, timestamp);
>
>         return fence;
>  }
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 0c2be8360525..04589a35eb09 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>   */
>  static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>  {
> -       struct dma_fence *fence =3D dma_fence_allocate_private_stub();
> +       struct dma_fence *fence =3D dma_fence_allocate_private_stub(ktime=
_get());
>
>         if (IS_ERR(fence))
>                 return PTR_ERR(fence);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d54b595a0fe0..0d678e9a7b24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_f=
ence *fence, bool intr)
>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
>
>  struct dma_fence *dma_fence_get_stub(void);
> -struct dma_fence *dma_fence_allocate_private_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>  u64 dma_fence_context_alloc(unsigned num);
>
>  extern const struct dma_fence_ops dma_fence_array_ops;
> --
> 2.34.1
>
