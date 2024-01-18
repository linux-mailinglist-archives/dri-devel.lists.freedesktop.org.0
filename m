Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F42483117F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 03:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36A610E11C;
	Thu, 18 Jan 2024 02:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0210110E0ED;
 Thu, 18 Jan 2024 02:47:59 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55a025bca6eso244733a12.1; 
 Wed, 17 Jan 2024 18:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705546018; x=1706150818; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHmomQH38paTE5xCI3dpwn2LAG3AYq1xzdGV557xeOg=;
 b=COocGMG8F1E/Zs63CNdAIu5q2x5mR9EzhGPtvq+yegi/QIv7AVxsWc1cANEwYle2TZ
 jMvPW3uctqco/R1YwGZKY97XsodFks4c5MCKj0F9dmfp4vEszzx2FzmT0vOQVq/P/fVM
 06KWgd2XkwZEpmNPaqfeoGzS9Yh85rLzHQZbZ756RogieNuyuASP6Ilqku7jj4jnbzOp
 iWcJ8XR7ddEaxGHotjeDRQUusLoo/FlRtoKlxrztAm+YiGnA5FZDQ579+ATKFIlwtMeF
 QJ7XICB8jsW8VbOeJYZjDvZTCA9YrAxCDGWJr9Z9ysE8609tHvXsanYtqp/qw62i8ciD
 p02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705546018; x=1706150818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kHmomQH38paTE5xCI3dpwn2LAG3AYq1xzdGV557xeOg=;
 b=bU/Cep3umr9pBAYYOhx6JhEug15+2ZDIZpv3sGAscoSnjqhGvcrsAXZ19Boud4HdHX
 qe76N5NwUC5It/oz0xrwvg6MwfPtUQmmp9ASfCMajogSjdwYubNc32RbrtNkVf37JBN4
 jLvjM68yQi6nqaND9utH2Ia8+JtA8mLImdxyAXOFHBBGwVRwvFtb/OGK0kJ7GHl1zcii
 8Wez0zm5C4eN9FSFGysuUVCZ0tg0zeicChVbD9NhO6H3oxj10kvFRTtJwI/4WahLzI2c
 F+KHZxXl+U3QHCYpWvTUjQBO5+VyhlrPJLMXzTRULWywDrclmlOgoXs9FeFLRWWOGGp/
 99rg==
X-Gm-Message-State: AOJu0YxjKGHumBJZAegf8QvT/WmeJ/EimZ5vecOwFrfmBhQ78I+gN8K8
 Ew7q4TMdrEOZry7MbbiFrutSD0B32V1Q2lsnnxcK1yYdQhsLQsw+B9X9M4PVJC4umySpRpVyAM0
 btUWniOvZPJibSfX1pKz9SVAcW44=
X-Google-Smtp-Source: AGHT+IGq7Rt3gmWSJ2cc0HSvFnvqmxggQFLvea2EmHBIRixEzzXhYjmh0FInWbQDnltu4393Q2WBCljfYusiK531JVM=
X-Received: by 2002:a50:fe97:0:b0:559:2e01:3b75 with SMTP id
 d23-20020a50fe97000000b005592e013b75mr51053edt.63.1705546018440; Wed, 17 Jan
 2024 18:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-5-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 18 Jan 2024 10:46:46 +0800
Message-ID: <CAKGbVbsYJ7dusKREwpMVsxi+ryh+1ieshhwfJ72XVQ8b3x5OaA@mail.gmail.com>
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
> +       /*
> +        * Lima IRQ handler may take a long time to process an interrupt
> +        * if there is another IRQ handler hogging the processing.
> +        * In order to catch such cases and not report spurious Lima job
> +        * timeouts, synchronize the IRQ handler and re-check the fence
> +        * status.
> +        */
> +       synchronize_irq(ip->irq);
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
This is same as the following fence, do we really need a duplicated one?

> +
>         /* pipe fence */
>         struct dma_fence *fence;
>  };
> --
> 2.43.0
>
