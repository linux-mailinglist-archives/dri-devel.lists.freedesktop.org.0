Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88443BDA1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 01:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0DD6E4CA;
	Tue, 26 Oct 2021 23:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847DD6E4CA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:08:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B9B0A24;
 Wed, 27 Oct 2021 01:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635289728;
 bh=sFnKz5DtEFUq5qfMzQgCabdLelQTcznSum5JniYZDfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WUEDZLANeJ4AGFP/B+NkliDMyPAkI/hKa9iiGmCIwY2ah8F0+tNGZjDfZBRHx1uKf
 /W+m2gsSClJfHZ+LPwPRvkXINSfITEhBwQTPMZZRQjDcRUOyhCgDJXyaasu9ryPMPn
 9M0G7Xwc23LL/aN8qekRvuLl/7q2F/53doZj4mj8=
Date: Wed, 27 Oct 2021 02:08:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: robert.foss@linaro.org, narmstrong@baylibre.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jagan@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: bridge: fix unmet dependency on DRM_KMS_HELPER
 for DRM_PANEL_BRIDGE
Message-ID: <YXiKaQTCcQIS/+4y@pendragon.ideasonboard.com>
References: <20211026023638.41646-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211026023638.41646-1-julianbraha@gmail.com>
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

Hi Julian,

Thank you for the patch.

On Mon, Oct 25, 2021 at 10:36:38PM -0400, Julian Braha wrote:
> When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
> Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
>   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
>   Selected by [y]:
>   - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]
> 
> This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
> without depending on or selecting DRM_KMS_HELPER,
> despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.
> 
> This unmet dependency bug was detected by Kismet,
> a static analysis tool for Kconfig.
> Please advise if this is not the appropriate solution.
> 
> v2:
> - changed from "select" to "depends on"
> 
> Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 431b6e12a81f..a630cb8fd1c8 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -30,6 +30,7 @@ config DRM_CDNS_DSI
>  config DRM_CHIPONE_ICN6211
>  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>  	depends on OF
> +  depends on DRM_KMS_HELPER

With spaces replaced by tabs for indentation,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	select DRM_MIPI_DSI
>  	select DRM_PANEL_BRIDGE
>  	help

-- 
Regards,

Laurent Pinchart
