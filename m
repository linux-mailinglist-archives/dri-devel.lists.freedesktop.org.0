Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01453FAC4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 12:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EDC10E282;
	Tue,  7 Jun 2022 10:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E2810E172
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654596228; x=1686132228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EXkt5c74+SE17BvBCpkSvx9ecBo8CHMeEfUffu9SyAo=;
 b=W5ntSl1AHVwZxjr5ouFRcxnJQah4iYoBTiIwrUsYWfeYDbbrNJdkJ2bs
 rLypAt/ryylrRkGhW/6X63G/XCJKFEjUF4rnTOWQ4OiWTu8XeABPxUwD8
 jFFzc95CT9hRFORNCXscXnImggmL/tW51kqWPYjmoqC8TJFe++SWNMwal
 3GNRq2HWl+c7Trk8Ed0YA5tzclFR6DAx4XWgeRUiv93N6tkmBk2JNww9F
 SX8hGLwCsOxiVSRX/bH2yXwpVJlgY99HzyPtLM8aC4x7lq8GlAOYm9QNi
 J8vcD/sF/3O1kjLyKrLcxOyRn68geLyLFSNSpmp1H6Raz6mg1Ca4++m8N Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="338043125"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="338043125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 03:03:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636059293"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.57.112])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 03:03:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH v2 3/5] drm/ast: Support output polling
In-Reply-To: <20220531111502.4470-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-4-tzimmermann@suse.de>
Date: Tue, 07 Jun 2022 13:03:40 +0300
Message-ID: <87pmjkpz7n.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Enable output polling for all connectors. VGA always uses EDID for this. As
> there's currently no interrupt handling for the ast devices, we have to use
> that trick for the various DP and DVI ports as well.

In general, please don't add new helper functions under "drm/ast"
subject prefix. These will go under the radar. I only stumbled on this
by accident.

Please don't add new helper functions around get_modes and EDID
reading. I've been putting a lot of effort into changing how EDID will
be handled going forward, and this will just make it harder. See
e.g. [1], though there are pending review comments.

Please don't use connector->edid_blob_ptr for basically anything in the
drivers, or for logic regarding detection. It's way too overloaded
already, and difficult to untangle.


BR,
Jani.


[1] https://patchwork.freedesktop.org/series/104309/

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c     | 14 ++++++++----
>  drivers/gpu/drm/drm_probe_helper.c | 35 ++++++++++++++++++++++++++++++
>  include/drm/drm_probe_helper.h     |  3 +++
>  3 files changed, 48 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 4ff8ec1c8931..bbc566c4c768 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1319,6 +1319,7 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
>  
>  static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
>  	.get_modes = ast_vga_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>  
>  static const struct drm_connector_funcs ast_vga_connector_funcs = {
> @@ -1354,7 +1355,7 @@ static int ast_vga_connector_init(struct drm_device *dev,
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
>  
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return 0;
>  }
> @@ -1390,6 +1391,7 @@ static int ast_vga_output_init(struct ast_private *ast)
>  
>  static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
>  	.get_modes = ast_vga_connector_helper_get_modes, // same as VGA connector
> +	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>  
>  static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> @@ -1425,7 +1427,7 @@ static int ast_sil164_connector_init(struct drm_device *dev,
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
>  
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return 0;
>  }
> @@ -1488,6 +1490,7 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>  
>  static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
>  	.get_modes = ast_dp501_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>  
>  static const struct drm_connector_funcs ast_dp501_connector_funcs = {
> @@ -1512,7 +1515,7 @@ static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
>  
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return 0;
>  }
> @@ -1575,6 +1578,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>  
>  static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
>  	.get_modes = ast_astdp_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>  
>  static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> @@ -1599,7 +1603,7 @@ static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
>  
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
>  	return 0;
>  }
> @@ -1709,5 +1713,7 @@ int ast_mode_config_init(struct ast_private *ast)
>  
>  	drm_mode_config_reset(dev);
>  
> +	drm_kms_helper_poll_init(dev);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 425f56280d51..4440a7b6b240 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1031,3 +1031,38 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
>  	return count;
>  }
>  EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
> +
> +/**
> + * drm_connector_helper_detect_ctx_from_edid -
> + *	Updates the connector's status by reading EDID data
> + * @connector: The connector.
> + * @ctx: The lock-acquisition context.
> + * @force: True if the operation was requested by userspace, false otherwise.
> + *
> + * Returns:
> + * The connector's status as enum drm_connector_status.
> + *
> + * Updates the connector's EDID property by reading the display modes
> + * and returns the connector's status. If the EDID property is set, the
> + * connector is assumed to be connected; and disconnected otherwise.
> + * If the get_modes helper is missing, the default status is 'unknown'.
> + *
> + * See struct drm_connector_helper_funcs.detect_ctx.
> + */
> +int drm_connector_helper_detect_ctx_from_edid(struct drm_connector *connector,
> +					      struct drm_modeset_acquire_ctx *ctx,
> +					      bool force)
> +{
> +	const struct drm_connector_helper_funcs *helper_funcs = connector->helper_private;
> +
> +	if (!helper_funcs || !helper_funcs->get_modes)
> +		return connector_status_unknown;
> +
> +	helper_funcs->get_modes(connector);
> +
> +	if (!connector->edid_blob_ptr)
> +		return connector_status_disconnected;
> +
> +	return connector_status_connected;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_detect_ctx_from_edid);
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index c80cab7a53b7..7408cf010794 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -27,5 +27,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
>  bool drm_kms_helper_is_poll_worker(void);
>  
>  int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
> +int drm_connector_helper_detect_ctx_from_edid(struct drm_connector *connector,
> +					      struct drm_modeset_acquire_ctx *ctx,
> +					      bool force);
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
