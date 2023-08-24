Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BE786C37
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2010E518;
	Thu, 24 Aug 2023 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ED010E517;
 Thu, 24 Aug 2023 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692870245; x=1724406245;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=KcEs7AkWZnu2K0bINbHNS2kEw5hRNT7/aym9uh+lCRw=;
 b=N+rBn+6OgRqb31qo8I2FyOd8lkA5ccOYjbwKHqdF9yJyT3RdyG0v+kmt
 3aEAwarVAYQLEZa7rTxXtDZgA6CzOAcxWYoo0a0idu+ze8aW2e8zimPl9
 65cfwtri7IKzTAJFh6NqK4NZlNL+uhJC+SLEZx4BNq84sUf7y2I7yHwSA
 EgfhBM9z2/DMKc7N5HKyylUPOpIyI16EHag2a9kFfBV4PlQ3tT3xJcZj+
 a90S3sMrbKl+L8sB3LUtU1sdrkfFsJkJ7u8bz2yexp8k6R4aquu/evOtn
 vUiPXRHA+wndqoJAySCvMmInKwN4N1dx1hyi44ErZwZYS+eHmnMx+dnec Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374361943"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374361943"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="1067760311"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="1067760311"
Received: from andrzejk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.90])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:44:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp
 while computing DSC max input bpp
In-Reply-To: <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
 <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
Date: Thu, 24 Aug 2023 12:44:00 +0300
Message-ID: <87o7iw4vxb.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Edid specific BPC constraints are stored in limits->max_bpp. Honor these
> limits while computing the input bpp for DSC.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 5b48bfe09d0e..2a7f6cfe2832 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2061,9 +2061,11 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  	if (forced_bpp) {
>  		pipe_bpp = forced_bpp;
>  	} else {
> +		u8 max_bpc = limits->max_bpp / 3;
> +

		int max_bpc = min_t(int, limits->max_bpp / 3, conn_state->max_requested_bpc);

>  		/* For eDP use max bpp that can be supported with DSC. */
>  		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, max_bbc);

Nitpick, IMO looks cleaner this way, as well as uses int instead of u8
for computations.

BR,
Jani.

>  		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>  			drm_dbg_kms(&i915->drm,
>  				    "Computed BPC is not in DSC BPC limits\n");

-- 
Jani Nikula, Intel Open Source Graphics Center
