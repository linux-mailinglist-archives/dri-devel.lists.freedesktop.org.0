Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60AE12F45F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 06:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182AD6E17F;
	Fri,  3 Jan 2020 05:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE726E17F;
 Fri,  3 Jan 2020 05:46:48 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d5so36228219qto.0;
 Thu, 02 Jan 2020 21:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQro+VyDpPdwSt+1EKuK9o0rqpV0fN2P3Ugt6iPnf88=;
 b=TCPBqgBfZ+Sokkb32KXQJpP2X72wQnDWj+5CYyNqExP27JI2+QC2xntLPyLFpmW+3o
 nPF/8VK1bxaBqF3FU5O1DV0FFKxWKFpEV648EFNtvqZ60Pgm8aiPvEEnQF8sGNKiI7Qc
 gwec7i7KIqMZzf3ULxFNit5Iod6fJe5P3dzjyo/dhu0nzl1rIbsAmtjyFg+cqs//l7ei
 1q98jr0XRXbU+VgAmzJpy6EK/THrXRM1BipuvUpFEEUHQtd38hgIL0wP1R6dUQHKBghP
 YtFDYDKx9eaVFLyJTA6OoNUwd7dGSamABZ7SmL0QPMU3XO9R+WPLPazUm08giZfbJoqW
 dJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQro+VyDpPdwSt+1EKuK9o0rqpV0fN2P3Ugt6iPnf88=;
 b=HKMVAMHIt0nh5c5r77IIhlLAepQno8/e0GBQu/gu+KZtEK4hnUd6DxLSKMCLJyu7qZ
 83j59ESor8hBvoJFFntBrXtQijjaykeJOthBGDelm4Wdj1yBs36AA7p443e8dHHO51qG
 t+UD6qcI+tOL57vN3hF948Fzw8WYuY1QLtSyGBbpmxChqYZ+YNnG6vUx2jX79YJ7XRHP
 6ojbj4D+16Ogp//h2DnsLKXeOPkiaiIGOR6S1U619/QjXFdi8pxcFVXThc7nCQvGvmJo
 GkyUBDJNWwAhElkgrvauo1NCLE8jAij+z8kgAmiHdv1PaeF5kOChJIeGyvuF/fjxI68g
 crgw==
X-Gm-Message-State: APjAAAVB+ZDRZfE+v/zrLLMRhG95jvS1rFFBAYaRGYGXwoJtITQVU6g5
 FZyyiIi39LBt1Qy68mkQHWsZEM5uIXjiL3lsf9Y=
X-Google-Smtp-Source: APXvYqyGMEbfjhbsGKyEG9YZ4B1zFDnyd6ZxQV0yMVieopUDPT12XmltOBa69X0aa7zFGQSCYnJFBmV1OyT+NygLEc8=
X-Received: by 2002:ac8:337c:: with SMTP id u57mr54754260qta.42.1578030407165; 
 Thu, 02 Jan 2020 21:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20200101103831.22429-1-yuq825@gmail.com>
In-Reply-To: <20200101103831.22429-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 2 Jan 2020 21:46:21 -0800
Message-ID: <CA+E=qVfhNeHqSYrxD_v5pQ-kZZvM0xZp+5Tue_VOpn6yAhu7BQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: use drm_sched_fault for error task handling
To: Qiang Yu <yuq825@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 1, 2020 at 2:39 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> drm_sched_job_timedout works with drm_sched_stop as a pair,
> so we'd better use the drm_sched_fault helper to make the
> error and timeout handling go the same path.
>
> This also fixes application hang when task error.
>
> Signed-off-by: Qiang Yu <yuq825@gmail.com>

LGTM in general.

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

Erico, Andreas, could you test this patch on actual hardware? I'll
have pretty limited access to the hardware for next few weeks, so I
won't be able to test it myself.

> ---
>  drivers/gpu/drm/lima/lima_sched.c | 35 ++++++++-----------------------
>  drivers/gpu/drm/lima/lima_sched.h |  2 --
>  2 files changed, 9 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index f522c5f99729..a31a90c380b6 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -255,13 +255,17 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
>         return task->fence;
>  }
>
> -static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
> -                                        struct lima_sched_task *task)
> +static void lima_sched_timedout_job(struct drm_sched_job *job)
>  {
> +       struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
> +       struct lima_sched_task *task = to_lima_task(job);
> +
> +       if (!pipe->error)
> +               DRM_ERROR("lima job timeout\n");
> +
>         drm_sched_stop(&pipe->base, &task->base);
>
> -       if (task)
> -               drm_sched_increase_karma(&task->base);
> +       drm_sched_increase_karma(&task->base);
>
>         pipe->task_error(pipe);
>
> @@ -284,16 +288,6 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
>         drm_sched_start(&pipe->base, true);
>  }
>
> -static void lima_sched_timedout_job(struct drm_sched_job *job)
> -{
> -       struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
> -       struct lima_sched_task *task = to_lima_task(job);
> -
> -       DRM_ERROR("lima job timeout\n");
> -
> -       lima_sched_handle_error_task(pipe, task);
> -}
> -
>  static void lima_sched_free_job(struct drm_sched_job *job)
>  {
>         struct lima_sched_task *task = to_lima_task(job);
> @@ -318,15 +312,6 @@ static const struct drm_sched_backend_ops lima_sched_ops = {
>         .free_job = lima_sched_free_job,
>  };
>
> -static void lima_sched_error_work(struct work_struct *work)
> -{
> -       struct lima_sched_pipe *pipe =
> -               container_of(work, struct lima_sched_pipe, error_work);
> -       struct lima_sched_task *task = pipe->current_task;
> -
> -       lima_sched_handle_error_task(pipe, task);
> -}
> -
>  int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  {
>         unsigned int timeout = lima_sched_timeout_ms > 0 ?
> @@ -335,8 +320,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>         pipe->fence_context = dma_fence_context_alloc(1);
>         spin_lock_init(&pipe->fence_lock);
>
> -       INIT_WORK(&pipe->error_work, lima_sched_error_work);
> -
>         return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
>                               msecs_to_jiffies(timeout), name);
>  }
> @@ -349,7 +332,7 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
>  void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
>  {
>         if (pipe->error)
> -               schedule_work(&pipe->error_work);
> +               drm_sched_fault(&pipe->base);
>         else {
>                 struct lima_sched_task *task = pipe->current_task;
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> index 928af91c1118..1d814fecbcc0 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -68,8 +68,6 @@ struct lima_sched_pipe {
>         void (*task_fini)(struct lima_sched_pipe *pipe);
>         void (*task_error)(struct lima_sched_pipe *pipe);
>         void (*task_mmu_error)(struct lima_sched_pipe *pipe);
> -
> -       struct work_struct error_work;
>  };
>
>  int lima_sched_task_init(struct lima_sched_task *task,
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
