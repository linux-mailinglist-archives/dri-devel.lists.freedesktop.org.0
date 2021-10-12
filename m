Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873E42A5C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1389C51;
	Tue, 12 Oct 2021 13:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEDB89C51
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:34:45 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52D53F1;
 Tue, 12 Oct 2021 15:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634045683;
 bh=yk7wyXRJs5V8oQKguibK4gqbCEVh7Bumocfaadd+N+M=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=RydXY9e9IZbJQzFZ0xNqiqfl9fSaZOrQKvVoHWjkI+vTJUaib62cxOwlplgZpHhz/
 +pS0t3fOO6Ta/79s7X2oHxpYuBxzmVc3aZB5U6ijwhQeeOYepxyIT43c3r1s3PjHSr
 BsHkyyuCg7iBjzayZ3LvpV33H1HO+6kW/4YqqW9U=
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-7-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 6/8] drm/omap: dynamically assign hw overlays to planes
Message-ID: <31aadce1-e656-26c0-9481-d0629b6bc8b1@ideasonboard.com>
Date: Tue, 12 Oct 2021 16:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923070701.145377-7-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 23/09/2021 10:06, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> (re)assign the hw overlays to planes based on required caps, and to
> handle situations where we could not modify an in-use plane.
> 
> This means all planes advertise the superset of formats and properties.
> Userspace must (as always) use atomic TEST_ONLY step for atomic updates,
> as not all planes may be available for use on every frame.
> 
> The mapping of hwoverlays to plane is stored in omap_global_state, so
> that state updates are atomically committed in the same way that
> plane/etc state updates are managed.  This is needed because the
> omap_plane_state keeps a pointer to the hwoverlay, and we don't want
> global state to become out of sync with the plane state if an atomic
> update fails, we hit deadlock/ backoff scenario, etc.  The use of
> global_state_lock keeps multiple parallel updates which both re-assign
> hwoverlays properly serialized.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.h     |   3 +
>   drivers/gpu/drm/omapdrm/omap_overlay.c | 140 ++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/omap_overlay.h |   9 ++
>   drivers/gpu/drm/omapdrm/omap_plane.c   | 170 ++++++++++++++++++++-----
>   4 files changed, 287 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 280cdd27bc8e..2d5928f05a23 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -49,6 +49,9 @@ struct omap_drm_pipeline {
>   #define to_omap_global_state(x) container_of(x, struct omap_global_state, base)
>   struct omap_global_state {
>   	struct drm_private_state base;
> +
> +	/* global atomic state of assignment between overlays and planes */
> +	struct drm_plane *hwoverlay_to_plane[8];
>   };
>   
>   struct omap_drm_private {
> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
> index 2b1416d2aad2..f1a23c2203aa 100644
> --- a/drivers/gpu/drm/omapdrm/omap_overlay.c
> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
> @@ -21,6 +21,146 @@ static const char * const overlay_id_to_name[] = {
>   	[OMAP_DSS_VIDEO3] = "vid3",
>   };
>   
> +static struct omap_hw_overlay *
> +omap_plane_find_free_overlay(struct drm_device *dev,
> +			     struct drm_plane *hwoverlay_to_plane[],
> +			     u32 caps, u32 fourcc, u32 crtc_mask)
> +{
> +	struct omap_drm_private *priv = dev->dev_private;
> +	int i;
> +
> +	DBG("caps: %x fourcc: %x crtc: %x", caps, fourcc, crtc_mask);
> +
> +	for (i = 0; i < priv->num_ovls; i++) {
> +		struct omap_hw_overlay *cur = priv->overlays[i];
> +
> +		DBG("%d: id: %d cur->caps: %x cur->crtc: %x",
> +		    cur->idx, cur->overlay_id, cur->caps, cur->possible_crtcs);
> +
> +		/* skip if already in-use */
> +		if (hwoverlay_to_plane[cur->idx])
> +			continue;
> +
> +		/* check if allowed on crtc */
> +		if (!(cur->possible_crtcs & crtc_mask))
> +			continue;
> +
> +		/* skip if doesn't support some required caps: */
> +		if (caps & ~cur->caps)
> +			continue;
> +
> +		/* check supported format */
> +		if (!dispc_ovl_color_mode_supported(priv->dispc,
> +						    cur->overlay_id, fourcc))
> +			continue;
> +
> +		return cur;
> +	}
> +
> +	DBG("no match");
> +	return NULL;
> +}
> +
> +int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> +			u32 caps, u32 fourcc, u32 crtc_mask,
> +			struct omap_hw_overlay **overlay)
> +{
> +	struct omap_drm_private *priv = s->dev->dev_private;
> +	struct omap_global_state *new_global_state, *old_global_state;
> +	struct drm_plane **overlay_map;
> +	struct omap_hw_overlay *ovl;
> +
> +	new_global_state = omap_get_global_state(s);
> +	if (IS_ERR(new_global_state))
> +		return PTR_ERR(new_global_state);
> +
> +	/*
> +	 * grab old_state after omap_get_global_state(),
> +	 * since now we hold lock:
> +	 */
> +	old_global_state = omap_get_existing_global_state(priv);
> +	DBG("new_global_state: %p old_global_state: %p",
> +	    new_global_state, old_global_state);
> +
> +	overlay_map = new_global_state->hwoverlay_to_plane;
> +
> +	if (!*overlay) {
> +		ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
> +						   caps, fourcc, crtc_mask);
> +		if (!ovl)
> +			return -ENOMEM;
> +
> +		ovl->possible_crtcs = crtc_mask;
> +		overlay_map[ovl->idx] = plane;
> +		*overlay = ovl;
> +
> +		DBG("%s: assign to plane %s caps %x on crtc %x",
> +		    (*overlay)->name, plane->name, caps, crtc_mask);
> +	}
> +
> +	return 0;
> +}

Why would one call this function with overlay == NULL? What does the 
function do in that case?

> +
> +void omap_overlay_release(struct drm_atomic_state *s,
> +			  struct drm_plane *plane,
> +			  struct omap_hw_overlay *overlay)

It feels odd to pass both plane and overlay here. If we're unassigning 
(is that a verb? =) the overlay, isn't it enough to just pass either the 
plane or the overlay?

> +{
> +	struct omap_global_state *state = omap_get_global_state(s);
> +	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
> +
> +	if (!overlay)
> +		return;
> +
> +	if (WARN_ON(!overlay_map[overlay->idx]))
> +		return;
> +	/*
> +	 * Check that the overlay we are releasing is actually
> +	 * assigned to the plane we are trying to release it from.
> +	 */
> +	if (overlay_map[overlay->idx] == plane) {
> +		DBG("%s: release from plane %s", overlay->name, plane->name);
> +
> +		overlay_map[overlay->idx] = NULL;
> +	}

So it's normal that overlay_map[overlay->idx] != plane? When does that 
happen?

> +}
> +
> +void omap_overlay_disable(struct drm_atomic_state *s,
> +			  struct drm_plane *plane,
> +			  struct omap_hw_overlay *overlay)
> +{
> +	struct omap_drm_private *priv = s->dev->dev_private;
> +	struct drm_plane **overlay_map;
> +	struct omap_global_state *old_state;
> +
> +	old_state = omap_get_existing_global_state(priv);
> +	overlay_map = old_state->hwoverlay_to_plane;
> +
> +	if (!overlay)
> +		return;
> +

You can move the if above to the beginning of the func.

> +	/*
> +	 * Check that the overlay we are trying to disable has not
> +	 * been re-assigned to another plane already
> +	 */
> +	if (!overlay_map[overlay->idx]) {
> +		DBG("%s: on %s disabled", overlay->name, plane->name);
> +
> +		/* disable the overlay */
> +		dispc_ovl_enable(priv->dispc, overlay->overlay_id, false);
> +
> +		/*
> +		 * Since we are disabling this overlay in this
> +		 * atomic cycle we can reset the available crtcs
> +		 * it can be used on
> +		 */
> +		overlay->possible_crtcs = (1 << priv->num_pipes) - 1;

This is changing data in the overlay struct itself. Shouldn't the 
mutable data be in the atomic state?

I'm also a bit confused on what the "possible_crtcs" is. But I think 
it's either a bitmask of all the crtcs when the overlay is free, or a 
mask of a single crtc when allocated.

I think a variable that's either 0 when the overlay is not assigned, or 
the mask of the crtc when in use, would be more clear. Also with some 
other name (active_crtc?).

> +	}
> +
> +	/*
> +	 * Otherwise the overlay is still in use so leave it alone
> +	 */
> +}

This function also has interesting behavior, possibly not disabling the 
hw overlay. I think these new exposed overlay functions could use a 
comment above each of them, explaining what they do.

> +
>   static void omap_overlay_destroy(struct omap_hw_overlay *overlay)
>   {
>   	kfree(overlay);
> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
> index 892fecb67adb..d5033ee481c2 100644
> --- a/drivers/gpu/drm/omapdrm/omap_overlay.h
> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
> @@ -28,4 +28,13 @@ struct omap_hw_overlay {
>   
>   int omap_hwoverlays_init(struct omap_drm_private *priv);
>   void omap_hwoverlays_destroy(struct omap_drm_private *priv);
> +int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> +			u32 caps, u32 fourcc, u32 crtc_mask,
> +			struct omap_hw_overlay **overlay);
> +void omap_overlay_release(struct drm_atomic_state *s,
> +			  struct drm_plane *plane,
> +			  struct omap_hw_overlay *overlay);
> +void omap_overlay_disable(struct drm_atomic_state *s,
> +			  struct drm_plane *plane,
> +			  struct omap_hw_overlay *overlay);
>   #endif /* __OMAPDRM_OVERLAY_H__ */
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index bda794b4c915..4b400a8bfe9e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fourcc.h>
>   
>   #include "omap_dmm_tiler.h"
>   #include "omap_drv.h"
> @@ -21,6 +22,8 @@
>   struct omap_plane_state {
>   	/* Must be first. */
>   	struct drm_plane_state base;
> +
> +	struct omap_hw_overlay *overlay;
>   };
>   
>   #define to_omap_plane(x) container_of(x, struct omap_plane, base)
> @@ -29,8 +32,6 @@ struct omap_plane {
>   	struct drm_plane base;
>   	enum omap_plane_id id;
>   	const char *name;
> -
> -	struct omap_hw_overlay *overlay;
>   };
>   
>   static int omap_plane_prepare_fb(struct drm_plane *plane,
> @@ -58,10 +59,27 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>   	struct omap_plane *omap_plane = to_omap_plane(plane);
>   	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>   									   plane);
> -	enum omap_plane_id ovl_id = omap_plane->overlay->overlay_id;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
> +	struct omap_plane_state *new_omap_state;
> +	struct omap_plane_state *old_omap_state;
>   	struct omap_overlay_info info;
> +	enum omap_plane_id ovl_id;
>   	int ret;
>   
> +	new_omap_state = to_omap_plane_state(new_state);
> +	old_omap_state = to_omap_plane_state(old_state);
> +
> +	/* Cleanup previously held overlay if needed */
> +	omap_overlay_disable(old_state->state, plane, old_omap_state->overlay);
> +
> +	if (!new_omap_state->overlay) {
> +		DBG("[PLANE:%d:%s] overlay_id: ??? (%p)", plane->base.id, plane->name,
> +		    new_omap_state->overlay);

I wonder what the ??? means here.

Already in earlier patches I wondered if the DBG prints were good or 
not, but I thought I'll comment on those after I can run this and see 
what they actually print. But some of them felt like debug prints used 
during development, not something to leave in the production code (at 
least in the form they were).

> +		return;
> +	}
> +
> +	ovl_id = new_omap_state->overlay->overlay_id;
>   	DBG("%s, crtc=%p fb=%p", omap_plane->name, new_state->crtc,
>   	    new_state->fb);
>   
> @@ -80,9 +98,9 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>   	/* update scanout: */
>   	omap_framebuffer_update_scanout(new_state->fb, new_state, &info);
>   
> -	DBG("%dx%d -> %dx%d (%d)", info.width, info.height,
> -			info.out_width, info.out_height,
> -			info.screen_width);
> +	DBG("%s: %dx%d -> %dx%d (%d)",
> +			new_omap_state->overlay->name, info.width, info.height,
> +			info.out_width, info.out_height, info.screen_width);
>   	DBG("%d,%d %pad %pad", info.pos_x, info.pos_y,
>   			&info.paddr, &info.p_uv_addr);
>   
> @@ -105,55 +123,66 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
>   {
>   	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>   									   plane);
> -	struct omap_drm_private *priv = plane->dev->dev_private;
> -	struct omap_plane *omap_plane = to_omap_plane(plane);
> -	enum omap_plane_id ovl_id = omap_plane->overlay->overlay_id;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
> +	struct omap_plane_state *new_omap_state;
> +	struct omap_plane_state *old_omap_state;
> +
> +	new_omap_state = to_omap_plane_state(new_state);
> +	old_omap_state = to_omap_plane_state(old_state);
> +
> +	if (!old_omap_state->overlay)
> +		return;
>   
>   	new_state->rotation = DRM_MODE_ROTATE_0;
> -	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : omap_plane->id;
> +	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
> +			? 0 : old_omap_state->overlay->overlay_id;

I'm not sure if I'm right here, but... doesn't the above mean that the 
plane's zpos can change, depending on which hw overlay it happened to use?

>   
> -	dispc_ovl_enable(priv->dispc, ovl_id, false);
> +	omap_overlay_disable(old_state->state, plane, old_omap_state->overlay);
> +	new_omap_state->overlay = NULL;
>   }
>   
> +#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
>   static int omap_plane_atomic_check(struct drm_plane *plane,
>   				   struct drm_atomic_state *state)
>   {
>   	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>   										 plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
> +										 plane);
> +	struct drm_crtc *crtc;
>   	struct omap_drm_private *priv = plane->dev->dev_private;
> +	struct omap_plane_state *omap_state = to_omap_plane_state(new_plane_state);
> +	struct omap_global_state *omap_overlay_global_state;
> +	u32 crtc_mask;
> +	u32 fourcc;
> +	u32 caps = 0;
> +	bool new_hw_overlay = false;
> +	int min_scale, max_scale;
> +	int ret;
>   	struct drm_crtc_state *crtc_state;
>   	u16 width, height;
>   	u32 width_fp, height_fp;
>   
> -	if (!new_plane_state->fb)
> -		return 0;
> +	omap_overlay_global_state = omap_get_global_state(state);
> +	if (IS_ERR(omap_overlay_global_state))
> +		return PTR_ERR(omap_overlay_global_state);
> +	DBG("%s: omap_overlay_global_state: %p", plane->name,
> +	    omap_overlay_global_state);
>   
>   	dispc_ovl_get_max_size(priv->dispc, &width, &height);
>   	width_fp = width << 16;
>   	height_fp = height << 16;
>   
> -	/* crtc should only be NULL when disabling (i.e., !new_plane_state->fb) */
> -	if (WARN_ON(!new_plane_state->crtc))
> +	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
> +	if (!crtc)
>   		return 0;
>   
> -	crtc_state = drm_atomic_get_existing_crtc_state(state,
> -							new_plane_state->crtc);
> +	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
>   	/* we should have a crtc state if the plane is attached to a crtc */
>   	if (WARN_ON(!crtc_state))
>   		return 0;
>   
> -	if (!crtc_state->enable)
> -		return 0;
> -
> -	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
> -		return -EINVAL;
> -
> -	if (new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->adjusted_mode.hdisplay)
> -		return -EINVAL;
> -
> -	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
> -		return -EINVAL;
> -
>   	/* Make sure dimensions are within bounds. */
>   	if (new_plane_state->src_h > height_fp || new_plane_state->crtc_h > height)
>   		return -EINVAL;
> @@ -161,9 +190,81 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>   	if (new_plane_state->src_w > width_fp || new_plane_state->crtc_w > width)
>   		return -EINVAL;
>   
> -	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
> -	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
> -		return -EINVAL;
> +
> +	/*
> +	 * Note: these are just sanity checks to filter out totally bad scaling
> +	 * factors. The real limits must be calculated case by case, and
> +	 * unfortunately we currently do those checks only at the commit
> +	 * phase in dispc.
> +	 */
> +	min_scale = FRAC_16_16(1, 8);
> +	max_scale = FRAC_16_16(8, 1);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> +						  min_scale, max_scale,
> +						  true, true);

This piece here feels a bit out of context (wrt. to this patch). Why do 
we need it here, when adding support to hw overlays?

And I think it's fine to use the above helper, but maybe it can be in a 
separate patch earlier?


> +	if (ret)
> +		return ret;
> +
> +	DBG("%s: check (%d -> %d)", plane->name,
> +	    old_plane_state->visible, new_plane_state->visible);

Here's an example of the debug prints I mentioned earlier. I think this 
prints:

"GFX: check (1 -> 0)"

I'm fine with terse debug prints, but... maybe something like "visible 1 
-> 0" would be much better? =)

> +	if (new_plane_state->visible) {
> +		if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
> +		    !omap_framebuffer_supports_rotation(new_plane_state->fb))
> +			return -EINVAL;
> +
> +		if ((new_plane_state->src_w >> 16) != new_plane_state->crtc_w ||
> +		    (new_plane_state->src_h >> 16) != new_plane_state->crtc_h)
> +			caps |= OMAP_DSS_OVL_CAP_SCALE;
> +
> +		fourcc = new_plane_state->fb->format->format;
> +		crtc_mask = drm_crtc_mask(new_plane_state->crtc);
> +
> +		/*
> +		 * (re)allocate hw overlay if we don't have one or
> +		 * there is a caps mismatch
> +		 */
> +		if (!omap_state->overlay ||
> +		    (caps & ~omap_state->overlay->caps)) {
> +			new_hw_overlay = true;
> +		} else {
> +			/* check if allowed on crtc */
> +			if (!(omap_state->overlay->possible_crtcs & crtc_mask))
> +				new_hw_overlay = true;
> +
> +			/* check supported format */
> +			if (!dispc_ovl_color_mode_supported(priv->dispc,
> +						omap_state->overlay->overlay_id,
> +						fourcc))
> +				new_hw_overlay = true;
> +		}
> +
> +		if (new_hw_overlay) {
> +			struct omap_hw_overlay *old_ovl = omap_state->overlay;
> +			struct omap_hw_overlay *new_ovl = NULL;
> +
> +			omap_overlay_release(state, plane, old_ovl);
> +
> +			ret = omap_overlay_assign(state, plane, caps,
> +						  fourcc, crtc_mask, &new_ovl);
> +			if (ret) {
> +				DBG("%s: failed to assign hw_overlay(s)!",
> +				    plane->name);
> +				omap_state->overlay = NULL;
> +				return ret;
> +			}
> +
> +			omap_state->overlay = new_ovl;
> +		}
> +	} else {
> +		omap_overlay_release(state, plane, omap_state->overlay);
> +		omap_state->overlay = NULL;
> +	}
> +
> +	if (omap_state->overlay)
> +		DBG("plane: %s overlay_id: %d", plane->name,
> +		    omap_state->overlay->overlay_id);
>   
>   	return 0;
>   }
> @@ -230,7 +331,7 @@ static void omap_plane_reset(struct drm_plane *plane)
>   	 * plane.
>   	 */
>   	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
> -			   ? 0 : omap_plane->overlay->overlay_id;
> +			   ? 0 : omap_plane->id;

Hmm... On plane reset we now set the zpos to plane->id, but on disable 
we reset zpos to overlay->id. And before this patch we set the vice 
versa. I don't follow.

  Tomi
