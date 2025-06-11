Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F8AD5269
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EED10E615;
	Wed, 11 Jun 2025 10:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="s6hbdop8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D9E10E61E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:45:15 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250611104513euoutp01508f6c9f77507b9605b08c3da57f7d45~H9yPL5cqo1501715017euoutp01p
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:45:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250611104513euoutp01508f6c9f77507b9605b08c3da57f7d45~H9yPL5cqo1501715017euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749638713;
 bh=beOgCar7OUSQfsblQJn8LZvYL3GuUK7JcMfArxKMct0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=s6hbdop8+x2A6NVuMsdXWqEipYWJ2zSa4kJ/zR0DPukWwPiKF0W726KnjbNaTmHGK
 g1oEy6+BflQrVmdFhmNr2eEYBhhfX0W622CHLqraxsgiEWLwW/j+16ZJF0tiCXRZuX
 0QOs8pSpP5xJbmDAD5Oh0rny3QFu+vIL16cuHZBo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19~H9yOq475f0549805498eucas1p25;
 Wed, 11 Jun 2025 10:45:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250611104510eusmtip2373b673a7bf2fc544e697ba89fa444e3~H9yMnvgYQ0058000580eusmtip2c;
 Wed, 11 Jun 2025 10:45:10 +0000 (GMT)
Message-ID: <2c51cf39-13cb-413f-8dd5-53bc1c11467a@samsung.com>
Date: Wed, 11 Jun 2025 12:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel
 List <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Jayesh
 Choudhary <j-choudhary@ti.com>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250605171524.27222-4-aradhya.bhatia@linux.dev>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
X-EPHeader: CA
X-CMS-RootMailID: 20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
 <20250605171524.27222-4-aradhya.bhatia@linux.dev>
 <CGME20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19@eucas1p2.samsung.com>
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

Hi,

On 05.06.2025 19:15, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
>
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.
>
> The sequence of enable after this patch will look like:
>
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
>
> 	crtc_enable
> 	encoder_enable
>
> 	bridge[1]_enable
> 	...
> 	bridge[n]_enable
>
> And, the disable sequence for the display pipeline will look like:
>
> 	bridge[n]_disable
> 	...
> 	bridge[1]_disable
>
> 	encoder_disable
> 	crtc_disable
>
> 	bridge[1]_post_disable
> 	...
> 	bridge[n]_post_disable
>
> The definition of bridge pre_enable hook says that,
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
>
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled. Fix that by
> re-ordering the sequence of bridge pre_enable and bridge post_disable.
>
> While at it, update the drm bridge API documentation as well.
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

This patch landed in today's linux-next as commit c9b1150a68d9 
("drm/atomic-helper: Re-order bridge chain pre-enable and 
post-disable"). In my tests I found that it breaks booting of Samsung 
Exynos 5420/5800 based Chromebooks (Peach-Pit and Peach-Pi). Both of 
them use Exynos DRM with Exynos_DP sub-driver (Analogix DP) and EDP 
panel. Booting stops at '[drm] Initialized exynos 1.1.0 for exynos-drm 
on minor 0' message. On the other hand, the Samsung Exynos5250 based 
Snow Chromebook boots fine, but it uses dp-lvds nxp,ptn3460 bridge and 
lvds panel instead of edp panels. This looks like some sort of deadlock, 
because if I disable FBDEV emulation, those boards boots fine and I'm 
able to run modetest and enable the display. Also the DRM kernel logger 
seems to be working fine, although I didn't check the screen output yet, 
as I only have a remote access to those boards. I will investigate it 
further and let You know.

> ---
>   drivers/gpu/drm/drm_atomic_helper.c |   8 +-
>   include/drm/drm_bridge.h            | 249 ++++++++++++++++++++--------
>   2 files changed, 187 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 539b7f072c72..2fe6c91910a1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1336,9 +1336,9 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
>   {
>   	encoder_bridge_disable(dev, state);
>   
> -	encoder_bridge_post_disable(dev, state);
> -
>   	crtc_disable(dev, state);
> +
> +	encoder_bridge_post_disable(dev, state);
>   }
>   
>   /**
> @@ -1674,10 +1674,10 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
>   void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>   					      struct drm_atomic_state *state)
>   {
> -	crtc_enable(dev, state);
> -
>   	encoder_bridge_pre_enable(dev, state);
>   
> +	crtc_enable(dev, state);
> +
>   	encoder_bridge_enable(dev, state);
>   
>   	drm_atomic_helper_commit_writebacks(dev, state);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 0af5db244db8..ecdeb90e5586 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -165,17 +165,33 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right before
> -	 * the preceding element in the display pipe is disabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @disable vfunc. If the preceding element is a &drm_encoder
> -	 * it's called right before the &drm_encoder_helper_funcs.disable,
> -	 * &drm_encoder_helper_funcs.prepare or &drm_encoder_helper_funcs.dpms
> -	 * hook.
> +	 * The @disable callback should disable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is still running when this callback is called.
>   	 *
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is disabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.disable
> +	 * - &drm_bridge_funcs.atomic_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms.
> +	 *
>   	 * The @disable callback is optional.
>   	 *
>   	 * NOTE:
> @@ -188,17 +204,34 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @post_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right after the
> -	 * preceding element in the display pipe is disabled. If the preceding
> -	 * element is a bridge this means it's called after that bridge's
> -	 * @post_disable function. If the preceding element is a &drm_encoder
> -	 * it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.disable, &drm_encoder_helper_funcs.prepare
> -	 * or &drm_encoder_helper_funcs.dpms hook.
> -	 *
>   	 * The bridge must assume that the display pipe (i.e. clocks and timing
> -	 * signals) feeding it is no longer running when this callback is
> -	 * called.
> +	 * signals) feeding this bridge is no longer running when the
> +	 * @post_disable is called.
> +	 *
> +	 * This callback should perform all the actions required by the hardware
> +	 * after it has stopped receiving signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is post-disabled (unless marked otherwise by the
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.post_disable
> +	 * - &drm_bridge_funcs.atomic_post_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms
>   	 *
>   	 * The @post_disable callback is optional.
>   	 *
> @@ -241,18 +274,30 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @pre_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right before
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @pre_enable function. If the preceding element is a
> -	 * &drm_encoder it's called right before the encoder's
> -	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
> -	 * &drm_encoder_helper_funcs.dpms hook.
> -	 *
>   	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> -	 * will not yet be running when this callback is called. The bridge must
> -	 * not enable the display link feeding the next bridge in the chain (if
> -	 * there is one) when this callback is called.
> +	 * will not yet be running when the @pre_enable is called.
> +	 *
> +	 * This callback should perform all the necessary actions to prepare the
> +	 * bridge to accept signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is pre-enabled (unless marked otherwise by
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.pre_enable
> +	 * - &drm_bridge_funcs.atomic_pre_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - &drm_encoder_helper_funcs.commit
>   	 *
>   	 * The @pre_enable callback is optional.
>   	 *
> @@ -266,19 +311,31 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right after
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called after that
> -	 * bridge's @enable function. If the preceding element is a
> -	 * &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
> -	 * &drm_encoder_helper_funcs.dpms hook.
> +	 * The @enable callback should enable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is running when this callback is called. This
>   	 * callback must enable the display link feeding the next bridge in the
>   	 * chain if there is one.
>   	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is enabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.enable
> +	 * - &drm_bridge_funcs.atomic_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - drm_encoder_helper_funcs.commit
> +	 *
>   	 * The @enable callback is optional.
>   	 *
>   	 * NOTE:
> @@ -291,17 +348,30 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_pre_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right before
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
> -	 * element is a &drm_encoder it's called right before the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_enable hook.
> -	 *
>   	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> -	 * will not yet be running when this callback is called. The bridge must
> -	 * not enable the display link feeding the next bridge in the chain (if
> -	 * there is one) when this callback is called.
> +	 * will not yet be running when the @atomic_pre_enable is called.
> +	 *
> +	 * This callback should perform all the necessary actions to prepare the
> +	 * bridge to accept signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is pre-enabled (unless marked otherwise by
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.pre_enable
> +	 * - &drm_bridge_funcs.atomic_pre_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - &drm_encoder_helper_funcs.commit
>   	 *
>   	 * The @atomic_pre_enable callback is optional.
>   	 */
> @@ -311,18 +381,31 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_enable:
>   	 *
> -	 * This callback should enable the bridge. It is called right after
> -	 * the preceding element in the display pipe is enabled. If the
> -	 * preceding element is a bridge this means it's called after that
> -	 * bridge's @atomic_enable or @enable function. If the preceding element
> -	 * is a &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_enable hook.
> +	 * The @atomic_enable callback should enable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is running when this callback is called. This
>   	 * callback must enable the display link feeding the next bridge in the
>   	 * chain if there is one.
>   	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is enabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.enable
> +	 * - &drm_bridge_funcs.atomic_enable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the CRTC is enabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.atomic_enable
> +	 * - &drm_crtc_helper_funcs.commit
> +	 *
> +	 * and the encoder is enabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_enable
> +	 * - &drm_encoder_helper_funcs.enable
> +	 * - drm_encoder_helper_funcs.commit
> +	 *
>   	 * The @atomic_enable callback is optional.
>   	 */
>   	void (*atomic_enable)(struct drm_bridge *bridge,
> @@ -330,16 +413,32 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right before
> -	 * the preceding element in the display pipe is disabled. If the
> -	 * preceding element is a bridge this means it's called before that
> -	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
> -	 * is a &drm_encoder it's called right before the
> -	 * &drm_encoder_helper_funcs.atomic_disable hook.
> +	 * The @atomic_disable callback should disable the bridge.
>   	 *
>   	 * The bridge can assume that the display pipe (i.e. clocks and timing
>   	 * signals) feeding it is still running when this callback is called.
>   	 *
> +	 * If the preceding element is a &drm_bridge, then this is called before
> +	 * that bridge is disabled via one of:
> +	 *
> +	 * - &drm_bridge_funcs.disable
> +	 * - &drm_bridge_funcs.atomic_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called before the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms.
> +	 *
>   	 * The @atomic_disable callback is optional.
>   	 */
>   	void (*atomic_disable)(struct drm_bridge *bridge,
> @@ -348,16 +447,34 @@ struct drm_bridge_funcs {
>   	/**
>   	 * @atomic_post_disable:
>   	 *
> -	 * This callback should disable the bridge. It is called right after the
> -	 * preceding element in the display pipe is disabled. If the preceding
> -	 * element is a bridge this means it's called after that bridge's
> -	 * @atomic_post_disable or @post_disable function. If the preceding
> -	 * element is a &drm_encoder it's called right after the encoder's
> -	 * &drm_encoder_helper_funcs.atomic_disable hook.
> -	 *
>   	 * The bridge must assume that the display pipe (i.e. clocks and timing
> -	 * signals) feeding it is no longer running when this callback is
> -	 * called.
> +	 * signals) feeding this bridge is no longer running when the
> +	 * @atomic_post_disable is called.
> +	 *
> +	 * This callback should perform all the actions required by the hardware
> +	 * after it has stopped receiving signals from the preceding element.
> +	 *
> +	 * If the preceding element is a &drm_bridge, then this is called after
> +	 * that bridge is post-disabled (unless marked otherwise by the
> +	 * @pre_enable_prev_first flag) via one of:
> +	 *
> +	 * - &drm_bridge_funcs.post_disable
> +	 * - &drm_bridge_funcs.atomic_post_disable
> +	 *
> +	 * If the preceding element of the bridge is a display controller, then
> +	 * this callback is called after the encoder is disabled via one of:
> +	 *
> +	 * - &drm_encoder_helper_funcs.atomic_disable
> +	 * - &drm_encoder_helper_funcs.prepare
> +	 * - &drm_encoder_helper_funcs.disable
> +	 * - &drm_encoder_helper_funcs.dpms
> +	 *
> +	 * and the CRTC is disabled via one of:
> +	 *
> +	 * - &drm_crtc_helper_funcs.prepare
> +	 * - &drm_crtc_helper_funcs.atomic_disable
> +	 * - &drm_crtc_helper_funcs.disable
> +	 * - &drm_crtc_helper_funcs.dpms
>   	 *
>   	 * The @atomic_post_disable callback is optional.
>   	 */

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

