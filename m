Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BCB63CA77
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 22:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811410E0ED;
	Tue, 29 Nov 2022 21:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E8710E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 21:25:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D00644DA;
 Tue, 29 Nov 2022 22:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669757109;
 bh=u5VM/EgB7yQMqQjQKF0CcQgsCgj+ZZXX6KbdTtfkuT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g3ZwjqkriwYHCxMWesQ0ByzkNYfTLdWCm8tmyxfMGUqIiqevMVNbn9uiCrhD6YX5P
 9Vd11qKuBj3PzzokNrDjLjrA2bVQZ19vfDqcp6hjwKaLwNDa12GES+BkirgRAHstCZ
 v6jveB3IkZWPYC7gUKVgBnq+efaNOjJGNovYt3jY=
Date: Tue, 29 Nov 2022 23:24:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 17/26] drm: rcar-du: Remove #ifdef guards for PM
 related functions
Message-ID: <Y4Z4pSFrVL9D1gnI@pendragon.ideasonboard.com>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
 <20221129191942.138244-4-paul@crapouillou.net>
 <Y4Zg9yg7KP0yCPIL@pendragon.ideasonboard.com>
 <bc6ece2831188a6041a2956f5efb6a7c3a5b4a18.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc6ece2831188a6041a2956f5efb6a7c3a5b4a18.camel@crapouillou.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Tue, Nov 29, 2022 at 09:05:49PM +0000, Paul Cercueil wrote:
> Le mardi 29 novembre 2022 à 21:43 +0200, Laurent Pinchart a écrit :
> > On Tue, Nov 29, 2022 at 07:19:33PM +0000, Paul Cercueil wrote:
> > > Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
> > > the .suspend/.resume callbacks.
> > > 
> > > These macros allow the suspend and resume functions to be automatically
> > > dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> > > to use #ifdef guards.
> > > 
> > > This has the advantage of always compiling these functions in,
> > > independently of any Kconfig option. Thanks to that, bugs and other
> > > regressions are subsequently easier to catch.
> > > 
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Will you get this whole series merged in one go in drm-misc, or do you
> > expect me to take this patch in my tree ? I'd prefer the first option if
> > possible (less work for me :-)).
> 
> I actually answered that in my cover letter ;)

Oops. I read until "V2" and didn't notice the last paragraph, sorry.

> However I assumed it had to go through drm-next, if you think it can go
> through drm-misc-next, I can apply it myself.

This seems like a good candidate for drm-misc to me.

> > > ---
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > index d003e8d9e7a2..eeec1e02446f 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > @@ -599,7 +599,6 @@ static const struct drm_driver rcar_du_driver =
> > > {
> > >   * Power management
> > >   */
> > >  
> > > -#ifdef CONFIG_PM_SLEEP
> > >  static int rcar_du_pm_suspend(struct device *dev)
> > >  {
> > >         struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> > > @@ -613,11 +612,9 @@ static int rcar_du_pm_resume(struct device
> > > *dev)
> > >  
> > >         return drm_mode_config_helper_resume(&rcdu->ddev);
> > >  }
> > > -#endif
> > >  
> > > -static const struct dev_pm_ops rcar_du_pm_ops = {
> > > -       SET_SYSTEM_SLEEP_PM_OPS(rcar_du_pm_suspend,
> > > rcar_du_pm_resume)
> > > -};
> > > +static DEFINE_SIMPLE_DEV_PM_OPS(rcar_du_pm_ops,
> > > +                               rcar_du_pm_suspend,
> > > rcar_du_pm_resume);
> > >  
> > >  /* ---------------------------------------------------------------
> > > --------------
> > >   * Platform driver
> > > @@ -712,7 +709,7 @@ static struct platform_driver
> > > rcar_du_platform_driver = {
> > >         .shutdown       = rcar_du_shutdown,
> > >         .driver         = {
> > >                 .name   = "rcar-du",
> > > -               .pm     = &rcar_du_pm_ops,
> > > +               .pm     = pm_sleep_ptr(&rcar_du_pm_ops),
> > >                 .of_match_table = rcar_du_of_table,
> > >         },
> > >  };

-- 
Regards,

Laurent Pinchart
