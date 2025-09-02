Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF18B40E94
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 22:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B1610E08F;
	Tue,  2 Sep 2025 20:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hu9s8WWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCFE10E08F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 20:35:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2034DC6A;
 Tue,  2 Sep 2025 22:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756845262;
 bh=oKC01OtfUqVxBPjjD52SBxO26J4xj2x2R8r3Xfr7SX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hu9s8WWjBpZAhOwGudwrTZvXbmjlgOxdz1rP6FwjDXfMh4djwhlIFUB6hKrBQ+qFV
 LvuKdlOr7vBWLglXdB2AOUIJ9A78Ic80KDyiK4EzQHFhTW9j8kcoJxd94amOdW/qgm
 Shgh45JS+kQdyfxHkzPn6JujqCXfyVY4cGoUxKh8=
Date: Tue, 2 Sep 2025 22:35:09 +0200
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
Subject: Re: [PATCH 07/29] drm/atomic: Implement drm_atomic_print_old_state
Message-ID: <20250902203509.GV13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-7-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-7-14ad5315da3f@kernel.org>
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

Thank you for the patch.

On Tue, Sep 02, 2025 at 10:32:35AM +0200, Maxime Ripard wrote:
> We currently have a helper to print the new states associated to a
> drm_atomic_state, but we don't have a variant to print the old state.
> 
> It's somewhat expected, since we almost never care about what the new
> state looks like when we commit a new state, but we're about to change
> that.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_atomic.c        | 45 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 9b198610791d19c7fd276ca59264a961d21caf43..38f2b2633fa992b3543e8c425c7faeab1ce69765 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1875,10 +1875,55 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>  	for_each_new_private_obj_in_state(state, obj, obj_state, i)
>  		drm_atomic_private_obj_print_state(p, obj_state);
>  }
>  EXPORT_SYMBOL(drm_atomic_print_new_state);
>  
> +/**
> + * drm_atomic_print_old_state - prints drm atomic state
> + * @state: atomic configuration to check
> + * @p: drm printer
> + *
> + * This functions prints the drm atomic state snapshot using the drm printer
> + * which is passed to it. This snapshot can be used for debugging purposes.
> + *
> + * Note that this function looks into the old state objects and hence its not
> + * safe to be used after the call to drm_atomic_helper_commit_hw_done().
> + */
> +void drm_atomic_print_old_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p)
> +{
> +	struct drm_plane *plane;
> +	struct drm_plane_state *plane_state;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *connector_state;
> +	struct drm_private_obj *obj;
> +	struct drm_private_state *obj_state;
> +	int i;
> +
> +	if (!p) {
> +		drm_err(state->dev, "invalid drm printer\n");
> +		return;
> +	}
> +
> +	drm_dbg_atomic(state->dev, "checking %p\n", state);
> +
> +	for_each_old_plane_in_state(state, plane, plane_state, i)
> +		drm_atomic_plane_print_state(p, plane_state);
> +
> +	for_each_old_crtc_in_state(state, crtc, crtc_state, i)
> +		drm_atomic_crtc_print_state(p, crtc_state);
> +
> +	for_each_old_connector_in_state(state, connector, connector_state, i)
> +		drm_atomic_connector_print_state(p, connector_state);
> +
> +	for_each_old_private_obj_in_state(state, obj, obj_state, i)
> +		drm_atomic_private_obj_print_state(p, obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_print_old_state);
> +
>  static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
>  			     bool take_locks)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_plane *plane;
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 89706aa8232fc0b2830af67c7588985a29653299..a8139fda1a1015c2ac8d8af3b12c5ac0b00cfc1a 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -249,10 +249,12 @@ int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
>  int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>  				   struct drm_atomic_state *state);
>  
>  void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>  		struct drm_printer *p);
> +void drm_atomic_print_old_state(const struct drm_atomic_state *state,
> +				struct drm_printer *p);
>  
>  /* drm_atomic_uapi.c */
>  int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
>  				     struct drm_connector *connector,
>  				     int mode);

-- 
Regards,

Laurent Pinchart
