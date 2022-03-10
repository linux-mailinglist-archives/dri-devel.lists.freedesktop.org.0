Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4AC4D457C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 12:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6EB10EE5C;
	Thu, 10 Mar 2022 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E77D10EE59
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 11:17:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C594D4AB;
 Thu, 10 Mar 2022 12:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646911033;
 bh=vkX4FP65/1Jl4E3Js5uyjhCWZutVlJeYMw/Xm7WV0IM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fukventd7vdPoKn9tPdJ0OMdg5cGNJs5tTh57gwh9Q+Nk1CRyANjWoRuM1EDr5BTC
 d82RTJ534ivyMDfmGJeUmkEHKFvY4DKKoivVKMYU8zQiJo1DgCVYFBn0fSlWxyoEej
 44FKnNjXYO+t0L+kMuhpUkjhT0ElA/rwQDYdRkFQ=
Date: Thu, 10 Mar 2022 13:16:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <YineKfG63AiUxkqu@pendragon.ideasonboard.com>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <YinWBFgdw22SlRKt@pendragon.ideasonboard.com>
 <20220310105738.uz7ul3ycmsbt43po@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310105738.uz7ul3ycmsbt43po@houat>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Thu, Mar 10, 2022 at 11:57:38AM +0100, Maxime Ripard wrote:
> On Thu, Mar 10, 2022 at 12:42:12PM +0200, Laurent Pinchart wrote:
> > On Tue, Mar 08, 2022 at 01:51:40PM +0100, Maxime Ripard wrote:
> > > On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> > > > On 3/8/22 11:07, Jagan Teki wrote:
> > > > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
> > > > > > 
> > > > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > [...]
> > > > > > 
> > > > > > > > @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
> > > > > > > >    static int chipone_parse_dt(struct chipone *icn)
> > > > > > > >    {
> > > > > > > >           struct device *dev = icn->dev;
> > > > > > > > +       struct device_node *endpoint;
> > > > > > > >           struct drm_panel *panel;
> > > > > > > > +       int dsi_lanes;
> > > > > > > >           int ret;
> > > > > > > > 
> > > > > > > >           icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
> > > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
> > > > > > > >                   return PTR_ERR(icn->enable_gpio);
> > > > > > > >           }
> > > > > > > > 
> > > > > > > > +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> > > > > > > > +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> > > > > > > > +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
> > > > > > > > +       of_node_put(endpoint);
> > > > > > > > +
> > > > > > > > +       if (!icn->host_node)
> > > > > > > > +               return -ENODEV;
> > > > > > > 
> > > > > > > The non-ports-based OF graph returns a -19 example on the Allwinner
> > > > > > > Display pipeline in R16 [1].
> > > > > > > 
> > > > > > > We need to have a helper to return host_node for non-ports as I have
> > > > > > > done it for drm_of_find_bridge.
> > > > > > > 
> > > > > > > [1] https://patchwork.amarulasolutions.com/patch/1805/
> > > > > > 
> > > > > > The link points to a patch marked "DO NOT MERGE", maybe that patch is
> > > > > > missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
> > > > > > required, see:
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
> > > > > > 
> > > > > > What is "non-ports-based OF graph" ?
> > > > > > 
> > > > > > I don't see drm_of_find_bridge() in linux-next , what is that ?
> > > > > 
> > > > > port@0 is optional as some of the DSI host OF-graph represent the
> > > > > bridge or panel as child nodes instead of ports. (i think dt-binding
> > > > > has to fix it to make port@0 optional)
> > > > 
> > > > The current upstream DT binding document says:
> > > > 
> > > >     required:
> > > >       - port@0
> > > >       - port@1
> > > > 
> > > > So port@0 is mandatory.
> > > 
> > > In the binding, sure, but fundamentally the DT excerpt Jagan provided is
> > > correct. If the bridge supports DCS, there's no reason to use the OF
> > > graph in the first place: the bridge node will be a child node of the
> > > MIPI-DSI controller (and there's no obligation to use the OF-graph for a
> > > MIPI-DSI controller).
> > > 
> > > I believe port@0 should be made optional (or downright removed if
> > > MIPI-DCS in the only control bus).
> > 
> > I think we should make ports mandatory in all cases actually.
> > 
> > The DT parent-child hierarchy is meant to model control relations
> > between devices, so a DSI device controlled through DCS should be a
> > child of the DSI controller. No disagreement there.
> > 
> > The OF graph is meant to model data connections. While a DSI device
> > controlled through DCS will use the same DSI link for data transfer, the
> > two concepts are different. We have taken shortcuts and decided to not
> > use OF graph for some DSI devices (not necessarily as a well thought
> > decision, it was sometimes just not considered).
> 
> I disagree. Unless the data path is explicitly stated using the OF-graph
> or some other binding, it's inferred.

It is today, and for video data, I think it's showing to be a problem
:-)

> We never asked ourselves where the
> data from an i2c chip, an ethernet controller or an v4l2 output device
> was coming from. It comes from the parent bus, because it's what makes
> sense. Making a requirement on the OF-Graph to model this would create a
> big inconsistency.

I'm afraid I disagree, especially when it comes to data transfers from
device to device. The device tree has never tried to model those until
OF graph.

> > This has led to different issues that we're having to deal with today,
> > making it more difficult to develop generic code. Going forward, I
> > think new bindings should always use OF graph to model the data
> > connection.
> 
> Either way, that discussion is irrelevant. Not all DSI controllers use
> OF-Graph, a bridge can be attached to any of them, so we can't require
> OF-Graph support in any bridge.

Not in any bridge, but we could in new ones, and we could also require
it in new DT for existing bridge to support new features.

-- 
Regards,

Laurent Pinchart
