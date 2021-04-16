Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C485361EA3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 13:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC4A6E0AB;
	Fri, 16 Apr 2021 11:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from the.earth.li (the.earth.li
 [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A056F6E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
 s=the; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RJbwMca3HWTPhpw7xIW9Qq7e+WzukTXRdxw66YuQufo=; b=aUGBP3d/qfBQUdtvaDMKYuBTvz
 slWpKMc7ouKXgcXYzKeggC9IZ6HPyJoZWUxeHaIKrCmWn411wmMts/6786gOuSsUKQ8wST2uJh5XY
 6i/8izHDInpAl/5Z+ZQJNoO+M4n4WSSSVvKsJeaQCca2mzgY3+m2lIRUtErZHhzLFU4eBFKJ8IPvI
 mePo2K407iV7UCCJ8LglNCB2kHe+N370JaeETmGqM01hzEsGSQBRuLQeEP/WGngqYU7qLD6q7Tmpq
 RIA6BJ0K9QnYOEXU4MAFCSHZ+m92f0GSJqQ06xdtDYj47SJrvfOykBAacmTiDEMY7tzjmMAuafV6U
 fBsmCN4Q==;
Received: from noodles by the.earth.li with local (Exim 4.92)
 (envelope-from <noodles@earth.li>)
 id 1lXMfk-0003r3-Hf; Fri, 16 Apr 2021 12:30:04 +0100
Date: Fri, 16 Apr 2021 12:30:04 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] drm/rockchip: Cope with endpoints that haven't been
 registered yet
Message-ID: <20210416113004.GW11733@earth.li>
References: <20210316182753.GA25685@earth.li>
 <3104631.44csPzL39Z@phil>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3104631.44csPzL39Z@phil>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 07:58:13PM +0100, Heiko Stuebner wrote:
> Am Dienstag, 16. M=E4rz 2021, 19:27:53 CET schrieb Jonathan McDowell:
> > The Rockchip RGB CRTC output driver attempts to avoid probing Rockchip
> > subdrivers to see if they're a connected panel or bridge. However part
> > of its checks assumes that if no OF platform device is found then it
> > can't be a valid bridge or panel. This causes issues with I2C controlled
> > bridges that have not yet been registered to the point they can be
> > found.
> > =

> > Change this to return EPROBE_DEFER instead of ENODEV and don't ignore
> > such devices. The subsequent call to drm_of_find_panel_or_bridge() will
> > return EPROBE_DEFER as well if there's actually a valid device we should
> > wait for.
> > =

> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 8 ++++++--
> >  drivers/gpu/drm/rockchip/rockchip_rgb.c     | 7 ++++---
> >  2 files changed, 10 insertions(+), 5 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_drv.c
> > index 212bd87c0c4a..b0d63a566501 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> > @@ -270,11 +270,15 @@ int rockchip_drm_endpoint_is_subdriver(struct dev=
ice_node *ep)
> >  	if (!node)
> >  		return -ENODEV;
> >  =

> > -	/* status disabled will prevent creation of platform-devices */
> > +	/*
> > +	 * status disabled will prevent creation of platform-devices,
> > +	 * but equally we can't rely on the driver having been registered
> > +	 * yet (e.g. I2C bridges).
> > +	 */
> >  	pdev =3D of_find_device_by_node(node);
> >  	of_node_put(node);
> >  	if (!pdev)
> > -		return -ENODEV;
> > +		return -EPROBE_DEFER;
> =

> In general, how does that relate to i2c-bridge-drivers, as
> of_find_device_by_node supposedly only acts on platform-devices?

I think the problem here is that not finding the device node means we
return an error here, which means it's not actually possible to attach
an i2c bridge driver to the Rockchip RGB interface at present.

> Also if that points to a disabled bridge (hdmi, etc) that would likely ma=
ke
> it probe-defer indefinitly, as that device will never become available?
> =

> Maybe we could do something like of_device_is_available() which checks
> the status property of the node. So something like:
> =

>   	pdev =3D of_find_device_by_node(node);
>   	if (!pdev) {
> 		bool avail =3D of_device_is_available(node);
> =

> 		of_node_put(node);
> =

> 		/* if disabled
> 		if (!avail)
> 			return -ENODEV;
> 		else
> 			return -EPROBE_DEFER;
> 	}
>   	of_node_put(node);
> =

> Though I still do not understand how that should actually pick up on
> i2c devices at all.

of_find_device_by_node will fail here, as it's not a platform device,
but then of_device_is_available should return true so I think I can
actually just return false here rather than EPROBE_DEFER - because if
it's not a platform device then it's not a subdriver, which is what
we're checking for.

I'll re-roll and test this weekend and post an updated revision. Thanks
for the pointers.

J.

-- =

101 things you can't have too much of : 3 - Sleep.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
