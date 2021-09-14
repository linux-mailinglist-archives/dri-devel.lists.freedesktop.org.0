Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1B40BB77
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 00:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81DA6E832;
	Tue, 14 Sep 2021 22:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED66E832;
 Tue, 14 Sep 2021 22:31:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307702043"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307702043"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 15:31:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544316594"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 15:31:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Aaron
 Ma <aaron.ma@canonical.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: add a delay before setting panel brightness
 after power on
In-Reply-To: <410de2c8e865446ec7f9d72a419b2674d34891bf.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210913193509.3575-1-anarsoul@gmail.com>
 <87r1dr34nk.fsf@intel.com>
 <410de2c8e865446ec7f9d72a419b2674d34891bf.camel@redhat.com>
Date: Wed, 15 Sep 2021 01:31:04 +0300
Message-ID: <87v932zt5j.fsf@intel.com>
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

On Tue, 14 Sep 2021, Lyude Paul <lyude@redhat.com> wrote:
> On Tue, 2021-09-14 at 12:09 +0300, Jani Nikula wrote:
>> On Mon, 13 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> > Panel in my Dell XPS 7590, that uses Intel's HDR backlight interface to
>> > control brightness, apparently needs a delay before setting brightness
>> > after power on. Without this delay the panel does accept the setting
>> > and may come up with some arbitrary brightness (sometimes it's too dar=
k,
>> > sometimes it's too bright, I wasn't able to find a system).
>> >=20
>> > I don't have access to the spec, so I'm not sure if it's expected
>> > behavior or a quirk for particular device.
>> >=20
>> > Delay was chosen by experiment: it works with 100ms, but fails with
>> > anything lower than 75ms.
>>=20
>> Looks like we don't respect the panel delays for DPCD backlight. The
>> values are used for setting up the panel power sequencer, and thus PWM
>> based backlight, but we should probably use the delays in DPCD backlight
>> code too.
>
> This makes sense to me, you're referring to the panel delays in the VBT
> correct?

Yes. See pps_init_delays() and intel_pps_backlight_on(). The delays
aren't applied to DPCD backlight, I think it would make sense if they
were.

BR,
Jani.

>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> >=20
>> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> > ---
>> > =C2=A0drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
>> > =C2=A01 file changed, 4 insertions(+)
>> >=20
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > index 4f8337c7fd2e..c4f35e1b5870 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > @@ -210,6 +210,10 @@ intel_dp_aux_hdr_enable_backlight(const struct
>> > intel_crtc_state *crtc_state,
>> > =C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctrl =3D old_ctrl;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (panel->backlight.e=
dp.intel.sdr_uses_aux) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/* Wait 100ms to ensure that panel is ready otherwise =
it
>> > may not
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * set chosen backlight level
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0msleep(100);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ctrl |=3D INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENAB=
LE;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_dp_aux_hdr_set_aux_backlight(conn_state, l=
evel);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
