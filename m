Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C1AB794D
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B181D10E755;
	Wed, 14 May 2025 23:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56E10E755
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:07:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1uFLCA-0003Tq-OO; Thu, 15 May 2025 01:07:26 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1uFLC9-002maB-16;
 Thu, 15 May 2025 01:07:25 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1uFLC9-004f9s-28;
 Thu, 15 May 2025 01:07:25 +0200
Date: Thu, 15 May 2025 01:07:25 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 3/3] drm/bridge: fsl-ldb: simplify device_node error
 handling
Message-ID: <20250514230725.fmqnrxrr3odwzn4a@pengutronix.de>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-4-m.felsch@pengutronix.de>
 <20250514224410.GL23592@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514224410.GL23592@pendragon.ideasonboard.com>
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
> On Thu, May 15, 2025 at 12:24:53AM +0200, Marco Felsch wrote:
> > Make use of __free(device_node) to simplify the of_node_put() error
> > handling paths. No functional changes.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 24 +++++++++---------------
> >  1 file changed, 9 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index e0a229c91953..cea9ddaa5e01 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -287,8 +287,9 @@ static const struct drm_bridge_funcs funcs = {
> >  static int fsl_ldb_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > -	struct device_node *panel_node;
> > -	struct device_node *remote1, *remote2;
> > +	struct device_node *panel_node __free(device_node) = NULL;
> > +	struct device_node *remote1 __free(device_node) = NULL;
> > +	struct device_node *remote2 __free(device_node) = NULL;
> >  	struct drm_panel *panel;
> >  	struct fsl_ldb *fsl_ldb;
> >  	int dual_link;
> > @@ -321,21 +322,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
> >  	fsl_ldb->ch0_enabled = (remote1 != NULL);
> >  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> > -	panel_node = of_node_get(remote1 ? remote1 : remote2);
> > -	of_node_put(remote1);
> > -	of_node_put(remote2);
> > +	panel_node = remote1 ? remote1 : remote2;
> 
> This will cause a double put of panel_node, once due to __free() on
> remote1 or remote2, and the second time due to __free() on panel_node.

Argh.. you're right. I drop the __free() from the panel_node.

Thanks,
  Marco

> 
> >  
> > -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> > -		of_node_put(panel_node);
> > +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
> >  		return dev_err_probe(dev, -ENXIO, "No panel node found");
> > -	}
> >  
> >  	dev_dbg(dev, "Using %s\n",
> >  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
> >  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> >  
> >  	panel = of_drm_find_panel(panel_node);
> > -	of_node_put(panel_node);
> >  	if (IS_ERR(panel))
> >  		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
> >  
> > @@ -345,14 +341,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  				     "drm panel-bridge add failed\n");
> >  
> >  	if (fsl_ldb_is_dual(fsl_ldb)) {
> > -		struct device_node *port1, *port2;
> > +		struct device_node *port1 __free(device_node) =
> > +			of_graph_get_port_by_id(dev->of_node, 1);
> > +		struct device_node *port2 __free(device_node) =
> > +			of_graph_get_port_by_id(dev->of_node, 2);
> >  
> > -		port1 = of_graph_get_port_by_id(dev->of_node, 1);
> > -		port2 = of_graph_get_port_by_id(dev->of_node, 2);
> >  		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> > -		of_node_put(port1);
> > -		of_node_put(port2);
> > -
> >  		if (dual_link < 0)
> >  			return dev_err_probe(dev, dual_link,
> >  					     "Error getting dual link configuration\n");
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
