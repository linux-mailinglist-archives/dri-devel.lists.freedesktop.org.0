Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49225A6A2F9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4BA10E39D;
	Thu, 20 Mar 2025 09:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMZGwQii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F3A10E39D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742464259; x=1774000259;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SUbKgdkL2Mb2Hbq5e4gWMXH2nDgt4rA8cTNG5BlBSOs=;
 b=QMZGwQiiTCLLzvOkMd0wJk6NRhJltdLbJ8wT9p27coYZKjqtZ5KypQLv
 vyWiUU2NqVu77OnwlxuMq6y1R4e9fhJ39vmUCJcKb5c9ohgjaXAAw39rU
 qOdwnFktG/W33pJte21z+qwcX9xSEw3QpzBArNI2EO2iOhArM/u7hPx4L
 LPwLzQ1gn2pOXEHts8Y0poUqkMsPljQSuf3FqS5/WLdkt7LohBWO0YopX
 9ulUyNCAh9K07epA1ZAz7WQSqi9C6ZKLSZDMjEcJAQOVsSlmMHwWS8uT+
 llsi8Hci/8WQG5yU0b//T/hPl+KTwAdrXGZX0n27+iUiXgvDe7o/irgAe A==;
X-CSE-ConnectionGUID: obmJ2ElkTaapjA/b+hvRLQ==
X-CSE-MsgGUID: G2a2cMpYTxCKDWkKfFHPCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43798139"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43798139"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 02:50:58 -0700
X-CSE-ConnectionGUID: fNUzFREwRK+zuaEIzMKS5Q==
X-CSE-MsgGUID: pj0nKPdrTuKBbdyhKZrgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="127736351"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 02:50:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
 shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
In-Reply-To: <20250319032435.1119469-6-shiyongbang@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
 <20250319032435.1119469-6-shiyongbang@huawei.com>
Date: Thu, 20 Mar 2025 11:50:50 +0200
Message-ID: <87frj8c9ol.fsf@intel.com>
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

On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> From: Baihan Li <libaihan@huawei.com>
>
> Add registering drm_aux and use it to get connector edid with drm
> functions. Add ddc channel in connector initialization to put drm_aux
> in drm_connector.
>
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> ChangeLog:
> v6 -> v7:
>   - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula

I don't understand this, and I did not suggest such a thing.

BR,
Jani.


> v5 -> v6:
>   - move the detect_ctx() to the patch 7/9.
> v2 -> v3:
>   - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - deleting type conversion, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  3 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 35 ++++++++++++++++---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 +++
>  3 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> index ded9e7ce887a..e0bb9b14d9d8 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> @@ -161,7 +161,8 @@ void hibmc_dp_aux_init(struct hibmc_dp *dp)
>  				 HIBMC_DP_MIN_PULSE_NUM);
>  
>  	dp->aux.transfer = hibmc_dp_aux_xfer;
> -	dp->aux.is_remote = 0;
> +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
> +	dp->aux.drm_dev = dp->drm_dev;
>  	drm_dp_aux_init(&dp->aux);
>  	dp->dp_dev->aux = &dp->aux;
>  }
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 603d6b198a54..0256724d8b9b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -15,11 +15,20 @@
>  
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +	const struct drm_edid *drm_edid;
>  	int count;
>  
> -	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
> -				     connector->dev->mode_config.max_height);
> -	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation
> +	if (!dp->aux.name)
> +		return 0;
> +
> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> +
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	count = drm_edid_connector_add_modes(connector);
> +
> +	drm_edid_free(drm_edid);
>  
>  	return count;
>  }
> @@ -28,12 +37,28 @@ static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>  	.get_modes = hibmc_dp_connector_get_modes,
>  };
>  
> +static int hibmc_dp_late_register(struct drm_connector *connector)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +
> +	return drm_dp_aux_register(&dp->aux);
> +}
> +
> +static void hibmc_dp_early_unregister(struct drm_connector *connector)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +
> +	drm_dp_aux_unregister(&dp->aux);
> +}
> +
>  static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.late_register = hibmc_dp_late_register,
> +	.early_unregister = hibmc_dp_early_unregister,
>  };
>  
>  static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
> @@ -103,8 +128,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>  
>  	drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
>  
> -	ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret = drm_connector_init_with_ddc(dev, connector, &hibmc_dp_conn_funcs,
> +					  DRM_MODE_CONNECTOR_DisplayPort, &dp->aux.ddc);
>  	if (ret) {
>  		drm_err(dev, "init dp connector failed: %d\n", ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index d982f1e4b958..3ddd71aada66 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -47,6 +47,11 @@ static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
>  	return container_of(connector, struct hibmc_vdac, connector);
>  }
>  
> +static inline struct hibmc_dp *to_hibmc_dp(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct hibmc_dp, connector);
> +}
> +
>  static inline struct hibmc_drm_private *to_hibmc_drm_private(struct drm_device *dev)
>  {
>  	return container_of(dev, struct hibmc_drm_private, dev);

-- 
Jani Nikula, Intel
