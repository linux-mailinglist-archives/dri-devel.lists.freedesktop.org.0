Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E24DC99E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3616210E7BF;
	Thu, 17 Mar 2022 15:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F88210E789;
 Thu, 17 Mar 2022 15:10:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d7so7785031wrb.7;
 Thu, 17 Mar 2022 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xd1I1jaOVhvAcR6vHw7kkzUfWncYai5tD7e0XVSca6g=;
 b=Ek55yHKFJhKiBY0RJxOjQb8P//I2US4VCkgJqkC2M4HuBchLBe//aAGH1H1lHQ+BTH
 C5qv7sw3uS026m4EdLToha6mj6PIfyRoKvI4IVYTbSYPw3rlXCzwZAfro53E121CE59H
 1MaJpf+VjTZO/IEo7BSIaqfeXjiju8Upldpq1nCr5gQkdGX0+WuoQHDopI01EwM5G3Oe
 JAo2op1qd30PRQgAGe7u2tmwTl0siSFPM0y0izAm+gwOkXO7YiFK2K3b4dXDjcHP3RV4
 3A+9oyCI00EVBE+dDq2AYK4N/QLr0DQ9zSW4lNfc5TUOo5gUD5KBts8HFdkay2p98tZ1
 8IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xd1I1jaOVhvAcR6vHw7kkzUfWncYai5tD7e0XVSca6g=;
 b=Kdm/6za+//QIHGorl1EUAV+A3hOugsxC9PQ0eQ+MtifBnT/bEQX+acNN/IQVBuF8it
 zlppYQsCld5xs5Pg08gnRJbIjmW/cYcD9wxsPLm78n03xqN8jz3fjp4TPRyV1kn8bSYW
 8ujVAeHCvtlAPqsn2ThEYue8nAnSKaQnSvxLXuKgJigAtqFw+zbdg4PJq+fudvrfoEgT
 Ju5KJ6GkiqOahhooWpEj11uf2tCJAcQXDL/OwZSDb/Y32nd+qq9xaib1bzh+iFYwn3Ce
 t//mDby7tb5FMjO4f8JpL79UoRoTOmG8ARb9/TV3RdJ3S0Qr7QefbDIsWgNTSrWNClq9
 a+tw==
X-Gm-Message-State: AOAM531q9mDs9sIw2uIKewLNnTHlng6UX4Lh4YBmKPPLW5IJHggE2xGO
 HTneO2quuqa/IarJ/FaHDAmoShmJqUisEmFy35M=
X-Google-Smtp-Source: ABdhPJx/+OGZy/GONTI2VpT4DsS4zAwTerZUy7fUgcFu8OS87j3P2i+ZFRW+iMdtfays2J6Gyr627uCkQ5RJvaZ6fQo=
X-Received: by 2002:adf:dd4d:0:b0:203:f178:b78b with SMTP id
 u13-20020adfdd4d000000b00203f178b78bmr1048798wrm.93.1647529812714; Thu, 17
 Mar 2022 08:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
In-Reply-To: <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 08:10:52 -0700
Message-ID: <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 3:06 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.03.22 um 10:59 schrieb Daniel Vetter:
> > On Thu, Mar 10, 2022 at 03:46:05PM -0800, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> In the system suspend path, we don't want to be racing with the
> >> scheduler kthreads pushing additional queued up jobs to the hw
> >> queue (ringbuffer).  So park them first.  While we are at it,
> >> move the wait for active jobs to complete into the new system-
> >> suspend path.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/adreno_device.c | 68 ++++++++++++++++++++=
--
> >>   1 file changed, 64 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/=
drm/msm/adreno/adreno_device.c
> >> index 8859834b51b8..0440a98988fc 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -619,22 +619,82 @@ static int active_submits(struct msm_gpu *gpu)
> >>   static int adreno_runtime_suspend(struct device *dev)
> >>   {
> >>      struct msm_gpu *gpu =3D dev_to_gpu(dev);
> >> -    int remaining;
> >> +
> >> +    /*
> >> +     * We should be holding a runpm ref, which will prevent
> >> +     * runtime suspend.  In the system suspend path, we've
> >> +     * already waited for active jobs to complete.
> >> +     */
> >> +    WARN_ON_ONCE(gpu->active_submits);
> >> +
> >> +    return gpu->funcs->pm_suspend(gpu);
> >> +}
> >> +
> >> +static void suspend_scheduler(struct msm_gpu *gpu)
> >> +{
> >> +    int i;
> >> +
> >> +    /*
> >> +     * Shut down the scheduler before we force suspend, so that
> >> +     * suspend isn't racing with scheduler kthread feeding us
> >> +     * more work.
> >> +     *
> >> +     * Note, we just want to park the thread, and let any jobs
> >> +     * that are already on the hw queue complete normally, as
> >> +     * opposed to the drm_sched_stop() path used for handling
> >> +     * faulting/timed-out jobs.  We can't really cancel any jobs
> >> +     * already on the hw queue without racing with the GPU.
> >> +     */
> >> +    for (i =3D 0; i < gpu->nr_rings; i++) {
> >> +            struct drm_gpu_scheduler *sched =3D &gpu->rb[i]->sched;
> >> +            kthread_park(sched->thread);
> > Shouldn't we have some proper interfaces for this?
>
> If I'm not completely mistaken we already should have one, yes.

drm_sched_stop() was my first thought, but it carries extra baggage.
Really I *just* want to park the kthread.

Note that amdgpu does (for afaict different reasons) park the kthread
directly as well.

> > Also I'm kinda wondering how other drivers do this, feels like we shoul=
d have a standard
> > way.

As far as other drivers, it seems like they largely ignore it.  I
suspect other drivers also have problems in this area.

Fwiw, I have a piglit test to try to exercise this path if you want to
try it on other drivers.. might need some futzing around to make sure
enough work is queued up that there is some on hw ring and some queued
up in the scheduler when you try to suspend.

https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/643

> >
> > Finally not flushing out all in-flight requests sounds a bit like a bad
> > idea for system suspend/resume since that's also the hibernation path, =
and
> > that would mean your shrinker/page reclaim stops working. At least in f=
ull
> > generality. Which ain't good for hibernation.
>
> Completely agree, that looks like an incorrect workaround to me.
>
> During suspend all userspace applications should be frozen and all f
> their hardware activity flushed out and waited for completion.
>
> I do remember that our internal guys came up with pretty much the same
> idea and it sounded broken to me back then as well.

userspace frozen !=3D kthread frozen .. that is what this patch is
trying to address, so we aren't racing between shutting down the hw
and the scheduler shoveling more jobs at us.

BR,
-R

> Regards,
> Christian.
>
> >
> > Adding Christian and Andrey.
> > -Daniel
> >
> >> +    }
> >> +}
> >> +
> >> +static void resume_scheduler(struct msm_gpu *gpu)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i =3D 0; i < gpu->nr_rings; i++) {
> >> +            struct drm_gpu_scheduler *sched =3D &gpu->rb[i]->sched;
> >> +            kthread_unpark(sched->thread);
> >> +    }
> >> +}
> >> +
> >> +static int adreno_system_suspend(struct device *dev)
> >> +{
> >> +    struct msm_gpu *gpu =3D dev_to_gpu(dev);
> >> +    int remaining, ret;
> >> +
> >> +    suspend_scheduler(gpu);
> >>
> >>      remaining =3D wait_event_timeout(gpu->retire_event,
> >>                                     active_submits(gpu) =3D=3D 0,
> >>                                     msecs_to_jiffies(1000));
> >>      if (remaining =3D=3D 0) {
> >>              dev_err(dev, "Timeout waiting for GPU to suspend\n");
> >> -            return -EBUSY;
> >> +            ret =3D -EBUSY;
> >> +            goto out;
> >>      }
> >>
> >> -    return gpu->funcs->pm_suspend(gpu);
> >> +    ret =3D pm_runtime_force_suspend(dev);
> >> +out:
> >> +    if (ret)
> >> +            resume_scheduler(gpu);
> >> +
> >> +    return ret;
> >>   }
> >> +
> >> +static int adreno_system_resume(struct device *dev)
> >> +{
> >> +    resume_scheduler(dev_to_gpu(dev));
> >> +    return pm_runtime_force_resume(dev);
> >> +}
> >> +
> >>   #endif
> >>
> >>   static const struct dev_pm_ops adreno_pm_ops =3D {
> >> -    SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_forc=
e_resume)
> >> +    SET_SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resu=
me)
> >>      SET_RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume,=
 NULL)
> >>   };
> >>
> >> --
> >> 2.35.1
> >>
>
