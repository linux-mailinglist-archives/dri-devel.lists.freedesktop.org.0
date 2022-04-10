Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D774FAE74
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 17:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414B010E6F5;
	Sun, 10 Apr 2022 15:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C410E6F5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 15:22:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 969BF482;
 Sun, 10 Apr 2022 17:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649604140;
 bh=jsKiMlFOrucR9xanWkR9gKDjay3Oi7MS53acaKyt+Co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vc1+DgFpCjiNyA50WK+pmchFdih67+Fz0LOhiPin+LTjplmkYCoglIl4uqZzfMjnG
 eo9G+uOmrQySRsKgAYFAxEC3Xx4jTWrGOmCNT2ojg1z+HxviH1MayvaFNJYxEMWore
 k165tw/Ukx9I6smv9tzEKGhubLmz0tWi4lZkKWHw=
Date: Sun, 10 Apr 2022 18:22:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Extend CMM HDSE documentation
Message-ID: <YlL2KuYPyByjtbsL@pendragon.ideasonboard.com>
References: <20220409185706.505319-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220409185706.505319-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Sat, Apr 09, 2022 at 07:57:06PM +0100, Kieran Bingham wrote:
> When the CMM is enabled, the HDSE offset is further adjusted to
> compensate for consumed pixels.
> 
> Explain this further, with an extra comment at the point the offset is
> adjusted.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index f361a604337f..23e1aedf8dc0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -300,6 +300,11 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  	     | DSMR_DIPM_DISP | DSMR_CSPM;
>  	rcar_du_crtc_write(rcrtc, DSMR, dsmr);
>  
> +	/*
> +	 * When the CMM is enabled, an additional offset of 25 pixels must be
> +	 * subtracted from the HDS (horizontal display start) and HDE
> +	 * (horizontal display end) registers.
> +	 */
>  	hdse_offset = 19;
>  	if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
>  		hdse_offset += 25;

-- 
Regards,

Laurent Pinchart
