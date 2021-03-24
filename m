Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91205347B2B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB546EA0C;
	Wed, 24 Mar 2021 14:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D516EA0C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:53:07 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lP4sX-0000qF-Gw; Wed, 24 Mar 2021 15:53:01 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 3/6] drm/rockchip: dsi: add ability to work as a phy
 instead of full dsi
Date: Wed, 24 Mar 2021 15:52:59 +0100
Message-ID: <12741091.uLZWGnKmhe@diego>
In-Reply-To: <d7b8137c-66ce-935a-c8d7-e507146143d7@collabora.com>
References: <20210210111020.2476369-1-heiko@sntech.de>
 <20210210111020.2476369-4-heiko@sntech.de>
 <d7b8137c-66ce-935a-c8d7-e507146143d7@collabora.com>
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 sebastian.fricke@posteo.net, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 15. Februar 2021, 15:33:19 CET schrieb Helen Koike:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> > index cb25c0e8fc9b..3094d4533ad6 100644
> > --- a/drivers/gpu/drm/rockchip/Kconfig
> > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > @@ -9,6 +9,8 @@ config DRM_ROCKCHIP
> >   	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> >   	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
> >   	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> > +	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
> > +	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
> 
> maybe alphabetical order?

ok

> > +static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
> > +{
> > +	struct dw_mipi_dsi_rockchip *dsi = phy_get_drvdata(phy);
> > +	int i, ret;
> 
> It seems "i" could be removed, use ret instead.

I don't think so

I.e. the driver does

	i = max_mbps_to_parameter(...)
	...
	ret = power-on-clocks-and-stuff
	...
	dw_mipi_dsi_phy_write(.... dppa_map[i].hsfreqrange)

So will need to keep the param index separate.


> In general, the patch doesn't look wrong to me.
> 
> For the whole serie:
> Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks a lot :-)


Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
