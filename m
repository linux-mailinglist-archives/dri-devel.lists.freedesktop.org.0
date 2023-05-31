Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA47179D4
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4835710E1B7;
	Wed, 31 May 2023 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608910E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 08:19:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA97B62B31;
 Wed, 31 May 2023 08:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C410FC433D2;
 Wed, 31 May 2023 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685521160;
 bh=0HCQtl+r90qoo8vag/j4fmBsYtYN/bLTT76larf8Zh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AXU+m6wUmO04i+P8FRRsQWmSDFaUGpTI8wLkyT496Wm6nPchKPS5Wa32z/mjLweic
 LWBL1gR289uyb9YbVtDBEkogCpNM0xV+41uYlwQcUZml2zZjU7TNN2Q7j0SuMyU8wQ
 Sd4SrG/Q/EiVAVthWxdfFO1WNbCwjVpFgJIatnMPfQ3eTnxALJvX2R4t2nQyqQgSW+
 nNH8cpv+2hFu510vTfmm+eK2ZohnviIo2+A1Rpo36HH6G4Ar2zlBugpwHHT/FlONa4
 vZvIG/2bebOosP2ljYuo+8dAk64rnFCLL7Ns5rU0blWMFDu9vwY4RXQGTDCCFoFKGc
 S192en2LAOZEQ==
Date: Wed, 31 May 2023 10:19:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: lm0963 <lm0963hack@gmail.com>
Subject: Re: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Message-ID: <20230531081917.grx3qqqm7usaqoa5@intel.intel>
References: <20230526130131.16521-1-lm0963hack@gmail.com>
 <20230530222150.24oogloda6wtvpvm@intel.intel>
 <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
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

> > > If it is async, runqueue_node is freed in g2d_runqueue_worker on another
> > > worker thread. So in extreme cases, if g2d_runqueue_worker runs first, and
> > > then executes the following if statement, there will be use-after-free.
> > >
> > > Signed-off-by: Min Li <lm0963hack@gmail.com>
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > index ec784e58da5c..414e585ec7dd 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > > @@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
> > >       /* Let the runqueue know that there is work to do. */
> > >       queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> > >
> > > -     if (runqueue_node->async)
> > > +     if (req->async)
> >
> > did you actually hit this? If you did, then the fix is not OK.
> 
> No, I didn't actually hit this. I found it through code review. This
> is only a theoretical issue that can only be triggered in extreme
> cases.

first of all runqueue is used again two lines below this, which
means that if you don't hit the uaf here you will hit it
immediately after.

Second, if runqueue is freed, than we need to remove the part
where it's freed because it doesn't make sense to free runqueue
at this stage.

Finally, can you elaborate on the code review that you did so
that we all understand it?

Andi
