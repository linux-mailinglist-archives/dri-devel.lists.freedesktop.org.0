Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7DC64DF7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61210E3D7;
	Mon, 17 Nov 2025 15:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buhBiavY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B441A10E3D8;
 Mon, 17 Nov 2025 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763393335; x=1794929335;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=//CWbNjVVBgJQ6OGnSVp4HNzGa/g+OYc0ez+yZH/a7M=;
 b=buhBiavYLeOfM3WhovrDpqK5BusOnS+SYehbIx+Su1RTVrVglVUNmJNU
 Jx1ZrTAbdyreCAA/nSboNjvHg/ZTMxzxMDKAdQIYxd+JMaOHZN3a8L+Wh
 oJlUg1Q7PTZcy/V9xYGkwbVLO1nzNY8UVEyrFTAynqptcxyrP3n0IHLjP
 hbHCSGvANrVmNnP60+M9/qDRK1fcf12dRT597hMBFRn39NdHPtUDDD0sE
 BQUhLnOXMikff6LxKWLklqxgj6dCGL6SeybAb7pB4xderMdoLNOuuOvbQ
 pRKslK87e1a1x80N+Q7202+dpVL3c0/hNgiTaSpPCYTcNOepY1pGcJvj1 g==;
X-CSE-ConnectionGUID: z9LPs8slTUSFw38ifzRe2A==
X-CSE-MsgGUID: uoXv47FfTGyZMaIGb1rbcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65278344"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65278344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:28:54 -0800
X-CSE-ConnectionGUID: CRJNXHWNTmmZbN/pxDI7mw==
X-CSE-MsgGUID: gUP/FB6VSPqHEpkbxZaiKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="227811278"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:28:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, Animesh Manna <animesh.manna@intel.com>, Jouni
 =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH v4 02/10] drm/i915/alpm: alpm_init() for DP2.1
In-Reply-To: <20251113120119.1437955-3-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-3-animesh.manna@intel.com>
Date: Mon, 17 Nov 2025 17:28:47 +0200
Message-ID: <4577de7373cb6bf2954d8d599168f408c87730c7@intel.com>
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

On Thu, 13 Nov 2025, Animesh Manna <animesh.manna@intel.com> wrote:
> Initialize ALPM for DP2.1 and separate out ALPM mutex-init
> from alpm-init.

I thought I said you're going to need multiple init functions. Don't
move the alpm mutex init away from alpm code. It needs to stay in alpm
code.

And now the whole patch and subject and commit message talk of
completely different things.

Please read the review comments, and ask questions if they comments are
not clear.

BR,
Jani.


>
> v2: Separate out mutex-init. [Jani]
> v3: Refactor further to avoid DISPLAY_VER check in multiple places. [Jani]
> V4: Cosmetic changes. [Suraj]
>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_alpm.h |  3 ++-
>  drivers/gpu/drm/i915/display/intel_dp.c   |  8 +++++++-
>  3 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 6372f533f65b..14acd6717e59 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -41,7 +41,20 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *inte=
l_dp,
>  		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
>  }
>=20=20
> -void intel_alpm_init(struct intel_dp *intel_dp)
> +bool intel_alpm_source_supported(struct intel_connector *connector)
> +{
> +	struct intel_display *display =3D to_intel_display(connector);
> +
> +	if (!((connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_Display=
Port &&
> +	       DISPLAY_VER(display) >=3D 35) ||
> +	    (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP &&
> +	     DISPLAY_VER(display) >=3D 20)))
> +		return false;
> +
> +	return true;
> +}
> +
> +void intel_alpm_get_sink_capability(struct intel_dp *intel_dp)
>  {
>  	u8 dpcd;
>=20=20
> @@ -49,7 +62,6 @@ void intel_alpm_init(struct intel_dp *intel_dp)
>  		return;
>=20=20
>  	intel_dp->alpm_dpcd =3D dpcd;
> -	mutex_init(&intel_dp->alpm.lock);
>  }
>=20=20
>  static int get_silence_period_symbols(const struct intel_crtc_state *crt=
c_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/=
i915/display/intel_alpm.h
> index 53599b464dea..bcc354a46a1d 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -15,7 +15,8 @@ struct intel_connector;
>  struct intel_atomic_state;
>  struct intel_crtc;
>=20=20
> -void intel_alpm_init(struct intel_dp *intel_dp);
> +bool intel_alpm_source_supported(struct intel_connector *connector);
> +void intel_alpm_get_sink_capability(struct intel_dp *intel_dp);
>  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
>  			       struct intel_crtc_state *crtc_state);
>  void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0ec82fcbcf48..81dd5bf7e3c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6074,6 +6074,9 @@ intel_dp_detect(struct drm_connector *_connector,
>  	if (ret =3D=3D 1)
>  		connector->base.epoch_counter++;
>=20=20
> +	if (intel_alpm_source_supported(connector))
> +		intel_alpm_get_sink_capability(intel_dp);
> +
>  	if (!intel_dp_is_edp(intel_dp))
>  		intel_psr_init_dpcd(intel_dp);
>=20=20
> @@ -6716,7 +6719,7 @@ static bool intel_edp_init_connector(struct intel_d=
p *intel_dp,
>  	 */
>  	intel_hpd_enable_detection(encoder);
>=20=20
> -	intel_alpm_init(intel_dp);
> +	intel_alpm_get_sink_capability(intel_dp);
>=20=20
>  	/* Cache DPCD and EDID for edp. */
>  	has_dpcd =3D intel_edp_init_dpcd(intel_dp, connector);
> @@ -6932,6 +6935,9 @@ intel_dp_init_connector(struct intel_digital_port *=
dig_port,
>=20=20
>  	intel_psr_init(intel_dp);
>=20=20
> +	if (intel_alpm_source_supported(connector))
> +		mutex_init(&intel_dp->alpm.lock);
> +
>  	return true;
>=20=20
>  fail:

--=20
Jani Nikula, Intel
