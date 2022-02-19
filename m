Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF54BC9EF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 19:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F1A10E188;
	Sat, 19 Feb 2022 18:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B6B10E188;
 Sat, 19 Feb 2022 18:36:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso10861871wme.5; 
 Sat, 19 Feb 2022 10:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pAZG7JbLQbeA7Yj+mlgqX0k/1mUajJPRecROZ8iw+8c=;
 b=OJkpULWy9BPv8scnQFQP2MQL1Ele2xge0o1Pj1x9KMbJpLTUJkfiqfOhC8PZShcBpk
 USH+xwYud1/tctwvjUFm4YSlNGlPl1+sidtvBa/dgyDHyKaOUuSfW3pczbOlDssg4cVp
 gzZa1HsPNwCi4Ih5A449CLnvRVQKmMQ7IeiaI90t+1NT1GBWQTitdtMDZOsjU5s9nLbh
 bZ1SUilCoBwTMCAMziP4GMfswYU39HlTxFDjXpgkX9tTPS7UPzqwjbYVuBjISxniMmI/
 wah3lBe/4YtVwzOcDzO3QHVqPUxUBsyRHMuJP9qBc3YYLiTVZFSGNab2SxKJSLd2LC1x
 oD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAZG7JbLQbeA7Yj+mlgqX0k/1mUajJPRecROZ8iw+8c=;
 b=zLSudo5A9n9jxhOze0rkOxhIZu7OCpQvqJ7xJZeZxl7jKVfjADZhThmqE/ioBtMlh4
 EJ4UN9+QlfIGqyjqhpav4UQqD8hPs7wmjt9SkuReQx8OmWx1Xfr8f+OeyLg50nB9irFX
 WNYykZ7d7GvL+AJu7619v98Nxr1MJ1mZ0Uczv+LEDbVIwtXAc79UEIFrf517Vm/ihWSk
 k0cP8Jg/dwCz8KNk5nCvSvHPGKahL9mGggSsosVMgLtVwoEJW/tCWHlRfAVu9ZkOdYgk
 OwDeXvGYUsBlz2rAaODVN6Gtj1XZmtJvbd74h/WJQoZAy5A2KwcJU3/9Qs380v3DR9TC
 2unA==
X-Gm-Message-State: AOAM531p+L2cxyVLokNz/hqTrb3jflDvXojDizGbRuUoDdVLyQbTs9s2
 j4xwXoo5KuZUFjSTfIOfSm52iXQ/1HZaoAZHs1d9pU3fbTY=
X-Google-Smtp-Source: ABdhPJyhZ8HikhSS8fR813GuqsYCfEmMiKIonHQ8cVxp0BFB8dDWVsnhF7MitnZKn+FSIYqhR59KYeBOOaChHlUi2dU=
X-Received: by 2002:a05:600c:1e0a:b0:37d:342c:36ac with SMTP id
 ay10-20020a05600c1e0a00b0037d342c36acmr11851160wmb.168.1645295809620; Sat, 19
 Feb 2022 10:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20220219183310.557435-1-robdclark@gmail.com>
In-Reply-To: <20220219183310.557435-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 19 Feb 2022 10:37:09 -0800
Message-ID: <CAF6AEGviF8r=0gyqh6wWCc5O+JCJwgjLVrL-K3qfVXUvRH-ZDw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 19, 2022 at 10:32 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Avoid going down devfreq paths on devices where devfreq is not
> initialized.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>

forgot to add:

Fixes: 6aa89ae1fb04 ("drm/msm/gpu: Cancel idle/boost work on suspend")

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 9bf319be11f6..26a3669a97b3 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -83,12 +83,17 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
>  static void msm_devfreq_boost_work(struct kthread_work *work);
>  static void msm_devfreq_idle_work(struct kthread_work *work);
>
> +static bool has_devfreq(struct msm_gpu *gpu)
> +{
> +       return !!gpu->funcs->gpu_busy;
> +}
> +
>  void msm_devfreq_init(struct msm_gpu *gpu)
>  {
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>
>         /* We need target support to do devfreq */
> -       if (!gpu->funcs->gpu_busy)
> +       if (!has_devfreq(gpu))
>                 return;
>
>         dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
> @@ -149,6 +154,9 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
>  {
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>
> +       if (!has_devfreq(gpu))
> +               return;
> +
>         devfreq_cooling_unregister(gpu->cooling);
>         dev_pm_qos_remove_request(&df->boost_freq);
>         dev_pm_qos_remove_request(&df->idle_freq);
> @@ -156,16 +164,24 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
>
>  void msm_devfreq_resume(struct msm_gpu *gpu)
>  {
> -       gpu->devfreq.busy_cycles = 0;
> -       gpu->devfreq.time = ktime_get();
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
>
> -       devfreq_resume_device(gpu->devfreq.devfreq);
> +       if (!has_devfreq(gpu))
> +               return;
> +
> +       df->busy_cycles = 0;
> +       df->time = ktime_get();
> +
> +       devfreq_resume_device(df->devfreq);
>  }
>
>  void msm_devfreq_suspend(struct msm_gpu *gpu)
>  {
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>
> +       if (!has_devfreq(gpu))
> +               return;
> +
>         devfreq_suspend_device(df->devfreq);
>
>         cancel_idle_work(df);
> @@ -185,6 +201,9 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>         uint64_t freq;
>
> +       if (!has_devfreq(gpu))
> +               return;
> +
>         freq = get_freq(gpu);
>         freq *= factor;
>
> @@ -207,7 +226,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>         struct devfreq_dev_status status;
>         unsigned int idle_time;
>
> -       if (!df->devfreq)
> +       if (!has_devfreq(gpu))
>                 return;
>
>         /*
> @@ -253,7 +272,7 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>  {
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>
> -       if (!df->devfreq)
> +       if (!has_devfreq(gpu))
>                 return;
>
>         msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> --
> 2.34.1
>
