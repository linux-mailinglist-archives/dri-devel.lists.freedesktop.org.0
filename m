Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42598464A3D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 09:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04FF6E5D3;
	Wed,  1 Dec 2021 08:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81276E996;
 Wed,  1 Dec 2021 08:58:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="216434710"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="216434710"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 00:58:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="459948084"
Received: from pwedlarx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.26.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 00:58:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/i915/dp: Perform 30ms delay after source OUI write
In-Reply-To: <20211130212912.212044-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211129233354.101347-1-lyude@redhat.com>
 <20211130212912.212044-1-lyude@redhat.com>
Date: Wed, 01 Dec 2021 10:58:00 +0200
Message-ID: <87k0goitwn.fsf@intel.com>
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

On Tue, 30 Nov 2021, Lyude Paul <lyude@redhat.com> wrote:
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
> V3:
> * Move last_oui_write into intel_dp
> V2:
> * Move panel delays into intel_pps
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Fixes: 4a8d79901d5b ("drm/i915/dp: Enable Intel's HDR backlight interface=
 (only SDR for now)")
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.12+

Thanks, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h    |  3 +++
>  drivers/gpu/drm/i915/display/intel_dp.c               | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h               |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c |  5 +++++
>  4 files changed, 21 insertions(+)
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
> index 0a424bf69396..5a8206298691 100644
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
> +	intel_dp->last_oui_write =3D jiffies;
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
