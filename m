Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1B49DBE3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B53210E29D;
	Thu, 27 Jan 2022 07:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1567310E29D;
 Thu, 27 Jan 2022 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643269795; x=1674805795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P0LlQC3j6GRO+D0UT6fE5CDBiJFC1isnKfWhAGQIG+g=;
 b=jh81JmjhnEkkaE6IbBhFKg5OWPMUx/5Kx+rrosnaH0mbtZh4Fn/WRBDM
 NkXqLLh3Ov7bCvAeVBpnrCZinMGnoUo8LjlMIIClXkMHE8mkRLi5ICgN3
 txoIgYNUSr40uGX6AsfqQ7k3fBLX4igoooFYkrAi+Hv/mwESXsEQaqSU5
 EZmQiqPMnJircmYSa+Gk+pULLmwh8999EYHPwdqolh/x3lx5Ourw5ddI5
 HDAWCM54yKH2JTrr6HV7vYEI1qbs+13EShGiA+AzoNfJTiB1Rl/1q0uB/
 BIReHOSkXr+R7ydgYNnZ1GBfL1ZXmGNKB8hI+/FsKGYVb0zeCY2QQErLY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246724698"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="246724698"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="535526247"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga008.jf.intel.com with SMTP; 26 Jan 2022 23:49:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 09:49:51 +0200
Date: Thu, 27 Jan 2022 09:49:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 5/8] drm/i915/dp: rewrite DP 2.0 128b/132b link training
 based on errata
Message-ID: <YfJOn4RQMAzjaP4i@intel.com>
References: <cover.1643130139.git.jani.nikula@intel.com>
 <5c061c1610834b9b1b057e6d32b774e7db5500a8.1643130139.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c061c1610834b9b1b057e6d32b774e7db5500a8.1643130139.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 07:03:43PM +0200, Jani Nikula wrote:
<snip>
> +static bool
> +intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
> +			   const struct intel_crtc_state *crtc_state,
> +			   int lttpr_count)
> +{
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> +	u8 link_status[DP_LINK_STATUS_SIZE];
> +	unsigned long deadline;
> +
> +	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
> +			       DP_TRAINING_PATTERN_2_CDS) != 1) {
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS2 CDS\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	deadline = jiffies + msecs_to_jiffies((lttpr_count + 1) * 20);
> +	for (;;) {
> +		usleep_range(2000, 3000);
> +
> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Failed to read link status\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (drm_dp_128b132b_cds_interlane_align_done(link_status) &&
> +		    drm_dp_128b132b_lane_symbol_locked(link_status, crtc_state->lane_count)) {

I'm thinkin we want to check for both eq done and symbol locked here,
just like we do with 8b10b.

> +			drm_dbg_kms(&i915->drm,
> +				    "[ENCODER:%d:%s] CDS interlane align done\n",
> +				    encoder->base.base.id, encoder->base.name);
> +			break;
> +		}
> +
> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Downstream link training failure\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (time_after(jiffies, deadline)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] CDS timeout\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +	}
> +
> +	/* FIXME: Should DP_TRAINING_PATTERN_DISABLE be written first? */
> +	if (intel_dp->set_idle_link_train)
> +		intel_dp->set_idle_link_train(intel_dp, crtc_state);
> +
> +	return true;
> +}

-- 
Ville Syrjälä
Intel
