Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3514A7C532
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 22:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFDC10E34E;
	Fri,  4 Apr 2025 20:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SLxE48oR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4A810E34E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 20:57:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C652316;
 Fri,  4 Apr 2025 22:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743800116;
 bh=lfBNSrzdcxYPFhDVAgarg3j1GZbxKyb7ggiykvGJVQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLxE48oRyOWTL01g7k7qW72paTy1FpzjsNKm92B5mEiQWGPPP4yfMCIOyxWKVgQFT
 pG/FdnsyOufcUBi3T2s2CoGBCdCjX4nGucEFPQi95ZBYc2PMbRsKiY3bnXIzKnClii
 A3YVXj6OQVms8bBgDQpFOGW7CV29Zgfw+QHK3mfU=
Date: Fri, 4 Apr 2025 23:56:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
Message-ID: <20250404205645.GO4845@pendragon.ideasonboard.com>
References: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Fri, Apr 04, 2025 at 02:30:45PM +0100, Biju Das wrote:
> Add support for zpos, alpha and blend properties to RZ/G2L DU
> driver as the IP supports all these properties.
> 
> It is tested by the below modetest commands:
> 
> modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
> 37@42:512x300+200+200@XR15
> 
> modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
> modetest -M rzg2l-du -w {32,37}:zpos:{0,1}
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> index 8643ff2eec46..040d4e4aff00 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>  
>  		drm_plane_helper_add(&plane->plane,
>  				     &rzg2l_du_vsp_plane_helper_funcs);
> +
> +		drm_plane_create_alpha_property(&plane->plane);
> +		drm_plane_create_zpos_property(&plane->plane, i, 0,
> +					       num_planes - 1);
> +
> +		drm_plane_create_blend_mode_property(&plane->plane,
> +					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					BIT(DRM_MODE_BLEND_PREMULTI) |
> +					BIT(DRM_MODE_BLEND_COVERAGE));

It's interesting that the driver already handles the alpha, zpos and
blend mode properties set in the state, but doesn't expose those
properties to userspace.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	}
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
