Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5D73BB30
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A95310E652;
	Fri, 23 Jun 2023 15:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759C10E652
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:11:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38736838;
 Fri, 23 Jun 2023 17:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687533034;
 bh=r2qcI7W+t2jNWs5Sze0keM1XEI+oLa6CULoKu3QaqWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USDfXKQBwz/QjIU3e3ZKpZROJGOC5AmjSmgfr/E9Eis84Hn0xQMkfj0IaWf6ru8mp
 /hKWgGvzBqZzN5Rj0+H6nxQgQbnztMVKhdPworexB7htpfAcF1baVkzgbsPqiYBsOx
 iAJNHZoREDJlv8Q+yMtyzN42Rvq4zd/tpzTmWO88=
Date: Fri, 23 Jun 2023 18:11:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 06/39] drm: renesas: shmobile: Add support for Runtime PM
Message-ID: <20230623151109.GL2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <742b3351c1aed1f546ac2dcc1de15e0d04cc24d4.1687423204.git.geert+renesas@glider.be>
 <20230623150742.GK2112@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230623150742.GK2112@pendragon.ideasonboard.com>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 06:07:44PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Thu, Jun 22, 2023 at 11:21:18AM +0200, Geert Uytterhoeven wrote:
> > The SH-Mobile LCD Controller is part of a PM Domain on all relevant SoCs
> > (clock domain on all, power domain on some).  Hence it may not be
> > sufficient to manage the LCDC module clock explicitly (e.g. if the
> > selected clock source differs from SHMOB_DRM_CLK_BUS).
> > 
> > Fix this by using Runtime PM instead.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 11 ++++++++++-
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  5 +++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > index fbfd906844da490c..84dbf35025d7be63 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/backlight.h>
> >  #include <linux/clk.h>
> > +#include <linux/pm_runtime.h>
> >  
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_crtc_helper.h>
> > @@ -170,10 +171,16 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
> >  	if (WARN_ON(format == NULL))
> >  		return;
> >  
> > +	ret = pm_runtime_resume_and_get(sdev->dev);
> > +	if (ret)
> > +		return;
> > +
> >  	/* Enable clocks before accessing the hardware. */
> >  	ret = shmob_drm_clk_on(sdev);
> 
> This would be best located in the runtime PM resume handler. Same for
> disabling clocks in the runtime PM suspend handler.

The driver should then depend on CONFIG_PM. There's no indirect
dependency through CONFIG_DRM as far as I can tell, but there's one
through ARCH_SHMOBILE. This then got me puzzled, as ARCH_SHMOBILE is
defined in arch/sh/Kconfig, and this driver depends on ARM. Am I missing
something ?

> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		pm_runtime_put(sdev->dev);
> >  		return;
> > +	}
> >  
> >  	/* Reset and enable the LCDC. */
> >  	lcdc_write(sdev, LDCNT2R, lcdc_read(sdev, LDCNT2R) | LDCNT2R_BR);
> > @@ -271,6 +278,8 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
> >  	/* Stop clocks. */
> >  	shmob_drm_clk_off(sdev);
> >  
> > +	pm_runtime_put(sdev->dev);
> > +
> >  	scrtc->started = false;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > index 30493ce874192e3e..4f01caa119637032 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/slab.h>
> >  
> >  #include <drm/drm_drv.h>
> > @@ -216,6 +217,10 @@ static int shmob_drm_probe(struct platform_device *pdev)
> >  	if (IS_ERR(sdev->mmio))
> >  		return PTR_ERR(sdev->mmio);
> >  
> > +	ret = devm_pm_runtime_enable(&pdev->dev);
> > +	if (ret)
> > +		return ret;
> > +
> 
> I would move this after shmob_drm_setup_clocks(), to ensure that the
> runtime PM suspend and resume handlers will have access to clocks.
> 
> >  	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
> >  	if (ret < 0)
> >  		return ret;

-- 
Regards,

Laurent Pinchart
