Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B76CAC56
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 19:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736FE10E3CA;
	Mon, 27 Mar 2023 17:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3910E3CA;
 Mon, 27 Mar 2023 17:54:01 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b20so39661352edd.1;
 Mon, 27 Mar 2023 10:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679939639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWscqt64dBsMncu3COHDMB1BqP04lk8eyzgeonAHOqs=;
 b=WqL4NNRIaPFWs35S1MO8cmJQMk9kjQCIc7TBiVje27rSaHpuEsGRHB/offJhIzbAfT
 3FJ+5z8Sza+GDjLHHaewQwYuAy1exlRT+/wLfBxthPtecxbqgu9UfGJ9GieN1V2QEtGp
 bseux1nf2V1jLH/fTeFTyO/CSFjUcYdwJZkNPx5KP8G/FKLSHGkVfKmfL4e659Fsl5BG
 lE29VhFpFFRzPrz6jcdrSK21XRAaEvov7dPtZCD/ofxWxCJT7kipjZ21scwUbHQrOz3b
 SDzBsZB5yAI/XiOpSsj3/BocgT9Cftu4X/FLGDwdf030EPdRiiO87vhgntCAVoNUhPV5
 RoCw==
X-Gm-Message-State: AAQBX9cmODCExYuptayP8SJNLlaXGWeb3eyIbsBJinUIwO9wn82/McbC
 CrePjBbeurXtmvc5hh8MSAkFjp9j/C8uBkZ3I3I=
X-Google-Smtp-Source: AKy350a4DGQ73eEwv7jAXv880KI10XbeTQYt8OVBqhHQ8EskIZpQUbsenJTrYoNjKWWnwt8AqFj12tU59FL5WIJI5pA=
X-Received: by 2002:a17:907:6285:b0:931:f8b1:4472 with SMTP id
 nd5-20020a170907628500b00931f8b14472mr6161112ejc.2.1679939639039; Mon, 27 Mar
 2023 10:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230320144356.803762-1-robdclark@gmail.com>
 <20230320144356.803762-18-robdclark@gmail.com>
In-Reply-To: <20230320144356.803762-18-robdclark@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Mar 2023 19:53:48 +0200
Message-ID: <CAJZ5v0g0vFoZm=tVG=c2Eh_NObA6sXA10BdT4PsMnnbMidtEQA@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] PM / QoS: Fix constraints alloc vs reclaim
 locking
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm@vger.kernel.org, "open list:HIBERNATION \(aka Software Suspend,
 aka swsusp\)" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 3:45=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> In the process of adding lockdep annotation for drm GPU scheduler's
> job_run() to detect potential deadlock against shrinker/reclaim, I hit
> this lockdep splat:
>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>    WARNING: possible circular locking dependency detected
>    6.2.0-rc8-debug+ #558 Tainted: G        W
>    ------------------------------------------------------
>    ring0/125 is trying to acquire lock:
>    ffffffd6d6ce0f28 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_update_r=
equest+0x38/0x68
>
>    but task is already holding lock:
>    ffffff8087239208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_submit+0=
xec/0x178
>
>    which lock already depends on the new lock.
>
>    the existing dependency chain (in reverse order) is:
>
>    -> #4 (&gpu->active_lock){+.+.}-{3:3}:
>           __mutex_lock+0xcc/0x3c8
>           mutex_lock_nested+0x30/0x44
>           msm_gpu_submit+0xec/0x178
>           msm_job_run+0x78/0x150
>           drm_sched_main+0x290/0x370
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    -> #3 (dma_fence_map){++++}-{0:0}:
>           __dma_fence_might_wait+0x74/0xc0
>           dma_resv_lockdep+0x1f4/0x2f4
>           do_one_initcall+0x104/0x2bc
>           kernel_init_freeable+0x344/0x34c
>           kernel_init+0x30/0x134
>           ret_from_fork+0x10/0x20
>
>    -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
>           fs_reclaim_acquire+0x80/0xa8
>           slab_pre_alloc_hook.constprop.0+0x40/0x25c
>           __kmem_cache_alloc_node+0x60/0x1cc
>           __kmalloc+0xd8/0x100
>           topology_parse_cpu_capacity+0x8c/0x178
>           get_cpu_for_node+0x88/0xc4
>           parse_cluster+0x1b0/0x28c
>           parse_cluster+0x8c/0x28c
>           init_cpu_topology+0x168/0x188
>           smp_prepare_cpus+0x24/0xf8
>           kernel_init_freeable+0x18c/0x34c
>           kernel_init+0x30/0x134
>           ret_from_fork+0x10/0x20
>
>    -> #1 (fs_reclaim){+.+.}-{0:0}:
>           __fs_reclaim_acquire+0x3c/0x48
>           fs_reclaim_acquire+0x54/0xa8
>           slab_pre_alloc_hook.constprop.0+0x40/0x25c
>           __kmem_cache_alloc_node+0x60/0x1cc
>           kmalloc_trace+0x50/0xa8
>           dev_pm_qos_constraints_allocate+0x38/0x100
>           __dev_pm_qos_add_request+0xb0/0x1e8
>           dev_pm_qos_add_request+0x58/0x80
>           dev_pm_qos_expose_latency_limit+0x60/0x13c
>           register_cpu+0x12c/0x130
>           topology_init+0xac/0xbc
>           do_one_initcall+0x104/0x2bc
>           kernel_init_freeable+0x344/0x34c
>           kernel_init+0x30/0x134
>           ret_from_fork+0x10/0x20
>
>    -> #0 (dev_pm_qos_mtx){+.+.}-{3:3}:
>           __lock_acquire+0xe00/0x1060
>           lock_acquire+0x1e0/0x2f8
>           __mutex_lock+0xcc/0x3c8
>           mutex_lock_nested+0x30/0x44
>           dev_pm_qos_update_request+0x38/0x68
>           msm_devfreq_boost+0x40/0x70
>           msm_devfreq_active+0xc0/0xf0
>           msm_gpu_submit+0x10c/0x178
>           msm_job_run+0x78/0x150
>           drm_sched_main+0x290/0x370
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    other info that might help us debug this:
>
>    Chain exists of:
>      dev_pm_qos_mtx --> dma_fence_map --> &gpu->active_lock
>
>     Possible unsafe locking scenario:
>
>           CPU0                    CPU1
>           ----                    ----
>      lock(&gpu->active_lock);
>                                   lock(dma_fence_map);
>                                   lock(&gpu->active_lock);
>      lock(dev_pm_qos_mtx);
>
>     *** DEADLOCK ***
>
>    3 locks held by ring0/123:
>     #0: ffffff8087251170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x64/0=
x150
>     #1: ffffffd00b0e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run+0x6=
8/0x150
>     #2: ffffff8087251208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_sub=
mit+0xec/0x178
>
>    stack backtrace:
>    CPU: 6 PID: 123 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #559
>    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>    Call trace:
>     dump_backtrace.part.0+0xb4/0xf8
>     show_stack+0x20/0x38
>     dump_stack_lvl+0x9c/0xd0
>     dump_stack+0x18/0x34
>     print_circular_bug+0x1b4/0x1f0
>     check_noncircular+0x78/0xac
>     __lock_acquire+0xe00/0x1060
>     lock_acquire+0x1e0/0x2f8
>     __mutex_lock+0xcc/0x3c8
>     mutex_lock_nested+0x30/0x44
>     dev_pm_qos_update_request+0x38/0x68
>     msm_devfreq_boost+0x40/0x70
>     msm_devfreq_active+0xc0/0xf0
>     msm_gpu_submit+0x10c/0x178
>     msm_job_run+0x78/0x150
>     drm_sched_main+0x290/0x370
>     kthread+0xf0/0x100
>     ret_from_fork+0x10/0x20
>
> The issue is that dev_pm_qos_mtx is held in the runpm suspend/resume (or
> freq change) path, but it is also held across allocations that could
> recurse into shrinker.
>
> Solve this by changing dev_pm_qos_constraints_allocate() into a function
> that can be called unconditionally before the device qos object is
> needed and before aquiring dev_pm_qos_mtx.  This way the allocations can
> be done without holding the mutex.  In the case that we raced with
> another thread to allocate the qos object, detect this *after* acquiring
> the dev_pm_qos_mtx and simply free the redundant allocations.

Honestly, I don't like this approach.

In particular, dropping a lock just in order to grab it again right
away is really confusing (and I'm not even sure it is correct ATM).

Let me think about how to possibly address the issue at hand in a different=
 way.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/base/power/qos.c | 60 +++++++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> index 8e93167f1783..f3e0c6b65635 100644
> --- a/drivers/base/power/qos.c
> +++ b/drivers/base/power/qos.c
> @@ -185,18 +185,24 @@ static int apply_constraint(struct dev_pm_qos_reque=
st *req,
>  }
>
>  /*
> - * dev_pm_qos_constraints_allocate
> + * dev_pm_qos_constraints_ensure_allocated
>   * @dev: device to allocate data for
>   *
> - * Called at the first call to add_request, for constraint data allocati=
on
> - * Must be called with the dev_pm_qos_mtx mutex held
> + * Called to ensure that devices qos is allocated, before acquiring
> + * dev_pm_qos_mtx.
>   */
> -static int dev_pm_qos_constraints_allocate(struct device *dev)
> +static int dev_pm_qos_constraints_ensure_allocated(struct device *dev)
>  {
>         struct dev_pm_qos *qos;
>         struct pm_qos_constraints *c;
>         struct blocking_notifier_head *n;
>
> +       if (!dev)
> +               return -ENODEV;
> +
> +       if (!IS_ERR_OR_NULL(dev->power.qos))
> +               return 0;
> +
>         qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
>         if (!qos)
>                 return -ENOMEM;
> @@ -227,10 +233,26 @@ static int dev_pm_qos_constraints_allocate(struct d=
evice *dev)
>
>         INIT_LIST_HEAD(&qos->flags.list);
>
> +       mutex_lock(&dev_pm_qos_mtx);
> +
> +       if (!IS_ERR_OR_NULL(dev->power.qos)) {
> +               /*
> +                * We have raced with another task to create the qos.
> +                * No biggie, just free the resources we've allocated
> +                * outside of dev_pm_qos_mtx and move on with life.
> +                */
> +               kfree(n);
> +               kfree(qos);
> +               goto unlock;
> +       }
> +
>         spin_lock_irq(&dev->power.lock);
>         dev->power.qos =3D qos;
>         spin_unlock_irq(&dev->power.lock);
>
> +unlock:
> +       mutex_unlock(&dev_pm_qos_mtx);
> +
>         return 0;
>  }
>
> @@ -331,17 +353,15 @@ static int __dev_pm_qos_add_request(struct device *=
dev,
>  {
>         int ret =3D 0;
>
> -       if (!dev || !req || dev_pm_qos_invalid_req_type(dev, type))
> +       if (!req || dev_pm_qos_invalid_req_type(dev, type))
>                 return -EINVAL;
>
>         if (WARN(dev_pm_qos_request_active(req),
>                  "%s() called for already added request\n", __func__))
>                 return -EINVAL;
>
> -       if (IS_ERR(dev->power.qos))
> +       if (IS_ERR_OR_NULL(dev->power.qos))
>                 ret =3D -ENODEV;
> -       else if (!dev->power.qos)
> -               ret =3D dev_pm_qos_constraints_allocate(dev);
>
>         trace_dev_pm_qos_add_request(dev_name(dev), type, value);
>         if (ret)
> @@ -390,6 +410,10 @@ int dev_pm_qos_add_request(struct device *dev, struc=
t dev_pm_qos_request *req,
>  {
>         int ret;
>
> +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> +       if (ret)
> +               return ret;
> +
>         mutex_lock(&dev_pm_qos_mtx);
>         ret =3D __dev_pm_qos_add_request(dev, req, type, value);
>         mutex_unlock(&dev_pm_qos_mtx);
> @@ -537,15 +561,11 @@ int dev_pm_qos_add_notifier(struct device *dev, str=
uct notifier_block *notifier,
>  {
>         int ret =3D 0;
>
> -       mutex_lock(&dev_pm_qos_mtx);
> -
> -       if (IS_ERR(dev->power.qos))
> -               ret =3D -ENODEV;
> -       else if (!dev->power.qos)
> -               ret =3D dev_pm_qos_constraints_allocate(dev);
> -
> +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
>         if (ret)
> -               goto unlock;
> +               return ret;
> +
> +       mutex_lock(&dev_pm_qos_mtx);
>
>         switch (type) {
>         case DEV_PM_QOS_RESUME_LATENCY:
> @@ -565,7 +585,6 @@ int dev_pm_qos_add_notifier(struct device *dev, struc=
t notifier_block *notifier,
>                 ret =3D -EINVAL;
>         }
>
> -unlock:
>         mutex_unlock(&dev_pm_qos_mtx);
>         return ret;
>  }
> @@ -905,10 +924,13 @@ int dev_pm_qos_update_user_latency_tolerance(struct=
 device *dev, s32 val)
>  {
>         int ret;
>
> +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> +       if (ret)
> +               return ret;
> +
>         mutex_lock(&dev_pm_qos_mtx);
>
> -       if (IS_ERR_OR_NULL(dev->power.qos)
> -           || !dev->power.qos->latency_tolerance_req) {
> +       if (!dev->power.qos->latency_tolerance_req) {
>                 struct dev_pm_qos_request *req;
>
>                 if (val < 0) {
> --
