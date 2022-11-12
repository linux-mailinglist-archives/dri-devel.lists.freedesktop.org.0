Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2923E626B18
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 19:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2894710E1D6;
	Sat, 12 Nov 2022 18:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EBF10E1D6;
 Sat, 12 Nov 2022 18:44:13 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-13ae8117023so8611998fac.9; 
 Sat, 12 Nov 2022 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RW2ierpmO9Ob9gBGCgFgoR5MnOmGKRHEK26wUjbjR4A=;
 b=GCOaqdr4YOF0FX/9QEEFwpEW0tOXrQcDyze2xaDGpwIzqDuQbOC/dX+y+Yc8zz1Xmw
 hb2z3xqDXKT2Sg2chXVIo8rgQLtWi/5iGHeUydXd8DWV/IY/eaIACoM3kF7gppmR944z
 Nq3glLGU1AffkDUlsOgg4B5YtDqNtesEhGQXvUlzfj3BH7ptOujETRIFXeMxN/uuRVn/
 tUil3PE7NlXPqXwHUOHEzCgeakanqIPT0hr7NYguCypMMRnzawy/NDadT5yBNBcfzW8R
 wHjRDt0k87kdZs1sOaaak8tzxu9+pZ4Ax4UiDTjzZBr+/d4G/gUK6ZX6zEpNexpfWh6Y
 7yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RW2ierpmO9Ob9gBGCgFgoR5MnOmGKRHEK26wUjbjR4A=;
 b=KKLx57rm6uPpXrZV+xTLAXeNq///B4K44xOtQQmMd7XNNlJM7xYuMjFVaO1ubeg+Ve
 /gdaIZFhfJAJTr6XSTpleqEtVom25as4430qJytRmiBMUOAeSvAEnUT1WkFZIuvwj6v+
 IJgg20PSoG+aMg/AorkpiR/l1NakhaDUd4zw297Vo0T+2zSOpjQeXnsBF8QawZeCLAL8
 cBogGUEOeSXo4rz0MqbNg5d/OzOmw7NEeeXS0FqUAS+x+4+CK79sZf9QbrUCSaaLNITa
 +m4mLI1L7FDStDz6OENgxnYSqP3JCGhq2j+WvxiHJF1UafauT920jij5u0sGoTvpyNYV
 frKg==
X-Gm-Message-State: ANoB5pnYstASOoG62u6VlaO3Bh+xZjWuDJTqPyciuscMUsxduPGAtqOX
 zJbwS3mY3WljrzR5Go3hnvNGy9PB8GBDcd7GCmg=
X-Google-Smtp-Source: AA0mqf4kaFqXtJ+RO4j7D+L1kwF4/PLgS1JnevXdJ1cEwhQKGJm/s6jrSY7XjKorOAs03anRZVUAIivVVjk+JpiIeBY=
X-Received: by 2002:a05:6870:1f15:b0:131:f559:461b with SMTP id
 pd21-20020a0568701f1500b00131f559461bmr3779869oab.38.1668278653159; Sat, 12
 Nov 2022 10:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20221111194957.4046771-1-joel@joelfernandes.org>
 <B336E259-FB18-4E16-8BC7-2117614ABE4D@joelfernandes.org>
In-Reply-To: <B336E259-FB18-4E16-8BC7-2117614ABE4D@joelfernandes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 12 Nov 2022 10:44:33 -0800
Message-ID: <CAF6AEGvsmXZkw2epEE3y8hksQea0xW8TAhgitiGJY66PiQPaPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] adreno: Shutdown the GPU properly
To: Joel Fernandes <joel@joelfernandes.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 1:08 PM Joel Fernandes <joel@joelfernandes.org> wro=
te:
>
>
>
> > On Nov 11, 2022, at 2:50 PM, Joel Fernandes (Google) <joel@joelfernande=
s.org> wrote:
> >
> > =EF=BB=BFDuring kexec on ARM device, we notice that device_shutdown() o=
nly calls
> > pm_runtime_force_suspend() while shutting down the GPU. This means the =
GPU
> > kthread is still running and further, there maybe active submits.
> >
> > This causes all kinds of issues during a kexec reboot:
> >
> > Warning from shutdown path:
> >
> > [  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_suspen=
d+0x3c/0x44
> > [  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> > [  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
> > [  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
> > [  292.509905] sp : ffffffc014473bf0
> > [...]
> > [  292.510043] Call trace:
> > [  292.510051]  adreno_runtime_suspend+0x3c/0x44
> > [  292.510061]  pm_generic_runtime_suspend+0x30/0x44
> > [  292.510071]  pm_runtime_force_suspend+0x54/0xc8
> > [  292.510081]  adreno_shutdown+0x1c/0x28
> > [  292.510090]  platform_shutdown+0x2c/0x38
> > [  292.510104]  device_shutdown+0x158/0x210
> > [  292.510119]  kernel_restart_prepare+0x40/0x4c
> >
> > And here from GPU kthread, an SError OOPs:
> >
> > [  192.648789]  el1h_64_error+0x7c/0x80
> > [  192.648812]  el1_interrupt+0x20/0x58
> > [  192.648833]  el1h_64_irq_handler+0x18/0x24
> > [  192.648854]  el1h_64_irq+0x7c/0x80
> > [  192.648873]  local_daif_inherit+0x10/0x18
> > [  192.648900]  el1h_64_sync_handler+0x48/0xb4
> > [  192.648921]  el1h_64_sync+0x7c/0x80
> > [  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
> > [  192.648968]  a6xx_hw_init+0x44/0xe38
> > [  192.648991]  msm_gpu_hw_init+0x48/0x80
> > [  192.649013]  msm_gpu_submit+0x5c/0x1a8
> > [  192.649034]  msm_job_run+0xb0/0x11c
> > [  192.649058]  drm_sched_main+0x170/0x434
> > [  192.649086]  kthread+0x134/0x300
> > [  192.649114]  ret_from_fork+0x10/0x20
> >
> > Fix by calling adreno_system_suspend() in the device_shutdown() path.
> >
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ricardo Ribalda <ribalda@chromium.org>
> > Cc: Ross Zwisler <zwisler@kernel.org>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> > drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 24b489b6129a..f0cff62812c3 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -607,9 +607,12 @@ static int adreno_remove(struct platform_device *p=
dev)
> >    return 0;
> > }
> >
> > +static int adreno_system_suspend(struct device *dev);
> > static void adreno_shutdown(struct platform_device *pdev)
> > {
> > -    pm_runtime_force_suspend(&pdev->dev);
> > +    struct msm_gpu *gpu =3D dev_to_gpu(&pdev->dev);
> > +
>
> This local variable definition should go to patch 2/2. Will fix in v2.
>
> Thanks,
>
>  - Joel
>
>
> > +    WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));

I think maybe adreno_unbind() needs the same treatment?  Any path
where we yank out the power cord without ensuring the scheduler is
parked means we'd be racing with jobs in the scheduler queue.  Ie.
userspace could queue a job before it is frozen, but the drm/scheduler
kthread hasn't yet called the msm_job_run() callback (which does
various touching of the now powered off hw).  So I think we need to
ensure that the scheduler is parked in all paths that call
pm_runtime_force_suspend() (as that bypasses the runpm reference that
would otherwise unsure the hw is powered before msm_job_run pokes at
registers)

BR,
-R

> > }
> >
> > static const struct of_device_id dt_match[] =3D {
> > --
> > 2.38.1.493.g58b659f92b-goog
> >
