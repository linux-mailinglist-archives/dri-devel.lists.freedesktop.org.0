Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3DC999F4D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518AD10EA8F;
	Fri, 11 Oct 2024 08:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Owan/oR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C93710EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728636721; x=1760172721;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y9r77c6SwPD6fsaVxpQ431aPcETEgSG8W7UTqNcPr0A=;
 b=Owan/oR9gss+A0Qk8xQEQiSZlUeWUyZjaNT8aei8t1jiq1rbczRyc6xw
 Wo+IMU7d07ZQVAJa5oMIcjDBZJTOyr03XYeU2pXsgmEVN4pCOHZsYyupj
 2qQmuEFjpyFQDwvfUyFpl/Ziye1w3sazl/h1P9V7dxnFqqcDZ7UCybk/g
 QS6QB02jNAsSKhO7PWt1/BJLR0SExJrV5gB4GhvzTQzu2sELwa4ox4OMB
 sKrqnIiy2i0uj/7DONYAlNxjSO6BJH0ofDgVTYG4E0FunNlM7gkeoz9mN
 USaGwrG2cpAeVC6tVtJlauFccwUC9mgFAvO4SKqKNVoMkRw0vwPC//8rw w==;
X-CSE-ConnectionGUID: 4AnL2TkXTXyiN/xKhujm6w==
X-CSE-MsgGUID: VdJXYPysQsOS8gyKvVynsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28187181"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28187181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:52:01 -0700
X-CSE-ConnectionGUID: 1G/wPo46QmSVnYKuWxiBrw==
X-CSE-MsgGUID: zpdLJL2ETO+g1ejeFfXCBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76765479"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.178])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:51:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] drm: Add physical status to connector
In-Reply-To: <20241011065705.6728-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241011065705.6728-1-tzimmermann@suse.de>
 <20241011065705.6728-3-tzimmermann@suse.de>
Date: Fri, 11 Oct 2024 11:51:51 +0300
Message-ID: <874j5j6mzc.fsf@intel.com>
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

On Fri, 11 Oct 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Track the connector's physical status in addition to its logical
> status. The latter is directly derived from the former and for most
> connectors both values are in sync.
>
> Server chips with BMC, such as Aspeed, Matrox and HiSilicon, often
> provide virtual outputs for remote management. Without a connected
> display, fbcon or userspace compositors disabek the output and stop
> displaying to the BMC.

Please don't assume people know what "BMC" means.

> Connectors have therefore to remain in connected status, even if the
> display has been physically disconnected. Tracking both physical and
> logical state in separate fields will enable that. The physical status
> is transparent to drivers and clients, but changes update the epoch
> counter. This generates a hotplug events for clients. Clients will then
> pick up changes to resolutions supported, if any.
>
> The ast driver already contains code to track the physical status. This
> commit generalizes the logic for use with other drivers. Candidates are
> mgag200 and hibmc.
>
> This commit adds the physical status and makes the regular, logical
> status a copy of it. A later change will add the flag for BMC support.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_connector.c    |  1 +
>  drivers/gpu/drm/drm_probe_helper.c | 13 ++++++++-----
>  include/drm/drm_connector.h        |  7 +++++++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849..901d73416f98 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -282,6 +282,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	connector->edid_blob_ptr = NULL;
>  	connector->epoch_counter = 0;
>  	connector->tile_blob_ptr = NULL;
> +	connector->physical_status = connector_status_unknown;
>  	connector->status = connector_status_unknown;
>  	connector->display_info.panel_orientation =
>  		DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 62a2e5bcb315..df44be128e72 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -373,7 +373,7 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>  	if (WARN_ON(ret < 0))
>  		ret = connector_status_unknown;
>  
> -	if (ret != connector->status)
> +	if (ret != connector->physical_status)
>  		connector->epoch_counter += 1;
>  
>  	drm_modeset_drop_locks(&ctx);
> @@ -409,7 +409,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
>  
>  	ret = detect_connector_status(connector, ctx, force);
>  
> -	if (ret != connector->status)
> +	if (ret != connector->physical_status)
>  		connector->epoch_counter += 1;
>  
>  	return ret;
> @@ -588,9 +588,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  	if (connector->force) {
>  		if (connector->force == DRM_FORCE_ON ||
>  		    connector->force == DRM_FORCE_ON_DIGITAL)
> -			connector->status = connector_status_connected;
> +			connector->physical_status = connector_status_connected;
>  		else
> -			connector->status = connector_status_disconnected;
> +			connector->physical_status = connector_status_disconnected;
> +		connector->status = connector->physical_status;
> +
>  		if (connector->funcs->force)
>  			connector->funcs->force(connector);
>  	} else {
> @@ -602,7 +604,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  		} else if (WARN(ret < 0, "Invalid return value %i for connector detection\n", ret))
>  			ret = connector_status_unknown;
>  
> -		connector->status = ret;
> +		connector->physical_status = ret;
> +		connector->status = connector->physical_status;
>  	}
>  
>  	/*
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e3fa43291f44..37e951f04ae8 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1817,6 +1817,13 @@ struct drm_connector {
>  	 */
>  	struct list_head modes;
>  
> +	/**
> +	 * @physical_status:
> +	 * One of the drm_connector_status enums (connected, not, or unknown).
> +	 * Protected by &drm_mode_config.mutex.
> +	 */

I don't think that's anywhere near enough documentation. It's just
copy-paste from status. The values aren't important, the difference
between status and physical_status is.

And I think we need to have both status and physical_status
documentation explain what they mean, when they change, who can change
them, etc. And crucially, tell folks not to mess with physical_status
except in the narrow use case.

Side note, this probably indicates a few places where drivers are
messing with connector status in a way they shouldn't:

	git grep "connector->status = " -- drivers/gpu/drm

BR,
Jani.


> +	enum drm_connector_status physical_status;
> +
>  	/**
>  	 * @status:
>  	 * One of the drm_connector_status enums (connected, not, or unknown).

-- 
Jani Nikula, Intel
