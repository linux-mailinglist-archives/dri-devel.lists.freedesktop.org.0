Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4C4B22D3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 11:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E948210EA67;
	Fri, 11 Feb 2022 10:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4C10EA66;
 Fri, 11 Feb 2022 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644574289; x=1676110289;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=b4hMAeoDaRrPtaYMhAeKaZsyrYqSAbHgNHcQLOb62jg=;
 b=Sak/Pt9wzOwLZMRkMqax4y9O/xyPZ5xf7C1SBrt+B74vvc2krGbRzjhu
 s+6SFPPcisgY0YIqPtRMi3XORFkL3ynXpTPSeZ3amzQdRm3hl4aiGjuR8
 uGeT2+/Y1PY1j54Wn/b/KWgLFhtdFokRpbBMWIFT342uRZpGpK8esre+M
 R9UWk6ZNeDKWeLJDXX+/Rgm7GufNyEIWj5qxc3OCpZaatR+2ITrdKGkT/
 AoWsA5cyudUB6o8zC0qnG8nGshKLD7rTNvjBhIcoGHHvlGTdzboYT2drB
 p8gVNXIcNeSpoKjLYM13Y519BuGv8AYaCXFyFcJuIhFVsiEvHc5OS7mEd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230347605"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="230347605"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:11:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="623177683"
Received: from rriverox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:11:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 6/8] drm/i915/dp: add 128b/132b support to link
 status checks
In-Reply-To: <YgOGqmEigGnYIK8f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1643878928.git.jani.nikula@intel.com>
 <cec395d435679a290a1c35fcbfc54555101bfad1.1643878928.git.jani.nikula@intel.com>
 <YgKG8JFIKC6PRmMG@intel.com> <87sfsspfsa.fsf@intel.com>
 <YgOGqmEigGnYIK8f@intel.com>
Date: Fri, 11 Feb 2022 12:11:24 +0200
Message-ID: <87v8xl7lwz.fsf@intel.com>
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Feb 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Feb 09, 2022 at 11:09:41AM +0200, Jani Nikula wrote:
>> On Tue, 08 Feb 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Thu, Feb 03, 2022 at 11:03:55AM +0200, Jani Nikula wrote:
>> >> Abstract link status check to a function that takes 128b/132b and 8b/=
10b
>> >> into account, and use it. Also dump link status on failures.
>> >>=20
>> >> Cc: Uma Shankar <uma.shankar@intel.com>
>> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/i915/display/intel_dp.c       | 39 ++++++++++++++---=
--
>> >>  .../drm/i915/display/intel_dp_link_training.c |  2 +-
>> >>  .../drm/i915/display/intel_dp_link_training.h |  4 ++
>> >>  3 files changed, 34 insertions(+), 11 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/dr=
m/i915/display/intel_dp.c
>> >> index 146b83916005..8c5590f0409a 100644
>> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> >> @@ -3628,6 +3628,32 @@ static void intel_dp_handle_test_request(struc=
t intel_dp *intel_dp)
>> >>  			    "Could not write test response to sink\n");
>> >>  }
>> >>=20=20
>> >> +static bool intel_dp_link_ok(struct intel_dp *intel_dp,
>> >> +			     u8 link_status[DP_LINK_STATUS_SIZE])
>> >> +{
>> >> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> >> +	struct drm_i915_private *i915 =3D to_i915(encoder->base.dev);
>> >> +	bool uhbr =3D intel_dp->link_rate >=3D 1000000;
>> >> +	bool ok;
>> >> +
>> >> +	if (uhbr)
>> >> +		ok =3D drm_dp_128b132b_lane_channel_eq_done(link_status,
>> >> +							  intel_dp->lane_count);
>> >
>> > I was pondering whether we need to check more of the bits here. I guess
>> > time will tell.
>> >
>> > Remainder of the series is
>> > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Just to be on the safe side, does this cover patches 2 and 4 too?
>
> Yeah, pretty sure I read through all of them.

Thanks, pushed to drm-intel-next, patches 1-3 with Thomas' irc ack.

BR,
Jani.



>
>>=20
>> And thanks for all the reviews so far, much appreciated!
>>
>> BR,
>> Jani.
>>=20
>>=20
>> >
>> >> +	else
>> >> +		ok =3D drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
>> >> +
>> >> +	if (ok)
>> >> +		return true;
>> >> +
>> >> +	intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> >> +	drm_dbg_kms(&i915->drm,
>> >> +		    "[ENCODER:%d:%s] %s link not ok, retraining\n",
>> >> +		    encoder->base.base.id, encoder->base.name,
>> >> +		    uhbr ? "128b/132b" : "8b/10b");
>> >> +
>> >> +	return false;
>> >> +}
>> >> +
>> >>  static void
>> >>  intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
>> >>  {
>> >> @@ -3658,14 +3684,7 @@ static bool intel_dp_mst_link_status(struct in=
tel_dp *intel_dp)
>> >>  		return false;
>> >>  	}
>> >>=20=20
>> >> -	if (!drm_dp_channel_eq_ok(link_status, intel_dp->lane_count)) {
>> >> -		drm_dbg_kms(&i915->drm,
>> >> -			    "[ENCODER:%d:%s] channel EQ not ok, retraining\n",
>> >> -			    encoder->base.base.id, encoder->base.name);
>> >> -		return false;
>> >> -	}
>> >> -
>> >> -	return true;
>> >> +	return intel_dp_link_ok(intel_dp, link_status);
>> >>  }
>> >>=20=20
>> >>  /**
>> >> @@ -3779,8 +3798,8 @@ intel_dp_needs_link_retrain(struct intel_dp *in=
tel_dp)
>> >>  					intel_dp->lane_count))
>> >>  		return false;
>> >>=20=20
>> >> -	/* Retrain if Channel EQ or CR not ok */
>> >> -	return !drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
>> >> +	/* Retrain if link not ok */
>> >> +	return !intel_dp_link_ok(intel_dp, link_status);
>> >>  }
>> >>=20=20
>> >>  static bool intel_dp_has_connector(struct intel_dp *intel_dp,
>> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/=
drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> >> index cc2b82d9114c..0686da36c428 100644
>> >> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> >> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> >> @@ -712,7 +712,7 @@ static bool intel_dp_adjust_request_changed(const=
 struct intel_crtc_state *crtc_
>> >>  	return false;
>> >>  }
>> >>=20=20
>> >> -static void
>> >> +void
>> >>  intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy=
 dp_phy,
>> >>  			  const u8 link_status[DP_LINK_STATUS_SIZE])
>> >>  {
>> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/=
drivers/gpu/drm/i915/display/intel_dp_link_training.h
>> >> index dbfb15705aaa..dc1556b46b85 100644
>> >> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
>> >> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
>> >> @@ -29,6 +29,10 @@ void intel_dp_start_link_train(struct intel_dp *in=
tel_dp,
>> >>  void intel_dp_stop_link_train(struct intel_dp *intel_dp,
>> >>  			      const struct intel_crtc_state *crtc_state);
>> >>=20=20
>> >> +void
>> >> +intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy=
 dp_phy,
>> >> +			  const u8 link_status[DP_LINK_STATUS_SIZE]);
>> >> +
>> >>  /* Get the TPSx symbol type of the value programmed to DP_TRAINING_P=
ATTERN_SET */
>> >>  static inline u8 intel_dp_training_pattern_symbol(u8 pattern)
>> >>  {
>> >> --=20
>> >> 2.30.2
>>=20
>> --=20
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
