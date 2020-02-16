Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D701160490
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 16:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145E86E402;
	Sun, 16 Feb 2020 15:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBCD6E402
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 15:39:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936E32AF;
 Sun, 16 Feb 2020 16:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581867590;
 bh=qtVmjZUERQqF72Lotw7qtEbfnEUtqINjN7CAEbieN/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sPvyRWD/4x98X1ZRVG/Pg02S6j384zWnUYS6WZKmzdhpFG6TigXsiZEz1tvh+g4VC
 g7KGIwoKM/WA2qSLBZ0xrzsNcZGsn2bRzsAgRWS+uQa2Yx85PUgE+2zyy30rexa9fE
 lXSUBvSSKzTg3Ih23Q7yITuFOZP+GnOFtZwzFvH0=
Date: Sun, 16 Feb 2020 17:39:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 17/52] drm: Add helper to create a connector for a
 chain of bridges
Message-ID: <20200216153932.GE28645@pendragon.ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
 <20200124035445.1830-18-laurent.pinchart@ideasonboard.com>
 <a3e8855c-ebb2-b72b-0e16-8f34a45df5a3@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3e8855c-ebb2-b72b-0e16-8f34a45df5a3@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Jan 28, 2020 at 01:19:53PM +0200, Tomi Valkeinen wrote:
> On 24/01/2020 05:54, Laurent Pinchart wrote:
> 
> > +struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > +						struct drm_encoder *encoder)
> > +{
> > +	struct drm_bridge_connector *bridge_connector;
> > +	struct drm_connector *connector;
> > +	struct i2c_adapter *ddc = NULL;
> > +	struct drm_bridge *bridge;
> > +	int connector_type;
> > +
> > +	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> > +	if (!bridge_connector)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	bridge_connector->encoder = encoder;
> > +
> > +	/*
> > +	 * TODO: Handle doublescan_allowed, stereo_allowed and
> > +	 * ycbcr_420_allowed.
> > +	 */
> > +	connector = &bridge_connector->base;
> > +	connector->interlace_allowed = true;
> > +
> > +	/*
> > +	 * Initialise connector status handling. First locate the furthest
> > +	 * bridges in the pipeline that support HPD and output detection. Then
> > +	 * initialise the connector polling mode, using HPD if available and
> > +	 * falling back to polling if supported. If neither HPD nor output
> > +	 * detection are available, we don't support hotplug detection at all.
> > +	 */
> > +	connector_type = DRM_MODE_CONNECTOR_Unknown;
> > +	drm_for_each_bridge_in_chain(encoder, bridge) {
> > +		if (bridge->interlace_allowed)
> > +			connector->interlace_allowed = false;
> 
> This doesn't work on Beagle-xM's venc output.
> 
> The above test should be !bridge->interlace_allowed.

I wonder how this passed my tests :-S I'll fix it in v6.

> But that doesn't solve it fully. We have VENC and display-connector as bridges in the beagle's VENC 
> output path. Only VENC is marked as interlace_allowed.
> 
> Setting "conn->bridge.interlace_allowed = true;" in display_connector_probe got the VENC output 
> working. But what's the correct fix here? set interlace_allowed based on connector type?

All the supported connector types (Composite, DVII, HDMIA, SVIDEO and
VGA) support interlaced modes, so I think we can just set the flag
unconditionally.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
