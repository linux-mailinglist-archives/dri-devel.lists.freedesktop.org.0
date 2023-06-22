Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB8739F87
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 13:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C56A10E175;
	Thu, 22 Jun 2023 11:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A7B10E175
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:34:34 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qCIZs-0004YH-U2; Thu, 22 Jun 2023 13:34:16 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qCIZp-0001NE-H1; Thu, 22 Jun 2023 13:34:13 +0200
Date: Thu, 22 Jun 2023 13:34:13 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 5/5] drm/rockchip: vop2: Add missing call to crtc
 reset helper
Message-ID: <20230622113413.GL18491@pengutronix.de>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
 <20230621223311.2239547-6-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621223311.2239547-6-jonas@kwiboo.se>
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

On Wed, Jun 21, 2023 at 10:33:23PM +0000, Jonas Karlman wrote:
> Add missing call to crtc reset helper to properly vblank reset.
> 
> Also move vop2_crtc_reset and call vop2_crtc_destroy_state to simplify
> and remove duplicated code.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2:
> - Add check for allocation failure (Sascha)

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 31 +++++++++-----------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index f725487d02ef..5ba83121a1b9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2080,23 +2080,6 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
>  	.atomic_disable = vop2_crtc_atomic_disable,
>  };
>  
> -static void vop2_crtc_reset(struct drm_crtc *crtc)
> -{
> -	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
> -
> -	if (crtc->state) {
> -		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> -		kfree(vcstate);
> -	}
> -
> -	vcstate = kzalloc(sizeof(*vcstate), GFP_KERNEL);
> -	if (!vcstate)
> -		return;
> -
> -	crtc->state = &vcstate->base;
> -	crtc->state->crtc = crtc;
> -}
> -
>  static struct drm_crtc_state *vop2_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
>  	struct rockchip_crtc_state *vcstate;
> @@ -2123,6 +2106,20 @@ static void vop2_crtc_destroy_state(struct drm_crtc *crtc,
>  	kfree(vcstate);
>  }
>  
> +static void vop2_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct rockchip_crtc_state *vcstate =
> +		kzalloc(sizeof(*vcstate), GFP_KERNEL);
> +
> +	if (crtc->state)
> +		vop2_crtc_destroy_state(crtc, crtc->state);
> +
> +	if (vcstate)
> +		__drm_atomic_helper_crtc_reset(crtc, &vcstate->base);
> +	else
> +		__drm_atomic_helper_crtc_reset(crtc, NULL);
> +}
> +
>  static const struct drm_crtc_funcs vop2_crtc_funcs = {
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> -- 
> 2.41.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
