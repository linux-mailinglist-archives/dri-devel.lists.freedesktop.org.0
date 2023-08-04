Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9F7709FE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 22:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF1110E125;
	Fri,  4 Aug 2023 20:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C8E10E14C;
 Fri,  4 Aug 2023 20:46:07 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-56475c1b930so438856eaf.0; 
 Fri, 04 Aug 2023 13:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691181967; x=1691786767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ej+VBajIO20zTe/Lx2V2exEQ/ngunkZ8hIxQUiP2VI=;
 b=fl5yGr/o1zTpZOQZJlMA3Lph1wYiX7A3x2NMhGoyXkfMEIxtX2E1XflOJ8uEeK6Mpv
 eu3im55OmVf2vfkkOyhmW9F5xzxTdibHjQsFk/StAVdhVbO1AzpHTzL7PQOiOUTRdrZo
 MWKbiDv6+/2O+rcFWlSObqUa4083KuSzp53KXKkxb1k42nUP0kzoyfnU3JaerE6yWuoi
 iEhJU3pw8JJ6S2IBxxTT9bVl+eDO2w7LzlmvwD4XrYF93nDzrf3HNPmPl80JECKveQ49
 /YEVgyMqLA3Wkg1QJr5mH0n1zTMmsha9GIiQ/dJnAJol0G5Ym2QK5ju1uEXTDj4/P/vK
 U2/g==
X-Gm-Message-State: ABy/qLZC0fFBHgQEyVYVv1M3JeYqQ+JsnyKvSrhharYSUaJ4QQ3ZFSjy
 vP7DEV96ysVLYqzBcUmI5EgFDxfyHw0aVxMZ3xpRnYBh
X-Google-Smtp-Source: APBJJlFjSxR3/voaq9JkJ4886QvwrFkLj9Pyf7ghai0G/M1yXQX1ac1Nlwc+GPMGKM4ReO9EKkS9xdj2XDUj7BOooPM=
X-Received: by 2002:a05:6820:2201:b0:560:b01a:653d with SMTP id
 cj1-20020a056820220100b00560b01a653dmr20304159oob.0.1691181966899; Fri, 04
 Aug 2023 13:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230803220202.78036-1-robdclark@gmail.com>
 <20230803220202.78036-4-robdclark@gmail.com>
 <CAJZ5v0jV+Da+kw5JuGAhuGA6QJKmteCfnjGCk8DrNOe8Gvdg5w@mail.gmail.com>
 <CAF6AEGvPjvTmK5NE1zkXSrSThpPNWCimUoQS-oBTDdUtEGKp4A@mail.gmail.com>
 <CAJZ5v0hGX_b1yPTrs=3Jyhm8hcFBprvVLgngK+oAFr_66jvytg@mail.gmail.com>
 <CAF6AEGtKmueSYXjrgapit-0Dot1q-P1dkT8Zs+cXtbHeAnpjAA@mail.gmail.com>
In-Reply-To: <CAF6AEGtKmueSYXjrgapit-0Dot1q-P1dkT8Zs+cXtbHeAnpjAA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 4 Aug 2023 22:45:55 +0200
Message-ID: <CAJZ5v0h=cuL7rfEpYeSOySCqA0wrA7XsneZTLCMQxUXjWBgKjg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] PM / QoS: Fix constraints alloc vs reclaim locking
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
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:HIBERNATION \(aka Software Suspend,
 aka swsusp\)" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 10:38=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Aug 4, 2023 at 12:11=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > On Fri, Aug 4, 2023 at 8:38=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> > >
> > > On Fri, Aug 4, 2023 at 10:07=E2=80=AFAM Rafael J. Wysocki <rafael@ker=
nel.org> wrote:
> > > >
> > > > On Fri, Aug 4, 2023 at 12:02=E2=80=AFAM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > In the process of adding lockdep annotation for drm GPU scheduler=
's
> > > > > job_run() to detect potential deadlock against shrinker/reclaim, =
I hit
> > > > > this lockdep splat:
> > > > >
> > > > >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >    WARNING: possible circular locking dependency detected
> > > > >    6.2.0-rc8-debug+ #558 Tainted: G        W
> > > > >    ------------------------------------------------------
> > > > >    ring0/125 is trying to acquire lock:
> > > > >    ffffffd6d6ce0f28 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_=
update_request+0x38/0x68
> > > > >
> > > > >    but task is already holding lock:
> > > > >    ffffff8087239208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_=
submit+0xec/0x178
> > > > >
> > > > >    which lock already depends on the new lock.
> > > > >
> > > > >    the existing dependency chain (in reverse order) is:
> > > > >
> > > > >    -> #4 (&gpu->active_lock){+.+.}-{3:3}:
> > > > >           __mutex_lock+0xcc/0x3c8
> > > > >           mutex_lock_nested+0x30/0x44
> > > > >           msm_gpu_submit+0xec/0x178
> > > > >           msm_job_run+0x78/0x150
> > > > >           drm_sched_main+0x290/0x370
> > > > >           kthread+0xf0/0x100
> > > > >           ret_from_fork+0x10/0x20
> > > > >
> > > > >    -> #3 (dma_fence_map){++++}-{0:0}:
> > > > >           __dma_fence_might_wait+0x74/0xc0
> > > > >           dma_resv_lockdep+0x1f4/0x2f4
> > > > >           do_one_initcall+0x104/0x2bc
> > > > >           kernel_init_freeable+0x344/0x34c
> > > > >           kernel_init+0x30/0x134
> > > > >           ret_from_fork+0x10/0x20
> > > > >
> > > > >    -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> > > > >           fs_reclaim_acquire+0x80/0xa8
> > > > >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> > > > >           __kmem_cache_alloc_node+0x60/0x1cc
> > > > >           __kmalloc+0xd8/0x100
> > > > >           topology_parse_cpu_capacity+0x8c/0x178
> > > > >           get_cpu_for_node+0x88/0xc4
> > > > >           parse_cluster+0x1b0/0x28c
> > > > >           parse_cluster+0x8c/0x28c
> > > > >           init_cpu_topology+0x168/0x188
> > > > >           smp_prepare_cpus+0x24/0xf8
> > > > >           kernel_init_freeable+0x18c/0x34c
> > > > >           kernel_init+0x30/0x134
> > > > >           ret_from_fork+0x10/0x20
> > > > >
> > > > >    -> #1 (fs_reclaim){+.+.}-{0:0}:
> > > > >           __fs_reclaim_acquire+0x3c/0x48
> > > > >           fs_reclaim_acquire+0x54/0xa8
> > > > >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> > > > >           __kmem_cache_alloc_node+0x60/0x1cc
> > > > >           kmalloc_trace+0x50/0xa8
> > > > >           dev_pm_qos_constraints_allocate+0x38/0x100
> > > > >           __dev_pm_qos_add_request+0xb0/0x1e8
> > > > >           dev_pm_qos_add_request+0x58/0x80
> > > > >           dev_pm_qos_expose_latency_limit+0x60/0x13c
> > > > >           register_cpu+0x12c/0x130
> > > > >           topology_init+0xac/0xbc
> > > > >           do_one_initcall+0x104/0x2bc
> > > > >           kernel_init_freeable+0x344/0x34c
> > > > >           kernel_init+0x30/0x134
> > > > >           ret_from_fork+0x10/0x20
> > > > >
> > > > >    -> #0 (dev_pm_qos_mtx){+.+.}-{3:3}:
> > > > >           __lock_acquire+0xe00/0x1060
> > > > >           lock_acquire+0x1e0/0x2f8
> > > > >           __mutex_lock+0xcc/0x3c8
> > > > >           mutex_lock_nested+0x30/0x44
> > > > >           dev_pm_qos_update_request+0x38/0x68
> > > > >           msm_devfreq_boost+0x40/0x70
> > > > >           msm_devfreq_active+0xc0/0xf0
> > > > >           msm_gpu_submit+0x10c/0x178
> > > > >           msm_job_run+0x78/0x150
> > > > >           drm_sched_main+0x290/0x370
> > > > >           kthread+0xf0/0x100
> > > > >           ret_from_fork+0x10/0x20
> > > > >
> > > > >    other info that might help us debug this:
> > > > >
> > > > >    Chain exists of:
> > > > >      dev_pm_qos_mtx --> dma_fence_map --> &gpu->active_lock
> > > > >
> > > > >     Possible unsafe locking scenario:
> > > > >
> > > > >           CPU0                    CPU1
> > > > >           ----                    ----
> > > > >      lock(&gpu->active_lock);
> > > > >                                   lock(dma_fence_map);
> > > > >                                   lock(&gpu->active_lock);
> > > > >      lock(dev_pm_qos_mtx);
> > > > >
> > > > >     *** DEADLOCK ***
> > > > >
> > > > >    3 locks held by ring0/123:
> > > > >     #0: ffffff8087251170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_ru=
n+0x64/0x150
> > > > >     #1: ffffffd00b0e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job=
_run+0x68/0x150
> > > > >     #2: ffffff8087251208 (&gpu->active_lock){+.+.}-{3:3}, at: msm=
_gpu_submit+0xec/0x178
> > > > >
> > > > >    stack backtrace:
> > > > >    CPU: 6 PID: 123 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #559
> > > > >    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> > > > >    Call trace:
> > > > >     dump_backtrace.part.0+0xb4/0xf8
> > > > >     show_stack+0x20/0x38
> > > > >     dump_stack_lvl+0x9c/0xd0
> > > > >     dump_stack+0x18/0x34
> > > > >     print_circular_bug+0x1b4/0x1f0
> > > > >     check_noncircular+0x78/0xac
> > > > >     __lock_acquire+0xe00/0x1060
> > > > >     lock_acquire+0x1e0/0x2f8
> > > > >     __mutex_lock+0xcc/0x3c8
> > > > >     mutex_lock_nested+0x30/0x44
> > > > >     dev_pm_qos_update_request+0x38/0x68
> > > > >     msm_devfreq_boost+0x40/0x70
> > > > >     msm_devfreq_active+0xc0/0xf0
> > > > >     msm_gpu_submit+0x10c/0x178
> > > > >     msm_job_run+0x78/0x150
> > > > >     drm_sched_main+0x290/0x370
> > > > >     kthread+0xf0/0x100
> > > > >     ret_from_fork+0x10/0x20
> > > > >
> > > > > The issue is that dev_pm_qos_mtx is held in the runpm suspend/res=
ume (or
> > > > > freq change) path, but it is also held across allocations that co=
uld
> > > > > recurse into shrinker.
> > > > >
> > > > > Solve this by changing dev_pm_qos_constraints_allocate() into a f=
unction
> > > > > that can be called unconditionally before the device qos object i=
s
> > > > > needed and before aquiring dev_pm_qos_mtx.  This way the allocati=
ons can
> > > > > be done without holding the mutex.  In the case that we raced wit=
h
> > > > > another thread to allocate the qos object, detect this *after* ac=
quiring
> > > > > the dev_pm_qos_mtx and simply free the redundant allocations.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/base/power/qos.c | 60 +++++++++++++++++++++++++++-------=
------
> > > > >  1 file changed, 41 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> > > > > index 8e93167f1783..f3e0c6b65635 100644
> > > > > --- a/drivers/base/power/qos.c
> > > > > +++ b/drivers/base/power/qos.c
> > > > > @@ -185,18 +185,24 @@ static int apply_constraint(struct dev_pm_q=
os_request *req,
> > > > >  }
> > > > >
> > > > >  /*
> > > > > - * dev_pm_qos_constraints_allocate
> > > > > + * dev_pm_qos_constraints_ensure_allocated
> > > > >   * @dev: device to allocate data for
> > > > >   *
> > > > > - * Called at the first call to add_request, for constraint data =
allocation
> > > > > - * Must be called with the dev_pm_qos_mtx mutex held
> > > > > + * Called to ensure that devices qos is allocated, before acquir=
ing
> > > > > + * dev_pm_qos_mtx.
> > > > >   */
> > > > > -static int dev_pm_qos_constraints_allocate(struct device *dev)
> > > > > +static int dev_pm_qos_constraints_ensure_allocated(struct device=
 *dev)
> > > > >  {
> > > > >         struct dev_pm_qos *qos;
> > > > >         struct pm_qos_constraints *c;
> > > > >         struct blocking_notifier_head *n;
> > > > >
> > > > > +       if (!dev)
> > > > > +               return -ENODEV;
> > > > > +
> > > > > +       if (!IS_ERR_OR_NULL(dev->power.qos))
> > > > > +               return 0;
> > > > > +
> > > > >         qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
> > > > >         if (!qos)
> > > > >                 return -ENOMEM;
> > > > > @@ -227,10 +233,26 @@ static int dev_pm_qos_constraints_allocate(=
struct device *dev)
> > > > >
> > > > >         INIT_LIST_HEAD(&qos->flags.list);
> > > > >
> > > > > +       mutex_lock(&dev_pm_qos_mtx);
> > > > > +
> > > > > +       if (!IS_ERR_OR_NULL(dev->power.qos)) {
> > > > > +               /*
> > > > > +                * We have raced with another task to create the =
qos.
> > > > > +                * No biggie, just free the resources we've alloc=
ated
> > > > > +                * outside of dev_pm_qos_mtx and move on with lif=
e.
> > > > > +                */
> > > > > +               kfree(n);
> > > > > +               kfree(qos);
> > > > > +               goto unlock;
> > > > > +       }
> > > > > +
> > > > >         spin_lock_irq(&dev->power.lock);
> > > > >         dev->power.qos =3D qos;
> > > > >         spin_unlock_irq(&dev->power.lock);
> > > > >
> > > > > +unlock:
> > > > > +       mutex_unlock(&dev_pm_qos_mtx);
> > > > > +
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > @@ -331,17 +353,15 @@ static int __dev_pm_qos_add_request(struct =
device *dev,
> > > > >  {
> > > > >         int ret =3D 0;
> > > > >
> > > > > -       if (!dev || !req || dev_pm_qos_invalid_req_type(dev, type=
))
> > > > > +       if (!req || dev_pm_qos_invalid_req_type(dev, type))
> > > > >                 return -EINVAL;
> > > > >
> > > > >         if (WARN(dev_pm_qos_request_active(req),
> > > > >                  "%s() called for already added request\n", __fun=
c__))
> > > > >                 return -EINVAL;
> > > > >
> > > > > -       if (IS_ERR(dev->power.qos))
> > > > > +       if (IS_ERR_OR_NULL(dev->power.qos))
> > > > >                 ret =3D -ENODEV;
> > > > > -       else if (!dev->power.qos)
> > > > > -               ret =3D dev_pm_qos_constraints_allocate(dev);
> > > > >
> > > > >         trace_dev_pm_qos_add_request(dev_name(dev), type, value);
> > > > >         if (ret)
> > > > > @@ -390,6 +410,10 @@ int dev_pm_qos_add_request(struct device *de=
v, struct dev_pm_qos_request *req,
> > > > >  {
> > > > >         int ret;
> > > > >
> > > > > +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > >
> > > > It is a bit unfortunate that the mutex is dropped and then immediat=
ely
> > > > re-acquired again.  I don't think that this is strictly necessary.
> > >
> > > We could have dev_pm_qos_constraints_ensure_allocated() return with
> > > the lock held in the success case if we had to.. but that seems a bit
> > > funny looking.  And the dev_pm_qos_update_user_latency_tolerance()
> > > path would need to shuffle slightly to move the kzalloc out of the
> > > lock.
> >
> > Well, what about something like this (modulo whitespace damage by
> > GMail), attached for completeness:
> >
>
> There is one other path to handle, and some small details,

Yes, this was just an illustration of the approach.

> but I think the approach could work.. let's see..

OK
