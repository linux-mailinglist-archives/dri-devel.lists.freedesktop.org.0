Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B655767D448
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299D10E975;
	Thu, 26 Jan 2023 18:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F78C10E975;
 Thu, 26 Jan 2023 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674758201; x=1706294201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8O3O3NcCzjqZ0coZTHbLYJiTX+VxZUPC30aZ9kiJdO4=;
 b=FBHFTa8zSAUFP/EKDdUMsVFt9CdKoduYXhyhal/M/pPtoTATcDl76Fo4
 exwEcPDl7uZfN9rNGgoHY3d8m0/S08Aw2K1TqhgbKTWsPTuHuWLSQ7OMt
 Aq65BcCH+bfAfOk+F8gQMbyUWiWwN6fXynGv9cfhJhh4nBLsK4ccZEa56
 h64YoTQSL3Wz5BfgVA1rTTigyK847SdnWSUDXL12zjCAvXSAYj8D8uPkW
 M6ThIZpI7P4DpgF+qvR6Ua4tH8Lwu8vO5EtdhKdkkh52LFNsxg7RbgBTs
 hPAT0TsCXsIdxQXkilbzJ2RAjVOgOiOZa5jlKjAdAnyHtm68Hix+mPynx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="310505955"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="310505955"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 10:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="695223226"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="695223226"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 26 Jan 2023 10:36:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 26 Jan 2023 20:36:20 +0200
Date: Thu, 26 Jan 2023 20:36:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 3/9] drm/display/dp_mst: Add
 drm_atomic_get_old_mst_topology_state()
Message-ID: <Y9LIJE85qySKUODU@intel.com>
References: <20230125114852.748337-1-imre.deak@intel.com>
 <20230125114852.748337-4-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230125114852.748337-4-imre.deak@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 01:48:46PM +0200, Imre Deak wrote:
> Add a function to get the old MST topology state, required by a
> follow-up i915 patch.
> 
> While at it clarify the code comment of
> drm_atomic_get_new_mst_topology_state().
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org # 6.1
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 29 +++++++++++++++++--
>  include/drm/display/drm_dp_mst_helper.h       |  3 ++
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index ebf6e31e156e0..81cc0c3b1e000 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5362,18 +5362,43 @@ struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_a
>  }
>  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>  
> +/**
> + * drm_atomic_get_old_mst_topology_state: get old MST topology state in atomic state, if any
> + * @state: global atomic state
> + * @mgr: MST topology manager, also the private object in this case
> + *
> + * This function wraps drm_atomic_get_old_private_obj_state() passing in the MST atomic
> + * state vtable so that the private object state returned is that of a MST
> + * topology object.
> + *
> + * Returns:
> + *
> + * The old MST topology state, or NULL if there's no topology state for this MST mgr
> + * in the global atomic state
> + */
> +struct drm_dp_mst_topology_state *
> +drm_atomic_get_old_mst_topology_state(struct drm_atomic_state *state,
> +				      struct drm_dp_mst_topology_mgr *mgr)
> +{
> +	struct drm_private_state *priv_state =

I would include 'old_' in the variable name to remind the reader what it
is.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		drm_atomic_get_old_private_obj_state(state, &mgr->base);
> +
> +	return priv_state ? to_dp_mst_topology_state(priv_state) : NULL;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_mst_topology_state);
> +
>  /**
>   * drm_atomic_get_new_mst_topology_state: get new MST topology state in atomic state, if any
>   * @state: global atomic state
>   * @mgr: MST topology manager, also the private object in this case
>   *
> - * This function wraps drm_atomic_get_priv_obj_state() passing in the MST atomic
> + * This function wraps drm_atomic_get_new_private_obj_state() passing in the MST atomic
>   * state vtable so that the private object state returned is that of a MST
>   * topology object.
>   *
>   * Returns:
>   *
> - * The MST topology state, or NULL if there's no topology state for this MST mgr
> + * The new MST topology state, or NULL if there's no topology state for this MST mgr
>   * in the global atomic state
>   */
>  struct drm_dp_mst_topology_state *
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index f5eb9aa152b14..32c764fb9cb56 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -868,6 +868,9 @@ struct drm_dp_mst_topology_state *
>  drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
>  				  struct drm_dp_mst_topology_mgr *mgr);
>  struct drm_dp_mst_topology_state *
> +drm_atomic_get_old_mst_topology_state(struct drm_atomic_state *state,
> +				      struct drm_dp_mst_topology_mgr *mgr);
> +struct drm_dp_mst_topology_state *
>  drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
>  				      struct drm_dp_mst_topology_mgr *mgr);
>  struct drm_dp_mst_atomic_payload *
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
