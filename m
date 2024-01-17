Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65D830CB4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8863910E7AD;
	Wed, 17 Jan 2024 18:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CDB10E78B;
 Wed, 17 Jan 2024 18:28:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-337bfdb6f84so341558f8f.0; 
 Wed, 17 Jan 2024 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705516022; x=1706120822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zQWgPbfKp6YM9aUfoUkYrRudM52sOmWJm/p3sD772Y=;
 b=J9tQJ/zWhcHhqlvyR+L24k0O+89yo3cRYd2byIW6ySWmYKCYOTT5ACQryBviZPXefb
 930FBUPq0mnjX7cE5LZwKnUx7Lhkz4ntEVJMlqvU5Rl/L1DhaEs/OUoDx7XkGoC87BZ8
 b3dDiLzf0meAmrtPQ+n+nTrOsP+a0iVtJsi8reQIhQZrsaR2J6JftDSMmsZQVgCSsXWn
 +o87PrJr1qgx+K6PB+b+zJYneYFkxv+aNlMDLc1x0G7wUigM8YVeThcDQLhF+aAIy7rN
 H8gl0cuX4EIVDv0smoZi5U5mJ7wTsxb16MYMJDLZj77gq1JefCa9vS8Q0g4GVz/uM6Bg
 36gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705516022; x=1706120822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zQWgPbfKp6YM9aUfoUkYrRudM52sOmWJm/p3sD772Y=;
 b=pkUtw0ZsosfTFMHJIeW+UJ99ZQvs0jETndCBAyiiZLXHmSnvkoBsPJoNieJGSIyY/Z
 SaBfCFuc4NxRszfq2dUZwZHBwNa+LN0Ud+qEtlQlubRgkBQgndtj4ap6mf/Vsxst6PF3
 2+yXYQ/ji0hOCRJ7GgcqVA/1MNOPNht0VDCb1/ODIgXALL4hmhqFekHyXgu/hMtFQhjs
 HTvjmOBg1/V0YK9gnlueXPbRm5G5ETwZH2WWXpRonsxsicJNe3mkA1DmoQzsxG+JJN7+
 d7q3mKccOgAyh4TZ91V02qdDI0u/qMfg5fHlybH2FO+DSltmto9aQ/Q94lTJi5WERjt2
 uwPA==
X-Gm-Message-State: AOJu0YxebrWpkyi+xUdhFOqZsHfzCTxVEwClgaSprxsBpjZRHx3WV24h
 OKKX/fz/1S90iQlupZh1RYu9Fj9OSK4UFSigI2I=
X-Google-Smtp-Source: AGHT+IFdnC0bev8FKCUUagV9fb50fuvyKdfakd6ZW2v7kea9CH61+ePpb4Manrk974u1JjOoEErUW2Z0nZYBQvx7hpE=
X-Received: by 2002:adf:f48a:0:b0:337:c536:8516 with SMTP id
 l10-20020adff48a000000b00337c5368516mr159173wro.6.1705516021817; Wed, 17 Jan
 2024 10:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-5-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 17 Jan 2024 10:26:35 -0800
Message-ID: <CA+E=qVeWi_RwLUOZJTAa6_Tx3pPTbym5_JtWYJetBiFUXnDQgw@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 7:12=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
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
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

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
> +
>         /* pipe fence */
>         struct dma_fence *fence;
>  };
> --
> 2.43.0
>
