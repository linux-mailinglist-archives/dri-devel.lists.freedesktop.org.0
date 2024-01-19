Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DE832313
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 02:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7110E8D9;
	Fri, 19 Jan 2024 01:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22C10E09F;
 Fri, 19 Jan 2024 01:44:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-559d3fbed6bso242495a12.1; 
 Thu, 18 Jan 2024 17:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705628599; x=1706233399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Uj9bxMJboKddkDeF9s1beNT2b+6oUXT7D7uJLWJvtg=;
 b=M3fnMiDa7pZiPX/Ooz2wArEpL8V5dJU0cXUwfWGP8iP6kY+fhnlLlIMetkjBPeeS71
 QnIlso1Y7GREAACDkbN/vejXhow/gKdKWzA0WAc39LMS84E2FnZFNosaSixmdVRdjpjk
 d0Q9w8/SybkU0CLY2r0NPGLmeTx4MhauhwoiNKymLIY1TW25KobMI5xZzC4XLhBwT1n0
 dv5rx4AHDPBTpsAOvPVDAMHVNygvJ0cLYj1zCCJPOycZ6w5ljESrsU9XOl7dDCY864S0
 0nibDnbd/0DK5M2SMb69MDyREfKhzp8DxU/BycB760zVihEz9m2GcawtAYZien3G+80u
 +peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705628599; x=1706233399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Uj9bxMJboKddkDeF9s1beNT2b+6oUXT7D7uJLWJvtg=;
 b=IO+m9cRZv1nCHrnJbCZz2jGKPpR5bcu+XmF8BPEW7tdGDICUzUhiXIf+qlbjqAChB/
 hbZAM/9M9lPh3BbFFRLf1lzHYqeiUpSlHJ/XIDTJvTLWNBI3YKmKrC3gdz5+XkbWccdh
 s1q59CnnlEHEtLi0IFU3t3lpEP+5N3dXyoA8d04yp8dcRAGcOAPSW6prcmNCrC7lz56P
 PIGL36xoKoYniRI5NkJKDMLiMItzo2ZInWA3SECHAwmf1xFnUF4/JMhoedVlHLWp6QNy
 R1Si9HYpQH+DRREGOs1x7wDXXAkeOh+iQdL8EG9XrknZ1f9h/uAZAORn5MBMrjZ7TMPy
 xliA==
X-Gm-Message-State: AOJu0YwrdZMIByyJO3JoKp6RY+Lkh8ets1ZWMLmdHYSDoJV+7ss/kdAK
 8ELZEtCQ2N5+ta/U1oXAgaygWEbhD1HZxexoRlrUWCvpKitjr6pNMcLrA9eKHtj7z6M9GFTEK0/
 rpcylsjldZY06DNrLHtuksQ+A6Oo=
X-Google-Smtp-Source: AGHT+IEJ1mUUmSNh1sqI1jfAL4Du2cur2X+seSx1zn2ZZlOgvSUUTBkcIOLxF0e4Y/6Fn1AS8ht2/Hi+HrvnCBX+Kvg=
X-Received: by 2002:a05:6402:34c4:b0:55a:4dfa:baa6 with SMTP id
 w4-20020a05640234c400b0055a4dfabaa6mr310534edc.62.1705628599081; Thu, 18 Jan
 2024 17:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-5-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 19 Jan 2024 09:43:06 +0800
Message-ID: <CAKGbVbv-4e7w8_8AGvFd358j-QcG8KJ1zdUZ3kit9odSCatZ5w@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 11:12=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
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
>  drivers/gpu/drm/lima/lima_sched.c | 32 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/lima/lima_sched.h |  2 ++
>  2 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 66317296d831..9449b81bcd5b 100644
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
> @@ -223,10 +224,7 @@ static struct dma_fence *lima_sched_run_job(struct d=
rm_sched_job *job)
>
>         task->fence =3D &fence->base;
>
> -       /* for caller usage of the fence, otherwise irq handler
> -        * may consume the fence before caller use it
> -        */
> -       dma_fence_get(task->fence);
> +       task->done_fence =3D dma_fence_get(task->fence);
>
>         pipe->current_task =3D task;
>
> @@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_timedout_j=
ob(struct drm_sched_job *job
>         struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
>         struct lima_sched_task *task =3D to_lima_task(job);
>         struct lima_device *ldev =3D pipe->ldev;
> +       struct lima_ip *ip =3D pipe->processor[0];
> +
> +       /*
> +        * If the GPU managed to complete this jobs fence, the timeout is
> +        * spurious. Bail out.
> +        */
> +       if (dma_fence_is_signaled(task->done_fence)) {
> +               DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> +               return DRM_GPU_SCHED_STAT_NOMINAL;
> +       }
> +
You may just remove this check and left the check after sync irq.

> +       /*
> +        * Lima IRQ handler may take a long time to process an interrupt
> +        * if there is another IRQ handler hogging the processing.
> +        * In order to catch such cases and not report spurious Lima job
> +        * timeouts, synchronize the IRQ handler and re-check the fence
> +        * status.
> +        */
> +       synchronize_irq(ip->irq);
This should be done after drm_sched_stop() to prevent drm scheduler
run more jobs. And we need to disable interrupt of GP/PP for no more
running job triggered fresh INT.

PP may have more than one IRQ, so we need to wait on all of them.

> +
> +       if (dma_fence_is_signaled(task->done_fence)) {
> +               DRM_WARN("%s unexpectedly high interrupt latency\n", lima=
_ip_name(ip));
> +               return DRM_GPU_SCHED_STAT_NOMINAL;
> +       }
>
>         if (!pipe->error)
> -               DRM_ERROR("lima job timeout\n");
> +               DRM_ERROR("%s lima job timeout\n", lima_ip_name(ip));
>
>         drm_sched_stop(&pipe->base, &task->base);
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lim=
a_sched.h
> index 6a11764d87b3..34050facb110 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -29,6 +29,8 @@ struct lima_sched_task {
>         bool recoverable;
>         struct lima_bo *heap;
>
> +       struct dma_fence *done_fence;
> +
>         /* pipe fence */
>         struct dma_fence *fence;
>  };
> --
> 2.43.0
>
