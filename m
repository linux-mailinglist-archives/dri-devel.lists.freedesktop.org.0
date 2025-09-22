Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F7B904E3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FD210E19D;
	Mon, 22 Sep 2025 11:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo6fP/Y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120C10E19D;
 Mon, 22 Sep 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758539407; x=1790075407;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9y1KdO+ANs6t2Z6qgrk5VssC5aj7zKn7tO3Fh7Rs93Y=;
 b=jo6fP/Y+lZI9gRnpIcjnzJr8OzIxaDw8/71epfsZGylygKa2cuiCMPjU
 qPFarnhsc6D7RtnSPuFSQrmToNOf+BKGMQmrP/P7cFP9klea1JL8gxSW3
 tSHxNmtdCqIwq2icJjEQhK4gwuWE2WhrkHS5Is51otN/HybpjXy4wbfCB
 7HDmKsa7vtdgBHwvMnzlBD6SmIj44A+RrcW1GsvcHUuz0GVojkHKjCiyG
 3VqACPNdO4u+kRc+9IYBV3dGvbXc+FIshC/kibm3VSNcLup7Bf3JGZrmX
 yp9R++0YFduP3HjH5qkKhf3ijDbWMuR1a7uY87/U2XPLD5ytQZVTkyjga g==;
X-CSE-ConnectionGUID: ZyugeOnqTduHmXgwfZsJ9A==
X-CSE-MsgGUID: vEPxWZGDTHmJ6RrTl8khnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="78240316"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="78240316"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 04:10:07 -0700
X-CSE-ConnectionGUID: 2FGJNWWZRV6DeHzJs+ZI9Q==
X-CSE-MsgGUID: b6eIefs/STyRX24FSONFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181698529"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 04:10:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for
 sharpness support
In-Reply-To: <20250919143418.3102605-3-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250919143418.3102605-1-nemesa.garg@intel.com>
 <20250919143418.3102605-3-nemesa.garg@intel.com>
Date: Mon, 22 Sep 2025 14:10:02 +0300
Message-ID: <fb4e8118c7e7cc0f566ed1e8ee09b4d58d801c73@intel.com>
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

On Fri, 19 Sep 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> Add HAS_CASF macro to check whether platform supports
> the content adaptive sharpness capability or not.
>
> v2: Update commit message[Ankit]
> v3: Remove \n from middle[Jani]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
>  drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drive=
rs/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 0c7f91046996..bc6a041cec13 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct intel_crtc_s=
tate *pipe_config,
>=20=20
>  	intel_vdsc_state_dump(&p, 0, pipe_config);
>=20=20
> +	if (HAS_CASF(display)) {
> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpn=
ess enable: %d\n",
> +			   pipe_config->hw.casf_params.strength,
> +			   pipe_config->hw.casf_params.win_size,
> +			   pipe_config->hw.casf_params.casf_enable);
> +	}

This breaks bisect, because it's referring to things that aren't there yet:

../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c: In function =E2=80=
=98intel_crtc_state_dump=E2=80=99:
../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:378:43: error: =E2=
=80=98const struct <anonymous>=E2=80=99 has no member named =E2=80=98casf_p=
arams=E2=80=99
  378 |                            pipe_config->hw.casf_params.strength,
      |                                           ^
../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:379:43: error: =E2=
=80=98const struct <anonymous>=E2=80=99 has no member named =E2=80=98casf_p=
arams=E2=80=99
  379 |                            pipe_config->hw.casf_params.win_size,
      |                                           ^
../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:380:43: error: =E2=
=80=98const struct <anonymous>=E2=80=99 has no member named =E2=80=98casf_p=
arams=E2=80=99
  380 |                            pipe_config->hw.casf_params.casf_enable);
      |                                           ^

I thought about simply reordering the patches in the series, but the
patch that adds casf_params depends on HAS_CASF() introduced here, and
there are other similar issues all over the place. I can't merge this,
sorry.

Every commit must compile, no exceptions.

Checking this is as simple as:

$ git rebase -i drm-tip/drm-tip -x make

with whatever remote and build command you use.

And yes, I obviously do this before merging anything, also no
exceptions.

I'm more than a little annoyed that there have been umpteen versions of
this series, I've been incessantly pestered about gathering acks and
getting this merged, and there are still basic things like this that
nobody looked at or cared about when I'm on the verge of merging.


BR,
Jani.



> +
>  dump_planes:
>  	if (!state)
>  		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/driver=
s/gpu/drm/i915/display/intel_display_device.h
> index 1f091fbcd0ec..157aa0b8f36e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -144,6 +144,7 @@ struct intel_display_platforms {
>  #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >=3D 5)
>  #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >=3D 13)
>  #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >=3D 11 && HAS_=
DSC(__display))
> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >=3D 20)
>  #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_c=
rawl)
>  #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_=
squash)
>  #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >=3D 20)

--=20
Jani Nikula, Intel
