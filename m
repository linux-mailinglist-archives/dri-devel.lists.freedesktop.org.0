Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C26F4D44E0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506410EE06;
	Thu, 10 Mar 2022 10:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDF110EE07
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:42:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AF4C8E6;
 Thu, 10 Mar 2022 11:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646908947;
 bh=bk4/H0AUNC99jlDWQvEPh8b79Iym5kDsheXLfgl1998=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3mfR0lGOoUMXGc73u1yOzkjs4O1qTUUocUUY/Cf5lA/47gX0xbcZYYtlC69t0Dju
 SSP0wIIucI3Z/o9LY2L/48KcBuvYY0Xhh0EkLlmgR9zSvizDS/FV1u9mIF2jBYmTHE
 AV+JDE4n1eUHGW0E0sbh0Iia728yOt6SvCytXE70=
Date: Thu, 10 Mar 2022 12:42:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <YinWBFgdw22SlRKt@pendragon.ideasonboard.com>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308125140.e7orpvocrerr5xdv@houat>
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

On Tue, Mar 08, 2022 at 01:51:40PM +0100, Maxime Ripard wrote:
> On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> > On 3/8/22 11:07, Jagan Teki wrote:
> > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
> > > > 
> > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > [...]
> > > > 
> > > > > > @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
> > > > > >    static int chipone_parse_dt(struct chipone *icn)
> > > > > >    {
> > > > > >           struct device *dev = icn->dev;
> > > > > > +       struct device_node *endpoint;
> > > > > >           struct drm_panel *panel;
> > > > > > +       int dsi_lanes;
> > > > > >           int ret;
> > > > > > 
> > > > > >           icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
> > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
> > > > > >                   return PTR_ERR(icn->enable_gpio);
> > > > > >           }
> > > > > > 
> > > > > > +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> > > > > > +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> > > > > > +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
> > > > > > +       of_node_put(endpoint);
> > > > > > +
> > > > > > +       if (!icn->host_node)
> > > > > > +               return -ENODEV;
> > > > > 
> > > > > The non-ports-based OF graph returns a -19 example on the Allwinner
> > > > > Display pipeline in R16 [1].
> > > > > 
> > > > > We need to have a helper to return host_node for non-ports as I have
> > > > > done it for drm_of_find_bridge.
> > > > > 
> > > > > [1] https://patchwork.amarulasolutions.com/patch/1805/
> > > > 
> > > > The link points to a patch marked "DO NOT MERGE", maybe that patch is
> > > > missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
> > > > required, see:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
> > > > 
> > > > What is "non-ports-based OF graph" ?
> > > > 
> > > > I don't see drm_of_find_bridge() in linux-next , what is that ?
> > > 
> > > port@0 is optional as some of the DSI host OF-graph represent the
> > > bridge or panel as child nodes instead of ports. (i think dt-binding
> > > has to fix it to make port@0 optional)
> > 
> > The current upstream DT binding document says:
> > 
> >     required:
> >       - port@0
> >       - port@1
> > 
> > So port@0 is mandatory.
> 
> In the binding, sure, but fundamentally the DT excerpt Jagan provided is
> correct. If the bridge supports DCS, there's no reason to use the OF
> graph in the first place: the bridge node will be a child node of the
> MIPI-DSI controller (and there's no obligation to use the OF-graph for a
> MIPI-DSI controller).
> 
> I believe port@0 should be made optional (or downright removed if
> MIPI-DCS in the only control bus).

I think we should make ports mandatory in all cases actually.

The DT parent-child hierarchy is meant to model control relations
between devices, so a DSI device controlled through DCS should be a
child of the DSI controller. No disagreement there.

The OF graph is meant to model data connections. While a DSI device
controlled through DCS will use the same DSI link for data transfer, the
two concepts are different. We have taken shortcuts and decided to not
use OF graph for some DSI devices (not necessarily as a well thought
decision, it was sometimes just not considered). This has led to
different issues that we're having to deal with today, making it more
difficult to develop generic code. Going forward, I think new bindings
should always use OF graph to model the data connection.


-- 
Regards,

Laurent Pinchart
