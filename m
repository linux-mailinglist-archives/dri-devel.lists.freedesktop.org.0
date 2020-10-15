Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4328F86E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 20:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EE96E207;
	Thu, 15 Oct 2020 18:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A086E207;
 Thu, 15 Oct 2020 18:23:57 +0000 (UTC)
IronPort-SDR: D/F+OnZUNHFu49CXrZnPru+PmzpbxBGmcXc47Q+xrVhG27ujt68KV6uIe8ut2TKNjdksQR2A1+
 NiABoa0QQJVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="163804562"
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; d="scan'208";a="163804562"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:23:57 -0700
IronPort-SDR: e50qo+P6RG8MjztVp6acCwhEEEFKq3UXXq0w+mz0DSx9S3H83r3F2BG+zosibmSLnxROfHQioM
 gO0MUncPLjyw==
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; d="scan'208";a="421234189"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:23:56 -0700
Date: Thu, 15 Oct 2020 14:25:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v2 1/8] drm/i915/dp: Program source OUI on eDP panels
Message-ID: <20201015182542.GB2616619@intel.com>
References: <20200916171855.129511-1-lyude@redhat.com>
 <20200916171855.129511-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916171855.129511-2-lyude@redhat.com>
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 01:18:48PM -0400, Lyude Paul wrote:
> Since we're about to start adding support for Intel's magic HDR
> backlight interface over DPCD, we need to ensure we're properly
> programming this field so that Intel specific sink services are exposed.
> Otherwise, 0x300-0x3ff will just read zeroes.
> 
> We also take care not to reprogram the source OUI if it already matches
> what we expect. This is just to be careful so that we don't accidentally
> take the panel out of any backlight control modes we found it in.
> 
> v2:
> * Add careful parameter to intel_edp_init_source_oui() to avoid
>   re-writing the source OUI if it's already been set during driver
>   initialization
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4bd10456ad188..7db2b6a3cd52e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3424,6 +3424,29 @@ void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
>  			    enable ? "enable" : "disable");
>  }
>  
> +static void
> +intel_edp_init_source_oui(struct intel_dp *intel_dp, bool careful)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	u8 oui[] = { 0x00, 0xaa, 0x01 };
> +	u8 buf[3] = { 0 };
> +
> +	/*
> +	 * During driver init, we want to be careful and avoid changing the source OUI if it's
> +	 * already set to what we want, so as to avoid clearing any state by accident
> +	 */
> +	if (careful) {

my first reaction here is why the problem described on the commit message doesn't
appear during the init, and setting it to the same shouldn't be a problem... but
yeap, I agree the risk of taking panel down is high... let's move with the careful approach


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> +		if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) < 0)
> +			drm_err(&i915->drm, "Failed to read source OUI\n");
> +
> +		if (memcmp(oui, buf, sizeof(oui)) == 0)
> +			return;
> +	}
> +
> +	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) < 0)
> +		drm_err(&i915->drm, "Failed to write source OUI\n");
> +}
> +
>  /* If the sink supports it, try to set the power state appropriately */
>  void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
>  {
> @@ -3443,6 +3466,10 @@ void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
>  	} else {
>  		struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
>  
> +		/* Write the source OUI as early as possible */
> +		if (intel_dp_is_edp(intel_dp))
> +			intel_edp_init_source_oui(intel_dp, false);
> +
>  		/*
>  		 * When turning on, we need to retry for 1ms to give the sink
>  		 * time to wake up.
> @@ -4607,6 +4634,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
>  		intel_dp_get_dsc_sink_cap(intel_dp);
>  
> +	/*
> +	 * If needed, program our source OUI so we can make various Intel-specific AUX services
> +	 * available (such as HDR backlight controls)
> +	 */
> +	intel_edp_init_source_oui(intel_dp, true);
> +
>  	return true;
>  }
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
