Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52979D0DE7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 11:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574310E1A4;
	Mon, 18 Nov 2024 10:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8W2Oucq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1478310E1A4;
 Mon, 18 Nov 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731924673; x=1763460673;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LPVEc3SBnqPhNLow8kd01cndoiNDR2c0uBbFgG5wFCA=;
 b=h8W2Oucqd+wkzpck8iFm4v0ubQ4gXxAkeGT7DIpah2FlR7iVQqzF5aSd
 9Gu2u+MNRsvKliFp93m2tNn4ZyBVhDEJAnuddOYs3FzGylMtbruq/MjS4
 +zpa4vjKdOVs1ubWpPeM0E7gdfMdA5Gg+Jw7f2KNaX7bu+VZV6LOSu0Xc
 x3maOGQu36nxYU/DBj0fZko7rPnGcVV0IzxQaLEH/cs4bPdfjb+F9DuxO
 QKHKEI/7F+B9b7KUojpmTSl5PpesRE1fNInhlfYBkaX6r+PFwVycCGBaV
 5Of0Bxg9FKnfHo2al0+e6vdu1l14G1nfItYSMXC7DiZGNp9ipJQqYVYNO Q==;
X-CSE-ConnectionGUID: rrl7pqivQyWyzcmSn9pS1Q==
X-CSE-MsgGUID: Phd5xinbShW57ImJbWAvoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31278896"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31278896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:11:12 -0800
X-CSE-ConnectionGUID: Ye9B2MTzSreXL8hy2uW3Yw==
X-CSE-MsgGUID: 1IaCFaIKSn+u08XITnRaAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="112478172"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Karol
 Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo
 Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, Martyn Welch
 <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang
 <alison.wang@nxp.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Mikko
 Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?=
 Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/connector: make mode_valid_ctx accept const
 struct drm_display_mode
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-4-b1b523156f71@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-4-b1b523156f71@linaro.org>
Date: Mon, 18 Nov 2024 12:10:44 +0200
Message-ID: <87mshw4ztn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 15 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> accept const struct drm_display_mode argument. Change the mode_valid_ctx
> callback of drm_connector to also accept const argument.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
>  include/drm/drm_modeset_helper_vtables.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 7be8fb047b6c17cb37b9021a2dbf430f0aaecfa2..cfefd89209ca864e19771c538ca00016f9322e74 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1432,7 +1432,7 @@ static int intel_dp_mst_get_modes(struct drm_connector *connector)
>  
>  static int
>  intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
> -			    struct drm_display_mode *mode,
> +			    const struct drm_display_mode *mode,
>  			    struct drm_modeset_acquire_ctx *ctx,
>  			    enum drm_mode_status *status)
>  {
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index ec59015aec3cf3ba01510031c55df8c0b3e0b382..fa9ee6a128bec0205f501df6f7634757f5fcb9ee 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1006,7 +1006,7 @@ struct drm_connector_helper_funcs {
>  	 *
>  	 */
>  	int (*mode_valid_ctx)(struct drm_connector *connector,
> -			      struct drm_display_mode *mode,
> +			      const struct drm_display_mode *mode,
>  			      struct drm_modeset_acquire_ctx *ctx,
>  			      enum drm_mode_status *status);

-- 
Jani Nikula, Intel
