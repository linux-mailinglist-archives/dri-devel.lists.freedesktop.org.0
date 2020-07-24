Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6722BB92
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 03:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DCC6E8BE;
	Fri, 24 Jul 2020 01:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9AB6E8BE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 01:34:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 156FB279;
 Fri, 24 Jul 2020 03:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595554444;
 bh=bCDL+N0xmJi7u1Mqf0NQTk956HaMBsNCR+6/+d1EzGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oop5JKeXsXOOGdhHGzswQrxOrDD1QLbqGxixXuCZXJ9hQoBXKK+6jpim5N7ZhtZpF
 2+4sibsjhUVNawQezmWA8pQwoZ6gv6vDP7EGT1iGjyZFWvbASoR7IefyE3u5+oW4X1
 eCQEGzQanMmcoVw8YpZcLXpyaW6IYOOQ8uXedS/k=
Date: Fri, 24 Jul 2020 04:33:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: of: Fix double-free bug
Message-ID: <20200724013357.GM21353@pendragon.ideasonboard.com>
References: <1595502654-40595-1-git-send-email-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595502654-40595-1-git-send-email-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Thu, Jul 23, 2020 at 12:10:54PM +0100, Biju Das wrote:
> Fix double-free bug in the error path.
> 
> Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This patch is tested against drm-fixes and drm-next.
> ---
>  drivers/gpu/drm/drm_of.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index fdb05fb..ca04c34 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -331,10 +331,8 @@ static int drm_of_lvds_get_remote_pixels_type(
>  		 * configurations by passing the endpoints explicitly to
>  		 * drm_of_lvds_get_dual_link_pixel_order().
>  		 */
> -		if (!current_pt || pixels_type != current_pt) {
> -			of_node_put(remote_port);
> +		if (!current_pt || pixels_type != current_pt)
>  			return -EINVAL;
> -		}
>  	}
>  
>  	return pixels_type;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
