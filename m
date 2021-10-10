Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D7142813A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05036E2D7;
	Sun, 10 Oct 2021 12:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDB26E2D7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:27:39 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 6c52bc6c-29c5-11ec-9c3f-0050568c148b;
 Sun, 10 Oct 2021 12:27:24 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9C848194B7D;
 Sun, 10 Oct 2021 14:27:24 +0200 (CEST)
Date: Sun, 10 Oct 2021 14:27:34 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Message-ID: <YWLcNkO72dk8Hnx7@ravnborg.org>
References: <20211009224152.427219-1-marex@denx.de>
 <20211009224152.427219-2-marex@denx.de>
 <YWKhVrqwANLHoc8H@ravnborg.org>
 <YWK/it9fu4yojFH5@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWK/it9fu4yojFH5@pendragon.ideasonboard.com>
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

> > > +
> > > +	/*
> > > +	 * Decoder input LVDS format is a property of the decoder chip or even
> > > +	 * its strapping. Handle data-mapping the same way lvds-panel does. In
> > > +	 * case data-mapping is not present, do nothing, since there are still
> > > +	 * legacy bindings which do not specify this property.
> >
> > The missing data-mapping property is reported as an error, but this
> > comments says it is OK. Info?
> 
> It's not a fatal error, probe still continues in backward-compatibility
> mode. The message is there to tell that the DT should be updated. Would
> you downgrade that to a warning ?
Warning would IMO be better as this is not an error that stops it from
working.

> 
> > > +	 */
> > > +	if (lvds_codec->connector_type != DRM_MODE_CONNECTOR_LVDS) {
> > > +		bus_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> >
> > Are there any reg specified in the binding? If not then the second
> > parameter should be -1 here.
> 
> Yes, the DT node has two ports, with port 0 being the input. For LVDS
> decoders, that's where the LVDS bus is.
OK.

> 
> > > +		if (!bus_node) {
> > > +			dev_dbg(dev, "bus DT node not found\n");
> > > +			return -ENXIO;
> > > +		}
> > > +
> > > +		ret = of_property_read_string(bus_node, "data-mapping",
> > > +					      &mapping);
> > > +		of_node_put(bus_node);
> > > +		if (ret < 0) {
> > > +			dev_err(dev, "missing 'data-mapping' DT property\n");
> > > +		} else {
> >
> > It would be nice with a helper for the below code if we need this a third
> > time.
> 
> Where would you store it ?
drm_connector.c seems to be a good place.
Or maybe a static inline in drm_connector.h.
> 
> > > +			if (!strcmp(mapping, "jeida-18")) {
> > > +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
> > > +			} else if (!strcmp(mapping, "jeida-24")) {
> > > +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> > > +			} else if (!strcmp(mapping, "vesa-24")) {
> > > +				lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
> > > +			} else {
> > > +				dev_err(dev, "invalid 'data-mapping' DT property\n");
> > > +				return -EINVAL;
> > > +			}

	Sam
