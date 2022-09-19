Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD175BCCC7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1DA10E03C;
	Mon, 19 Sep 2022 13:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3257C10E63A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:18:18 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n124so14575916oih.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=auigCvpWPE/1TEwDuxxOoZFE6qEJwGyvMXGOPOBtw7A=;
 b=XuDIFL7DtM1T7Y3YuBUDHMPByGkTJI5owduu3Huzr8/nlKvFH0bkC7RzfgaMzYBHJH
 SWy5fW8dEGrV6nQ1k51nmst7Bimn6vM3/tRif6pT5MQUnGThGly2iknmmE21txPae9XC
 W+XSQMK1z7ftH4ALbBwG+E7Xj1mPG4OrJyVXlY3y3uZ6HiZFFCVqgCgwqai5rLxmCVCv
 DiNqqftt/ECERwOJMD1LVAQaI3vtDycBrz3EawLaS5ZdBdvpwVqi9uHrJ+8pqAD0HfQI
 6TCtOjKJTM4LMu/Ld84qV7Q8OCXnlSz+LA2RfMnnBjSqwH2iDYJArM2nEiFskqT12273
 0i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=auigCvpWPE/1TEwDuxxOoZFE6qEJwGyvMXGOPOBtw7A=;
 b=BoTTlQXigHLVPBjhm2ZZdzTR/6B4KTOLAJA5HjHc6RIUZT3S9isgmTNv8Hw7nSvST0
 qnQqmHbF/GH2OGihw58G5cLf0CkMvAem596HmU9sXenmW9I1v1oEToPkvgsbm2O6q76P
 GvzRWsBez4blXzVNw2qzRszHvpRDt6QxIc85Rvez5RNnfzR3nqW2azNg+c5pwePYRNWV
 I7sl9eS4n/yK1KVQOIULxiVSobFsBbyj//wj6k67SOmblvj0IvUi1wkOcXV4y9pdb/lV
 v+u5nGtISKjo3VsUMwtEHfPyJ0sbF+PwxaZzRDDzeBNiWSHW2JSB2Bey/V3RBSRgHnjU
 VJHQ==
X-Gm-Message-State: ACrzQf1Mr6wudjzWzynNg3wUhdGZ+e1peYq31Xt5FoJqMggh6nU9qEdm
 Pdb8UOY1IRGg6zy73+ZairEh9rwjgvhsWV4bwYQ=
X-Google-Smtp-Source: AMsMyM5NB7GKIOGmdM7k/vzoipNgZn1C3URe11uEjISLLXRSk+7BFR1OmgRkmn4jUYKjUtzJHuG8Imad3qUvoDP0Yn8=
X-Received: by 2002:a05:6808:2194:b0:350:cb3d:ecd2 with SMTP id
 be20-20020a056808219400b00350cb3decd2mr234506oib.46.1663593497347; Mon, 19
 Sep 2022 06:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220919120618.113332-1-christian.koenig@amd.com>
In-Reply-To: <20220919120618.113332-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Sep 2022 09:18:06 -0400
Message-ID: <CADnq5_MRk1UwT9Ruh1C02HPwsUgt5Dyii79T0YwnT0MXNVu+gg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix dma_fence_default_wait() signaling check
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
Cc: dri-devel@lists.freedesktop.org, Arvind.Yadav@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 8:06 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That check must now come after grabing the spinlock, not before.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: b96fb1e724ae ("dma-buf: dma_fence_wait must enable signaling")

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index a5fbf1c1e0ea..406b4e26f538 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -763,11 +763,11 @@ dma_fence_default_wait(struct dma_fence *fence, boo=
l intr, signed long timeout)
>         unsigned long flags;
>         signed long ret =3D timeout ? timeout : 1;
>
> -       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -               return ret;
> -
>         spin_lock_irqsave(fence->lock, flags);
>
> +       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +               goto out;
> +
>         if (intr && signal_pending(current)) {
>                 ret =3D -ERESTARTSYS;
>                 goto out;
> --
> 2.25.1
>
