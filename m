Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE14FE267
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769BF10E9C9;
	Tue, 12 Apr 2022 13:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182910E9C1;
 Tue, 12 Apr 2022 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649769963; x=1681305963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1sR9YyKpCjmaeLsLK6XXvoyCmis0p1hZxnsh/V+lDMY=;
 b=Uh5HP8yph2hchFF1RDckAgQ9qdbAleiF+h16LXSJc/1H8uoJosUT45u8
 VUmFiMVQzv7AmHj2VxwZZHDbJVGuEKtbHhAXf5P8V4U+fqniqo/4ia7By
 vfK5gU4plnX6EhHfFnmgSII+u2RARcfta+o4OfK25Xz9+pEm5I0D/ORso
 aRb9EHQKYrQnLrrYcmbBB1Tsm+xU1l6Xiohv+aNnPqbW0FtiQmVbbuIPK
 08fOJPPE1AkB9yDV6cTGSJoBKwIgY79M5dZCVwP4HJMndYm9qwgKz24JD
 86qcolMonoBMWxOgekiEexHSrmv8IESF72ZwZhbYOmtdDvE0e3JVR7QsZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262121828"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="262121828"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:26:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="551709817"
Received: from aguzmanb-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.149])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:26:00 -0700
Date: Tue, 12 Apr 2022 09:25:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 03/10] drm/hdcp: Update property value on content type
 and user changes
Message-ID: <YlV9505orLrKlJfF@intel.com>
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-4-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-4-sean@poorly.run>
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
Cc: jani.nikula@intel.com, markyacoub@chromium.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 Thomas Zimmermann <tzimmermann@suse.de>, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 08:47:32PM +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch updates the connector's property value in 2 cases which were
> previously missed:
> 
> 1- Content type changes. The value should revert back to DESIRED from
>    ENABLED in case the driver must re-authenticate the link due to the
>    new content type.
> 
> 2- Userspace sets value to DESIRED while ENABLED. In this case, the
>    value should be reset immediately to ENABLED since the link is
>    actively being encrypted.
> 
> To accommodate these changes, I've split up the conditionals to make
> things a bit more clear (as much as one can with this mess of state).
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-4-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-4-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-4-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-4-sean@poorly.run #v4
> 
> Changes in v2:
> -None
> Changes in v3:
> -Fixed indentation issue identified by 0-day
> Changes in v4:
> -None
> Changes in v5:
> -None
> ---
>  drivers/gpu/drm/drm_hdcp.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index dd8fa91c51d6..8c851d40cd45 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -487,21 +487,29 @@ bool drm_hdcp_atomic_check(struct drm_connector *connector,
>  		return true;
>  
>  	/*
> -	 * Nothing to do if content type is unchanged and one of:
> -	 *  - state didn't change
> +	 * Content type changes require an HDCP disable/enable cycle.
> +	 */
> +	if (new_conn_state->hdcp_content_type != old_conn_state->hdcp_content_type) {

shouldn't we add some && ( old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
here?

> +		new_conn_state->content_protection =
> +			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return true;
> +	}
> +
> +	/*
> +	 * Ignore meaningless state changes:
>  	 *  - HDCP was activated since the last commit
> -	 *  - attempting to set to desired while already enabled
> +	 *  - Attempting to set to desired while already enabled
>  	 */
> -	if (old_hdcp == new_hdcp ||
> -	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	if ((old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
>  	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
>  	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
>  	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
> -		if (old_conn_state->hdcp_content_type ==
> -				new_conn_state->hdcp_content_type)
> -			return false;
> +		new_conn_state->content_protection =
> +			DRM_MODE_CONTENT_PROTECTION_ENABLED;
> +		return false;
>  	}
>  
> -	return true;
> +	/* Finally, if state changes, we need action */
> +	return old_hdcp != new_hdcp;
>  }
>  EXPORT_SYMBOL(drm_hdcp_atomic_check);
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
