Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8E50DF74
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5404D10E517;
	Mon, 25 Apr 2022 11:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C611310E50F;
 Mon, 25 Apr 2022 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650887744; x=1682423744;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gGrNl6aJAaklGlmHkmHl1hy5edfbQ6w51ZxR7+Jn6ts=;
 b=SkDii+dkXF/WNclkUoXAgjgN/gvAugEa//jtp4B0f6VlCig8+sb5wCpn
 1PVzxfHtJ4sTPa+n4uoPk7qdxQmoAUH6W4DK2Nk+Ke+/oOpwyyZi8earA
 mPjIthOLwJw8ms89rY9UcpSHpK7tRyo8JervcBWpCSInA9tUylDQGyFyu
 NyAlP7MHDAS0M04WzScYNCsoA05tyeSvIFm6l9FZkA3vfggDLtTJ5nhHC
 scKlLeRD9cIcJzSO0E/agquJ+gst468gofXwLRpPz8AbzGRaG2RTpzpa7
 dRvpFSKMp7L5YEC6wRwPFufQwCtJFT5aAU09KzYZGD7ipIs6V2u8uXcqv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="247152568"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="247152568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:55:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="512607666"
Received: from tgiecew-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.131.125])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:55:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/display: Replace crtc_state's
 has_drrs by drrs_downclock_mode
In-Reply-To: <20220421192205.32649-2-jose.souza@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220421192205.32649-1-jose.souza@intel.com>
 <20220421192205.32649-2-jose.souza@intel.com>
Date: Mon, 25 Apr 2022 14:55:39 +0300
Message-ID: <87levtv0lg.fsf@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022, Jos=C3=A9 Roberto de Souza <jose.souza@intel.com> wrot=
e:
> Will be adding some additional control options to DRRS that will
> require to have the DRRS downclock mode stored in the crtc_state.
>
> So to optimize memory usage a bit here using it to replace has_drrs
> as we can check if the drrs_downclock_mode pointer is different than
> null to have the same behavior has has_drrs.
>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c         | 4 ++--
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 4 ++--
>  drivers/gpu/drm/i915/display/intel_display_types.h   | 4 +++-
>  drivers/gpu/drm/i915/display/intel_dp.c              | 2 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c            | 4 ++--
>  5 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 0ddfce21a828d..a5f5caeced9a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5360,7 +5360,7 @@ static void intel_dump_pipe_config(const struct int=
el_crtc_state *pipe_config,
>=20=20
>  	drm_dbg_kms(&dev_priv->drm, "ips: %i, double wide: %i, drrs: %i\n",
>  		    pipe_config->ips_enabled, pipe_config->double_wide,
> -		    pipe_config->has_drrs);
> +		    CRTC_STATE_HAS_DRRS(pipe_config));

I'll mostly let Ville comment on the series, but that macro is an
eyesore and also just out of place in intel_display_types.h. Please make
it a proper function intel_drrs_something_something() in
intel_drrs.[ch].

BR,
Jani.

>=20=20
>  	intel_dpll_dump_hw_state(dev_priv, &pipe_config->dpll_hw_state);
>=20=20
> @@ -7088,7 +7088,7 @@ static void intel_crtc_copy_fastset(const struct in=
tel_crtc_state *old_crtc_stat
>  	new_crtc_state->fdi_m_n =3D old_crtc_state->fdi_m_n;
>  	new_crtc_state->dp_m_n =3D old_crtc_state->dp_m_n;
>  	new_crtc_state->dp_m2_n2 =3D old_crtc_state->dp_m2_n2;
> -	new_crtc_state->has_drrs =3D old_crtc_state->has_drrs;
> +	new_crtc_state->drrs_downclock_mode =3D old_crtc_state->drrs_downclock_=
mode;
>  }
>=20=20
>  static int intel_crtc_add_planes_to_state(struct intel_atomic_state *sta=
te,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drive=
rs/gpu/drm/i915/display/intel_display_debugfs.c
> index 452d773fd4e34..f9720562336da 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1096,7 +1096,7 @@ static int i915_drrs_status(struct seq_file *m, voi=
d *unused)
>=20=20
>  		/* DRRS Supported */
>  		seq_printf(m, "\tDRRS Enabled: %s\n",
> -			   str_yes_no(crtc_state->has_drrs));
> +			   str_yes_no(CRTC_STATE_HAS_DRRS(crtc_state)));
>=20=20
>  		seq_printf(m, "\tDRRS Active: %s\n",
>  			   str_yes_no(intel_drrs_is_active(crtc)));
> @@ -1786,7 +1786,7 @@ static int i915_drrs_ctl_set(void *data, u64 val)
>  		crtc_state =3D to_intel_crtc_state(crtc->base.state);
>=20=20
>  		if (!crtc_state->hw.active ||
> -		    !crtc_state->has_drrs)
> +		    !CRTC_STATE_HAS_DRRS(crtc_state))
>  			goto out;
>=20=20
>  		commit =3D crtc_state->uapi.commit;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index cfd042117b109..f0b3cfd3138ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1056,7 +1056,7 @@ struct intel_crtc_state {
>=20=20
>  	/* m2_n2 for eDP downclock */
>  	struct intel_link_m_n dp_m2_n2;
> -	bool has_drrs;
> +	const struct drm_display_mode *drrs_downclock_mode;
>=20=20
>  	/* PSR is supported but might not be enabled due the lack of enabled pl=
anes */
>  	bool has_psr;
> @@ -1264,6 +1264,8 @@ enum drrs_refresh_rate {
>  	DRRS_REFRESH_RATE_LOW,
>  };
>=20=20
> +#define CRTC_STATE_HAS_DRRS(crtc_state) (!!((crtc_state)->drrs_downclock=
_mode))
> +
>  #define INTEL_PIPE_CRC_ENTRIES_NR	128
>  struct intel_pipe_crc {
>  	spinlock_t lock;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index d55acc4a028a8..feea172dd2753 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1881,7 +1881,7 @@ intel_dp_drrs_compute_config(struct intel_connector=
 *connector,
>  	if (IS_IRONLAKE(i915) || IS_SANDYBRIDGE(i915) || IS_IVYBRIDGE(i915))
>  		pipe_config->msa_timing_delay =3D i915->vbt.edp.drrs_msa_timing_delay;
>=20=20
> -	pipe_config->has_drrs =3D true;
> +	pipe_config->drrs_downclock_mode =3D downclock_mode;
>=20=20
>  	pixel_clock =3D downclock_mode->clock;
>  	if (pipe_config->splitter.enable)
> diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/=
i915/display/intel_drrs.c
> index 166caf293f7bc..dd527dfc2d1d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_drrs.c
> +++ b/drivers/gpu/drm/i915/display/intel_drrs.c
> @@ -144,7 +144,7 @@ void intel_drrs_activate(const struct intel_crtc_stat=
e *crtc_state)
>  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>=20=20
> -	if (!crtc_state->has_drrs)
> +	if (!CRTC_STATE_HAS_DRRS(crtc_state))
>  		return;
>=20=20
>  	if (!crtc_state->hw.active)
> @@ -176,7 +176,7 @@ void intel_drrs_deactivate(const struct intel_crtc_st=
ate *old_crtc_state)
>  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(old_crtc_state->uapi.crtc);
>=20=20
> -	if (!old_crtc_state->has_drrs)
> +	if (!CRTC_STATE_HAS_DRRS(old_crtc_state))
>  		return;
>=20=20
>  	if (!old_crtc_state->hw.active)

--=20
Jani Nikula, Intel Open Source Graphics Center
