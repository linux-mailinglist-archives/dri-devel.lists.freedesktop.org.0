Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E8622D3F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 15:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3FC10E5D8;
	Wed,  9 Nov 2022 14:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF7B10E5D8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:12:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72203896;
 Wed,  9 Nov 2022 15:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668003118;
 bh=AffXHvdxCHZjAgL7Z9CuecNf9qFUAfZCnvn/pjOY1HI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ffO7kK8Rx6z7y+oG64svjLUW+zCTHx5u6OuAQWUNDNScvBrY+gsleyDUUKvX5cVlU
 MYt4pd0CSIBLUj/vKUJDjGj0sKb0upFIGDhRskNM1cu9kAqM/N32bDqJVdOAqDNy4V
 /xJCHiPiC2LrEHsSevkMndX19TGYcsZlQlCZ2C0w=
Date: Wed, 9 Nov 2022 16:11:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
Message-ID: <Y2u1G2OBMwlBjZ+8@pendragon.ideasonboard.com>
References: <20221018181828.19528-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221018181828.19528-1-rdunlap@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Thank you for the patch.

On Tue, Oct 18, 2022 at 11:18:28AM -0700, Randy Dunlap wrote:
> When CONFIG_DRM_RCAR_DU=y and CONFIG_DRM_RCAR_MIPI_DSI=m, calls
> from the builtin driver to the mipi driver fail due to linker
> errors.
> Since the RCAR_MIPI_DSI driver is not always required, fix the
> build error by making DRM_RCAR_DU optionally depend on the
> RCAR_MIPI_DSI Kconfig symbol. This prevents the problematic
> kconfig combination without requiring that RCAR_MIPI_DSI always
> be enabled.
> 
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> rcar_du_crtc.c:(.text+0x3a18): undefined reference to `rcar_mipi_dsi_pclk_enable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> rcar_du_crtc.c:(.text+0x47cc): undefined reference to `rcar_mipi_dsi_pclk_disable'

I've already posted a fix, see

https://lore.kernel.org/dri-devel/20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com/

It aligns with how the LVDS encoder driver is handled, so I would prefer
that. I will send a pull request shortly, as a v6.1 fix.

> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: LUU HOAI <hoai.luu.ub@renesas.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -4,6 +4,7 @@ config DRM_RCAR_DU
>  	depends on DRM && OF
>  	depends on ARM || ARM64
>  	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=n
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select VIDEOMODE_HELPERS

-- 
Regards,

Laurent Pinchart
