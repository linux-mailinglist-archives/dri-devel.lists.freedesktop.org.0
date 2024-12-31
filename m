Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EC9FF02D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CDD10E0E1;
	Tue, 31 Dec 2024 15:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="br0eXSOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9110E038;
 Tue, 31 Dec 2024 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735658644; x=1767194644;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=DpXR4QsGXATPBzf1/5Pfi2luVZTHiDq7vsY+JX8qM4k=;
 b=br0eXSOM9YQbP9GXYhAjnAH8O78ZzXAEW7OuBfHfi+xVwRVIY4S0CQGR
 oXtlZWVmoYHddMWTS8p6t5piwWDIbT/HDsN07Ha0nyHF3kqZI58q+WYyo
 +DtYsYzXi3vTNd8Xph4rph9eNfkgKaVngAT+1YOQRrKov0D+2pKsTX3ee
 do59PJtHQhgyFAnHgrnbido2771JzwTvk+Qj4mua3nmr1Fl3KLQQS/4Gb
 oHnqJViulN/aXLsA/3AtaU3WAkiynPMRZXm4KghQyYsSyBU5xlNjk8jUn
 q/RG2P5I/EvOGm5P+QBv/MedDuRmIVx4WwWE9m+OSMqg4QebZ3bgJlf08 A==;
X-CSE-ConnectionGUID: egqrDGStTDGqN/KKJankcw==
X-CSE-MsgGUID: Idtr0lytRr+v/dyfeoLOrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35960340"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="35960340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:24:03 -0800
X-CSE-ConnectionGUID: ZBOsPQy3T2CkpbCXGk8FRw==
X-CSE-MsgGUID: II9AxsHwRlqYqH8J+SFfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101492512"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:24:03 -0800
Date: Tue, 31 Dec 2024 17:24:49 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 01/16] drm/mst: remove mgr parameter and debug logging
 from drm_dp_get_vc_payload_bw()
Message-ID: <Z3QMwev5XFamIbND@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <630bd6e1c0c0fee9a8dde08d224cf8f166fd727e.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630bd6e1c0c0fee9a8dde08d224cf8f166fd727e.1734643485.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2024 at 11:33:50PM +0200, Jani Nikula wrote:
> The struct drm_dp_mst_topology_mgr *mgr parameter is only used for debug
> logging in case the passed in link rate or lane count are zero. There's
> no further error checking as such, and the function returns 0.
> 
> There should be no case where the parameters are zero. The returned
> value is generally used as a divisor, and if we were hitting this, we'd
> be seeing division by zero.
> 
> Just remove the debug logging altogether, along with the mgr parameter,
> so that the function can be used in non-MST contexts without the
> topology manager.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
> [...]
> diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> index 89cd9e4f4d32..ad29593d28cf 100644
> --- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> @@ -199,10 +199,8 @@ static const struct drm_dp_mst_calc_pbn_div_test drm_dp_mst_calc_pbn_div_dp1_4_c
>  static void drm_test_dp_mst_calc_pbn_div(struct kunit *test)
>  {
>  	const struct drm_dp_mst_calc_pbn_div_test *params = test->param_value;
> -	/* mgr->dev is only needed by drm_dbg_kms(), but it's not called for the test cases. */
> -	struct drm_dp_mst_topology_mgr *mgr = test->priv;
>  
> -	KUNIT_EXPECT_EQ(test, drm_dp_get_vc_payload_bw(mgr, params->link_rate, params->lane_count).full,
> +	KUNIT_EXPECT_EQ(test, drm_dp_get_vc_payload_bw(params->link_rate, params->lane_count).full,
>  			params->expected.full);
>  }

Allocating the topology manager and setting kunit::priv isn't needed
then either, so that along with drm_dp_mst_helper_tests_init() should be
also removed. With that:

Reviewed-by: Imre Deak <imre.deak@intel.com>
