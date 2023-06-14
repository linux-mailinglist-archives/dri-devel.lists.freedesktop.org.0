Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88503730788
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 20:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9E10E247;
	Wed, 14 Jun 2023 18:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9634810E247;
 Wed, 14 Jun 2023 18:43:03 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19f6211d4e1so5807599fac.1; 
 Wed, 14 Jun 2023 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686768183; x=1689360183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l3DT7w8KdyCdakOATdo5Q+fmC471h9cpXnc15WSn1TQ=;
 b=PRNIu757TOCFYN2P38ws0PAclKTdROT0TvnbUFk5IYiqweJ2sbR4yJQUqNpsHLs4B/
 yp62mxMBzGF2hP+6YK8vrNk/vFVDH2+UE4XqMWqS+T8Z1fQpnJK7Efx23yZCajlaw/nS
 8ybL16GZh68IxuZsOYKicx202fnG0/ctGYB5ukw3EJYLLTJSN5FHA5w4TN8LgcNggksP
 qfsMQayRK7pwm1m0Ws7bqEvwXUf/+9aCtsB3oqOlXIIttnI/YuUfdFrE182n7dxFjodW
 nQepnpKANTKm3SVzz61z1Up/M7pbLp7thKpYlRc7BzbbGyV50U/7Hm6xzYBsGgZqouix
 pVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686768183; x=1689360183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3DT7w8KdyCdakOATdo5Q+fmC471h9cpXnc15WSn1TQ=;
 b=Hod4At588fcDR3QgmTE8OyVzq26VLoAeOeUTQg1QCljzUFbcIiBvBPji45stUzbToo
 +rL0vaPfT91mc4GbKr62qLuAC0l+wcbatzmATJDv8KbsnadxnImhDuk2UNO/adMMkhPY
 jfHbjQar4zWOvtyo7N9qrY0rt3iRIIHW11H157NyIoQ1kjD5tSQmRbOsvudlCQd4g8Ge
 8rasZ6zDPNpkszavGlCEdxjjvAXak3tTZmCxAO74zz2PQDm+7+3zQhHp9dF1TwZlbuAJ
 KbVr4EsSl5u/frp4rdnSRmDMR7BivfQxWQ9Zalj8oyeY8B8IFr+ewe+8stzDyMW47zs9
 25ng==
X-Gm-Message-State: AC+VfDzikNEFYa9DJsF8c0TUu8L9eKVZ6129giMfvZkGUMzn44eOmTAX
 XntcJGSDc+67pH50B3b1OEcHzPSYAfDWEZAe0uhWWxuiHv504Q==
X-Google-Smtp-Source: ACHHUZ7WFmmZmMR6jZadMqgw5Xm2GaPZrf/FZiDbMValKS8g+fEkrvkIcgrUCIkPQny6GTvZSrcMMJT0srToI77cRjI=
X-Received: by 2002:a05:6870:8544:b0:199:cae3:f966 with SMTP id
 w4-20020a056870854400b00199cae3f966mr10480158oaj.43.1686768182713; Wed, 14
 Jun 2023 11:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-4-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-4-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 14 Jun 2023 20:42:51 +0200
Message-ID: <CAH9NwWfrrFE=eRu5PZgfGz0YYXtpd4Eq+hFfocZop5v=0B+_5g@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/etnaviv: make clock handling symetric between
 runtime resume and suspend
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
> Currently the clock is enabled in the runtime resume function, but are
> disabled a level further down in the callstack in the suspend function.
> Move the clock disable into the suspend function to make handling
> symmetrical between resume and suspend.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 54a1249c5bca..57cf77ed2fcf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1632,7 +1632,7 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
>         } while (1);
>  }
>
> -static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
> +static void etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
>  {
>         if (gpu->initialized && gpu->fe_running) {
>                 /* Replace the last WAIT with END */
> @@ -1651,8 +1651,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
>         }
>
>         gpu->exec_state = -1;
> -
> -       return etnaviv_gpu_clk_disable(gpu);
>  }
>
>  static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
> @@ -1789,6 +1787,7 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
>                 pm_runtime_put_sync_suspend(gpu->dev);
>         } else {
>                 etnaviv_gpu_hw_suspend(gpu);
> +               etnaviv_gpu_clk_disable(gpu);
>         }
>
>         if (gpu->mmu_context)
> @@ -1922,7 +1921,9 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
>                 return -EBUSY;
>         }
>
> -       return etnaviv_gpu_hw_suspend(gpu);
> +       etnaviv_gpu_hw_suspend(gpu);
> +
> +       return etnaviv_gpu_clk_disable(gpu);
>  }
>
>  static int etnaviv_gpu_rpm_resume(struct device *dev)
> --
> 2.39.2
>


--
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
