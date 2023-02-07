Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8468D6D1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 13:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4C10E008;
	Tue,  7 Feb 2023 12:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FA110E008
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 12:34:25 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPNB1-00022X-R0; Tue, 07 Feb 2023 13:34:23 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPNAx-0007P7-0E; Tue, 07 Feb 2023 13:34:19 +0100
Date: Tue, 7 Feb 2023 13:34:18 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 1/4] drm/rockchip: vop: limit maximium resolution to
 hardware capabilities
Message-ID: <20230207123418.GF10447@pengutronix.de>
References: <20230207084452.1069656-1-s.hauer@pengutronix.de>
 <20230207084452.1069656-2-s.hauer@pengutronix.de>
 <547c8e94-f2eb-2125-24fe-0dc035f9d6d2@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <547c8e94-f2eb-2125-24fe-0dc035f9d6d2@kwiboo.se>
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

On Tue, Feb 07, 2023 at 10:46:49AM +0000, Jonas Karlman wrote:
> Hi Sascha,
> On 2023-02-07 09:44, Sascha Hauer wrote:
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
> >     Changes since v3:
> >     - new patch
> > 
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 15 ++++++++++
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  2 ++
> >  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 31 +++++++++++++++++++++
> >  3 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > index fa1f4ee6d1950..96b6bd8d17803 100644
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
> > +	if (vop->data->max_xres && mode->hdisplay > vop->data->max_xres)
> > +		return MODE_BAD_HVALUE;
> > +
> > +	if (vop->data->max_yres && mode->vdisplay > vop->data->max_yres)
> > +		return MODE_BAD_VVALUE;
> > +
> > +	return MODE_OK;
> > +}
> > +
> >  static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
> >  				const struct drm_display_mode *mode,
> >  				struct drm_display_mode *adjusted_mode)
> > @@ -1585,6 +1599,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
> >  }
> >  
> >  static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
> > +	.mode_valid = vop_crtc_mode_valid,
> >  	.mode_fixup = vop_crtc_mode_fixup,
> >  	.atomic_check = vop_crtc_atomic_check,
> >  	.atomic_begin = vop_crtc_atomic_begin,
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> > index 8502849833d93..5c4875ca3f270 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> > @@ -225,6 +225,8 @@ struct vop_data {
> >  	const struct vop_win_data *win;
> >  	unsigned int win_size;
> >  	unsigned int lut_size;
> > +	unsigned int max_xres;
> > +	unsigned int max_yres;
> 
> I would suggest using the same struct vop_rect max_input/output as the
> vop2 driver instead of handling this differently between the two.

As it was me who introduced struct vop_rect in the vop2 driver I
probably have to agree ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
