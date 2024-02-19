Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D559D85AC25
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 20:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D26A10E042;
	Mon, 19 Feb 2024 19:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="JVt1ocNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50910E042
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708371564; bh=eYJcncYVMz2/P+8L4YuElamp9/gwH5EEjsU0YmeUEy4=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=JVt1ocNFUSrQEY5yZpav/AneRAxvrc0MRJokvqgkTVvWnzpX0EiEb1/bIAm8kdgJL
 uPdGB9eJCG9pCCAUd4Qb3YPdsImVA5coUlQZe1Gf+3YAJv2Dm8W6DpHOh9dVd5pgux
 9mdnhFla+wGVTifBvj3mjQfM9APNzqEgk+ZMO/DA=
Date: Mon, 19 Feb 2024 20:39:23 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] drm: rockchip: Don't require MIPI DSI device when it's
 used for ISP
Message-ID: <65qkkf7baecbcnemtabzup2nupd63obz4ewrhruk5frl2t3hwv@eqxm3tzgqcv6>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240217183941.1752463-1-megi@xff.cz>
 <4c66c084-5af6-43fb-a256-4746b2e00192@rock-chips.com>
 <bsc3lpdxvhy3ss2uja4do3jwvj43zbs7zhx4bzs2tryrakn7be@pt2qsyvryk73>
 <7044f324-5a45-4a4c-a15e-86614e53acf0@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7044f324-5a45-4a4c-a15e-86614e53acf0@rock-chips.com>
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

On Mon, Feb 19, 2024 at 11:02:01AM +0800, Andy Yan wrote:
> Hi Ondrej:
> 
> On 2/18/24 23:17, Ondřej Jirman wrote:
> > Hi Andy,
> > 
> > On Sun, Feb 18, 2024 at 07:14:56PM +0800, Andy Yan wrote:
> > > Hi,
> > > 
> > > On 2/18/24 02:39, Ondřej Jirman wrote:
> > > > From: Ondrej Jirman <megi@xff.cz>
> > > > 
> > > > On RK3399 one MIPI DSI device can be alternatively used with the ISP1,
> > > > to provide RX DPHY. When this is the case (ISP1 is enabled in device
> > > > tree), probe success of DRM is tied to probe success of ISP1 connected
> > > > camera sensor. This can fail if the user is able to killswitch the camera
> > > > power, like on Pinephone Pro.
> > > > 
> > > > Detect use of MIPI DSI controller by ISP, and don't include it in
> > > > component match list in that case.
> > > > 
> > > 
> > > Isn't this supposed to be taken care of within the dts?
> > > Since DPHY1 should exclusively used by MIPI DSI1 and ISP1, then if
> > > a device want to use ISP1, the DSI1 should be disabled in dts.
> > 
> > DSI1 can't be disabled, because it provides PHY device for ISP1 in this
> > scenario.
> > 
> > The problem is that in this scenario DRM keeps waiting for DSI1 device,
> > despite it just being used for PHY for ISP1 and not as a component for
> > rockchip DRM driver.
> 
> 
> Oh, get it.
> With a quick look, seems that Heiko has already take this scenario into consideration
> when add PHY function in the dsi drivers[0]
> Does this mean the current drivers does not work as expected?

It didn't work anymore since some fw devlink changes that were added some
time after 2021. But it might have got resolved since than.

So please ignore this patch for now.

kind regards,
	o.

> [0]https://patchwork.freedesktop.org/patch/420386/
> > 
> > See:
> > 
> >          isp1: isp1@ff920000 {
> >                  compatible = "rockchip,rk3399-cif-isp";
> >                  reg = <0x0 0xff920000 0x0 0x4000>;
> >                  interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH 0>;
> >                  clocks = <&cru SCLK_ISP1>,
> >                           <&cru ACLK_ISP1_WRAPPER>,
> >                           <&cru HCLK_ISP1_WRAPPER>;
> >                  clock-names = "isp", "aclk", "hclk";
> >                  iommus = <&isp1_mmu>;
> >                  phys = <&mipi_dsi1>;  <---------
> >                  phy-names = "dphy";
> >                  power-domains = <&power RK3399_PD_ISP1>;
> >                  status = "disabled";
> > 
> > If mipi_dsi1 is disabled, isp1 will never probe.
> > 
> > It's a consequence of this special dual use of mipi_dsi1.
> > 
> > kind regards,
> > 	o.
> > 
> > > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > > ---
> > > >    drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 47 +++++++++++++++++++++
> > > >    1 file changed, 47 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> > > > index ab55d7132550..f47de94ad576 100644
> > > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> > > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> > > > @@ -354,6 +354,43 @@ static void rockchip_drm_match_remove(struct device *dev)
> > > >    		device_link_del(link);
> > > >    }
> > > > +/*
> > > > + * Check if ISP block linked to a mipi-dsi device via phys phandle is
> > > > + * enabled in device tree.
> > > > + */
> > > > +static bool rockchip_drm_is_mipi1_and_used_by_isp(struct device *dev)
> > > > +{
> > > > +	struct device_node *np = NULL, *phy_np;
> > > > +
> > > > +	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3399-mipi-dsi"))
> > > > +		return false;
> > > > +
> > > > +	while (true) {
> > > > +		np = of_find_compatible_node(np, NULL, "rockchip,rk3399-cif-isp");
> > > > +		if (!np)
> > > > +			break;
> > > > +
> > > > +		if (!of_device_is_available(np)) {
> > > > +			of_node_put(np);
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		phy_np = of_parse_phandle(np, "phys", 0);
> > > > +		if (!phy_np) {
> > > > +			of_node_put(np);
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		of_node_put(phy_np);
> > > > +		of_node_put(np);
> > > > +
> > > > +		if (phy_np == dev->of_node)
> > > > +			return true;
> > > > +	}
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > >    static struct component_match *rockchip_drm_match_add(struct device *dev)
> > > >    {
> > > >    	struct component_match *match = NULL;
> > > > @@ -371,6 +408,16 @@ static struct component_match *rockchip_drm_match_add(struct device *dev)
> > > >    			if (!d)
> > > >    				break;
> > > > +			/*
> > > > +			 * If mipi1 is connected to ISP, we don't want to wait for mipi1 component,
> > > > +			 * because it will not be used by DRM anyway, to not tie success of camera
> > > > +			 * driver probe to display pipeline initialization.
> > > > +			 */
> > > > +			if (rockchip_drm_is_mipi1_and_used_by_isp(d)) {
> > > > +				dev_info(d, "used by ISP1, skipping from DRM\n");
> > > > +				continue;
> > > > +			}
> > > > +
> > > >    			device_link_add(dev, d, DL_FLAG_STATELESS);
> > > >    			component_match_add(dev, &match, component_compare_dev, d);
> > > >    		} while (true);
