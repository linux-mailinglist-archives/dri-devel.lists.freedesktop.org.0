Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E63C457C0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C6710E357;
	Mon, 10 Nov 2025 09:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NufPMWjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C2210E2BB;
 Mon, 10 Nov 2025 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762765278; x=1794301278;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rFuZa7dKf76hceJUsRj0n7/jwtJX6t5t3NBBHzI/ToQ=;
 b=NufPMWjBs7dgcyOXG8jlOgh2t4q6WGHyZnR4+uhuPmL8Yq2EOOCOnFgf
 +Vlq2y9HSJxJiUU8vzNcvLqFr42mCvyATYY74BngFWoUk9FXeWbAf0BB3
 7y5FH8fZuzYiO+IkDOpWnBOMSVys4E/pstaq/Q16Brn4N8EQEixXTBHnY
 UZd4lMkSCZwW0njHd7rFArxy3N7AKyLLjd613sbyeHwvobFG8KF7d7bry
 /F0Bmg1LyRDSE0gikcGIQZ1yRmXRCnDoTSiujq5Mvn72Qy3ClzpfGd0xb
 Tg0uDeaLHDWNM5CfBCVaJ2MJ1XTY6bCkKuy+rIBgZT7irT72yxWy9W7LI w==;
X-CSE-ConnectionGUID: 3UPLOZe/TAWF3eDKHbV8Dw==
X-CSE-MsgGUID: 4q9kwib9RJmm90rViEOXUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75422302"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="75422302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:01:18 -0800
X-CSE-ConnectionGUID: A10F5xs8QgqHc98CnHjhNQ==
X-CSE-MsgGUID: 0SoiTq0pS5ihY2TIwpAMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188577199"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:01:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>
Subject: Re: [PATCH v2 02/10] drm/i915/alpm: alpm_init() for DP2.1
In-Reply-To: <20251103220957.1229608-3-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-3-animesh.manna@intel.com>
Date: Mon, 10 Nov 2025 11:01:12 +0200
Message-ID: <7c735321b2c5c08ce1fac9f2d358ae06e9ad0b60@intel.com>
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

On Tue, 04 Nov 2025, Animesh Manna <animesh.manna@intel.com> wrote:
> Initialize alpm for DP2.1 and separate out alpm mutex-init
> from alpm-init.
>
> v1: Initial version.
> v2: Separate out mutex-init. [Jani]

Under no circumstances should you have two places and code paths to
initialize a mutex.

I think you need two or three functions, one for initializing the mutex
(and potentially other similar stuff), one for dynamic initialization
for eDP and one for DP. Don't sprinkle the display version checks all
over the place.

BR,
Jani.

>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c |  1 -
>  drivers/gpu/drm/i915/display/intel_dp.c   | 11 ++++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 6372f533f65b..639941e332f3 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -49,7 +49,6 @@ void intel_alpm_init(struct intel_dp *intel_dp)
>  		return;
>=20=20
>  	intel_dp->alpm_dpcd =3D dpcd;
> -	mutex_init(&intel_dp->alpm.lock);
>  }
>=20=20
>  static int get_silence_period_symbols(const struct intel_crtc_state *crt=
c_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0ec82fcbcf48..f995a98df2c3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6074,8 +6074,12 @@ intel_dp_detect(struct drm_connector *_connector,
>  	if (ret =3D=3D 1)
>  		connector->base.epoch_counter++;
>=20=20
> -	if (!intel_dp_is_edp(intel_dp))
> +	if (!intel_dp_is_edp(intel_dp)) {
> +		if (DISPLAY_VER(display) >=3D 35)
> +			intel_alpm_init(intel_dp);
> +
>  		intel_psr_init_dpcd(intel_dp);
> +	}
>=20=20
>  	intel_dp_detect_dsc_caps(intel_dp, connector);
>=20=20
> @@ -6717,6 +6721,8 @@ static bool intel_edp_init_connector(struct intel_d=
p *intel_dp,
>  	intel_hpd_enable_detection(encoder);
>=20=20
>  	intel_alpm_init(intel_dp);
> +	if (intel_dp->alpm_dpcd)
> +		mutex_init(&intel_dp->alpm.lock);
>=20=20
>  	/* Cache DPCD and EDID for edp. */
>  	has_dpcd =3D intel_edp_init_dpcd(intel_dp, connector);
> @@ -6932,6 +6938,9 @@ intel_dp_init_connector(struct intel_digital_port *=
dig_port,
>=20=20
>  	intel_psr_init(intel_dp);
>=20=20
> +	if (DISPLAY_VER(display) >=3D 35)
> +		mutex_init(&intel_dp->alpm.lock);
> +
>  	return true;
>=20=20
>  fail:

--=20
Jani Nikula, Intel
