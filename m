Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B9A34F99
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BBD10E11D;
	Thu, 13 Feb 2025 20:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QyWOl391";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7F710E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:41:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BD1D594;
 Thu, 13 Feb 2025 21:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739479233;
 bh=1+AAiHUmcZ0YGwlI7FBzyZhAxpsavKtjHcxXh5On9+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QyWOl391hTdGPhY0sOHjjkxZJUII2e32RnweKlJ7bD982MVv7Jag0MK+xPA0TcNdX
 nYmLLvIKzU8DsUDWShycDP9fl95yasHYCYrDDQjBslXrzxiMakxcHHieAHvaepkzsJ
 QkgfYV4eozq+sO01qewcctSkp5NOXqnD65uUBslQ=
Date: Thu, 13 Feb 2025 22:41:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/11] drm/fourcc: Add warning for bad bpp
Message-ID: <20250213204140.GB22998@pendragon.ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-1-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-1-90d0fe106995@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Wed, Feb 12, 2025 at 04:56:05PM +0200, Tomi Valkeinen wrote:
> drm_format_info_bpp() cannot be used for formats which do not have an
> integer bits-per-pixel in a pixel block.
> 
> E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
> pixels (Y components), and two padding bits, in a 4 byte block. That is
> 10.666... bits per pixel when considering the whole 4 byte block, which
> is what drm_format_info_bpp() does. Thus a driver that supports such
> formats cannot use drm_format_info_bpp(),
> 
> It is a driver bug if this happens, but so handle wrong calls by
> printing a warning and returning 0.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 3a94ca211f9c..1e9afbf6ef99 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -457,6 +457,13 @@ unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
>  	if (!info || plane < 0 || plane >= info->num_planes)
>  		return 0;
>  
> +	if (info->char_per_block[plane] * 8 %
> +	    (drm_format_info_block_width(info, plane) *
> +	     drm_format_info_block_height(info, plane))) {

Can you cache 

	    drm_format_info_block_width(info, plane) *
	    drm_format_info_block_height(info, plane)

in a local variable to avoid computing it twice ?

> +		pr_warn("unable to return an integer bpp\n");

It would be nice to print the warning in the context of the drm device,
but we don't have the required structure here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return 0;
> +	}
> +
>  	return info->char_per_block[plane] * 8 /
>  	       (drm_format_info_block_width(info, plane) *
>  		drm_format_info_block_height(info, plane));

-- 
Regards,

Laurent Pinchart
