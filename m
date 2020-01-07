Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27613354A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 22:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DDD6E140;
	Tue,  7 Jan 2020 21:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9C6E140
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 21:54:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCFC952F;
 Tue,  7 Jan 2020 22:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1578434067;
 bh=/4v7koUSMGC22Tz+qpJKBEp5rFtTL7KHEEbwdvvlN1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkHnAqTKHEBCvE2W9mvM6wOJtvLqn2Udrn3ptppoH6KMRBF4QX01rbOseGJKsm2on
 3uqKUKnsU/aHnDLqsNu0h8qv7e3zsMyDLAnMA6HEt30VmmdDbsO9jBQkkqahMP2xue
 VkfAirHmSgCx16n6uaa0RP7wz2T5VtXfNDuioJ5g=
Date: Tue, 7 Jan 2020 23:54:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: of: fix link error
Message-ID: <20200107215414.GA7869@pendragon.ideasonboard.com>
References: <20200107213738.635906-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107213738.635906-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

Thank you for the patch.

On Tue, Jan 07, 2020 at 10:37:32PM +0100, Arnd Bergmann wrote:
> The new dummy helper is non-static, so every driver gets
> its own copy, leading to a link failure:
> 
> drivers/gpu/drm/imx/imx-ldb.o: In function `drm_of_lvds_get_dual_link_pixel_order':
> imx-ldb.c:(.text+0x140): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
> drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
> drivers/gpu/drm/imx/dw_hdmi-imx.o: In function `drm_of_lvds_get_dual_link_pixel_order':
> dw_hdmi-imx.c:(.text+0xd0): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
> drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.o: In function `drm_of_lvds_get_dual_link_pixel_order':
> dw-hdmi.c:(.text+0x3b90): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
> drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
> drivers/gpu/drm/etnaviv/etnaviv_drv.o: In function `drm_of_lvds_get_dual_link_pixel_order':
> etnaviv_drv.c:(.text+0x9d0): multiple definition of `drm_of_lvds_get_dual_link_pixel_order'
> drivers/gpu/drm/imx/imx-drm-core.o:imx-drm-core.c:(.text+0x330): first defined here
> 
> Add the missing 'static' keyword.
> 
> Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I've sent "[PATCH] drm: of: Fix linking when CONFIG_OF is not set" to
fix this issue, back on December the 19th. Daniel, Dave, could you pick
this up ? It couldn't be merged through drm-misc last time we checked as
the offending patch wasn't there.

> ---
>  include/drm/drm_of.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 8ec7ca6d2369..3398be966021 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -92,7 +92,7 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	return -EINVAL;
>  }
>  
> -int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> +static inline int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
>  					  const struct device_node *port2)
>  {
>  	return -EINVAL;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
