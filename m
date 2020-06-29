Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E651E20CD09
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 09:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33F89F8B;
	Mon, 29 Jun 2020 07:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3CB89F8B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 07:47:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 38B1820023;
 Mon, 29 Jun 2020 09:47:43 +0200 (CEST)
Date: Mon, 29 Jun 2020 09:47:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 3/3] drm/mipi: use dcs write for
 mipi_dsi_dcs_set_tear_scanline
Message-ID: <20200629074741.GD227119@ravnborg.org>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-3-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505160329.2976059-3-emil.l.velikov@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=8AirrxEcAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=Ikd4Dj_1AAAA:8 a=e5mUnYsNAAAA:8 a=9e2yZ1Ji3WqThZu7ar8A:9
 a=CjuIK1q_8ugA:10 a=9FcDW9RDOpcA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=ST-jHhOKWsTCqRlWije3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Robert Chiras <robert.chiras@nxp.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 05:03:29PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> The helper uses the MIPI_DCS_SET_TEAR_SCANLINE, although it's currently
> using the generic write. This does not look right.
> 
> Perhaps some platforms don't distinguish between the two writers?
> 
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Fixes: e83950816367 ("drm/dsi: Implement set tear scanline")
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> Robert, can you please test this against the only user - the Raydium
> RM67191 panel driver that you introduced.
> 
> Thanks
> 
> Vinay, can you confirm if this is a genuine typo or there's something
> really subtle happening.
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

The discussion did not reveal anything new. Followed the advice of
Thierry and applied.

	Sam

> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index b96d5b4629d7..07102d8da58f 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1082,11 +1082,11 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
>   */
>  int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scanline)
>  {
> -	u8 payload[3] = { MIPI_DCS_SET_TEAR_SCANLINE, scanline >> 8,
> -			  scanline & 0xff };
> +	u8 payload[2] = { scanline >> 8, scanline & 0xff };
>  	ssize_t err;
>  
> -	err = mipi_dsi_generic_write(dsi, payload, sizeof(payload));
> +	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_SCANLINE, payload,
> +				 sizeof(payload));
>  	if (err < 0)
>  		return err;
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
