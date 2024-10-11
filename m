Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5585999FBF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD5A10E063;
	Fri, 11 Oct 2024 09:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZ/UdyGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554710E063
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728637558; x=1760173558;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=N7d99FJDeGoJr7lRCk/3GhTl4CFzlzEwGCKVRZT0ns0=;
 b=TZ/UdyGpzMr/LolroMePmwupp2c03rNjNTWMWmMToPvOT43fxIO9BgUJ
 u1xrbGmsOiJFPpJfKse+8UVL2mtQ11ZVfxsluP2iy6Xac91pOGjdN3UwY
 4+H0xbUeSl3um5zS//3cbRXAEXJanapTdUJSuuypNbcm33fr3suVJN39q
 PX4ogzB0TVh6CsAd8V+WJ5aMGjGCpdLNiVTLqyHsmYwzfdLc+D1ReDV4j
 nQ6hMAN0OfgpvX7dS2GJC0V4RA8LCzLN6YUZDhvJVHjSFfNbG8JTWCBn/
 RZdholblN+Ch+6i1IouWUuLi3038j1ZCFvGYj+Gq2QMA8HkMBALGBh4NP w==;
X-CSE-ConnectionGUID: meFAjr8+ROW/CW4rwwhJ4A==
X-CSE-MsgGUID: gMHBMPUCRZaktGPVdYWP8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="45542080"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="45542080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:05:58 -0700
X-CSE-ConnectionGUID: BkhVHpiCTquA0UhCXkW7aQ==
X-CSE-MsgGUID: 7DfKlYZ9SbyM9EDIPuO/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77674257"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.178])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:05:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/7] drm/ast: Track physical connector status in struct
 drm_connector
In-Reply-To: <20241011065705.6728-7-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241011065705.6728-1-tzimmermann@suse.de>
 <20241011065705.6728-7-tzimmermann@suse.de>
Date: Fri, 11 Oct 2024 12:05:48 +0300
Message-ID: <87y12v57rn.fsf@intel.com>
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
> Set bmc_attached for all connectors and let DRM's probe helpers
> track the physical and logical connector state. Remove such logic
> and related data structures from ast.

Yeah, nice cleanups.

Still, I think this emphasizes my point about improved documentation in
earlier patches. I think people are going to cargo cult this, and if
they don't have anything in the documentation to go by, they'll think
"physical status" is the thing to use when it's about physically
connecting displays.

BR,
Jani.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_dp.c     | 21 ++++++---------------
>  drivers/gpu/drm/ast/ast_dp501.c  | 17 ++++-------------
>  drivers/gpu/drm/ast/ast_drv.h    | 24 ++++--------------------
>  drivers/gpu/drm/ast/ast_sil164.c | 17 ++++-------------
>  drivers/gpu/drm/ast/ast_vga.c    | 28 ++++------------------------
>  5 files changed, 22 insertions(+), 85 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 0e282b7b167c..b62c39479367 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -328,9 +328,9 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>  						   struct drm_atomic_state *state)
>  {
>  	struct ast_device *ast = to_ast_device(encoder->dev);
> -	struct ast_connector *ast_connector = &ast->output.astdp.connector;
> +	struct drm_connector *connector = &ast->output.astdp.connector;
>  
> -	if (ast_connector->physical_status == connector_status_connected) {
> +	if (connector->physical_status == connector_status_connected) {
>  		ast_dp_set_phy_sleep(ast, false);
>  		ast_dp_link_training(ast);
>  
> @@ -360,10 +360,9 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
>  
>  static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	int count;
>  
> -	if (ast_connector->physical_status == connector_status_connected) {
> +	if (connector->physical_status == connector_status_connected) {
>  		struct ast_device *ast = to_ast_device(connector->dev);
>  		const struct drm_edid *drm_edid;
>  
> @@ -391,7 +390,6 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>  						 struct drm_modeset_acquire_ctx *ctx,
>  						 bool force)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	struct ast_device *ast = to_ast_device(connector->dev);
>  	enum drm_connector_status status = connector_status_disconnected;
>  	bool phy_sleep;
> @@ -410,11 +408,7 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>  
>  	mutex_unlock(&ast->modeset_lock);
>  
> -	if (status != ast_connector->physical_status)
> -		++connector->epoch_counter;
> -	ast_connector->physical_status = status;
> -
> -	return connector_status_connected;
> +	return status;
>  }
>  
>  static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
> @@ -439,7 +433,6 @@ int ast_astdp_output_init(struct ast_device *ast)
>  	struct drm_device *dev = &ast->base;
>  	struct drm_crtc *crtc = &ast->crtc;
>  	struct drm_encoder *encoder;
> -	struct ast_connector *ast_connector;
>  	struct drm_connector *connector;
>  	int ret;
>  
> @@ -456,8 +449,7 @@ int ast_astdp_output_init(struct ast_device *ast)
>  
>  	/* connector */
>  
> -	ast_connector = &ast->output.astdp.connector;
> -	connector = &ast_connector->base;
> +	connector = &ast->output.astdp.connector;
>  	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
>  				 DRM_MODE_CONNECTOR_DisplayPort);
>  	if (ret)
> @@ -466,10 +458,9 @@ int ast_astdp_output_init(struct ast_device *ast)
>  
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
> +	connector->bmc_attached = true;
>  	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
> -	ast_connector->physical_status = connector->status;
> -
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 9e19d8c17730..8ffe30c74d3d 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -503,10 +503,9 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
>  
>  static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	int count;
>  
> -	if (ast_connector->physical_status == connector_status_connected) {
> +	if (connector->physical_status == connector_status_connected) {
>  		struct ast_device *ast = to_ast_device(connector->dev);
>  		const struct drm_edid *drm_edid;
>  
> @@ -534,18 +533,13 @@ static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector
>  						 struct drm_modeset_acquire_ctx *ctx,
>  						 bool force)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	struct ast_device *ast = to_ast_device(connector->dev);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
>  	if (ast_dp501_is_connected(ast))
>  		status = connector_status_connected;
>  
> -	if (status != ast_connector->physical_status)
> -		++connector->epoch_counter;
> -	ast_connector->physical_status = status;
> -
> -	return connector_status_connected;
> +	return status;
>  }
>  
>  static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
> @@ -570,7 +564,6 @@ int ast_dp501_output_init(struct ast_device *ast)
>  	struct drm_device *dev = &ast->base;
>  	struct drm_crtc *crtc = &ast->crtc;
>  	struct drm_encoder *encoder;
> -	struct ast_connector *ast_connector;
>  	struct drm_connector *connector;
>  	int ret;
>  
> @@ -587,8 +580,7 @@ int ast_dp501_output_init(struct ast_device *ast)
>  
>  	/* connector */
>  
> -	ast_connector = &ast->output.dp501.connector;
> -	connector = &ast_connector->base;
> +	connector = &ast->output.dp501.connector;
>  	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
>  				 DRM_MODE_CONNECTOR_DisplayPort);
>  	if (ret)
> @@ -597,10 +589,9 @@ int ast_dp501_output_init(struct ast_device *ast)
>  
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
> +	connector->bmc_attached = true;
>  	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
> -	ast_connector->physical_status = connector->status;
> -
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 21ce3769bf0d..a6887e90dc17 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -141,22 +141,6 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
>  	return container_of(plane, struct ast_plane, base);
>  }
>  
> -/*
> - * Connector
> - */
> -
> -struct ast_connector {
> -	struct drm_connector base;
> -
> -	enum drm_connector_status physical_status;
> -};
> -
> -static inline struct ast_connector *
> -to_ast_connector(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct ast_connector, base);
> -}
> -
>  /*
>   * Device
>   */
> @@ -190,19 +174,19 @@ struct ast_device {
>  	union {
>  		struct {
>  			struct drm_encoder encoder;
> -			struct ast_connector connector;
> +			struct drm_connector connector;
>  		} vga;
>  		struct {
>  			struct drm_encoder encoder;
> -			struct ast_connector connector;
> +			struct drm_connector connector;
>  		} sil164;
>  		struct {
>  			struct drm_encoder encoder;
> -			struct ast_connector connector;
> +			struct drm_connector connector;
>  		} dp501;
>  		struct {
>  			struct drm_encoder encoder;
> -			struct ast_connector connector;
> +			struct drm_connector connector;
>  		} astdp;
>  	} output;
>  
> diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
> index be01254dd48a..aba5b8aa4307 100644
> --- a/drivers/gpu/drm/ast/ast_sil164.c
> +++ b/drivers/gpu/drm/ast/ast_sil164.c
> @@ -23,10 +23,9 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
>  
>  static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	int count;
>  
> -	if (ast_connector->physical_status == connector_status_connected) {
> +	if (connector->physical_status == connector_status_connected) {
>  		count = drm_connector_helper_get_modes(connector);
>  	} else {
>  		drm_edid_connector_update(connector, NULL);
> @@ -48,16 +47,11 @@ static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connecto
>  						  struct drm_modeset_acquire_ctx *ctx,
>  						  bool force)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	enum drm_connector_status status;
>  
>  	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
>  
> -	if (status != ast_connector->physical_status)
> -		++connector->epoch_counter;
> -	ast_connector->physical_status = status;
> -
> -	return connector_status_connected;
> +	return status;
>  }
>  
>  static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
> @@ -83,7 +77,6 @@ int ast_sil164_output_init(struct ast_device *ast)
>  	struct drm_crtc *crtc = &ast->crtc;
>  	struct i2c_adapter *ddc;
>  	struct drm_encoder *encoder;
> -	struct ast_connector *ast_connector;
>  	struct drm_connector *connector;
>  	int ret;
>  
> @@ -104,8 +97,7 @@ int ast_sil164_output_init(struct ast_device *ast)
>  
>  	/* connector */
>  
> -	ast_connector = &ast->output.sil164.connector;
> -	connector = &ast_connector->base;
> +	connector = &ast->output.sil164.connector;
>  	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
>  					  DRM_MODE_CONNECTOR_DVII, ddc);
>  	if (ret)
> @@ -114,10 +106,9 @@ int ast_sil164_output_init(struct ast_device *ast)
>  
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
> +	connector->bmc_attached = true;
>  	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
> -	ast_connector->physical_status = connector->status;
> -
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
> index abe0fff8485c..d78f00c47cc5 100644
> --- a/drivers/gpu/drm/ast/ast_vga.c
> +++ b/drivers/gpu/drm/ast/ast_vga.c
> @@ -23,10 +23,9 @@ static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
>  
>  static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	int count;
>  
> -	if (ast_connector->physical_status == connector_status_connected) {
> +	if (connector->physical_status == connector_status_connected) {
>  		count = drm_connector_helper_get_modes(connector);
>  	} else {
>  		drm_edid_connector_update(connector, NULL);
> @@ -44,25 +43,9 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
>  	return count;
>  }
>  
> -static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
> -					       struct drm_modeset_acquire_ctx *ctx,
> -					       bool force)
> -{
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
> -	enum drm_connector_status status;
> -
> -	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> -
> -	if (status != ast_connector->physical_status)
> -		++connector->epoch_counter;
> -	ast_connector->physical_status = status;
> -
> -	return connector_status_connected;
> -}
> -
>  static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
>  	.get_modes = ast_vga_connector_helper_get_modes,
> -	.detect_ctx = ast_vga_connector_helper_detect_ctx,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc,
>  };
>  
>  static const struct drm_connector_funcs ast_vga_connector_funcs = {
> @@ -83,7 +66,6 @@ int ast_vga_output_init(struct ast_device *ast)
>  	struct drm_crtc *crtc = &ast->crtc;
>  	struct i2c_adapter *ddc;
>  	struct drm_encoder *encoder;
> -	struct ast_connector *ast_connector;
>  	struct drm_connector *connector;
>  	int ret;
>  
> @@ -104,8 +86,7 @@ int ast_vga_output_init(struct ast_device *ast)
>  
>  	/* connector */
>  
> -	ast_connector = &ast->output.vga.connector;
> -	connector = &ast_connector->base;
> +	connector = &ast->output.vga.connector;
>  	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
>  					  DRM_MODE_CONNECTOR_VGA, ddc);
>  	if (ret)
> @@ -114,10 +95,9 @@ int ast_vga_output_init(struct ast_device *ast)
>  
>  	connector->interlace_allowed = 0;
>  	connector->doublescan_allowed = 0;
> +	connector->bmc_attached = true;
>  	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>  
> -	ast_connector->physical_status = connector->status;
> -
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret)
>  		return ret;

-- 
Jani Nikula, Intel
