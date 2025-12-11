Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEE6CB7021
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDAD10E88A;
	Thu, 11 Dec 2025 19:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="feWQ4ol9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C505E10E880;
 Thu, 11 Dec 2025 19:34:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765481674; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MwjgXBnXqK18XXkGa3a6e9Qdh9TIDi+xNGa5kXnDzxcdfF+vG0I9dZbWWYKf5kRC+CB+zmQ/1r/w7uPfbJfUYmlXFctj/T1Qm28DNJYVEHwf0/ImdfWTCu8RH+8fh1OuLfdX5MIQzhNsHI72NXO3CXZ//ljv/vpA19CC6Hyr/pk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765481674;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7XRUtI+QxU6iyAK2usjohbrvCxCey3JhTGZn46qI+IU=; 
 b=fNLz+4NE1pGzZpls9AtDmDAeUypjb2E7JL/KkXv3hribew1ZY1J9dXpqM9j5dPc2c540c/soMSvZOvdanO8/cRwgp5JV4U2tQyCQ+3R5V4ORuMJ0r07OrDGUS6eNUsI8bmGq7cXFsQjchFKJr7Y7cVvQO0RiDHdTDnFF2lUKwLw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765481674; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=7XRUtI+QxU6iyAK2usjohbrvCxCey3JhTGZn46qI+IU=;
 b=feWQ4ol9hxW3laEbiMw/pR1N+JzuXT4ETgf4NLL9Qdn6UWhnCa5sJSOZlrfvt7/n
 roctf8qN0xpkwAgPG+AuWn+E9N+EDla/lx41XL6Q75cN0hL1NnztURG61wRuU8NMpjr
 XqAff6P4Rk6arMJHY8d5HBXMWdQXv6sW2dhLLNJ8=
Received: by mx.zohomail.com with SMTPS id 1765481672796637.9713383571778;
 Thu, 11 Dec 2025 11:34:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 04/17] drm/bridge: Act on the DRM color format property
Date: Thu, 11 Dec 2025 20:34:22 +0100
Message-ID: <3772903.e9J7NaK4W3@workhorse>
In-Reply-To: <20251209-smart-oarfish-of-wind-0c1c8b@houat>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-4-63e82f1db1e1@collabora.com>
 <20251209-smart-oarfish-of-wind-0c1c8b@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 9 December 2025 15:27:28 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Fri, Nov 28, 2025 at 10:05:40PM +0100, Nicolas Frattaroli wrote:
> > The new DRM color format property allows userspace to request a specific
> > color format on a connector. In turn, this fills the connector state's
> > color_format member to switch color formats.
> > 
> > Make drm_bridges consider the color_format set in the connector state
> > during the atomic bridge check. Specifically, reject any output bus
> > formats that do not correspond to the requested color format.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 8f355df883d8..8aac9747f35e 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1052,6 +1052,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  	return ret;
> >  }
> >  
> > +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_color_format fmt)
> > +{
> > +	if (fmt == DRM_COLOR_FORMAT_AUTO)
> > +		return true;
> > +
> > +	switch (bus_fmt) {
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		return true;
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > +		return fmt == DRM_COLOR_FORMAT_RGB444;
> > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > +		return fmt == DRM_COLOR_FORMAT_YCBCR444;
> > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > +		return fmt == DRM_COLOR_FORMAT_YCBCR422;
> > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > +		return fmt == DRM_COLOR_FORMAT_YCBCR420;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >  /*
> >   * This function is called by &drm_atomic_bridge_chain_check() just before
> >   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> > @@ -1137,6 +1178,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >  	}
> >  
> >  	for (i = 0; i < num_out_bus_fmts; i++) {
> > +		if (!bus_format_is_color_fmt(out_bus_fmts[i], conn_state->color_format)) {
> > +			ret = -ENOTSUPP;
> > +			continue;
> > +		}
> 
> Sorry, I'm struggling a bit to understand how this would work if a bridge both supports the bus
> format selection and HDMI state helpers? Can you expand on it?

I have very little idea of whether this makes conceptual sense. The
hope is that by working backwards from the last bridge and only
accepting either fixed formats or something that corresponds to
the target color format, we don't claim that a setup can do a
colour format if the whole bridge chain isn't able to do it.

Of course, format conversions along the bridge chain where one
input format can be converted to a set of output formats by some
bridge will throw a massive wrench into this. And this is all
assuming that the bus format is in any way related to the color
format that will be sent out on the wire.

In practice, I don't have any hardware where whatever counts as
a "bridge" is an actually more involved setup than just the TX
controller. I tried looking into getting a board with one of the
supported DSI-to-HDMI bridge chips so I can at least test how it
would work in such a scenario, and I got one, but I'd need to make
my own flat flex PCB to adapt it to the pinout of my SBC's DSI
port.

So yeah I don't know how it's supposed to work, I just know this
works for the case I'm working with, and any more complex case
is literally unobtanium hardware which I'm not going to bother
blowing days on maybe making a cable for when I'm already touching
three different GPU drivers here and the intel-gfx-ci is screaming
into my inbox about vague failures in unrelated codepaths in its
native language, Klingon.

Which is all to say: is there a virtual drm bridge driver that
exists, where I can set what formats it supports on the input
and on the output, so that I can actually get a feel for how this
is conceptually supposed to work without needing special hardware?

Better yet: do you have a specific setup in mind where you know
this approach does not work?

> 
> Maxime
> 




