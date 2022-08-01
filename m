Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C20586FA4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4193BD6;
	Mon,  1 Aug 2022 17:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBB68E44D;
 Mon,  1 Aug 2022 17:38:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m22so6617761lfl.9;
 Mon, 01 Aug 2022 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZEofs24gWs056HlATsdo9nk24MrkNe/lc9UM4+Isgr8=;
 b=Y6aD/NFrfESMvBfbHzvKOWWdDZQzFo2aG0nDV5EzCdNn4dWqhzz55mE6mbkGX4X023
 w5f+dmNk7z7SwcCdijk0Gcahw2NhGVeHrgPh7AyzIc3O4cZ0amRedlG9Aj2zCWP2Gaw1
 VDLnkeRuX6DyUR1cfRFhGREXishTcJx85CfewWjc51jacmOqc9rgj0omjylug/jBR/iD
 YJzuXVhof3t/CpA5FNbIDnp70aZKTec0ly7qX39koUnCNNZiPhjlFQD4ssz9erbDBNU+
 ZGNIK7s7nKoRiy78/O/sovkFTvOuN2Lt7wAQVl7q0vBBO/ctYd5xNyZ5t3J9nT3ZJOhr
 aOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZEofs24gWs056HlATsdo9nk24MrkNe/lc9UM4+Isgr8=;
 b=kJozb5VcLgw3RVwXDvrEqdTGmi133WeATLzdmEPR94IrxVjOF2ywoQIb62LYShms8M
 F/xKI/N/GqFjAPlEb3Ey6jr22E3ay04lI/fY/7R0y0k0zcY5PBObT+mjZ6AYEGuSm/B3
 nN+qYqBASK4QcfG8Mv06e83KOnMhSuz9yf15+OcsCY0SUCHuNAeTH28Y9PPg6yV53+k0
 7noOKWoZmzFdNPXovIY9kv5BxqZhpX7bfFaTQqZm39kY5MZMr77Kqm/HZvYIugpf9Wq3
 C7HXcQX6fU7ATy2llb3LYzPv1fHLfPyOIBnammblRD63KlGNDdhJ9lmiJixgA5Cm31PS
 WpBg==
X-Gm-Message-State: AJIora/ivfyN9VWIriFT+1tumjhTusEmkSzs5rvzDpj4VSx954j5uSsn
 QOJNEt6BYu9P3fcyqZOuYdjISbK/eSPrRqLHo1A=
X-Google-Smtp-Source: AGRyM1uH70a7t4bA3N9awioJlcyh926xaZ5LmjMqI/SMlNSixVeVv7X58I/Su0ACuAScAp5/nzenLH2wV2YKiMFTjBI=
X-Received: by 2002:ac2:4f03:0:b0:481:50f7:ac07 with SMTP id
 k3-20020ac24f03000000b0048150f7ac07mr5615148lfr.422.1659375495569; Mon, 01
 Aug 2022 10:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Aug 2022 10:38:41 -0700
Message-ID: <CAF6AEGuWj_7MPaYCcQa+ewr2MsLGNttKO=HVqmb72SPEemmizw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Drop qos request if devm_devfreq_add_device()
 fails
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 8, 2022 at 9:24 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In the event that devm_devfreq_add_device() fails the device's qos freq
> list is left referencing df->idle_freq and df->boost_freq. Attempting to
> initialize devfreq again after a probe deferral will then cause invalid
> memory accesses in dev_pm_qos_add_request().
>
> Fix this by dropping the requests in the error path.
>
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index c2ea978c8921..21e271a318ee 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -198,6 +198,8 @@ void msm_devfreq_init(struct msm_gpu *gpu)
>
>         if (IS_ERR(df->devfreq)) {
>                 DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> +               dev_pm_qos_remove_request(&df->idle_freq);
> +               dev_pm_qos_remove_request(&df->boost_freq);
>                 df->devfreq = NULL;
>                 return;
>         }
> --
> 2.35.1
>
