Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27E719593
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 10:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F356910E21A;
	Thu,  1 Jun 2023 08:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED87210E21A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 08:29:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C75A463928;
 Thu,  1 Jun 2023 08:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBACFC433D2;
 Thu,  1 Jun 2023 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685608171;
 bh=K2Tqhq3A7MhIloDIiTA3oZim6gs0AvBZw9GEwz95QhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOFIFlhenGHiK0R8E9Ij0OM7qK8Otbc1gk+GH7InjGo8vgQSCmx5FQjpxEP3mKDGL
 KM8xV30JEHprgMbf4rLOcJ3PXjTyhO+8RBna6FssJx6YIV2ilwwNcaGu/ZxWEwStQI
 kijUbSQzaLXmPkRYgOwkFtcvUDmfYsoINZ6mZYJOuS3Dq+mgiGdpoWWFEatz8ao7tw
 IiNuRFVn1BUlBGT+PKHNl9qmBtlQ/nr7V6hXYDPWmTy4s2CFHF3+ve84DlESyzKk4S
 pcYxiDpnn7cmXEvyg9IYwOVM1dYOyOBJXrto3C/T5nPIbXMxo4TMT9suRxReBocoLi
 CjXQO1B3DZxXg==
Date: Thu, 1 Jun 2023 10:29:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Message-ID: <20230601082928.4mk7hfi5hunaxm4y@intel.intel>
References: <20230526130131.16521-1-lm0963hack@gmail.com>
 <20230530222150.24oogloda6wtvpvm@intel.intel>
 <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
 <20230531081917.grx3qqqm7usaqoa5@intel.intel>
 <CAAgLYK4KzuKMTkBwzCJj4wa+W+=9fR+A1J=XR-n1E-W7EjexuA@mail.gmail.com>
 <CGME20230531120656epcas1p1df61dae784f4b6833b39c43da697be08@epcas1p1.samsung.com>
 <20230531120531.dynd3iyggauucly7@intel.intel>
 <007001d99413$0f08ba60$2d1a2f20$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007001d99413$0f08ba60$2d1a2f20$@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, 'lm0963' <lm0963hack@gmail.com>,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

> > > > > > > If it is async, runqueue_node is freed in g2d_runqueue_worker on
> > another
> > > > > > > worker thread. So in extreme cases, if g2d_runqueue_worker runs
> > first, and
> > > > > > > then executes the following if statement, there will be use-
> > after-free.
> > > > > > >
> > > > > > > Signed-off-by: Min Li <lm0963hack@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > > > > index ec784e58da5c..414e585ec7dd 100644
> > > > > > > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > > > > @@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct
> > drm_device *drm_dev, void *data,
> > > > > > >       /* Let the runqueue know that there is work to do. */
> > > > > > >       queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> > > > > > >
> > > > > > > -     if (runqueue_node->async)
> > > > > > > +     if (req->async)
> > > > > >
> > > > > > did you actually hit this? If you did, then the fix is not OK.
> > > > >
> > > > > No, I didn't actually hit this. I found it through code review. This
> > > > > is only a theoretical issue that can only be triggered in extreme
> > > > > cases.
> > > >
> > > > first of all runqueue is used again two lines below this, which
> > > > means that if you don't hit the uaf here you will hit it
> > > > immediately after.
> > >
> > > No, if async is true, then it will goto out, which will directly return.
> > >
> > > if (runqueue_node->async)
> > >     goto out;   // here, go to out, will directly return
> > >
> > > wait_for_completion(&runqueue_node->complete);      // not hit
> > > g2d_free_runqueue_node(g2d, runqueue_node);
> > >
> > > out:
> > > return 0;
> > 
> > that's right, sorry, I misread it.
> > 
> > > > Second, if runqueue is freed, than we need to remove the part
> > > > where it's freed because it doesn't make sense to free runqueue
> > > > at this stage.
> > >
> > > It is freed by g2d_free_runqueue_node in g2d_runqueue_worker
> > >
> > > static void g2d_runqueue_worker(struct work_struct *work)
> > > {
> > >     ......
> > >     if (runqueue_node) {
> > >         pm_runtime_mark_last_busy(g2d->dev);
> > >         pm_runtime_put_autosuspend(g2d->dev);
> > >
> > >         complete(&runqueue_node->complete);
> > >         if (runqueue_node->async)
> > >             g2d_free_runqueue_node(g2d, runqueue_node);        // freed here
> > 
> > this is what I'm wondering: is it correct to free a resource
> > here? The design looks to me a bit fragile and prone to mistakes.
> 
> This question seems to deviate from the purpose of this patch. If you are providing additional opinions for code quality improvement unrelated to this patch, it would be more appropriate for me to answer instead of him.

It's not deviating as the question was already made in my first
review. It just looks strange to me that a piece of data shared
amongst processes can be freed up without sinchronizing. A bunch
of if's do not make it robust enough.

The patch itself, in my point of view, is not really fixing much
and won't make any difference, it's just exposing the weakness I
mentioned.

However, honestly speaking, I don't know the driver well enough
to suggest architectural changes and that's why I r-b'ed this
one. But the first thing that comes to my mind, without looking
much at the code, is using kref's as a way to make sure that a
resource doesn't magically disappear under your nose.

But, of course, this is up to you and if in your opinion this is
OK and it fixes it... then you definitely know better :)

Thanks for this discussion,
Andi

> The runqueue node - which contains command list for g2d rendering - is generated when the user calls the ioctl system call. Therefore, if the user-requested command list is rendered by g2d device then there is no longer a reason to keep it. :)
> 
> > 
> > The patch per se is OK. It doesn't make much difference to me
> > where you actually read async, although this patch looks a bit
> > safer:
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> Thanks,
> Inki Dae
> 
> > 
> > However some refactoring might be needed to make it a bit more
> > robust.
> > 
> > Thanks,
> > Andi
> > 
> > >     }
> > >
> > > >
> > > > Finally, can you elaborate on the code review that you did so
> > > > that we all understand it?
> > >
> > > queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> > > msleep(100);        // add sleep here to let g2d_runqueue_worker run first
> > > if (runqueue_node->async)
> > >     goto out;
> > >
> > >
> > > >
> > > > Andi
> > >
> > >
> > >
> > > --
> > > Min Li
> 
> 
