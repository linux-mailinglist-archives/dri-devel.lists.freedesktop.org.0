Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63778BF95D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 11:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFB210E3C6;
	Wed,  8 May 2024 09:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoBhli5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B210E1FF;
 Wed,  8 May 2024 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715159557; x=1746695557;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0cdYrcajI4uDWAbcgops0ANjWE4byoMs83LrP4k67WE=;
 b=VoBhli5lEd7s4T+8ih8I0kngrkTl4dHIxFDbIkaTWweHKgG95A4oGtP1
 z/pCV+7DeR4yR6VVZI0VbB54ikxVUO33j5ntfft8NJdO4n8ecKcRMmAAy
 E4U7RbMgChHJj37q4l4AjutYQcAQNW+hmfn2eyS67vgwiPto0SHUj3SWj
 9o5m3vDFku74WEDhh8ElfdqMDBnGtVt+/b4nhtNHqiwyJfrOtzhJKbchw
 v1Y5DbUgkeccqecVpW065zK+oSdi1jqS7PTIliJwzRNWmQn9DsA2q/SbY
 Ww2stqov/d0L+gYVEMP4cCkgrrkMqBLhMJm3Y9Te28xeD9vNod2nle+gR g==;
X-CSE-ConnectionGUID: KRpsiRozRy6/ioEq4se9JQ==
X-CSE-MsgGUID: DGA27Z2HSGWH4UcSNnVSpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36386309"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="36386309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 02:12:36 -0700
X-CSE-ConnectionGUID: KRr2VZ/QSGm+Ya4PJ5qCUw==
X-CSE-MsgGUID: IqhLXdO4SOmMYy+B6tEGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="33377853"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.76])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 02:12:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915: Use drm_crtc_vblank_crtc()
In-Reply-To: <20240408190611.24914-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <20240408190611.24914-3-ville.syrjala@linux.intel.com>
Date: Wed, 08 May 2024 12:12:32 +0300
Message-ID: <877cg4lla7.fsf@intel.com>
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

On Mon, 08 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the open coded drm_crtc_vblank_crtc() with the real
> thing.
>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_crtc.c   |  3 +--
>  drivers/gpu/drm/i915/display/intel_vblank.c | 16 +++++-----------
>  2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/=
i915/display/intel_crtc.c
> index 25593f6aae7d..339010384b86 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -78,8 +78,7 @@ void intel_wait_for_vblank_if_active(struct drm_i915_pr=
ivate *i915,
>=20=20
>  u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
>  {
> -	struct drm_device *dev =3D crtc->base.dev;
> -	struct drm_vblank_crtc *vblank =3D &dev->vblank[drm_crtc_index(&crtc->b=
ase)];
> +	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(&crtc->base);
>=20=20
>  	if (!crtc->active)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index baf7354cb6e2..951190bcbc50 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -132,8 +132,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
>  static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc =
*crtc)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> -	struct drm_vblank_crtc *vblank =3D
> -		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
> +	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(&crtc->base);
>  	const struct drm_display_mode *mode =3D &vblank->hwmode;
>  	u32 htotal =3D mode->crtc_htotal;
>  	u32 clock =3D mode->crtc_clock;
> @@ -178,8 +177,7 @@ static u32 intel_crtc_scanlines_since_frame_timestamp=
(struct intel_crtc *crtc)
>   */
>  static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *c=
rtc)
>  {
> -	struct drm_vblank_crtc *vblank =3D
> -		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
> +	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(&crtc->base);
>  	const struct drm_display_mode *mode =3D &vblank->hwmode;
>  	u32 vblank_start =3D mode->crtc_vblank_start;
>  	u32 vtotal =3D mode->crtc_vtotal;
> @@ -200,17 +198,14 @@ static int __intel_get_crtc_scanline(struct intel_c=
rtc *crtc)
>  {
>  	struct drm_device *dev =3D crtc->base.dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	const struct drm_display_mode *mode;
> -	struct drm_vblank_crtc *vblank;
> +	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(&crtc->base);
> +	const struct drm_display_mode *mode =3D &vblank->hwmode;
>  	enum pipe pipe =3D crtc->pipe;
>  	int position, vtotal;
>=20=20
>  	if (!crtc->active)
>  		return 0;
>=20=20
> -	vblank =3D &crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
> -	mode =3D &vblank->hwmode;
> -
>  	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
>  		return __intel_get_crtc_scanline_from_timestamp(crtc);
>=20=20
> @@ -254,8 +249,7 @@ static int __intel_get_crtc_scanline(struct intel_crt=
c *crtc)
>=20=20
>  int intel_crtc_scanline_to_hw(struct intel_crtc *crtc, int scanline)
>  {
> -	const struct drm_vblank_crtc *vblank =3D
> -		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
> +	const struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(&crtc->ba=
se);
>  	const struct drm_display_mode *mode =3D &vblank->hwmode;
>  	int vtotal;

--=20
Jani Nikula, Intel
