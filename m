Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B116B988
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 07:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B21F6E0F3;
	Tue, 25 Feb 2020 06:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB36E865;
 Tue, 25 Feb 2020 06:15:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4DB6B80509;
 Tue, 25 Feb 2020 07:15:45 +0100 (CET)
Date: Tue, 25 Feb 2020 07:15:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 08/12] drm/bridge: lvds-codec: Implement basic bus
 format negotiation
Message-ID: <20200225061543.GA9944@ravnborg.org>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-9-boris.brezillon@collabora.com>
 <20200224230322.GE16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224230322.GE16163@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=juKz5vNY0a5tetdafiUA:9 a=CjuIK1q_8ugA:10
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
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris/Laurent.

> > +
> > +	err = of_property_read_u32(np, "bus-width", &input_bus_width);
> > +	of_node_put(np);
> > +
> > +	if (err) {
> > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_FIXED;
> > +	} else if (input_bus_width == 18) {
> > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
> > +	} else if (input_bus_width == 24) {
> > +		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> > +	} else {
> > +		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
> > +			input_bus_width);
> > +		return -ENOTSUPP;
> 
> ENOTSUPP is "Operation not supported", I'd go for -EINVAL.
> 
> > +	}
> 
> Doesn't this apply to LVDS encoders only ? For LVDS decoders I don't
> think we want to report an RGB format on the input.

In panel-lvds we use the property "data-mapping" for the same purpose.
To specify the MEDIA_BUS format.

It would be good to standardize on the same property, and maybe have the
same binding descriptions for all.

And "data-mapping" is a text string, which gives us more flexibility
than just a number, that for MEDIA_BUS_FMT seems required.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
