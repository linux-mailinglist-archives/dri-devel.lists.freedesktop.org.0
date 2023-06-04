Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BE6721634
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 12:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8363C10E12A;
	Sun,  4 Jun 2023 10:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0571E10E12A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 10:48:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126166129043.28.openmobile.ne.jp
 [126.166.129.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE7222B6;
 Sun,  4 Jun 2023 12:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685875696;
 bh=GUhS5etQfJ1SAzcCZ5kOJUay2NSAPg4B87X9Y6Ea1AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AsQn5oyisCzA6hrOgCLGt7J2gpTNs0zjYrUwZzEoDkEf5+uSbcOajyyw/qefuXicU
 av2ixoVkI+4lPI6A9iy1wYDcvGj0WYktPEr7tQ1I1uI7BTvxjPvfna+uTbYx4k317s
 VeP0vUxmmUSgYTRsigjUqacKXg/4Oyk3rwYkAQqQ=
Date: Sun, 4 Jun 2023 13:48:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
 KMS init errors
Message-ID: <20230604104839.GB2483@pendragon.ideasonboard.com>
References: <20230530153251.22302-1-laurent.pinchart+renesas@ideasonboard.com>
 <OS0PR01MB592200F03BE4C64092321EB3864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592200F03BE4C64092321EB3864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Fri, Jun 02, 2023 at 07:29:45PM +0000, Biju Das wrote:
> > Subject: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
> > KMS init errors
> > 
> > The (large) rcar_du_modeset_init() function can fail for many reasons,
> > two of two involving probe deferral. Use dev_err_probe() in those code
> > paths to record the cause of the probe deferral, in order to help
> > debugging probe issues.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++++
> > drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 8 ++++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> > index 12a8839fe3be..5b752adb1b02 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> > @@ -701,6 +701,10 @@ static int rcar_du_probe(struct platform_device *pdev)
> >  	/* DRM/KMS objects */
> >  	ret = rcar_du_modeset_init(rcdu);
> >  	if (ret < 0) {
> > +		/*
> > +		 * Don't use dev_err_probe(), as it would overwrite the probe
> > +		 * deferral reason recorded in rcar_du_modeset_init().
> > +		 */
> >  		if (ret != -EPROBE_DEFER)
> >  			dev_err(&pdev->dev,
> >  				"failed to initialize DRM/KMS (%d)\n", ret);
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > index adfb36b0e815..a9b01027bf03 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > @@ -932,8 +932,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > 
> >  	/* Initialize the Color Management Modules. */
> >  	ret = rcar_du_cmm_init(rcdu);
> > -	if (ret)
> > +	if (ret) {
> > +		dev_err_probe(rcdu->dev, "failed to initialize CMM\n", ret);
> 		
> 	dev_err_probe(rcdu->dev, ret, "failed to initialize CMM\n");
> 
> 	similarly for below one.

Oops. I wonder how I missed that, is it fails to even compile. Sorry :-(
I'll post a v2.

> >  		return ret;
> > +	}
> > 
> >  	/* Create the CRTCs. */
> >  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
> > @@ -952,8 +954,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > 
> >  	/* Initialize the encoders. */
> >  	ret = rcar_du_encoders_init(rcdu);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		dev_err_probe(rcdu->dev, "failed to initialize encoders\n", ret);
> >  		return ret;
> > +	}
> > 
> >  	if (ret == 0) {
> >  		dev_err(rcdu->dev, "error: no encoder could be initialized\n");

-- 
Regards,

Laurent Pinchart
