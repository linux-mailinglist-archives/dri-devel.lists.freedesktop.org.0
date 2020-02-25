Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8E16BC05
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965FC6E8C1;
	Tue, 25 Feb 2020 08:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED766E8C1;
 Tue, 25 Feb 2020 08:44:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A4F5293DCC;
 Tue, 25 Feb 2020 08:44:26 +0000 (GMT)
Date: Tue, 25 Feb 2020 09:44:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 08/12] drm/bridge: lvds-codec: Implement basic bus
 format negotiation
Message-ID: <20200225094423.6fd2d6d5@collabora.com>
In-Reply-To: <20200225061543.GA9944@ravnborg.org>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-9-boris.brezillon@collabora.com>
 <20200224230322.GE16163@pendragon.ideasonboard.com>
 <20200225061543.GA9944@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Feb 2020 07:15:43 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Boris/Laurent.
> 
> > > +
> > > +	err = of_property_read_u32(np, "bus-width", &input_bus_width);
> > > +	of_node_put(np);
> > > +
> > > +	if (err) {
> > > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_FIXED;
> > > +	} else if (input_bus_width == 18) {
> > > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
> > > +	} else if (input_bus_width == 24) {
> > > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> > > +	} else {
> > > +		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
> > > +			input_bus_width);
> > > +		return -ENOTSUPP;  
> > 
> > ENOTSUPP is "Operation not supported", I'd go for -EINVAL.
> >   
> > > +	}  
> > 
> > Doesn't this apply to LVDS encoders only ? For LVDS decoders I don't
> > think we want to report an RGB format on the input.  
> 
> In panel-lvds we use the property "data-mapping" for the same purpose.
> To specify the MEDIA_BUS format.

I started with data-mapping, and was told (by Laurent IIRC) that
bus-width would be more appropriate for a DPI (AKA RGB) bus. I think it
has to do with the fact that fully-parallel buses always have one color
bit per-signal, while serial or partially-parallel buses can have
several color-bits per-signal, the assignment being described by this
'data-mapping' property. This being said, I can see a case where
data-mapping would be needed for DPI buses => RGB component ordering. A
24bit bus does not distinguish between RGB888 and BGR888.

> 
> It would be good to standardize on the same property, and maybe have the
> same binding descriptions for all.

As for the standardization, I'm all for it, but let's do that in a
second step, please.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
