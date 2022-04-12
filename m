Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58F4FE234
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141A610E965;
	Tue, 12 Apr 2022 13:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7538610E965;
 Tue, 12 Apr 2022 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649769625; x=1681305625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F5DrwCYc4rg9n8kivlBj3MPhar/heY2mgeWZA41LUfs=;
 b=OE3e5rFognvKZtP7wuTcOG6cK+gDmhaUM6erabulTA+D44+YdqdX8wce
 LPpcuUBlqdhntZwTngfI2DuVRCi7Omlr4QqBbHvj9CAYw5tG6EDetXXhx
 usBx0BAKXaq24XEthSnWT0e0y4qLGUZMGPkV0P1U5psW/9KVGZPB5GBfj
 gWc0QNJtKbdCn0qiBJ8AhkdwHXdPxVaXgeVka1J4pX1sBE6Wn/XdRBRot
 Pqhwa8Neef38If/f2+iVmw9yzuGfn7LU2YqwbZ7eFJHcM55uCzFCk0xf+
 +c2p6SyiMiz3nLJqv1pmcjVDGCrvpf3eBBFT21GuW4LMqV3Gh5bhOVNKb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="259967508"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="259967508"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:20:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="507540868"
Received: from aguzmanb-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:20:20 -0700
Date: Tue, 12 Apr 2022 09:20:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 02/10] drm/hdcp: Avoid changing crtc state in hdcp
 atomic check
Message-ID: <YlV8ki79h9jYj3Dw@intel.com>
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-3-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-3-sean@poorly.run>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 markyacoub@chromium.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, Thomas Zimmermann <tzimmermann@suse.de>,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 08:47:31PM +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Instead of forcing a modeset in the hdcp atomic check, simply return
> true if the content protection value is changing and let the driver
> decide whether a modeset is required or not.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-3-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-3-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-3-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-3-sean@poorly.run #v4
> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> ---
>  drivers/gpu/drm/drm_hdcp.c                  | 33 +++++++++++++++------
>  drivers/gpu/drm/i915/display/intel_atomic.c |  5 ++--
>  include/drm/drm_hdcp.h                      |  2 +-
>  3 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index 522326b03e66..dd8fa91c51d6 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -430,11 +430,14 @@ EXPORT_SYMBOL(drm_hdcp_update_content_protection);
>   * @connector: drm_connector on which content protection state needs an update
>   *
>   * This function can be used by display drivers to perform an atomic check on the
> - * hdcp state elements. If hdcp state has changed, this function will set
> - * mode_changed on the crtc driving the connector so it can update its hardware
> - * to match the hdcp state.
> + * hdcp state elements. If hdcp state has changed in a manner which requires the
> + * driver to enable or disable content protection, this function will return
> + * true.
> + *
> + * Returns:
> + * true if the driver must enable/disable hdcp, false otherwise
>   */
> -void drm_hdcp_atomic_check(struct drm_connector *connector,
> +bool drm_hdcp_atomic_check(struct drm_connector *connector,
>  			   struct drm_atomic_state *state)
>  {
>  	struct drm_connector_state *new_conn_state, *old_conn_state;
> @@ -452,10 +455,12 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
>  		 * If the connector is being disabled with CP enabled, mark it
>  		 * desired so it's re-enabled when the connector is brought back
>  		 */
> -		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
>  			new_conn_state->content_protection =
>  				DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> +			return true;
> +		}
> +		return false;
>  	}
>  
>  	new_crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -467,9 +472,19 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
>  	*/
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
>  	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)) {
>  		new_conn_state->content_protection =
>  			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return true;
> +	}
> +
> +	/*
> +	 * Coming back from disable or changing CRTC with DESIRED state requires
> +	 * that the driver try CP enable.
> +	 */
> +	if (new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	    new_conn_state->crtc != old_conn_state->crtc)
> +		return true;

I'm with the feeling that this chunk should deserve a separated patch.
But the reason looks correct so anyway

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  	/*
>  	 * Nothing to do if content type is unchanged and one of:
> @@ -484,9 +499,9 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
>  	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
>  		if (old_conn_state->hdcp_content_type ==
>  				new_conn_state->hdcp_content_type)
> -			return;
> +			return false;
>  	}
>  
> -	new_crtc_state->mode_changed = true;
> +	return true;
>  }
>  EXPORT_SYMBOL(drm_hdcp_atomic_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index b301a4d1017e..6d24b3450399 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -124,8 +124,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
>  
> -	drm_hdcp_atomic_check(conn, state);
> -
>  	if (!new_state->crtc)
>  		return 0;
>  
> @@ -142,7 +140,8 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>  	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
>  	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
>  	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
> -	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
> +	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state) ||
> +	    drm_hdcp_atomic_check(conn, state))
>  		crtc_state->mode_changed = true;
>  
>  	return 0;
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index d49977a042e1..e6e3d16bc7d3 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -301,7 +301,7 @@ int drm_connector_attach_content_protection_property(
>  		struct drm_connector *connector, bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector *connector,
>  					u64 val);
> -void drm_hdcp_atomic_check(struct drm_connector *connector,
> +bool drm_hdcp_atomic_check(struct drm_connector *connector,
>  			   struct drm_atomic_state *state);
>  
>  /* Content Type classification for HDCP2.2 vs others */
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
