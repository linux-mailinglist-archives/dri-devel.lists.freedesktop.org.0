Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393636767E2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 18:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6C410E04C;
	Sat, 21 Jan 2023 17:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885B010E04C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=EUyECha8HaxVxgq1F1KoFMr1DGt4Ij3T1L3mz8LljAM=; b=1MAQ0
 3rGGQF+HQYx+iCsXN4SYOL1zEHCSG4P0IMdvNTbjw/ou4gvoaCnWEAf7Ii1Xqjrj2CxtM0KAa0qtO
 6xzlg7iPuMMlh4GDH2X8oIOEfg1R0qjdAQtqAKxvnFWxl35Jgyfur1jFsBeiBSv1e523z8ERWsDHk
 0xs7/I2CiPAjoBzo+QjTXQnIjvrEar62l3ifB6KZ9VbKEIJWwGkm2sEULdLyFY4asptqb0F+zoK9A
 hez1cbWN3HmBCfjbqPAJFvbGTnvvzapYWS9J0gPoCCwyNkvhd1Er7UCUB+OVTj9ost81ArzpfJ+dt
 t37w7Tr11kn6TjSQj9hQj+rjsFfOA==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pJI8A-0004Ik-P2;
 Sat, 21 Jan 2023 17:58:18 +0000
Date: Sat, 21 Jan 2023 17:58:11 +0000
From: John Keeping <john@metanate.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/bridge: panel: Set orientation on panel_bridge
 connector
Message-ID: <Y8wnswk++tvr9xMe@donbot>
References: <20230120114313.2087015-1-john@metanate.com>
 <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
 <Y8uo7vIcQ6caH9pu@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8uo7vIcQ6caH9pu@ravnborg.org>
X-Authenticated: YES
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam & Doug,

On Sat, Jan 21, 2023 at 09:57:18AM +0100, Sam Ravnborg wrote:
> On Fri, Jan 20, 2023 at 01:44:38PM -0800, Doug Anderson wrote:
> > On Fri, Jan 20, 2023 at 3:43 AM John Keeping <john@metanate.com> wrote:
> > >
> > > Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> > > it") added a helper to set the panel panel orientation early but only
> > > connected this for drm_bridge_connector, which constructs a panel bridge
> > > with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
> > >
> > > When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> > > panel_bridge creates its own connector the orientation is not set unless
> > > the panel does it in .get_modes which is too late and leads to a warning
> > > splat from __drm_mode_object_add() because the device is already
> > > registered.
> > >
> > > Call the necessary function to set add the orientation property when the
> > > connector is created so that it is available before the device is
> > > registered.
> > 
> > I have no huge objection to your patch and it looks OK to me. That
> > being said, my understanding is that:
> > 
> > 1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
> > flag is "deprecated".
> Correct.
> Could we take a look at how much is required to move the relevant driver
> to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
>
> If this is too much work now we may land this simple patch, but the
> preference is to move all drivers to the new bridge handling and thus
> asking display drivers to create the connector.
> 
> What display driver are we dealing with here?

This is dw-mipi-dsi-rockchip which uses the component path in
dw-mipi-dsi (and, in fact, is the only driver using that mode of
dw-mipi-dsi).

I'm not familiar enough with DRM to say whether it's easy to convert to
DRM_BRIDGE_ATTACH_NO_CONNECTOR - should dw-mipi-dsi-rockchip be moving
to use dw-mipi-dsi as a bridge driver or should dw_mipi_dsi_bind() have
a drm_bridge_attach_flags argument?  But I'm happy to test patches if it
looks easy to convert to you :-)


John
