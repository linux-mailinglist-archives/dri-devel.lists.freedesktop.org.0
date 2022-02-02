Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E54A6E9A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D833810E5BC;
	Wed,  2 Feb 2022 10:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D13410E5D1;
 Wed,  2 Feb 2022 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643797408; x=1675333408;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=DwShpkMqfnADyZO09QsN+dxveQVMTBFE04oG7QfT3C0=;
 b=Q7KTc6uAh5/ie3F3qFRMR/8RGuypgyT2ZU+5f/6m3xQSsoy7G9Vd07e2
 JjLbc9PHeF3XUgCurIIaQ1AeGMwNeMHpqF9T+V906qyre+8T3kiIV3CVO
 sS7OsJukkKlXN+Nc+5ybYM0yEQl+GpFPGJN1FO0cuEM2LOUngxTueb3Qz
 yc4bi3kFV82dtXknpl1I2EbYkWOwhTnOPiLeUe5ZQ9nEtMrKqaOvDPDN3
 PNWMj8LlF562ecoZUiHjNrpftSNjR958ZScAi93qfE8guKMTHCV6JVv6b
 0yfW94fy122daU5iiqxiamumRWwc7dKHfk/lMNFAhBeD7FoTwDMahsPNP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="334245984"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="334245984"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:23:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="480057242"
Received: from markeyp-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.6.210])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:23:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 5/8] drm/i915/dp: rewrite DP 2.0 128b/132b link training
 based on errata
In-Reply-To: <YfJOn4RQMAzjaP4i@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1643130139.git.jani.nikula@intel.com>
 <5c061c1610834b9b1b057e6d32b774e7db5500a8.1643130139.git.jani.nikula@intel.com>
 <YfJOn4RQMAzjaP4i@intel.com>
Date: Wed, 02 Feb 2022 12:23:23 +0200
Message-ID: <87czk5tvms.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 27 Jan 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Jan 25, 2022 at 07:03:43PM +0200, Jani Nikula wrote:
> <snip>
>> +static bool
>> +intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
>> +			   const struct intel_crtc_state *crtc_state,
>> +			   int lttpr_count)
>> +{
>> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> +	struct drm_i915_private *i915 =3D to_i915(encoder->base.dev);
>> +	u8 link_status[DP_LINK_STATUS_SIZE];
>> +	unsigned long deadline;
>> +
>> +	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
>> +			       DP_TRAINING_PATTERN_2_CDS) !=3D 1) {
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS2 CDS\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	deadline =3D jiffies + msecs_to_jiffies((lttpr_count + 1) * 20);
>> +	for (;;) {
>> +		usleep_range(2000, 3000);
>> +
>> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Failed to read link status\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (drm_dp_128b132b_cds_interlane_align_done(link_status) &&
>> +		    drm_dp_128b132b_lane_symbol_locked(link_status, crtc_state->lane_=
count)) {
>
> I'm thinkin we want to check for both eq done and symbol locked here,
> just like we do with 8b10b.

I guess so, although I don't think the spec explicitly calls that out.

Fixed anyway.

>
>> +			drm_dbg_kms(&i915->drm,
>> +				    "[ENCODER:%d:%s] CDS interlane align done\n",
>> +				    encoder->base.base.id, encoder->base.name);
>> +			break;
>> +		}
>> +
>> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Downstream link training failure\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (time_after(jiffies, deadline)) {
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] CDS timeout\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	/* FIXME: Should DP_TRAINING_PATTERN_DISABLE be written first? */
>> +	if (intel_dp->set_idle_link_train)
>> +		intel_dp->set_idle_link_train(intel_dp, crtc_state);
>> +
>> +	return true;
>> +}

--=20
Jani Nikula, Intel Open Source Graphics Center
