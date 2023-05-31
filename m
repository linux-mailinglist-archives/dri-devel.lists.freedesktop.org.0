Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11B717F82
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3B10E0BE;
	Wed, 31 May 2023 12:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A1410E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:05:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B32A628FE;
 Wed, 31 May 2023 12:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FB0C433EF;
 Wed, 31 May 2023 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685534734;
 bh=hiP3hANCfLtuDbbmwGCMplIx6+2peQpDiyNeqRnML+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O7b4MhqL3hr/VMDYGhPvcUH2Fm9O3XqBiopsX+faEUK8/bXrq4fdXBfuOotXIOMxl
 4/sLGBr/8HEV8KNJvNumIBxwNhGd0t3gd0NTZBdhgvy+937e7rt2A5kg7x08alkt+z
 HWY78DOpz23IpOfvtYBgZpelkpj7k3hyMkjkIzrjv3e4e8HkMJwGGEX/vDPZfWzLxZ
 WHE06+2UIWWA6t1my732z+3nWqno3rbHc001rpBBvC5z3g6OExsYbWMm3G5i1sZ4EQ
 U72/UWykHao6EKyuM346UKEy2ZCBzXPhurvPil3Ty06RfnAG6BPIwjBEHHaY3ldtsD
 JtGx1VaOLLinA==
Date: Wed, 31 May 2023 14:05:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: lm0963 <lm0963hack@gmail.com>
Subject: Re: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Message-ID: <20230531120531.dynd3iyggauucly7@intel.intel>
References: <20230526130131.16521-1-lm0963hack@gmail.com>
 <20230530222150.24oogloda6wtvpvm@intel.intel>
 <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
 <20230531081917.grx3qqqm7usaqoa5@intel.intel>
 <CAAgLYK4KzuKMTkBwzCJj4wa+W+=9fR+A1J=XR-n1E-W7EjexuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgLYK4KzuKMTkBwzCJj4wa+W+=9fR+A1J=XR-n1E-W7EjexuA@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Min,

On Wed, May 31, 2023 at 06:54:34PM +0800, lm0963 wrote:
> Hi Andi,
> 
> On Wed, May 31, 2023 at 4:19 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Min,
> >
> > > > > If it is async, runqueue_node is freed in g2d_runqueue_worker on another
> > > > > worker thread. So in extreme cases, if g2d_runqueue_worker runs first, and
> > > > > then executes the following if statement, there will be use-after-free.
> > > > >
> > > > > Signed-off-by: Min Li <lm0963hack@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > > index ec784e58da5c..414e585ec7dd 100644
> > > > > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > > > @@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
> > > > >       /* Let the runqueue know that there is work to do. */
> > > > >       queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> > > > >
> > > > > -     if (runqueue_node->async)
> > > > > +     if (req->async)
> > > >
> > > > did you actually hit this? If you did, then the fix is not OK.
> > >
> > > No, I didn't actually hit this. I found it through code review. This
> > > is only a theoretical issue that can only be triggered in extreme
> > > cases.
> >
> > first of all runqueue is used again two lines below this, which
> > means that if you don't hit the uaf here you will hit it
> > immediately after.
> 
> No, if async is true, then it will goto out, which will directly return.
> 
> if (runqueue_node->async)
>     goto out;   // here, go to out, will directly return
> 
> wait_for_completion(&runqueue_node->complete);      // not hit
> g2d_free_runqueue_node(g2d, runqueue_node);
> 
> out:
> return 0;

that's right, sorry, I misread it.

> > Second, if runqueue is freed, than we need to remove the part
> > where it's freed because it doesn't make sense to free runqueue
> > at this stage.
> 
> It is freed by g2d_free_runqueue_node in g2d_runqueue_worker
> 
> static void g2d_runqueue_worker(struct work_struct *work)
> {
>     ......
>     if (runqueue_node) {
>         pm_runtime_mark_last_busy(g2d->dev);
>         pm_runtime_put_autosuspend(g2d->dev);
> 
>         complete(&runqueue_node->complete);
>         if (runqueue_node->async)
>             g2d_free_runqueue_node(g2d, runqueue_node);        // freed here

this is what I'm wondering: is it correct to free a resource
here? The design looks to me a bit fragile and prone to mistakes.

The patch per se is OK. It doesn't make much difference to me
where you actually read async, although this patch looks a bit
safer:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

However some refactoring might be needed to make it a bit more
robust.

Thanks,
Andi

>     }
> 
> >
> > Finally, can you elaborate on the code review that you did so
> > that we all understand it?
> 
> queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> msleep(100);        // add sleep here to let g2d_runqueue_worker run first
> if (runqueue_node->async)
>     goto out;
> 
> 
> >
> > Andi
> 
> 
> 
> --
> Min Li
