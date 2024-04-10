Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6648A0377
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 00:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B9510F923;
	Wed, 10 Apr 2024 22:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N0ap8LXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC4410FFA0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 22:36:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dynamic-095-117-103-138.95.117.pool.telefonica.de [95.117.103.138])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FAE9673;
 Thu, 11 Apr 2024 00:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1712788547;
 bh=koaH8Xn+/YPuIpTP7xQmr6xBWwY0n0cmfs8t/FkmPWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N0ap8LXNzv3yShT5lXGhx1UIDnzdTyj+eS06abpdetHFpSd1hiMDvvuPxeq1G1tWe
 MIMyBANrKbiKKAFw0/brjIllwnaK3+DwW4hq+1OgDQiHSHXa5JpQbcB+3gDQzjOQc1
 z0L6L/6+PxID1E2zwcT5gQ11+0looPskhnuPW9iA=
Date: Thu, 11 Apr 2024 01:36:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 20/21] drm/rcar-du: Allow build with COMPILE_TEST=y
Message-ID: <20240410223620.GD23594@pendragon.ideasonboard.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-21-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-21-ville.syrjala@linux.intel.com>
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

Hi Ville,

Thank you for the patch.

On Mon, Apr 08, 2024 at 08:04:25PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow rcar-du to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 2dc739db2ba3..df8b08b1e537 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_RCAR_DU
>  	tristate "DRM Support for R-Car Display Unit"
>  	depends on DRM && OF
> -	depends on ARM || ARM64
> +	depends on ARM || ARM64 || COMPILE_TEST

I'll trust 0-day to tell us if this causes any issue on exotic (from the
R-Car DU driver's point of view) platforms.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I expect you to push this patch, please let me know if you don't intend
to.

>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER

-- 
Regards,

Laurent Pinchart
