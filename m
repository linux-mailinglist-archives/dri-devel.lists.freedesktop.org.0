Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E986B03B7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FB110E07B;
	Wed,  8 Mar 2023 10:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BFB10E07B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 10:06:33 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pZqgq-0006CJ-3o; Wed, 08 Mar 2023 11:06:32 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pZqgi-0007e3-JO; Wed, 08 Mar 2023 11:06:24 +0100
Date: Wed, 8 Mar 2023 11:06:24 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Heiko =?iso-8859-15?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v6 1/4] drm/rockchip: vop: limit maximium resolution to
 hardware capabilities
Message-ID: <20230308100624.GF27249@pengutronix.de>
References: <20230216102447.582905-1-s.hauer@pengutronix.de>
 <20230216102447.582905-2-s.hauer@pengutronix.de>
 <839117967.0ifERbkFSE@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <839117967.0ifERbkFSE@diego>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:21:16PM +0100, Heiko Stübner wrote:
> Hi Sascha,
> 
> Am Donnerstag, 16. Februar 2023, 11:24:44 CET schrieb Sascha Hauer:
> > The different VOP variants support different maximum resolutions. Reject
> > resolutions that are not supported by a specific variant.
> > 
> > This hasn't been a problem in the upstream driver so far as 1920x1080
> > has been the maximum resolution supported by the HDMI driver and that
> > resolution is supported by all VOP variants. Now with higher resolutions
> > supported in the HDMI driver we have to limit the resolutions to the
> > ones supported by the VOP.
> > 
> > The actual maximum resolutions are taken from the Rockchip downstream
> > Kernel.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > 
> > Notes:
> >     Changes since v5:
> >     - fix wrong check height vs. width
> >     
> >     Changes since v4:
> >     - Use struct vop_rect for storing resolution
> >     
> >     Changes since v3:
> >     - new patch
> > 
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++++++++++
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 ++++++
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 -----
> >  drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 ++++++++++++++++++
> >  4 files changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > index fa1f4ee6d1950..40c688529d44e 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > @@ -1174,6 +1174,20 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
> >  	spin_unlock_irqrestore(&vop->irq_lock, flags);
> >  }
> >  
> > +static enum drm_mode_status vop_crtc_mode_valid(struct drm_crtc *crtc,
> > +						const struct drm_display_mode *mode)
> > +{
> > +	struct vop *vop = to_vop(crtc);
> > +
> > +	if (vop->data->max_output.width && mode->hdisplay > vop->data->max_output.width)
> > +		return MODE_BAD_HVALUE;
> > +
> > +	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_output.height)
> > +		return MODE_BAD_VVALUE;
> > +
> > +	return MODE_OK;
> > +}
> 
> I'm very much in favor of codifying the possible resolutions. Hopefully
> this will also enable better vop-selection down the road.
> 
> But ...
> 
> The above does break the px30-minievb display.
> While the px30 TRM does say it supports a 1920x1080 resolution only, the
> px30-minievb comes with a 720x1280 DSI display and normally runs just
> fine with it.
> 
> Looking at the vendor-code [0], it seems they only seem to check for the
> hvalue. Looking deeper, the height-check was present in the beginning [1],
> but then was removed later on.
> 
> Looking a bit more, I find [2] which says that
> 	"Actually vop hardware has no output height limit"
> 
> I re-checked this on both px30+dsi and rock64+1080p-hdmi and with
> > +	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_output.height)
> > +		return MODE_BAD_VVALUE;
> line gone, rock64 is still happy and the px30 works correctly again.
> 
> So, do you see an issue with removing the output-height check?

I just added the height checks for the sake of completeness. For what I
am trying to achieve the width check is sufficient. If there is no
height limitation in hardware anyway then we should just drop the check.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
