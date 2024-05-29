Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF04C8D2E44
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 09:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2473610E77A;
	Wed, 29 May 2024 07:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7779310E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:31:56 +0000 (UTC)
Received: from SoMainline.org
 (2a02-a420-77-cc79-164f-8aff-fee4-5930.mobile6.kpn.net
 [IPv6:2a02:a420:77:cc79:164f:8aff:fee4:5930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 013031F8E2;
 Wed, 29 May 2024 09:31:52 +0200 (CEST)
Date: Wed, 29 May 2024 09:31:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Vinod Koul <vkoul@kernel.org>, 
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 3/3] drm/display: split DSC helpers from DP helpers
Message-ID: <nfo5qbqwuq6zlywayt5pt2xh63wvg6eofjusz2wlelzi76busf@tuj5kaubcznl>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
 <20240528-panel-sw43408-fix-v4-3-330b42445bcc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-panel-sw43408-fix-v4-3-330b42445bcc@linaro.org>
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

On 2024-05-28 22:39:20, Dmitry Baryshkov wrote:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
> 
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>  drivers/gpu/drm/display/Kconfig    | 6 ++++++
>  drivers/gpu/drm/display/Makefile   | 3 ++-
>  drivers/gpu/drm/i915/Kconfig       | 1 +
>  drivers/gpu/drm/msm/Kconfig        | 1 +
>  drivers/gpu/drm/panel/Kconfig      | 6 +++---
>  6 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 4232ab27f990..5933ca8c6b96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -6,6 +6,7 @@ config DRM_AMDGPU
>  	depends on !UML
>  	select FW_LOADER
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 864a6488bfdf..f524cf95dec3 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
>  
>  	  If in doubt, say "N".
>  
> +config DRM_DISPLAY_DSC_HELPER
> +	bool
> +	depends on DRM_DISPLAY_HELPER
> +	help
> +	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
> +
>  config DRM_DISPLAY_HDCP_HELPER
>  	bool
>  	depends on DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 17d2cc73ff56..2ec71e15c3cb 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
>  	drm_dp_dual_mode_helper.o \
>  	drm_dp_helper.o \
> -	drm_dp_mst_topology.o \
> +	drm_dp_mst_topology.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
>  	drm_dsc_helper.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
>  	drm_dp_tunnel.o
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 5932024f8f95..117b84260b1c 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -11,6 +11,7 @@ config DRM_I915
>  	select SHMEM
>  	select TMPFS
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1931ecf73e32..6dcd26180611 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -111,6 +111,7 @@ config DRM_MSM_DSI
>  	depends on DRM_MSM
>  	select DRM_PANEL
>  	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_DSC_HELPER
>  	default y
>  	help
>  	  Choose this option if you have a need for MIPI DSI connector
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2ae0eb0638f3..3e3f63479544 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -340,7 +340,7 @@ config DRM_PANEL_LG_SW43408
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for LG sw43408 panel.
> @@ -549,7 +549,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for Raydium RM692E5-based
> @@ -907,7 +907,7 @@ config DRM_PANEL_VISIONOX_R66451
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for Visionox
> 
> -- 
> 2.39.2
> 
