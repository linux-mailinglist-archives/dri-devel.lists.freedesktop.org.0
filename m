Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85548C68FA7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2E810E350;
	Tue, 18 Nov 2025 11:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8fj0FSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021A210E346;
 Tue, 18 Nov 2025 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763463973; x=1794999973;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XUyPpZWQO/7hHOnEZDr1T6NuMTPjfTBry/dhI/ipHGw=;
 b=O8fj0FSXbMxNcAZ8Cvi8Vh0Dy1vN6MLeW3tNWEKglVfGjwh9kJBu7slC
 9STxll8wwZ5MYlpbViVZKkWyVIOsYGhKfAHtFBQCzYAzlQymQMlgNBcs6
 Uxozq/qeOR3apvAtiFM+QqstaxuLiuWRK+jsme5Vn9T48ZkjLfQ3jkih6
 MziT/pYdBFMV4Qit+LTIOHj+MVwWme3Ui7JeeyiV4UqX6vkoDtNuqzmyj
 DFLMMhhOKzqLqJXgi2j6pWsRl4ytKtPsYaUqmygO2NIyYqw21MYQnIH+a
 CsbckKJ2oDk1AHOFNWsR9KvWbm7TZtxbGMrxTOmMP+S/XSUR3Pusx4UU9 A==;
X-CSE-ConnectionGUID: 6uKFaPI5QWCNdo6nLdVO0w==
X-CSE-MsgGUID: ia1Iy5QCQgqWuJz676XS3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76585322"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76585322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:06:12 -0800
X-CSE-ConnectionGUID: IEHaxSpnQwiBpVLSMx2jcw==
X-CSE-MsgGUID: eMP72bHjRrardTeBuMC4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191503038"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:06:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 02/10] drm/i915/alpm: alpm_init() for DP2.1
In-Reply-To: <DS0PR11MB80498D83C22B8B0F77FD1411F9D6A@DS0PR11MB8049.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-3-animesh.manna@intel.com>
 <4577de7373cb6bf2954d8d599168f408c87730c7@intel.com>
 <DS0PR11MB80498D83C22B8B0F77FD1411F9D6A@DS0PR11MB8049.namprd11.prod.outlook.com>
Date: Tue, 18 Nov 2025 13:06:06 +0200
Message-ID: <f34b3346ed026210c40e30cebd4d3a3209bb3d77@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Nov 2025, "Manna, Animesh" <animesh.manna@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Monday, November 17, 2025 8:59 PM
>> To: Manna, Animesh <animesh.manna@intel.com>; intel-
>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; Manna, Animesh
>> <animesh.manna@intel.com>; Hogander, Jouni
>> <jouni.hogander@intel.com>
>> Subject: Re: [PATCH v4 02/10] drm/i915/alpm: alpm_init() for DP2.1
>>=20
>> On Thu, 13 Nov 2025, Animesh Manna <animesh.manna@intel.com> wrote:
>> > Initialize ALPM for DP2.1 and separate out ALPM mutex-init from
>> > alpm-init.
>>=20
>> I thought I said you're going to need multiple init functions. Don't mov=
e the
>> alpm mutex init away from alpm code. It needs to stay in alpm code.
>
> Only for mutex-init do you want me to add a separate function?

Yes, I absolutely do.

It's not about how small or big something is, it's about the
organization of the code. All things alpm should be in
intel_alpm.[ch]. We also have alpm sub-struct in struct intel_dp; as a
rule of thumb only intel_alpm.[ch] should touch stuff in that
sub-struct.

This also sets the example of what to do next, and where to add stuff
next. If you have the mutex init in intel_dp.c, if more init is needed
later, it'll also get added in intel_dp.c, intead of intel_alpm.c where
it belongs.

>> And now the whole patch and subject and commit message talk of
>> completely different things.
>
> Earlier alpm is initialized for EDP only, now its extended for DP2.1 in t=
his patch.
> Earlier mutex init is part of alpm-init. Now after feedback I also felt i=
t can be separate out because reading dpcd always not possible if the displ=
ay is disconnected for dp-connector but mutex-init can be done.
> So mentioned as separate out ALPM mutex-init from alpm-init().
>
>>=20
>> Please read the review comments, and ask questions if they comments are
>> not clear.
>
> Currently I am little confused, need change in code or commit description=
. From here onwards if you can point out some specific change will modify a=
ccordingly in next version.

As the first thing, I think you should add a function such as
intel_alpm_init_dpcd(), and move the DPCD parts of intel_alpm_init()
there. The mutex init should remain in
intel_alpm_init(). intel_alpm_init_dpcd() should be called from
intel_edp_init_dpcd().

That's it, that's the first thing. Don't add anything more. The commit
message should of course describe those changes. It should be all
non-functional, no addition of new platform checks or anything.

The next part would be moving intel_alpm_init() to be done for all DP,
not just eDP, and calling intel_alpm_init_dpcd() also from
intel_dp_detect_dpcd(), where supported.

Small incremental things, one thing at a time.

BR,
Jani.





>
> Regards,
> Animesh=20
>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> >
>> > v2: Separate out mutex-init. [Jani]
>> > v3: Refactor further to avoid DISPLAY_VER check in multiple places.
>> > [Jani]
>> > V4: Cosmetic changes. [Suraj]
>> >
>> > Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
>> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_alpm.c | 16 ++++++++++++++--
>> > drivers/gpu/drm/i915/display/intel_alpm.h |  3 ++-
>> >  drivers/gpu/drm/i915/display/intel_dp.c   |  8 +++++++-
>> >  3 files changed, 23 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
>> > b/drivers/gpu/drm/i915/display/intel_alpm.c
>> > index 6372f533f65b..14acd6717e59 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_alpm.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
>> > @@ -41,7 +41,20 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp
>> *intel_dp,
>> >  		(crtc_state->has_lobf &&
>> > intel_alpm_aux_less_wake_supported(intel_dp));
>> >  }
>> >
>> > -void intel_alpm_init(struct intel_dp *intel_dp)
>> > +bool intel_alpm_source_supported(struct intel_connector *connector) {
>> > +	struct intel_display *display =3D to_intel_display(connector);
>> > +
>> > +	if (!((connector->base.connector_type =3D=3D
>> DRM_MODE_CONNECTOR_DisplayPort &&
>> > +	       DISPLAY_VER(display) >=3D 35) ||
>> > +	    (connector->base.connector_type =3D=3D
>> DRM_MODE_CONNECTOR_eDP &&
>> > +	     DISPLAY_VER(display) >=3D 20)))
>> > +		return false;
>> > +
>> > +	return true;
>> > +}
>> > +
>> > +void intel_alpm_get_sink_capability(struct intel_dp *intel_dp)
>> >  {
>> >  	u8 dpcd;
>> >
>> > @@ -49,7 +62,6 @@ void intel_alpm_init(struct intel_dp *intel_dp)
>> >  		return;
>> >
>> >  	intel_dp->alpm_dpcd =3D dpcd;
>> > -	mutex_init(&intel_dp->alpm.lock);
>> >  }
>> >
>> >  static int get_silence_period_symbols(const struct intel_crtc_state
>> > *crtc_state) diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h
>> > b/drivers/gpu/drm/i915/display/intel_alpm.h
>> > index 53599b464dea..bcc354a46a1d 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_alpm.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
>> > @@ -15,7 +15,8 @@ struct intel_connector;  struct intel_atomic_state;
>> > struct intel_crtc;
>> >
>> > -void intel_alpm_init(struct intel_dp *intel_dp);
>> > +bool intel_alpm_source_supported(struct intel_connector *connector);
>> > +void intel_alpm_get_sink_capability(struct intel_dp *intel_dp);
>> >  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
>> >  			       struct intel_crtc_state *crtc_state);  void
>> > intel_alpm_lobf_compute_config(struct intel_dp *intel_dp, diff --git
>> > a/drivers/gpu/drm/i915/display/intel_dp.c
>> > b/drivers/gpu/drm/i915/display/intel_dp.c
>> > index 0ec82fcbcf48..81dd5bf7e3c5 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> > @@ -6074,6 +6074,9 @@ intel_dp_detect(struct drm_connector
>> *_connector,
>> >  	if (ret =3D=3D 1)
>> >  		connector->base.epoch_counter++;
>> >
>> > +	if (intel_alpm_source_supported(connector))
>> > +		intel_alpm_get_sink_capability(intel_dp);
>> > +
>> >  	if (!intel_dp_is_edp(intel_dp))
>> >  		intel_psr_init_dpcd(intel_dp);
>> >
>> > @@ -6716,7 +6719,7 @@ static bool intel_edp_init_connector(struct
>> intel_dp *intel_dp,
>> >  	 */
>> >  	intel_hpd_enable_detection(encoder);
>> >
>> > -	intel_alpm_init(intel_dp);
>> > +	intel_alpm_get_sink_capability(intel_dp);
>> >
>> >  	/* Cache DPCD and EDID for edp. */
>> >  	has_dpcd =3D intel_edp_init_dpcd(intel_dp, connector); @@ -6932,6
>> > +6935,9 @@ intel_dp_init_connector(struct intel_digital_port
>> > *dig_port,
>> >
>> >  	intel_psr_init(intel_dp);
>> >
>> > +	if (intel_alpm_source_supported(connector))
>> > +		mutex_init(&intel_dp->alpm.lock);
>> > +
>> >  	return true;
>> >
>> >  fail:
>>=20
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
