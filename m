Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00162463124
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD236E30D;
	Tue, 30 Nov 2021 10:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060F6E30D;
 Tue, 30 Nov 2021 10:37:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="223070080"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="223070080"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 02:37:00 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="477071284"
Received: from dmeldon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.12.174])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 02:36:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/dp: Perform 30ms delay after source OUI write
In-Reply-To: <20211129233354.101347-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211129233354.101347-1-lyude@redhat.com>
Date: Tue, 30 Nov 2021 12:36:42 +0200
Message-ID: <871r2yj5fp.fsf@intel.com>
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
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021, Lyude Paul <lyude@redhat.com> wrote:
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
>
> V2:
> * Move panel delays into intel_pps
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 4a8d79901d5b ("drm/i915/dp: Enable Intel's HDR backlight interface=
 (only SDR for now)")
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.12+
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h    |  4 ++++
>  drivers/gpu/drm/i915/display/intel_dp.c               | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h               |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c |  5 +++++
>  4 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index ea1e8a6e10b0..ad64f9caa7ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1485,6 +1485,7 @@ struct intel_pps {
>  	bool want_panel_vdd;
>  	unsigned long last_power_on;
>  	unsigned long last_backlight_off;
> +	unsigned long last_oui_write;
>  	ktime_t panel_power_off_time;
>  	intel_wakeref_t vdd_wakeref;
>=20=20
> @@ -1653,6 +1654,9 @@ struct intel_dp {
>  	struct intel_dp_pcon_frl frl;
>=20=20
>  	struct intel_psr psr;
> +
> +	/* When we last wrote the OUI for eDP */
> +	unsigned long last_oui_write;

Now you're adding last_oui_write to both intel_pps and intel_dp, forgot
to git add? ;)

I guess I'd add this to intel_dp only, because it's not strictly about
PPS. I just wanted the mechanism to be similar to that.

>  };
>=20=20
>  enum lspcon_vendor {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0a424bf69396..45318891ba07 100644
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
> @@ -2010,6 +2011,16 @@ intel_edp_init_source_oui(struct intel_dp *intel_d=
p, bool careful)
>=20=20
>  	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) =
< 0)
>  		drm_err(&i915->drm, "Failed to write source OUI\n");
> +
> +	intel_dp->pps.last_oui_write =3D jiffies;

Set to intel_dp->last_oui_write.

With those fixes,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +}
> +
> +void intel_dp_wait_source_oui(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> +
> +	drm_dbg_kms(&i915->drm, "Performing OUI wait\n");
> +	wait_remaining_ms_from_jiffies(intel_dp->last_oui_write, 30);
>  }
>=20=20
>  /* If the device supports it, try to set the power state appropriately */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index ce229026dc91..b64145a3869a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -119,4 +119,6 @@ void intel_dp_pcon_dsc_configure(struct intel_dp *int=
el_dp,
>  				 const struct intel_crtc_state *crtc_state);
>  void intel_dp_phy_test(struct intel_encoder *encoder);
>=20=20
> +void intel_dp_wait_source_oui(struct intel_dp *intel_dp);
> +
>  #endif /* __INTEL_DP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/driv=
ers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 8b9c925c4c16..62c112daacf2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -36,6 +36,7 @@
>=20=20
>  #include "intel_backlight.h"
>  #include "intel_display_types.h"
> +#include "intel_dp.h"
>  #include "intel_dp_aux_backlight.h"
>=20=20
>  /* TODO:
> @@ -106,6 +107,8 @@ intel_dp_aux_supports_hdr_backlight(struct intel_conn=
ector *connector)
>  	int ret;
>  	u8 tcon_cap[4];
>=20=20
> +	intel_dp_wait_source_oui(intel_dp);
> +
>  	ret =3D drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof=
(tcon_cap));
>  	if (ret !=3D sizeof(tcon_cap))
>  		return false;
> @@ -204,6 +207,8 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_=
crtc_state *crtc_state,
>  	int ret;
>  	u8 old_ctrl, ctrl;
>=20=20
> +	intel_dp_wait_source_oui(intel_dp);
> +
>  	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PAR=
AMS, &old_ctrl);
>  	if (ret !=3D 1) {
>  		drm_err(&i915->drm, "Failed to read current backlight control mode: %d=
\n", ret);

--=20
Jani Nikula, Intel Open Source Graphics Center
