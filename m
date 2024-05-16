Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B328C7597
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140CB10E6E4;
	Thu, 16 May 2024 12:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="baUf73iz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8810E6E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:05:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43994327;
 Thu, 16 May 2024 14:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715861098;
 bh=IXQl1Ir2eCpl/tztd4C+Y8VsP94NsB4rmj7IRBHnvZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=baUf73iziANfW3jJ06dxbk3jmZrVvaUUSw90ypx0XKvumQsx5h3on7yDyzWVw/HsY
 bHc8SpMAhIXgGzicQ1veuytxgUmEiY2tZomKL4/QLWv6+auyy3juk9sTbrXHz73FQk
 NbxbiXjZZDfp4cQq8oCuFmWZ6HgH/iKPrBGAT3N0=
Date: Thu, 16 May 2024 15:04:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 biju.das.jz@bp.renesas.com, aford173@gmail.com, bli@bang-olufsen.dk,
 robh@kernel.org, jani.nikula@intel.com
Subject: Re: drm/bridge: adv7511: Attach next bridge without creating connector
Message-ID: <20240516120458.GC6640@pendragon.ideasonboard.com>
References: <20240513080243.3952292-1-victor.liu@nxp.com>
 <4b6e49ee-d2fd-4e54-88d5-ab06d8ebf644@bosc.ac.cn>
 <20240514151211.GG32013@pendragon.ideasonboard.com>
 <83f4289d-3e73-49fb-9be4-93961d3e051b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83f4289d-3e73-49fb-9be4-93961d3e051b@linux.dev>
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

Hi Sui,

On Thu, May 16, 2024 at 12:13:03AM +0800, Sui Jingfeng wrote:
> On 5/14/24 23:12, Laurent Pinchart wrote:
> > On Tue, May 14, 2024 at 12:26:15AM +0800, Sui Jingfeng wrote:
> >> On 5/13/24 16:02, Liu Ying wrote:
> >>> The connector is created by either this ADV7511 bridge driver or
> >>> any DRM device driver/previous bridge driver, so this ADV7511
> >>> bridge driver should not let the next bridge driver create connector.
> >>>
> >>> If the next bridge is a HDMI connector, the next bridge driver
> >>> would fail to attach bridge from display_connector_attach() without
> >>> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> > 
> > In theory we could have another HDMI-to-something bridge connected to
> > the ADV7511 output, and that bridge could create a connector. However,
> > before commit 14b3cdbd0e5b the adv7511 driver didn't try to attach to
> > the next bridge, so it's clear that no platform support in mainline had
> > such a setup. It should be safe to set DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > unconditionally here.
> 
> But what if there is a drm bridge prior to adv7511 but after the KMS
> engine? Even though we are still safe if it doesn't create connector
> by obeying modern rule.

In the "old world", that bridge wouln't have created a connector,
because it would detect that there's a next bridge. With modern KMS
drivers, DRM_BRIDGE_ATTACH_NO_CONNECTOR is passed by the
drm_bridge_connector helper to the very first bridge when attaching to
it, so no bridge will create a connector. Modern bridge drivers should
not support the !DRM_BRIDGE_ATTACH_NO_CONNECTOR case at all, they should
not offer the option of creating a connector.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> >>>
> >>> Add that flag to drm_bridge_attach() function call in
> >>> adv7511_bridge_attach() to fix the issue.
> >>>
> >>> This fixes the issue where the HDMI connector bridge fails to attach
> >>> to the previous ADV7535 bridge on i.MX8MP EVK platform:
> >>>
> >>> [    2.216442] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /hdmi-connector to encoder None-37: -22
> >>> [    2.220675] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
> >>> [    2.226262] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/i2c@30a30000/hdmi@3d to encoder None-37: -22
> >>> [    2.245204] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c00000/dsi@32e60000 to encoder None-37: -22
> >>> [    2.256445] imx-lcdif 32e80000.display-controller: error -EINVAL: Failed to attach bridge for endpoint0
> >>> [    2.265850] imx-lcdif 32e80000.display-controller: error -EINVAL: Cannot connect bridge
> >>> [    2.274009] imx-lcdif 32e80000.display-controller: probe with driver imx-lcdif failed with error -22
> >>>
> >>> Fixes: 14b3cdbd0e5b ("drm/bridge: adv7511: make it honour next bridge in DT")
> >>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>> ---
> >>>    drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> index dd21b81bd28f..66ccb61e2a66 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> @@ -953,7 +953,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
> >>>    	int ret = 0;
> >>>    
> >>>    	if (adv->next_bridge) {
> >>> -		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
> >>> +		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge,
> >>> +					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>
> >> As a side note, I think, maybe you could do better in the future.
> >>
> >> If we know that the KMS display driver side has the HDMI connector
> >> already created for us, we should pass DRM_BRIDGE_ATTACH_NO_CONNECTOR
> >> from the root KMS driver side. Which is to forbidden all potential
> >> drm bridge drivers to create a connector in the middle.
> > 
> > That's the recommended way for new drivers. Using the
> > drm_bridge_connector helper handles all this for you.
> > 
> >> The KMS display driver side could parse the DT to know if there is
> >> a hdmi connector, or merely just hdmi connector device node, or
> >> something else.
> > 
> > No, that would violate the basic principle of not peeking into the DT of
> > devices you know nothing about. The display engine driver can't walk the
> > pipeline in DT and expect to understand all the DT nodes on the path,
> > and what their properties mean.
> 
> The (next) bridge at the remote port is not necessary a display bridge.
> Or it is a bridge from the perspective of hardware viewpoint, but under
> controlled by a more complex foreign driver which generic drm bridge
> driver has no authority to attach.
> 
> > What KMS drivers should do is to use the drm_bridge_connector helper.
> > Calling drm_bridge_connector_init() will create a connector for a chain
> > of bridges. The KMS driver should then attach to the first bridge with
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR, unconditionally.
> 
> OK, thanks for teaching us the modern way to use drm_bridge_connector
> helper, also thanks Ying for providing the patch.
> 
> >> However, other maintainer and/or reviewer's opinion are of cause
> >> more valuable. I send a A-b because I thought the bug is urgency
> >> and it's probably more important to solve this bug first. And
> >> maybe you can Cc: <stable@vger.kernel.org> if you like.
> >>
> >>>    		if (ret)
> >>>    			return ret;
> >>>    	}

-- 
Regards,

Laurent Pinchart
