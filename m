Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A91307FC9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 21:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7E6EA23;
	Thu, 28 Jan 2021 20:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB276EA23;
 Thu, 28 Jan 2021 20:41:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z6so6705515wrq.10;
 Thu, 28 Jan 2021 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZQDBDX7ysZjWH15k/VD+oczZr4PH6075utJ1xgiXgY=;
 b=oHlkxnKaIiOGZACS9UxXHxQTNSI7Cf3kAEv/slmvz6Fr6NiFpmgruxfX4MNyTwkasB
 QYt4Sbp/LClgIHBtTOO4s/5Uqy5bSHlA42pmWC8og0ee5189WTurNXFr2P4RzcomIong
 1/XFeLRQMFdH/v8QAZ3J5KM6uki8FjmqPKj+M12CVNCm+QghYs4NKDF+z0M/TRUhZqg1
 CgUK9ZcnQYBG0T/c+iRTtaR6wn7EErMTDKGXXQYWa4oczFCR61YH0rmK/xOisN5q65We
 Mqd8EPEqgHiO35rl8Fe61apwXy+FKSFIL5ES5Wz2/ocpzoqu6faCNFqpR+5Xsy2Z9KdN
 /dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZQDBDX7ysZjWH15k/VD+oczZr4PH6075utJ1xgiXgY=;
 b=U5/DvtekLFfIMhSwJWHRvwf6LIs/ipqM6rtwFXUtn4x6nR/a/21C4jYP+ncmkjdMTq
 +06T8WUZBEsyXKMhLteV72W9O7105D3c4/+ZOG3odTra9rSKXl28YDlGUHC/E1vOueLR
 imlF1xvEXC9el5oOE9mocEzbJNISLqLFul39GQKAh8YMr797Op74frvq7WPX95sBNdxr
 a88oxoGG6IWlS8M0QfVGRwvrqe+qvMGqCg2oJYpnrVuIlJeogZMr0/WRNgegTQtZCC0U
 X0GxAPpAw267luppgPdgECZptXtS/zR6UZ6ZwBzoyxl2KpeYDAlPEHieUJXpgOBkfID8
 MsAQ==
X-Gm-Message-State: AOAM5334ku9I8diuaS27m4naGr8LeBRFDRykKCwtUDvvW+DnW4R95ksf
 XPCJY3VfXgrLyz0ojE4OOMrQjOPcVrZIIx4bVUY=
X-Google-Smtp-Source: ABdhPJwlenfZHCOiOfMruxm3X3cs5f9FZfYo4d1ePGXG/fE7YrlvrE++5B7mIUl2kqjHSrrwt81TWvaGodsyTveDQsM=
X-Received: by 2002:adf:f749:: with SMTP id z9mr855909wrp.327.1611866463544;
 Thu, 28 Jan 2021 12:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20210127233946.1286386-1-eric@anholt.net>
 <20210127233946.1286386-2-eric@anholt.net>
In-Reply-To: <20210127233946.1286386-2-eric@anholt.net>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 28 Jan 2021 12:40:52 -0800
Message-ID: <CAF6AEGuXeU18cUKGogtJD7O4SPUgFVQZcw3H-MDXNR5HAXcgFw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: Fix races managing the OOB state for
 timestamp vs timestamps.
To: Eric Anholt <eric@anholt.net>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 3:39 PM Eric Anholt <eric@anholt.net> wrote:
>
> Now that we're not racing with GPU setup, also fix races of timestamps
> against other timestamps.  In CI, we were seeing this path trigger
> timeouts on setting the GMU bit, especially on the first set of tests
> right after boot (it's probably easier to lose the race than one might
> think, given that we start many tests in parallel, and waiting for NFS
> to page in code probably means that lots of tests hit the same point
> of screen init at the same time).

Could you add the error msg to the commit msg, to make it more easily
searchable?

BR,
-R

> Signed-off-by: Eric Anholt <eric@anholt.net>
> Cc: stable@vger.kernel.org # v5.9
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7424a70b9d35..e8f0b5325a7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1175,6 +1175,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       static DEFINE_MUTEX(perfcounter_oob);
> +
> +       mutex_lock(&perfcounter_oob);
>
>         /* Force the GPU power on so we can read this register */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> @@ -1183,6 +1186,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>                 REG_A6XX_RBBM_PERFCTR_CP_0_HI);
>
>         a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> +       mutex_unlock(&perfcounter_oob);
>         return 0;
>  }
>
> --
> 2.30.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
