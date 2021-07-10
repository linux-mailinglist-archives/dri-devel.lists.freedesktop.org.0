Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AE3C335D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1D89BFB;
	Sat, 10 Jul 2021 07:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B684A89BFB
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 07:02:00 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id bbf2235d-e14c-11eb-8d1a-0050568cd888;
 Sat, 10 Jul 2021 07:02:05 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A38D2194B04;
 Sat, 10 Jul 2021 09:02:07 +0200 (CEST)
Date: Sat, 10 Jul 2021 09:01:56 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/12] drm/mgag200: Introduce custom CRTC state
Message-ID: <YOlF5BNya5WJl3tj@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705124515.27253-12-tzimmermann@suse.de>
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
Cc: John.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 05, 2021 at 02:45:14PM +0200, Thomas Zimmermann wrote:
> The CRTC state in mgag200 will hold PLL values for modeset operations.
> Simple KMS helpers already support custom state for planes. Extend the
> helpers to support custom CRTC state as well.

This should be split in two patches - so the changes to
drm_simple_kms_helper can get more attention.

The patch as such looks fine so when split you can add my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
on the mgag200 parts.

And
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
on the drm_simple_kms_helper parts.

	Sam

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 39 +++++++++++++++++++--
>  drivers/gpu/drm/mgag200/mgag200_drv.h   |  9 +++++
>  drivers/gpu/drm/mgag200/mgag200_mode.c  | 46 +++++++++++++++++++++++++
>  include/drm/drm_simple_kms_helper.h     | 27 +++++++++++++++
>  4 files changed, 118 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 735f4f34bcc4..72989ed1baba 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -145,6 +145,39 @@ static const struct drm_crtc_helper_funcs drm_simple_kms_crtc_helper_funcs = {
>  	.atomic_disable = drm_simple_kms_crtc_disable,
>  };
>  
> +static void drm_simple_kms_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct drm_simple_display_pipe *pipe;
> +
> +	pipe = container_of(crtc, struct drm_simple_display_pipe, crtc);
> +	if (!pipe->funcs || !pipe->funcs->reset_crtc)
> +		return drm_atomic_helper_crtc_reset(crtc);
> +
> +	return pipe->funcs->reset_crtc(pipe);
> +}
> +
> +static struct drm_crtc_state *drm_simple_kms_crtc_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct drm_simple_display_pipe *pipe;
> +
> +	pipe = container_of(crtc, struct drm_simple_display_pipe, crtc);
> +	if (!pipe->funcs || !pipe->funcs->duplicate_crtc_state)
> +		return drm_atomic_helper_crtc_duplicate_state(crtc);
> +
> +	return pipe->funcs->duplicate_crtc_state(pipe);
> +}
> +
> +static void drm_simple_kms_crtc_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *state)
> +{
> +	struct drm_simple_display_pipe *pipe;
> +
> +	pipe = container_of(crtc, struct drm_simple_display_pipe, crtc);
> +	if (!pipe->funcs || !pipe->funcs->destroy_crtc_state)
> +		drm_atomic_helper_crtc_destroy_state(crtc, state);
> +	else
> +		pipe->funcs->destroy_crtc_state(pipe, state);
> +}
> +
>  static int drm_simple_kms_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_simple_display_pipe *pipe;
> @@ -168,12 +201,12 @@ static void drm_simple_kms_crtc_disable_vblank(struct drm_crtc *crtc)
>  }
>  
>  static const struct drm_crtc_funcs drm_simple_kms_crtc_funcs = {
> -	.reset = drm_atomic_helper_crtc_reset,
> +	.reset = drm_simple_kms_crtc_reset,
>  	.destroy = drm_crtc_cleanup,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> -	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.atomic_duplicate_state = drm_simple_kms_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_simple_kms_crtc_destroy_state,
>  	.enable_vblank = drm_simple_kms_crtc_enable_vblank,
>  	.disable_vblank = drm_simple_kms_crtc_disable_vblank,
>  };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index fca3904fde0c..c813d6c15f70 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -127,6 +127,15 @@ struct mgag200_pll_values {
>  	unsigned int s;
>  };
>  
> +struct mgag200_crtc_state {
> +	struct drm_crtc_state base;
> +};
> +
> +static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_state *base)
> +{
> +	return container_of(base, struct mgag200_crtc_state, base);
> +}
> +
>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
>  
>  struct mga_i2c_chan {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 5da72ebd8a7f..6a5c419c6641 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1886,6 +1886,49 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
>  		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->map[0]);
>  }
>  
> +static struct drm_crtc_state *
> +mgag200_simple_display_pipe_duplicate_crtc_state(struct drm_simple_display_pipe *pipe)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct drm_crtc_state *crtc_state = crtc->state;
> +	struct mgag200_crtc_state *new_mgag200_crtc_state;
> +
> +	if (!crtc_state)
> +		return NULL;
> +
> +	new_mgag200_crtc_state = kzalloc(sizeof(*new_mgag200_crtc_state), GFP_KERNEL);
> +	if (!new_mgag200_crtc_state)
> +		return NULL;
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_mgag200_crtc_state->base);
> +
> +	return &new_mgag200_crtc_state->base;
> +}
> +
> +static void mgag200_simple_display_pipe_destroy_crtc_state(struct drm_simple_display_pipe *pipe,
> +							   struct drm_crtc_state *crtc_state)
> +{
> +	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
> +
> +	__drm_atomic_helper_crtc_destroy_state(&mgag200_crtc_state->base);
> +	kfree(mgag200_crtc_state);
> +}
> +
> +static void mgag200_simple_display_pipe_reset_crtc(struct drm_simple_display_pipe *pipe)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct mgag200_crtc_state *mgag200_crtc_state;
> +
> +	if (crtc->state) {
> +		mgag200_simple_display_pipe_destroy_crtc_state(pipe, crtc->state);
> +		crtc->state = NULL; /* must be set to NULL here */
> +	}
> +
> +	mgag200_crtc_state = kzalloc(sizeof(*mgag200_crtc_state), GFP_KERNEL);
> +	if (!mgag200_crtc_state)
> +		return;
> +	__drm_atomic_helper_crtc_reset(crtc, &mgag200_crtc_state->base);
> +}
> +
>  static const struct drm_simple_display_pipe_funcs
>  mgag200_simple_display_pipe_funcs = {
>  	.mode_valid = mgag200_simple_display_pipe_mode_valid,
> @@ -1893,6 +1936,9 @@ mgag200_simple_display_pipe_funcs = {
>  	.disable    = mgag200_simple_display_pipe_disable,
>  	.check	    = mgag200_simple_display_pipe_check,
>  	.update	    = mgag200_simple_display_pipe_update,
> +	.reset_crtc = mgag200_simple_display_pipe_reset_crtc,
> +	.duplicate_crtc_state = mgag200_simple_display_pipe_duplicate_crtc_state,
> +	.destroy_crtc_state = mgag200_simple_display_pipe_destroy_crtc_state,
>  	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
>  };
>  
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index cf07132d4ee8..0b3647e614dd 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -153,6 +153,33 @@ struct drm_simple_display_pipe_funcs {
>  	 */
>  	void (*disable_vblank)(struct drm_simple_display_pipe *pipe);
>  
> +	/**
> +	 * @reset_crtc:
> +	 *
> +	 * Optional, called by &drm_crtc_funcs.reset. Please read the
> +	 * documentation for the &drm_crtc_funcs.reset hook for more details.
> +	 */
> +	void (*reset_crtc)(struct drm_simple_display_pipe *pipe);
> +
> +	/**
> +	 * @duplicate_crtc_state:
> +	 *
> +	 * Optional, called by &drm_crtc_funcs.atomic_duplicate_state. Please
> +	 * read the documentation for the &drm_crtc_funcs.atomic_duplicate_state
> +	 * hook for more details.
> +	 */
> +	struct drm_crtc_state * (*duplicate_crtc_state)(struct drm_simple_display_pipe *pipe);
> +
> +	/**
> +	 * @destroy_crtc_state:
> +	 *
> +	 * Optional, called by &drm_crtc_funcs.atomic_destroy_state. Please
> +	 * read the documentation for the &drm_crtc_funcs.atomic_destroy_state
> +	 * hook for more details.
> +	 */
> +	void (*destroy_crtc_state)(struct drm_simple_display_pipe *pipe,
> +				   struct drm_crtc_state *crtc_state);
> +
>  	/**
>  	 * @reset_plane:
>  	 *
> -- 
> 2.32.0
