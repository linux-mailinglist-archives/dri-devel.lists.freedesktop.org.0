Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43A40C200
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 10:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6BD6E8E3;
	Wed, 15 Sep 2021 08:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097526E8E3;
 Wed, 15 Sep 2021 08:47:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="285951947"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="285951947"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 01:47:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544749784"
Received: from vmastnak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.245])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 01:47:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Aaron Ma <aaron.ma@canonical.com>, intel-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/dp: add a delay before setting panel brightness
 after power on
In-Reply-To: <CA+E=qVdELSDKWBwyayTDjRr+RXuWjXN6Vb8EzbgS_0YTb=1dFg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210913193509.3575-1-anarsoul@gmail.com>
 <87r1dr34nk.fsf@intel.com>
 <410de2c8e865446ec7f9d72a419b2674d34891bf.camel@redhat.com>
 <87v932zt5j.fsf@intel.com>
 <CA+E=qVdELSDKWBwyayTDjRr+RXuWjXN6Vb8EzbgS_0YTb=1dFg@mail.gmail.com>
Date: Wed, 15 Sep 2021 11:47:08 +0300
Message-ID: <87sfy6z0mr.fsf@intel.com>
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

On Tue, 14 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> On Tue, Sep 14, 2021 at 3:31 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Tue, 14 Sep 2021, Lyude Paul <lyude@redhat.com> wrote:
>> > On Tue, 2021-09-14 at 12:09 +0300, Jani Nikula wrote:
>> >> On Mon, 13 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> >> > Panel in my Dell XPS 7590, that uses Intel's HDR backlight interface to
>> >> > control brightness, apparently needs a delay before setting brightness
>> >> > after power on. Without this delay the panel does accept the setting
>> >> > and may come up with some arbitrary brightness (sometimes it's too dark,
>> >> > sometimes it's too bright, I wasn't able to find a system).
>> >> >
>> >> > I don't have access to the spec, so I'm not sure if it's expected
>> >> > behavior or a quirk for particular device.
>> >> >
>> >> > Delay was chosen by experiment: it works with 100ms, but fails with
>> >> > anything lower than 75ms.
>> >>
>> >> Looks like we don't respect the panel delays for DPCD backlight. The
>> >> values are used for setting up the panel power sequencer, and thus PWM
>> >> based backlight, but we should probably use the delays in DPCD backlight
>> >> code too.
>> >
>> > This makes sense to me, you're referring to the panel delays in the VBT
>> > correct?
>>
>> Yes. See pps_init_delays() and intel_pps_backlight_on(). The delays
>> aren't applied to DPCD backlight, I think it would make sense if they
>> were.
>
> I guess it explains why it usually stops working after suspend.
> Probably BIOS doesn't re-init the power sequencer on resume.

The point is, the DPCD backlight isn't driven via the power sequencer,
while the PWM pin would be.

Please file a bug at [1], and attach /sys/kernel/debug/dri/0/i915_vbt as
well as dmesg from boot with drm.debug=14 module parameter set.

Thanks,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/issues/new



>
>> BR,
>> Jani.
>>
>> >
>> >>
>> >> BR,
>> >> Jani.
>> >>
>> >>
>> >> >
>> >> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> >> > ---
>> >> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
>> >> >  1 file changed, 4 insertions(+)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > index 4f8337c7fd2e..c4f35e1b5870 100644
>> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > @@ -210,6 +210,10 @@ intel_dp_aux_hdr_enable_backlight(const struct
>> >> > intel_crtc_state *crtc_state,
>> >> >
>> >> >         ctrl = old_ctrl;
>> >> >         if (panel->backlight.edp.intel.sdr_uses_aux) {
>> >> > +               /* Wait 100ms to ensure that panel is ready otherwise it
>> >> > may not
>> >> > +                * set chosen backlight level
>> >> > +                */
>> >> > +               msleep(100);
>> >> >                 ctrl |= INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE;
>> >> >                 intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
>> >> >         } else {
>> >>
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
