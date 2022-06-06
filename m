Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDF53F1A9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 23:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99B110F77F;
	Mon,  6 Jun 2022 21:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0899810E261;
 Mon,  6 Jun 2022 21:23:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q7so21483836wrg.5;
 Mon, 06 Jun 2022 14:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfY6X4JVQBiL9H59caeTHODekDNJrKZ9yOY0lERy7u8=;
 b=hB1aabYJ45U2sFPdevy3YeJni7Yu6ezotGBopOjnkmWkjU/AuETPp+3LFizhsX6tq5
 3uP4UmZ7ADOQPWyeb31hAWbN5Ephl7ItZ0AHOP5RK8Hfzx2OlYj12cNBpwmDWOeuwcbE
 N7gDX4M415mCo4i9W3ZoTKZq8oUFaSTmCiee7LojVRUgclJ01SlozBSzzc/gZq6qMVtp
 XgwOAd2xdIZ5QCY8dxJ7V7yGiCYW3pJChjteIzbd+nNUfJLTrq8xxWcyEQQzvoqn2DrB
 L/UcIcEkGAYUOJKzxI5xCyJLJKBi3fu55DkkwqAorZhreHxkRBfn/R6NCpIFYHpJAjKs
 zYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfY6X4JVQBiL9H59caeTHODekDNJrKZ9yOY0lERy7u8=;
 b=nULE6hiHIjkUgrxEaVLqcD3mC1Gnn9Sq56vXv4iAiKgwI9WRcmUfQnlqxNkI2Z92ci
 X6xEiReQ8Aj7Kc2SclneahdxWu6YuunxaIDq4QJaTJE7htFmulNBWLV62aB781AZDXAF
 WeQPU9xJL6hzSisYz7XrmTbLD803miaNdLeQgKtz6cwZlnPaRYxFAHIXCszcfPr6XP9s
 2PX1nnFr8T25sg5Mcw69H+uujEikfnwfkf+xqeluVgK+o6BAzkWwNSSfJJSgpDKcsQWD
 il87MSvrwSZFmphHORVhHLsBq5m2PaOGUJJGI6WCn7V4Xb+y4W/HJ0XDweYlC0a4MdBa
 Zi9Q==
X-Gm-Message-State: AOAM533BzlgNwsryWiMg5peqCmThMaD1RiHcuDQ/7qIau+bo0IilRcHt
 yViDeN76vsmyQZZX+RDotuOjtYqETeCxSz7K3mI=
X-Google-Smtp-Source: ABdhPJzFe0DtmvJNvXSibzfXuetpXq7Ja76dWcSijzRDnmzdipQLnwN4INHe/Cq5C9hjS/IYOl3FwnxWJFHSB1bzKdY=
X-Received: by 2002:a05:6000:547:b0:20f:ca41:cc51 with SMTP id
 b7-20020a056000054700b0020fca41cc51mr24126476wrf.221.1654550613305; Mon, 06
 Jun 2022 14:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220606211305.189585-1-luzmaximilian@gmail.com>
In-Reply-To: <20220606211305.189585-1-luzmaximilian@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jun 2022 14:23:34 -0700
Message-ID: <CAF6AEGuJQt9D1+Q6xcKw=AYMZUFPSUh-v2GonuahMpZ2wbx08g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix double pm_runtime_disable() call
To: Maximilian Luz <luzmaximilian@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 6, 2022 at 2:13 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> Following commit 17e822f7591f ("drm/msm: fix unbalanced
> pm_runtime_enable in adreno_gpu_{init, cleanup}"), any call to
> adreno_unbind() will disable runtime PM twice, as indicated by the call
> trees below:
>
>   adreno_unbind()
>    -> pm_runtime_force_suspend()
>    -> pm_runtime_disable()
>
>   adreno_unbind()
>    -> gpu->funcs->destroy() [= aNxx_destroy()]
>    -> adreno_gpu_cleanup()
>    -> pm_runtime_disable()
>
> Note that pm_runtime_force_suspend() is called right before
> gpu->funcs->destroy() and both functions are called unconditionally.
>
> With recent addition of the eDP AUX bus code, this problem manifests
> itself when the eDP panel cannot be found yet and probing is deferred.
> On the first probe attempt, we disable runtime PM twice as described
> above. This then causes any later probe attempt to fail with
>
>   [drm:adreno_load_gpu [msm]] *ERROR* Couldn't power up the GPU: -13
>
> preventing the driver from loading.
>
> As there seem to be scenarios where the aNxx_destroy() functions are not
> called from adreno_unbind(), simply removing pm_runtime_disable() from
> inside adreno_unbind() does not seem to be the proper fix. This is what
> commit 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in
> adreno_gpu_{init, cleanup}") intended to fix. Therefore, instead check
> whether runtime PM is still enabled, and only disable it in that case.
>
> Fixes: 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 4e665c806a14..f944b69e2a25 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1057,7 +1057,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>         for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
>                 release_firmware(adreno_gpu->fw[i]);
>
> -       pm_runtime_disable(&priv->gpu_pdev->dev);
> +       if (pm_runtime_enabled(&priv->gpu_pdev->dev))
> +               pm_runtime_disable(&priv->gpu_pdev->dev);
>
>         msm_gpu_cleanup(&adreno_gpu->base);
>  }
> --
> 2.36.1
>
