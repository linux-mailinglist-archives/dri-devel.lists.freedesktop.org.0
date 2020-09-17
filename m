Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097F26D01C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3316EB6F;
	Thu, 17 Sep 2020 00:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7106EB6F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:44:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F212276;
 Thu, 17 Sep 2020 02:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600303455;
 bh=YUF7PnyeyRe/iS9JXGGKcrQwclQ2vieX+XKJuYJIxwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qBFA8u9Chfplm6Sdlo/Y6YgL19tJzcfmQmg1bRcv1O8brondIzZGAJRjJb1WQwKjc
 JpBspH8siQJa9eMq1GiH+peVIwYwYTsIOWVm8yrvRrF1lKz0PpNGnWoClNZ3GimW3Q
 tEvR96cRbeUKWzKgjDu3AXuKwcNNyE4El9EZZK2k=
Date: Thu, 17 Sep 2020 03:43:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Put reference to VSP device
Message-ID: <20200917004345.GO3853@pendragon.ideasonboard.com>
References: <20200915233004.GD14954@pendragon.ideasonboard.com>
 <20200915233832.19769-1-laurent.pinchart+renesas@ideasonboard.com>
 <1deb9fc0-7f87-ed4a-d719-401e08ad83ca@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1deb9fc0-7f87-ed4a-d719-401e08ad83ca@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Yu Kuai <yukuai3@huawei.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Wed, Sep 16, 2020 at 11:26:36AM +0100, Kieran Bingham wrote:
> On 16/09/2020 00:38, Laurent Pinchart wrote:
> > The reference to the VSP device acquired with of_find_device_by_node()
> > in rcar_du_vsp_init() is never released. Fix it with a drmm action,
> > which gets run both in the probe error path and in the remove path.
> > 
> > Fixes: 6d62ef3ac30b ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
> > Reported-by: Yu Kuai <yukuai3@huawei.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Looks nice and clean!
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > index f1a81c9b184d..fa09b3ae8b9d 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > @@ -13,6 +13,7 @@
> >  #include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem_cma_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_vblank.h>
> >  
> > @@ -341,6 +342,13 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
> >  	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
> >  };
> >  
> > +static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
> > +{
> > +	struct rcar_du_vsp *vsp = res;
> > +
> > +	put_device(vsp->vsp);
> 
> Ugh the asymmetry of the put_device is a bit annoying, because it's not
> initially clear that the of_find_device_by_node() call 'gets' a reference.
> 
> (Or at least not until you find:
>   https://lore.kernel.org/patchwork/patch/731284/)
> 
> It is stated in the commit message though so that's fine, and although I
> thought perhaps a comment here might be useful to declare that it
> releases the reference taken by of_find_device_by_node(), I'm not sure
> it even adds that much value ... so either way.

I think that the fact that drmm_add_action() is called right after
of_find_device_by_node() makes this explicit enough.

> > +}
> > +
> >  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >  		     unsigned int crtcs)
> >  {
> > @@ -357,6 +365,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >  
> >  	vsp->vsp = &pdev->dev;
> >  
> > +	ret = drmm_add_action(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	ret = vsp1_du_init(vsp->vsp);
> >  	if (ret < 0)
> >  		return ret;
> > 
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
