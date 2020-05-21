Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A5B1DC66D
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 06:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D9D6E8FA;
	Thu, 21 May 2020 04:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EACA6E10A;
 Thu, 21 May 2020 04:57:25 +0000 (UTC)
IronPort-SDR: CXwIyJpo7lGT89yoF4dHPSpkeDzL+ogOHPuAgV9i2fOYhu1kxn4g1bzb5tapZSQnKO21P3Eok7
 M134/ohkLgGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 21:57:24 -0700
IronPort-SDR: aCWUuRHpZvEwU3E3PUlP/m9OBh3OoIWzy9uzZamFUGxoodjG9GC4TqxFUiaYrtgYWQN2KElR2o
 6ERc3imGdEcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,416,1583222400"; d="scan'208";a="466641071"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005.fm.intel.com with ESMTP; 20 May 2020 21:57:22 -0700
Date: Thu, 21 May 2020 10:27:21 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/i915/hdcp: Avoid duplicate HDCP enables
Message-ID: <20200521045720.GA8571@intel.com>
References: <20200520194744.48936-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520194744.48936-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-20 at 15:47:44 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> If userspace sets the CP property to DESIRED while it's already ENABLED,
> the driver will try to re-enable HDCP. On some displays, this will
> result in R0' mismatches. I'm guessing this is because the display is
> still sending back Ri instead of re-authenticating.
> 
> At any rate, we can fix this inefficiency easily enough by just nooping
> the DESIRED property set if HDCP is already ENABLED.
Sean,

This will skip the hdcp enable.

But at present too we will be getting below WARN_ON from intel_hdcp_enable,
to indicate userspace is going wrong with request.
        drm_WARN_ON(&dev_priv->drm,
                    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);

And if we need to filter this out, could we validate the incoming hdcp request at
drm_atomic_connector_set_property() itself? No point in going into the
atomic commit without a valid request. something like

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a1e5e262bae2..d98b2eeae78d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -746,6 +746,12 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
                        DRM_DEBUG_KMS("only drivers can set CP Enabled\n");
                        return -EINVAL;
                }
+               if (config->content_protection_property ==
+                   DRM_MODE_CONTENT_PROTECTION_ENABLED &&
+                   val == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+                       DRM_DEBUG_KMS("Redundant req for content protection\n");
+                       return -EINVAL;
+               }
                state->content_protection = val;
        } else if (property == config->hdcp_content_type_property) {
                state->hdcp_content_type = val;

-Ram

> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
> 
> I suspect this is the actual root cause I was chasing with
> "drm/i915/hdcp: Add additional R0' wait". I was able to reproduce the
> R0` messages by marking HDCP desired while it was already enabled. This
> _should_ work, but it seems like some displays handle it more graciously
> than others.
> 
> 
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 2cbc4619b4ce..f770fe0c5595 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2156,12 +2156,16 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
>  	}
>  
>  	/*
> -	 * Nothing to do if the state didn't change, or HDCP was activated since
> -	 * the last commit. And also no change in hdcp content type.
> +	 * Nothing to do if content type is unchanged and one of:
> +	 *  - state didn't change
> +	 *  - HDCP was activated since the last commit
> +	 *  - attempting to set to desired while already enabled
>  	 */
>  	if (old_cp == new_cp ||
>  	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> -	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
> +	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
> +	    (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
>  		if (old_state->hdcp_content_type ==
>  				new_state->hdcp_content_type)
>  			return;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
