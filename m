Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C643B9EE3B0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFBC10ED2A;
	Thu, 12 Dec 2024 10:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsmYzo53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE79C10ED25;
 Thu, 12 Dec 2024 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733997978; x=1765533978;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=69o8RKdTUgpLgoduDcPiTh1/cjVF5y5NxJuVSnTRuLQ=;
 b=XsmYzo53t8zL0ZqaiJTAA8qnTG65AehnqVs9vfJc7JcXsmf16WiWkxws
 9wSqEJPGbTwtvR/YRZvs0IA3JutOv3rp60ILXfKFYUIw3jQlJ6Yuja5he
 vM587SPBiSQuwFJhQzQuY1Eil7p5+4nhkbKifmPUKeVpIJfxNW1BJ/nAH
 utgRU+J9e7W0MHvzcFOoZYGcPaKhTxaTvCC65HMQyzz53mxa32McigC9B
 XUGSEFnGhsnmmaVKsM3NhLiuQNSX5n46LYH+soLvwSuDY/lGUTKE1E1MA
 zkKZu6JlOBrHH5uwqWf/SdSNZorImaVc7RQa16wI/0gb4gsXC9UuvO6Q9 A==;
X-CSE-ConnectionGUID: kMOKheIlQaGVO2FJ1e7K0w==
X-CSE-MsgGUID: ABSYR/06TBGlsZ6TEhqbaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59807175"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="59807175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:06:17 -0800
X-CSE-ConnectionGUID: gpnTPNVtRei5zREG1AX7WA==
X-CSE-MsgGUID: 9L91juTiRpu+a6Vfm57o+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96058660"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:06:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v3 02/11] drm/connector: Add FIXME for GETRESOURCES
 ioctl wrt. uninited connectors
In-Reply-To: <20241211230328.4012496-3-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-3-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:06:12 +0200
Message-ID: <87h679xlkb.fsf@intel.com>
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

On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> The connectors enumerated by the GETRESOURCES ioctl may not be fully
> initialized yet wrt. to the state set up during connector registration
> (for instance the connector's debugfs/sysfs interfaces may not exist
> yet). This can happen in two ways:
>
> 1. Connectors initialized and added to the
>    drm_mode_config::connector_list during driver loading will be visible
>    to the GETRESOURCES ioctl caller once the driver is registered via
>    drm_dev_register()->drm_minor_register(DRM_MINOR_PRIMARY) and before
>    the connectors are registered via drm_dev_register()->
>    drm_modeset_register_all().
>
> 2. Dynamic connectors (MST) - after being initialized - may be added to
>    the connector_list after the driver is loaded and registered and before
>    the connector's userspace interfaces (debugfs, sysfs etc.) are added
>    in drm_connector_dynamic_register().
>
> A solution for 1. would be to register the driver only after the
> connectors are registered, for 2. to add the connector to connector_list
> only after the userspace interfaces are registered.
>
> The fix would require a bigger change, not the topic of this patchset,
> so adding only a FIXME comment here.

References to "this patchset" become meaningless after this has been
committed.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 37d2e0a4ef4be..8642a2fb25a90 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -150,6 +150,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>  	drm_connector_list_iter_begin(dev, &conn_iter);
>  	count = 0;
>  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
> +	/*
> +	 * FIXME: the connectors on the list may not be fully initialized yet,
> +	 * if the ioctl is called before the connectors are registered. (See
> +	 * drm_dev_register()->drm_modeset_register_all() for static and
> +	 * drm_connector_dynamic_register() for dynamic connectors.)
> +	 * The driver should only get registered after static connectors are
> +	 * fully initialized and dynamic connectors should be added to the
> +	 * connector list only after fully initializing them.
> +	 */
>  	drm_for_each_connector_iter(connector, &conn_iter) {
>  		/* only expose writeback connectors if userspace understands them */
>  		if (!file_priv->writeback_connectors &&

-- 
Jani Nikula, Intel
