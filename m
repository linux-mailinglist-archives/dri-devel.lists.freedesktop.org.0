Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6731737CAE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33A210E3F8;
	Wed, 21 Jun 2023 08:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C27010E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:05:58 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qBsqe-0008Km-B6; Wed, 21 Jun 2023 10:05:52 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qBsqd-00056l-Ub; Wed, 21 Jun 2023 10:05:51 +0200
Date: Wed, 21 Jun 2023 10:05:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 2/4] drm/rockchip: vop: Use cleanup helper directly as
 destroy funcs
Message-ID: <20230621080551.GW18491@pengutronix.de>
References: <20230620064732.1525594-1-jonas@kwiboo.se>
 <20230620064732.1525594-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620064732.1525594-3-jonas@kwiboo.se>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 06:47:37AM +0000, Jonas Karlman wrote:
> vop_plane_destroy and vop_crtc_destroy are plain wrappers around
> drm_plane_cleanup and drm_crtc_cleanup. Use them directly as plane and
> crtc funcs to closer match VOP2 driver.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 60b23636a3fe..25c873d4ff53 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -766,11 +766,6 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
>  	}
>  }
>  
> -static void vop_plane_destroy(struct drm_plane *plane)
> -{
> -	drm_plane_cleanup(plane);
> -}
> -
>  static inline bool rockchip_afbc(u64 modifier)
>  {
>  	return modifier == ROCKCHIP_AFBC_MOD;
> @@ -1131,7 +1126,7 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
>  static const struct drm_plane_funcs vop_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy = vop_plane_destroy,
> +	.destroy = drm_plane_cleanup,
>  	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> @@ -1602,11 +1597,6 @@ static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
>  	.atomic_disable = vop_crtc_atomic_disable,
>  };
>  
> -static void vop_crtc_destroy(struct drm_crtc *crtc)
> -{
> -	drm_crtc_cleanup(crtc);
> -}
> -
>  static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
>  	struct rockchip_crtc_state *rockchip_state;
> @@ -1711,7 +1701,7 @@ vop_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  static const struct drm_crtc_funcs vop_crtc_funcs = {
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> -	.destroy = vop_crtc_destroy,
> +	.destroy = drm_crtc_cleanup,
>  	.reset = vop_crtc_reset,
>  	.atomic_duplicate_state = vop_crtc_duplicate_state,
>  	.atomic_destroy_state = vop_crtc_destroy_state,
> @@ -1962,7 +1952,7 @@ static void vop_destroy_crtc(struct vop *vop)
>  	 */
>  	list_for_each_entry_safe(plane, tmp, &drm_dev->mode_config.plane_list,
>  				 head)
> -		vop_plane_destroy(plane);
> +		drm_plane_cleanup(plane);
>  
>  	/*
>  	 * Destroy CRTC after vop_plane_destroy() since vop_disable_plane()
> -- 
> 2.41.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
