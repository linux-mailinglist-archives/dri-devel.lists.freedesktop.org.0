Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754BB4502DA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBD16E913;
	Mon, 15 Nov 2021 10:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283E76E86B;
 Mon, 15 Nov 2021 10:54:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="296848649"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="296848649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:53:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="493973187"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:53:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: Perform 30ms delay after source OUI write
In-Reply-To: <20211112215016.270267-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211112215016.270267-1-lyude@redhat.com>
Date: Mon, 15 Nov 2021 12:53:40 +0200
Message-ID: <878rxp3d1n.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Anshuman Gupta <anshuman.gupta@intel.com>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?utf-8?Q?Jos?= =?utf-8?Q?=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Nov 2021, Lyude Paul <lyude@redhat.com> wrote:
> While working on supporting the Intel HDR backlight interface, I noticed
> that there's a couple of laptops that will very rarely manage to boot up
> without detecting Intel HDR backlight support - even though it's supported
> on the system. One example of such a laptop is the Lenovo P17 1st
> generation.
>
> Following some investigation Ville Syrj=C3=A4l=C3=A4 did through the docs=
 they have
> available to them, they discovered that there's actually supposed to be a
> 30ms wait after writing the source OUI before we begin setting up the rest
> of the backlight interface.
>
> This seems to be correct, as adding this 30ms delay seems to have
> completely fixed the probing issues I was previously seeing. So - let's
> start performing a 30ms wait after writing the OUI, which we do in a mann=
er
> similar to how we keep track of PPS delays (e.g. record the timestamp of
> the OUI write, and then wait for however many ms are left since that
> timestamp right before we interact with the backlight) in order to avoid
> waiting any longer then we need to. As well, this also avoids us performi=
ng
> this delay on systems where we don't end up using the HDR backlight
> interface.

Ugh. Thanks for digging into this.

The only thing that I dislike with the implementation is splitting the
implementation to two places. See how well we've managed to shove all of
the PPS waits inside intel_pps.c. Almost all of intel_dp->pps is managed
within intel_pps.c.

I think I'd actually add a intel_dp_wait_source_oui() or something in
intel_dp.c, so all of the details about source OUI and
intel_dp->last_oui_write access would be localized.


BR,
Jani.


>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 4a8d79901d5b ("drm/i915/dp: Enable Intel's HDR backlight interface=
 (only SDR for now)")
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.12+
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h    |  3 +++
>  drivers/gpu/drm/i915/display/intel_dp.c               |  3 +++
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 11 +++++++++++
>  3 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index ea1e8a6e10b0..b9c967837872 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1653,6 +1653,9 @@ struct intel_dp {
>  	struct intel_dp_pcon_frl frl;
>=20=20
>  	struct intel_psr psr;
> +
> +	/* When we last wrote the OUI for eDP */
> +	unsigned long last_oui_write;
>  };
>=20=20
>  enum lspcon_vendor {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0a424bf69396..77d9a9390c1e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -29,6 +29,7 @@
>  #include <linux/i2c.h>
>  #include <linux/notifier.h>
>  #include <linux/slab.h>
> +#include <linux/timekeeping.h>
>  #include <linux/types.h>
>=20=20
>  #include <asm/byteorder.h>
> @@ -2010,6 +2011,8 @@ intel_edp_init_source_oui(struct intel_dp *intel_dp=
, bool careful)
>=20=20
>  	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) =
< 0)
>  		drm_err(&i915->drm, "Failed to write source OUI\n");
> +
> +	intel_dp->last_oui_write =3D jiffies;
>  }
>=20=20
>  /* If the device supports it, try to set the power state appropriately */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/driv=
ers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 569d17b4d00f..2c35b999ec2c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -96,6 +96,13 @@
>  #define INTEL_EDP_BRIGHTNESS_OPTIMIZATION_1                            0=
x359
>=20=20
>  /* Intel EDP backlight callbacks */
> +static void
> +wait_for_oui(struct drm_i915_private *i915, struct intel_dp *intel_dp)
> +{
> +	drm_dbg_kms(&i915->drm, "Performing OUI wait\n");
> +	wait_remaining_ms_from_jiffies(intel_dp->last_oui_write, 30);
> +}
> +
>  static bool
>  intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
>  {
> @@ -106,6 +113,8 @@ intel_dp_aux_supports_hdr_backlight(struct intel_conn=
ector *connector)
>  	int ret;
>  	u8 tcon_cap[4];
>=20=20
> +	wait_for_oui(i915, intel_dp);
> +
>  	ret =3D drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof=
(tcon_cap));
>  	if (ret !=3D sizeof(tcon_cap))
>  		return false;
> @@ -204,6 +213,8 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_=
crtc_state *crtc_state,
>  	int ret;
>  	u8 old_ctrl, ctrl;
>=20=20
> +	wait_for_oui(i915, intel_dp);
> +
>  	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PAR=
AMS, &old_ctrl);
>  	if (ret !=3D 1) {
>  		drm_err(&i915->drm, "Failed to read current backlight control mode: %d=
\n", ret);

--=20
Jani Nikula, Intel Open Source Graphics Center
