Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3183A9FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD0210F743;
	Wed, 24 Jan 2024 12:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8810F6F8;
 Wed, 24 Jan 2024 12:39:16 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a30ed6dbdadso126418766b.1; 
 Wed, 24 Jan 2024 04:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706099895; x=1706704695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlopjC0q6gXyAjmdtqD86mRjd9mpn+cocTVW6/0rIOs=;
 b=Uu4anNhWbSfWNVYJQ7bGWA9vJ3mwRBV0M2TBBNaUebueKVZzIvNJz1vNGNyngwNDid
 ALT/gNaG2JDMIjhv2Uif/T2XgHalav6l1s9hHtBNRiX17dMtXgVnf1wSWnE4Y4ZbFbZg
 M6jscqlE06SL3NKQsHajklLOKVSzfKPuRpN4+dVl4iYAic3S3uH2DI19IqoCdL+Iyda+
 fX/BNGX/f0DqSrRDMs4sPCge33XTY+2q/bY4M4ODxw/CASrOXo1U0So8XYqpOEGoEceC
 BdBT7txdq195qC5SQ/EzwfgNmyUDgWvdPwZJXhrMJC5RPKYhnsKTb7j61MPywxZ89uxx
 bulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706099895; x=1706704695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dlopjC0q6gXyAjmdtqD86mRjd9mpn+cocTVW6/0rIOs=;
 b=NGXm1FAHhK3ykgaFwvwK8fZKc+/jVtsfmm6AxOpUfFhreUrDtDNZlKfRbM0j8yGchW
 7PSv5fgkjk4gvRkyqzbpjsiJMObeaO5twDYzdqV2ZKFyByMB9wzignnMQh+ngrMtL//0
 rMPLBrJi/uCk12kArudJO9RqqmOhB4r1lmRtEEpatRiaVxENovW5FGleBdeyD2BayLM7
 oYPNONibxRME0JE5nLd6BFENZirVdy3k+6Iow9DwSNmPfVcP7xxfg/MJT6YRH4Lj1SxG
 3xE/Jd3jfiJcPya7pYRxFsVt/zXwk1VaSHlP7cFfs7rM1hGbCus7ahQ4KhTsW2diewt6
 c4pg==
X-Gm-Message-State: AOJu0Yz01WMlg3tHgj6dNOqAU6VYuGxAJKYDgUfbTVP+jKIemNKLmHNM
 wJKD46SGahh+yLxIUwfA6A07Ok7M/2PCZkocLhBOBkjybPQPJqmxSzYvWpPi+koL7zOMYvn3Th5
 v+ZG0hSCuprZCmA91gTi9Lt2ABDM=
X-Google-Smtp-Source: AGHT+IF8foS+5EcfCkQar6U3K3HFHH63zXr30/hlkj0LOBnxNGf2IpLJdLKhSHgYKfQPDO8Lu3tvb0Vzs4snbUtvQ08=
X-Received: by 2002:a17:906:5a51:b0:a23:6c9c:d4ce with SMTP id
 my17-20020a1709065a5100b00a236c9cd4cemr770213ejc.116.1706099895001; Wed, 24
 Jan 2024 04:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
 <20240124025947.2110659-6-nunes.erico@gmail.com>
In-Reply-To: <20240124025947.2110659-6-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 24 Jan 2024 20:38:02 +0800
Message-ID: <CAKGbVbsjNdnoNW2JnxCiyZg-wjU0UK+jgsG18OFaHjdkdOWRQA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/lima: handle spurious timeouts due to high irq
 latency
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 11:00=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
>
> There are several unexplained and unreproduced cases of rendering
> timeouts with lima, for which one theory is high IRQ latency coming from
> somewhere else in the system.
> This kind of occurrence may cause applications to trigger unnecessary
> resets of the GPU or even applications to hang if it hits an issue in
> the recovery path.
> Panfrost already does some special handling to account for such
> "spurious timeouts", it makes sense to have this in lima too to reduce
> the chance that it hit users.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index c3bf8cda8498..814428564637 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
>
> +#include <linux/hardirq.h>
>  #include <linux/iosys-map.h>
>  #include <linux/kthread.h>
>  #include <linux/slab.h>
> @@ -401,9 +402,35 @@ static enum drm_gpu_sched_stat lima_sched_timedout_j=
ob(struct drm_sched_job *job
>         struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
>         struct lima_sched_task *task =3D to_lima_task(job);
>         struct lima_device *ldev =3D pipe->ldev;
> +       struct lima_ip *ip =3D pipe->processor[0];
> +       int i;
> +
> +       /*
> +        * If the GPU managed to complete this jobs fence, the timeout is
> +        * spurious. Bail out.
> +        */
> +       if (dma_fence_is_signaled(task->fence)) {
> +               DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> +               return DRM_GPU_SCHED_STAT_NOMINAL;
> +       }
> +
> +       /*
> +        * Lima IRQ handler may take a long time to process an interrupt
> +        * if there is another IRQ handler hogging the processing.
> +        * In order to catch such cases and not report spurious Lima job
> +        * timeouts, synchronize the IRQ handler and re-check the fence
> +        * status.
> +        */
> +       for (i =3D 0; i < pipe->num_processor; i++)
> +               synchronize_irq(pipe->processor[i]->irq);
> +
I have a question, this timeout handler will be called when GP/PP error IRQ=
.
If we call synchronize_irq() in the IRQ handler, will we block ourselves he=
re?

> +       if (dma_fence_is_signaled(task->fence)) {
> +               DRM_WARN("%s unexpectedly high interrupt latency\n", lima=
_ip_name(ip));
> +               return DRM_GPU_SCHED_STAT_NOMINAL;
> +       }
>
>         if (!pipe->error)
> -               DRM_ERROR("lima job timeout\n");
> +               DRM_ERROR("%s job timeout\n", lima_ip_name(ip));
>
>         drm_sched_stop(&pipe->base, &task->base);
>
> @@ -417,8 +444,6 @@ static enum drm_gpu_sched_stat lima_sched_timedout_jo=
b(struct drm_sched_job *job
>         if (pipe->bcast_mmu)
>                 lima_mmu_page_fault_resume(pipe->bcast_mmu);
>         else {
> -               int i;
> -
>                 for (i =3D 0; i < pipe->num_mmu; i++)
>                         lima_mmu_page_fault_resume(pipe->mmu[i]);
>         }
> --
> 2.43.0
>
