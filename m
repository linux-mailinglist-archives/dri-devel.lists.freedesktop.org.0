Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2E63F8CC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 21:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425E888A27;
	Thu,  1 Dec 2022 20:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B15710E00F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 20:08:49 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id bn5so3156141ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rvAyrz2we2hjJpmdyVxhVn03GUPZL+2N0BOj4UW05o=;
 b=FwXAqxfQDTxo6xqyP7f7q1CiX6iIY7QorQvxT0hH7/gvRi7q1yERcIK+c6f/2VA9zm
 gVZ07BH/WcYMGuVutO71oAci8ifQZjMzYEVu6Vaf4ArbJYoFKIjCNc9ywi8pYWkyUHhy
 IuN/bxolCuprH6D1g1RRN2ALm80E8WPHud6sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rvAyrz2we2hjJpmdyVxhVn03GUPZL+2N0BOj4UW05o=;
 b=C1mHHttx8GJo1HAqBa77t7dlUUnQms/i7iN5ITe8msuC5B9YhQyVjD4yg/fc95Qd49
 lie3ZO0ySYaBeC1xAe8HFKsX/H/yL9ar0yg5JO+B4efBesEWXVhHwMFsFGBrh17JdZG/
 tOacEArQlJDkdqGwgS+YMeBQS4N+iWd3+fatPuWUvDNVKgG902prcIOLvGu2xqFlewYU
 i8+oUbFppVO2004K9HLmjAa2Xk6LXdXwnIXgOeOGDGFsrMOAeJk/h8U8/YU5w0OJ4aQX
 fRkc6FoUBIsuDaShp6ILBgptAVLXjIoivlw83mlOIE1K/s5tTV1NsYIPNKIJB9ti9n2g
 ouqg==
X-Gm-Message-State: ANoB5pmGHc04NRjj6W0mMcdjV5GhLraLAWFKuJGpt7gHY8GbGMU10NY1
 800Cq2E+0Sum9GTgAXjbuyWejo3FdAtOXb/GFPKjgAUQQGtrQrai
X-Google-Smtp-Source: AA0mqf7JbCUfEVBSucXBM+X5VCr586SrEeYGvUOmGD+03QG/7ZacmvOOfgLDuyl1HQSCkU33nxRM4CQBNiE3EJ84pC8=
X-Received: by 2002:a05:651c:906:b0:279:1349:b2e2 with SMTP id
 e6-20020a05651c090600b002791349b2e2mr20903434ljq.382.1669925327829; Thu, 01
 Dec 2022 12:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20221111194957.4046771-1-joel@joelfernandes.org>
 <B336E259-FB18-4E16-8BC7-2117614ABE4D@joelfernandes.org>
 <CAF6AEGvsmXZkw2epEE3y8hksQea0xW8TAhgitiGJY66PiQPaPA@mail.gmail.com>
In-Reply-To: <CAF6AEGvsmXZkw2epEE3y8hksQea0xW8TAhgitiGJY66PiQPaPA@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 1 Dec 2022 20:08:36 +0000
Message-ID: <CAEXW_YTTfw2yhZrCkRUMk97t7tL-Whg2K_4_jE4OWMgr-ys9qA@mail.gmail.com>
Subject: Re: [PATCH 1/2] adreno: Shutdown the GPU properly
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

On Sat, Nov 12, 2022 at 6:44 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Nov 11, 2022 at 1:08 PM Joel Fernandes <joel@joelfernandes.org> w=
rote:
> >
> >
> >
> > > On Nov 11, 2022, at 2:50 PM, Joel Fernandes (Google) <joel@joelfernan=
des.org> wrote:
> > >
> > > =EF=BB=BFDuring kexec on ARM device, we notice that device_shutdown()=
 only calls
> > > pm_runtime_force_suspend() while shutting down the GPU. This means th=
e GPU
> > > kthread is still running and further, there maybe active submits.
> > >
> > > This causes all kinds of issues during a kexec reboot:
> > >
> > > Warning from shutdown path:
> > >
> > > [  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_susp=
end+0x3c/0x44
> > > [  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> > > [  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> > > [  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
> > > [  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
> > > [  292.509905] sp : ffffffc014473bf0
> > > [...]
> > > [  292.510043] Call trace:
> > > [  292.510051]  adreno_runtime_suspend+0x3c/0x44
> > > [  292.510061]  pm_generic_runtime_suspend+0x30/0x44
> > > [  292.510071]  pm_runtime_force_suspend+0x54/0xc8
> > > [  292.510081]  adreno_shutdown+0x1c/0x28
> > > [  292.510090]  platform_shutdown+0x2c/0x38
> > > [  292.510104]  device_shutdown+0x158/0x210
> > > [  292.510119]  kernel_restart_prepare+0x40/0x4c
> > >
> > > And here from GPU kthread, an SError OOPs:
> > >
> > > [  192.648789]  el1h_64_error+0x7c/0x80
> > > [  192.648812]  el1_interrupt+0x20/0x58
> > > [  192.648833]  el1h_64_irq_handler+0x18/0x24
> > > [  192.648854]  el1h_64_irq+0x7c/0x80
> > > [  192.648873]  local_daif_inherit+0x10/0x18
> > > [  192.648900]  el1h_64_sync_handler+0x48/0xb4
> > > [  192.648921]  el1h_64_sync+0x7c/0x80
> > > [  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
> > > [  192.648968]  a6xx_hw_init+0x44/0xe38
> > > [  192.648991]  msm_gpu_hw_init+0x48/0x80
> > > [  192.649013]  msm_gpu_submit+0x5c/0x1a8
> > > [  192.649034]  msm_job_run+0xb0/0x11c
> > > [  192.649058]  drm_sched_main+0x170/0x434
> > > [  192.649086]  kthread+0x134/0x300
> > > [  192.649114]  ret_from_fork+0x10/0x20
> > >
> > > Fix by calling adreno_system_suspend() in the device_shutdown() path.
> > >
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Cc: Ricardo Ribalda <ribalda@chromium.org>
> > > Cc: Ross Zwisler <zwisler@kernel.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > ---
> > > drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
> > > 1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu=
/drm/msm/adreno/adreno_device.c
> > > index 24b489b6129a..f0cff62812c3 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -607,9 +607,12 @@ static int adreno_remove(struct platform_device =
*pdev)
> > >    return 0;
> > > }
> > >
> > > +static int adreno_system_suspend(struct device *dev);
> > > static void adreno_shutdown(struct platform_device *pdev)
> > > {
> > > -    pm_runtime_force_suspend(&pdev->dev);
> > > +    struct msm_gpu *gpu =3D dev_to_gpu(&pdev->dev);
> > > +
> >
> > This local variable definition should go to patch 2/2. Will fix in v2.
> >
> > Thanks,
> >
> >  - Joel
> >
> >
> > > +    WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
>
> I think maybe adreno_unbind() needs the same treatment?  Any path
> where we yank out the power cord without ensuring the scheduler is
> parked means we'd be racing with jobs in the scheduler queue.  Ie.
> userspace could queue a job before it is frozen, but the drm/scheduler
> kthread hasn't yet called the msm_job_run() callback (which does
> various touching of the now powered off hw).  So I think we need to
> ensure that the scheduler is parked in all paths that call
> pm_runtime_force_suspend() (as that bypasses the runpm reference that
> would otherwise unsure the hw is powered before msm_job_run pokes at
> registers)

a6xx_gmu_remove() calls pm_runtime_force_suspend() , would that need a
treatment too?

Though, adreno_system_suspend() is a static function in adreno_device.cc

Thanks.
