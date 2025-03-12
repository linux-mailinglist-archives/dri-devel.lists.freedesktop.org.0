Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF3A5DF55
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A884310E792;
	Wed, 12 Mar 2025 14:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTFLLmkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9798C10E790;
 Wed, 12 Mar 2025 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741790704; x=1773326704;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0G+/kx7ZQTJJXuEALO3d1G/e7FlP8QuRT1WD8BeoiQU=;
 b=aTFLLmkhp2YWqGkeQOr88VH2cfgrUL42IfjPfZePpb8Bxtf/32BkjBiG
 RPqTI28PgmRi63gU/WajeOBf16URe7IE7KtQVCg5MTaCObKUTli4+kIJq
 MOLkxndmCnaCbUWzSB+3q+m9xgBf4IZZlRs9IN7W5tKJlooWdXOaQKhNR
 l69nR9G17rhntrz7EHWzghHBiGy8A2bq57PC9FEu3rmsQbR59WJZRphDW
 FpPVTbeB1L9ggmZl3p3jCu1yS/AA8SEyXGbvTg2YdCPvjMsAvW1i+6iI+
 8NeXFf5QiOzpywyTu/NGaD9ydsmn8+B9P4sSLgOF2ujDENeilq/Tze2DX w==;
X-CSE-ConnectionGUID: aLYKowG0SsOnmJs/6vQ3Cg==
X-CSE-MsgGUID: 5QwPaoBtRuW90b6ZSP9kSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42731960"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42731960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:04 -0700
X-CSE-ConnectionGUID: BE+kT5wlQ0KpKy5PmolI8A==
X-CSE-MsgGUID: jX0asxdnSmmzXeMEbGlerg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="121170063"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 5/8] drm/client: Stop using the legacy crtc->mode
In-Reply-To: <20250228211454.8138-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
 <20250228211454.8138-6-ville.syrjala@linux.intel.com>
Date: Wed, 12 Mar 2025 16:44:59 +0200
Message-ID: <875xkefgus.fsf@intel.com>
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

On Fri, 28 Feb 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> crtc->mode is legacy junk and shouldn't really be used with
> atomic drivers.
>
> Most (all?) atomic drivers do end up still calling
> drm_atomic_helper_update_legacy_modeset_state() at some
> point, so crtc->mode does still get populated, and this
> does work for now. But now that the modes[] lifetime issues
> have been sorted out we can just switch over to the
> proper crtc->state->mode.
>
> v2: Rebase
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index ff034359f063..4c64535fb82c 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -733,20 +733,9 @@ static bool drm_client_firmware_config(struct drm_cl=
ient_dev *client,
>=20=20
>  		/* last resort: use current mode */
>  		if (!modes[i]) {
> -			/*
> -			 * IMPORTANT: We want to use the adjusted mode (i.e.
> -			 * after the panel fitter upscaling) as the initial
> -			 * config, not the input mode, which is what crtc->mode
> -			 * usually contains. But since our current
> -			 * code puts a mode derived from the post-pfit timings
> -			 * into crtc->mode this works out correctly.
> -			 *
> -			 * This is crtc->mode and not crtc->state->mode for the
> -			 * fastboot check to work correctly.
> -			 */
>  			mode_type =3D "current";
>  			mode_replace(dev, &modes[i],
> -				     &connector->state->crtc->mode);
> +				     &new_crtc->state->mode);
>  		}
>=20=20
>  		/*

--=20
Jani Nikula, Intel
