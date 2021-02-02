Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E130B802
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 07:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D286E8CC;
	Tue,  2 Feb 2021 06:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA136E8CB;
 Tue,  2 Feb 2021 06:48:03 +0000 (UTC)
IronPort-SDR: 4fCk3SJGI6XGlSWHAYhyF9tE73VRczEoOVdCAv57nZb05Pg0gLZDyPkyenVkdJDsDqqa6SHY2W
 tc02+iYAs6Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199721257"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="199721257"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 22:48:00 -0800
IronPort-SDR: EfB3u2sxR7vqBvRdKxhFtCwklQTPrYYF2oLNuuE/inaIFDaheZUOT3shUHaKH5eEbmKfhh/2dD
 bEEBSz18oRmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="391315352"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 01 Feb 2021 22:47:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Feb 2021 08:47:49 +0200
Date: Tue, 2 Feb 2021 08:47:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v7 09/15] drm/i915: Add support for starting FRL training
 for HDMI2.1 via PCON
Message-ID: <YBj1ld2KYjiZ/WAJ@intel.com>
References: <20201218103723.30844-1-ankit.k.nautiyal@intel.com>
 <20201218103723.30844-10-ankit.k.nautiyal@intel.com>
 <YBhmuiFZ4ZsQ7Y+Z@intel.com>
 <9bd995b9-2020-3a1c-0e82-a823cfd06806@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bd995b9-2020-3a1c-0e82-a823cfd06806@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 12:09:47PM +0530, Nautiyal, Ankit K wrote:
> Hi Ville,
> =

> Please find my responses inline.
> =

> On 2/2/2021 2:08 AM, Ville Syrj=E4l=E4 wrote:
> > On Fri, Dec 18, 2020 at 04:07:17PM +0530, Ankit Nautiyal wrote:
> >> This patch adds functions to start FRL training for an HDMI2.1 sink,
> >> connected via a PCON as a DP branch device.
> >> This patch also adds a new structure for storing frl training related
> >> data, when FRL training is completed.
> >>
> >> v2: As suggested by Uma Shankar:
> >> -renamed couple of variables for better clarity
> >> -tweaked the macros used for correct semantics for true/false
> >> -fixed other styling issues.
> >>
> >> v3: Completed the TODO for condition for going to FRL mode.
> >> Modified the condition to determine the required FRL b/w
> >> based only on the Pcon and Sink's max FRL values.
> >> Moved the frl structure initialization to intel_dp_init_connector().
> >>
> >> v4: Fixed typo in initialization of frl structure.
> >>
> >> v5: Always use FRL if its possible, instead of enabling only for
> >> higher modes as done in v3.
> >>
> >> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> Reviewed-by: Uma Shankar <uma.shankar@intel.com> (v2)
> >> ---
> >>   .../drm/i915/display/intel_display_types.h    |   7 +
> >>   drivers/gpu/drm/i915/display/intel_dp.c       | 151 ++++++++++++++++=
++
> >>   drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
> >>   3 files changed, 160 insertions(+)
> > <snip>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c
> >> index 0596d6c24e73..43027a6d5e5e 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -3891,6 +3891,8 @@ static void intel_disable_dp(struct intel_atomic=
_state *state,
> >>   	intel_edp_backlight_off(old_conn_state);
> >>   	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
> >>   	intel_edp_panel_off(intel_dp);
> >> +	intel_dp->frl.is_trained =3D false;
> >> +	intel_dp->frl.trained_rate_gbps =3D 0;
> > This stuff looks rather misplaced (or missing from elsewhere). This code
> > doesn't even get executed on modern platforms.
> =

> I think these two lines should have been added to =

> intel_ddi_post_disable_dp() for TGL+
> =

> My intention was to reset these before disabling DP. In hindsight, since =

> we are initializing (resetting) these in dp_init_connector, this doesnt =

> seem to be required.
> =

> I will send a patch to remove these two lines from here.
> =

> =

> >
> > <snip>
> >> +static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
> >> +{
> >> +#define PCON_EXTENDED_TRAIN_MODE (1 > 0)
> >> +#define PCON_CONCURRENT_MODE (1 > 0)
> >> +#define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE
> >> +#define PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE
> > All of that looks like nonsense. What is it supposed to do?
> =

> When asking an HDMI2.1 PCON to initiate FRL training there are 2 options:
> =

> Sequential/Concurrent mode: Sequential mode attempts the FRL training =

> after DP Link training is completed. Concurrent mode tries to do the FRL =

> training, during DP link training.
> =

> Normal train Mode/ Extended mode: Normal train mode, PCON FW trains FRL =

> from Max to min BW, set by source in BW Mask. It aborts on first =

> successful training. In Extended mode, PCON FW trains for all BW set by =

> source in BW mask.
> =

> For Concurrent and Extended mode we need to set some extra bits in PCON =

> FRL config DPCDs
> =

> The intention was to go with sequential and Normal training mode, so no =

> need to set above bits.
> =

> Do you think, some documentation will make this clear?

I'm asking why does the code do

#define PCON_EXTENDED_TRAIN_MODE true
#define PCON_CONCURRENT_MODE true
#define PCON_SEQUENTIAL_MODE false
#define PCON_NORMAL_TRAIN_MODE false

but in a very convoluted way?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
