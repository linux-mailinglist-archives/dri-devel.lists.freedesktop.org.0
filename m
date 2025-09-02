Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D446B40EE4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 22:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A9E10E83A;
	Tue,  2 Sep 2025 20:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hBOJu3Mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EB510E83A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 20:53:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65362C6A;
 Tue,  2 Sep 2025 22:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756846320;
 bh=iK0ooh/9lr65Lc7JU1Nk8uR+aDFrbXz3QCw++vzWq4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBOJu3MvXiN+ydbsCCUfSlLl5ibcObHVgvJeXyPMfSf3+RmZjLhhDDboTJWGF/pdJ
 HGnOr1vUi5v1i8o1dLat4zIE6fUvwH7gurjj9jZXCvnWXVfEUjcQAM3c7phwXtCFfh
 71Bcat47FxGbM9TEZhYDYv4JWAKnib0J0aiy85cM=
Date: Tue, 2 Sep 2025 22:52:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/29] drm/atomic: Only call atomic_destroy_state on a
 !NULL pointer
Message-ID: <20250902205247.GW13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-8-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-8-14ad5315da3f@kernel.org>
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

On Tue, Sep 02, 2025 at 10:32:36AM +0200, Maxime Ripard wrote:
> The drm_atomic_state structure is freed through the
> drm_atomic_state_put() function, that eventually calls
> drm_atomic_state_default_clear() by default when there's no active
> users of that state.
> 
> It then iterates over all entities with a state, and will call the

Did you mean s/with a state/within the state/ ?

I'd also replace "entity" with "object" as mentioned in the review of a
previous patch.

> atomic_destroy_state callback on the state pointer. The state pointer is
> mostly used these days to point to which of the old or new state needs
> to be freed, depending on whether the state was committed or not.
> 
> So it all makes sense.
> 
> However, with the hardware state readout support approaching, we might
> have a state, with multiple entities in it, but no state to free because
> we want them to persist. In such a case, state is going to be NULL, and
> thus we'll end up with NULL pointer dereference.

I'm not sure to follow you here. Are we talking with objects whose old
and new states will both need to be preserved ? Or objects that have no
old state ? I assume it's the latter, a clarification would be useful
here. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> In order to make it work, let's first test if the state pointer isn't
> NULL before calling atomic_destroy_state on it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 38f2b2633fa992b3543e8c425c7faeab1ce69765..f26678835a94f40da56a8c1297d92f226d7ff2e2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -249,12 +249,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  		struct drm_connector *connector = state->connectors[i].ptr;
>  
>  		if (!connector)
>  			continue;
>  
> -		connector->funcs->atomic_destroy_state(connector,
> -						       state->connectors[i].state);
> +		if (state->connectors[i].state)
> +			connector->funcs->atomic_destroy_state(connector,
> +							       state->connectors[i].state);
> +
>  		state->connectors[i].ptr = NULL;
>  		state->connectors[i].state = NULL;
>  		state->connectors[i].old_state = NULL;
>  		state->connectors[i].new_state = NULL;
>  		drm_connector_put(connector);
> @@ -264,12 +266,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  		struct drm_crtc *crtc = state->crtcs[i].ptr;
>  
>  		if (!crtc)
>  			continue;
>  
> -		crtc->funcs->atomic_destroy_state(crtc,
> -						  state->crtcs[i].state);
> +		if (state->crtcs[i].state)
> +			crtc->funcs->atomic_destroy_state(crtc,
> +							  state->crtcs[i].state);
>  
>  		state->crtcs[i].ptr = NULL;
>  		state->crtcs[i].state = NULL;
>  		state->crtcs[i].old_state = NULL;
>  		state->crtcs[i].new_state = NULL;
> @@ -284,12 +287,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  		struct drm_plane *plane = state->planes[i].ptr;
>  
>  		if (!plane)
>  			continue;
>  
> -		plane->funcs->atomic_destroy_state(plane,
> -						   state->planes[i].state);
> +		if (state->planes[i].state)
> +			plane->funcs->atomic_destroy_state(plane,
> +							       state->planes[i].state);
> +
>  		state->planes[i].ptr = NULL;
>  		state->planes[i].state = NULL;
>  		state->planes[i].old_state = NULL;
>  		state->planes[i].new_state = NULL;
>  	}
> @@ -298,12 +303,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  		struct drm_private_obj *obj = state->private_objs[i].ptr;
>  
>  		if (!obj)
>  			continue;
>  
> -		obj->funcs->atomic_destroy_state(obj,
> -						 state->private_objs[i].state);
> +		if (state->private_objs[i].state)
> +			obj->funcs->atomic_destroy_state(obj,
> +							       state->private_objs[i].state);
> +
>  		state->private_objs[i].ptr = NULL;
>  		state->private_objs[i].state = NULL;
>  		state->private_objs[i].old_state = NULL;
>  		state->private_objs[i].new_state = NULL;
>  	}

-- 
Regards,

Laurent Pinchart
