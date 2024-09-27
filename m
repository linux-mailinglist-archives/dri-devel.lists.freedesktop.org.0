Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F998861E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 15:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8F10E34C;
	Fri, 27 Sep 2024 13:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtZb3mcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDB310E053;
 Fri, 27 Sep 2024 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727442868; x=1758978868;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7Zd0nIKdA0spCjCQ15NU4V0MwrpxGgvO1Z7KesC4g1Q=;
 b=VtZb3mcpT+X+lyXJsRQ5qxyI3phSOn4waEwwYfqfocs35ygIa1PkE/J8
 ze/VOZYO/xlnHX66TsowLch+Lh/BAyWc/hTXOqk2p+9/5W8qNdYorUcmb
 ja2KKNKWpVCdlzlulegmowejzfDmcxd489AsodOXMBseeKwkvfiBcqvic
 Rnn8HyUo8+BCLJJcyJpHCG6/6K+BxBCLxqRMRyjAhEa6bvnPrgMZPfcVg
 q59iEFFctlavPnO0UBh3vPL7RzzZpM9afSGseikN7fOsIbY5xwUuGf8pD
 ljdpj/NXRaOQIlVLf03d/B1ab9Ah+mObIKyiF7PsPOWsNnCrq/JDqBOlI g==;
X-CSE-ConnectionGUID: U/PMEwyyRS+uWizDEXgE/Q==
X-CSE-MsgGUID: XwiqzdsESTCKfP+n038X6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37968937"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37968937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:14:28 -0700
X-CSE-ConnectionGUID: +L79hhesTLa3X8cLSmVYog==
X-CSE-MsgGUID: LToT6LpmT0y0dj/RGNN43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72525227"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:14:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Alessandro Zanni <alessandro.zanni87@gmail.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
Subject: Re: [PATCH] gpu: drm: i915: display: Avoid null values
 intel_plane_atomic_check_with_state
In-Reply-To: <ZvaduhDERL-zvED3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
 <87tte1zewf.fsf@intel.com> <ZvaduhDERL-zvED3@intel.com>
Date: Fri, 27 Sep 2024 16:14:17 +0300
Message-ID: <87tte1xmqe.fsf@intel.com>
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

On Fri, 27 Sep 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Sep 27, 2024 at 11:20:32AM +0300, Jani Nikula wrote:
>> On Fri, 27 Sep 2024, Alessandro Zanni <alessandro.zanni87@gmail.com> wro=
te:
>> > This fix solves multiple Smatch errors:
>> >
>> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
>> > intel_plane_atomic_check_with_state() error:
>> > we previously assumed 'fb' could be null (see line 648)
>> >
>> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
>> > intel_plane_atomic_check_with_state()
>> > error: we previously assumed 'fb' could be null (see line 659)
>> >
>> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
>> > intel_plane_atomic_check_with_state()
>> > error: we previously assumed 'fb' could be null (see line 663)
>> >
>> > We should check first if fb is not null before to access its propertie=
s.
>>=20
>> new_plane_state->uapi.visible && !fb should not be possible, but it's
>> probably too hard for smatch to figure out. It's not exactly trivial for
>> humans to figure out either.
>>=20
>> I'm thinking something like below to help both.
>>=20
>> Ville, thoughts?
>>=20
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers=
/gpu/drm/i915/display/intel_atomic_plane.c
>> index 3505a5b52eb9..d9da47aed55d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> @@ -629,6 +629,9 @@ int intel_plane_atomic_check_with_state(const struct=
 intel_crtc_state *old_crtc_
>>  	if (ret)
>>  		return ret;
>>=20=20
>> +	if (drm_WARN_ON(display->drm, new_plane_state->uapi.visible && !fb))
>> +		return -EINVAL;
>> +
>
> We have probably 100 places that would need this. So it's going
> to be extremely ugly.
>
> One approach I could maybe tolerate is something like
> intel_plane_is_visible(plane_state)=20
> {
> 	if (drm_WARN_ON(visible && !fb))
> 		return false;
>
> 	return plane_state->visible;
> }
>
> + s/plane_state->visible/intel_plane_is_visible(plane_state)/
>
> But is that going to help these obtuse tools?

That does help people, which is more important. :)

I think the problem is first checking if fb is NULL, and then
dereferencing it anyway.

visible always means fb !=3D NULL, but I forget, is the reverse true? Can
we have fb !=3D NULL and !visible? I mean could we change the fb check to
visible check?

BR,
Jani.

>
>>  	if (fb)
>>  		new_crtc_state->enabled_planes |=3D BIT(plane->id);
>>=20=20
>>=20
>>=20
>> >
>> > Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drive=
rs/gpu/drm/i915/display/intel_atomic_plane.c
>> > index e979786aa5cf..1606f79b39e6 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> > @@ -656,18 +656,18 @@ int intel_plane_atomic_check_with_state(const st=
ruct intel_crtc_state *old_crtc_
>> >  	    intel_plane_is_scaled(new_plane_state))
>> >  		new_crtc_state->scaled_planes |=3D BIT(plane->id);
>> >=20=20
>> > -	if (new_plane_state->uapi.visible &&
>> > +	if (new_plane_state->uapi.visible && fb &&
>> >  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
>> >  		new_crtc_state->nv12_planes |=3D BIT(plane->id);
>> >=20=20
>> > -	if (new_plane_state->uapi.visible &&
>> > +	if (new_plane_state->uapi.visible && fb &&
>> >  	    fb->format->format =3D=3D DRM_FORMAT_C8)
>> >  		new_crtc_state->c8_planes |=3D BIT(plane->id);
>> >=20=20
>> >  	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
>> >  		new_crtc_state->update_planes |=3D BIT(plane->id);
>> >=20=20
>> > -	if (new_plane_state->uapi.visible &&
>> > +	if (new_plane_state->uapi.visible && fb &&
>> >  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
>> >  		new_crtc_state->data_rate_y[plane->id] =3D
>> >  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
