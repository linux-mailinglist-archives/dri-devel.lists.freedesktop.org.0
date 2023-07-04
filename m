Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901EA74748C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 16:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0DB10E139;
	Tue,  4 Jul 2023 14:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91DC10E139
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688482455; x=1720018455;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q45WjssFK0DvOFJoqNpQHpdQP4cL0WvjWCwGo0CgDXc=;
 b=dsWR1KbYH5Day25EWD6c3OdA/lTQXEQs4aptdOm61RuTpRf+HNSizigL
 CxcvXlChdy7xa2PiMAisR05wZqQQNsxSwDW8aLHxrXOwdVIkMC/EHwmhs
 UbZnYgGck10xPlgjmNagz5rsyX+rGND871lFfVgtfrgvUzqTs8CkMBNAZ
 NNRqketHFDZH+NIw1MfLrRx5jTx1lN6Q++i6cNBI6zbrxSsWSF6MWUIkb
 KGMSSd0ZOFf5GFQ1yhDg/gxrrrDAFlq2y+CgxAadaGdB8yS08mLFjsYQi
 qs7yREFk7ZaSX4xIjVifyLP644WYvlWWZ5B/4B10ZSkRhR5OHttHa5Cme A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="352968381"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="352968381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 07:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="1049423960"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="1049423960"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 07:54:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
In-Reply-To: <20230623094639.434293-1-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230623094639.434293-1-jfalempe@redhat.com>
Date: Tue, 04 Jul 2023 17:54:10 +0300
Message-ID: <878rbv20dp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>  EDID on DP")
> The default resolution is now 640x480 when no monitor is connected.
> But Aspeed graphics is mostly used in servers, where no monitor
> is attached. This also affects the "remote" resolution to 640x480, which is
> inconvenient, and breaks the anaconda installer.
> So when no EDID is present, set 1024x768 as preferred resolution.

This conflates "monitor connected" and "EDID present", which are not
necessarily the same thing.

The fallback in drm_helper_probe_single_connector_modes() is for no
modes, but connector status is connected or unknown.

You could add a connector ->detect callback that returns disconnected
when there's no display, and the problem should go away. If there's no
->detect callback, it'll default to connected.

> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 36374828f6c8..8f7b7cc021c7 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1589,9 +1589,31 @@ static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs
>  	.get_modes = ast_dp501_connector_helper_get_modes,
>  };
>  
> +static int ast_dp_probe_single_connector_modes(struct drm_connector *connector,
> +					       uint32_t maxX, uint32_t maxY)
> +{
> +	int ret;
> +	struct drm_display_mode *mode;
> +
> +	ret = drm_helper_probe_single_connector_modes(connector, maxX, maxY);
> +	/*
> +	 * When no monitor are detected, DP now default to 640x480
> +	 * As aspeed is mostly used in remote server, and DP monitors are
> +	 * rarely attached, it's better to default to 1024x768
> +	 */
> +	if (!connector->edid_blob_ptr) {

Please try not to use connector->edid_blob_ptr for anything in
drivers. The logic is complicated enough as it is, with the firmware and
override EDIDs and everything, and makes future refactoring of EDID
handling harder.


BR,
Jani.

> +		list_for_each_entry(mode, &connector->modes, head) {
> +			if (mode->hdisplay == 1024 && mode->vdisplay == 768)
> +				mode->type |= DRM_MODE_TYPE_PREFERRED;
> +			drm_mode_sort(&connector->modes);
> +		}
> +	}
> +	return ret;
> +}
> +
>  static const struct drm_connector_funcs ast_dp501_connector_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.fill_modes = ast_dp_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -1678,7 +1700,7 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
>  
>  static const struct drm_connector_funcs ast_astdp_connector_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.fill_modes = ast_dp_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>
> base-commit: 0adec22702d497385dbdc52abb165f379a00efba

-- 
Jani Nikula, Intel Open Source Graphics Center
