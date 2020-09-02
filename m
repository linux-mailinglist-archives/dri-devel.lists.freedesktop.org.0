Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8325A22F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 02:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E2B6E0E6;
	Wed,  2 Sep 2020 00:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C352E6E0E6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 00:10:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07C1DAF2;
 Wed,  2 Sep 2020 02:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599005431;
 bh=T0Od6j/YUk8kL37bcHcehkenphDRsmOWADvKVd8tMCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4b7x/EOeZJlFBCgShmlvVyXdvsmYhRKg3LxXT23zS3bJC1WbCey8eOdoI66hpDHC
 xRXC6Q4wIatINWLCRpQYDiJZmUuEPRj9hxArv5rI28k4UHIxQyWYpa22Ds4Ls2fKAP
 GyQtUk21cZoUO0s0xJ5kYmxHxrFyD0xLAiTDwWUg=
Date: Wed, 2 Sep 2020 03:10:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 1/4] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Message-ID: <20200902001009.GC14351@pendragon.ideasonboard.com>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <6169dd15782627c8415583881fa94ba39c4f5221.1596101672.git-series.maxime@cerno.tech>
 <20200831202852.GU16155@pendragon.ideasonboard.com>
 <20200901132340.tahqsx3sknl47ile@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901132340.tahqsx3sknl47ile@gilmour.lan>
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

On Tue, Sep 01, 2020 at 03:23:40PM +0200, Maxime Ripard wrote:
> On Mon, Aug 31, 2020 at 11:28:52PM +0300, Laurent Pinchart wrote:
> > On Thu, Jul 30, 2020 at 11:35:01AM +0200, Maxime Ripard wrote:
> > > The drm_of_lvds_get_dual_link_pixel_order() function took so far the
> > > device_node of the two ports used together to make up a dual-link LVDS
> > > output.
> > > 
> > > This assumes that a binding would use an entire port for the LVDS output.
> > > However, some bindings have used endpoints instead and thus we need to
> > > operate at the endpoint level. Change slightly the arguments to allow that.
> > 
> > Is this still needed ? Unless I'm mistaken, the Allwinner platform now
> > uses two TCON instances for the two links, so there are two ports.
> 
> Yes, and no.
> 
> The two TCONs indeed have each a port of their own, so we do have two
> ports indeed. However, what we don't have is a port entirely dedicated
> to the LVDS output.
> 
> Our binding uses a single port for all its output (RGB, LVDS or TV/HDMI
> controllers) with different endpoints.

Good point. Then let's keep this patch :-) We can't fix existing
bindings, but for the future, let's model separate display outputs as
ports, not endpoints.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
