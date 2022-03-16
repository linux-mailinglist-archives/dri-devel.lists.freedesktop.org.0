Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D34DAC26
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9016A10E75B;
	Wed, 16 Mar 2022 08:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2B10E84E;
 Wed, 16 Mar 2022 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647417612; x=1678953612;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=eTFLIE52CtaFK4VL0qGXnDFdrGjLZa9oKRMuLk0EF10=;
 b=YMmJxd8EkVqatqT1HrTqDjGK+9yQPmRXYTbdk8dM2RTqZgC/bpmfGmAk
 a/2aEfr6f/5tDaLiEuXm6eqsvuvFNGRncWCh4WbrSjS+b3+CIgOBrmv1j
 tdHVHhO8KoKRxycT0NIs5TChP8ApaLStbwriWiOtyJnYGX6aIU8plwa5J
 7oEaeiJOxUB3oGzszg5Xpz4JyKWgM9uwbHYrn3TRC1ZzfRIg5hXhLrp8v
 WcDxGzsvFVpl8us5hFqhXskswPv8RRZjASA0YortP18o74CaOdVzt/uJz
 c8Zv2H6JPsG7wmMRQAcpYCALsdNByBgp2bd/2PfdZS+G8JotJ6qtHAxBH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256470802"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="256470802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 01:00:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="557331256"
Received: from jgarrosx-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.34.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 01:00:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 18/22] drm/i915: Use drm_mode_init() for
 on-stack modes
In-Reply-To: <20220218100403.7028-19-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-19-ville.syrjala@linux.intel.com>
Date: Wed, 16 Mar 2022 10:00:06 +0200
Message-ID: <877d8upbsp.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
>
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M =3D E;
> + struct drm_display_mode M;
>
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when !=3D S
> + drm_mode_init(&M, &E);
> +
> S1
>
> @@
> expression decl.E;
> @@
> - &*E
> + E
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I wonder if that cocci could be added to scripts/coccinelle or something
to detect anyone adding new ones?

Anyway,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 740620ef07ad..74c5a99ab276 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6898,8 +6898,9 @@ intel_crtc_update_active_timings(const struct intel=
_crtc_state *crtc_state)
>  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> -	struct drm_display_mode adjusted_mode =3D
> -		crtc_state->hw.adjusted_mode;
> +	struct drm_display_mode adjusted_mode;
> +
> +	drm_mode_init(&adjusted_mode, &crtc_state->hw.adjusted_mode);
>=20=20
>  	if (crtc_state->vrr.enable) {
>  		adjusted_mode.crtc_vtotal =3D crtc_state->vrr.vmax;

--=20
Jani Nikula, Intel Open Source Graphics Center
