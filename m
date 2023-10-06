Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA737BC0C1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 22:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D38310E571;
	Fri,  6 Oct 2023 20:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2F10E570
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696625536; x=1728161536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mdR8sVze6vR9EMhQSXoYyw+n3bhscP9vlqkiz5Q1mQI=;
 b=GKjn8A0HQAGaDMnsr3mGCnST2uLa5CmTomIMoBSlyYOQknsETVskfs6H
 t5jG0/ygDAUJglgmuB/jzu1Lu1icTMuRaFKKrX8GLeBnLKO8nxUWH701r
 KifRph0jMoF/WPkxrKqTYaVQi7dAsnRlDCmuJ+mQNOio5B+GCDxhlnu87
 jHWjFIF9fTPBtUetkA86Q+Xpodn3ECuEuwidYNHVZ0IUTBHHKhq8pwRM/
 NZX1Hxy9zSAOJ0UWT7CpT7kPr4YUxqU8p2wI+CG9ze9GZtB5K57CSNuN2
 Z4BAl13Zau/uJkWwc2ChzOEh9Fzm1aN5aMTqs+3nVgb4INK9W6eWO6dMg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="387708828"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="387708828"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 13:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="896016100"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="896016100"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga001.fm.intel.com with SMTP; 06 Oct 2023 13:50:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 Oct 2023 23:52:12 +0300
Date: Fri, 6 Oct 2023 23:52:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic-helper: relax unregistered connector check
Message-ID: <ZSBzfLY2X7IL7Y9j@intel.com>
References: <20231005131623.114379-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005131623.114379-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 01:16:32PM +0000, Simon Ser wrote:
> The driver might pull connectors which weren't submitted by
> user-space into the atomic state. For instance,
> intel_dp_mst_atomic_master_trans_check() pulls in connectors
> sharing the same DP-MST stream. However, if the connector is
> unregistered, this later fails with:
> 
>     [  559.425658] i915 0000:00:02.0: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:378:DP-7] is not registered
> 
> Skip the unregistered connector check to allow user-space to turn
> off connectors one-by-one.

Yeah, this seems a bit more reasonble at least than then
current behaviour.

> 
> See this wlroots issue:
> https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3407
> 
> Previous discussion:
> https://lore.kernel.org/intel-gfx/Y6GX7z17WmDSKwta@ideak-desk.fi.intel.com/
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 71d399397107..c9b8343eaa20 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -290,7 +290,8 @@ static int
>  update_connector_routing(struct drm_atomic_state *state,
>  			 struct drm_connector *connector,
>  			 struct drm_connector_state *old_connector_state,
> -			 struct drm_connector_state *new_connector_state)
> +			 struct drm_connector_state *new_connector_state,
> +			 bool added_by_user)
>  {
>  	const struct drm_connector_helper_funcs *funcs;
>  	struct drm_encoder *new_encoder;
> @@ -339,9 +340,13 @@ update_connector_routing(struct drm_atomic_state *state,
>  	 * there's a chance the connector may have been destroyed during the
>  	 * process, but it's better to ignore that then cause
>  	 * drm_atomic_helper_resume() to fail.
> +	 *
> +	 * Last, we want to ignore connector registration when the connector
> +	 * was not pulled in the atomic state by user-space (ie, was pulled
> +	 * in by the driver, e.g. when updating a DP-MST stream).
>  	 */
>  	if (!state->duplicated && drm_connector_is_unregistered(connector) &&
> -	    crtc_state->active) {
> +	    added_by_user && crtc_state->active) {
>  		drm_dbg_atomic(connector->dev,
>  			       "[CONNECTOR:%d:%s] is not registered\n",
>  			       connector->base.id, connector->name);
> @@ -620,7 +625,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_connector_state, *new_connector_state;
>  	int i, ret;
> -	unsigned int connectors_mask = 0;
> +	unsigned int connectors_mask = 0, user_connectors_mask = 0;
> +
> +	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
> +		user_connectors_mask |= BIT(i);
>  
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  		bool has_connectors =
> @@ -685,7 +693,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		 */
>  		ret = update_connector_routing(state, connector,
>  					       old_connector_state,
> -					       new_connector_state);
> +					       new_connector_state,
> +						   BIT(i) & user_connectors_mask);

Alignment looks to be off.

Otherwise
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		if (ret)
>  			return ret;
>  		if (old_connector_state->crtc) {
> -- 
> 2.42.0
> 

-- 
Ville Syrjälä
Intel
