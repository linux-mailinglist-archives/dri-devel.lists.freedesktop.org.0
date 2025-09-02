Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1757FB40E1D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D8B10E829;
	Tue,  2 Sep 2025 19:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kbv/mDMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B9910E829
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:49:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6EC62C6D;
 Tue,  2 Sep 2025 21:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756842517;
 bh=j2FGCZt5h71J5kGeIF0TOdjUL86/+YlDqZ3I/3KmapY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kbv/mDMW6rjxbT/gMIOMbGm0SrkceC3cVvn/XJCsdjQFkqC7H0iofOrciZo+tZgMN
 /0ySLXZGttjRXob7orwueR+tpTs3oGqCdWXR5fJpaJkl/s6Y1ZM5mct1SV/dAWda0e
 0h94cKvZzb2oN4ou6xlaM7tKfJqxusVhICyY1T0k=
Date: Tue, 2 Sep 2025 21:49:24 +0200
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
Subject: Re: [PATCH 05/29] drm/atomic_state_helper: Fix bridge state
 initialization
Message-ID: <20250902194924.GT13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-5-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-5-14ad5315da3f@kernel.org>
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

Hi Maxime,

On Tue, Sep 02, 2025 at 10:32:33AM +0200, Maxime Ripard wrote:
> Bridges implement their state using a drm_private_obj and an

s/and an/and a/

> hand-crafted reset implementation.
> 
> Since drm_private_obj doesn't have a set of reset helper like the other
> states, __drm_atomic_helper_bridge_reset() was initializing both the

s/was initializing/initializes/

> drm_private_state and the drm_bridge_state structures.
> 
> This initialization however was missing the drm_private_state.obj

s/was missing/is missing/

Or do I incorrectly think that the commit message should describe the
current situation in the present tense ?

> pointer to the drm_private_obj the state was allocated for, creating a
> NULL pointer dereference when trying to access it.
> 
> Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..b962c342b16aabf4e3bea52a914e5deb1c2080ce 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -707,10 +707,17 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>  	__drm_atomic_helper_connector_destroy_state(state);
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>  
> +static void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
> +						  struct drm_private_state *state)
> +{
> +	memset(state, 0, sizeof(*state));

As Thomas mentioned, the memset is likely not needed.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	state->obj = obj;
> +}
> +
>  /**
>   * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
>   * @obj: CRTC object
>   * @state: new private object state
>   *
> @@ -796,10 +803,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
>   */
>  void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
>  				      struct drm_bridge_state *state)
>  {
>  	memset(state, 0, sizeof(*state));
> +	__drm_atomic_helper_private_obj_reset(&bridge->base, &state->base);
>  	state->bridge = bridge;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
>  
>  /**
> 

-- 
Regards,

Laurent Pinchart
