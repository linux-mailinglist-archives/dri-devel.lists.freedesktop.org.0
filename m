Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46269FF0B8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 17:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8B110E68D;
	Tue, 31 Dec 2024 16:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yxe3dzDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A1D10E68D;
 Tue, 31 Dec 2024 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735663228; x=1767199228;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ihDyzv8zAeJmb3fL+7bAV0l65aTKkCr9bEUZCayJL4U=;
 b=Yxe3dzDvbxTrqrMs1lR80KlbX2/n+r4Fes59HXHCks93YXP93Yl0daKe
 r3U/ITmedztBZkrKtTo4IAGmV/CyThajY2wfwhTgZAVSFwsTo3KYVk8LL
 9Z8HPtoxpXgMYkwkVi/PxbkaZ32Yuimoa1Js3gB13XJHTOaO25hbqWUkk
 iRF9kfE42DtgyQJanSAiv6QzfD1QgNJJx+y/OK6qMAzywPSoZCk+fJyoL
 LYoOhc5e8/krwqWfgdhNcKlWRlSuRP7w6eXPhHDxzGEBtbXhYDQC8cU3X
 UnP4QqymtvqEMp9OyucLikwBePVzEU9Lf+1bypNdZm7ou346XjunmJ6ZQ A==;
X-CSE-ConnectionGUID: 4l+JhZzRQeKrlK3qdRufdQ==
X-CSE-MsgGUID: txnOJ1FhQaK7So/1IpC53w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61317876"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="61317876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:40:28 -0800
X-CSE-ConnectionGUID: LJ6sTJaEQXqlJGoGXGCv0g==
X-CSE-MsgGUID: Bt3i6jSBS0OFzUS/kYAMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101508709"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:40:26 -0800
Date: Tue, 31 Dec 2024 18:41:17 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 10/16] drm/i915/ddi: write payload for 128b/132b SST
Message-ID: <Z3QerVHWpJ5aN8eT@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <5ce97e5f6c2dd4d5ee3181b2d4ed968eb806534c.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ce97e5f6c2dd4d5ee3181b2d4ed968eb806534c.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:33:59PM +0200, Jani Nikula wrote:
> Write the payload allocation table for 128b/132b SST. Use VCPID 1 and
> start from slot 0, with dp_m_n.tu slots.
> 
> This is preparation for enabling 128b/132b SST. This path is not
> reachable yet. Indeed, we don't yet compute TU for 128b/132b SST.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 6f813bf85b23..64528ff8856e 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2669,6 +2669,12 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	/* 6.o Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
>  
> +	/* 7.a 128b/132b SST. */
> +	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
> +		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
> +		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);

I would handle the error by sending a modeset retry uevent. Either way:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> +	}
> +
>  	if (!is_mst)
>  		intel_dsc_dp_pps_write(encoder, crtc_state);
>  }
> @@ -2808,6 +2814,11 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	/* 7.l Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
>  
> +	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
> +		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
> +		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
> +	}
> +
>  	if (!is_mst)
>  		intel_dsc_dp_pps_write(encoder, crtc_state);
>  }
> -- 
> 2.39.5
> 
