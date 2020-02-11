Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D031715915A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 15:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752576EA80;
	Tue, 11 Feb 2020 14:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71036EA75;
 Tue, 11 Feb 2020 14:03:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 06:03:37 -0800
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="226511538"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 06:03:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH v2 01/12] drm/i915/dp: convert to struct drm_device based
 logging macros.
In-Reply-To: <20200206080014.13759-2-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
 <20200206080014.13759-2-wambui.karugax@gmail.com>
Date: Tue, 11 Feb 2020 16:03:31 +0200
Message-ID: <87o8u5z0ek.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Feb 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> @@ -5990,11 +6040,13 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
>  static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
>  				   u8 *bksv)
>  {
> +	struct intel_dp *intel_dp = &intel_dig_port->dp;
>  	ssize_t ret;
>  	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
>  			       DRM_HDCP_KSV_LEN);
>  	if (ret != DRM_HDCP_KSV_LEN) {
> -		DRM_DEBUG_KMS("Read Bksv from DP/AUX failed (%zd)\n", ret);
> +		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
> +			    "Read Bksv from DP/AUX failed (%zd)\n", ret);
>  		return ret >= 0 ? -EIO : ret;
>  	}

If you're introducing local variables just for logging, I would prefer
it to be i915.

	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);

	...

	drm_dbg_kms(&i915->drm, ...);

If you look at dp_to_i915() it actually converts intel_dp back to
intel_digital_port, and then does the above to it, to get at i915. This
is an unnecessary dance.

It's fine to use &dp_to_i915(intel_dp)->drm when there are only a couple
of logging calls in a function, and intel_dp is already there. But any
more than that, and I'd add the i915 local variable. For example, but
not limited to, intel_dp_handle_test_request() would benefit from i915
local var.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
