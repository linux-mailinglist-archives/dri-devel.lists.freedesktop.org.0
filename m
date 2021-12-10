Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07E46FE3F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 10:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977510E3D6;
	Fri, 10 Dec 2021 09:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB93710E3D6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 09:55:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78A44B823BC;
 Fri, 10 Dec 2021 09:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F8DC341C8;
 Fri, 10 Dec 2021 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639130121;
 bh=dTWmHw0aiFAZ/D/gliRdCRkGlRhvUl1LgpPrJMOMQ9k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=AvrmOsj+CQalgcUlbaZ1i0xgKLJZaKA6+JzY80G3jc/Mi8aU+eVgEhJ6pGSli/2tS
 M/KEh/g7LDJW4f/YZNFRULAJklYYPeKPMKksFDbO5ci+1uqRm7JG+8XLlgh5r5szlP
 fgUsCjciTFKZ5W9C58+ICnjTMrOSooFzJSSmuvb/KvZOSW47FuZjDc//EcKjbmKGkI
 JZqqYhwPxOSrDcMIVW1ukdx+wI4xIBgjNljT+F+yBPSV7DWp6tjT2PDgdLVFgYZ7AO
 YWqzYpSIJRZN6cH10SuEMZRpb0zPMNGXMd/RXukiWN/oTuo5b+3H9AXMJ0AXHLFRPh
 cVmLI9E7sbg7Q==
Message-ID: <a2c1d56378748b037a8d62dcc2934c4f8eabf5b2.camel@kernel.org>
Subject: Re: [PATCH v2 3/3] drm/vc4: Notify the firmware when DRM is in charge
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>,  Florian Fainelli <f.fainelli@gmail.com>, Daniel
 Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Date: Fri, 10 Dec 2021 10:55:12 +0100
In-Reply-To: <20211203135126.700165-4-maxime@cerno.tech>
References: <20211203135126.700165-1-maxime@cerno.tech>
 <20211203135126.700165-4-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, 2021-12-03 at 14:51 +0100, Maxime Ripard wrote:
> Once the call to drm_fb_helper_remove_conflicting_framebuffers() has
> been made, simplefb has been unregistered and the KMS driver is entirely
> in charge of the display.
> 
> Thus, we can notify the firmware it can free whatever resource it was
> using to maintain simplefb functional.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 8ab89f805826..38d55a47c831 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -37,6 +37,8 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_vblank.h>
>  
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
>  #include "uapi/drm/vc4_drm.h"
>  
>  #include "vc4_drv.h"
> @@ -251,10 +253,27 @@ static int vc4_drm_bind(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
> +	if (node) {
> +		vc4->firmware = devm_rpi_firmware_get(dev, node);

I'm really sorry for contradicting myself, but I think it makes more sense to
do rpi_firmware_get() here...

> +		of_node_put(node);
> +
> +		if (!vc4->firmware)
> +			return -EPROBE_DEFER;
> +	}
> +
>  	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
>  	if (ret)
>  		return ret;
>  
> +	if (vc4->firmware) {
> +		ret = rpi_firmware_property(vc4->firmware,
> +					    RPI_FIRMWARE_NOTIFY_DISPLAY_DONE,
> +					    NULL, 0);
> +		if (ret)
> +			drm_warn(drm, "Couldn't stop firmware display driver: %d\n", ret);
> +	}
> +

...and rpi_firmware_put() here. IIUC after this the fw handle isn't needed
anymore.

Other than that, the series looks fine to me.

Regards,
Nicolas
