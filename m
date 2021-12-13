Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332247270B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8803110E711;
	Mon, 13 Dec 2021 09:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680B210E62C;
 Mon, 13 Dec 2021 09:59:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="324970232"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="324970232"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:59:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="566495206"
Received: from ppolasze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.20.7])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:59:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/dp: Move DP declarations into
 separate header file
In-Reply-To: <20211213093650.19598-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211213093650.19598-1-tzimmermann@suse.de>
 <20211213093650.19598-3-tzimmermann@suse.de>
Date: Mon, 13 Dec 2021 11:59:18 +0200
Message-ID: <87v8zs7rm1.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Split the DP declarations from other helpers before moving the
> DP functions into a separate module.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h | 27 ---------------------
>  drivers/gpu/drm/drm_dp_aux_dev.c           |  2 +-
>  drivers/gpu/drm/drm_dp_helper.c            |  2 +-
>  drivers/gpu/drm/drm_dp_helper_internal.h   | 28 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c      |  2 +-
>  drivers/gpu/drm/drm_kms_helper_common.c    |  1 +
>  6 files changed, 32 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_dp_helper_internal.h
>
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index 61e09f8a8d0f..28e04e750130 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -28,36 +28,9 @@
>  
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_dp_helper.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_modes.h>
>  
> -/* drm_dp_aux_dev.c */
> -#ifdef CONFIG_DRM_DP_AUX_CHARDEV
> -int drm_dp_aux_dev_init(void);
> -void drm_dp_aux_dev_exit(void);
> -int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
> -void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
> -#else
> -static inline int drm_dp_aux_dev_init(void)
> -{
> -	return 0;
> -}
> -
> -static inline void drm_dp_aux_dev_exit(void)
> -{
> -}
> -
> -static inline int drm_dp_aux_register_devnode(struct drm_dp_aux *aux)
> -{
> -	return 0;
> -}
> -
> -static inline void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
> -{
> -}
> -#endif
> -
>  /* drm_probe_helper.c */
>  enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
>  					 const struct drm_display_mode *mode);
> diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c b/drivers/gpu/drm/drm_dp_aux_dev.c
> index 06b374cae956..0618dfe16660 100644
> --- a/drivers/gpu/drm/drm_dp_aux_dev.c
> +++ b/drivers/gpu/drm/drm_dp_aux_dev.c
> @@ -40,7 +40,7 @@
>  #include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_print.h>
>  
> -#include "drm_crtc_helper_internal.h"
> +#include "drm_dp_helper_internal.h"
>  
>  struct drm_dp_aux_dev {
>  	unsigned index;
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 23f9073bc473..e995a0262ed7 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -35,7 +35,7 @@
>  #include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_panel.h>
>  
> -#include "drm_crtc_helper_internal.h"
> +#include "drm_dp_helper_internal.h"
>  
>  struct dp_aux_backlight {
>  	struct backlight_device *base;
> diff --git a/drivers/gpu/drm/drm_dp_helper_internal.h b/drivers/gpu/drm/drm_dp_helper_internal.h
> new file mode 100644
> index 000000000000..5c9f8bb0c99a
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_dp_helper_internal.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#include <drm/drm_dp_helper.h>

Please don't include other headers if you can avoid them by using
forward declarations.

BR,
Jani.


> +
> +#ifdef CONFIG_DRM_DP_AUX_CHARDEV
> +int drm_dp_aux_dev_init(void);
> +void drm_dp_aux_dev_exit(void);
> +int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
> +void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
> +#else
> +static inline int drm_dp_aux_dev_init(void)
> +{
> +	return 0;
> +}
> +
> +static inline void drm_dp_aux_dev_exit(void)
> +{
> +}
> +
> +static inline int drm_dp_aux_register_devnode(struct drm_dp_aux *aux)
> +{
> +	return 0;
> +}
> +
> +static inline void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
> +{
> +}
> +#endif
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 7f0ff96261cf..9f7b0b606924 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -45,7 +45,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> -#include "drm_crtc_helper_internal.h"
> +#include "drm_dp_helper_internal.h"
>  #include "drm_dp_mst_topology_internal.h"
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 47e92400548d..88260d26409c 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -29,6 +29,7 @@
>  
>  #include <drm/drm_print.h>
>  
> +#include "drm_dp_helper_internal.h"
>  #include "drm_crtc_helper_internal.h"
>  
>  MODULE_AUTHOR("David Airlie, Jesse Barnes");

-- 
Jani Nikula, Intel Open Source Graphics Center
