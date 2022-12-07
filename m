Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A581645443
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 07:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E926F10E35D;
	Wed,  7 Dec 2022 06:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEA910E35C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 06:51:39 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1p2oHE-0006zz-L7; Wed, 07 Dec 2022 07:51:32 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1p2oHD-0000Bu-FU; Wed, 07 Dec 2022 07:51:31 +0100
Date: Wed, 7 Dec 2022 07:51:31 +0100
From: Sascha Hauer <sha@pengutronix.de>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 4/5] drm/rockchip: vop2: add support for the rgb output
 block
Message-ID: <20221207065131.GW29728@pengutronix.de>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
 <20221130140217.3196414-5-michael.riesch@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130140217.3196414-5-michael.riesch@wolfvision.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 03:02:16PM +0100, Michael Riesch wrote:
> The Rockchip VOP2 features an internal RGB output block, which can be
> attached to the video port 2 of the VOP2. Add support for this output
> block.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 94fddbf70ff6..16041c79d228 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -39,6 +39,7 @@
>  #include "rockchip_drm_gem.h"
>  #include "rockchip_drm_fb.h"
>  #include "rockchip_drm_vop2.h"
> +#include "rockchip_rgb.h"
>  
>  /*
>   * VOP2 architecture
> @@ -212,6 +213,9 @@ struct vop2 {
>  	struct clk *hclk;
>  	struct clk *aclk;
>  
> +	/* optional internal rgb encoder */
> +	struct rockchip_rgb *rgb;
> +
>  	/* must be put at the end of the struct */
>  	struct vop2_win win[];
>  };
> @@ -2697,11 +2701,25 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> +	vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[2].crtc, vop2->drm, 2);

Here you assume that the RGB output can only be connected to VP2, but it
could be connected to any other VP as well, and we can find the
description where it actually shall be connected in the device tree.

As mentioned in my comment to patch 1, the question is "Is there
something connected to VPx at endpoint ROCKCHIP_VOP2_EP_RGB0?"

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
