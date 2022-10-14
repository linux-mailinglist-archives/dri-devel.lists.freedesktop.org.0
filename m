Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E290F5FEA3E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0D810E482;
	Fri, 14 Oct 2022 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488A310EA98;
 Fri, 14 Oct 2022 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665735279; x=1697271279;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wmDGS//aOHauqwUePoJW8GE7hPsYvPgiTr7OXQVXfyE=;
 b=JbfR8i8g9DG6i4V5T2JbSbPBPi326nUlGu9Te/+VgYnWgNu92WzarnM3
 UvgS65G96fNg+tbTgxGiZ7oHUMG0Toy8oF5Yx5B4yGWrryL0JXv+DYATu
 b7AVObYIY3FW21CUukMDvNhibG93MT3qhPUCGvrohIGkK/XkPcmmYvhNV
 wWydkEu6Lb/uTaMHb73vxxqmcr5M60Ny0Llq+OqmMhJxeQEEIX2DGgQQ0
 Zlzf3g46s5jOAK8oREKgnDUzJ+PPBdrqQNYBL+k5TkMfJr4z25y5UZYcS
 rNf1aP7ZjC17oRZ1WyHeEVBKp29PkLBgPQIdyQybMI3SKyAAkQVdKBxtU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="331829354"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="331829354"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 01:14:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="716665068"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="716665068"
Received: from lgleeson-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.239])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 01:14:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/15] drm/i915/hdmi: do dual mode detect only if connected
In-Reply-To: <Y0hmBn6NrUrBexyY@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1665496046.git.jani.nikula@intel.com>
 <20fb913a93c60fd24fc51b441ccea7bc75e82dd1.1665496046.git.jani.nikula@intel.com>
 <Y0hb0VOaYZk5TptS@intel.com> <Y0hmBn6NrUrBexyY@intel.com>
Date: Fri, 14 Oct 2022 11:14:43 +0300
Message-ID: <87o7uestxo.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Oct 13, 2022 at 09:41:21PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Tue, Oct 11, 2022 at 04:49:35PM +0300, Jani Nikula wrote:
>> > For normal connector detect, there's really no point in trying dual mo=
de
>> > detect if the connector is disconnected. We can simplify the detect
>> > sequence by skipping it. Since intel_hdmi_dp_dual_mode_detect() is only
>> > called when EDID is present, we can drop the has_edid parameter.
>> >=20
>> > The functional effect is speeding up disconnected connector detection
>> > ever so slightly, and, combined with firmware EDID, also stop logging
>> > about assuming dual mode adaptor.
>> >=20
>> > It's a bit subtle, but this will also skip dual mode detect if the
>> > connector is force connected and a) there's no EDID of any kind, normal
>> > or override/firmare or b) there's EDID but it does not indicate
>> > digital. These are corner cases no matter what, and arguably forcing
>> > should not be limited by dual mode detect.
>> >=20
>> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_hdmi.c | 17 +++++++----------
>> >  1 file changed, 7 insertions(+), 10 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/d=
rm/i915/display/intel_hdmi.c
>> > index 93519fb23d9d..a332eaac86cd 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> > @@ -2355,7 +2355,7 @@ intel_hdmi_unset_edid(struct drm_connector *conn=
ector)
>> >  }
>> >=20=20
>> >  static void
>> > -intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool =
has_edid)
>> > +intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
>> >  {
>> >  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>> >  	struct intel_hdmi *hdmi =3D intel_attached_hdmi(to_intel_connector(c=
onnector));
>> > @@ -2371,16 +2371,13 @@ intel_hdmi_dp_dual_mode_detect(struct drm_conn=
ector *connector, bool has_edid)
>> >  	 * CONFIG1 pin, but no such luck on our hardware.
>> >  	 *
>> >  	 * The only method left to us is to check the VBT to see
>> > -	 * if the port is a dual mode capable DP port. But let's
>> > -	 * only do that when we sucesfully read the EDID, to avoid
>> > -	 * confusing log messages about DP dual mode adaptors when
>> > -	 * there's nothing connected to the port.
>> > +	 * if the port is a dual mode capable DP port.
>> >  	 */
>> >  	if (type =3D=3D DRM_DP_DUAL_MODE_UNKNOWN) {
>> >  		/* An overridden EDID imply that we want this port for testing.
>> >  		 * Make sure not to set limits for that port.
>> >  		 */
>> > -		if (has_edid && !connector->override_edid &&
>> > +		if (!connector->override_edid &&
>> >  		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
>> >  			drm_dbg_kms(&dev_priv->drm,
>> >  				    "Assuming DP dual mode adaptor presence based on VBT\n");
>> > @@ -2435,18 +2432,18 @@ intel_hdmi_set_edid(struct drm_connector *conn=
ector)
>> >  		intel_gmbus_force_bit(i2c, false);
>> >  	}
>> >=20=20
>> > -	intel_hdmi_dp_dual_mode_detect(connector, edid !=3D NULL);
>> > -
>> > -	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
>> > -
>> >  	to_intel_connector(connector)->detect_edid =3D edid;
>> >  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
>>=20
>> We didn't have this digital input thing before. What happens with
>> HDMI->VGA dongles for example?
>>=20
>> Hmm. This whole thing might already be broken on those. I suspect
>> I've only used my HDMI->VGA dongle on LSPCON machines, so never
>> noticed this. Need to go plug that thing into a native HDMI port...
>
> Except I must have left it elsewhere since I can't find it here.
> So can't test right now unfortunately.
>
> I first thought this digital check thing might be due to
> the DVI-I shenanigans in intel_crt_detect_ddc(), but that
> was added for am unspecified gen2 machine in commit f5afcd3dd0dc
> ("drm/i915/crt: Check for a analog monitor in case of DVI-I")
> so not even relevant here. And I don't think I've ever seen
> a g4x+ machine with an actual DVI-I port.
>
> commit aa93d632c496 ("drm/i915: Require digital monitor
> on HDMI ports for detect") is where this check was added,
> but there is no actual justification for checking the
> digital thing vs. just making sure the edid read succeeded.
>
> So looks to me like this check can just be removed. And
> if we do come across some real DVI-I use cases we should
> probably check the VBT DDC pin assignments before we go
> assuming anything about the wiring.

Are you saying remove the "edid->input & DRM_EDID_INPUT_DIGITAL"
altogether? Or turn this into:

	if (edid) {
		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
			intel_hdmi->has_audio =3D drm_detect_monitor_audio(edid);
			intel_hdmi->has_hdmi_sink =3D drm_detect_hdmi_monitor(edid);
		}
		connected =3D true;
	}

Since e.g. DP wraps the audio/hdmi detect calls in digital check.

OTOH I really want to get rid of the detect audio/hdmi calls [1]. Just a
lot of old cruft and the rabbit hole gets deeper. :(


BR,
Jani.



[1] https://patchwork.freedesktop.org/series/108024/


--=20
Jani Nikula, Intel Open Source Graphics Center
