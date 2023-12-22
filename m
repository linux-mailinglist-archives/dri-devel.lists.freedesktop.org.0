Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2E81CF36
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 21:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB5510E636;
	Fri, 22 Dec 2023 20:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8A410E00F;
 Fri, 22 Dec 2023 20:15:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cb21afa6c1so29723671fa.0; 
 Fri, 22 Dec 2023 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703276146; x=1703880946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ygL4Wx9Bl2DM0Q4f0AKktDrprui5Ry1y7UrcnazkqU=;
 b=mM7+WHwXsXaOtO0D4wPHBnxexy5GemktWjg5/YOUgQaj1XEYLA7sNT48dWLgjaoJ9Q
 jz4YOQ4Yt1QU2g3bsIv8kxvajngTll0xpUwItAJk6WmoCf1kMH0qwMQFU+N+IXZQi4SW
 i01+qFqPKzW8MFzzLrh6siRsbAJS7hxDhQrNb4XQtnM7DNmm1w/3U+oXUDcxyj/PvIQ6
 ORrZgshqjzyxXtNw65vwk7dEAUcsGSghlKgQy4o+jtXeNoC+NLxzoO7eI+Kr5fXN04XC
 HbPjw34aP2Aj8SCQkHICf7X/OyTO4/bnia9mdpj6yBV9bhHIh0/cSaYrlYxarInobzVI
 URPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703276146; x=1703880946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ygL4Wx9Bl2DM0Q4f0AKktDrprui5Ry1y7UrcnazkqU=;
 b=PrQvXjEdEFmeALbPA1Jtl3ryz4B+GKWx5db3XXFidm44dCXz9cTLUiLonQuf+NAMTR
 SLoHFDY+toGayRTjgfAF/8UxGRNsZXeDbzlDFpCd9HgoyH43enexi0gV72WaYTbUuseu
 Ix48IZX3m/WlPKX5bLn2+n0zN18/OhOCkkSLRrPCfYzxdgOn5aV3HApPGMhRN6Skv2mC
 oJLloItr0w8mfWwT5kmn8wS1A07bhwpNZU7lcevVvmvwsMiGwcmV0g9ae1YfjVxgmlrY
 DisgOc/Q/qdR2iTXD0KsvrcfR/ENMjKo35Ll3zugBGvKVaCE/xKj5vRqlH9z3Vn1h5/L
 OUhQ==
X-Gm-Message-State: AOJu0YzZ2pU6rWX7QO1XW+sp1JriJnkGXdU9QGe3/iSHMyli0NrCXEBk
 rzn1Cu/BcHE3iNJKWO5hRNhYOuwHbXj4GTuYAC0=
X-Google-Smtp-Source: AGHT+IHFARuWO9e6tsxeCHbimi5W/lhmlrVdA5FVHtIP1NdBW8nVW3leta3TW5QGKMmBSt38nVtMR7Vr8vsyqbpDmlU=
X-Received: by 2002:a05:651c:102f:b0:2cc:6efe:6f3d with SMTP id
 w15-20020a05651c102f00b002cc6efe6f3dmr907916ljm.43.1703276146242; Fri, 22 Dec
 2023 12:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20231218155927.368881-1-robdclark@gmail.com>
 <k5yte4b36j23p3pfqmflhpkfesyiwoczi3avs2vavvzb3i2oct@zhssj7u5a6og>
In-Reply-To: <k5yte4b36j23p3pfqmflhpkfesyiwoczi3avs2vavvzb3i2oct@zhssj7u5a6og>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Dec 2023 12:15:34 -0800
Message-ID: <CAF6AEGvGwXU5Qf-bgPfoiwDf9AdFSUERger_gk-pogOo4=hWSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix recovery vs runpm race
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 David Heidelberg <david.heidelberg@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 11:58=E2=80=AFAM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On Mon, Dec 18, 2023 at 07:59:24AM -0800, Rob Clark wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > a6xx_recover() is relying on the gpu lock to serialize against incoming
> > submits doing a runpm get, as it tries to temporarily balance out the
> > runpm gets with puts in order to power off the GPU.  Unfortunately this
> > gets worse when we (in a later patch) will move the runpm get out of th=
e
> > scheduler thread/work to move it out of the fence signaling path.
> >
> > Instead we can just simplify the whole thing by using force_suspend() /
> > force_resume() instead of trying to be clever.
>
> At some places, we take a pm_runtime vote and access the gpu
> registers assuming it will be powered until we drop the vote.  a6xx_get_t=
imestamp()
> is an example. If we do a force suspend, it may cause bus errors from
> those threads. Now you have to serialize every place we do runtime_get/pu=
t with a
> mutex. Or is there a better way to handle the 'later patch' you
> mentioned?

So I was running into issues, when I started adding an igt test to
stress test recovery vs multi-threaded submit, with cxpd not always
suspending and getting "cx gdsc did not collapse", which may be
related.

I was considering using force_suspend() on the gmu and cxpd if
gpu->hang=3D=3Dtrue, I'm not sure.  I ran out of time to play with this
when I was in the office.

The issue the 'later patch' is trying to deal with is getting memory
allocations out of the "fence signaling path", ie. out from the
drm/sched kthread/worker.  One way to do that, without dragging all of
runpm/device-link/etc into it is to do the runpm get in the submit
ioctl before enqueuing the job to the scheduler.  But then we can hold
a lock to protect against racing with recovery.

BR,
-R

> -Akhil.
>
> >
> > Reported-by: David Heidelberg <david.heidelberg@collabora.com>
> > Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10272
> > Fixes: abe2023b4cea ("drm/msm/gpu: Push gpu lock down past runpm")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 268737e59131..a5660d63535b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1244,12 +1244,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
> >       dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
> >       dev_pm_genpd_synced_poweroff(gmu->cxpd);
> >
> > -     /* Drop the rpm refcount from active submits */
> > -     if (active_submits)
> > -             pm_runtime_put(&gpu->pdev->dev);
> > -
> > -     /* And the final one from recover worker */
> > -     pm_runtime_put_sync(&gpu->pdev->dev);
> > +     pm_runtime_force_suspend(&gpu->pdev->dev);
> >
> >       if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(=
1000)))
> >               DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n=
");
> > @@ -1258,10 +1253,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
> >
> >       pm_runtime_use_autosuspend(&gpu->pdev->dev);
> >
> > -     if (active_submits)
> > -             pm_runtime_get(&gpu->pdev->dev);
> > -
> > -     pm_runtime_get_sync(&gpu->pdev->dev);
> > +     pm_runtime_force_resume(&gpu->pdev->dev);
> >
> >       gpu->active_submits =3D active_submits;
> >       mutex_unlock(&gpu->active_lock);
> > --
> > 2.43.0
> >
