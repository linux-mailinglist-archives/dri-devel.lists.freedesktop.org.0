Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48778D5BB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229C510E506;
	Wed, 30 Aug 2023 12:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A359F10E506;
 Wed, 30 Aug 2023 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693396954; x=1724932954;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=KAIn8zcUVsY7lR+dgOcre9ON6BCkdhnH1COZwODlavs=;
 b=OpCyLuJpn2YNS8P/nQC9iZ+UFor1SGQRsuECO9f4cVj+4INMQPvdgv5q
 7lXmDVff+RAoEstRT9V6NdBFalDMV08rKawG8GHZ3xkmuO1Y425WuiOh1
 1paPn5Nta0Xktdq3lphCCsKVpSGiZyAWI9ktnxXPl1ZAEE5TOCtbBzPoz
 YqdW2kUILLv9rT20LqZom1vFsAIXDSCkVKQ78zrA9OKt78+pzTyd8HZvs
 6r44BGlumwJ6M8dnFlCgs0a+Q+sftksGF/oCVryv/lpF+NwxlDABLpaze
 rcKRTLLpExrLBhiKxdCMNb/tUzKXGZ3Qco1YGnF4drCNKtNMG5bXEqeEH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375577495"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="375577495"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="774093740"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="774093740"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:02:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp
 while computing DSC max input bpp
In-Reply-To: <20230824125121.840298-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
 <20230824125121.840298-3-ankit.k.nautiyal@intel.com>
Date: Wed, 30 Aug 2023 15:02:18 +0300
Message-ID: <87v8cwzqk5.fsf@intel.com>
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

On Thu, 24 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Edid specific BPC constraints are stored in limits->max_bpp. Honor these
> limits while computing the input bpp for DSC.
>
> v2: Use int instead of u8 for computations. (Jani)
> Add closes tag. (Ankit)
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9161
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7067ee3a4bd3..8f3dc79089ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2061,9 +2061,10 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  	if (forced_bpp) {
>  		pipe_bpp = forced_bpp;
>  	} else {
> +		int max_bpc = min(limits->max_bpp / 3, (int)conn_state->max_requested_bpc);

Hmh, only noticed after pushing, there's min_t() for when the types
differ.

BR,
Jani.

> +
>  		/* For eDP use max bpp that can be supported with DSC. */
> -		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
> -							conn_state->max_requested_bpc);
> +		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, max_bpc);
>  		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>  			drm_dbg_kms(&i915->drm,
>  				    "Computed BPC is not in DSC BPC limits\n");

-- 
Jani Nikula, Intel Open Source Graphics Center
