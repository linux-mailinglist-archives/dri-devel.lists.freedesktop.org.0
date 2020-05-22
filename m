Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F351DE36B
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 11:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354146E3EB;
	Fri, 22 May 2020 09:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366F46E3EB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 09:43:46 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90B6824D;
 Fri, 22 May 2020 11:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590140622;
 bh=EkHjxtlh1KP3U50OHeGsUjNHBBOhkFleoo6/23Q62n8=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gmp/auXve1lV5ElNd608Z05rQUVyqOlwtkILQzd29qG+vgUbdIWz3Bw0TFW085w29
 +HO7h1JxsOnfhMDd00y+mW8pFj2SSZIeFlvbcVXJBj1qfs0h03ZbnSN+Yjj8LICXqj
 dBn7ckx6I3sPkGR/STzPEU8XeYmgvYc85YYRjLaI=
Subject: Re: [PATCH] drm: rcar-du: Fix build error
To: Daniel Gomez <dagmcr@gmail.com>, daniel@ffwll.ch, airlied@linux.ie,
 laurent.pinchart@ideasonboard.com
References: <20200518201646.48312-1-dagmcr@gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <73d98905-930d-3549-1a85-293f4d213716@ideasonboard.com>
Date: Fri, 22 May 2020 10:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518201646.48312-1-dagmcr@gmail.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 18/05/2020 21:16, Daniel Gomez wrote:
> Select DRM_KMS_HELPER dependency.
> 
> Build error when DRM_KMS_HELPER is not selected:
> 
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'
> 

Looking at the files in rcar_du that utilise drm_atomic_helpers...

git grep -l drm_atomic_helper_ drivers/gpu/drm/rcar-du/
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c
 drivers/gpu/drm/rcar-du/rcar_du_kms.c
 drivers/gpu/drm/rcar-du/rcar_du_plane.c
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c
 drivers/gpu/drm/rcar-du/rcar_lvds.c

of those, these are configurable:

 rcar_du_vsp.c		# DRM_RCAR_VSP
 rcar_du_writeback.c	# DRM_RCAR_WRITEBACK
 rcar_lvds.c		# DRM_RCAR_LVDS

But VSP and WRITEBACK are already implicitly dependant upon DRM_RCAR_DU
because they get built into the DU module.

So indeed, only the RCAR_LVDS is a separate module, using those helpers,
so I think a select is a reasonable fix.

I would also ask whether DRM_RCAR_LVDS should depend upon DRM_RCAR_DU
though as well.

There is no linkage requirement, as it's a standalone bridge driver from
what I can see, but I don't think it serves much purpose without the DU?

Anyway, even if it's just for compile testing maybe, the select here
should be fine.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 0919f1f159a4..f65d1489dc50 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -31,6 +31,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_LVDS
>  	tristate "R-Car DU LVDS Encoder Support"
>  	depends on DRM && DRM_BRIDGE && OF
> +	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	select OF_FLATTREE
>  	select OF_OVERLAY
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
