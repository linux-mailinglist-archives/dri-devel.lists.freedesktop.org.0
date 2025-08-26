Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B485B37B6A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B4B10E070;
	Wed, 27 Aug 2025 07:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D40WncAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883B10E0CD;
 Tue, 26 Aug 2025 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756208842; x=1787744842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o+vuYla9ayRtfeuYJxM0Y64Y0tOO++Px6/MJMRMKzUM=;
 b=D40WncACA8o1eMKHPRjbe/6n7GkJkhZ5tZvB7v+AEhBM/2j+tuKzazBl
 ++JTc91kd0LOxrNXZPuPS87xINRwGPfgMjdl4loIHRzo97tKSZKy6H4Sn
 rDvXhxBHo6OqUJ4baDstLmv6FxURv6OEjoVozrPQFKRe8VDWMFGcN77Fu
 fuccTwlwxmepJWAXMWSFJm5+eE2wFWOrM06IEQJSqwJmzjck2rf92HNAA
 auDE8Yuor6XCtsp7O1kzeoDU9PcxpvwFaqQMFLau4R7JHnT6Z8w9b+JC6
 To0KSppo8VJ30ZWrA9rE69uWRhvc8OHaeg4rmAo7U16pxIDGuOKI5VxzF A==;
X-CSE-ConnectionGUID: IgNXeyOfQYebZ4AFPwWKHQ==
X-CSE-MsgGUID: ER5F/U3WS8eYgn8xRsTXwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69876221"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69876221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 04:47:21 -0700
X-CSE-ConnectionGUID: t8UIwRZXQJK657qAgmmUow==
X-CSE-MsgGUID: xfTuBsbuSUWy0kKwm86+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174860723"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.254])
 by orviesa005.jf.intel.com with SMTP; 26 Aug 2025 04:47:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Aug 2025 14:47:03 +0300
Date: Tue, 26 Aug 2025 14:47:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej@freedesktop.org, Skra@freedesktop.org
Subject: Re: [PATCH 06/39] drm/atomic: Convert
 __drm_atomic_get_current_plane_state() to modern accessor
Message-ID: <aK2et2g8OsJvyta3@intel.com>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-6-f08ccd9f85c9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-drm-no-more-existing-state-v1-6-f08ccd9f85c9@kernel.org>
X-Patchwork-Hint: comment
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

On Mon, Aug 25, 2025 at 03:43:11PM +0200, Maxime Ripard wrote:
> The __drm_atomic_get_current_plane_state() function tries to get and
> return the existing plane state, and if it doesn't exist returns the one
> stored in the drm_plane->state field.
> 
> Using the current nomenclature, it tries to get the existing plane state
> with an ad-hoc implementation of drm_atomic_get_existing_plane_state(),
> and falls back to either the old or new plane state, depending on
> whether it is called before or after drm_atomic_helper_swap_state().
> 
> The existing plane state itself is deprecated, because it also changes
> when swapping states from the new state to the old state.
> 
> Fortunately for us, we can simplify things. Indeed,
> __drm_atomic_get_current_plane_state() is only used in two macros:
> intel_atomic_crtc_state_for_each_plane_state and
> drm_atomic_crtc_state_for_each_plane_state().
> 
> The intel variant is only used through the intel_wm_compute() function
> that is only ever called in intel_crtc_atomic_check().

Ugh. I've been meaning to clean up that mess for years. I suppose
I should revisit it again...

> 
> The generic variant is more widely used, and can be found in the malidp,
> msm, tegra and vc4 drivers. All of these call sites though are during
> atomic_check(), so we end up in the same situation than Intel's.
> 
> Thus, we only ever use the existing state as the new state, and
> plane->state is always going to be the old state. Any plane isn't
> guaranteed to be part of the state though, so we can't rely on
> drm_atomic_get_old_plane_state() and we still need to use plane->state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 798d33b50ef7497ce938ce3dbabee32487dda2d6..82e74d9444c4fa7f02ee0e472c8c68f7bc44cc6a 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -789,15 +789,15 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
>  /**
>   * __drm_atomic_get_current_plane_state - get current plane state
>   * @state: global atomic state object
>   * @plane: plane to grab
>   *
> - * This function returns the plane state for the given plane, either from
> - * @state, or if the plane isn't part of the atomic state update, from @plane.
> - * This is useful in atomic check callbacks, when drivers need to peek at, but
> - * not change, state of other planes, since it avoids threading an error code
> - * back up the call chain.
> + * This function returns the plane state for the given plane, either the
> + * new plane state from @state, or if the plane isn't part of the atomic
> + * state update, from @plane. This is useful in atomic check callbacks,
> + * when drivers need to peek at, but not change, state of other planes,
> + * since it avoids threading an error code back up the call chain.
>   *
>   * WARNING:
>   *
>   * Note that this function is in general unsafe since it doesn't check for the
>   * required locking for access state structures. Drivers must ensure that it is
> @@ -814,13 +814,19 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
>   */
>  static inline const struct drm_plane_state *
>  __drm_atomic_get_current_plane_state(const struct drm_atomic_state *state,
>  				     struct drm_plane *plane)
>  {
> -	if (state->planes[drm_plane_index(plane)].state)
> -		return state->planes[drm_plane_index(plane)].state;
> +	struct drm_plane_state *plane_state;
>  
> +	plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	if (plane_state)
> +		return plane_state;
> +
> +	/*
> +	 * If the plane isn't part of the state, fallback to the currently active one.
> +	 */
>  	return plane->state;
>  }
>  
>  int __must_check
>  drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
