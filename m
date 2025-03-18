Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E1A6706A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86410E45B;
	Tue, 18 Mar 2025 09:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSnDi4K1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ABF10E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742291750; x=1773827750;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6Ci7Z6r/V5Qzb/u0ILeh9lEk9VCs8fS5/6fHRjx7i2U=;
 b=RSnDi4K139F3mFvf9a2WORD7H/KQrFd68ilqkabGHcX0tIFK8NdbFRA9
 DzRClF3vUe8WOTYzVoXUzmUZXDAF988evvsnGjxv+xU63HDizrWGyloMd
 fSL7nzQ52968DvfpuFB0ABe9E+Mm4yh68zwopFMoLT+3K+sG85vqL/bfm
 b/re+Y/uiP7qUQpN6tV+95QXbOQVgiYNPkUECkbedOFTV1p3ed2v7Dq8e
 7D23S2U2nf0l1DOcBaSgENh4cPI7zng5Js5J7hQxL79KPqGz4nqNkapgt
 08eAFsPgXNXQedNNNdeu+FsJRSeakYzqA2T0gdj8z0h5N3uR9W3H5+9tG g==;
X-CSE-ConnectionGUID: PR1RLGI1RhqiIC7IIlePkg==
X-CSE-MsgGUID: qQQBJ+/ST3eTOTdv7mw4rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43612641"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43612641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 02:55:50 -0700
X-CSE-ConnectionGUID: +kz5MCcjShOb8mQXn/wNPg==
X-CSE-MsgGUID: bhhdt0rdS0iIjYaLOa/7Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="145392992"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.165])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 02:55:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
 shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
In-Reply-To: <20250310040138.2025715-6-shiyongbang@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250310040138.2025715-1-shiyongbang@huawei.com>
 <20250310040138.2025715-6-shiyongbang@huawei.com>
Date: Tue, 18 Mar 2025 11:55:40 +0200
Message-ID: <87o6xyd5nn.fsf@intel.com>
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

On Mon, 10 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> @@ -15,11 +15,17 @@
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
> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);

drm_edid_read() should cover this if connector->ddc is set properly...

> @@ -103,8 +125,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>  
>  	drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
>  
> -	ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret = drm_connector_init_with_ddc(dev, connector, &hibmc_dp_conn_funcs,
> +					  DRM_MODE_CONNECTOR_DisplayPort, &dp->aux.ddc);

...which you seem to do here.

BR,
Jani.


-- 
Jani Nikula, Intel
