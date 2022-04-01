Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467494EFA16
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB4410E064;
	Fri,  1 Apr 2022 18:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3D810E064
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:46:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 267B92F7;
 Fri,  1 Apr 2022 20:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648838811;
 bh=mNlNcLyaRH4wYjkRuqWtBfrIo+KP8oglcyP0u3JFtA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=feXQA+ztvtVcO7RLNlg4/T56zl1EIR0l3mbiWfphxCjlFKG2//PNFY4f7dSByd9TL
 tDmXmn+mAp6Idb7FqXB1v0j4oOpuvF+fkt3dnpQnZj/Lpho4gxEtl/iy9nYxmsKDSS
 yJCDfcU2fy4qO9Gf1UqvsfzAG65wSKKNfNNI7ILE=
Date: Fri, 1 Apr 2022 21:46:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
Message-ID: <YkdImJRIRkaqeGDl@pendragon.ideasonboard.com>
References: <20220401163755.302548-1-marex@denx.de>
 <20220401163755.302548-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401163755.302548-2-marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Fri, Apr 01, 2022 at 06:37:54PM +0200, Marek Vasut wrote:
> Make the width-mm/height-mm panel properties mandatory in
> of_get_drm_panel_display_mode(), print error message and
> return -ve in case these DT properties are not present.
> This is needed to correctly report panel dimensions.

Can we guarantee this won't cause a regression ?

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_modes.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 3f819c7a021b..45dc2d5c3ea6 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -761,12 +761,16 @@ int of_get_drm_panel_display_mode(struct device_node *np,
>  		drm_bus_flags_from_videomode(&vm, bus_flags);
>  
>  	ret = of_property_read_u32(np, "width-mm", &width_mm);
> -	if (ret && ret != -EINVAL)
> +	if (ret < 0) {
> +		pr_err("%pOF: invalid or missing width-mm DT property\n", np);
>  		return ret;
> +	}
>  
>  	ret = of_property_read_u32(np, "height-mm", &height_mm);
> -	if (ret && ret != -EINVAL)
> +	if (ret < 0) {
> +		pr_err("%pOF: invalid or missing height-mm DT property\n", np);
>  		return ret;
> +	}
>  
>  	dmode->width_mm = width_mm;
>  	dmode->height_mm = height_mm;

-- 
Regards,

Laurent Pinchart
