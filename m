Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF483C1C59
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 02:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42016E942;
	Fri,  9 Jul 2021 00:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AD06E93B;
 Fri,  9 Jul 2021 00:02:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="196896996"
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="196896996"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 17:02:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="492312509"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 17:02:31 -0700
Date: Thu, 8 Jul 2021 17:11:58 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 52/53] drm/i915/dg2: Update to bigjoiner path
Message-ID: <20210709001153.GA19155@labuser-Z97X-UD5H>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-53-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701202427.1547543-53-matthew.d.roper@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, Animesh Manna <animesh.manna@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 01:24:26PM -0700, Matt Roper wrote:
> From: Animesh Manna <animesh.manna@intel.com>
> 
> In verify_mpllb_state() encoder is retrieved from best_encoder
> of connector_state. As there will be only one connector_state
> for bigjoiner and checking encoder may not be needed for
> bigjoiner-slave. This code path related to mpll is done on dg2
> and need this fix to avoid null pointer dereference issue.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9655f1b1b41b..3f4e811145b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9153,6 +9153,9 @@ verify_mpllb_state(struct intel_atomic_state *state,
>  	if (!new_crtc_state->hw.active)
>  		return;
>  
> +	if (new_crtc_state->bigjoiner_slave)
> +		return;
> +
>  	encoder = intel_get_crtc_new_encoder(state, new_crtc_state);
>  	intel_mpllb_readout_hw_state(encoder, &mpllb_hw_state);
>  
> -- 
> 2.25.4
> 
