Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797EBC5614
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB5110E828;
	Wed,  8 Oct 2025 14:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f47+MSuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56810E828
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759932409; x=1791468409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xNkxsl5ee6w8TzcAxRzNiYEtNPQTfj6rEEDefXdujUc=;
 b=f47+MSuHOoBYd763RVqj83MrzC//nXgA8xYYaGIrJ1JIuqkaT+xhN9Ie
 WIDiZGJjapeSrHecqK/ETCSTkYtle1VWaeZrUkoPmCWGYIXZMVsA24FMg
 gLGpCNcovJOjW9aZ4F7pNh/d3JnpWdo4B3qeRm0KBF3QdP0x0mSyL0Ifd
 kFNPshhi0/BamsYFiJmWI0N+krP840imwkIomLxzpY/7m6CgQ48G9xUYd
 RpqPSwf4NLOuJN+aED1zSEzhHCoeADdTnZ/tILd2UDkgHPCmiADOhd5Uz
 dWTq73Ceq0gk9dZi234yOqZtwxntZwabcjlxCrNe+C9dV+p7sN73ijnQh w==;
X-CSE-ConnectionGUID: qo2qQPWKRC2PZmLJSNrFuQ==
X-CSE-MsgGUID: A6PsZKoaRXGlEhFZFQzkyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62290176"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="62290176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:06:49 -0700
X-CSE-ConnectionGUID: 6G6DjIduStusYO7kXSUYeQ==
X-CSE-MsgGUID: aP0KHQIQScuxYTdWMYzXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="185576808"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:06:47 -0700
Date: Wed, 8 Oct 2025 17:06:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <aOZv88NgbjmT49N1@intel.com>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> The DP MST implementation relies on a drm_private_obj, that is
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a reset implementation, let's migrate this
> instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
>  
>  	kfree(mst_state->commit_deps);
>  	kfree(mst_state);
>  }
>  
> +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> +{
> +	struct drm_dp_mst_topology_mgr *mgr =
> +		to_dp_mst_topology_mgr(obj);
> +	struct drm_dp_mst_topology_state *mst_state;
> +
> +	if (obj->state) {
> +		drm_dp_mst_destroy_state(obj, obj->state);
> +		obj->state = NULL;

I'm not a big fan of this "free+reallocate without any way to handle
failures" pattern.

Currently i915 does not do any of this, and so there are no unhandled
points of failure. But the mst and tunneling changes here force it
on i915 as well.

I think for the common things it would be nicer to just implement
the reset as just that "a reset of the current state", and leave
the "let's play fast and loose with kmalloc() failures" to the
drivers that want it.

That said I haven't even thought through whether this mst and
tunneling state reset might have some undesired side effects
since we previously did none of it. I suspect it should be fine,
but at least the mst code does some questionable things with
the state so not 100% sure.

Imre, do you recall if we might somehow depend on preserving
the state across drm_mode_config_reset()?

> +	}
> +
> +	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> +	if (!mst_state)
> +		return;
> +
> +	__drm_atomic_helper_private_obj_reset(obj, &mst_state->base);
> +
> +	mst_state->total_avail_slots = 63;
> +	mst_state->start_slot = 1;
> +
> +	mst_state->mgr = mgr;
> +	INIT_LIST_HEAD(&mst_state->payloads);
> +}
> +
>  static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
>  						 struct drm_dp_mst_branch *branch)
>  {
>  	while (port->parent) {
>  		if (port->parent == branch)
> @@ -5619,10 +5643,11 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
>  EXPORT_SYMBOL(drm_dp_mst_atomic_check);
>  
>  const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs = {
>  	.atomic_duplicate_state = drm_dp_mst_duplicate_state,
>  	.atomic_destroy_state = drm_dp_mst_destroy_state,
> +	.reset = drm_dp_mst_reset,
>  };
>  EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
>  
>  /**
>   * drm_atomic_get_mst_topology_state: get MST topology state
> @@ -5705,12 +5730,10 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_device *dev, struct drm_dp_aux *aux,
>  				 int max_dpcd_transaction_bytes, int max_payloads,
>  				 int conn_base_id)
>  {
> -	struct drm_dp_mst_topology_state *mst_state;
> -
>  	mutex_init(&mgr->lock);
>  	mutex_init(&mgr->qlock);
>  	mutex_init(&mgr->delayed_destroy_lock);
>  	mutex_init(&mgr->up_req_lock);
>  	mutex_init(&mgr->probe_lock);
> @@ -5740,22 +5763,12 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  	mgr->aux = aux;
>  	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
>  	mgr->max_payloads = max_payloads;
>  	mgr->conn_base_id = conn_base_id;
>  
> -	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> -	if (mst_state == NULL)
> -		return -ENOMEM;
> -
> -	mst_state->total_avail_slots = 63;
> -	mst_state->start_slot = 1;
> -
> -	mst_state->mgr = mgr;
> -	INIT_LIST_HEAD(&mst_state->payloads);
> -
>  	drm_atomic_private_obj_init(dev, &mgr->base,
> -				    &mst_state->base,
> +				    NULL,
>  				    &drm_dp_mst_topology_state_funcs);
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
> 
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
