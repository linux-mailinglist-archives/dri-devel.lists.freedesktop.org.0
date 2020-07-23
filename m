Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74822ADE2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 13:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671AC6E190;
	Thu, 23 Jul 2020 11:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B66E190
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 11:39:21 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8E93320053;
 Thu, 23 Jul 2020 13:39:14 +0200 (CEST)
Date: Thu, 23 Jul 2020 13:39:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 3/4] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200723113912.GA535520@ravnborg.org>
References: <20200708103559.132300-1-vkoul@kernel.org>
 <20200708103559.132300-4-vkoul@kernel.org>
 <20200719171806.GA55541@ravnborg.org>
 <20200722131430.GJ5833@pendragon.ideasonboard.com>
 <20200723104151.GY12965@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723104151.GY12965@vkoul-mobl>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=MEg9e8l0tn4fy5IhjskA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 04:11:51PM +0530, Vinod Koul wrote:
> Hi Sam, Laurent,
> 
> On 22-07-20, 16:14, Laurent Pinchart wrote:
> > > > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > > > +				enum drm_bridge_attach_flags flags)
> > > > +{
> > > > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > > > +	int ret;
> > > > +
> > > > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > > +		dev_err(lt9611->dev, "Fix bridge driver to make connector optional!");
> > > > +		return -EINVAL;
> > > > +	}
> > >
> > > This should say that the display driver should be fixed.
> > > If a display driver expects this bridge to create the connector
> > > it would not work.
> > 
> > Actually, for new bridge drivers, connector creation should be optional
> > from the start. We don't want a failure in that case, the feature should
> > be implemented.
> 
> Yes this is causing issues for me now !. The patch 4/4 adds support in
> msm/dsi but causes regression on qualcomm laptops with ti-sn65dsi86 eDP
> bridge. I tried to fix that up with changes like Laurent has done for
> adv7511, but it hasnt worked yet for me (remote debug of this is bit
> painful)
> 
> So I am going to drop patch 4 from this series and add support for both
> DRM_BRIDGE_ATTACH_NO_CONNECTOR set and cleared (like we have in adv7511)
> so that it can work in both cases, while I fix all bridge uses of
> msm/dsi and then we can drop these. Does that sound okay to you folks?
Yes, sounds like a good plan.
Only when all display drivers are migrated over can we drop all the
workarounds in the bridge drivers.
I had hoped all users of this bridge was converted - alas that was not
the case.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
