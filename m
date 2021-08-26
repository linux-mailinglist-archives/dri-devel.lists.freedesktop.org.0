Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE833F8B1B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 17:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33B76E038;
	Thu, 26 Aug 2021 15:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07866E038;
 Thu, 26 Aug 2021 15:34:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q14so5758468wrp.3;
 Thu, 26 Aug 2021 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6ledkqU9D7FzcL/5ouJNmCXuXtKins7U1aoW3QxLbVU=;
 b=jiDI7yC/eT7HEe9sQm38w7hIxFvvo4EfE4Scx9xXHFUrWsbewLm3vkOb+B1QtiBPTc
 1pmwSmFQzxPGrrJh4AP8FppBdNDpQ2Aw65Bmro1bbZGcOxe8tesKl0HXb50Mgvz4xCdn
 zfJbhzNxfFIKD4BXgyUJYuYsUBicVPm6ngREnHXMFqiDAszRpcG/5dGTTmStoAmv8062
 QbQQeQPk33VzCUkcG6AfCSOKMbq4nNhib3wDooslcoiyQKIHCIZOCDiGwW6OQ7pAwkBA
 SJscnToOzErB9p3dp2gCvGHJRpL0oFfpEZ6qLihP0aot4co1SCXahgLNAzO1OjBuaRM8
 bGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6ledkqU9D7FzcL/5ouJNmCXuXtKins7U1aoW3QxLbVU=;
 b=TecZJdSHeWySsrS/9MZTAwu18Je1Nkv+cm7dSu60P1ZXF7imIcaT1nd0HlyeLyfqNS
 YC+WvqDHgiz98vOiJaqljGeHXGQGbQXEide8w66xJYA73OMfExURhdIhptFnD9cEOV16
 F6On3BnNNUZtueQY3vhS4vd5wpTR/z9gupIDQVstRHFGz7gLfYZeSE87C1YFxnnDJkfq
 GmaPuqkkB9ZMqN18KFeThsrLVfQB1ZiIgbB80XArwx2HvmYCLdrXZCtLOA/QtupS5PeS
 2mCDFXJlDTAkzsXUJe/2vof2UOdoNMSpDKNrz8fKwpUKvHMWxlgfBHW5cQfZJHEbaSqF
 5pnw==
X-Gm-Message-State: AOAM5319j4NZNxJzanc+xiL63L6E3xUNVR5aIYdqcUFHZx+y4yNM6jiJ
 d7Q6T7Sy7LcXSd2pIUirbO++lU7H/n5+xBcEMA0=
X-Google-Smtp-Source: ABdhPJxNi7BD0F9Nk2M8iBXkon89Q02BBjrW2NrVCNpKlZ5X5qHkwp/W2LBzZ7ppSDqjH2XlmT9Atndgc3cblhH236o=
X-Received: by 2002:adf:9021:: with SMTP id h30mr4549091wrh.327.1629992070122; 
 Thu, 26 Aug 2021 08:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210817085308.3557257-1-daniel.vetter@ffwll.ch>
 <20210826093334.1117944-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210826093334.1117944-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 26 Aug 2021 08:38:50 -0700
Message-ID: <CAF6AEGvVjrii3-22ocsuej8Hw-2OLG8Zok-LsUceh4Aqu=45-g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Improve drm/sched point of no return rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 2:33 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> Originally drm_sched_job_init was the point of no return, after which
> drivers really should submit a job. I've split that up, which allows
> us to fix this issue pretty easily.
>
> Only thing we have to take care of is to not skip to error paths after
> that. Other drivers do this the same for out-fence and similar things.
>
> v2: It's not really a bugfix, just an improvement, since all
> drm_sched_job_arm does is reserve the fence number. And gaps should be
> fine, as long as the drm_sched_job doesn't escape anywhere at all.
>
> For robustness it's still better to align with other drivers here and
> not bail out after job_arm().
>
> v3: I misplaced drm_sched_job_arm by _one_ line! Thanks to Rob for
> testing and debug help.
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

t-b && r-b

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 4d1c4d5f6a2a..71b8c8f752a3 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       drm_sched_job_arm(&job->base);
> -
>         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
>
>         kref_init(&submit->ref);
> @@ -880,6 +878,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>
>         submit->nr_cmds =3D i;
>
> +       drm_sched_job_arm(&submit->base);
> +
>         submit->user_fence =3D dma_fence_get(&submit->base.s_fence->finis=
hed);
>
>         /*
> @@ -891,17 +891,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
>         if (submit->fence_id < 0) {
>                 ret =3D submit->fence_id =3D 0;
>                 submit->fence_id =3D 0;
> -               goto out;
>         }
>
> -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>                 struct sync_file *sync_file =3D sync_file_create(submit->=
user_fence);
>                 if (!sync_file) {
>                         ret =3D -ENOMEM;
> -                       goto out;
> +               } else {
> +                       fd_install(out_fence_fd, sync_file->file);
> +                       args->fence_fd =3D out_fence_fd;
>                 }
> -               fd_install(out_fence_fd, sync_file->file);
> -               args->fence_fd =3D out_fence_fd;
>         }
>
>         submit_attach_object_fences(submit);
> --
> 2.32.0
>
