Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A4B3C36D3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 22:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE286EB5C;
	Sat, 10 Jul 2021 20:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BBC6EB5C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 20:47:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A0B4255;
 Sat, 10 Jul 2021 22:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1625950030;
 bh=aqz/R+qpR7KL+fyTu819jnjletiIJ66CngXDNMV3aaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q6ky447ioQ9QFBpGUWHZsfByijgzoYLHBzAhrWlBEtFHBPH91zm9I3a1CGf5CcKJ/
 8lBMYqr2VFC0kl7HLllmk1T3JZb465g0jXVM2xSIG9SQLrNs6yzwYAjFrvzl/b5VgI
 2Q7ggsw3SL/FjPCX42w+ax3t9ogJ9SXY5O1v2dck=
Date: Sat, 10 Jul 2021 23:46:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/1] drm: bridge: Mark deprecated operations in
 drm_bridge_funcs
Message-ID: <YOoHIPWzgFraoeeb@pendragon.ideasonboard.com>
References: <20210710084240.281063-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210710084240.281063-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sat, Jul 10, 2021 at 10:42:40AM +0200, Sam Ravnborg wrote:
> drm_bridge_funcs includes several duplicated operations as atomic
> variants has been added over time.

s/has/have/

> New bridge drivers shall use the atomic variants - mark the deprecated
> operations to try to avoid usage in new bridge drivers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_bridge.h | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..6805898d70f5 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -171,6 +171,11 @@ struct drm_bridge_funcs {
>  	 * signals) feeding it is still running when this callback is called.
>  	 *
>  	 * The @disable callback is optional.
> +	 *
> +	 * NOTE:
> +	 *
> +	 * This is deprecated, do not use!
> +	 * New drivers shall use &drm_bridge_funcs.atomic_disable.
>  	 */
>  	void (*disable)(struct drm_bridge *bridge);
>  
> @@ -190,6 +195,11 @@ struct drm_bridge_funcs {
>  	 * called.
>  	 *
>  	 * The @post_disable callback is optional.
> +	 *
> +	 * NOTE:
> +	 *
> +	 * This is deprecated, do not use!
> +	 * New drivers shall use &drm_bridge_funcs.atomic_post_disable.
>  	 */
>  	void (*post_disable)(struct drm_bridge *bridge);
>  
> @@ -213,11 +223,15 @@ struct drm_bridge_funcs {
>  	 * For atomic drivers the adjusted_mode is the mode stored in
>  	 * &drm_crtc_state.adjusted_mode.
>  	 *
> -	 * NOTE:
> -	 *
>  	 * If a need arises to store and access modes adjusted for other
>  	 * locations than the connection between the CRTC and the first bridge,
>  	 * the DRM framework will have to be extended with DRM bridge states.

The DRM framework *has* been extended with DRM bridge states :-) Should
this be dropped ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 *
> +	 * NOTE:
> +	 *
> +	 * This is deprecated, do not use!
> +	 * New drivers shall set their mode in &drm_bridge_funcs.atomic_enable
> +	 * operation.
>  	 */
>  	void (*mode_set)(struct drm_bridge *bridge,
>  			 const struct drm_display_mode *mode,
> @@ -239,6 +253,11 @@ struct drm_bridge_funcs {
>  	 * there is one) when this callback is called.
>  	 *
>  	 * The @pre_enable callback is optional.
> +	 *
> +	 * NOTE:
> +	 *
> +	 * This is deprecated, do not use!
> +	 * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
>  	 */
>  	void (*pre_enable)(struct drm_bridge *bridge);
>  
> @@ -259,6 +278,11 @@ struct drm_bridge_funcs {
>  	 * chain if there is one.
>  	 *
>  	 * The @enable callback is optional.
> +	 *
> +	 * NOTE:
> +	 *
> +	 * This is deprecated, do not use!
> +	 * New drivers shall use &drm_bridge_funcs.atomic_enable.
>  	 */
>  	void (*enable)(struct drm_bridge *bridge);
>  

-- 
Regards,

Laurent Pinchart
