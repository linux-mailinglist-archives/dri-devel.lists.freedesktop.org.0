Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646BA665F11
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6010E75C;
	Wed, 11 Jan 2023 15:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7594510E75C;
 Wed, 11 Jan 2023 15:28:51 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id d188so1856085oia.3;
 Wed, 11 Jan 2023 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4sF9h6AYZZ9s9l5isulzAYtAnPwM/o7/+dNoOtQdd7k=;
 b=jCfjWEPy76z0U6Zi4tXKqIT2iG2oWVhqA22BBBU/5rgt0jvil+CKwT1n+yThem7vaq
 qyh74PFrGus/RRZN60oOIXMcXNh7/CJV/Pvf3OdWY1mM4lGtexdF0UIpIIWRYdG5b1VX
 PLut62M4sIVtjfPAfJc1rk8ey0/lSQrd+SYSPPxXaVY+uQEstJvAbDi5u5xzZ6ks6cls
 uV8wrZNpApvwyCJN6mw7HiWCPsuCPJoNUVErIToueQQZnYa5yqDB/yKaYadt23ikIEbN
 CgkwXv7Rsk3XICFrW3c1nGU6+HzuxlpQfBcL3NQt1Ey2opE4Zo7HVmWI6YAZvpv8GS/E
 7ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4sF9h6AYZZ9s9l5isulzAYtAnPwM/o7/+dNoOtQdd7k=;
 b=UZ0XAoGarXT3V4J/qe5Ga+AGeGnj/SfiV52LAyJmCRZjRzf1jRbkG5iLU06NsKjbVd
 x6DXMNcTyfn10dM+x5dF9k4cVo9RErar820hE6232oOwmTID3liOka/SaN3YozvHD0DV
 HcFiGuZKuHkxvXkQXh8rxjwUCDa5eLz/pndzEZAg0snCJWWpSyi5ISJ1UOKubK7v8Z9Q
 qKnh09jfkzk2MKd7huFjd2YpBb6R9tDGqvcIPdT88Vp+bFQU8u/fmlvIMjlkt0klDN7d
 ija02uOG+JdYLNnwt64uWCv5eRYdH20p/swO6gE1h2+8jutxscImF0z5IjcWCNomBdOB
 Wh5Q==
X-Gm-Message-State: AFqh2krHdn/zC4HXrf7GmibEj0zPgPN8vhpzRwzqJ2fzfJS2FCdvxeA6
 yw55pcTrbEJ67jyltX9u+DTgaxnUNo2EV31RaKJrc4VyYjk=
X-Google-Smtp-Source: AMrXdXuXROjZ0MWVSMSHb3c1hKspO7uvkZCFoKujUD3ng5FA/3eJ481QFUqk2kWBDyIW1WB1IIHK4eFbVUfCBAtaGbk=
X-Received: by 2002:a05:6808:409a:b0:360:ffcc:3685 with SMTP id
 db26-20020a056808409a00b00360ffcc3685mr3737807oib.183.1673450930270; Wed, 11
 Jan 2023 07:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20230110212903.1925878-1-robdclark@gmail.com>
In-Reply-To: <20230110212903.1925878-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 Jan 2023 07:28:45 -0800
Message-ID: <CAF6AEGsivdz-e+sCRQto1_WBZ80bv8b4xDbYvzX-4sVo9kM7Yw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix potential double-free
To: dri-devel@lists.freedesktop.org
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
 Dan Carpenter <error27@gmail.com>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 1:29 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If userspace was calling the MSM_SET_PARAM ioctl on multiple threads to
> set the COMM or CMDLINE param, it could trigger a race causing the
> previous value to be kfree'd multiple times.  Fix this by serializing on
> the gpu lock.
>

Fixes: d4726d770068 ("drm/msm: Add a way to override processes comm/cmdline")

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++++
>  drivers/gpu/drm/msm/msm_gpu.c           |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
>  3 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 57586c794b84..3605f095b2de 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -352,6 +352,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>                 /* Ensure string is null terminated: */
>                 str[len] = '\0';
>
> +               mutex_lock(&gpu->lock);
> +
>                 if (param == MSM_PARAM_COMM) {
>                         paramp = &ctx->comm;
>                 } else {
> @@ -361,6 +363,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>                 kfree(*paramp);
>                 *paramp = str;
>
> +               mutex_unlock(&gpu->lock);
> +
>                 return 0;
>         }
>         case MSM_PARAM_SYSPROF:
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index bfef659d3a5c..7537e7b3a452 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -336,6 +336,8 @@ static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **
>         struct msm_file_private *ctx = submit->queue->ctx;
>         struct task_struct *task;
>
> +       WARN_ON(!mutex_is_locked(&submit->gpu->lock));
> +
>         /* Note that kstrdup will return NULL if argument is NULL: */
>         *comm = kstrdup(ctx->comm, GFP_KERNEL);
>         *cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index a771f56ed70f..fc1c0d8611a8 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -375,10 +375,18 @@ struct msm_file_private {
>          */
>         int sysprof;
>
> -       /** comm: Overridden task comm, see MSM_PARAM_COMM */
> +       /**
> +        * comm: Overridden task comm, see MSM_PARAM_COMM
> +        *
> +        * Accessed under msm_gpu::lock
> +        */
>         char *comm;
>
> -       /** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
> +       /**
> +        * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
> +        *
> +        * Accessed under msm_gpu::lock
> +        */
>         char *cmdline;
>
>         /**
> --
> 2.38.1
>
