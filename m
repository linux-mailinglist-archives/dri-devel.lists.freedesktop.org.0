Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6D73076B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 20:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C116510E166;
	Wed, 14 Jun 2023 18:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8BB10E166;
 Wed, 14 Jun 2023 18:39:31 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-19a427d7b57so4501067fac.2; 
 Wed, 14 Jun 2023 11:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686767969; x=1689359969;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pYxjaCaCOzP2nbc0vYvcl1o0iPvQU/Y6CHFcG11+D6s=;
 b=kBah7jl5GnbeTqVw6lad6PDgnTAdpYy2H0UBJ9s92Tziaoqoz1ddhFjRFopUkgRBcL
 DcpzdASkFoTGNQpeSEhO6WHQQZG5wwzfOPPqDp+h/F7qZ9JbHWm3QksiFGc+PacDzkkp
 1v38m9mqqXxUeK6+sn/z/YepQcEBYCiZAm0nvojR29tqrrS9cv9CQD0oDRCgVNGurbgK
 FMn604tCAhongv3Om8IfOMY8bhgicgOZ2yUKF3vMCr5hawr0AUporC8JKkYMIphgJPjm
 kVWgmikO0yAHJ8SwEUYQmEGwz+aAMpnhVEE/s1rxyopnVjaFntW51pNtAh4h9txESGDF
 MHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686767969; x=1689359969;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pYxjaCaCOzP2nbc0vYvcl1o0iPvQU/Y6CHFcG11+D6s=;
 b=AN7BZzZGE3MeAIOZWsZCls242gv/0/U+NF6gUR3fWLa995IIdTTH3lIZFDnkG8ACNc
 Of14Em8naljNKE5pLf98qzMkc7XsojRLp6JLufeD2RZntsmZlpm3aU+tpltq5859H+ty
 RKwBvYmCk+NTjJczxRdKhp8XlNB8hxLqfwnoxSwWxeML4elqEFN5iCd8UpPePdrQaSny
 wZph0S3BQeWgLD09zAOKi9BYI4zowzYQ0UfP8R+Gc3CUCq6B/AbX+guhKyrZdmlNta7A
 vLJ83UdU4nads5AXpwbzLFDyh6Otsi7urIrSIfNoW7NVN25Hd/2rJti13ra3qgli6pAr
 QHaQ==
X-Gm-Message-State: AC+VfDymeC/2UnCiou/oC08/qLBmHFFgcOvXAcdhPVLP1ATTj6HPftcr
 1JkVkm4EKLwZZMbrOqNq3ueom9ihuIE/xCbNeIM=
X-Google-Smtp-Source: ACHHUZ7/N7Fz5pU6yhOKvkAKZ2CkjBIaJK+eh4gBLqC497QQPGJoT6ZWHEEmIysm0nJy77saygADHeFyH5EocL9BLbA=
X-Received: by 2002:a05:6870:b782:b0:19e:d407:a730 with SMTP id
 ed2-20020a056870b78200b0019ed407a730mr8937378oab.35.1686767969376; Wed, 14
 Jun 2023 11:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-2-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-2-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 14 Jun 2023 20:39:18 +0200
Message-ID: <CAH9NwWdyt3MMbTeKCPFMkrr_=GSFFDHGBMmwYX6SuBW6ypW6_A@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/etnaviv: free events the usual way in recover
 worker
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Clearing the whole bitmap at once is only a minor optimization in
> a path that should be extremely cold. Free the events by calling
> event_free() instead of directly manipulating the completion count
> and event bitmap.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 6d4df9f1aeff..4e18aa8566c6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1442,8 +1442,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
>         /* complete all events, the GPU won't do it after the reset */
>         spin_lock(&gpu->event_spinlock);
>         for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
> -               complete(&gpu->event_free);
> -       bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
> +               event_free(gpu, i);
>         spin_unlock(&gpu->event_spinlock);
>
>         etnaviv_gpu_hw_init(gpu);
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
