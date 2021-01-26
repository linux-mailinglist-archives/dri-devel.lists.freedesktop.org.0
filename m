Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541AB303FC5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 15:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B0C6E088;
	Tue, 26 Jan 2021 14:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B616E088
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 14:10:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E15602C1;
 Tue, 26 Jan 2021 15:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1611670242;
 bh=WQ7PZkJAI5LGgDKAbdMJf4gHNVYYYdDYBmqgv1rqQew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XD/Yx8A3Vx0BvOy3NV9cifiHPUc/PXZNJAU7nWnKpKEUaFmhrnrdXdoCjT4ElopjY
 jJJclLaAnuSIOOL16lRQ92LetMQs5lakQwqgf6L2gl/K5NI96d3Ppih5/iHLC3wN19
 Kc/QPQU3+MJ+VAZrdPPuZ/+IolACq8X3/CpXqdtU=
Date: Tue, 26 Jan 2021 16:10:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RESEND v3 1/6] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Message-ID: <YBAiztjg0Jji9voK@pendragon.ideasonboard.com>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
 <6169dd15782627c8415583881fa94ba39c4f5221.1601910923.git-series.maxime@cerno.tech>
 <20201011230030.GD3944@pendragon.ideasonboard.com>
 <20201118174805.cm67sluusovz5n6a@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118174805.cm67sluusovz5n6a@gilmour.lan>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Nov 18, 2020 at 06:48:05PM +0100, Maxime Ripard wrote:
> On Mon, Oct 12, 2020 at 02:00:30AM +0300, Laurent Pinchart wrote:
> > > -static int drm_of_lvds_get_remote_pixels_type(
> > > -			const struct device_node *port_node)
> > > +static int drm_of_lvds_get_remote_pixels_type(const struct device_node *endpoint)
> > >  {
> > > -	struct device_node *endpoint = NULL;
> > > -	int pixels_type = -EPIPE;
> > > +	struct device_node *remote_port;
> > > +	int pixels_type;
> > >  
> > > -	for_each_child_of_node(port_node, endpoint) {
> > > -		struct device_node *remote_port;
> > > -		int current_pt;
> > > -
> > > -		if (!of_node_name_eq(endpoint, "endpoint"))
> > > -			continue;
> > > -
> > > -		remote_port = of_graph_get_remote_port(endpoint);
> > > -		if (!remote_port) {
> > > -			of_node_put(remote_port);
> > > -			return -EPIPE;
> > > -		}
> > > -
> > > -		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
> > > +	remote_port = of_graph_get_remote_port(endpoint);
> > > +	if (!remote_port) {
> > >  		of_node_put(remote_port);
> > 
> > You can drop this line.
> > 
> > > -		if (pixels_type < 0)
> > > -			pixels_type = current_pt;
> > > -
> > > -		/*
> > > -		 * Sanity check, ensure that all remote endpoints have the same
> > > -		 * pixel type. We may lift this restriction later if we need to
> > > -		 * support multiple sinks with different dual-link
> > > -		 * configurations by passing the endpoints explicitly to
> > > -		 * drm_of_lvds_get_dual_link_pixel_order().
> > > -		 */
> > 
> > Shouldn't we keep this check when endpoint_id is -1 in
> > drm_of_lvds_get_dual_link_pixel_order() ?
> 
> I tried to do that, and I'm not quite really sure how to go around it.
> 
> This scans all the endpoints in a given port.
> 
> However, now that we have the device, port id and endpoint id, we need
> to use of_graph_get_port_by_id to get the port matching the device and
> port id, and iterate over all its endpoint as done here.
> 
> The trouble is that of_graph_get_port_by_id expects a !const
> device_node, yet drm_of_lvds_get_dual_link_pixel_order (and seems to be
> doing so rightfully), so that creates a warning because we drop the
> const there.

of_graph_get_port_by_id() doesn't seem to modify the device_node passed
to it, couldn't it be modified to take a const pointer ?

> Changing the prototype to passing only the port device_node doesn't
> really work either, since it would be const, and we would need to call
> of_graph_get_endpoint_by_regs (so having the parent device_node, through
> of_graph_get_port_parent) and of_graph_get_port_parent takes a !const
> port device_node.
> 
> I guess we could drop const entirely from our function, but that doesn't
> look right either..

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
