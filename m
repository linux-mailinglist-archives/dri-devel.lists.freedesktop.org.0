Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD4AB7949
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE60B10E02A;
	Wed, 14 May 2025 23:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F185310E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:05:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1uFL9i-00032n-7V; Thu, 15 May 2025 01:04:54 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1uFL9f-002mOC-2x;
 Thu, 15 May 2025 01:04:52 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1uFL9g-004ex0-0e;
 Thu, 15 May 2025 01:04:52 +0200
Date: Thu, 15 May 2025 01:04:52 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 1/3] drm/bridge: fsl-ldb: make use of driver_private
Message-ID: <20250514230452.622hktklws6kka2y@pengutronix.de>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-2-m.felsch@pengutronix.de>
 <20250514224515.GM23592@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514224515.GM23592@pendragon.ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 25-05-15, Laurent Pinchart wrote:
> Hi Marco,
> 
> Thank you for the patch.
> 
> On Thu, May 15, 2025 at 12:24:51AM +0200, Marco Felsch wrote:
> > Make use of the drm_bridge::driver_private data instead of
> > container_of() wrapper.
> 
> I suppose this is a personal preference, but I like usage of
> container_of() better. In my opinion it conveys better that struct
> fsl_ldb "unherits" from struct drm_bridge.

Yes, we can drop this patch if container_of() or to_fsl_ldb() is
preferred. I just saw the driver_private field and why not making use of
it since we do that a lot, same is true for container_of :)

Regards,
  Marco

> > No functional changes.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index 0fc8a14fd800..fa29f2bf4031 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -99,11 +99,6 @@ static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> >  	return (fsl_ldb->ch0_enabled && fsl_ldb->ch1_enabled);
> >  }
> >  
> > -static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
> > -{
> > -	return container_of(bridge, struct fsl_ldb, bridge);
> > -}
> > -
> >  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
> >  {
> >  	if (fsl_ldb_is_dual(fsl_ldb))
> > @@ -115,7 +110,7 @@ static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
> >  static int fsl_ldb_attach(struct drm_bridge *bridge,
> >  			  enum drm_bridge_attach_flags flags)
> >  {
> > -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> > +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
> >  
> >  	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
> >  				 bridge, flags);
> > @@ -124,7 +119,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
> >  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
> >  				  struct drm_bridge_state *old_bridge_state)
> >  {
> > -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> > +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
> >  	struct drm_atomic_state *state = old_bridge_state->base.state;
> >  	const struct drm_bridge_state *bridge_state;
> >  	const struct drm_crtc_state *crtc_state;
> > @@ -226,7 +221,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
> >  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
> >  				   struct drm_bridge_state *old_bridge_state)
> >  {
> > -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> > +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
> >  
> >  	/* Stop channel(s). */
> >  	if (fsl_ldb->devdata->lvds_en_bit)
> > @@ -270,7 +265,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
> >  		   const struct drm_display_info *info,
> >  		   const struct drm_display_mode *mode)
> >  {
> > -	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> > +	struct fsl_ldb *fsl_ldb = bridge->driver_private;
> >  
> >  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> >  		return MODE_CLOCK_HIGH;
> > @@ -309,6 +304,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  	fsl_ldb->dev = &pdev->dev;
> >  	fsl_ldb->bridge.funcs = &funcs;
> >  	fsl_ldb->bridge.of_node = dev->of_node;
> > +	fsl_ldb->bridge.driver_private = fsl_ldb;
> >  
> >  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
> >  	if (IS_ERR(fsl_ldb->clk))
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
