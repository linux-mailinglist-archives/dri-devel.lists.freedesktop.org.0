Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABA426BCA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75416E069;
	Fri,  8 Oct 2021 13:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80006E069
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 13:37:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92F2DFD7;
 Fri,  8 Oct 2021 15:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633700232;
 bh=uKvqAFBYYAnwEH/sA4mAtnYEI6aUG+bpw4ygKmU6L54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqXAqER0oYxNVo+e5UFxZ00Z9DTXOD/lOEN8A84JQVWf9ldS2DQ+dkrlXoKmoFXP0
 t82BpRZevpuBPCsEKd4mwnNwKhd53aa6l8emaVzJZwYJav9c9mIraFzN/GmoqhUafV
 xXf+qXQ/dyurasws7LuEYUKFp8xtb1Sg5okhL3XM=
Date: Fri, 8 Oct 2021 16:37:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: DSI Bridge switching
Message-ID: <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
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

Hello,

On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> Hi,
> 
> Removed my invalid email (I will update files next week).
> 
> On 08.10.2021 13:14, Jagan Teki wrote:
> > Hi,
> > 
> > I think this seems to be a known use case for industrial these days with i.mx8m.
> > 
> > The host DSI would configure with two bridges one for DSI to LVDS
> > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > can use only one bridge at a time as host DSI support single out port.
> > So we can have two separate device tree files for LVDS and HDMI and
> > load them static.
> > 
> > But, one of the use cases is to support both of them in single dts, and
> > - Turn On LVDS (default)
> > - Turn Off LVDS then Turn On HDMI when cable plug-in
> 
> Are you sure it will work from hardware PoV? Do you have some demuxer? 
> isolation of pins?

It may be in the category of "you shouldn't do this, but it actually
works". I've seen the same being done with two CSI-2 camera sensors
connected to the same receiver, with one of them being held in reset at
all times.

> > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> > 
> > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > port 2 in the DSI host node, and trying to attach the respective
> > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > based on the HDMI-INT.
> 
> I think more appropriate would be to share the same port, but provide 
> two endpoints inside this port - we have two hardware sharing the same 
> physical port.

That sounds like the correct DT description to me.

> > Can it be possible to do bridge attachment at runtime? something like
> > a bridge hotplug event? or any other possible solutions?
> > 
> > Any suggestions?
> 
> Practically it is possible, see exynos_dsi + panels, or exynos_dsi + 
> some toshiba bridge - panel and bridge are dynamically 'plugged' and 
> 'unplugged' from exynos_drm, but they do not use bridge chain for this 
> and some other reasons. (un|re|)plugging should be performed of course 
> when pipeline is off (connector disconnected). I am not sure about 
> bridges added to bridge chain - you need to inspect all opses to ensure 
> it can be done safely.
> 
> And the main issue: Daniel does not like it :)

Neither do I :-) Could it be handled with two DRM connectors that are
mutually exclusive ?

-- 
Regards,

Laurent Pinchart
