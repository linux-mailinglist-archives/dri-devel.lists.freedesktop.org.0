Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB561430B47
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D74B6E7E2;
	Sun, 17 Oct 2021 17:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85BD6E821
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 17:41:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 656428fa-2f71-11ec-9c3f-0050568c148b;
 Sun, 17 Oct 2021 17:41:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BC8EA194B21;
 Sun, 17 Oct 2021 19:41:07 +0200 (CEST)
Date: Sun, 17 Oct 2021 19:40:57 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for pixel
 data sampling edge select
Message-ID: <YWxgKWXBpT6PyQO8@ravnborg.org>
References: <20211017001204.299940-1-marex@denx.de>
 <20211017001204.299940-2-marex@denx.de>
 <YWxUB9y3qFzkfRR0@ravnborg.org>
 <075913ae-e5a0-3a9e-c928-55cae99ab0e5@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <075913ae-e5a0-3a9e-c928-55cae99ab0e5@denx.de>
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

Hi Marek,

On Sun, Oct 17, 2021 at 07:29:51PM +0200, Marek Vasut wrote:
> On 10/17/21 6:49 PM, Sam Ravnborg wrote:
> 
> [...]
> 
> > > +	/*
> > > +	 * Encoder might sample data on different clock edge than the display,
> > > +	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
> > > +	 * the sampling edge.
> > > +	 */
> > > +	if (lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS &&
> > > +	    !of_property_read_u32(dev->of_node, "pclk-sample", &val)) {
> > > +		lvds_codec->timings.input_bus_flags = val ?
> > > +			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE :
> > > +			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
> > > +	}
> > > +
> > >   	/*
> > >   	 * The panel_bridge bridge is attached to the panel's of_node,
> > >   	 * but we need a bridge attached to our of_node for our user
> > >   	 * to look up.
> > >   	 */
> > >   	lvds_codec->bridge.of_node = dev->of_node;
> > > +	lvds_codec->bridge.timings = &lvds_codec->timings;
> > I do not understand how this will work. The only field that is set is timings.input_bus_flags
> > but any user will see bridge.timings is set and will think this is all
> > timing info.
> > 
> > Maybe I just misses something obvious?
> 
> Is there anything else in those timings that should be set ? See
> include/drm/drm_bridge.h around line 640
> 
> setup_time_ps/hold_time_ps/dual_link isn't supported by this driver, so it
> is 0 or false anyway, i.e. no change.

Just me being confused with display_timings. Patch looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Ping me in a few days to apply it if there is no more feedback.

	Sam

